part of '../agent_detail_view.dart';

class _AgentRoleName extends StatelessWidget {
  const _AgentRoleName({
    required this.roleName,
  });

  final String roleName;

  @override
  Widget build(BuildContext context) {
    return Text(
      roleName,
      style: context.textTheme.labelMedium?.copyWith(
        color: context.colorScheme.surface.withValues(alpha: 0.8),
      ),
    );
  }
}
