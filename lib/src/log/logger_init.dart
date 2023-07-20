import 'package:intl/intl.dart';
import 'package:isar/isar.dart';
import 'package:logging/logging.dart';

import '../../flutter_soul.dart';

/// A class to provide logging support for your application. set [useDB] to true if you want to store logs on local storage.
class MyLogger {
  final log = Logger('myName');
  late final Isar isar;

  MyLogger({bool useDB = false}) {
    Logger.root.level = Level.ALL;
    if (useDB) {
      registeredWithDB();
    } else {
      registeredWithoutDB();
    }
  }

  registeredWithoutDB() {
    Logger.root.onRecord.listen((record) {
      if (record.level == Level.SHOUT) {
        loggerWithError.e(record.message, record.error, record.stackTrace);
      } else if (record.level == Level.FINE) {
        logger.i(record.message);
      } else {
        logger.w(
          record.message,
        );
      }
    });
  }

  initIsar(Isar isar) async {
    this.isar = isar;
  }

  _getCurrentDate() {
    final date = DateTime.now();
    return DateFormat('yyyy-MM-dd').format(date);
  }

  registeredWithDB() {
    Logger.root.onRecord.listen((record) async {
      if (record.level == Level.SHOUT) {
        loggerWithError.e(record.message, record.error, record.stackTrace);
      } else if (record.level == Level.FINE) {
        logger.i(record.message);
      } else if (record.level == Level.INFO) {
        logger.w(
          record.message,
        );
      }
      final log = MyLog();
      log.message = record.message;
      log.level = record.level.toString();
      log.dateTime = record.time;

      final logCollection = MyLogCollection();
      logCollection.id = _getCurrentDate();
      logCollection.logs.add(log);

      await isar.writeTxn(() async {
        await isar.myLogs.put(log);
        await isar.myLogCollections.put(logCollection);

        await logCollection.logs.save();

        // logCollection.logs!.add(log);
      });
      // print('Stored in database');
    });
  }
}
