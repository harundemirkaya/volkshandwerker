// Write user notifier using Riverpod for login response

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:volkshandwerker/Models/LoginResponse.dart';

final userNotifierProvider =
    StateNotifierProvider<UserNotifier, LoginResponse?>((ref) {
  return UserNotifier();
});

class UserNotifier extends StateNotifier<LoginResponse?> {
  UserNotifier() : super(null);

  void setUser(LoginResponse user) {
    state = user;
  }

  void logout() {
    state = null;
  }
}
