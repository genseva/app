import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:deligo/app_config/app_config.dart';
import 'package:deligo/app_config/colors.dart';
import 'package:deligo/components/custom_button.dart';
import 'package:deligo/features/auth/login_navigator.dart';
import 'package:deligo/features/language/bloc/language_cubit.dart';
import 'package:deligo/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LanguagePage extends StatefulWidget {
  final bool fromRoot;

  const LanguagePage({super.key, this.fromRoot = false});

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  late final LanguageCubit _languageCubit;

  String? _selectedLocale;

  @override
  void initState() {
    super.initState();
    _languageCubit = context.read<LanguageCubit>()..getCurrentLanguage();
  }

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          locale.changeLanguage,
        ),
      ),
      body: FadedSlideAnimation(
        beginOffset: const Offset(0, 0.3),
        endOffset: const Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 20.0),
              child: Text(
                locale.selectLanguage,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Expanded(
              child: BlocConsumer<LanguageCubit, Locale>(
                listener: (context, currentLocale) {
                  setState(() {
                    _selectedLocale = currentLocale.languageCode;
                  });
                },
                builder: (context, currentLocale) {
                  return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: AppConfig.languagesSupported.length,
                    itemBuilder: (context, index) {
                      var langCode = AppConfig.languagesSupported.keys.elementAt(index);
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedLocale = langCode;
                          });
                        },
                        child: Container(
                          alignment: Alignment.centerLeft,
                          height: 48,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: _selectedLocale == langCode
                                  ? Theme.of(context).primaryColor.withOpacity(0.4)
                                  : greyTextColor.withOpacity(0.2),
                            ),
                            borderRadius: BorderRadius.circular(10),
                            color: _selectedLocale == langCode
                                ? Theme.of(context).primaryColor.withOpacity(0.2)
                                : Theme.of(context).scaffoldBackgroundColor,
                          ),
                          child: Text(
                            AppConfig.languagesSupported[langCode]!,
                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  color: _selectedLocale == langCode
                                      ? Theme.of(context).primaryColor
                                      : blackColor,
                                ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 28.0, left: 16, right: 16, top: 8),
        child: CustomButton(
            text: 'Update Language',
            onTap: () {
              _languageCubit.setCurrentLanguage(_selectedLocale!);
              if (widget.fromRoot) {
                Navigator.pushNamed(context, LoginRoutes.loginPage);
              } else {
                Navigator.pop(context);
              }
            }),
      ),
    );
  }
}
