import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'src/widgets/list_card.dart';
import 'src/pages/groups.dart';

part 'main.g.dart';

// final stringProvider = Provider((ref) => 'Hello, Riverpoda 123456!');
@riverpod
String helloWorld(HelloWorldRef ref) {
  return "Hello World!";
}

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: FlexThemeData.light(
        scheme: FlexScheme.blumineBlue,
        fontFamily: GoogleFonts.dmSans().fontFamily,
      ),
      darkTheme: FlexThemeData.dark(
        scheme: FlexScheme.blumineBlue,
        fontFamily: GoogleFonts.dmSans().fontFamily,
      ),
      themeMode: ThemeMode.light,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = Scaffold(
          body: GroupPage(),
        );
        break;
      case 1:
        page = Center(
            child: ListCard(amount: 10, icon: Icons.people, title: "People"));
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }
    return Scaffold(
      body: page,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 70),
        child: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(
              icon: Icon(Icons.people),
              selectedIcon: Icon(Icons.people_outlined),
              label: "Groups"),
          NavigationDestination(
              icon: Icon(Icons.person),
              selectedIcon: Icon(Icons.person_outlined),
              label: "Account"),
        ],
        selectedIndex: selectedIndex,
        onDestinationSelected: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
      ),
    );
  }
}
