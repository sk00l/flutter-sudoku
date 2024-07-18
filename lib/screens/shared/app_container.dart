// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppContainer extends StatefulWidget {
  String? title;
  Icon? icon;
  AppContainer({
    super.key,
    this.title,
    this.icon,
  });

  @override
  State<AppContainer> createState() => _AppContainerState();
}

class _AppContainerState extends State<AppContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          widget.icon ?? const Icon(Icons.ac_unit),
          Text(widget.title ?? 'Title'),
        ],
      ),
    );
  }
}
