import 'package:flutter/widgets.dart';

mixin LoadingFeedbackMixin<T extends StatefulWidget> on State<T> {
  // Indicates whether there is an ongoing async request or not
  bool isLoading = false;

  void setLoading(bool value) {
    setState(() {
      isLoading = value;
    });
  }
}
