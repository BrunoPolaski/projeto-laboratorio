import 'package:app_facul/app/presentation/layout/custom_size.dart';
import 'package:flutter/material.dart';

class CustomLayout extends StatelessWidget {
  final Widget child;
  final Widget? footer;
  final Widget? appBar;
  final Color? backgroundColor;
  final Color? bodyColor;
  final bool? isScrollable;
  final double? horizontalPadding;

  const CustomLayout({
    Key? key,
    required this.child,
    this.footer,
    this.appBar,
    this.backgroundColor = Colors.white,
    this.isScrollable = false,
    this.horizontalPadding,
    this.bodyColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double horizontalPadding = this.horizontalPadding ?? CustomWidth.custom(24);

    return SafeArea(
      child: LayoutBuilder(
        builder: ((context, constraints) {
          return Scaffold(
            backgroundColor: backgroundColor,
            resizeToAvoidBottomInset: true,
            body: CustomScrollView(
              physics: isScrollable! ? null : const NeverScrollableScrollPhysics(),
              slivers: [
                if(appBar != null) appBar!,
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Container(
                    margin: EdgeInsets.only(top: CustomHeight.custom(24)),
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