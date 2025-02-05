import 'package:flutter/material.dart';
import 'package:task_manager/widgets/custom_appbar.dart';
import 'package:task_manager/widgets/custom_item_list.dart';

class CompletedScreen extends StatefulWidget {
  const CompletedScreen({super.key});

  @override
  State<CompletedScreen> createState() => _CompletedScreenState();
}

class _CompletedScreenState extends State<CompletedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: Column(
            children: [
              Expanded(
                child: CustomItemList(
                  title: 'Lorem Ipsum is simply dummy',
                  details: 'Description here...',
                  date: 'Date',
                  statusTitle: 'Completed',
                  bgColor: Color(0xff21bf73),
                  isScrollable: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
