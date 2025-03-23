// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_valorant_agents/product/extension/context_extension.dart';
import 'package:flutter_valorant_agents/product/textfield/base/decoration/product_textfield_decoration.dart';
import 'package:flutter_valorant_agents/product/utility/size/widget_size.dart';
import 'package:flutter_valorant_agents/ui/styles/text_styles.dart';
import 'package:gen/gen.dart';

class ProductTextfield extends StatefulWidget {
  const ProductTextfield({
    super.key,
    this.validator,
    this.isMultiline = false,
    this.formatters,
    this.hintText,
    this.keyboardType,
    this.controller,
    this.onChanged,
    this.initialText,
    this.maxLength,
    this.obscureText,
    this.enabled,
    this.errorText,
    this.prefixIcon,
    this.textInputAction,
    this.autofocus,
    this.focusNode,
    this.onFieldSubmitted,
    this.decoration,
    this.onTap,
    this.textAlign,
  });

  final bool isMultiline;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? formatters;
  final String? hintText;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final String? initialText;
  final String? errorText;
  final int? maxLength;
  final bool? obscureText;
  final bool? autofocus;
  final bool? enabled;
  final Widget? prefixIcon;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final void Function(String)? onFieldSubmitted;
  final InputDecoration? decoration;
  final VoidCallback? onTap;
  final TextAlign? textAlign;

  @override
  State<ProductTextfield> createState() => _ProductTextfieldState();
}

class _ProductTextfieldState extends State<ProductTextfield> {
  bool isFocused = false;

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (hasFocus) {
        setState(() {
          isFocused = hasFocus;
        });
      },
      child: TextFormField(
        maxLines: widget.isMultiline ? 5 : 1,
        style: context.textTheme.titleMedium?.copyWith(color: ColorName.black),
        textInputAction: widget.textInputAction,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        maxLength: widget.maxLength,
        controller: widget.controller,
        enabled: widget.enabled,
        obscureText: widget.obscureText ?? false,
        autofocus: widget.autofocus ?? false,
        inputFormatters: widget.formatters,
        keyboardType: widget.keyboardType,
        textAlign: widget.textAlign ?? TextAlign.start,
        initialValue: widget.initialText,
        focusNode: widget.focusNode,
        onTap: widget.onTap,
        onFieldSubmitted: widget.onFieldSubmitted,
        decoration: widget.decoration ??
            ProductTextfieldDecoration(
              isFocused: isFocused,
              hintText: widget.hintText,
              errorText: widget.errorText,
              prefixIcon: widget.prefixIcon,
            ),
        validator: widget.validator,
        onChanged: widget.onChanged,
      ),
    );
  }
}
