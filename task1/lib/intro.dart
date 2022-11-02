import 'package:flutter/material.dart';
import 'package:task1/views/login_Register.dart';

class intro extends StatelessWidget {
  const intro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/ph2.jpg',
            height: double.infinity,
            width: double.infinity,
          ),
          Align(
            alignment: const Alignment(0, 0.3),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * .8,
              height: MediaQuery.of(context).size.height * .3,
              child: Column(
                children: [
                  Image.asset('assets/images/carrot.png'),
                  const SizedBox(height: 10),
                  Text(
                    'Welcome',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  Text(
                    'to our store',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Ger your groceries in as fast as one houre',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ],
              ),
            ),
          ),
          Align(
              alignment: Alignment(0, .6),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * .9,
                  height: MediaQuery.of(context).size.height * .07,
                  child: ElevatedButton(
                      onPressed: () => Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (_) => log_reg())),
                      child: Text(
                        'Get Started',
                        style: Theme.of(context).textTheme.headline5,
                      ))))
        ],
      ),
    );
  }
}
