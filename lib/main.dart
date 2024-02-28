import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    String appTitle = "Weather Dating App";
    return MaterialApp(
      title: appTitle,
      themeMode: ThemeMode.dark, // Set the theme mode to dark
      darkTheme: ThemeData.dark().copyWith(
        // Define dark mode colors
        colorScheme: const ColorScheme.dark(
          primary: Colors.pink,
          secondary: Colors.white,
        ),
      ),
      home: const MyHomePage(
        title: 'Weather Dating App',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool? isChecked = false;

  setDarkMode() {
    final preferencesFuture = SharedPreferences.getInstance();

    return preferencesFuture
        .then((preferences) => {preferences.setBool("isDarkMode", true)});
  }

  getDarkMode() {
    final preferencesFuture = SharedPreferences.getInstance();

    preferencesFuture.then((preferences) => {
          print("we are using dark mode: " +
              preferences.getBool("isDarkMode").toString())
        });
  }

  int _navIndex = 1;
  Container buildProfileCard(String profileType) {
    return Container(
        width: 100,
        height: 100,
        color: Colors.pink,
        margin: const EdgeInsets.all(10.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text(profileType)]));
  }

  @override
  Widget build(BuildContext context) {
    List weatherOptions = ["Snowy", "Raining", "Cloudy"];
    getDarkMode();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(
          child: Row(children: [
            buildProfileCard(weatherOptions[0]),
            buildProfileCard(weatherOptions[1]),
            buildProfileCard(weatherOptions[2]),
            Checkbox(
              value: isChecked,
              onChanged: (bool? value) {
                setState(() {
                  isChecked = value!;
                });
              },
            )
          ]),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "Likes",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
          currentIndex: _navIndex,
          onTap: (value) => {
            setState(() {
              _navIndex = value;
              switch (_navIndex) {
                case 2:
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Profile(
                                isChecked: isChecked,
                              )));
                  break;
              }
            })
          },
        ));
  }
}
