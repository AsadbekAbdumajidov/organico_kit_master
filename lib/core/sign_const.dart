import 'package:flutter/material.dart';

class SignInConst {
  static var formKey = GlobalKey<FormState>();
  static final TextEditingController login = TextEditingController();
  static final TextEditingController password = TextEditingController();
}
class SignUpConst {
  static var formKey1 = GlobalKey<FormState>();
  static final TextEditingController name = TextEditingController();
  static final TextEditingController email = TextEditingController();
  static final TextEditingController pass = TextEditingController();
}
class EditConst {
  static var editKey = GlobalKey<FormState>();
  static final TextEditingController name = TextEditingController();
  static final TextEditingController phone = TextEditingController();
  static final TextEditingController adress = TextEditingController();
}