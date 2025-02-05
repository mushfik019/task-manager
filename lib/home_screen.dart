import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/add_new_task_screen.dart';
import 'package:task_manager/widgets/custom_appbar.dart';
import 'package:task_manager/widgets/custom_item_list.dart';
import 'package:task_manager/widgets/summary_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    SummaryCard(
                      number: 9,
                      title: 'New Task',
                    ),
                    SummaryCard(
                      number: 9,
                      title: 'Progress',
                    ),
                    SummaryCard(
                      number: 9,
                      title: 'Completed',
                    ),
                    SummaryCard(
                      number: 9,
                      title: 'Canceled',
                    ),
                  ],
                ),
                CustomItemList(
                  title: 'Lorem Ipsum is simply dummy',
                  details: 'Description here...',
                  date: 'Date',
                  statusTitle: 'New',
                  bgColor: Colors.blue,
                  isScrollable: false,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddNewTaskScreen(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
