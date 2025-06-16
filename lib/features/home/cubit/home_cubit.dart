import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  int selectedNav = 0;
  selectNav(int index) {
    selectedNav = index;
    emit(NavSelected());
  }
}