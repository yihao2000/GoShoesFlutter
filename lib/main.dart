import 'package:flutter/material.dart';
import 'package:go_shoes/comment.dart';
import 'package:go_shoes/commenttab.dart';
import 'package:go_shoes/infotab.dart';
import 'package:go_shoes/landingpage.dart';
import 'package:go_shoes/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:go_shoes/globals.dart' as globals;

// Main Function
void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const GoShoes());
}

class GoShoes extends StatelessWidget {
  const GoShoes({super.key});

  @override
  Widget build(BuildContext context) => MultiProvider(providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
          builder: (context, _) {
            final themeProvider = Provider.of<ThemeProvider>(context);
            return MaterialApp(
              title: "GoShoes",
              themeMode: themeProvider.themeMode,
              theme: MyThemes.lightTheme,
              darkTheme: MyThemes.darkTheme,
              home: LandingPage(),
            );
          },
        ),
      ]);
}
