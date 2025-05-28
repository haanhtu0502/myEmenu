import 'package:emenu/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BuildCountQty extends StatefulWidget {
  const BuildCountQty({
    super.key,
    this.width,
    this.height,
    this.padding,
    required this.value,
    required this.onChanged,
    this.minValue = 0,
  });

  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final int value;
  final Function(int) onChanged;
  final int minValue;

  @override
  State<BuildCountQty> createState() => _BuildCountQtyState();
}

class _BuildCountQtyState extends State<BuildCountQty> {
  final ValueNotifier<int> _value = ValueNotifier<int>(0);

  @override
  void initState() {
    _value.value = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      padding: widget.padding ??
          const EdgeInsets.symmetric(horizontal: 2, vertical: 0),
      decoration: BoxDecoration(
        color: const Color(0x4DFF6F2C),
        borderRadius: BorderRadius.circular(36),
        border: Border.all(
          color: Colors.transparent,
        ),
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(
              Icons.remove_circle,
              color: Colors.white,
            ),
            onPressed: () {
              if (_value.value > widget.minValue) {
                _value.value--;
                widget.onChanged(_value.value);
              }
            },
          ),
          const SizedBox(width: 12),
          ValueListenableBuilder(
            valueListenable: _value,
            builder: (context, value, child) {
              return Text(
                _value.value.toString(),
                style: context.titleSmall,
              );
            },
          ),
          const SizedBox(width: 12),
          IconButton(
            icon: const Icon(
              Icons.add_circle,
              color: Colors.white,
            ),
            onPressed: () {
              _value.value++;
              widget.onChanged(_value.value);
            },
          ),
        ],
      ),
    );
  }
}
