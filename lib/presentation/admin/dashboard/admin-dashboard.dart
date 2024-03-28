import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:side_navigation/side_navigation.dart';

import '../pages/app_protfolio.dart';
import '../pages/home_page.dart';

class AdminDashbord extends StatefulWidget {
  final int pageIndex;
  final QueryDocumentSnapshot<Map<String, dynamic>>? existingPortfolio;

  const AdminDashbord({super.key, this.pageIndex = 0, this.existingPortfolio});

  @override
  State<AdminDashbord> createState() => _AdminDashbordState();
}

class _AdminDashbordState extends State<AdminDashbord> {

  List<Widget> views = [];

  /// The currently selected index of the bar
  int selectedIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedIndex = widget.pageIndex;
    views.insert(0,    AdminHomePage());
    views.insert(1,   AdminAddPortfolio(portfolio: widget!.existingPortfolio,));
    views.insert(2,    Center(
      child: Text('Settings'),
    ));

    print("Selected index: ${selectedIndex}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.black,
      title: Center(child: Text("Nayon.coders Protfolio admin panel"),),
    ),
      // The row is needed to display the current view
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Pretty similar to the BottomNavigationBar!
          SideNavigationBar(
            selectedIndex: selectedIndex,
            items: const [
              SideNavigationBarItem(
                icon: Icons.dashboard,
                label: 'Dashboard',
              ),
              SideNavigationBarItem(
                icon: Icons.person,
                label: 'Add Portfolio',
              ),
              SideNavigationBarItem(
                icon: Icons.settings,
                label: 'Settings',
              ),
            ],
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
          ),

          /// Make it take the rest of the available width
          Expanded(
            child: views.elementAt(selectedIndex),
          )
        ],
      ),

    );
  }
}
