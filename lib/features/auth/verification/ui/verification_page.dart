import 'package:deligo/features/auth/verification/ui/verification_ui.dart';
import 'package:flutter/material.dart';

import 'verification_interactor.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage(this.onVerificationDone, {super.key});

  final VoidCallback onVerificationDone;

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> implements VerificationInteractor {
  @override
  Widget build(BuildContext context) {
    return VerificationUI(this);
  }

  @override
  void verifyOtp(String otp) {
    widget.onVerificationDone();
  }
}
