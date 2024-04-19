// ignore_for_file: avoid_print
import 'package:logging/logging.dart';

String definition(dynamic obj) {
  final definition = obj.toString();

  if (definition == "Instance of '${obj.runtimeType}'") {
    return obj.runtimeType.toString();
  }

  return definition;
}

class AppLogger {
  final logger = Logger.root;

  static bool _showFullLogs = false;

  static AppLogger? _instance;

  static AppLogger get instance {
    if (_instance == null) {
      throw Exception("AppLogger must be initialized. Please call init()");
    }

    return _instance!;
  }

  AppLogger._internal() {
    logger.level = Level.ALL;
    logger.onRecord.listen((LogRecord rec) {
      var error = "";

      if (rec.error is Exception) {
        error = "Exception: ${rec.error}";
      } else if (rec.error is Error) {
        error = "Error: ${rec.error}";
      } else if (rec.error != null) {
        error = rec.error.toString();
      }

      if (_showFullLogs) {
        _printLongMessages(
            '${rec.level.name}: ${rec.time}: ${rec.message} $error');
      } else {
        print("${rec.level.name}: ${rec.time}: ${rec.message} $error");
      }

      if (rec.stackTrace != null) {
        print(rec.stackTrace);
      }
    });
  }

  static void init() {
    _instance?.logger.clearListeners();

    _instance = AppLogger._internal();
  }

  static void showFullLogs(bool showFullLogs) {
    _showFullLogs = showFullLogs;
  }

  void warn(str, {String? tag, Object? error, StackTrace? stackTrace}) =>
      _log(Level.WARNING, str, tag: tag, error: error, stackTrace: stackTrace);

  void severe(str, {String? tag, Object? error, StackTrace? stackTrace}) =>
      _log(Level.SEVERE, str, tag: tag, error: error, stackTrace: stackTrace);

  void info(str, {String? tag, Object? error, StackTrace? stackTrace}) =>
      _log(Level.INFO, str, tag: tag, error: error, stackTrace: stackTrace);

  void config(str, {String? tag}) => _log(Level.CONFIG, str, tag: tag);

  void fine(str, {String? tag}) => _log(Level.FINE, str, tag: tag);

  void call(str, {String? tag}) => _log(Level.FINEST, str, tag: tag);

  void _log(Level level, str,
      {String? tag, Object? error, StackTrace? stackTrace}) {
    if (tag != null) {
      str = "[$tag] $str";
    }

    if (stackTrace == null && error is Error) {
      stackTrace = error.stackTrace;
    }

    logger.log(level, str, error, stackTrace);
  }
}

// ignore: unused_element
void _printLongMessages(String text) {
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}
