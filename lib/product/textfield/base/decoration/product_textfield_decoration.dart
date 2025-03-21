import 'package:flutter/material.dart';
import 'package:gen/gen.dart';

/// ProductTextfieldDecoration
class ProductTextfieldDecoration extends InputDecoration {
  const ProductTextfieldDecoration({
    required bool isFocused,
    String? hintText,
    String? errorText,
    super.prefixIcon,
  }) : super(
          fillColor: isFocused ? ColorName.gray200 : null,
          prefixIconColor: isFocused ? ColorName.primary : null,
          counterText: '',
          hintText: hintText,
          errorText: errorText,
        );
}
