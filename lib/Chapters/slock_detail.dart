import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SlockDetail extends StatefulWidget {
  final int verseNumber;
  final Map<String, dynamic> chapter_detail;
  final int Number;

  const SlockDetail({
    Key? key,
    required this.Number,
    required this.chapter_detail,
    required this.verseNumber,
  }) : super(key: key);

  @override
  State<SlockDetail> createState() => _SlockDetailState();
}

class _SlockDetailState extends State<SlockDetail> {
  late List<dynamic> verseDetail;

  @override
  void initState() {
    super.initState();
    verseDetail = widget.chapter_detail['verse'].toList();
  }

  @override
  Widget build(BuildContext context) {
    // Ensure verseNumber falls within valid range
    int initialIndex =
        (widget.verseNumber >= 1 && widget.verseNumber <= verseDetail.length)
            ? widget.verseNumber
            : 0;

    return DefaultTabController(
      initialIndex: initialIndex,
      length: verseDetail.length,
      child: Scaffold(
        backgroundColor: Colors.brown.shade50,
        appBar: AppBar(
          title: Text('Bhagavad Gita Verse'),
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            isScrollable: true,
            tabs: List.generate(
              verseDetail.length,
              (index) => Tab(
                text: 'Verse ${verseDetail[index]['verse_number']}',
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: List.generate(
            verseDetail.length,
            (index) => VerseCard(
              verse: verseDetail[index],
            ),
          ),
        ),
      ),
    );
  }
}

class VerseCard extends StatelessWidget {
  final Map<String, dynamic> verse;

  const VerseCard({
    Key? key,
    required this.verse,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Access 'translations' key
    var translations = verse['translations'];

    // Filter translations where language is English
    var englishTranslations =
        translations.where((trans) => trans['language'] == 'english').toList();

    // Sort translations by author's name in descending alphabetical order
    englishTranslations.sort((a, b) =>
        (b['author_name'] as String).compareTo(a['author_name'] as String));

    //For commentary
    var translationscomen = verse['commentaries'];
    // Filter translations where language is English
    var englishTranslationscomen =
        translations.where((trans) => trans['language'] == 'english');

    // Convert commentary translations to a list for sorting
    var commentaryList = englishTranslationscomen.toList();

    // Sort commentary translations by author's name in descending alphabetical order
    commentaryList.sort((a, b) =>
        (b['author_name'] as String).compareTo(a['author_name'] as String));

    return ListView(
      children: [
        Card(
          child: Column(
            children: [
              Text(
                '${verse['chapter_number']}.${verse['verse_number']}',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                '${verse['text']}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
        Card(
          child: Column(
            children: [
              Text(
                'Word Meaning'.toUpperCase(),
                style: TextStyle(fontSize: 20),
              ),
              Text(
                '\n${verse['word_meanings']}',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
        Card(
          child: Column(
            children: [
              Text(
                'Transliteration'.toUpperCase(),
                style: TextStyle(fontSize: 20),
              ),
              Text(
                '\n${verse['transliteration']}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
        Card(
          child: Column(
            children: [
              Text(
                'translations'.toUpperCase(),
                style: TextStyle(fontSize: 20),
              ),
              for (var trans in englishTranslations)
                Text(
                  '\nAuthor: ${trans['author_name']}\n${trans['description']}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
            ],
          ),
        ),
        Card(
          child: Column(
            children: [
              Text(
                'commentaries'.toUpperCase(),
                style: TextStyle(fontSize: 20),
              ),
              for (var trans in commentaryList)
                Text(
                  '\nAuthor: ${trans['author_name']}\n${trans['description']}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
