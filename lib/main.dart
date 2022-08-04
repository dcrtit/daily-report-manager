import 'package:flutter/material.dart';
import 'package:report_manager/pages/auth.dart';
import 'package:report_manager/pages/manager.dart';
import 'package:report_manager/services/shared_service.dart';

Widget _defaultHome = const AuthPage();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  bool result = await SharedService.isLoggedIn();

  if (result) {
    _defaultHome = const ManagerPage();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => _defaultHome,
        '/manager': (context) => const ManagerPage()
      },
    );
  }
}
