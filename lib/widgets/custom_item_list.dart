import 'package:flutter/material.dart';

class CustomItemList extends StatelessWidget {
  final String title, details, statusTitle, date;
  final Color bgColor;
  final bool isScrollable;
  const CustomItemList(
      {super.key,
      required this.title,
      required this.details,
      required this.date,
      required this.statusTitle,
      required this.bgColor,
      required this.isScrollable});

  @override
  Widget build(BuildContext context) {
    ScrollPhysics scrollPhysics = isScrollable
        ? AlwaysScrollableScrollPhysics()
        : NeverScrollableScrollPhysics();
    return ListView.builder(
      physics: scrollPhysics,
      shrinkWrap: true,
      itemCount: 20,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 12),
            tileColor: Colors.white,
            isThreeLine: true,
            title: Text(title),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(details),
                Text(date),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(33),
                      ),
                      color: bgColor,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 3, horizontal: 28),
                        child: Text(
                          statusTitle,
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.edit,
                            color: Color(0xff21bf73),
                            size: 22,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.delete_forever_outlined,
                            color: Colors.red,
                            size: 22,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
