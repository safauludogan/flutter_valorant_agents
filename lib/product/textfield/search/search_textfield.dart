import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_valorant_agents/product/extension/context_extension.dart';
import 'package:flutter_valorant_agents/product/init/language/locale_keys.g.dart';
import 'package:flutter_valorant_agents/product/textfield/base/product_textfield.dart';
import 'package:flutter_valorant_agents/product/utility/constants/project_durations.dart';
import 'package:flutter_valorant_agents/product/utility/size/widget_size.dart';
import 'package:flutter_valorant_agents/product/widget/icon/search_icon.dart';
import 'package:flutter_valorant_agents/ui/styles/paddings.dart';
import 'package:flutter_valorant_agents/ui/styles/text_styles.dart';
import 'package:gen/gen.dart';

part 'search_operation_mixin.dart';

class SearchTextfield extends StatefulWidget {
  const SearchTextfield({
    this.isLoading,
    this.errorText,
    this.controller,
    this.onChanged,
    this.autofocus,
    this.focusNode,
    this.onFieldSubmitted,
    this.textInputAction,
    this.onTap,
    super.key,
  });

  /// When is a loading enable false textfield
  final bool? isLoading;

  /// Show error text manually
  final String? errorText;

  /// [TextEditingController] text form controller
  final TextEditingController? controller;

  /// Return onChanged text value
  final void Function(String text)? onChanged;

  ///TextFormField focus mode
  final bool? autofocus;

  ///TextFormField focus node
  final FocusNode? focusNode;

  /// TextInputAction
  final TextInputAction? textInputAction;

  /// When the field is submitted, the focus is moved to the next field.
  final void Function(String)? onFieldSubmitted;

  /// When the field is tapped, the focus is moved to the next field.
  final VoidCallback? onTap;

  @override
  State<SearchTextfield> createState() => _SearchTextfieldState();
}

class _SearchTextfieldState extends State<SearchTextfield>
    with _SearchOperationMixin {
  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (hasFocus) {
        if (!mounted) return;
        setState(() {
          isFocused = hasFocus;
        });
      },
      child: ProductTextfield(
        onTap: widget.onTap,
        controller: widget.controller,
        enabled: widget.isLoading != true,
        onChanged: _onChangedOperation,
        autofocus: widget.autofocus,
        focusNode: widget.focusNode,
        onFieldSubmitted: widget.onFieldSubmitted,
        textInputAction: widget.textInputAction,
        maxLength: 45,
        keyboardType: TextInputType.text,
        decoration: _inputDecoration(context),
      ),
    );
  }

  InputDecoration _inputDecoration(BuildContext context) {
    return InputDecoration(
      fillColor: ColorName.gray100,
      filled: true,
      hintText: LocaleKeys.textformfield_hintText_searchAgent.tr(),
      errorText: widget.errorText,
      prefixIconConstraints: const BoxConstraints(),
      counterText: '',
      prefixIcon: _prefixIcon,
      border: _border,
      disabledBorder: _border,
      enabledBorder: _border,
      focusedBorder: _focusBorder,
      errorBorder: _border,
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(vertical: 8),
      hintStyle: context.textTheme.titleSmall?.copyWith(
        fontSize: 14,
        color: ColorName.gray500,
      ),
    );
  }

  /// Prefix icon
  Widget get _prefixIcon => Padding(
        padding: Paddings.p16l + Paddings.p8r,
        child: const SearchIcon(color: ColorName.gray500),
      );

  OutlineInputBorder get _border => OutlineInputBorder(
        borderRadius: BorderRadius.circular(WidgetSizes.spacingSs),
        borderSide: const BorderSide(color: ColorName.gray200),
      );

  OutlineInputBorder get _focusBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(WidgetSizes.spacingSs),
        borderSide: const BorderSide(color: ColorName.primary),
      );
}
