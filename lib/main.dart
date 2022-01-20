import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:most5dm/components/dio_helper.dart';
import 'package:most5dm/components/locale_helper.dart';
import 'package:most5dm/components/read_json.dart';
import 'package:most5dm/modules/auth/viewModel/cubit/auth_cubit.dart';
import 'package:most5dm/style/light_theme.dart';
import 'constants/app_router.dart';
import 'constants/app_string.dart';
import 'constants/observer.dart';
import 'modules/auth/view/screen/login_screen_.dart';

void main() async {
  // changeStatusBarColor();
  WidgetsFlutterBinding.ensureInitialized();
  readJson();
  DioHelper.init();
  Bloc.observer = MyBlocObserver();
  runApp(
    DevicePreview(
      enabled: false,
      builder: (BuildContext context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        // home: const LoginScreen_(),
        initialRoute: AppString.splashScreen,
        onGenerateRoute: AppRouter.onGenerateRoute,
        localizationsDelegates: localizationsDelegates,
        supportedLocales: supportedLocales,
        localeResolutionCallback: localeResolutionCallback,

      ),
    );
  }
}
