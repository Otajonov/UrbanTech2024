import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:urbantech/home/companies.dart';
import 'package:urbantech/home/feed.dart';
import 'package:urbantech/home/gpt.dart';
import 'package:urbantech/home/history_page.dart';
import 'package:urbantech/home/new_product.dart';
import 'package:urbantech/home/profile_page.dart';


class HomePage extends StatefulWidget {

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  PageController pageController = PageController(initialPage: 0);
  int pageIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Row(
          children: [
            Image.asset("lib/assets/ecoloop.png", height: 40),
            Text(" SmartChain", style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold),)
          ],
        ),
        actions: [

          OpenContainer(
            closedColor: Colors.transparent,
            closedElevation: 0,
            openColor: Colors.transparent,
            openElevation: 0,

            openBuilder: (context, action){
              return GestureDetector(
                onTap: (){},
                child: Scaffold(
                  appBar: AppBar(
                    title: Text("Search"),
                  ),
                ),
              );
            },
            closedBuilder: (context, action){
              return GestureDetector(
                onTap: action,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.search),
                      Text("Search"),
                    ],
                  ),
                ),
              );
            },
          ),

          SizedBox(width: 8),



          OpenContainer(
            closedColor: Colors.transparent,
            closedElevation: 0,
            openColor: Colors.transparent,
            openElevation: 0,

            openBuilder: (context, action){
              return GPTPage();
            },
            closedBuilder: (context, action){
              return GestureDetector(
                onTap: action,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(15)
                  ),
                  child: Image.asset("lib/assets/ai.png", height: 25, color: Colors.black),
                ),
              );
            },
          ),


          SizedBox(width: 18)


        ],
      ),




      body: PageView(
        controller: pageController,
        children: [

          HomeFeedTab(),
          CompaniesListTab(),

          Center(
            child: Text("Orders History goes here"),
          ),

          OrderHistoryPage(),

          ProfilePage(),


        ],
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, color: Colors.white),
        onPressed: () {
          Navigator.push(
            context,
            CupertinoPageRoute(builder: (context) => const AddMaterialPage()),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageIndex,
        type: BottomNavigationBarType.fixed, // Set this to fixed
        selectedItemColor: Colors.orange.shade900,      // Set your preferred color for selected items
        unselectedItemColor: Colors.grey,    // Set color for unselected items
        onTap: (index){

          if (index != 2){
            setState(() {
              pageIndex = index;
            });
            pageController.jumpToPage(index);
          }

        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper),
            label: "Feed",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.flag),
            label: "Companies",
          ),
          BottomNavigationBarItem(
            icon: SizedBox(height: 22), // Empty space for FAB
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history_rounded),
            label: "History",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded),
            label: "Profile",
          ),
        ],
      ),



    );
  }
}
