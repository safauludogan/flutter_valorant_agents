import 'package:dio/dio.dart';
import 'package:flutter_valorant_agents/app/app.locator.dart';
import 'package:flutter_valorant_agents/product/utility/constants/enum/query_parameters.dart';
import 'package:flutter_valorant_agents/services/app/localization_service.dart';
import 'package:stacked_services/stacked_services.dart';

/// Product network interceptor
class ProductNetworkInterceptor implements InterceptorsWrapper {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    return handler.next(err);
  }

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    /// If the token is null, then include x-api-key to header
    options.queryParameters
        .addAll({QueryParameters.language.name: getLanguage});

    return handler.next(options);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    return handler.next(response);
  }

  /// Get app current language with [ProductLocalization.getCurrentLocale]
  String get getLanguage => locator<LocalizationService>()
      .getCurrentLocaleLanguageTag(StackedService.navigatorKey!.currentContext!);
}
