import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderHistoryPage extends StatefulWidget {
  const OrderHistoryPage({super.key});

  @override
  State<OrderHistoryPage> createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  final List<Map<String, dynamic>> orders = [
    {
      "productName": "100% Organic Cotton",
      "orderDate": "Nov 10, 2024",
      "quantity": 50,
      "totalPrice": 250000,
      "status": "Delivered",
    },
    {
      "productName": "Soft Cotton Sheets",
      "orderDate": "Nov 8, 2024",
      "quantity": 30,
      "totalPrice": 120000,
      "status": "Shipped",
    },
    {
      "productName": "Durable Cotton Yarn",
      "orderDate": "Nov 6, 2024",
      "quantity": 100,
      "totalPrice": 500000,
      "status": "Processing",
    },
    {
      "productName": "Bleached Cotton Fabric",
      "orderDate": "Nov 4, 2024",
      "quantity": 25,
      "totalPrice": 75000,
      "status": "Cancelled",
    },
    {
      "productName": "Natural Raw Cotton",
      "orderDate": "Nov 2, 2024",
      "quantity": 60,
      "totalPrice": 300000,
      "status": "Delivered",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Name
                  Text(
                    order["productName"],
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Order Date
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Order Date: ${order["orderDate"]}",
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      // Status
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: _getStatusColor(order["status"]),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          order["status"],
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  // Quantity and Price
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Quantity: ${order["quantity"]} kg",
                        style: const TextStyle(fontSize: 14),
                      ),
                      Text(
                        "Total: ${order["totalPrice"]} UZS",
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  // View Details Button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => OrderDetailsPage(order: order),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange.shade800,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Text("View Details", style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // Status Color Helper
  Color _getStatusColor(String status) {
    switch (status) {
      case "Delivered":
        return Colors.green;
      case "Shipped":
        return Colors.blue;
      case "Processing":
        return Colors.orange;
      case "Cancelled":
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}

class OrderDetailsPage extends StatelessWidget {
  final Map<String, dynamic> order;

  const OrderDetailsPage({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Details"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              order["productName"],
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "Order Date: ${order["orderDate"]}",
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "Quantity: ${order["quantity"]} kg",
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Text(
              "Total Price: \$${order["totalPrice"]}",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "Status: ${order["status"]}",
              style: TextStyle(
                fontSize: 16,
                color: _getStatusColor(order["status"]),
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 50, vertical: 15),
                  backgroundColor: Colors.orange.shade800,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text("Back to Orders"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Status Color Helper for Details Page
  Color _getStatusColor(String status) {
    switch (status) {
      case "Delivered":
        return Colors.green;
      case "Shipped":
        return Colors.blue;
      case "Processing":
        return Colors.orange;
      case "Cancelled":
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
