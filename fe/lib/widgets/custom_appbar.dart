import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.black87,
      title: Text(
        title,
        style: const TextStyle(
            fontSize: 30,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_active,
            )),
        IconButton(
            onPressed: () async {
              SharedPreferences sf = await SharedPreferences.getInstance();
              sf.remove("accessToken");
              sf.remove("refreshToken");
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('App logs out in next session'),
                    actions: [
                      TextButton(
                          onPressed: () {
                            sf.remove("accessToken");
                            sf.remove("refreshToken");
                            context.pushNamed("splash");
                          },
                          child: Text('Confirm'))
                    ],
                  );
                },
              );
            },
            icon: const Icon(
              Icons.logout,
            ))
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(50);
}
