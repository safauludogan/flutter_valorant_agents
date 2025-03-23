part of '../agent_detail_view.dart';

class _AbilityListView extends StatelessWidget {
  const _AbilityListView({
    required this.abilities,
  });

  final List<Abilities> abilities;

  @override
  Widget build(BuildContext context) => _buildListView();

  ListView _buildListView() {
    return ListView.separated(
      shrinkWrap: true,
      padding: Paddings.p16t,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: abilities.length,
      separatorBuilder: (_, __) => WidgetSizes.spacingM.h.height,
      itemBuilder: (context, index) {
        final ability = abilities[index];
        return Container(
          padding: Paddings.p16a,
          decoration: AbilityContainerDecoration(),
          child: Column(
            spacing: WidgetSizes.spacingXs.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _NameAndIcon(ability: ability),
              if (ability.description != null) ...[
                _description(ability),
              ],
            ],
          ),
        );
      },
    );
  }

  Text _description(Abilities ability) {
    return Text(
      ability.description!,
      style: AppTextStyles.footNote2.copyWith(
        color: Colors.white.withValues(alpha: 0.7),
      ),
    );
  }
}

class _NameAndIcon extends StatelessWidget {
  const _NameAndIcon({
    required this.ability,
  });

  final Abilities ability;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (ability.displayIcon != null)
          Container(
            padding: Paddings.p12a,
            decoration: AbilityIconContainerDecoration(),
            child: CustomNetworkImage(
              imageUrl: ability.displayIcon,
              size: Size(48.w, 48.h),
            ),
          ),
        WidgetSizes.spacingM.w.width,
        Expanded(
          child: Text(
            ability.displayName ?? '',
            style: AppTextStyles.bodyText1.copyWith(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
