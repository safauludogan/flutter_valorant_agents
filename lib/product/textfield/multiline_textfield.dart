import 'package:flutter/material.dart';
import 'package:flutter_valorant_agents/product/textfield/base/product_textfield.dart';

class MultilineTextfield extends StatefulWidget {
  const MultilineTextfield({
    this.controller,
    this.isLoading,
    this.errorText,
    this.onChanged,
    this.textInputAction,
    this.autofocus,
    this.focusNode,
    this.onFieldSubmitted,
    this.initialText,
    this.maxLength,
    this.hintText,
    super.key,
  });

  /// When is a loading enable false textfield
  final bool? isLoading;

  /// Show error text manually
  final String? errorText;

  /// [TextEditingController] text form controller
  final TextEditingController? controller;

  /// [TextInputAction] is input action like done or next
  final TextInputAction? textInputAction;

  ///TextFormField focus mode
  final bool? autofocus;

  ///TextFormField focus node
  final FocusNode? focusNode;

  /// Return onChanged text value
  final void Function(String)? onChanged;

  /// Work when on field submitted
  final void Function(String)? onFieldSubmitted;

  /// Initial text value
  final String? initialText;

  /// Max length of textfield
  final int? maxLength;

  /// Hint text
  final String? hintText;

  @override
  State<MultilineTextfield> createState() => _MultilineTextfieldState();
}

class _MultilineTextfieldState extends State<MultilineTextfield> {
  bool isFocused = false;

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (hasFocus) {
        setState(() {
          isFocused = hasFocus;
        });
      },
      child: ProductTextfield(
        enabled: !(widget.isLoading ?? false),
        errorText: widget.errorText,
        controller: widget.controller,
        onChanged: widget.onChanged,
        maxLength: widget.maxLength,
        keyboardType: TextInputType.multiline,
        hintText: widget.hintText,
        textInputAction: widget.textInputAction,
        autofocus: widget.autofocus,
        focusNode: widget.focusNode,
        onFieldSubmitted: widget.onFieldSubmitted,
        isMultiline: true,
        initialText: widget.initialText,
      ),
    );
  }
}
