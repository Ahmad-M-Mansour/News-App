import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/Home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky, overlays: [SystemUiOverlay.bottom]);
    Future.delayed(const Duration(seconds: 5),() => setState(() {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Home(),));
    }),);
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image: AssetImage("assets/sp.gif")),
          CircularProgressIndicator(color: Colors.blue,),
        ],
      ),
    );
  }
}

