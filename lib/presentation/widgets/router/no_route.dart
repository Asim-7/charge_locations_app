import 'package:flutter/material.dart';

/// Widget to display a no route found state
class NoRoute extends StatelessWidget {
  final String? name;
  const NoRoute({super.key, required this.name});
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('No route defined for ${name ?? "unknown"}'));
  }
}
