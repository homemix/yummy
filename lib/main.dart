import 'package:flutter/material.dart';
import 'constants.dart';
import 'components/theme_button.dart';
import 'components/color_button.dart';
import 'home.dart';

void main() {
  // 1
  runApp(Yummy());
}

class Yummy extends StatefulWidget {
  Yummy({super.key});

  @override
  State<Yummy> createState() => _YummyState();
}

class _YummyState extends State<Yummy> {
  // Done: Setup default theme
  ThemeMode themeMode = ThemeMode.light;

  ColorSelection colorSelection = ColorSelection.pink;

  void changeThemeMode(bool useLightMode) {
    setState(() {
      // 1
      themeMode = useLightMode
          ? ThemeMode.light //
          : ThemeMode.dark;
    });
  }

  void changeColor(int value) {
    setState(() {
      colorSelection = ColorSelection.values[value];
    });
  }

  // Done: Add changeTheme above here
  @override
  Widget build(BuildContext context) {
    const appTitle = 'Yummy';

    // TODO: Setup default theme
    // ThemeMode themeMode = ThemeMode.light;
    // ColorSelection colorSelection = ColorSelection.pink;

    //3
    return MaterialApp(
      title: appTitle,
      //debugShowCheckedModeBanner: false, // Uncomment to remove Debug banner

      // Done: Add theme
      themeMode: themeMode,
      theme: ThemeData(
        colorSchemeSeed: colorSelection.color,
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: colorSelection.color,
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      home: Home(
        changeTheme: changeThemeMode,
        changeColor: changeColor,
        colorSelected: colorSelection,
      ),
    );
  }
}
