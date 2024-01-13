import 'package:chat_app_demo/models/message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<List<Map<String, dynamic>>> getUsersStream() {
    return _firestore.collection('Users').snapshots().map((event) {
      return event.docs.map((e) {
        final user = e.data();
        return user;
      }).toList();
    });
  }

  //send msg
  Future<void> sendMessage(String receiverId, message) async {
    //current user info
    final String currentUserId = _auth.currentUser!.uid;
    final String currentUserEmail = _auth.currentUser!.email!;
    final Timestamp timestamp = Timestamp.now();

    //create message
    Message newMessage = Message(
      sendId: currentUserId,
      senderEmail: currentUserEmail,
      receiverId: receiverId,
      message: message,
      timestamp: timestamp,
    );

    //chat room id for two users
    List<String> ids = [currentUserId, receiverId];
    ids.sort(); //sorting to ensure two same user have same chat room.
    String chatRoomId = ids.join('-');

    //add message to database
    await _firestore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .add(newMessage.toMap());
  }

  //receive msg
  Stream<QuerySnapshot> getMessage(String userId, otherUserId) {
    //chat room
    List<String> ids = [userId, otherUserId];
    ids.sort(); //sorting to ensure two same user have same chat room.
    String chatRoomId = ids.join('-');

    return _firestore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .orderBy('timestamp', descending: false)
        .snapshots();
  }
}
