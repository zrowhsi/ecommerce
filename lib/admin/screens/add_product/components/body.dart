import 'dart:async';
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:ecommerce/constants/color_theme_const.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../components/default_button.dart';

import '../../../../constants/size_config.dart';
import '../../../../models/product.dart';
import '../../../services/api_services.dart';
import 'custom_textfield.dart';

class AddProductBody extends StatefulWidget {
  const AddProductBody({
    Key? key,
  }) : super(key: key);

  @override
  State<AddProductBody> createState() => _AddProductBodyState();
}

class _AddProductBodyState extends State<AddProductBody> {
  TextEditingController productNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController quantityController = TextEditingController();

  String category = 'Mobiles';
  final _addProductFormKey = GlobalKey<FormState>();
  File? _image;
  var imageResponse;
  @override
  void dispose() {
    super.dispose();
    productNameController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    quantityController.dispose();
  }

  List<String> productCategories = [
    'Mobiles',
    'Essentials',
    'Appliances',
    'Books',
    'Fashion'
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
          child: Column(
            children: [
              SizedBox(height: getProportionateScreenHeight(20)),
              _image != null ? showImageBox() : uploadImageBox(context),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              CustomTextField(
                controller: productNameController,
                hintText: 'Product Name',
              ),
              const SizedBox(height: 10),
              CustomTextField(
                controller: descriptionController,
                hintText: 'Description',
                maxLines: 7,
              ),
              const SizedBox(height: 10),
              CustomTextField(
                controller: priceController,
                hintText: 'Price',
              ),
              const SizedBox(height: 10),
              CustomTextField(
                controller: quantityController,
                hintText: 'Quantity',
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: DropdownButton(
                  value: category,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: productCategories.map((String item) {
                    return DropdownMenuItem(
                      value: item,
                      child: Text(item),
                    );
                  }).toList(),
                  onChanged: (String? newVal) {
                    setState(() {
                      category = newVal!;
                    });
                  },
                ),
              ),
              const SizedBox(height: 10),
              DefaultButton(
                text: 'Sell',
                press: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector uploadImageBox(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showChoiceDialog(context);
      },
      child: DottedBorder(
        borderType: BorderType.RRect,
        radius: const Radius.circular(10),
        dashPattern: const [10, 4],
        strokeCap: StrokeCap.round,
        child: Container(
          width: double.infinity,
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.folder_open,
                size: 40,
              ),
              const SizedBox(height: 15),
              Text(
                'Select Product Images',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey.shade400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Stack showImageBox() {
    return Stack(
      children: [
        Column(
          children: [
            SizedBox(
              width: getProportionateScreenWidth(200),
              height: getProportionateScreenWidth(200),
              child: Image.file(
                File(_image!.path),
                fit: BoxFit.cover,
              ),
            ),
            ElevatedButton(
              //if user click this button, user can upload image from gallery
              onPressed: () {
                imageResponse = addImage(_image!);
              },
              child: const Text('SAVE'),
            ),
          ],
        ),
        Positioned(
          right: 5.0,
          top: 5,
          child: InkWell(
            child: const Icon(
              Icons.remove_circle,
              size: 30,
              color: Colors.red,
            ),
            // This is where the _image value sets to null on tap of the red circle icon
            onTap: () {
              setState(
                () {
                  _image = null;
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              "Choose option",
              style: TextStyle(color: appPrimaryColor),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  const Divider(
                    height: 1,
                    color: appPrimaryColor,
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.pop(
                          context, pickImages(ImageSource.gallery, context));
                    },
                    title: const Text(
                      "Gallery",
                      style: TextStyle(color: appPrimaryColor),
                    ),
                    leading: const Icon(
                      Icons.account_box,
                      color: appPrimaryColor,
                    ),
                  ),
                  const Divider(
                    height: 1,
                    color: appPrimaryColor,
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.pop(
                          context, pickImages(ImageSource.camera, context));
                    },
                    title: const Text(
                      "Camera",
                      style: TextStyle(
                        color: appPrimaryColor,
                      ),
                    ),
                    leading: const Icon(
                      Icons.camera,
                      color: appPrimaryColor,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future pickImages(ImageSource inputSource, BuildContext context) async {
    final ImagePicker _picker = ImagePicker();

    final XFile? image = await _picker.pickImage(source: inputSource);

    setState(
      () {
        if (image != null) {
          _image = File(image.path);
        } else {
          print('No image selected.');
        }
      },
    );
  }
}
