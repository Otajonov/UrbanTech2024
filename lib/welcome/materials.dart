import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:simple_tags/simple_tags.dart';
import 'package:urbantech/home/index.dart';
import 'package:urbantech/welcome/register.dart';

class SelectMaterialsPage extends StatefulWidget {
  const SelectMaterialsPage({super.key});

  @override
  State<SelectMaterialsPage> createState() => _SelectMaterialsPageState();
}

class _SelectMaterialsPageState extends State<SelectMaterialsPage> with SingleTickerProviderStateMixin {


  final List<String> content = [
    'Iron',
    'Charm',
    'Leather',
    'Oil',
    'Cotton',
    'Something',
    'Other something',
    'Another something :)',
    'Air', 'Freedom'
  ];

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    // Initialize the controller with no duration
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose of the controller when the widget is removed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(25),
        child: ListView(
          children: [
            SizedBox(height: 40),


            Lottie.asset(
              "lib/assets/industry23.json",
              controller: _controller,
              repeat: false, // Play only once
              onLoaded: (composition) {
                _controller.duration = composition.duration * 1.25;
                _controller.forward(); // Start the animation
              },
            ),


            Hero(
              tag: "logo",
              child: Material(
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("lib/assets/ecoloop.png", height: 50),
                    Text(
                      " SmartChain",
                      style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                  ],
                ),
              ),
            ),


            Padding(padding: EdgeInsets.all(10),
              child:
              Text("We have listed some materials that is often used in your industry. You can remove some of them to accurate initial suggestions.", style: TextStyle(color: Colors.blueGrey, fontSize: 12), textAlign: TextAlign.center,),
            ),

            SizedBox(height: 10),

            SimpleTags(
              content: content,
              wrapSpacing: 4,
              wrapRunSpacing: 4,

              onTagPress: (tag) {print('pressed $tag');},
              onTagLongPress: (tag) {print('long pressed $tag');},
              onTagDoubleTap: (tag) {print('double tapped $tag');},

              tagContainerPadding: EdgeInsets.all(6),

              tagTextStyle: TextStyle(color: Colors.orange.shade800, fontWeight: FontWeight.bold),
              tagIcon: Icon(Icons.clear, size: 12),
              tagContainerDecoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.orange.shade800),
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                boxShadow: [],
              ),
            ),



          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {

          Navigator.push(
            context,
            CupertinoPageRoute(builder: (context) => const RegistrationPage()),
          );


        },
        label: Text("Just One More Step", style: TextStyle(color: Colors.white)),
        icon: Icon(Icons.navigate_next, color: Colors.white),
      ),
    );
  }
}
