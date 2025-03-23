part of '../agent_detail_view.dart';

class _AgentAbilityTitle extends StatelessWidget {
  const _AgentAbilityTitle();
  @override
  Widget build(BuildContext context) {
    return Text(
      LocaleKeys.agentDetail_pages_abilitiesTitle,
      style: context.textTheme.displayMedium
          ?.copyWith(color: context.colorScheme.onSecondary),
    ).tr();
  }
}
