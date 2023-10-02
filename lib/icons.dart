import 'package:flutter/material.dart';

class Downloading extends StatefulWidget {
  const Downloading({super.key});

  @override
  State<Downloading> createState() => _DownloadingState();
}

class _DownloadingState extends State<Downloading>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController _animationController1;
  late Animation<double> _translate;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..repeat();
    _animationController1 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1300))
      ..repeat(reverse: true);

    _translate = Tween<double>(begin: 200, end: -200).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.slowMiddle));

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _animationController1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, _) {
        return Container(
          height: 200,
          width: 200,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            border: Border.all(
                color: Colors.green.withOpacity(_animationController1.value),
                width: 6),
            shape: BoxShape.circle,
            color: Colors.black,
            boxShadow: [
              BoxShadow(
                color: Colors.green.withOpacity(0.4),
                blurRadius: 10,
                spreadRadius: 10,
              ),
            ],
          ),
          child: Stack(
            children: [
              Positioned(
                top: -_translate.value,
                left: 0,
                right: 0,
                bottom: _translate.value,
                child: CustomPaint(
                  painter: DownloadIconPainter(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class DownloadIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.1
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(Offset(size.width * 0.5, size.height * 0.25),
        Offset(size.width * 0.5, size.height * 0.75), paint);
    canvas.drawLine(Offset(size.width * 0.3, size.height * 0.5),
        Offset(size.width * 0.5, size.height * 0.75), paint);
    canvas.drawLine(Offset(size.width * 0.7, size.height * 0.5),
        Offset(size.width * 0.5, size.height * 0.75), paint);
  }

  @override
  bool shouldRepaint(DownloadIconPainter oldDelegate) => false;
}

class DownloadingFailed extends StatefulWidget {
  const DownloadingFailed({super.key});

  @override
  State<DownloadingFailed> createState() => _DownloadingFailedState();
}

class _DownloadingFailedState extends State<DownloadingFailed>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _translate;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    _translate = Tween<double>(begin: 200, end: 0).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.easeInOutQuint));
    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, _) {
        return Container(
          height: 200,
          width: 200,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.red.withOpacity(1), width: 6),
            shape: BoxShape.circle,
            color: Colors.black,
            boxShadow: [
              BoxShadow(
                color: Colors.red.withOpacity(0.4),
                blurRadius: 10,
                spreadRadius: 10,
              ),
            ],
          ),
          child: Stack(
            children: [
              Positioned(
                top: -_translate.value,
                left: 0,
                right: 0,
                bottom: _translate.value,
                child: CustomPaint(
                  painter: DownloadFailedIconPainter(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class DownloadFailedIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.1
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(Offset(size.width * 0.3, size.height * 0.3),
        Offset(size.width * 0.7, size.height * 0.7), paint);
    canvas.drawLine(Offset(size.width * 0.7, size.height * 0.3),
        Offset(size.width * 0.3, size.height * 0.7), paint);
  }

  @override
  bool shouldRepaint(DownloadFailedIconPainter oldDelegate) => false;
}

class DownloadingComplete extends StatefulWidget {
  const DownloadingComplete({super.key});

  @override
  State<DownloadingComplete> createState() => _DownloadingCompleteState();
}

class _DownloadingCompleteState extends State<DownloadingComplete>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _translate;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    _translate = Tween<double>(begin: -200, end: 0).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.easeInOutQuint));
    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, _) {
        return Container(
          height: 200,
          width: 200,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.green.withOpacity(1), width: 6),
            shape: BoxShape.circle,
            color: Colors.black,
            boxShadow: [
              BoxShadow(
                color: Colors.green.withOpacity(0.4),
                blurRadius: 10,
                spreadRadius: 10,
              ),
            ],
          ),
          child: Stack(
            children: [
              Positioned(
                top: -_translate.value,
                left: 0,
                right: 0,
                bottom: _translate.value,
                child: CustomPaint(
                  painter: DownloadCompleteIconPainter(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class DownloadCompleteIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.1
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(Offset(size.width * 0.3, size.height * 0.55),
        Offset(size.width * 0.45, size.height * 0.7), paint);
    canvas.drawLine(Offset(size.width * 0.45, size.height * 0.7),
        Offset(size.width * 0.7, size.height * 0.35), paint);
  }

  @override
  bool shouldRepaint(DownloadCompleteIconPainter oldDelegate) => false;
}
