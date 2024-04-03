
import 'package:bloc/bloc.dart';

class UsernameCubit extends Cubit<String> {
  UsernameCubit() : super('no-username-yet') {
    print('UsernameCubit created');
  }

  void updateUsername(String username) => emit(username);
}