import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'dart:html' as html;

class AdminViewController{
  static final FirebaseStorage _storage = FirebaseStorage.instance;

  static Future<String> uploadImage({required Uint8List image, required String path})async{
    try{
      final ref = _storage.ref().child(path);
      final uploadTask = ref.putData(image);
      final snapshot = await uploadTask.whenComplete(() => null);
      final url = await snapshot.ref.getDownloadURL();
      return url;
    }catch(e){
      print("Error uploading image: $e");
      return "";
    }
  }


  static void launchUrl(url) async {
    html.window.open('${Uri.parse(url)}', '_blank');
  }

}


