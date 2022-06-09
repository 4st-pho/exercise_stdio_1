import 'package:flutter/material.dart';
import 'package:stdio_week_5/helper/context.dart';
import 'package:stdio_week_5/pages/add_story_page.dart';
import 'package:stdio_week_5/pages/quote_page.dart';
import 'package:stdio_week_5/pages/story_page.dart';
import 'package:stdio_week_5/provider/stories.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _pageIndex = 0;
  final List<Widget> _pages = [
    ChangeNotifierProvider(
      create: (context) => Stories(),
      builder: (context, _) => const StoryPage(),
    ),
    const QuotePage(),
  ];
  Widget bottomNavigationBarItem({
    required IconData icon,
    required String lable,
    required int pageIndex,
    Color color = Colors.grey,
  }) {
    return Expanded(
      child: InkWell(
        onTap: () {
          setState(() {
            _pageIndex = pageIndex;
          });
        },
        child: Column(
          children: [
            Icon(
              icon,
              color: color,
            ),
            Text(
              lable,
              style: TextStyle(color: color),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_pageIndex],
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).colorScheme.background,
        shape: const CircularNotchedRectangle(),
        child: SizedBox(
          height: 60,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(children: [
              _pageIndex == 0
                  ? bottomNavigationBarItem(
                      icon: Icons.notes,
                      lable: 'Story',
                      pageIndex: 0,
                      color: Colors.deepPurple)
                  : bottomNavigationBarItem(
                      icon: Icons.notes, lable: 'Story', pageIndex: 0),
              _pageIndex == 1
                  ? bottomNavigationBarItem(
                      icon: Icons.format_quote,
                      lable: 'Quote',
                      pageIndex: 1,
                      color: Colors.deepPurple)
                  : bottomNavigationBarItem(
                      icon: Icons.format_quote, lable: 'Quote', pageIndex: 1),
            ]),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepOrange,
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(
                    builder: (context) => const AddStoryPage()))
                .then((msg) {
              if (msg != null) {
                if (msg == 'ok') {
                  showSnackBar(context: context, content: 'success');
                } else {
                  showSnackBar(context: context, content: 'Error: $msg');
                }
              }
            });
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
