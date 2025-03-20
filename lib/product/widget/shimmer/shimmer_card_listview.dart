import 'package:flutter/material.dart';
import 'package:flutter_valorant_agents/product/widget/shimmer/shimmer_types.dart';
import 'package:flutter_valorant_agents/ui/styles/paddings.dart';

@immutable
final class ShimmerCardListView extends StatelessWidget {
  const ShimmerCardListView({
    this.itemCount = 5,
    super.key,
  });

  /// Item count of the shimmer card list view
  final int itemCount;

  @override
  Widget build(BuildContext context) => ListView.builder(
        shrinkWrap: true,
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        physics: const BouncingScrollPhysics(),
        itemCount: itemCount,
        itemBuilder: (context, index) => Padding(
          padding: Paddings.p4v,
          child: Card(
            elevation: .5,
            child: ListTile(
              title: Padding(
                padding: EdgeInsets.only(right: Paddings.p32r.right * 4),
                child: shimmerTitleCard,
              ),
              subtitle: shimmerSubtitleCard,
              leading: shimmerImageCard,
            ),
          ),
        ),
      );
}
