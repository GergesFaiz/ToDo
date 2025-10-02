import 'package:flutter/material.dart';

class AddTaskBottomSheet extends StatefulWidget {
  AddTaskBottomSheet({super.key});

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  DateTime chosenDate = DateTime.now();
  var titleController = TextEditingController();
  var DescriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Add new Task",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 26),
          TextFormField(
            controller: titleController,
            decoration: InputDecoration(
              label: Text(
                "Title",
                style: TextStyle(color: Colors.grey.shade700, fontSize: 20),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
                borderRadius: BorderRadius.circular(12),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          SizedBox(height: 26),
          TextFormField(
            controller: DescriptionController,
            decoration: InputDecoration(
              label: Text(
                "Description ",
                style: TextStyle(color: Colors.grey.shade700 , fontSize: 20),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
                borderRadius: BorderRadius.circular(12),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          SizedBox(height: 26),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "Select Time",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          SizedBox(height: 12),
          InkWell(
            onTap: () {
              selectDate(context);
            },
            child: Text(
              "${chosenDate.toString().substring(0, 10)}",
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w400,
                fontSize: 30,
              ),
            ),
          ),
          // Spacer(),
          SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              onPressed: () {},
              child: Text(
                "Add Task",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          SizedBox(height: 6),
        ],
      ),
    );
  }

  selectDate(BuildContext context) async {
    var selectedDate = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
      initialDate: chosenDate,
    );
    if (selectedDate != null) {
      chosenDate = selectedDate;
      setState(() {});
    }
  }
}
