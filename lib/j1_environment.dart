library j1_environment;

import "package:firebase_core/firebase_core.dart";
import "package:flutter/material.dart";
import "package:get_it/get_it.dart";
import "package:j1_crash_handler/j1_crash_handler.dart";
import "package:j1_logger/j1_logger.dart";
import "package:j1_router/j1_router.dart";

final locator = GetIt.instance;

abstract class J1Environment {
  final FirebaseOptions? firebaseOptions;
  final J1CrashHandler crashHandler;
  final J1Logger logger;
  final J1Router router;

  const J1Environment({
    required this.firebaseOptions,
    required this.crashHandler,
    required this.logger,
    required this.router,
  });

  Future<void> configure() async {
    if (firebaseOptions != null) {
      // coverage:ignore-start
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp(options: firebaseOptions);
      // coverage:ignore-end
    }

    crashHandler.configure();
    locator.registerSingleton<J1Logger>(logger);
    locator.registerSingleton<J1Router>(router);
  }
}
