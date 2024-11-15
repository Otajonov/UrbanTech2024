import 'package:flutter/material.dart';

class AddMaterialPage extends StatefulWidget {
  const AddMaterialPage({super.key});

  @override
  State<AddMaterialPage> createState() => _AddMaterialPageState();
}

class _AddMaterialPageState extends State<AddMaterialPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _selectedType = 'Fresh'; // Default type
  String _selectedShipping = 'Self Shipping'; // Default shipping option
  double? _shippingPrice; // Shipping price for self-shipping
  List<String> _tags = []; // Material tags

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _shippingPriceController = TextEditingController();
  final TextEditingController _tagsController = TextEditingController();

  void _addTag() {
    final tag = _tagsController.text.trim();
    if (tag.isNotEmpty && !_tags.contains(tag)) {
      setState(() {
        _tags.add(tag);
      });
    }
    _tagsController.clear();
  }

  void _removeTag(String tag) {
    setState(() {
      _tags.remove(tag);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Material"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Material Title
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: "Material Title",
                  hintText: "Enter material name",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Title is required";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Type Selector
              DropdownButtonFormField<String>(
                value: _selectedType,
                onChanged: (value) {
                  setState(() {
                    _selectedType = value!;
                  });
                },
                items: const [
                  DropdownMenuItem(value: 'Fresh', child: Text('Fresh')),
                  DropdownMenuItem(value: 'Repurposed', child: Text('Repurposed')),
                  DropdownMenuItem(value: 'Consumable', child: Text('Consumable')),
                ],
                decoration: const InputDecoration(
                  labelText: "Type",
                  border: OutlineInputBorder(),
                ),
              ),
              if (_selectedType == 'Fresh')
                const Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: Text(
                    "New, unused materials directly from the producer.",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              if (_selectedType == 'Repurposed')
                const Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: Text(
                    "Used or partially used materials that can be repurposed.",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              if (_selectedType == 'Consumable')
                const Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: Text(
                    "One-time use materials like oil or raw consumables.",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              const SizedBox(height: 16),

              // Price Input
              TextFormField(
                controller: _priceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: _selectedType == 'Fresh'
                      ? "Exact Price"
                      : "Exact or Approximate Price",
                  hintText: _selectedType == 'Fresh'
                      ? "Enter the exact price"
                      : "Enter the price (e.g., 1000 or ~1000)",
                  border: const OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Price is required";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Image Uploader
              const Text("Upload Product Image"),
              const SizedBox(height: 8),
              ElevatedButton.icon(
                onPressed: () {
                  // Handle image upload
                },
                icon: const Icon(Icons.upload),
                label: const Text("Choose Image"),
              ),
              const SizedBox(height: 16),

              // Material Tags
              const Text("Material Tags"),
              Wrap(
                spacing: 8.0,
                children: _tags
                    .map((tag) => Chip(
                  label: Text(tag),
                  onDeleted: () => _removeTag(tag),
                ))
                    .toList(),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _tagsController,
                      decoration: const InputDecoration(
                        hintText: "Enter a tag",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: _addTag,
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Industry Selector
              DropdownButtonFormField<String>(
                value: null,
                onChanged: (value) {
                  // Handle industry selection
                },
                items: const [
                  DropdownMenuItem(value: 'Manufacturing', child: Text('Manufacturing')),
                  DropdownMenuItem(value: 'Construction', child: Text('Construction')),
                  DropdownMenuItem(value: 'Agriculture', child: Text('Agriculture')),
                  DropdownMenuItem(value: 'Energy', child: Text('Energy')),
                ],
                decoration: const InputDecoration(
                  labelText: "Industry",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              // Shipping Options
              DropdownButtonFormField<String>(
                value: _selectedShipping,
                onChanged: (value) {
                  setState(() {
                    _selectedShipping = value!;
                    if (_selectedShipping != 'Self Shipping') {
                      _shippingPriceController.clear();
                    }
                  });
                },
                items: const [
                  DropdownMenuItem(value: 'Self Shipping', child: Text('Self Shipping')),
                  DropdownMenuItem(value: 'SmartChain Shipping', child: Text('SmartChain Shipping')),
                ],
                decoration: const InputDecoration(
                  labelText: "Shipping Method",
                  border: OutlineInputBorder(),
                ),
              ),
              if (_selectedShipping == 'Self Shipping')
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: TextFormField(
                    controller: _shippingPriceController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Shipping Price",
                      hintText: "Enter shipping price",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              const SizedBox(height: 24),

              // Submit Button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Handle form submission
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  ),
                  child: const Text("Add Material"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
