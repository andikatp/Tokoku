import 'dart:io';

import 'package:amazon/common/widgets/custom_elevated_button.dart';
import 'package:amazon/common/widgets/custom_textfield.dart';
import 'package:amazon/constant/global_variable.dart';
import 'package:amazon/constant/utils.dart';
import 'package:amazon/features/admin/services/admin_services.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final TextEditingController _productName = TextEditingController();
  final TextEditingController _description = TextEditingController();
  final TextEditingController _price = TextEditingController();
  final TextEditingController _quantity = TextEditingController();
  final AdminServices adminServices = AdminServices();
  final _addProductFormKey = GlobalKey<FormState>();
  String _category = 'Mobiles';
  List<File> _images = [];

  final List<String> _productCategories = [
    'Mobiles',
    'Essentials',
    'Appliances',
    'Books',
    'Fashions',
  ];

  @override
  void dispose() {
    _productName.dispose();
    _description.dispose();
    _price.dispose();
    _quantity.dispose();
    super.dispose();
  }

  void _pickPhoto() async {
    List<File> res = await pickImages();
    setState(() => _images = res);
  }

  void _sellProduct() async {
    if (_addProductFormKey.currentState!.validate() && _images.isNotEmpty) {
      adminServices.sellProduct(
          ctx: context,
          msg: ScaffoldMessenger.of(context),
          name: _productName.text,
          description: _description.text,
          price: double.parse(_price.text),
          quantity: int.parse(_quantity.text),
          category: _category,
          images: _images);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration:
              const BoxDecoration(gradient: GlobalVariable.appBarGradient),
        ),
        centerTitle: true,
        title: const Text(
          'Add Product',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _addProductFormKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: GestureDetector(
                  onTap: _pickPhoto,
                  child: _images.isNotEmpty
                      ? CarouselSlider.builder(
                          itemCount: _images.length,
                          options: CarouselOptions(
                            height: 200,
                            autoPlay: true,
                            viewportFraction: 1,
                            enlargeCenterPage: false,
                          ),
                          itemBuilder: (context, index, realIndex) =>
                              Image.file(
                            _images[index],
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        )
                      : DottedBorder(
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(15),
                          dashPattern: const [10, 4],
                          padding: const EdgeInsets.all(10),
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12)),
                            child: SizedBox(
                              height: 200,
                              width: double.infinity,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.folder_open,
                                    size: 40,
                                  ),
                                  const SizedBox(height: 20),
                                  Text(
                                    'Select Product Image',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.grey[400]),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                ),
              ),
              CustomTextField(
                  controller: _productName, hintText: 'Product Name'),
              CustomTextField(
                  controller: _description,
                  hintText: 'Description',
                  maxLines: 7),
              CustomTextField(controller: _price, hintText: 'Price Name'),
              CustomTextField(controller: _quantity, hintText: 'Quantity Name'),
              SizedBox(
                width: double.infinity,
                child: DropdownButton(
                  value: _category,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: _productCategories
                      .map((String item) =>
                          DropdownMenuItem(value: item, child: Text(item)))
                      .toList(),
                  onChanged: (value) => setState(() => _category = value!),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: CustomButton(text: 'Sell', onPressed: _sellProduct),
              )
            ],
          ),
        ),
      ),
    );
  }
}
