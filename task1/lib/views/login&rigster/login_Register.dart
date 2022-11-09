// ignore: file_names
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task1/views/home/homeScreen.dart';

import '../../controllers/controller.dart';
import 'form.dart';

class log_reg extends StatelessWidget {
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    var watch = context.watch<control>();
    var read = context.read<control>();
    return Scaffold(
        body: SafeArea(
            child: Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Column(children: [
          Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height * .25,
            child: Image.asset(
              'assets/images/carrot2.png',
              height: 70,
              width: 70,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(25),
            child: form(),
          ),
          //button
          SizedBox(
            width: MediaQuery.of(context).size.width * .9,
            height: MediaQuery.of(context).size.height * .07,
            child: Builder(
                builder: (ctx) =>
                    buttonAuth(ctx, watch.au, () => _submit(context))),
          ),
          const SizedBox(
            height: 10,
          ),
          //in case of have account or not
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(watch.au == Auth.login
                  ? 'Don\'t have an account?'
                  : 'Already have an account?'),
              TextButton(
                  onPressed: () => read.SwitchAuth(),
                  child: Text(watch.au == Auth.login ? 'Sign up' : 'Sign in'))
            ],
          )
        ]),
      ),
    )));
  }

  void _submit(BuildContext ctx) {
    if (!(formKey.currentState!.validate())) {
      return;
    } else {
      formKey.currentState?.save();
      Navigator.of(ctx)
          .pushReplacement(MaterialPageRoute(builder: (_) => homeScreen()));
    }
  }

  ElevatedButton buttonAuth(BuildContext ctx, var cond, Function() fun) {
    return ElevatedButton(
      onPressed: fun,
      child: Text(cond == Auth.login ? 'Login' : 'Sign up'),
    );
  }
}
