import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/controller/weatherCont.dart';

class foreCast7 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    weatherController objWatch = context.watch<weatherController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '7-day forecast',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(23.0),
          child: ListView.builder(
              itemCount: objWatch.data!.length,
              itemBuilder: (context, index) => Card(
                    child: Container(
                      child: Row(children: [
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          '${objWatch.data![index].date}',
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text('${objWatch.data![index].temp} °C',
                            style: TextStyle(
                                fontWeight: FontWeight.w900, fontSize: 22)),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Text(
                            '${objWatch.data![index].status}',
                            style: TextStyle(fontWeight: FontWeight.w900),
                            overflow: TextOverflow.fade,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                      ]),
                      height: MediaQuery.of(context).size.height * .08,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                        objWatch.col,
                        objWatch.col.withOpacity(.3)
                      ])),
                    ),
                  )),
        ),
      ),
    );
  }
}
