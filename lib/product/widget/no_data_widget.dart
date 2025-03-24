import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_valorant_agents/product/init/language/locale_keys.g.dart';
import 'package:flutter_valorant_agents/product/widget/lottie/lottie_error.dart';

/// No data widget
class NoDataWidget extends StatelessWidget {
  const NoDataWidget({required this.receiveData, super.key});

  /// Receive data
  final VoidCallback receiveData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const LottieError(),
        const Text(LocaleKeys.general_messages_noResponseFromServer).tr(),
        OutlinedButton(
          onPressed: receiveData.call,
          child: const Text(LocaleKeys.general_button_tryAgain).tr(),
        )
      ],
    );
  }
}
