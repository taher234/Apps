// ignore: file_names
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/controller/weatherCont.dart';
import 'package:weatherapp/pages/search.dart';
import 'package:weatherapp/pages/weather.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    weatherController objWatch = context.watch<weatherController>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: objWatch.col,
        title: Text('Weather'),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => search())),
            icon: Icon(Icons.search),
          )
        ],
      ),
      body: SafeArea(
        child: objWatch.data == null
            ? Padding(
                padding: const EdgeInsets.all(50.0),
                child: Center(
                  child: Text(
                    'There is no weather start searching now...',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                ),
              )
            : weather(),
      ),
    );
  }
}
