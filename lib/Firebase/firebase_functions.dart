import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo/home/task_model.dart';

import '../user_model.dart';

class FirebaseFunctions {
  static CollectionReference<UserModel> getUserCollection() {
    return FirebaseFirestore.instance
        .collection(UserModel.collectionName)
        .withConverter<UserModel>(
          fromFirestore: (snapshot, _) => UserModel.fromJson(snapshot.data()!),
          toFirestore: (user, _) => user.toJson(),
        );
  }

  static CollectionReference<TaskModel> getTaskCollection() {
    return FirebaseFirestore.instance
        .collection(TaskModel.collectionName)
        .withConverter<TaskModel>(
          fromFirestore: (snapshot, _) => TaskModel.fromJson(snapshot.data()!),
          toFirestore: (task, _) => task.toJson(),
        );
  }

  static Future<void> addUser(UserModel user) {
    var collection = getUserCollection();
    var docRef = collection.doc(user.id);
    return docRef.set(user);
  }

  static Future<void> addTask(TaskModel model) {
    var collection = getTaskCollection();
    var docRef = collection.doc();
    model.id = docRef.id;
    return docRef.set(model);
  }

  static Stream<QuerySnapshot<TaskModel>> getTasks(DateTime date) {
    return getTaskCollection()
        .where(
          "date",
          isEqualTo: DateUtils.dateOnly(date).millisecondsSinceEpoch,
        )
        .snapshots();
  }

  static Future<void> deletTask(String id) {
    return getTaskCollection().doc(id).delete();
  }
  static bool isValidEmail(String email) {
    return RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$").hasMatch(email);
  }
  static void createUserAccount(
      String userName,
      String email,
      String phone,
      String password,
      ) async {
    if (!isValidEmail(email)) {
      print('❌ الإيميل غير صالح: $email');
      return;
    }

    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      UserModel user = UserModel(
        id: credential.user?.uid ?? "",
        email: email,
        userName: userName,
        phone: phone,
      );
      addUser(user);
      print('✅ تم إنشاء الحساب بنجاح');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('❌ كلمة المرور ضعيفة');
      } else if (e.code == 'email-already-in-use') {
        print('❌ الإيميل مستخدم بالفعل');
      } else {
        print('❌ خطأ Firebase: ${e.message}');
      }
    } catch (e) {
      print('❌ خطأ غير متوقع: $e');
    }
    // }
    // static void createUserAccount(
    //   String phone,
    //   String userName,
    //   String email,
    //   String password,
    // ) async {
    //   try {
    //     final credential = await FirebaseAuth.instance
    //         .createUserWithEmailAndPassword(email: email, password: password);
    //     UserModel user = UserModel(
    //       id: credential.user?.uid ?? "",
    //       email: email,
    //       userName: userName,
    //       phone: phone,
    //     );
    //     addUser(user);
    //   } on FirebaseAuthException catch (e) {
    //     if (e.code == 'weak-password') {
    //       print('The password provided is too weak.');
    //     } else if (e.code == 'email-already-in-use') {
    //       print('The account already exists for that email.');
    //     }
    //   } catch (e) {
    //     print(e);
    //   }
    // }
  }
  static login(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
}
