// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:career_aid/firebase_options.dart';
import 'package:career_aid/view/auth/signup/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:career_aid/constant/keys.dart';
import 'package:career_aid/controller/theme.dart';
import 'package:career_aid/locator.dart';
import 'package:career_aid/service/service.dart';
import 'package:career_aid/view/onboarding/onboarding.dart';

HiveStorageService hiveStorageService = getIt<HiveStorageService>();
void main() async {
  await ScreenUtil.ensureScreenSize();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setup();
  await Hive.initFlutter();
  await Hive.openBox(box1);

  hiveStorageService.readItem(key: onBoarded).then(
    (value) {
      value ??= false;
      runApp(
        ProviderScope(
          child: MyApp(
            hasSeenOnboarding: value,
          ),
        ),
      );
    },
  );
}

class MyApp extends StatelessWidget {
  final bool hasSeenOnboarding;
  const MyApp({
    Key? key,
    required this.hasSeenOnboarding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(
        375.0,
        812.0,
      ),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Career Aid',
          theme: AppTheme.light(),
          home: hasSeenOnboarding ? const SignUp() : Onboarding(),
        );
      },
    );
  }
}
