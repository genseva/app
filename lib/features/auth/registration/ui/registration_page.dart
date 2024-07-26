import 'package:deligo/features/auth/login_navigator.dart';
import 'package:deligo/features/auth/registration/ui/registration_interactor.dart';
import 'package:flutter/material.dart';

import 'registration_ui.dart';

class RegistrationPage extends StatefulWidget {
  final String? phoneNumber;

  const RegistrationPage(this.phoneNumber, {super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> implements RegistrationInteractor {
  @override
  Widget build(BuildContext context) {
    return RegistrationUI(this, widget.phoneNumber);
  }

  @override
  void register(String phoneNumber, String name, String email) {
    Navigator.pushNamed(context, LoginRoutes.verification);
  }
}
