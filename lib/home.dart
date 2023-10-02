import 'package:animated_download_icon/icons.dart';
import 'package:flutter/material.dart';

enum Child { downloading, failed, completed }

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Child child = Child.downloading;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            getChild(child),
            const SizedBox(height: 100),
            Container(
              color: Colors.white10,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: SegmentedButton(
                segments: const [
                  ButtonSegment(
                    value: Child.downloading,
                    label: Text('Downloading'),
                  ),
                  ButtonSegment(
                    value: Child.failed,
                    label: Text('Failed'),
                  ),
                  ButtonSegment(
                    value: Child.completed,
                    label: Text('Completed'),
                  ),
                ],
                selected: {child},
                onSelectionChanged: (value) =>
                    setState(() => child = value.first),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getChild(Child child) {
    switch (child) {
      case Child.downloading:
        return const Downloading();
      case Child.failed:
        return const DownloadingFailed();
      case Child.completed:
        return const DownloadingComplete();
      default:
        return const Downloading();
    }
  }
}
