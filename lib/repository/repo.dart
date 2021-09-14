import 'package:cloud_firestore/cloud_firestore.dart';

abstract class Repo {
  var db = FirebaseFirestore.instance;
}
