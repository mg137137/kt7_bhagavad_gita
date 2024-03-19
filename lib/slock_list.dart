import 'package:flutter/material.dart';

import 'Chapters/slock_detail.dart';

class SlockList extends StatefulWidget {
  final Map<String, dynamic> chapter_detail;
  final int Number;
  final bool isEnglish;
  const SlockList(
      {super.key,
      required this.Number,
      required this.isEnglish,
      required this.chapter_detail});

  @override
  State<SlockList> createState() => _SlockListState();
}

class _SlockListState extends State<SlockList> {
  // List<Map<String, dynamic>> verse = [];
  bool isLoading = true;
  List<dynamic> versesList = [];
  late List<dynamic> verseList = widget.chapter_detail['verse'].toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.brown.shade50,
        appBar: AppBar(
          title: Text('Bhagavad Gita Verse'),
        ),
        body: ListView(
          children: [
            Card(
              child: Column(
                children: [
                  Text(
                    'Chapter : ${widget.chapter_detail['detail']['chapter_number']}\n${widget.chapter_detail['detail']['name']}',
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    '${widget.chapter_detail['detail']['chapter_summary']}',
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
            // Card(
            //     child: ListTile(
            //   title: Text(
            //     widget.chapter_detail['detail']['name'].toString(),
            //   ),
            //   subtitle: Text(widget.chapter_detail['detail']['chapter_summary']
            //       .toString()),
            // )),
            for (int i = 0; i < verseList.length; i++)
              ChapterBox(
                title: verseList[i]['slug'].toString(),
                subTitle: verseList[i]['text'].toString(),
                number: verseList[i]['verse_number'],
                chapter_detail: widget.chapter_detail,
              ),
          ],
        ));
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
          // side: BorderSide(
          //   color: Colors.brown,
          //   width: 1.0,
          // ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: ListTile(
          shape: RoundedRectangleBorder(
            // side: BorderSide(
            //   color: Colors.brown,
            //   width: 1.0,
            // ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SlockDetail(
                          Number: number - 1,
                          chapter_detail: chapter_detail,
                          verseNumber: number - 1,
                        )));
          },

          // title: Text(title),
          subtitle: Text(
            subTitle,
            style: TextStyle(
                color: Colors.brown.shade300,
                // fontSize: 22,
                fontWeight: FontWeight.bold),
          ),
          trailing: CircleAvatar(
            // backgroundColor: Colors.blue,
            child: Text(number.toString()),
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
