import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'extension/home.dart';
import 'package:bmi/Screen/converter_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((value) => runApp(const MyApp()));
  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "BMI",
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: const Color(0xff0a0321),
          textTheme: const TextTheme(
            bodyText1: TextStyle(color: Colors.white),
          ),
          appBarTheme: const AppBarTheme(
              centerTitle: true, elevation: 0.0, color: Color(0xff0a0321)), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.pink)),
      routes: {
        '/': (context) => const Home(),
        '/converter': (context) => const Converter()
      },
    );
  }
}
