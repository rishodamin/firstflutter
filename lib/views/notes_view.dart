import 'package:flutter/material.dart';
import 'package:myapp/constant/routes.dart';
import 'package:myapp/enums/menu_actions.dart';
import 'package:myapp/services/auth/auth_service.dart';

class NotesView extends StatefulWidget {
  const NotesView({super.key});

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  @override
  Widget build(BuildContext context) {
    String? user = AuthService.firebase().currentUser?.email ?? "Stalker";
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: const Text('Main UI'),
        backgroundColor: Colors.blue[600],
        elevation: 5,
        shadowColor: Colors.grey,
        actions: [
          PopupMenuButton<MenuAction>(onSelected: (value) async {
            switch (value) {
              case MenuAction.logout:
                final shouldLogout = await showLogOutDialog(context);
                if (shouldLogout) {
                  await AuthService.firebase().logOut();
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    loginRoute,
                    (_) => false,
                  );
                }
                break;
            }
          }, itemBuilder: (context) {
            return const [
              PopupMenuItem<MenuAction>(
                  value: MenuAction.logout, child: Text('Log out')),
            ];
          })
        ],
      ),
      body: Center(
        child: Text(
          'Hi $user',
          style: const TextStyle(fontSize: 28),
        ),
      ),
    );
  }
}

Future<bool> showLogOutDialog(BuildContext context) {
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Sign out'),
        content: const Text('Are you sure you want to sign out?'),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text('Cancel')),
          TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: const Text('Log out')),
        ],
      );
    },
  ).then((value) => value ?? false);
}
