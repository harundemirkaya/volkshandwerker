// Write user notifier using Riverpod for login response

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:volkshandwerker/Models/LoginResponse.dart';
import 'package:volkshandwerker/Models/Subscriber.dart';
import 'package:volkshandwerker/Models/SubscriberResponse.dart';

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

  bool isLoggedIn() {
    return state?.jwt != null;
  }

  bool isSubscriber() {
    return state?.user?.subscriber != null;
  }

  Subscriber? get subscriber {
    return Subscriber.fromJson(state?.user?.subscriber);
  }

  void updateSubscriber(SubscriberResponse subscriber) {
    state?.user?.subscriber = subscriber.toJson();
  }
}
