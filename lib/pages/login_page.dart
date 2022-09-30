import 'package:catlog_flutter/utils/routes.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // const LoginPage({Key? key}) : super(key: key);
  String name = "";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
      // Route route=MaterialPageRoute(builder:(context)=>HomePage());
      // Navigator.pushReplacement(context, route);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset(
                "assets/images/hey.png",
                fit: BoxFit.fill,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Welcome $name",
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                          hintText: "Enter Username",
                          labelText: "Username",
                          border: OutlineInputBorder()),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Username cannot be empty";
                        } else {
                          return null;
                        }
                      },
                      onChanged: (value) {
                        name = value;
                        setState(() {});
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                          hintText: "Enter Password",
                          labelText: "Password",
                          border: OutlineInputBorder()),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password cannot be empty";
                        }
                        else if(value.length<8){
                          return "Password must be at least 8 characters long";
                        }
                        else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Material(
                      color: Colors.deepPurple,
                      borderRadius:
                          BorderRadius.circular(changeButton ? 50 : 5),
                      child: InkWell(
                        onTap: () => moveToHome(context),
                        child: AnimatedContainer(
                          width: changeButton ? 50 : 150,
                          height: 50,
                          alignment: Alignment.center,
                          duration: const Duration(seconds: 1),
                          child: changeButton
                              ? const Icon(
                                  Icons.done,
                                  color: Colors.white,
                                )
                              : const Text("Login",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
