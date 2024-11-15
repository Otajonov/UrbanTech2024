import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:lottie/lottie.dart';
import 'package:select_field/select_field.dart';
import 'package:simple_tags/simple_tags.dart';
import 'package:urbantech/home/index.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> with SingleTickerProviderStateMixin {


  static const fruitOptions = <String>[
    'I am planning to start a business',
    'I already have small to medium business',
    'I already have enterprise level business',
  ];

  final options = fruitOptions
      .map((fruit) => Option(label: fruit, value: fruit))
      .toList();

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
              "lib/assets/register.json",
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

          SizedBox(height: 15),

          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: Colors.blueGrey, // Border color
                width: 1, // Border width
              ),
            ),
            child: InternationalPhoneNumberInput(

              initialValue: PhoneNumber(isoCode: 'UZ'),
              //locale: 'Uzbekistan',
              //countries: ["Uzbekistan", 'Kazakhstan', 'Russia'],
              inputDecoration: InputDecoration(
                hintText: "Your Mobile",
                contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none
                )
              ),
                hintText: "Your Phone",
                inputBorder: const OutlineInputBorder(
                  //borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none, // No visible border
                ),
                onInputChanged: (PhoneNumber value) {  }
            ),
          ),

            Padding(padding: EdgeInsets.all(10),
              child:
              Text("* You'll need it on next login", style: TextStyle(color: Colors.blueGrey, fontSize: 12)),
            ),

            SizedBox(height: 10),


        SelectField<String>(
          options: options,
          initialOption: Option<String>(
            label: fruitOptions[0],
            value: fruitOptions[0],
          ),
          menuPosition: MenuPosition.below,
          onTextChanged: (value) => debugPrint(value),
          onOptionSelected: (option) => debugPrint(option.toString()),
          inputStyle: const TextStyle(),
          menuDecoration: MenuDecoration(
            margin: const EdgeInsets.only(top: 8),
            height: 365,
            alignment: MenuAlignment.center,
            backgroundDecoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            animationDuration: const Duration(milliseconds: 400),
            buttonStyle: TextButton.styleFrom(
              fixedSize: const Size(double.infinity, 60),
              backgroundColor: Colors.white,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                //side: BorderSide(width: 1)
              ),
              textStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            separatorBuilder: (context, index) => Container(
              height: 1,
              width: double.infinity,
              color: Colors.black12,
            ),
          ),
        ),


            Padding(padding: EdgeInsets.all(10),
              child:
              Text("* We'll prepare suggestions and interface for you based on your selection.", style: TextStyle(color: Colors.blueGrey, fontSize: 12)),
            ),

            SizedBox(height: 100),





          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {

          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
                (Route<dynamic> route) => false,
          );

        },
        label: Text("Start Now", style: TextStyle(color: Colors.white)),
        icon: Icon(Icons.navigate_next, color: Colors.white),
      ),
    );
  }
}
