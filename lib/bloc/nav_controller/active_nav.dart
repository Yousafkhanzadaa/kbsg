import 'package:flutter_bloc/flutter_bloc.dart';

class ActiveNav extends Cubit<int> {
  ActiveNav() : super(0);

  void currentScreen(int activeNum) => emit(activeNum);
}
