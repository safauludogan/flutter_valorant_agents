part of '../agent_detail_view.dart';

class _AgentDescription extends StatelessWidget {
  const _AgentDescription({
    required this.description,
  });

  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Paddings.p16a,
      decoration: AbilityContainerDecoration(),
      child: Text(
        description,
        style: context.textTheme.bodyMedium?.copyWith(
          color: context.colorScheme.onSecondary.withValues(alpha: 0.9),
        ),
      ),
    );
  }
}
