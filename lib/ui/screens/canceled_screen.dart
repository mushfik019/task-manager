import 'package:flutter/material.dart';
import 'package:task_manager/widgets/custom_appbar.dart';
import 'package:task_manager/widgets/custom_item_list.dart';

class CanceledScreen extends StatefulWidget {
  const CanceledScreen({super.key});

  @override
  State<CanceledScreen> createState() => _CanceledScreenState();
}

class _CanceledScreenState extends State<CanceledScreen> {
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
                statusTitle: 'Canceled',
                bgColor: Colors.red,
                isScrollable: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
