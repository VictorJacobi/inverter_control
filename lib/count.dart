import 'package:flutter/material.dart';

/// A double as text with animation
class AnimationCount extends StatefulWidget {
  const AnimationCount(
      {Key? key,
        required this.count,
        this.fractionDigits = 2,
        required this.unit,
        required this.duration,
        this.style,
        this.unitScaleFactor,
        this.curve = Curves.linear})
      : super(key: key);

  /// The value itself
  final double count;

  /// How many fraction digits should be used, by default 2
  final int fractionDigits;

  /// Which unit should be used?
  final String? unit;

  /// The style used for [count] and [unit]
  final TextStyle? style;

  /// The scale factor used for [unit] only
  final double? unitScaleFactor;

  /// Duration of the animation
  final Duration duration;

  final Curve curve;

  @override
  _AnimatedCountState createState() => _AnimatedCountState();
}

class _AnimatedCountState extends State<AnimationCount>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  final firstBuild = true;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _animation = _controller;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (firstBuild) {
      _animation = Tween<double>(
        begin: _animation.value,
        end: widget.count,
      ).animate(CurvedAnimation(
        curve: widget.curve,
        parent: _controller,
      ));
      setState(() {});
      _controller.forward(from: 0);
    }
    return AnimatedBuilder(
      animation: _animation,
      builder: (BuildContext context, Widget? child) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              (_animation.value*100).toInt().toString(),
              style: widget.style,
              textScaleFactor: widget.unitScaleFactor,
            ),
            if (widget.unit != null) const SizedBox(width: 1),
            if (widget.unit != null)
              Text(
                widget.unit!,
                style: widget.style,
                textScaleFactor: widget.unitScaleFactor,
              )
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
