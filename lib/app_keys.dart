import 'package:flutter/cupertino.dart';

class AppKeys {
  /// Login Form Keys
  static GlobalKey<FormState> loginFormKey =
      GlobalKey<FormState>(debugLabel: 'login form');
  static Key emailInputFieldKey = const Key('email');
  static Key passwordInputFieldKey = const Key('password');
  static Key submitLoginFormButtonKey = const Key('submit login');
}
