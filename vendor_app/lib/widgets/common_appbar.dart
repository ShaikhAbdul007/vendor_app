import 'package:flutter/material.dart';

class CommonAppbar extends StatelessWidget {
  final String title;
  final Widget body;
  final Widget? actionChild;
  final Widget? actionSecondChild;
  final Widget? leadingChildWidget;
  final bool isDrawerRequired;
  final bool isCenterTitle;
  const CommonAppbar(
      {super.key,
      required this.title,
      required this.body,
      this.actionChild,
      this.actionSecondChild,
      this.isDrawerRequired = false,
      this.isCenterTitle = false,
      this.leadingChildWidget});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: leadingChildWidget ??
            const SizedBox(
              height: 0,
              width: 0,
            ),
        centerTitle: isCenterTitle ? true : null,
        title: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(fontSize: 15, fontWeight: FontWeight.w600),
        ),
        actions: [
          actionChild ??
              const SizedBox(
                height: 0,
                width: 0,
              ),
          actionSecondChild ??
              const SizedBox(
                height: 0,
                width: 0,
              ),
        ],
      ),
      body: body,
      //drawer: isDrawerRequired ? const MyDrawer() : null,
    );
  }
}
