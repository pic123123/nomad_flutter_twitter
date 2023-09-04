import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Setting",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          ListTile(
            leading: const FaIcon(
              FontAwesomeIcons.userPlus,
              color: Colors.black,
            ),
            title: const Text('Follow and invite friends'),
            onTap: () => {/* Do something */},
          ),
          ListTile(
            leading: const FaIcon(
              FontAwesomeIcons.bell,
              color: Colors.black,
            ),
            title: const Text('Notifications'),
            onTap: () => {/* Do something */},
          ),
          ListTile(
            leading: const FaIcon(
              FontAwesomeIcons.lock,
              color: Colors.black,
            ),
            title: const Text('Privacy'),
            onTap: () => {/* Do something */},
          ),
          ListTile(
            leading: const FaIcon(
              FontAwesomeIcons.circleUser,
              color: Colors.black,
            ),
            title: const Text('Account'),
            onTap: () => {/* Do something */},
          ),
          ListTile(
            leading: const FaIcon(
              FontAwesomeIcons.lifeRing,
              color: Colors.black,
            ),
            title: const Text('Help'),
            onTap: () => {/* Do something */},
          ),
          ListTile(
            leading: const FaIcon(
              FontAwesomeIcons.circleInfo,
              color: Colors.black,
            ),
            title: const Text('About'),
            onTap: () => {/* Do something */},
          ),
          const Divider(
            color: Colors.black26,
            thickness: 1,
          ),
          ListTile(
            trailing: const FaIcon(
              FontAwesomeIcons.spinner,
              color: Colors.black,
            ),
            title: const Text(
              'Log out',
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
            onTap: () => {/* Do something */},
          ),
        ],
      ),
    );
  }
}
