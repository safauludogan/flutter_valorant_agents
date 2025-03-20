part of '../home_view.dart';

class _AgentRolesFilterChip extends StatelessWidget {
  const _AgentRolesFilterChip({
    required this.agentRoles,
    required this.onSelected,
    required this.selectedAgentRole,
    Key? key,
  }) : super(key: key);

  /// Agent roles
  final List<AgentRole> agentRoles;

  /// Selected agent role
  final AgentRole? selectedAgentRole;

  /// On selected
  final ValueSetter<AgentRole> onSelected;

  @override
  Widget build(BuildContext context) {
    if (agentRoles.isEmpty) {
      return const SizedBox.shrink();
    } else {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _buildFilterChip(
              agentRole: allFilterAgentRole,
              isSelected: selectedAgentRole?.uuid == allFilterAgentRole.uuid,
            ),
            SizedBox(width: WidgetSizes.spacingXSS.w),
            ...agentRoles.map(
              (agentRole) => Padding(
                padding: Paddings.p2h,
                child: _buildFilterChip(
                  agentRole: agentRole,
                  isSelected:
                      agentRole.uuid?.compareUuid(selectedAgentRole?.uuid) ??
                          false,
                ),
              ),
            ),
          ],
        ),
      );
    }
  }

  Widget _buildFilterChip({required AgentRole agentRole, bool? isSelected}) {
    return FilterChip(
      avatar: agentRole.uuid == allFilterAgentRole.uuid
          ? null
          : Container(
              decoration: FilterChipDecoration(),
              child: Padding(
                padding: Paddings.p1h,
                child: CustomNetworkImage(
                  imageUrl: agentRole.displayIcon,
                ),
              ),
            ),
      label: Text(
        agentRole.displayName!,
        style: AppTextStyles.small.copyWith(fontSize: 12),
      ).tr(),
      onSelected: (value) => onSelected.call(agentRole),
      selected: isSelected ?? false,
      labelStyle: AppTextStyles.small.copyWith(
        fontSize: 12,
        color: (isSelected ?? false) ? Colors.white : Colors.black,
      ),
      backgroundColor: Colors.black12,
      selectedColor: Colors.red.shade900.withValues(alpha: 0.8),
      pressElevation: 0,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      shape: RoundedRectangleBorder(
        borderRadius: Radiuses.b32r,
        side: BorderSide(
          color: (isSelected ?? false)
              ? Colors.red.shade700
              : Colors.red.shade900.withValues(alpha: 0.3),
          width: 1.5,
        ),
      ),
      showCheckmark: false,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      elevation: 0,
      shadowColor: Colors.transparent,
      visualDensity: VisualDensity.compact,
      side: BorderSide(
        color: (isSelected ?? false) ? Colors.red.shade700 : Colors.transparent,
        width: 1.5,
      ),
    );
  }
}
