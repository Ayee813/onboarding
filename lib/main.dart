import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences prefs;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.getTextTheme("Jua"),
      ),
      home: const onboardingPage(),
    );
  }
}

class onboardingPage extends StatelessWidget {
  const onboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        pages: [
          PageViewModel(
            title: "Home",
            body: "Flutter is not here",
            image: Padding(
              padding: const EdgeInsets.all(64),
              child: Image.network(
                  "https://user-images.githubusercontent.com/26322627/143761841-ba5c8fa6-af01-4740-81b8-b8ff23d40253.png"),
            ),
            decoration: const PageDecoration(
              titleTextStyle: TextStyle(
                color: Colors.blueAccent,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              bodyTextStyle: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ),
          PageViewModel(
            title: "I love this UI",
            body: "Flutter is here",
            image: Padding(
              padding: const EdgeInsets.all(64),
              child: Image.asset("../assets/img/flutter.png"),
            ),
            decoration: const PageDecoration(
              titleTextStyle: TextStyle(
                color: Colors.blueAccent,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              bodyTextStyle: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ),
        ],
        next: const Text(
          "Next",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        done: const Text(
          "Done",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        onDone: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const homePage(),
            ),
          );
        },
      ),
    );
  }
}

class homePage extends StatelessWidget {
  const homePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        backgroundColor: Colors.blue[400],
        actions: [
          IconButton(
            onPressed: () {
              prefs.clear();
            },
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      body: const Center(
        child: Text(
          "Here is home Page",
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
