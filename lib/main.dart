import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:order/language/languageCubit.dart';
import 'package:order/language/locale.dart';
import 'package:order/map_utils.dart';
import 'package:order/screens/auth/login_navigator.dart';
import 'package:order/theme/style.dart';

import 'routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  MapUtils.getMarkerPic();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    {
      return BlocProvider<LanguageCubit>(
        create: (context) => LanguageCubit(),
        child: BlocBuilder<LanguageCubit, Locale>(
          builder: (_, locale) {
            return   MaterialApp(
              localizationsDelegates: [
                 AppLocalizationsDelegate(),
                GlobalMaterialLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              supportedLocales: [
                const Locale('en'),
                const Locale('ar'),
                const Locale('pt'),
                const Locale('fr'),
                const Locale('id'),
                const Locale('es'),
                const Locale('tr'),
                const Locale('it'),
                const Locale('sw'),
              ],
              routes: PageRoutes().routes(),
              locale: locale,
              theme: uiTheme(),
              home: LoginNavigator(),
              debugShowCheckedModeBanner: false,
            );
          },
        ),
      );
    }
  }
}
