import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  final bool automaticimplyineleading;
  final Widget? title;
  final Widget? leadingWidget;
  final double? toolBarHeight;
  final Color? backgroundcolor;
  final Color? leadingcolor;
  final Color? textcolor;
  final Function()? onTap;
  final List<Widget>? actionwidgets;
  CustomAppBar({
    this.toolBarHeight,
    this.leadingWidget,
    this.automaticimplyineleading = true,
    this.title,
    this.backgroundcolor,
    this.leadingcolor,
    this.textcolor,
    this.actionwidgets,
    this.onTap,
    Key? key,
  })  : preferredSize = Size.fromHeight(toolBarHeight??70),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      toolbarHeight: toolBarHeight,
      backgroundColor: backgroundcolor ?? Colors.transparent,
      titleSpacing: 0,
      title:title,
      leading: leadingWidget??IconButton(
        onPressed: () => Navigator.pop(context),
        icon:  Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFFD9D9D9),
          ),
          height: 42,
          width: 42,

          child: const Center(
            child: Icon(
              Icons.arrow_back,
              // color: kDesignColor,
            ),
          ),
        ),
      ),
      actions: actionwidgets,
    );
  }
}
