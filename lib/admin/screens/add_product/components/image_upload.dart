import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:http/http.dart' as http;

class ImageUpload extends StatefulWidget {
  @override
  _ImageUploadState createState() => _ImageUploadState();
}

class _ImageUploadState extends State<ImageUpload> {
  XFile? image;

  List _images = [];

  final ImagePicker picker = ImagePicker();

  //we can upload image from camera or from gallery based on parameter
  Future sendImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);
    // print(img.path);
    // var uri =
    //     "http://103.104.29.53:8095/ecommerce/api/auth/vendor/product/image/save";

    // var request = http.MultipartRequest('POST', Uri.parse(uri));

    // if (img != null) {
    //   var pic = await http.MultipartFile.fromPath("image", img.path);

    //   request.files.add(pic);

    //   await request.send().then((result) {
    //     http.Response.fromStream(result).then((response) {
    //       var message = jsonDecode(response.body);

    //       // show snackbar if input data successfully
    //       final snackBar = SnackBar(content: Text(message['message']));
    //       ScaffoldMessenger.of(context).showSnackBar(snackBar);

    //       //get new list images
    //       getImageServer();
    //     });
    //   }).catchError((e) {
    //     print(e);
    //   });
    // }
  }

  Future getImageServer() async {
    try {
      final response = await http.get(Uri.parse(
          'http://192.168.1.4/latihan/flutter_upload_image/list.php'));
      print(response.body);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        setState(() {
          _images = data;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    getImageServer();
  }

  //show popup dialog
  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: Text('Please choose media to select'),
            content: Container(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: [
                  ElevatedButton(
                    //if user click this button, user can upload image from gallery
                    onPressed: () {
                      Navigator.pop(context);
                      sendImage(ImageSource.gallery);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.image),
                        Text('From Gallery'),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    //if user click this button. user can upload image from camera
                    onPressed: () {
                      Navigator.pop(context);
                      sendImage(ImageSource.camera);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.camera),
                        Text('From Camera'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Upload Image'),
          actions: [
            IconButton(
              onPressed: () => myAlert(),
              icon: Icon(Icons.upload),
            )
          ],
        ),
        body: _images.length != 0
            ? GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: _images.length,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: EdgeInsets.all(10),
                    child: Image(
                      image: NetworkImage(
                          'http://192.168.1.4/latihan/flutter_upload_image/images/' +
                              _images[index]['image']),
                      fit: BoxFit.cover,
                    ),
                  );
                })
            : Center(
                child: Text("No Image"),
              ));
  }
}
