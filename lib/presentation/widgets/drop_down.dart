import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class DropdownButtonApp<T> extends StatefulWidget {
  const DropdownButtonApp({super.key,
    required this.items,
    required this.onChanged,
    this.maxHeight,
    this.width,
    this.height,
    this.radius,
  });

  final List<DropdownMenuItem<T>> items;
  final ValueChanged<T> onChanged;
  final double? maxHeight;
  final double? width;
  final double? height;
  final double? radius;

  @override
  State<DropdownButtonApp<T>> createState() => _DropdownButtonAppState<T>();

}

class _DropdownButtonAppState<T> extends State<DropdownButtonApp<T>> {
  T? selectedValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButton2(
      underline: SizedBox(),
      isExpanded: true,
      value: selectedValue,
      onChanged: (value) {
        if (value is T) {
          setState(() {selectedValue = value;});
          widget.onChanged(value);
        }
      },
      dropdownStyleData: DropdownStyleData(
        maxHeight: widget.maxHeight ?? 200,
        decoration: BoxDecoration(color: Colors.white),
      ),
      iconStyleData: IconStyleData(icon: Icon(Icons.arrow_drop_down)),
      buttonStyleData: ButtonStyleData(
        height: widget.height ?? 40,
        width: widget.width ?? double.infinity,
        padding: const EdgeInsets.only(left: 12, right: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.radius ?? 0),
          border: Border.all(color: Colors.grey.shade500),
          color: Colors.white,
        ),
      ),
      menuItemStyleData: const MenuItemStyleData(height: 40),
      hint: Text('Select item'),
      items: widget.items
    );
  }
}