import 'dart:async';
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:network_service_repository/network_service_repository.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app/authentication/view/sign_up/sign_up_page.dart';
import 'package:weather_app/utils/observer.dart';
import 'package:weather_app/weather/view/weather_page.dart';
import 'package:weather_repository/weather_repository.dart';
import 'firebase_options.dart';

Future<void> main() async {
  runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp(
        name: 'weather-app',
        options: DefaultFirebaseOptions.currentPlatform,
      );
      BlocOverrides.runZoned(
        () => runApp(
          MultiRepositoryProvider(
            providers: [
              RepositoryProvider<NetworkService>(
                create: (context) => NetworkService(),
              ),
              RepositoryProvider<WeatherRepository>(
                create: (context) => WeatherRepository(),
              ),
            ],
            child: const MyApp(),
          ),
        ),
        blocObserver: AppBlocObserver(),
      );
    },
    (error, stack) {
      log("Crash Crash", error: error, stackTrace: stack);
    },
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static final GlobalKey<NavigatorState> _navigatorKey =
      GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    String? userId = auth.currentUser?.uid;
    return Sizer(builder: (context, orientation, deviceType) {
      return GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: MaterialApp(
          navigatorKey: _navigatorKey,
          debugShowCheckedModeBanner: false,
          home: userId == null ? const SignUpPage() : const WeatherPage(),
        ),
      );
    });
  }
}
