import 'package:flutter/material.dart';

class ImageField extends FormField<String> {
  const ImageField({required super.builder, super.key});

  @override
  FormFieldState<String> createState() => _ImageFieldState();
}

class _ImageFieldState extends FormFieldState<String> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
