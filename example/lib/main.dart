import 'package:flutter/material.dart';
import 'package:flutter_soul/flutter_soul.dart';
import 'package:isar/isar.dart';
import 'package:logging/logging.dart';
import 'package:path_provider/path_provider.dart';

late final Logger log;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await _initApp();
  runApp(const MyApp());
  log.shout("Shout Log");
  log.fine("Fine Log");
  log.info("Info Log", "info");
  // logger.d("$appConstants");
  // logger.d("$appConstants");
}

_initApp() async {
  appConstants.setPadding = 20.0;
  appConstants.setRadius = 20.0;

  MyLogger logObj = MyLogger(useDB: true);
  log = logObj.log;

  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open(
    [MyLogCollectionSchema, MyLogSchema],
    directory: dir.path,
  );
  logObj.isar = isar;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Soul',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Soul'),
        actions: [
          GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/log");
              },
              child: const Icon(Icons.output_rounded)),
          kWidth
        ],
      ),
      body: ResponsiveSoul(
        autoManage: false,
        // xxl: _buildCard("XXL"),
        // xl: _buildCard("XL"),
        sm: ElevatedButton(
          child: const Text("test"),
          onPressed: () {
            log.severe('WE are connected with database successfully');
          },
        ),
        // md: _buildCard("MD"),
        // sm: _buildCard("SM"),
      ),
    );
  }

  _buildCard(String breakpointName) {
    return Center(
      child: Card(
        color: Colors.blue.shade700,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "Breakpoint $breakpointName",
            style: const TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
