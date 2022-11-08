import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class GetWidgetOffset extends StatefulWidget {
  final Widget child;
  final Function(Offset offset) offset;

  const GetWidgetOffset({
    required this.child,
    required this.offset,
  });

  @override
  GetWidgetOffset_State createState() => GetWidgetOffset_State();
}

class GetWidgetOffset_State extends State<GetWidgetOffset> {
  GlobalKey widgetKey = GlobalKey();
  Offset offset = const Offset(0, 0);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      print("widgetKey.currentContext---------${widgetKey.currentContext}");
      final box = widgetKey.currentContext?.findRenderObject() as RenderBox;
      offset = box.localToGlobal(Offset.zero);
      widget.offset(offset);
    });
  }

  @override
  Widget build(BuildContext) {
    return Container(
      key: widgetKey,
      child: widget.child,
    );
  }
}
