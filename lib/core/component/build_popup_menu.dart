import 'package:flutter/material.dart';

class MenuItem {
  final Widget? icon;
  final String text;
  final TextStyle? textStyle;
  final String value;

  MenuItem({
    this.icon,
    required this.text,
    this.textStyle,
    required this.value,
  });
}

class PopupMenuButtonCustom extends StatelessWidget {
  const PopupMenuButtonCustom({
    super.key,
    required this.onSelected,
    required this.items,
    this.backgroundColor,
    this.icon,
    this.width,
  });

  final void Function(String)? onSelected;
  final List<MenuItem> items;
  final Color? backgroundColor;
  final Widget? icon;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: Theme.of(context).primaryColor,
        ),
        color: backgroundColor,
      ),
      child: PopupMenuButton(
        color: backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
        onSelected: onSelected,
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(10), // Bo góc
        //   side: const BorderSide(color: Colors.red, width: 1), // Viền
        // ),
        itemBuilder: (BuildContext context) {
          return [
            ...items.map(
              (item) => PopupMenuItem(
                value: item.value,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    item.icon != null ? item.icon! : const SizedBox(),
                    item.icon != null
                        ? const SizedBox(width: 8.0)
                        : const SizedBox(),
                    Text(
                      item.text,
                      style: item.textStyle ??
                          Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
              ),
            )
          ];
        },
        icon: icon ?? const Icon(Icons.more_vert),
      ),
    );
  }
}
