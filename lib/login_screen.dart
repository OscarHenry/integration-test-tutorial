import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:integration_test_tutorial/app_keys.dart';
import 'package:integration_test_tutorial/snack_bar_helper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = AppKeys.loginFormKey;
  late String _email, _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(48.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Spacer(flex: 2),
              TextFormField(
                key: AppKeys.emailInputFieldKey,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (input) =>
                    !input!.contains('@') ? 'Invalid email' : null,
                onSaved: (input) => _email = input!,
              ),
              TextFormField(
                key: AppKeys.passwordInputFieldKey,
                decoration: const InputDecoration(labelText: 'Password'),
                validator: (input) => input!.length < 6
                    ? 'Password must be at least 6 characters'
                    : null,
                onSaved: (input) => _password = input!,
                obscureText: true,
              ),
              const Spacer(),
              ElevatedButton(
                key: AppKeys.submitLoginFormButtonKey,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    log('Logged in with email: $_email and password: $_password');
                    // Login logic here
                    SnackBarHelper.show(
                      context: context,
                      message: '$_email welcome to the app',
                    );
                  }
                },
                child: const Text('Login'),
              ),
              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}
