import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:todo/Firebase/firebase_functions.dart';
import 'package:todo/home/tasck_item.dart';
import 'package:todo/home/task_model.dart';

class TasckTab extends StatefulWidget {
  const TasckTab({super.key});

  @override
  State<TasckTab> createState() => _TasckTabState();
}

class _TasckTabState extends State<TasckTab> {
  DateTime selectedDateTime=DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffDFECDB),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          DatePicker(
            DateTime.now(),
            initialSelectedDate: selectedDateTime,
            selectionColor: Colors.blue,
            selectedTextColor: Colors.white,
            height: 90,
            locale: "en",
            onDateChange: (date) {
              selectedDateTime=date;
              setState(() {});
            },
          ),
          Expanded(
            child: StreamBuilder(
              stream: FirebaseFunctions.getTasks(selectedDateTime),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Column(
                    children: [
                      Text("Somthing went wrong"),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("Try again"),
                      ),
                    ],
                  );
                }
                var tasks =
                    snapshot.data!.docs.map((e) => e.data()).toList() ?? [];
                if (tasks.isEmpty) {
                 return Center(child: Text("No Tasks"),);
                }
                return ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    return TasckItem(model: tasks[index]);
                  },
                  itemCount: tasks.length,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
