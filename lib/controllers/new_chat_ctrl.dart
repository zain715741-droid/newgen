import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class NewChatCtrl extends GetxController {

  Stream<QuerySnapshot> get students =>
      FirebaseFirestore.instance
          .collection('student')
          .where(
            'uid',
            isNotEqualTo: FirebaseAuth.instance.currentUser!.uid,
          )
          .snapshots();
}