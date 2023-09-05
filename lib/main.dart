import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task1/NoteApp/HiveNotes.dart';
import 'package:task1/NoteApp/cube/cubit/note_cubit.dart';
import 'package:task1/NoteApp/note.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1/NoteApp/testNote.dart';
import 'package:task1/data.dart';
import 'package:task1/BMI.dart';
import 'package:task1/ecomerce/signIn/cubit/cubit/sign_in_cubit.dart';
import 'package:task1/ecomerce/signIn/signIn.dart';
import 'package:task1/ecomerce/signUp/AnotherSignUp.dart';
import 'package:task1/ecomerce/BookingHistory.dart';
import 'package:task1/ecomerce/Categories.dart';
import 'package:task1/ecomerce/onboardingScreen.dart';
import 'package:task1/ecomerce/signUp.dart';
import 'package:task1/ecomerce/signUp/cubit/cubit/sign_up_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'ecomerce/Splash.dart';
import 'ecomerce/slider.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(HiveHelper.BoxName);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NoteCubit()
            ..getNotes()
            ..getPosts(),
        ),
        BlocProvider(
          create: (context) => SignUpCubit(),
        ),
        BlocProvider(
          create: (context) => SignInCubit(),
        ),
      ],
      child: MaterialApp(
        locale: Locale("ar"),
        debugShowCheckedModeBanner: false,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: signIn(),
      ),
    );
  }
}
