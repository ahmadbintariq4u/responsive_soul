import 'package:flutter_soul/flutter_soul.dart';
import 'package:logger/logger.dart';

final appConstants = AppConstants();

var logger = Logger(
  printer: PrettyPrinter(
      methodCount: 1,
      errorMethodCount: 0,
      lineLength: 120,
      colors: true,
      printEmojis: true,
      printTime: false),
);

var loggerWithError = Logger(
  printer: PrettyPrinter(
      methodCount: 12,
      errorMethodCount: 20,
      lineLength: 120,
      colors: true,
      printEmojis: true,
      printTime: false),
);
