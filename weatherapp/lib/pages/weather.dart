import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/controller/weatherCont.dart';

import '7forecast.dart';

class weather extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    weatherController obj = context.watch<weatherController>();
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [obj.col, obj.col.withOpacity(.3)])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                obj.cityNam ?? '',
                style: Theme.of(context).textTheme.headline4,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'update at ${DateFormat().add_Hms().format(DateTime.now())}',
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.network(
                    'http:${obj.data![0].icon}',
                    width: MediaQuery.of(context).size.width * .25,
                    height: MediaQuery.of(context).size.height * .1,
                  ),
                  Text(
                    '${obj.data![0].temp}',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('min temp : ${obj.data![0].minTemp}'),
                      Text('max temp : ${obj.data![0].maxTemp}')
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                '${obj.data![0].status}',
                style: Theme.of(context).textTheme.headline5,
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                height: MediaQuery.of(context).size.height * .3,
                width: MediaQuery.of(context).size.width * .8,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.white.withOpacity(.3),
                          Colors.white.withOpacity(.1)
                        ])),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        col(
                            context,
                            'real feel c',
                            context
                                .watch<weatherController>()
                                .data![0]
                                .realFeelC),
                        const SizedBox(width: 110),
                        col(
                            context,
                            'humidity',
                            context
                                .watch<weatherController>()
                                .data![0]
                                .humidity
                                .toDouble()),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        col(
                            context,
                            'real feel f',
                            context
                                .watch<weatherController>()
                                .data![0]
                                .realFeelF),
                        const SizedBox(width: 100),
                        col(
                            context,
                            'pressure',
                            context
                                .watch<weatherController>()
                                .data![0]
                                .pressure_mb),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        col(
                            context,
                            'wind kph',
                            context
                                .watch<weatherController>()
                                .data![0]
                                .wind_kph),
                        const SizedBox(width: 100),
                        col(
                            context,
                            'wind mph',
                            context
                                .watch<weatherController>()
                                .data![0]
                                .wind_mph),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Builder(
                builder: (context) => SizedBox(
                  width: MediaQuery.of(context).size.width * .8,
                  height: MediaQuery.of(context).size.height * .07,
                  child: ElevatedButton(
                      onPressed: () => Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) => foreCast7())),
                      child: Text('7 days foreCast')),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Column col(BuildContext context, String st, double res) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(st),
        const SizedBox(
          height: 10,
        ),
        Text(
          '$res',
          style: Theme.of(context).textTheme.headline5,
        ),
      ],
    );
  }
}
