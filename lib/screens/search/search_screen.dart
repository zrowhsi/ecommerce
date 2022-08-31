import 'package:flutter/material.dart';

import 'components/body.dart';
import 'components/search_form.dart';

class SearchScreen extends StatefulWidget {
  static String routeName = "/search_tag";
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0.5),
        title: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.withOpacity(0.6),
                  offset: const Offset(1.1, 1.1),
                  blurRadius: 5.0),
            ],
          ),
          child: SearchForm(controller: _controller),
        ),
      ),
      body: const SearchBody(),
    );
  }
}
