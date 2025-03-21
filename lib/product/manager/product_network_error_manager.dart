import 'package:dio_nexus/dio_nexus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_valorant_agents/app/app.locator.dart';
import 'package:flutter_valorant_agents/product/init/language/locale_keys.g.dart';
import 'package:flutter_valorant_agents/product/manager/network_error.dart';
import 'package:flutter_valorant_agents/services/common/toast_service.dart';

/// Manager your network error with screen
final class ProductNetworkErrorManager {
  /// Constructor
  ProductNetworkErrorManager({required this.context});

  /// Toast Service
  final _toastService = locator<ToastService>();

  /// Context
  final BuildContext context;

  /// Resolve the network error
  void resolve<T>(
    IResponseModel<T?>? responseModel, {
    ValueSetter<T?>? response,
    ValueSetter<NetworkExceptions?>? networkExceptions,
  }) {
    final error = responseModel?.errorModel;
    final data = responseModel?.data;

    if (error != null) {
      _showError(
        error.errorMessage ??
            LocaleKeys.general_messages_somethingWentWrong.tr(),
      );

      if (error.networkException != null) {
        networkExceptions?.call(error.networkException);
        throw NetworkError(error.networkException!);
      }
    } else {
      response?.call(data);
    }
  }

  void _showError(String? message) {
    if (message == null) return;
    _toastService.showErrorMessage(message: message);
  }
}
