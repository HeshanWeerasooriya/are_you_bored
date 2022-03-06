import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home/home.dart';
import 'model/bored.dart';
import 'services/connectivityService.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Are You Bored',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // primarySwatch: Colors.purple,
        appBarTheme: AppBarTheme(color: Colors.purpleAccent[700]),
        scaffoldBackgroundColor: Color(0xFF9ADCFF),
      ),
      home: MultiRepositoryProvider(
        providers: [
          RepositoryProvider(create: (context) => BoredService()),
          RepositoryProvider(create: (context) => ConnectivityService())
        ],
        child: const HomePage(),
      ),
    );
  }
}
