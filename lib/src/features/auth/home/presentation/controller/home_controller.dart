import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:notes/src/features/auth/home/data/models/note_model.dart';

class HomeController extends GetxController{
  var notes = <NoteModel>[];
  final FirebaseFirestore _fireStore= FirebaseFirestore.instance;

  @override
  void onInit() {
    facthData();
    super.onInit();
  }

 void facthData() async {
    _fireStore.collection('notes').snapshots().listen((snapshot) {
      notes.clear();
      notes.addAll(snapshot.docs
          .map((e) => NoteModel.fromJson(e.data(), e.id))
          .toList());
      update();
    });
  }


  Future<void> addNote(String title, String description) async {
    await _fireStore.collection('notes').add({
      'title': title,
      'description': description,
      'createdAt': FieldValue.serverTimestamp(),
    });
    update();
  }

}