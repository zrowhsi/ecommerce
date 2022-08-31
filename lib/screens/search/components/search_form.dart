import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants/size_config.dart';

class SearchForm extends StatelessWidget {
  const SearchForm({
    Key? key,
    required TextEditingController controller,
  })  : _controller = controller,
        super(key: key);

  final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      keyboardType: TextInputType.text,
      placeholder: 'Search product',
      placeholderStyle: TextStyle(
        color: const Color(0xffC4C6CC),
        fontSize: getProportionateScreenHeight(14),
        fontFamily: 'Brutal',
      ),
      controller: _controller,
      autofocus: true,
      clearButtonMode: OverlayVisibilityMode.always,
      // onChanged: (){},
      onSubmitted: (String value) {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => MySearchScreen(
        //       searchQuery: value,
        //       context: context,
        //       manual: "true",
        //     ),
        //   ),
        // );
      },
      prefix: Padding(
        padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
        child: Icon(
          Icons.search,
          size: getProportionateScreenHeight(18),
          color: Colors.black,
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white,
      ),
    );
  }
}
