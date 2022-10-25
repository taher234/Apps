import 'package:flutter/material.dart';
import 'package:newsapp/controller/newsProvider.dart';
import 'package:provider/provider.dart';

class search extends StatelessWidget {
  const search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    newsProvider objWatch = context.watch<newsProvider>();
    newsProvider objRead = context.watch<newsProvider>();
    return Scaffold(
        backgroundColor: objWatch.w,
        appBar: AppBar(
          backgroundColor: objWatch.w,
          elevation: 0,
          foregroundColor: objWatch.b,
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: TextField(
              style: TextStyle(color: objWatch.b),
              onSubmitted: (value) {
                objRead.sub(value);
                Navigator.of(context).pop();
              },
              decoration: InputDecoration(
                  hintText: 'search',
                  hintStyle: TextStyle(color: objWatch.b),
                  fillColor: Colors.grey.withOpacity(.4),
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(width: 0, color: objWatch.w))),
            ),
          ),
        ));
  }
}
