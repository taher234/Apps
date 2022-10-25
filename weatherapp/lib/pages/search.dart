import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/controller/weatherCont.dart';

class search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    weatherController objWatch = context.watch<weatherController>();
    weatherController objRead = context.read<weatherController>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Search a city'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 40, horizontal: 10),
        child: TextField(
          onSubmitted: (value) {
            objRead.subm(value);
            Navigator.of(context).pop();
          },
          decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 23, horizontal: 20),
              hintText: 'Enter city name',
              label: Text('search'),
              labelStyle: TextStyle(color: Colors.black),
              fillColor: objWatch.col.withOpacity(.3),
              filled: true,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: BorderSide(width: 0, color: Colors.white))),
        ),
      ),
    );
  }
}
