import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo/home/task_model.dart';

class FirebaseFunctions {
static  CollectionReference<TaskModel> getTaskCollection() {
   return  FirebaseFirestore.instance
        .collection("Tasks")
        .withConverter<TaskModel>(
          fromFirestore: (snapshot, _) => TaskModel.fromJson(snapshot.data()!),
          toFirestore: (task, _) => task.toJson(),
        );
  }

  static Future<void> addTask(TaskModel model) {
    var collection=getTaskCollection();
    var docRef=collection.doc();
    model.id=docRef.id;
    return docRef.set(model);
  }

static Stream<QuerySnapshot<TaskModel>> getTasks(DateTime date){
   return getTaskCollection().where(
     "date",isEqualTo:DateUtils.dateOnly(date).millisecondsSinceEpoch
   ).snapshots();
  }
  static Future<void> deletTask(String id){
  return getTaskCollection().doc(id).delete();
  }
}
