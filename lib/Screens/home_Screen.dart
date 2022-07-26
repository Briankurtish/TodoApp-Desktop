import 'package:flutter/material.dart';

class HonmeScreen extends StatefulWidget {
  const HonmeScreen({Key? key}) : super(key: key);

  @override
  State<HonmeScreen> createState() => _HonmeScreenState();
}

class _HonmeScreenState extends State<HonmeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Center(
        child: Container(
          padding: EdgeInsets.all(18),
          width: MediaQuery.of(context).size.width * 0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "👋 Welcome Sir",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
