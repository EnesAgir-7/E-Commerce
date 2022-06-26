import 'package:ea_software/constants/global_variables.dart';
import 'package:ea_software/features/admin/screens/posts_screen.dart';
import 'package:flutter/material.dart';

class AdminScreen extends StatefulWidget {
  AdminScreen({Key? key}) : super(key: key);

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  int _page = 0;
  double bottomBarWidth = 42;
  double bottomBarBorderWidth = 5;

  List<Widget> pages = [
    const PostsScreen(),
    const Center(child: Text('Analytics Page'),),
    const Center(child: Text('Card Page'),),
  ];

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          //^ flexible space is that because need to have a linear gradient over here
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
              alignment: Alignment.topLeft,
              child: Image.asset(
                'assets/EA.png',
                height: 45,
                width: 45,
                color: Colors.black,
              ),
            ),
            const Text(
              'Admin',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ]),
        ),
      ),
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        selectedItemColor: GlobalVariables.selectedNavBarColor,
        unselectedItemColor: GlobalVariables.unselectedNavBarColor,
        backgroundColor: GlobalVariables.backgroundColor,
        iconSize: 28,
        onTap: updatePage,
        items: [
          //& Posts 
          BottomNavigationBarItem(
              icon: Container(
                width: bottomBarWidth,
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(
                  color: _page == 0 ? GlobalVariables.selectedNavBarColor : GlobalVariables.backgroundColor,
                  width: bottomBarBorderWidth,
                ))),
                child: const Icon(Icons.home_outlined),
              ),
              label: ''),
          //& Analytics
          BottomNavigationBarItem(
              icon: Container(
                width: bottomBarWidth,
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(
                  color: _page == 1 ? GlobalVariables.selectedNavBarColor : GlobalVariables.backgroundColor,
                  width: bottomBarBorderWidth,
                ))),
                child: const Icon(Icons.analytics_outlined),
              ),
              label: ''),
          //& Orders
          BottomNavigationBarItem(
              icon: Container(
                width: bottomBarWidth,
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(
                  color: _page == 2 ? GlobalVariables.selectedNavBarColor : GlobalVariables.backgroundColor,
                  width: bottomBarBorderWidth,
                ))),
                child: const Icon(Icons.all_inbox_outlined),
              ),
              label: ''),
        ],
      ),
    
    );
  }
}
