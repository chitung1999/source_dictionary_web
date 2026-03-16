import 'package:flutter/material.dart';
import 'package:learning_english_web/core/constants/color_constants.dart';


class ListviewApp extends StatefulWidget {
  const ListviewApp({super.key, required this.itemCount, required this.itemBuilder, required this.separatorBuilder, this.thickness, this.padding});
  final int itemCount;
  final double? thickness;
  final double? padding;
  final NullableIndexedWidgetBuilder itemBuilder;
  final IndexedWidgetBuilder separatorBuilder;

  @override
  State<ListviewApp> createState() => _ListviewAppState();
}

class _ListviewAppState extends State<ListviewApp> {
  late final ScrollController _scrollCtrl;

  @override
  void initState() {
    super.initState();
    _scrollCtrl = ScrollController();
  }

  @override
  void dispose() {
    _scrollCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RawScrollbar(
      controller: _scrollCtrl,
      thumbVisibility: true,
      trackVisibility: true,
      interactive: true,
      thickness: widget.thickness,
      radius: const Radius.circular(10),
      thumbColor: ColorConstants.hint,
      trackBorderColor: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.only(right: widget.padding ?? 0),
        child: ListView.separated(
          controller: _scrollCtrl,
          itemCount: widget.itemCount,
          shrinkWrap: true,
          itemBuilder: widget.itemBuilder,
          separatorBuilder: widget.separatorBuilder
        ),
      ),
    );
  }
}