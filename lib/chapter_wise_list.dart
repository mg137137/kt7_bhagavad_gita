import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:kt7_bhagavad_gita/Chapters/chapter_only.dart';
import 'slock_list.dart';

class ChapterWise extends StatefulWidget {
  const ChapterWise({Key? key}) : super(key: key);

  @override
  State<ChapterWise> createState() => _ChapterWiseState();
}

class _ChapterWiseState extends State<ChapterWise> {
  String _selectedLanguage = 'English'; // Default language selection

  final List<String> englishChapters = [
    'Chapter 1',
    'Chapter 2',
    'Chapter 3',
    'Chapter 4',
    'Chapter 5',
    'Chapter 6',
    'Chapter 7',
    'Chapter 8',
    'Chapter 9',
    'Chapter 10',
    'Chapter 11',
    'Chapter 12',
    'Chapter 13',
    'Chapter 14',
    'Chapter 15',
    'Chapter 16',
    'Chapter 17',
    'Chapter 18'
    // Add more chapters here
  ];

  final List<String> hindiChapters = [
    'अध्याय १',
    'अध्याय २',
    'अध्याय ३',
    'अध्याय ४',
    'अध्याय ५',
    'अध्याय ६',
    'अध्याय ७',
    'अध्याय ८',
    'अध्याय ९',
    'अध्याय  १०',
    'अध्याय  ११',
    'अध्याय  १२',
    'अध्याय  १३',
    'अध्याय  १४',
    'अध्याय  १५',
    'अध्याय  १६',
    'अध्याय  १७',
    'अध्याय  १८'
    // Add more chapters here
  ];

  final List chapter_subTitle = [
    'अर्जुनविषादयोग',
    'सांख्ययोग',
    'कर्मयोग',
    'ज्ञानकर्मसंन्यासयोग',
    'कर्मसंन्यासयोग',
    'ध्यानयोग',
    'ज्ञानविज्ञानयोग',
    'अक्षरब्रह्मयोग',
    'राजविद्याराजगुह्ययोग',
    'विभूतियोग',
    'विश्वरूपदर्शनयोग',
    'भक्तियोग',
    'क्षेत्र-क्षेत्रज्ञविभागयोग',
    'गुणत्रयविभागयोग',
    'पुरुषोत्तमयोग',
    'दैवासुरसम्पद्विभागयोग',
    'श्रद्धात्रयविभागयोग',
    'मोक्षसंन्यासयोग'
  ];

  List<String> getSelectedChapters() {
    return _selectedLanguage == 'English' ? englishChapters : hindiChapters;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        for (int i = 0; i < allChapterData.allChapterList.length; i++)
          ChapterBox(
            title: getSelectedChapters()[i],
            subTitle: allChapterData.allChapterList[i]['detail']['name'],
            number: i + 1,
            chapter_detail: allChapterData.allChapterList[i],
          ),
      ],
    );
  }
}

class ChapterBox extends StatelessWidget {
  final Map<String, dynamic> chapter_detail;
  final String title;
  final String subTitle;
  final int number;

  const ChapterBox(
      {Key? key,
      required this.title,
      required this.subTitle,
      required this.number,
      required this.chapter_detail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.brown,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: ListTile(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.brown,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SlockList(
                          Number: number,
                          isEnglish: false,
                          chapter_detail: chapter_detail,
                        )));
          },
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image(
              image: AssetImage('img/main_photo.png'),
            ),
          ),
          trailing: CircleAvatar(
            // backgroundColor: Colors.blue,
            child: Text('${chapter_detail['verse'].length}'),
          ),
          title: Text(
            title,
            style: TextStyle(
                color: Colors.brown, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            subTitle,
            style: TextStyle(
                color: Colors.brown.shade300,
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
        ));

    //   InkWell(
    //   onTap: () {
    //
    //   },
    //   child: Padding(
    //     padding: const EdgeInsets.all(5.0),
    //     child: Container(
    //       height: 80,
    //
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.start,
    //         children: [
    //           SizedBox(
    //             child: Padding(
    //               padding: const EdgeInsets.all(2.0),
    //               child:
    //             ),
    //           ),
    //           SizedBox(
    //             width: MediaQuery.of(context).size.width * 0.6,
    //             child:
    //           ),
    //           Text('count'),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
