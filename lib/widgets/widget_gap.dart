import 'package:flutter/material.dart';

class WidgetGap extends StatefulWidget {
  const WidgetGap(
      {super.key,
      this.content,
      this.callBackFunction,
      this.padding = const EdgeInsets.all(5),
      this.margin = const EdgeInsets.all(5),
      this.backgroundColor = Colors.grey});
  final String? content;
  final Function(String)? callBackFunction;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final Color backgroundColor;

  @override
  State<WidgetGap> createState() => _WidgetGapState();
}

class _WidgetGapState extends State<WidgetGap> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => widget.callBackFunction!(widget.content ?? ''),
      child: Container(
        margin: widget.margin,
        padding: widget.padding,
        decoration: BoxDecoration(
            color: widget.backgroundColor,
            borderRadius: const BorderRadius.all(Radius.circular(4))),
        child: Text(widget.content ?? ''),
      ),
    );
  }
}
