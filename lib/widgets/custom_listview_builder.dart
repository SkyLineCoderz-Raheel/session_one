import 'package:flutter/material.dart';

class CustomListviewBuilder extends StatefulWidget {
  final IndexedWidgetBuilder itemBuilder;
  final int itemCount;
  final CustomDirection scrollDirection;
  final bool? scrollable;
  final bool? reverse;

  @override
  _CustomListviewBuilderState createState() => _CustomListviewBuilderState();

  CustomListviewBuilder({required this.itemBuilder, required this.itemCount, required this.scrollDirection, this.scrollable, this.reverse});
}

class _CustomListviewBuilderState extends State<CustomListviewBuilder> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      alignment: Alignment.topLeft,
      child: SingleChildScrollView(
        reverse: widget.reverse ?? false,
        physics: (widget.scrollable != null && widget.scrollable == false) ? NeverScrollableScrollPhysics() : BouncingScrollPhysics(),
        scrollDirection: widget.scrollDirection == CustomDirection.vertical ? Axis.vertical : Axis.horizontal,
        child: widget.scrollDirection == CustomDirection.vertical
            ? Column(
                children: List.generate(widget.itemCount, (index) => widget.itemBuilder(context, index)).toList(),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(widget.itemCount, (index) => widget.itemBuilder(context, index)).toList(),
              ),
      ),
    );
  }
}

enum CustomDirection { vertical, horizontal }
