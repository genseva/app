import 'dart:async';

import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:deligo/app_config/colors.dart';
import 'package:deligo/components/custom_button.dart';
import 'package:deligo/components/custom_text_field.dart';
import 'package:deligo/features/auth/verification/ui/verification_interactor.dart';
import 'package:deligo/generated/l10n.dart';
import 'package:flutter/material.dart';

class VerificationUI extends StatefulWidget {
  const VerificationUI(this.interactor, {Key? key}) : super(key: key);

  final VerificationInteractor interactor;

  @override
  State<VerificationUI> createState() => _VerificationUIState();
}

class _VerificationUIState extends State<VerificationUI> {
  Timer? _timer;
  int _start = 30;

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
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
              Text(
                locale.verification,
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                locale.enterVerificationCodeSent,
                style: Theme.of(context)
                    .textTheme
                    .caption!
                    .copyWith(color: greyTextColor),
              ),
              const SizedBox(
                height: 28,
              ),
              Text(
                locale.enterOtp,
                style: Theme.of(context)
                    .textTheme
                    .caption!
                    .copyWith(color: greyTextColor),
              ),
              Row(
                children: const [
                  Expanded(
                    child: CustomTextField(
                      hintText: '',
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: CustomTextField(
                      hintText: '',
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: CustomTextField(
                      hintText: '',
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: CustomTextField(
                      hintText: '',
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 35,
              ),
              CustomButton(
                text: locale.submit,
                onTap: () {
                  widget.interactor.verifyOtp('otp');
                },
              ),
              const SizedBox(
                height: 32,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '0:$_start ${locale.minLeft}',
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(color: greyTextColor),
                  ),
                  GestureDetector(
                    onTap: () {
                      _timer?.cancel();
                      setState(() {
                        _start = 30;
                        startTimer();
                      });
                    },
                    child: Text(
                      locale.resend,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 12, fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
