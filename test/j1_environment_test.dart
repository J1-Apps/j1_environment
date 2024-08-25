import "package:firebase_core/firebase_core.dart";
import "package:flutter_test/flutter_test.dart";
import "package:j1_crash_handler/j1_crash_handler.dart";
import "package:j1_environment/j1_environment.dart";
import "package:j1_logger/j1_logger.dart";
import "package:j1_router/j1_router.dart";

class _TestEnvironment extends J1Environment {
  @override
  FirebaseOptions? get firebaseOptions => null;

  @override
  J1CrashHandler get crashHandler => const LocalCrashHandler();

  @override
  J1Logger get logger => LocalLogger();

  @override
  J1Router get router => GoRouter();
}

void main() {
  group("J1 Environment", () {
    test("configures common dependencies", () {
      _TestEnvironment().configure();

      expect(locator.get<J1Logger>() is LocalLogger, true);
      expect(locator.get<J1Router>() is GoRouter, true);
    });
  });
}
