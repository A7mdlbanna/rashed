import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:rashed/features/chat/data/repository/chat_repository.dart';

import '../../../core/utils/navigator.dart';
import '../data/models/message.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());

  init() async {
    if(ChatRepository.sessionId == null) await startSession();
    await getMessages();
  }

  startSession() async {
    emit(SessionLoading());
    final success = await ChatRepository.startSession();
    emit(SessionDone());
    if(!success) pop();
  }

  startNewSession() async {
    emit(SessionLoading());
    final success = await ChatRepository.startSession();
    emit(SessionDone());
    if(success) getMessages();
  }

  List<Message> messages = [];
  getMessages({bool loading = true}) async {
    if(loading) emit(MessagesLoading());
    messages = await ChatRepository.getMessages();
    emit(MessagesDone());
  }

  TextEditingController chatController = TextEditingController();
  onChanged(v) => emit(TextChanged());

  Timer? timer;
  sendMessage() async {
    // cancel timer if there is an old response that didn't come
    timer?.cancel();
    final message = Message(id: '0000', isFromBot: false, content: chatController.text.toString(), type: 'TEXT', createdAt: DateTime.now());
    messages.insert(0, message);
    chatController.clear();
    emit(MessageCreated());

    final res = await ChatRepository.sendMessage(message);
    if(res.$1) {
      // display ai message
      messages.insert(0, res.$2!);
    } else {
      // fetch message if connection timeout
      if(res.$3 != null && res.$3 == DioExceptionType.connectionTimeout){
        timer = Timer.periodic(const Duration(seconds: 3), (t) {
          getMessages(loading: false);
        });
      }

      // delete your message if an error occurred
      messages.remove(message);
    }
    emit(MessageSent());
  }

  @override
  Future<void> close() {
    timer?.cancel();
    return super.close();
  }

}
