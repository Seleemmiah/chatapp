import 'package:cloud_firestore/cloud_firestore.dart';

class ChatService {
  // get instance of the firestore
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<Map<String, dynamic>>> getUserStream() {
    // return a stream of user data
    return _firestore.collection('users').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        // go through each individual user
        final user = doc.data();

        return user;
      }).toList();
    });
  }

  // get user stream

  // send message

  // get messages stream
}
