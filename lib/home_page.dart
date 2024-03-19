import 'package:flutter/material.dart';
import 'package:kt7_bhagavad_gita/profile.dart';
import 'package:kt7_bhagavad_gita/webView.dart';
import 'package:share_plus/share_plus.dart';

import 'chapter_wise_list.dart';

enum SingingCharacter { English, Hindi, Gujarati }

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SingingCharacter? _character = SingingCharacter.English;

  void _language(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select The Language'),
          content: SizedBox(
            height: 200,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ListTile(
                    title: const Text('English'),
                    leading: Radio<SingingCharacter>(
                      value: SingingCharacter.English,
                      groupValue: _character,
                      onChanged: (SingingCharacter? value) {
                        setState(() {
                          _character = value;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('Hindi'),
                    leading: Radio<SingingCharacter>(
                      value: SingingCharacter.Hindi,
                      groupValue: _character,
                      onChanged: (SingingCharacter? value) {
                        setState(() {
                          _character = value;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('Gujarati'),
                    leading: Radio<SingingCharacter>(
                      value: SingingCharacter.Gujarati,
                      groupValue: _character,
                      onChanged: (SingingCharacter? value) {
                        setState(() {
                          _character = value;
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
            TextButton(
              child: Text('Select'),
              onPressed: () {
                // You can handle the selection action here if needed
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    ChapterWise(),
    profile(),
    Text(
      'Index 3: Business',
      style: optionStyle,
    ),
    Text(
      'Index 4: Business',
      style: optionStyle,
    ),
    // WebView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<String> appbarTitle = [
    'Bhagavad Gita',
    'Profile',
    'Bhagavad Gita',
    'Bhagavad Gita',
    'About Us'
  ];

  final String linkToShare =
      'https://play.google.com/store/apps/details?id=kt3.sgci.lalpur.in.kt3_sgci_lalpur&pcampaignid=web_share'; // Replace this with your desired link
  final String textToShare =
      'Shree Bhagavad Gita'; // Replace this with your desired text

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appbarTitle[_selectedIndex]),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('img/main_photo.png'),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(2),
              ),
              child: null,
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: const Text('Home'),
              selected: _selectedIndex == 0,
              onTap: () {
                _onItemTapped(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: const Text('Profile'),
              selected: _selectedIndex == 1,
              onTap: () {
                _onItemTapped(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.language),
              title: const Text('Language'),
              selected: _selectedIndex == 2,
              onTap: () {
                _language(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.share),
              title: const Text('Share App'),
              selected: _selectedIndex == 3,
              onTap: () {
                Share.share(
                  '$textToShare\n$linkToShare',
                  subject:
                      'Snapshot From Textile Calculator', // Subject is optional
                );
              },
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 15,
                child: Image.asset('img/logo.png'),
              ),
              title: const Text('About Us'),
              selected: _selectedIndex == 4,
              onTap: () {
                _onItemTapped(4);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
