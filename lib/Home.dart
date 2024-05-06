import 'package:flutter/material.dart';

import 'Widgets/NewsListBuilder.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text: "News",
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.redAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: " App",
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
      body: const NewsListBuilder(),
    );
  }
}
