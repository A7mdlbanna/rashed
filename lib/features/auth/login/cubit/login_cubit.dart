import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  GlobalKey<FormState> emailKey = GlobalKey<FormState>();
  GlobalKey<FormState> passwordKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  login() async {
    if(!emailKey.currentState!.validate() || !passwordKey.currentState!.validate()) return;
    emit(LoginLoading());
    await Future.delayed(const Duration(seconds: 1));
    emit(LoginDone());
  }
}
