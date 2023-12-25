import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

/// * Area for stateProvider

class DropDownWidget extends ConsumerStatefulWidget {
  const DropDownWidget(
      {super.key,
      required this.items,
      required this.onSelect,
      this.defaultBgColor = true,
     });
  final List<String> items;
  final Function(String?) onSelect;
  final bool defaultBgColor;


  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends ConsumerState<DropDownWidget> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2<String>(
      isExpanded: true,
      decoration: InputDecoration(
        filled: true,
        fillColor: widget.defaultBgColor ? Colors.grey.shade300 : Colors.white,
        contentPadding: const EdgeInsets.symmetric(vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      items: widget.items
          .map((item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ))
          .toList(),
      validator: (value) {
        if (value == null) {
          return 'Please select';
        }
        return null;
      },
      onChanged: widget.onSelect,
      buttonStyleData: const ButtonStyleData(
        padding: EdgeInsets.only(right: 8),
      ),
      iconStyleData: const IconStyleData(
        icon: Icon(
          Icons.arrow_drop_down,
          color: Colors.black45,
        ),
        iconSize: 24,
      ),
      dropdownStyleData: DropdownStyleData(
        maxHeight: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      menuItemStyleData: const MenuItemStyleData(
        padding: EdgeInsets.symmetric(horizontal: 16),
      ),
    );
  }
}

