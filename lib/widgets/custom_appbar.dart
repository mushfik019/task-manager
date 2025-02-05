import 'package:flutter/material.dart';
import 'package:task_manager/data/models/auth_utils.dart';
import 'package:task_manager/ui/screens/auth/edit_profile_screen.dart';
import 'package:task_manager/ui/screens/auth/login_screen.dart';

class CustomAppbar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppbar({super.key});

  @override
  State<CustomAppbar> createState() => _CustomAppbarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _CustomAppbarState extends State<CustomAppbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 60,
      leading: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10, left: 16),
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditProfileScreen(),
                ));
          },
          child: CircleAvatar(
            backgroundImage: NetworkImage(AuthUtils.userInfo.data?.photo ?? ''),
            onBackgroundImageError: (_, __) {
              const Icon(Icons.person);
            },
          ),
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              '${AuthUtils.userInfo.data?.firstName} ${AuthUtils.userInfo.data?.lastName}'),
          Text(
            '${AuthUtils.userInfo.data?.email}',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
          ),
        ],
      ),
      actions: [
        TextButton(
            onPressed: () async {
              await AuthUtils.clearUserInfo();
              if (context.mounted) {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                  (route) => false,
                );
              }
            },
            child: Text(
              'Logout',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ))
      ],
    );
  }
}
