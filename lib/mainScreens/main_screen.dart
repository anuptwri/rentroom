import 'package:flutter/material.dart';
import 'package:local/tabPages/add_property.dart';
import 'package:local/tabPages/earning_tab.dart';
import 'package:local/tabPages/home_tab.dart';
import 'package:local/tabPages/profile_tab.dart';
import 'package:local/tabPages/ratings_tab.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin
{

  TabController? tabController;
  int selectedIndex = 0;

  onItemClicked(int index)
  {
    setState(() {
      selectedIndex = index;
      tabController!.index= selectedIndex;
    });
  }

  @override
  void initState() {

    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
      physics: const NeverScrollableScrollPhysics(),
        controller: tabController,
        children:const [
          HomeTabPage(),
          EarningTabPage(),
          AddPropertyTabPage(),
          ProfileTabPage(),

        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items:const [
           BottomNavigationBarItem(
            icon : Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon : Icon(Icons.shopping_cart),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon : Icon(Icons.add),
            label: "Add",
          ),
          BottomNavigationBarItem(
            icon : Icon(Icons.menu),
            label: "More",
          ),
        ],
        unselectedItemColor: Colors.white54,
        selectedItemColor: Colors.white,
        backgroundColor: Colors.red,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(fontSize: 14),
        showUnselectedLabels: true,
        currentIndex: selectedIndex,
        onTap: onItemClicked,
      ),
    );
  }
}