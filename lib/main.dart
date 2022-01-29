import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:most5dm/components/cash_helper.dart';
import 'package:most5dm/components/dio_helper.dart';
import 'package:most5dm/components/locale_helper.dart';
import 'package:most5dm/components/read_json.dart';
import 'package:most5dm/modules/auth/viewModel/cubit/auth_cubit.dart';
import 'package:most5dm/style/light_theme.dart';
import 'constants/observer.dart';
import 'layout/views/app_layout.dart';

void main() async {
  // changeStatusBarColor();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, ]);
  await CashHelper.initialSharedPreferences();

  readJson();
  DioHelper.init();

  Bloc.observer = MyBlocObserver();
  runApp(
    DevicePreview(
      enabled: true,
      builder: (BuildContext context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('TOKEN ${CashHelper.getString(key: 'token')}');
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        // TODO you can add another cubit here
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.light,
        home: const AppLayout(),
        // initialRoute: AppString.splashScreen,
        // onGenerateRoute: AppRouter.onGenerateRoute,
        localizationsDelegates: localizationsDelegates,
        supportedLocales: supportedLocales,
        localeResolutionCallback: localeResolutionCallback,
      ),
    );
  }
}
