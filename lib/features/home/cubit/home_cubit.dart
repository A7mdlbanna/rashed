import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:rashed/core/resources/app_colors.dart';
import 'package:rashed/core/widgets/app_text_display.dart';

import '../ui/home_screen.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  int selectedNav = 0;
  selectNav(int index) {
    selectedNav = index;
    pageController.animateToPage(index, duration: const Duration(milliseconds: 300), curve: Curves.linear);
    emit(NavSelected());
  }

  String get title => titles[selectedNav];
  List<String> titles = [
    'RASHED',
    'Profile',
    'Settings',
  ];

  List<Widget> screens = [
    const HomeScreen(),
    Center(child: AppText(translation: 'Profile', color: AppColors.textLight,)),
    Center(child: AppText(translation: 'Settings', color: AppColors.textLight)),
  ];

  PageController pageController = PageController();


}