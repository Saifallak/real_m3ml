import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class StorageClient {
  StorageReference storageReference;
  StorageUploadTask storageUploadTask;

  uploadImage(File galleryFile, String path) async {
    storageReference = FirebaseStorage.instance.ref().child(path);
    storageUploadTask = storageReference.putFile(galleryFile);

    final String imageUrl = await storageUploadTask.onComplete.then((task) async {
      return await task.ref.getDownloadURL();
    });
    return imageUrl.toString();
  }
}
