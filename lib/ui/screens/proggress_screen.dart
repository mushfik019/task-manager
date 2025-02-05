import 'package:flutter/material.dart';
import 'package:task_manager/widgets/custom_appbar.dart';
import 'package:task_manager/widgets/custom_item_list.dart';

class ProgressScreen extends StatefulWidget {
  const ProgressScreen({super.key});

  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Column(
          children: [
            Expanded(
              child: CustomItemList(
                title: 'Lorem Ipsum is simply dummy',
                details: 'Description here...',
                date: 'Date',
                statusTitle: 'Progress',
                bgColor: Colors.purple,
                isScrollable: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
