import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/controller.dart';

enum Auth { login, register }

Map<String, String> _auData = {'username': '', 'email': '', 'password': ''};

class form extends StatelessWidget {
  const form({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var watch = context.watch<control>();
    var read = context.read<control>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //title
        Text(watch.au == Auth.login ? 'Loging' : 'Sign Up',
            style: Theme.of(context).textTheme.headline4),
        const SizedBox(
          height: 10,
        ),
        //subtitle
        Text(
            watch.au == Auth.login
                ? 'Enter your emails and password'
                : 'Enter your credentials to continue',
            style: Theme.of(context).textTheme.bodyText1),
        const SizedBox(
          height: 18,
        ),
        //in case of register
        if (watch.au == Auth.register)
          TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return 'invallid username';
              }
            },
            onSaved: (value) {
              _auData['username'] = value!;
            },
            decoration: const InputDecoration(label: Text('username')),
          ),
        const SizedBox(
          height: 20,
        ),
        //email
        TextFormField(
          decoration: const InputDecoration(label: Text('Email')),
          validator: (value) {
            if (value!.isEmpty || !(value.contains('@'))) {
              return 'invalid email';
            }
          },
          onSaved: (value) {
            _auData['email'] = value!;
          },
        ),
        const SizedBox(
          height: 20,
        ),
        //password
        TextFormField(
          validator: (value) {
            if (value!.isEmpty || value.length < 8) {
              return 'invalid password';
            }
          },
          onSaved: (value) {
            _auData['password'] = value!;
          },
          obscureText: context.watch<control>().obscu,
          decoration: InputDecoration(
              label: const Text('Password'),
              suffixIcon: IconButton(
                  onPressed: () => context.read<control>().changeObs(),
                  icon: Icon(context.watch<control>().obscu
                      ? Icons.visibility
                      : Icons.visibility_off))),
        ),
        const SizedBox(
          height: 20,
        ),
        watch.au == Auth.login
            ? Container(
                alignment: Alignment.centerRight,
                child: TextButton(
                    onPressed: () {}, child: const Text('Forgot Passsword?')))
            : Column(
                children: [
                  terms_Privacy('By continuing you agree to our ',
                      'Terms of Service', () {}),
                  terms_Privacy('and ', 'Privacy Policy', () {}),
                ],
              ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }

  // ignore: non_constant_identifier_names
  Widget terms_Privacy(String str, String button, Function() fun) {
    return Row(
      children: [
        Text(str),
        InkWell(
          onTap: fun,
          child: Text(
            button,
            style: const TextStyle(color: Colors.green),
          ),
        ),
      ],
    );
  }
}
