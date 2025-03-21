import 'package:flutter/material.dart';
import 'package:flutter_valorant_agents/product/widget/button/normal_elevated_button.dart';
import 'package:flutter_valorant_agents/ui/bottom_sheets/favorite/favorite_sheet_model.dart';
import 'package:flutter_valorant_agents/ui/common/app_colors.dart';
import 'package:flutter_valorant_agents/ui/common/ui_helpers.dart';
import 'package:gen/gen.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class FavoriteSheet extends StackedView<FavoriteSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const FavoriteSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    FavoriteSheetModel viewModel,
    Widget? child,
  ) {
    bool hasAgantData = request.data != null && request.data is Agent;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            request.title ?? 'Hello Stacked Sheet!!',
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
          ),
          Text(
            request.additionalButtonTitle ?? 'Hello Stacked Sheet!!',
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
          ),
          Text(
            request.mainButtonTitle ?? 'Hello Stacked Sheet!!',
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
          ),
          NormalElevatedButton(
            onPressed: () {},
            text: request.mainButtonTitle!,
          ),
          if (request.description != null) ...[
            verticalSpaceTiny,
            Text(
              request.description!,
              style: const TextStyle(fontSize: 14, color: kcMediumGrey),
              maxLines: 3,
              softWrap: true,
            ),
          ],
          verticalSpaceLarge,
        ],
      ),
    );
  }

  @override
  FavoriteSheetModel viewModelBuilder(BuildContext context) =>
      FavoriteSheetModel();
}
