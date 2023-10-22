import 'package:flutter/material.dart';
import 'package:pokedex/views/screens/root_screen/pages/favorite_items.dart';
import 'package:pokedex/views/screens/root_screen/pages/home_screen.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  final pageController = PageController();
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pokemon"),
      ),
      body: PageView(
        controller: pageController,
        children: const [HomeScreen(), FavoriteItems()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        currentIndex: selectedTab,
        onTap: (pageNo) {
          pageController.jumpToPage(pageNo);
          setState(() {
            selectedTab = pageNo;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
              ),
              label: "Favorties"),
        ],
      ),
    );
  }
}
