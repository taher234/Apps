// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:newsapp/controller/newsProvider.dart';
import 'package:provider/provider.dart';

import 'news.dart';
import 'search.dart';

class home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    newsProvider objWatch = context.watch<newsProvider>();
    newsProvider objRead = context.watch<newsProvider>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: objWatch.w,
        leading: Switch(
            value: objWatch.isSwitch, onChanged: (val) => objRead.swit(val)),
        elevation: 0,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'News',
              style: TextStyle(
                  fontSize: 21, color: objWatch.b, fontWeight: FontWeight.w600),
            ),
            Text('Cloud',
                style: TextStyle(
                    fontSize: 21,
                    color: Colors.yellow,
                    fontWeight: FontWeight.w600))
          ],
        ),
        actions: [
          IconButton(
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => search())),
              icon: Icon(
                Icons.search,
                color: objWatch.b,
              ))
        ],
      ),
      body: SafeArea(
        child: FutureBuilder(
            future: objWatch.service.getNews(objWatch.st),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                objWatch.articls = snapshot.data;
                return cardNews();
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            }),
      ),
    );
  }
}
