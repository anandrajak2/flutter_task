import 'package:flutter/material.dart';

class CustomTransition extends PageRouteBuilder {
  final Widget child;
  CustomTransition({required this.child})
      : super(
            pageBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> scondAnimation,
            ) =>
                child,
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> scondAnimation,
                Widget child) {
              const begin = Offset(0.0, 1.0);
              const end = Offset.zero;
              final tween = Tween(begin: begin, end: end);
              final offsetAnimation = animation.drive(tween);
              return SlideTransition(
                position: offsetAnimation,
                child: child,
              );
            });
}
