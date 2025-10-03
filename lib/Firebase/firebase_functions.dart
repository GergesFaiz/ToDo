import 'package:cloud_firestore/cloud_firestore.dart';
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

  static void addTack(TaskModel model) {
    var collection=getTaskCollection();
    var docRef=collection.doc();
    model.id=docRef.id;
    docRef.set(model);
  }
}
