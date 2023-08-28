import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

import '../../../constants/constants.dart';
import '../../../domian/models/app_config_model.dart';
import '../../../utils/either/either.dart';
import '../../../utils/enums/failures.dart';

Map<String, dynamic> logs = {};

class RemoteConfigService {
  final FirebaseRemoteConfig _firebaseRemoteConfig;
  final RemoteConfigSettings _remoteConfigSettings;

  RemoteConfigService({
    required FirebaseRemoteConfig firebaseRemoteConfig,
    required RemoteConfigSettings remoteConfigSettings,
  })  : _firebaseRemoteConfig = firebaseRemoteConfig,
        _remoteConfigSettings = remoteConfigSettings;

  Future<void> init() async {
    try {
      _firebaseRemoteConfig.ensureInitialized();
      await _firebaseRemoteConfig.setConfigSettings(_remoteConfigSettings);
      _firebaseRemoteConfig.fetchAndActivate();
    } on FirebaseException catch (e) {
      logs = {
        'firebaseError': '$e',
      };
    }
  }

  Either<FailuresEnum, List<App>> getEventAppConfigJson() {
    List<App> listConfig = [];
    try {
      final result = _firebaseRemoteConfig.getString(lblRemoteConfigAppConfig);
      if (result.isNotEmpty) {
        Map<String, dynamic> valueMap = json.decode(result);
        final data = AppConfig.fromJson(valueMap);
        if (data.appConfig != null && data.appConfig!.isNotEmpty) {
          listConfig = data.appConfig!;
          return Either.right(
            listConfig,
          );
        } else {
          return Either.left(
            FailuresEnum.notConfigsFound,
          );
        }
      } else {
        return Either.left(
          FailuresEnum.network,
        );
      }
    } catch (e) {
      return Either.left(
        FailuresEnum.parseError,
      );
    }
  }
}
