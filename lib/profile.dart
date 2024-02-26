import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Profile extends StatefulWidget {
  Profile({super.key, required this.isChecked});

  bool? isChecked;

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Future<void> getStuffFromPlaces() async {
    var url = Uri.https('api.kanye.rest');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }

  @override
  Widget build(BuildContext context) {
    getStuffFromPlaces();

    bool? _isChecked = widget.isChecked;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Profile Page"),
        // actions: [
        //   BackButton(
        //     onPressed: () => {Navigator.pop(context)},
        //   )
        // ],
      ),
      body: Center(
        child: Column(
          children: [
            Checkbox(
              value: _isChecked,
              onChanged: (bool? value) {
                setState(() {
                  _isChecked = value!;
                });
              },
            )
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.favorite),
      //       label: "Likes",
      //     ),
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
      //     BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
      //   ],
      //   currentIndex: _navIndex,
      //   onTap: (value) => {
      //     setState(() {
      //       _navIndex = value;
      //       switch (_navIndex) {
      //         case 1:
      //           Navigator.push(
      //               context,
      //               MaterialPageRoute(
      //                   builder: (context) =>
      //                       const MyHomePage(title: "Weather Dating App")));
      //           break;
      //       }
      //     })
      //   },
      // )
    );
  }
}
