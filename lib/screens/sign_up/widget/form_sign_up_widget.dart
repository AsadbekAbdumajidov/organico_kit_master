import 'package:flutter/material.dart';
import 'package:organico_kit_master/components/sizeconfig.dart';
import 'package:organico_kit_master/core/sign_const.dart';
import 'package:organico_kit_master/provider/eye_provider.dart';
import 'package:provider/provider.dart';
import '../../../provider/them_provider.dart';

class FormSignUpWidget extends StatelessWidget {
  const FormSignUpWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textColor = context.watch<DarkVsLightProvider>().textColor;
    return Form(
      key: SignUpConst.formKey1,
      child: Column(
        children: [
          Padding(
              padding: EdgeInsets.only(top: he(25)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: he(10)),
                    child: Text(
                      "Full Name",
                      style: TextStyle(
                          color: textColor,
                          fontWeight: FontWeight.bold,
                          fontFamily: "nunito",
                          fontSize: 18),
                    ),
                  ),
                  TextFormField(
                    controller: SignUpConst.name,
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(40),
                          ),
                        ),
                        prefixIcon: const Icon(Icons.person),
                        hintStyle: TextStyle(color: textColor),
                        hintText: "  Full Name"),
                    validator: (v) =>
                        v!.isEmpty ? "Do not leave a username!" : null,
                  ),
                ],
              )),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: he(10), top: he(15)),
                child: Text(
                  "Email",
                  style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: "nunito",
                      fontSize: 18),
                ),
              ),
              TextFormField(
                controller: SignUpConst.email,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    errorBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(40),
                      ),
                      borderSide: BorderSide(color: Colors.red.shade800),
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(40),
                      ),
                    ),
                    prefixIcon: const Icon(Icons.email),
                    hintText: "  Email"),
                validator: (value) {
                  if (SignUpConst.email.text.isEmpty) {
                    return "Don't leave your email blank!";
                  } else if (!RegExp(
                          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                      .hasMatch(value!)) {
                    return "email format incorrect!";
                  }
                  return null;
                },
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: he(10), top: he(15)),
                child: Text(
                  "Password",
                  style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: "nunito",
                      fontSize: 18),
                ),
              ),
              TextFormField(
                controller: SignUpConst.pass,
                keyboardType: TextInputType.number,
                obscureText:
                    context.watch<EyeProvider>().boolean == true ? true : false,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(40),
                      ),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        context.read<EyeProvider>().eyefunc();
                      },
                      icon: Icon(
                        context.watch<EyeProvider>().boolean == true
                            ? Icons.remove_red_eye
                            : Icons.remove_red_eye_outlined,
                        color: textColor,
                      ),
                    ),
                    prefixIcon: const Icon(Icons.lock_clock),
                    hintText: "  Password"),
                validator: (v) {
                  if (SignUpConst.pass.text.isEmpty) {
                    return "Do not leave a password!";
                  } else if (SignUpConst.pass.text.length != 6) {
                    return "Let the password be 6 digits";
                  }
                  return null;
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
