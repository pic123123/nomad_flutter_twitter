# nomad_flutter_twitter

A new Flutter project.

MVVM Architecture
Model View ViewModel

### firebase

1. firebase login //kk42546878@gmail.com
2. dart pub global activate flutterfire_cli
   2설치중 worning
   Installed executable flutterfire.
   Warning: Pub installs executables into $HOME/.pub-cache/bin, which is not on your path.
   You can fix that by adding this to your shell's config file (.bashrc, .bash_profile, etc.):

export PATH="$PATH":"$HOME/.pub-cache/bin"

open ~/.zshrc
export PATH="$PATH":"$HOME/.pub-cache/bin"
source ~/.zshrc

3. flutterfire configure // create a new project nomad-flutter
   npm install -g firebase-tools

4. flutter pub add firebase_core
   flutterfire configure

5. flutter pub add firebase_auth
   flutterfire configure

6. flutter pub add cloud_firestore
   flutterfire configure

7. flutter pub add firebase_storage
   flutterfire configure

   lib/main.dart 파일에서 Firebase core 플러그인 및 앞에서 생성한 구성 파일을 가져옵니다.

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
또한 lib/main.dart 파일에서 구성 파일로 내보낸 DefaultFirebaseOptions 객체를 사용하여 Firebase를 초기화합니다.

```
await Firebase.initializeApp(
options: DefaultFirebaseOptions.currentPlatform,
);
```

8. firebase_core_platform_interface
   flutterfire configure

9. flutter clean & flutter pub get & flutterfire configure & pod repo update

### Error

'[ERROR:flutter/lib/ui/ui_dart_state.cc(198)] Unhandled Exception: PlatformException(channel-error, Unable to establish connection on channel., null, null)'

Platform Firebase App Id
web 1:555861975003:web:89272e3aee46ee68ec11fe
android 1:555861975003:android:55735e11b523b01bec11fe
ios 1:555861975003:ios:c404ab89ee998076ec11fe
macos 1:555861975003:ios:c404ab89ee998076ec11fe
