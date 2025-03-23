import 'package:dio_nexus/dio_nexus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_valorant_agents/product/extension/context_extension.dart';
import 'package:flutter_valorant_agents/product/init/language/locale_keys.g.dart';
import 'package:flutter_valorant_agents/product/widget/lottie/lottie_notfound.dart';

@immutable

/// Network error resolver
final class NetworkErrorResolver {
  /// Constructor
  const NetworkErrorResolver({required this.child, required this.error});

  /// Error
  final NetworkExceptions? error;

  /// Child
  final Widget child;

  /// Error widget
  Widget resolveErrorWidget({
    required BuildContext context,
    required VoidCallback receiveData,
  }) {
    if (error == null) return child;
    if (error == const NetworkExceptions.noInternetConnection()) {
      return _noInternetConnectionWidget(
          receiveData: receiveData, context: context);
    } else if (error == const NetworkExceptions.receiveTimeout()) {
      return _serverErrorWidget(receiveData: receiveData);
    }
    return Center(
        child: Text(
      NetworkExceptions.getErrorMessage(error!),
      style: context.textTheme.titleSmall,
    ));
  }

  /// No internet connection widget
  Widget _noInternetConnectionWidget(
      {required BuildContext context, required VoidCallback receiveData}) {
    return Center(
      child: Column(
        children: [
          Center(
            child: Column(
              children: [
                const LottieNotFound(),
                Text(
                  LocaleKeys.messages_noInternetConnection,
                  style: context.textTheme.titleSmall,
                ).tr(),
                OutlinedButton(
                  onPressed: () => receiveData.call(),
                  child: const Text(LocaleKeys.general_button_tryAgain).tr(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Server error widget
  Widget _serverErrorWidget({required VoidCallback receiveData}) {
    return Column(
      children: [
        const Text(LocaleKeys.messages_noResponseFromServer).tr(),
        OutlinedButton(
          onPressed: () => receiveData.call(),
          child: const Text(LocaleKeys.general_button_tryAgain).tr(),
        )
      ],
    );
  }
}
