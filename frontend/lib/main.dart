import 'package:ea_software/constants/global_variables.dart';
import 'package:ea_software/features/auth/screens/auth_screen.dart';
import 'package:ea_software/features/auth/services/auth_service.dart';
import 'package:ea_software/providers/user_provider.dart';
import 'package:ea_software/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EA Software',
      theme: ThemeData(scaffoldBackgroundColor: GlobalVariables.backgroundColor, colorScheme: const ColorScheme.light(primary: GlobalVariables.secondaryColor), appBarTheme: const AppBarTheme(elevation: 0, iconTheme: IconThemeData(color: Colors.black))),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: AuthScreen(),
    );
  }
}
