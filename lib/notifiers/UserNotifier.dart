// Write user notifier using Riverpod for login response

import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:volkshandwerker/Models/LoginResponse.dart';
import 'package:volkshandwerker/Models/SubscriberResponse.dart';

import '../Models/User.dart';

final userNotifierProvider =
    StateNotifierProvider<UserNotifier, LoginResponse?>((ref) {
  return UserNotifier();
});

class UserNotifier extends StateNotifier<LoginResponse?> {
  UserNotifier() : super(null);

  void setUser(LoginResponse user) {
    state = user;
  }

  LoginResponse getUser() {
    return state!;
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
    return state?.user?.subscriber;
    //return Subscriber.fromJson(state?.user?.subscriber);
  }

  void updateSubscriber(Subscriber subscriber) {
    state?.user?.subscriber = subscriber;
  }
}
