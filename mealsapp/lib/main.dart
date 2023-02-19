import 'package:flutter/material.dart';
import 'package:mealsapp/providers/updates.dart';
import 'package:mealsapp/screens/tabs2_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UpdateData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Meals App',
        theme: ThemeData(
            canvasColor: const Color.fromRGBO(255, 254, 229, 1),
            fontFamily: 'Raleway',
            textTheme: ThemeData.light().textTheme.copyWith(
                  displayLarge: const TextStyle(
                      fontSize: 22,
                      fontFamily: 'RobotoCondensed',
                      fontWeight: FontWeight.bold),
                  bodyLarge:
                      const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
                  bodyMedium:
                      const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
                ),
            colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)
                .copyWith(secondary: Colors.amber)),
        home: const TabsScreenn(),
      ),
    );
  }
}
