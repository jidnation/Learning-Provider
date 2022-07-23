import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_manager/Input_view.dart';
import 'package:provider_manager/home_page.dart';

import 'new_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BreadCrumbProvider(),
      child: MaterialApp(
        title: 'Provider Learning',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const InputScreen(),
        routes: {
          '/new': (context) => const NewBreadCrumbWidget(),
        },
      ),
    );
  }
}
