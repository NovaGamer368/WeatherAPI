import 'package:flutter/material.dart';

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
      home: const MyHomePage(title: "Weather Dating App"),
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
    bool isChecked = false;
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
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Likes"),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
          currentIndex: 1,
        ));
  }
}
