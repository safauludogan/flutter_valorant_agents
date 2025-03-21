part of '../home_view.dart';

/// Agents card list view
class _AgentsCardListView extends StatefulWidget {
  const _AgentsCardListView({
    required this.agents,
    required this.selectedAgentRole,
    Key? key,
  }) : super(key: key);

  /// Agents
  final List<Agent> agents;

  /// Selected agent role
  final AgentRole? selectedAgentRole;

  @override
  State<_AgentsCardListView> createState() => _AgentsCardListViewState();
}

class _AgentsCardListViewState extends State<_AgentsCardListView>
    with
        SingleTickerProviderStateMixin,
        MountedMixin<_AgentsCardListView>,
        FadeTransitionCurvedAnimateMixin<_AgentsCardListView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100), startAnimation);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.agents.isEmpty) {
      return _noAgentsFoundWidget;
    }
    return ListView.builder(
      shrinkWrap: true,
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      physics: const BouncingScrollPhysics(),
      itemCount: widget.agents.length,
      itemBuilder: (context, index) {
        final agent = widget.agents[index];

        /// If the agent role is not the selected agent role,
        /// return a [SizedBox.shrink()]
        final isAgentRoleSelected =
            agent.role?.uuid?.compareUuid(widget.selectedAgentRole?.uuid);
        if ((isAgentRoleSelected == null || !isAgentRoleSelected) &&
            widget.selectedAgentRole?.uuid != allFilterAgentRole.uuid) {
          return const SizedBox.shrink();
        }
        return fadeTransitionCurved(
          child: Padding(
            padding: Paddings.p4v,
            child: _AgentCard(agent: agent),
          ),
        );
      },
    );
  }

  Widget get _noAgentsFoundWidget => Center(
        child: Column(
          children: [
            const LottieNotFound(),
            Text(
              LocaleKeys.general_messages_noAgentsFound,
              style: AppTextStyles.footNote3,
            ).tr(),
          ],
        ),
      );
}

class _AgentCard extends StatelessWidget {
  const _AgentCard({
    required this.agent,
  });

  final Agent agent;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
        side: BorderSide(
          color: Colors.white.withValues(alpha: 0.1),
        ),
      ),
      elevation: 8,
      shadowColor: agent.backgroundGradientColors
          ?.map((e) => Color(int.parse('0xFF$e')))
          .first
          .withValues(alpha: 0.3),
      child: Container(
        decoration: CardBgDecoration(
          colors: agent.backgroundGradientColors
              ?.map((e) => Color(int.parse('0xFF$e')))
              .toList(),
        ),
        child: IntrinsicHeight(
          child: Row(
            children: [
              // Agent Image
              Expanded(
                flex: 2,
                child: _buildAgentImage(agent),
              ),
              // Agent Info
              Expanded(
                flex: 3,
                child: Padding(
                  padding: Paddings.p8a,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Agent Name and Role
                      _buildAgentNameAndRole(agent),
                      SizedBox(height: WidgetSizes.spacingXs.h),
                      // Agent Description
                      Text(
                        agent.description ?? '',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.footNote3,
                      ),
                      SizedBox(height: WidgetSizes.spacingXs.h),
                      // Abilities Icons
                      if (agent.abilities != null) ...[
                        _buildAbilitiesIcons(agent),
                      ],
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Agent image with hero animation
  Widget _buildAgentImage(Agent agent) {
    return Hero(
      tag: agent.uuid ?? '',
      child: CustomNetworkImage(
        imageUrl: agent.displayIcon,
      ),
    );
  }

  /// Agent name and role
  Widget _buildAgentNameAndRole(Agent agent) {
    return Row(
      children: [
        Expanded(
          child: Text(
            agent.displayName ?? '',
            style: AppTextStyles.bodyText1,
          ),
        ),
        if (agent.role?.displayIcon != null) ...[
          SizedBox(width: WidgetSizes.spacingXxs.w),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 8.w,
              vertical: 4.h,
            ),
            decoration: AbilitiesDecoration(),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomNetworkImage(
                  imageUrl: agent.role!.displayIcon,
                  size: Size(14.w, 14.h),
                ),
                SizedBox(width: 4.w),
                Text(
                  agent.role!.displayName!,
                  style: AppTextStyles.footNote2.copyWith(
                    color: Colors.white.withValues(alpha: 0.8),
                  ),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }

  /// Abilities icons
  Widget _buildAbilitiesIcons(Agent agent) {
    return SizedBox(
      height: WidgetSizes.spacingXl.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: agent.abilities!.length,
        separatorBuilder: (context, index) =>
            SizedBox(width: WidgetSizes.spacingXxs.w),
        itemBuilder: (context, index) {
          final ability = agent.abilities![index];
          if (ability.displayIcon == null) {
            return const SizedBox.shrink();
          }
          return Tooltip(
            message: ability.displayName ?? '',
            child: Container(
              padding: EdgeInsets.all(6.r),
              decoration: AbilitiesDecoration(),
              child: CustomNetworkImage(
                imageUrl: ability.displayIcon,
                size: Size(WidgetSizes.spacingL.w, WidgetSizes.spacingL.h),
              ),
            ),
          );
        },
      ),
    );
  }
}
