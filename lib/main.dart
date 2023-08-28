import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:marvel_app/data/repositories_implementation/comics_respository_impl.dart';
import 'package:marvel_app/data/services/remote/comics_service.dart';
import 'package:marvel_app/domian/repositories/comics_repository.dart';
import 'package:marvel_app/features/comics/controller/comics_controller.dart';
import 'package:marvel_app/features/series/controller/series_controller.dart';
import 'package:marvel_app/routes/app_routes.dart';
import 'package:marvel_app/theme/theme.dart';
import 'package:provider/provider.dart';

import 'constants/constants.dart';
import 'data/repositories_implementation/app_config_repository_impl.dart';

import 'data/repositories_implementation/failures_repository_impl.dart';
import 'data/repositories_implementation/onboarding_repository_impl.dart';

import 'data/repositories_implementation/series_repository_impl.dart';
import 'data/services/firebase/remote_config_service.dart';
import 'data/services/http/http.dart';
import 'data/services/local/failure_service.dart';
import 'data/services/local/onboarding_service.dart';
import 'data/services/remote/series_service.dart';
import 'domian/repositories/app_config_repository.dart';
import 'domian/repositories/onboarding_repository.dart';
import 'domian/repositories/series_repository.dart';
import 'features/failure/controller/failure_controller.dart';
import 'features/home/controller/home_controller.dart';
import 'features/offline/controller/network_controller.dart';
import 'features/onboarding /controller/onboarding_controller.dart';
import 'features/spash/page/splash_page.dart';
import 'package:http/http.dart' as http;

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final firebaseRemoteConfigService = RemoteConfigService(
    firebaseRemoteConfig: FirebaseRemoteConfig.instance,
    remoteConfigSettings: RemoteConfigSettings(
      fetchTimeout: const Duration(seconds: 30),
      minimumFetchInterval: Duration.zero,
    ),
  );

  await firebaseRemoteConfigService.init();

  final FailureRepositoryImpl failureRepositoryImpl = FailureRepositoryImpl(
    failureService: FailureService(),
  );

  final ComicsRepositoryImpl comicsRepositoryImpl = ComicsRepositoryImpl(
    comicsService: ComicsService(
      Http(
        baseUrl: 'https://gateway.marvel.com:443/',
        apiKey: '07bdac071e091d461743667cb86a3e95',
        client: http.Client(),
        hash: 'c0363af76c08e1b000405a8f1723fd00',
        ts: '1',
      ),
    ),
    failureRepositoryImpl: failureRepositoryImpl,
  );

  final SeriesRepositoryImpl seriesRepositoryImpl = SeriesRepositoryImpl(
    seriesService: SeriesService(
      Http(
        baseUrl: 'https://gateway.marvel.com:443/',
        apiKey: '07bdac071e091d461743667cb86a3e95',
        client: http.Client(),
        hash: 'c0363af76c08e1b000405a8f1723fd00',
        ts: '1',
      ),
    ),
    failureRepositoryImpl: failureRepositoryImpl,
  );

  final AppConfigRepositoryImpl appConfigRepositoryImpl =
      AppConfigRepositoryImpl(
    firebaseRemoteConfig: firebaseRemoteConfigService,
    failureRepositoryImpl: failureRepositoryImpl,
  );

  final OnboardingRepository onboardingRepositoryImpl =
      OnboardingRepositoryImpl(
    flutterSecureStorage: const FlutterSecureStorage(),
    failureRepositoryImpl: failureRepositoryImpl,
    onboardingService: OnboardingService(),
  );

  runApp(
    MultiProvider(
      providers: [
        Provider<AppConfigRepository>(
          create: (_) => appConfigRepositoryImpl,
        ),
        Provider<OnboardingRepository>(
          create: (_) => onboardingRepositoryImpl,
        ),
        Provider<ComicsRepository>(
          create: (_) => comicsRepositoryImpl,
        ),
        Provider<SeriesRepository>(
          create: (_) => seriesRepositoryImpl,
        ),
      ],
      child: ChangeNotifierProvider<HomeController>(
        create: (_) => HomeController(),
        child: ChangeNotifierProvider<FailureController>(
          create: (_) => FailureController(),
          child: ChangeNotifierProvider<NetworkController>(
            create: (_) => NetworkController(),
            child: ChangeNotifierProvider<OnboardingController>(
              create: (_) => OnboardingController(),
              child: ChangeNotifierProvider<ComicsController>(
                create: (_) => ComicsController(
                  comicsRepositoryImpl: comicsRepositoryImpl,
                ),
                child: ChangeNotifierProvider<SeriesController>(
                  create: (_) => SeriesController(
                    seriesRepositoryImpl: seriesRepositoryImpl,
                  ),
                  child: const MyApp(),
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: MaterialApp(
        title: titleApp,
        theme: mainTheme,
        routes: appRoutes,
        home: const SplashPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
