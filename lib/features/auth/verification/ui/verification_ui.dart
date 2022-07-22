import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:deligo/features/auth/verification/ui/verification_interactor.dart';
import 'package:deligo/generated/l10n.dart';
import 'package:flutter/material.dart';

class VerificationUI extends StatelessWidget {
  const VerificationUI(this.interactor, {Key? key}) : super(key: key);

  final VerificationInteractor interactor;

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: FadedSlideAnimation(
          beginOffset: const Offset(0.0, 0.3),
          endOffset: Offset.zero,
          slideCurve: Curves.linearToEaseOut,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              Image.asset('Assets.logo', scale: 3.2),
              Text(
                'locale.verification',
                style: theme.textTheme.headline5,
              ),
              const SizedBox(height: 8),
              Text(
                'locale.verificationSubtitle',
                style: theme.textTheme.caption!.copyWith(fontSize: 14),
              ),
              const Spacer(),
              // EntryField(
              //   Icon(Icons.lock, color: theme.primaryColor),
              //   locale.enterOtp,
              // ),
              // const Spacer(),
              // CustomButton(
              //   locale.submit,
              //   () => interactor.verifyOtp(""),
              // ),
              // const Spacer(flex: 4),
            ],
          ),
        ),
      ),
    );
  }
}
