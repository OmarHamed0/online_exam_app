import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'config/routes/app_routes.dart';
import 'config/routes/page_route_name.dart';
import 'config/theme/app_theme.dart';
class OnlineExam extends StatelessWidget {
  const OnlineExam({super.key});

  @override
  Widget build(BuildContext context) {
    return  ScreenUtilInit(
        designSize: const Size(360, 690),
         minTextAdapt: true,
        splitScreenMode: true,
      builder: (context, child) {
        return  MaterialApp(
          title: 'Online Exam',
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          initialRoute: PageRouteName.splash,
          onGenerateRoute: (settings) => AppRoutes.onGenerateRoute(settings),
          debugShowCheckedModeBanner: false,
          theme: AppTheme.appTheme,
          themeMode: ThemeMode.light,
        );
      },
    );
  }
}
