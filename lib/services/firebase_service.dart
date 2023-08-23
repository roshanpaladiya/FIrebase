import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseServices {
  static FirebaseDatabase database = FirebaseDatabase.instance;
  static FirebaseStorage storage = FirebaseStorage.instance;

  ///---------------------------------- Set Value ---------------------------------///

  static Future<void> addDataInFireBase(
      String addNew, Map<String, dynamic> value) async {
    String? key = database.ref(addNew).push().key;
    addNew = "$addNew/$key";
    DatabaseReference dataRef = database.ref(addNew);
    await dataRef.set(value);
  }

  ///--------------------------------- Get Value -----------------------------------///

  static Future<Map?> getAllData(String key) async {
    DatabaseReference reference = database.ref(key);
    DataSnapshot dataSnapshot = await reference.get();
    Map? getUser =
        dataSnapshot.value == null ? null : dataSnapshot.value as Map;
    return getUser;
  }

  ////  -----------------------------------  Set Image ----------------------------------------///

  static Future<String> uploadImage(String path, File? pickImage) async {
    Reference ref = storage.ref("image/$path");
    var uploadTask = await ref.putFile(pickImage!);
    return await uploadTask.ref.getDownloadURL();
  }
}
