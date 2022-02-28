import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FireBaseServiceDetail {
  static final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  static final FirebaseAuth authUser = FirebaseAuth.instance;
  static final FirebaseStorage storage = FirebaseStorage.instance;
}
