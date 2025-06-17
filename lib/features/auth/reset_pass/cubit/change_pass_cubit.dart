import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:rashed/features/auth/data/repositories/auth_repository.dart';

import '../../../../core/utils/navigator.dart';
import '../../data/dto/update.dart';
import '../../data/repositories/user_repository.dart';

part 'change_pass_state.dart';

class ChangePassCubit extends Cubit<ChangePassState> {
  ChangePassCubit() : super(ChangePassInitial());

  GlobalKey<FormState> passwordKey = GlobalKey<FormState>();
  GlobalKey<FormState> confPasswordKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confPasswordController = TextEditingController();

  changePass() async {
    if(validate) return;
    emit(ChangePassLoading());
    final success = await UserRepository.changePass(ChangePassDTO(
      token: 'Bearer ${AuthRepository.accessToken}',
      newPassword: passwordController.text,
    ));
    if(success) pop();
    emit(ChangePassDone());
  }

  bool get validate {
    return !passwordKey.currentState!.validate() ||
           !confPasswordKey.currentState!.validate();
  }

  bool get checkMatch => passwordController.text == confPasswordController.text;
}
