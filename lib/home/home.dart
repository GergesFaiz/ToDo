import 'package:flutter/material.dart';
import 'package:todo/home/Tabs/setting_tab.dart';
import 'package:todo/home/Tabs/tasck_tab.dart';
import 'package:todo/home/add_task_bottomSheet.dart';

class HomeScreen extends StatefulWidget {
  static const String routName = "HomeScreen";

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Color(0xffDFECDB),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "ToDo",
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return Container(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: AddTaskBottomSheet());
            },
          );
        },
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.white, width: 4),
          borderRadius: BorderRadiusGeometry.circular(25),
        ),
        backgroundColor: Colors.blue,
        child: Icon(Icons.add, color: Colors.white, size: 30),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        color: Colors.white,
        height: 84,
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.blue,
          currentIndex: index,
          onTap: (value) {
            index = value;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.task), label: "Tasck"),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "Setting",
            ),
          ],
        ),
      ),
      body: tabs[index],
    );
  }

  List<Widget> tabs = [TasckTab(), SettingTab()];
}
