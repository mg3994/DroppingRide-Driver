import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
   final EdgeInsetsGeometry margin;
  final double borderRadius;
  final Color boxShadowColor;
  final double blurRadius;
  final Offset boxShadowOffset;
  final Color? color;
  final Border? border;
  final double? width;
  final double? height;
  // final double? maxWidth;
  // final double? maxHeight;
  // final double? minWidth;
  // final double? minHeight;
  final BoxConstraints? constraints;
  final AlignmentGeometry? alignment;

  const CustomCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(16.0),
    this.margin = const EdgeInsets.all(1.0),
    this.borderRadius = 2.0,
    this.boxShadowColor = const Color(0x1A000000), // Colors.black.withOpacity(0.1)
    this.blurRadius = 5.0,
    this.boxShadowOffset = const Offset(0, 2),
    this.color ,
    this.border, this.width, this.height, 
    // this.maxWidth, this.maxHeight, this.minWidth, this.minHeight, 
    this.constraints, this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
     
      constraints: constraints,
      alignment: alignment,
      margin:margin,
      padding: padding,
      decoration: BoxDecoration(
        border: (border != null)? border:null ,
        color: color ?? Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: boxShadowColor,
            blurRadius: blurRadius,
            offset: boxShadowOffset,
          ),
        ],
      ),
      child: child,
    );
  }
}
