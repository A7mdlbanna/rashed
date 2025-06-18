import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rashed/core/helper/index.dart';
import 'package:rashed/core/widgets/appbar.dart';
import 'package:rashed/features/chat/ui/widgets/ai_message.dart';
import 'package:rashed/features/chat/ui/widgets/chat_field.dart';
import 'package:rashed/features/chat/ui/widgets/my_message.dart';
import 'package:rashed/features/chat/ui/widgets/options.dart';

import '../cubit/chat_cubit.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: 'AI Chat', actions: [Options()]),
      body: BlocProvider(
        create: (context) => ChatCubit(),
        child: BlocBuilder<ChatCubit, ChatState>(
          builder: (context, state) {
            final cubit = context.read<ChatCubit>();
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 43.w),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      reverse: true,
                      itemBuilder: (c, int index) {
                        final message = cubit.messages[index];
                        return message.isFromBot ? AiMessage(message: message) : MyMessage(message: message);
                      },
                      separatorBuilder: (c, i) => 40.heightBox,
                      itemCount: cubit.messages.length,
                    ),
                  ),
                  50.heightBox,
                  const ChatField(),
                  50.heightBox,
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
