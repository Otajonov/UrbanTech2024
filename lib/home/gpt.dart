import 'package:flutter/material.dart';
import 'package:chat_bubbles/chat_bubbles.dart';

class GPTPage extends StatefulWidget {
  GPTPage({Key? key}) : super(key: key);

  @override
  _GPTPageState createState() => _GPTPageState();
}

class _GPTPageState extends State<GPTPage> {
  List<Map<String, dynamic>> messages = [
    {
      "text": "Hi GPT, can you help me find a repurposed material for my eco-friendly bag project?",
      "isSender": true,
    },
    {
      "text":
      "Sure! Are you specifically looking for repurposed cotton, or are there other materials you're considering?",
      "isSender": false,
    },
    {
      "text": "Repurposed cotton would be ideal. It needs to be lightweight and durable.",
      "isSender": true,
    },
    {
      "text":
      "Got it! Here are three great options for repurposed cotton materials on SmartChain:",
      "isSender": false,
    },
    {
      "text": "100% Organic Cotton (Repurposed)",
      "isSender": false,
      "image": "https://tijorat.org/rasm/1.jpg",
    },
    {
      "text": "Soft Cotton Sheets",
      "isSender": false,
      "image": "https://tijorat.org/rasm/2.jpg",
    },
    {
      "text": "Durable Cotton Yarn",
      "isSender": false,
      "image": "https://tijorat.org/rasm/3.jpg",
    },
    {
      "text":
      "All of these are lightweight, durable, and perfect for your project. They’re also cost-effective compared to fresh cotton.",
      "isSender": false,
    },
    {
      "text": "Thanks! Can you recommend sellers for these materials?",
      "isSender": true,
    },
    {
      "text":
      "Of course! Here are some sellers currently offering these materials:",
      "isSender": false,
    },
    {
      "text":
      "- Eco Cotton Mills (Tashkent, Uzbekistan)\n- Andijan Cotton Spinners (Andijan, Uzbekistan)\n- Premium Textiles Co. (Samarkand, Uzbekistan)",
      "isSender": false,
    },
    {
      "text": "What about shipping options? Do they handle bulk orders?",
      "isSender": true,
    },
    {
      "text":
      "Yes, most sellers offer two options:\n\n- **Self Shipping**: The seller delivers to your address; costs vary depending on the location.\n- **In-App Shipping**: SmartChain handles shipping for a flat fee. Reliable for bulk orders.",
      "isSender": false,
    },
    {
      "text": "That’s really helpful! I’ll check out Eco Cotton Mills first.",
      "isSender": true,
    },
    {
      "text":
      "Great choice! They’re known for their high-quality repurposed cotton. Let me know if you need more help!",
      "isSender": false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ask SmartChain"),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                // Chat Date Indicator
                DateChip(
                  date: DateTime.now(),
                ),
                // Chat Bubbles with Product Images
                ...messages.map((message) {
                  if (message.containsKey("image")) {
                    return _buildProductSuggestionBubble(
                      message["text"],
                      message["image"],
                      message["isSender"],
                    );
                  } else {
                    return BubbleSpecialThree(
                      text: message["text"],
                      color: message["isSender"]
                          ? Colors.orange.shade900
                          : const Color(0xFFE8E8EE),
                      tail: true,
                      isSender: message["isSender"],
                      textStyle: TextStyle(
                        color:
                        message["isSender"] ? Colors.white : Colors.black,
                        fontSize: 16,
                      ),
                    );
                  }
                }).toList(),
                const SizedBox(height: 100),
              ],
            ),
          ),
          // Message Bar
          MessageBar(
            sendButtonColor: Colors.orange.shade900,
            onSend: (message) {
              setState(() {
                messages.add({"text": message, "isSender": true});
                messages.add({
                  "text":
                  "Thanks for your message! I'll respond shortly with more suggestions.",
                  "isSender": false
                });
              });
            },
            actions: [
              InkWell(
                child: const Icon(
                  Icons.add,
                  color: Colors.black,
                  size: 24,
                ),
                onTap: () {},
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: InkWell(
                  child: const Icon(
                    Icons.camera_alt,
                    color: Colors.green,
                    size: 24,
                  ),
                  onTap: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProductSuggestionBubble(String title, String imageUrl, bool isSender) {
    return Row(
      mainAxisAlignment:
      isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: isSender ? Colors.orange.shade900 : const Color(0xFFE8E8EE),
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(15),
              topRight: const Radius.circular(15),
              bottomLeft: isSender
                  ? const Radius.circular(15)
                  : const Radius.circular(0),
              bottomRight: isSender
                  ? const Radius.circular(0)
                  : const Radius.circular(15),
            ),
          ),
          width: 250,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 120,
              ),
              const SizedBox(height: 8),
              Text(
                title,
                style: TextStyle(
                  color: isSender ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
