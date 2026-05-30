import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:mt5_leeon1/core/di/service_locator.dart';
import 'package:mt5_leeon1/features/news/domain/bloc/news_bloc.dart';
import 'package:mt5_leeon1/features/news/ui/Items.dart';
import 'package:mt5_leeon1/features/news/ui/NewsTile.dart';
import 'package:mt5_leeon1/features/news/ui/News_search_page.dart';
import 'package:mt5_leeon1/features/news/ui/news_favorite_page.dart';
import 'package:mt5_leeon1/features/news/ui/news_preferences_page.dart';

@RoutePage()
class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final List<Widget> listPage = <Widget>[
    NewsSearchPage(),
    NewsFavoritePage(),
    NewsPreferencesPage(),
  ];

  int currentIndex = 0;
  String title = 'Home';

  void _onItemTapped(int index, String title) {
    setState(() {
      currentIndex = index;
      this.title = title;

    });
  }

  double _itemOffset(int index) {
    if (index < currentIndex) {
      return -10;
    }
    if (index > currentIndex) {
      return 10;
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {

          return Scaffold(
            body: IndexedStack(
              index: currentIndex,
              children: listPage,
            ),

                bottomNavigationBar: GNav(tabs: items,
                activeColor: Colors.black,
                color: Colors.white,
                gap: 7,
                padding: EdgeInsets.all(18),
                backgroundColor: Color(0xFFF5F5F5),
                selectedIndex: currentIndex,
                onTabChange: (index){
                  _onItemTapped(index, items[index].text);
                },),
          );
        }
  }



