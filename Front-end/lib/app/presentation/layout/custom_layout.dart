import 'package:app_facul/app/presentation/layout/custom_size.dart';
import 'package:flutter/material.dart';

class CustomLayout extends StatelessWidget {
  final Widget child;
  final Widget? footer;
  final AppBar? appBar;
  final Color? backgroundColor;
  final Color? bodyColor;
  final bool? isScrollable;
  final double? horizontalPadding;
  final Drawer? drawer;
  final Widget? floatingActionButton;

  const CustomLayout({
    Key? key,
    required this.child,
    this.footer,
    this.appBar,
    this.backgroundColor = Colors.white,
    this.isScrollable = false,
    this.horizontalPadding,
    this.bodyColor,
    this.drawer,
    this.floatingActionButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double horizontalPadding = this.horizontalPadding ?? CustomWidth.custom(24);

    return SafeArea(
      child: LayoutBuilder(
        builder: ((context, constraints) {
          return Scaffold(
            appBar: appBar,
            drawer: drawer,
            backgroundColor: backgroundColor,
            floatingActionButton: floatingActionButton,
            resizeToAvoidBottomInset: true,
            body: CustomScrollView(
              physics: isScrollable! ? null : const NeverScrollableScrollPhysics(),
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                    color: bodyColor,
                    child: Column(
                      children: [
                        Expanded(child: child),
                        if(footer != null) footer!,
                      ],
                    ),
                    
                  ),
                ),
              ],
            ),
          );
        }),
        
      ),
    );
  }

  
}