import 'package:flutter/material.dart';

class ItemDrawer extends StatefulWidget {
  Icon icon;
  String title;
  Function() onPressed;
  bool hasDivider;
  ItemDrawer(
      {super.key,
      required this.icon,
      required this.title,
      required this.onPressed,
      required this.hasDivider});

  @override
  State<ItemDrawer> createState() => _ItemDrawerState();
}

class _ItemDrawerState extends State<ItemDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ListTile(
            onTap: widget.onPressed,
            leading: widget.icon,
            title: Text(widget.title,style: const TextStyle(fontSize: 14),),
          ),
          const SizedBox(height: 5,),
          Visibility(
            visible: widget.hasDivider,
            child: const Divider(
              height: 4,
            ))
        ],
      ),
    );
  }
}
