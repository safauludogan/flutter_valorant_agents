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
                _description(ability, context: context),
              ],
            ],
          ),
        );
      },
    );
  }

  Text _description(Abilities ability, {required BuildContext context}) {
    return Text(
      ability.description!,
      style: context.textTheme.labelMedium?.copyWith(
        color: context.colorScheme.onSecondary.withValues(alpha: 0.8),
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
            style: context.textTheme.bodyLarge
                ?.copyWith(color: context.colorScheme.onSecondary),
          ),
        ),
      ],
    );
  }
}
