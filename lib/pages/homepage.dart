import 'package:flutter/material.dart';
import 'package:trip_wise/pages/logoutpage.dart';
import 'package:trip_wise/pages/landingpage.dart';
import 'package:trip_wise/pages/searchpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;
  late PageController pagecontroller;

  @override
  void initState() {
    super.initState();
    pagecontroller = PageController();
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    pagecontroller.dispose();
  }

  void onTapNav(int index) {
    pagecontroller.jumpToPage(index);
  }

  void onPageChanged(int index) {
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("TripWise"),
        backgroundColor: Colors.pink,
      ),
      body: PageView(
        controller: pagecontroller,
        onPageChanged: onPageChanged,
        children: const [
          LandingPage(),
          SearchPage(),
          LogoutPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTapNav,
        currentIndex: _index,
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.blueGrey,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home_filled),
          ),
          BottomNavigationBarItem(
            label: "Search",
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            label: "Logout",
            icon: Icon(Icons.logout),
          ),
        ],
      ),
    );
  }
}
