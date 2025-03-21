// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:flutter_valorant_agents/product/validator/validator_items.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String TitleInputValueKey = 'titleInput';
const String DescriptionInputValueKey = 'descriptionInput';

final Map<String, TextEditingController>
    _AddFavoriteSheetTextEditingControllers = {};

final Map<String, FocusNode> _AddFavoriteSheetFocusNodes = {};

final Map<String, String? Function(String?)?> _AddFavoriteSheetTextValidations =
    {
  TitleInputValueKey: ValidatorItems.validateFavoriteTitle,
  DescriptionInputValueKey: ValidatorItems.validateFavoriteDescription,
};

mixin $AddFavoriteSheet {
  TextEditingController get titleInputController =>
      _getFormTextEditingController(TitleInputValueKey);
  TextEditingController get descriptionInputController =>
      _getFormTextEditingController(DescriptionInputValueKey);

  FocusNode get titleInputFocusNode => _getFormFocusNode(TitleInputValueKey);
  FocusNode get descriptionInputFocusNode =>
      _getFormFocusNode(DescriptionInputValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_AddFavoriteSheetTextEditingControllers.containsKey(key)) {
      return _AddFavoriteSheetTextEditingControllers[key]!;
    }

    _AddFavoriteSheetTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _AddFavoriteSheetTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_AddFavoriteSheetFocusNodes.containsKey(key)) {
      return _AddFavoriteSheetFocusNodes[key]!;
    }
    _AddFavoriteSheetFocusNodes[key] = FocusNode();
    return _AddFavoriteSheetFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    titleInputController.addListener(() => _updateFormData(model));
    descriptionInputController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    titleInputController.addListener(() => _updateFormData(model));
    descriptionInputController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          TitleInputValueKey: titleInputController.text,
          DescriptionInputValueKey: descriptionInputController.text,
        }),
    );

    if (_autoTextFieldValidation || forceValidate) {
      updateValidationData(model);
    }
  }

  bool validateFormFields(FormViewModel model) {
    _updateFormData(model, forceValidate: true);
    return model.isFormValid;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _AddFavoriteSheetTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _AddFavoriteSheetFocusNodes.values) {
      focusNode.dispose();
    }

    _AddFavoriteSheetTextEditingControllers.clear();
    _AddFavoriteSheetFocusNodes.clear();
  }
}

extension ValueProperties on FormStateHelper {
  bool get hasAnyValidationMessage => this
      .fieldsValidationMessages
      .values
      .any((validation) => validation != null);

  bool get isFormValid {
    if (!_autoTextFieldValidation) this.validateForm();

    return !hasAnyValidationMessage;
  }

  String? get titleInputValue =>
      this.formValueMap[TitleInputValueKey] as String?;
  String? get descriptionInputValue =>
      this.formValueMap[DescriptionInputValueKey] as String?;

  set titleInputValue(String? value) {
    this.setData(
      this.formValueMap..addAll({TitleInputValueKey: value}),
    );

    if (_AddFavoriteSheetTextEditingControllers.containsKey(
        TitleInputValueKey)) {
      _AddFavoriteSheetTextEditingControllers[TitleInputValueKey]?.text =
          value ?? '';
    }
  }

  set descriptionInputValue(String? value) {
    this.setData(
      this.formValueMap..addAll({DescriptionInputValueKey: value}),
    );

    if (_AddFavoriteSheetTextEditingControllers.containsKey(
        DescriptionInputValueKey)) {
      _AddFavoriteSheetTextEditingControllers[DescriptionInputValueKey]?.text =
          value ?? '';
    }
  }

  bool get hasTitleInput =>
      this.formValueMap.containsKey(TitleInputValueKey) &&
      (titleInputValue?.isNotEmpty ?? false);
  bool get hasDescriptionInput =>
      this.formValueMap.containsKey(DescriptionInputValueKey) &&
      (descriptionInputValue?.isNotEmpty ?? false);

  bool get hasTitleInputValidationMessage =>
      this.fieldsValidationMessages[TitleInputValueKey]?.isNotEmpty ?? false;
  bool get hasDescriptionInputValidationMessage =>
      this.fieldsValidationMessages[DescriptionInputValueKey]?.isNotEmpty ??
      false;

  String? get titleInputValidationMessage =>
      this.fieldsValidationMessages[TitleInputValueKey];
  String? get descriptionInputValidationMessage =>
      this.fieldsValidationMessages[DescriptionInputValueKey];
}

extension Methods on FormStateHelper {
  setTitleInputValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[TitleInputValueKey] = validationMessage;
  setDescriptionInputValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[DescriptionInputValueKey] =
          validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    titleInputValue = '';
    descriptionInputValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      TitleInputValueKey: getValidationMessage(TitleInputValueKey),
      DescriptionInputValueKey: getValidationMessage(DescriptionInputValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _AddFavoriteSheetTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _AddFavoriteSheetTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      TitleInputValueKey: getValidationMessage(TitleInputValueKey),
      DescriptionInputValueKey: getValidationMessage(DescriptionInputValueKey),
    });
