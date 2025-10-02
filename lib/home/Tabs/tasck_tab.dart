import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:todo/home/tasck_item.dart';

class TasckTab extends StatefulWidget {
  const TasckTab({super.key});

  @override
  State<TasckTab> createState() => _TasckTabState();
}

class _TasckTabState extends State<TasckTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffDFECDB),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          DatePicker(
            DateTime.now(),
            initialSelectedDate: DateTime.now(),
            selectionColor: Colors.blue,
            selectedTextColor: Colors.white,
            height: 90,
            locale: "en",
            onDateChange: (date) {
              // New date selected
              setState(() {});
            },
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(height: 12),
              itemBuilder: (context, index) {
                return TasckItem();
              },
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
