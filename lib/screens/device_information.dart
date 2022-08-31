import 'package:flutter/material.dart';

class DeviceInformationSoulScreen extends StatefulWidget {
  const DeviceInformationSoulScreen({Key? key}) : super(key: key);

  @override
  State<DeviceInformationSoulScreen> createState() =>
      _DeviceInformationSoulScreenState();
}

class _DeviceInformationSoulScreenState
    extends State<DeviceInformationSoulScreen> {
  final spacing = const SizedBox(
    height: 16.0,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Device Information")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(physics: const BouncingScrollPhysics(), children: [
          BaseWidget(widget: [
            Info(
              title: "width  : ",
              value: "${MediaQuery.of(context).size.width}",
              spacing: true,
            ),
            Info(
              title: "height: ",
              value: "${MediaQuery.of(context).size.height}",
            ),
          ]),
          spacing,
          BaseWidget(widget: [
            Info(
              title: "pixelRatio: ",
              value: "${MediaQuery.of(context).devicePixelRatio}",
              spacing: true,
            ),
            Info(
              title: "textScaleFactor: ",
              value: "${MediaQuery.of(context).textScaleFactor}",
              // spacing: true,
            ),
          ]),
          spacing,
          BaseWidget(widget: [
            Info(
              title: "orientation: ",
              value: "${MediaQuery.of(context).orientation}",
            ),
          ]),
          BaseWidget(widget: [
            Info(
              title: "isAnimationDisabled: ",
              value: "${MediaQuery.of(context).disableAnimations}",
            ),
          ]),
        ]),
      ),
    );
  }
}

class BaseWidget extends StatelessWidget {
  final List<Widget> widget;
  const BaseWidget({Key? key, required this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 16,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [...widget]),
        ));
  }
}

class Info extends StatelessWidget {
  final String title;
  final String value;
  final bool spacing;
  const Info(
      {Key? key,
      required this.title,
      required this.value,
      this.spacing = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      FittedBox(
        fit: BoxFit.scaleDown,
        child: Row(
          children: [
            Text(
              title,
              style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                  color: Colors.black),
            ),
            Text(
              value,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
          ],
        ),
      ),
      spacing == true
          ? const SizedBox(
              height: 16,
            )
          : const SizedBox()
    ]);
  }
}
