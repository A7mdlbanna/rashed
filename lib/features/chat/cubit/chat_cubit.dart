import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../data/models/message.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());

  List<Message> messages = [
    Message(id: '1', content: 'Hello, is Al Ahly playing next week?', createdAt: DateTime.now(), isFromBot: false),
    Message(id: '2', content: 'This is your Ai Assistant, Yes The Egyptian team Al-Ahly is playing next Thursday', createdAt: DateTime.now(), isFromBot: true),
    Message(id: '1', content: 'Hello, is Al Ahly playing next week?', createdAt: DateTime.now(), isFromBot: false),
    Message(id: '2', content: 'This is your Ai Assistant, Yes The Egyptian team Al-Ahly is playing next ThursdayThis is your Ai Assistant, Yes The Egyptian team Al-Ahly is playing next ThursdayThis is your Ai Assistant, Yes The Egyptian team Al-Ahly is playing next ThursdayThis is your Ai Assistant, Yes The Egyptian team Al-Ahly is playing next Thursday', createdAt: DateTime.now(), isFromBot: true),
    Message(id: '1', content: 'Hello, is Al Ahly playing next week?', createdAt: DateTime.now(), isFromBot: false),
    Message(id: '2', content: 'This is your Ai Assistant, Yes The Egyptian team Al-Ahly is playing next Thursday', createdAt: DateTime.now(), isFromBot: true),
    Message(id: '1', content: 'Hello, is Al Ahly playing next week?', createdAt: DateTime.now(), isFromBot: false),
    Message(id: '2', content: 'This is your Ai Assistant, Yes The Egyptian team Al-Ahly is playing next Thursday', createdAt: DateTime.now(), isFromBot: true),
    Message(id: '1', content: 'Hello, is Al Ahly playing next week?', createdAt: DateTime.now(), isFromBot: false),
    Message(id: '2', content: 'This is your Ai Assistant, Yes The Egyptian team Al-Ahly is playing next Thursday', createdAt: DateTime.now(), isFromBot: true),
    Message(id: '1', content: 'Hello, is Al Ahly playing next week?', createdAt: DateTime.now(), isFromBot: false),
    Message(id: '2', content: 'This is your Ai Assistant, Yes The Egyptian team Al-Ahly is playing next Thursday', createdAt: DateTime.now(), isFromBot: true),
  ].reversed.toList();

  TextEditingController chatController = TextEditingController();
  onChanged(v) => emit(TextChanged());

}
