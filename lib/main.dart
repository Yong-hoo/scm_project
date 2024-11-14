import 'package:flutter/material.dart';
import 'package:flutter_pj/screens/home_screen.dart';
import 'package:flutter_pj/screens/landing_screen.dart';
import 'package:get/get.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:safe_device/safe_device.dart';
import 'package:local_session_timeout/local_session_timeout.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  //main내에서 await이 호출되면 아래 코드를 넣어야 한다.
  WidgetsFlutterBinding.ensureInitialized();
  //탈옥 여부 확인
  bool isJailBroken = await SafeDevice.isJailBroken;
  bool isRealDevice = await SafeDevice.isRealDevice;
  if (!isRealDevice) {
    isJailBroken = false;
  }
  if (!isJailBroken) {
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
    runApp(const MyApp());
  } else {
    runApp(const NotSafeApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final sessionConfig = SessionConfig(
      invalidateSessionForAppLostFocus: const Duration(seconds: 300),
      invalidateSessionForUserInactivity: const Duration(seconds: 300),
    );

    sessionConfig.stream.listen((SessionTimeoutState timeoutEvent) {
      if (timeoutEvent == SessionTimeoutState.userInactivityTimeout) {
        // handle user  inactive timeout
        Get.offAll(() => const HomeScreen());
      } else if (timeoutEvent == SessionTimeoutState.appFocusTimeout) {
        Get.offAll(() => const HomeScreen());
      }
    });

    return SessionTimeoutManager(
      // userActivityDebounceDuration: const Duration(seconds: 10),
      sessionConfig: sessionConfig,
      child: const GetMaterialApp(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('ko', 'KR'),
        ],
        debugShowCheckedModeBanner: false,
        title: 'Project SCM1',
        home: HomeScreen(),
      ),
    );
  }
}

class NotSafeApp extends StatelessWidget {
  const NotSafeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: Scaffold(
      body: SafeArea(
        child: Center(
          child: Text(
            '정상적이지 않은 OS입니다!',
            style: TextStyle(fontSize: 20.0),
          ),
        ),
      ),
    ));
  }
}
