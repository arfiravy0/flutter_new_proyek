import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

final formKey = GlobalKey<FormState>();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    final String statisEmail= 'arfira@gmail.com';
    final String statisPassword = 'veyfira';

class _LoginPageState extends State<LoginPage> {
  Widget build(BuildContext context) {
    
    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
          backgroundColor: Colors.blueAccent,
        ),

        //body
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.person, size: 100, color: Colors.blueAccent),
                SizedBox(height: 20),
                //kolom email
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if(value==null||value.isEmpty) {
                      return 'Email tidak boleh kosong';
                    }
                    if (!RegExp(r'^[^@]+@[^@]+.[^@]+').hasMatch(value)) {
                    return 'Masukkan email yang valid';
                  }
                  },
                ),
                //kolom password
                SizedBox(height: 20),
                TextFormField(

                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                   validator: (value) {
                    if(value==null||value.isEmpty) {
                      return 'Passwort tidak boleh kosong';
                    }
                    if (value.length<6) {
                    return 'Masukkan Passwort yang valid';
                  }
                  return null;
                  },
                  obscureText: true,
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      if (emailController.text == statisEmail &&
                      passwordController.text == statisPassword) {
                        Navigator.pushNamed(context, '/home', arguments: {
                          'email' : emailController.text,
                          'password' : passwordController.text
                        });
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                          'Email atau passwort salah',
                          textAlign: TextAlign.center,
                        )));
                      

                      }
                    }
                  },
                  child: Text('Login'),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.restorablePushNamed(context, '/register');
                    },
                    child: Text('Belum punya akun? daftar'))
              ],
            ),
          ),
        ));
  }
}