import 'package:dio_nexus/dio_nexus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_valorant_agents/product/config/app_environment.dart';
import 'package:flutter_valorant_agents/product/manager/product_network_interceptor.dart';

class ProductNetworkService extends DioNexusManager {
  ProductNetworkService()
      : super(
          interceptor: ProductNetworkInterceptor(),
          options: BaseOptions(
            baseUrl: AppEnvironmentItems.baseUrl.value,
            headers: {'Content-Type': 'application/json'},
          ),
          locale: const Locale('tr'),
          printLogsDebugMode: false,
        );

  /// Setup network connection
  void setupNetworkConnection(BuildContext context) {
    networkConnection = NetworkConnection(context: context);
  }
}
