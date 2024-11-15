import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:multi_dropdown/multi_dropdown.dart';
import 'package:urbantech/welcome/materials.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class User {
  final String name;
  final int id;

  User({required this.name, required this.id});

  @override
  String toString() {
    return 'User(name: $name, id: $id)';
  }
}


class _WelcomePageState extends State<WelcomePage> with SingleTickerProviderStateMixin {




  final controller = MultiSelectController<User>();


  String currentAnimation = 'lib/assets/industry1.json';
  late AnimationController _controller;
  bool isFirstAnimation = true;
  bool isReversing = false;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller without a duration yet
    _controller = AnimationController(vsync: this);
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed && !isReversing) {
        // Animation completed in forward direction, wait and then reverse
        Future.delayed(Duration(seconds: 1), () {
          setState(() {
            isReversing = true;
          });
          _controller.reverse();
        });
      } else if (status == AnimationStatus.dismissed && isReversing) {
        // Animation completed in reverse direction, switch animation without delay
        setState(() {
          // Toggle between animations
          isFirstAnimation = !isFirstAnimation;
          currentAnimation = isFirstAnimation
              ? 'lib/assets/industry1.json'
              : 'lib/assets/industry2.json';
          isReversing = false;
        });
        // Start the next animation in forward direction immediately
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose the controller when the widget is removed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {



    var items = [
      DropdownItem(label: 'Textile', value: User(name: 'Textile', id: 1)),
      DropdownItem(label: 'Leather', value: User(name: 'Leather', id: 2)),
      DropdownItem(label: 'Diary', value: User(name: 'Diary', id: 3)),
      DropdownItem(label: 'Sweets', value: User(name: 'Sweets', id: 4)),
      DropdownItem(label: 'Bakery', value: User(name: 'Bakery', id: 5)),
    ];


    return Scaffold(
      body: Padding(padding: EdgeInsets.all(25),
      child: ListView(
        children: [

          SizedBox(height: 100),


          Hero(
            tag: "logo",
            child: Material(
              color: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("lib/assets/ecoloop.png", height: 50),
                  Text(" SmartChain", style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 30)),
                ],
              ),
            )
          ),

          Lottie.asset(
            currentAnimation,
            controller: _controller,
            onLoaded: (composition) {
              // Set the animation duration to 0.8x speed
              _controller.duration = composition.duration * 1.25;
              _controller.forward(); // Start the animation once duration is set
            },
          ),



          TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              prefixIcon: Icon(Icons.flag),
                hintText: "Your brand name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(width: 1, color: Colors.blueGrey)

                )
            ),
          ),

          Padding(padding: EdgeInsets.all(10),
            child:
            Text("* Type your brand name", style: TextStyle(color: Colors.blueGrey, fontSize: 12)),
          ),

          SizedBox(height: 10),


          MultiDropdown<User>(
            items: items,
            controller: controller,
            enabled: true,
            searchEnabled: true,
            chipDecoration: const ChipDecoration(
              backgroundColor: Colors.yellow,
              wrap: true,
              runSpacing: 2,
              spacing: 10,
            ),
            fieldDecoration: FieldDecoration(
              hintText: 'Select your industry',
              hintStyle: const TextStyle(color: Colors.black87),
              prefixIcon: const Icon(Icons.factory),
              showClearIcon: false,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: Colors.black87,
                ),
              ),
            ),
            dropdownDecoration: const DropdownDecoration(
              marginTop: 2,
              maxHeight: 500,
              header: Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  'Select your industries',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            dropdownItemDecoration: DropdownItemDecoration(
              selectedIcon:
              const Icon(Icons.check_box, color: Colors.green),
              disabledIcon:
              Icon(Icons.lock, color: Colors.grey.shade300),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Select at least one industry';
              }
              return null;
            },
            onSelectionChange: (selectedItems) {
              debugPrint("OnSelectionChange: $selectedItems");
            },
          ),

          Padding(padding: EdgeInsets.all(10),
          child:
          Text("* Select at least one industry that you belong. We'll show initial suggestions based on it.", style: TextStyle(color: Colors.blueGrey, fontSize: 12)),
          ),


        ],
      ),
      ),


      floatingActionButton: FloatingActionButton.extended(onPressed: (){

        Navigator.push(
          context,
          CupertinoPageRoute(builder: (context) => const SelectMaterialsPage()),
        );

      }, label: Text("Continue", style: TextStyle(color: Colors.white),), icon: Icon(Icons.navigate_next, color: Colors.white),),

    );
  }
}
