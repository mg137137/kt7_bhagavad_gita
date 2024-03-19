import 'package:flutter/material.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  bool edit = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          SizedBox(
            height: 20,
          ),
          SizedBox(
            // height: 150,
            child: Image.asset('img/main_photo.png'),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: Colors.grey),
            ),
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 80, right: 80, top: 10),
            padding: EdgeInsets.only(top: 5, bottom: 5),
            child: Text(
              'User Detail',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black, // Change the color as needed
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          //Edit Switch
        ],
      ),
    );
  }
}
