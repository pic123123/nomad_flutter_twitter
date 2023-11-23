import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nomad_flutter_twitter/features/profile/privacy_config_view_model.dart';
import 'package:provider/provider.dart';

//스테이징 삐꾸 커밋2
class PrivacyScreen extends StatefulWidget {
  const PrivacyScreen({super.key});

  @override
  State<PrivacyScreen> createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Privacy",
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
              FontAwesomeIcons.lock,
              color: Colors.black,
            ),
            trailing: Switch(
              value: false, // 이 값은 스위치의 상태를 관리하는 불린 변수여야 합니다.
              onChanged: (value) {
                setState(
                  () => {},
                );
                // 여기서 필요한 동작을 수행하세요.
              },
            ),
            title: const Text('Private profile'),
            onTap: () => {/* Do something */},
          ),
          SwitchListTile.adaptive(
            value: context.watch<PrivacyConfigViewModel>().dark,
            onChanged: (value) =>
                context.read<PrivacyConfigViewModel>().setDark(value),
            title: const Text("Dark Mode"),
            subtitle: const Text("all black."),
          ),
          ListTile(
            leading: const FaIcon(
              FontAwesomeIcons.bell,
              color: Colors.black,
            ),
            trailing: const FaIcon(
              FontAwesomeIcons.chevronRight,
            ),
            title: const Text('Mentions'),
            onTap: () => {/* Do something */},
          ),
          ListTile(
            leading: const FaIcon(
              FontAwesomeIcons.lock,
              color: Colors.black,
            ),
            trailing: const FaIcon(
              FontAwesomeIcons.chevronRight,
            ),
            title: const Text('Muted'),
            onTap: () => {},
          ),
          ListTile(
            leading: const FaIcon(
              FontAwesomeIcons.eyeSlash,
              color: Colors.black,
            ),
            trailing: const FaIcon(
              FontAwesomeIcons.chevronRight,
            ),
            title: const Text('Hidden Words'),
            onTap: () => {/* Do something */},
          ),
          ListTile(
            leading: const FaIcon(
              FontAwesomeIcons.userGroup,
              color: Colors.black,
            ),
            trailing: const FaIcon(
              FontAwesomeIcons.chevronRight,
            ),
            title: const Text('Profiles you follow'),
            onTap: () => {/* Do something */},
          ),
          const Divider(
            color: Colors.black26,
            thickness: 1,
          ),
          ListTile(
            trailing: const FaIcon(
              FontAwesomeIcons.arrowUpFromBracket,
              color: Colors.black,
            ),
            title: const Text(
              'Other privacy settings',
            ),
            subtitle: const Text(
              "Some settings, like restricy, apply to both Threads and Instagram and can be managed on Instagram.",
            ),
            onTap: () => {/* Do something */},
          ),
          ListTile(
            leading: const FaIcon(
              FontAwesomeIcons.circleXmark,
            ),
            trailing: const FaIcon(
              FontAwesomeIcons.arrowUpFromBracket,
              color: Colors.black,
            ),
            title: const Text(
              'Blocked profiles',
            ),
            onTap: () => {/* Do something */},
          ),
          ListTile(
            leading: const FaIcon(
              FontAwesomeIcons.heartCircleMinus,
            ),
            trailing: const FaIcon(
              FontAwesomeIcons.arrowUpFromBracket,
              color: Colors.black,
            ),
            title: const Text(
              'Hide likes',
            ),
            onTap: () => {/* Do something */},
          ),
        ],
      ),
    );
  }
}
