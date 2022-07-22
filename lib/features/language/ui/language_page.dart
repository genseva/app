// import 'package:animation_wrappers/animation_wrappers.dart';
// import 'package:deligo/Routes/page_routes.dart';
// import 'package:deligo/app_config/app_config.dart';
// import 'package:deligo/features/auth/login_navigator.dart';
// import 'package:deligo/features/drawer/ui/drawer.dart';
// import 'package:deligo/generated/l10n.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../bloc/language_cubit.dart';
//
// class LanguagePage extends StatefulWidget {
//   final bool fromRoot;
//
//   const LanguagePage({Key? key, this.fromRoot = false}) : super(key: key);
//
//   @override
//   State<LanguagePage> createState() => _LanguagePageState();
// }
//
// class _LanguagePageState extends State<LanguagePage> {
//   late LanguageCubit _languageCubit;
//
//   String? _selectedLocale;
//
//   @override
//   void initState() {
//     super.initState();
//     _languageCubit = context.read<LanguageCubit>()..getCurrentLanguage();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var locale = AppLocalizations.of(context);
//     return Scaffold(
//       backgroundColor: Theme.of(context).cardColor,
//       drawer: widget.fromRoot ? null : const AppDrawer(),
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text(
//           locale.changeLanguage,
//         ),
//       ),
//       body: FadedSlideAnimation(
//         beginOffset: const Offset(0, 0.3),
//         endOffset: const Offset(0, 0),
//         slideCurve: Curves.linearToEaseOut,
//         child: Column(
//           children: [
//             Container(
//               height: 58.0,
//               padding: const EdgeInsets.symmetric(horizontal: 20.0),
//               child: Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   locale.selectLanguage,
//                   style: Theme.of(context).textTheme.headline6,
//                 ),
//               ),
//             ),
//             Expanded(
//               child: BlocConsumer<LanguageCubit, Locale>(
//                 listener: (context, currentLocale) {
//                   setState(() {
//                     _selectedLocale = currentLocale.languageCode;
//                   });
//                 },
//                 builder: (context, currentLocale) {
//                   _selectedLocale ??= currentLocale.languageCode;
//                   return ListView.builder(
//                     physics: const BouncingScrollPhysics(),
//                     itemCount: AppConfig.languagesSupported.length,
//                     itemBuilder: (context, index) {
//                       var langCode =
//                           AppConfig.languagesSupported.keys.elementAt(index);
//                       return RadioListTile(
//                         title: Text(AppConfig.languagesSupported[langCode]!),
//                         value: langCode,
//                         groupValue: _selectedLocale,
//                         onChanged: (langCode) async {
//                           setState(() {
//                             _selectedLocale = langCode as String;
//                           });
//                         },
//                         activeColor: Theme.of(context).primaryColor,
//                       );
//                     },
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: const Icon(Icons.check, size: 24),
//         onPressed: () {
//           _languageCubit.setCurrentLanguage(_selectedLocale!);
//           if (widget.fromRoot) {
//             Navigator.pushNamed(context, LoginRoutes.loginPage);
//           } else {
//             Navigator.pushReplacementNamed(context, PageRoutes.busesRoute);
//           }
//         },
//       ),
//     );
//   }
// }
