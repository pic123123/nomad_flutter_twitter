import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nomad_flutter_twitter/features/authentication/initial_screen.dart';

void main() {
  runApp(const MyApp());

  ///상단의 시계,와이파이,배터리 표시바 색상 고정
  ///#TODO 하얀색 배경일때는 dart색상이 보이는데, 만일 까만색 배경일때가 있다면 조건문으로 light도 넣어줘야함
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Twitter Clone',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const InitialScreen());
  }
}
