import 'package:flutter/material.dart';
import 'package:nomad_flutter_twitter/features/profile/privacy_config_model.dart';
import 'package:nomad_flutter_twitter/features/profile/privacy_config_repository.dart';

class PrivacyConfigViewModel extends ChangeNotifier {
  final PrivacyConfigRepository _repository;

  late final PrivacyConfigModel _model = PrivacyConfigModel(
    dark: _repository.isDark(),
  );

  PrivacyConfigViewModel(this._repository);

  bool get dark => _model.dark;

  void setDark(bool value) {
    _repository.setDark(value);
    _model.dark = value;
    notifyListeners();
  }
}
