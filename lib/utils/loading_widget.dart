import 'package:flutter/material.dart';

class LoadingFeedback extends StatelessWidget {
  const LoadingFeedback(
      {required this.isLoading, required this.child, super.key});

  final bool isLoading;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      child,
      if (isLoading)
        const ModalBarrier(
          dismissible: false,
          color: Colors.black54,
        ),
      if (isLoading)
        const Center(
          child: CircularProgressIndicator(),
        ),
    ]);
  }
}
