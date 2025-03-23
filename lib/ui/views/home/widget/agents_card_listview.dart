import 'package:common/common.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_valorant_agents/product/animation/fade_transition_curved_animate_mixin.dart';
import 'package:flutter_valorant_agents/product/extension/context_extension.dart';
import 'package:flutter_valorant_agents/product/extension/double_extension.dart';
import 'package:flutter_valorant_agents/product/extension/string_extension.dart';
import 'package:flutter_valorant_agents/product/init/language/locale_keys.g.dart';
import 'package:flutter_valorant_agents/product/utility/size/widget_size.dart';
import 'package:flutter_valorant_agents/product/widget/icon/favorite_icon_button.dart';
import 'package:flutter_valorant_agents/product/widget/lottie/lottie_notfound.dart';
import 'package:flutter_valorant_agents/ui/styles/paddings.dart';
import 'package:flutter_valorant_agents/ui/views/home/utility/filter_all_agent_role.dart';
import 'package:flutter_valorant_agents/ui/views/home/widget/decoration/abilities_decoration.dart';
import 'package:flutter_valorant_agents/ui/views/home/widget/decoration/card_bg_decoration.dart';
import 'package:flutter_valorant_agents/ui/views/home/widget/decoration/notes_text_decoration.dart';
import 'package:gen/gen.dart';
import 'package:widgets/widgets.dart';

/// Agents card list view
class AgentsCardListView extends StatefulWidget {
  const AgentsCardListView({
    required this.agents,
    required this.selectedAgentRole,
    required this.onFavoriteTap,
    required this.favoriteAgents,
    required this.onAgentTap,
    required this.onNotesTap,
    Key? key,
  }) : super(key: key);

  /// Agents
  final List<Agent> agents;

  /// Selected agent role
  final AgentRole? selectedAgentRole;

  /// On favorite tap
  final void Function(Agent, bool) onFavoriteTap;

  /// Favorite agents
  final List<FavoriteAgent> favoriteAgents;

  /// On agent tap
  final void Function(Agent) onAgentTap;

  /// On notes tap
  final void Function(FavoriteAgent) onNotesTap;

  @override
  State<AgentsCardListView> createState() => AgentsCardListViewState();
}

class AgentsCardListViewState extends State<AgentsCardListView>
    with
        SingleTickerProviderStateMixin,
        MountedMixin<AgentsCardListView>,
        FadeTransitionCurvedAnimateMixin<AgentsCardListView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100), startAnimation);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.agents.isEmpty) {
      return _noAgentsFoundWidget(context);
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
            child: _AgentCard(
              agent: agent,
              onFavoriteTap: widget.onFavoriteTap,
              isFavorite: widget.favoriteAgents.any((favorite) =>
                  favorite.agentId?.compareUuid(agent.uuid) ?? false),
              onAgentTap: widget.onAgentTap,
              favoriteAgent: widget.favoriteAgents
                  .where(
                    (favorite) =>
                        favorite.agentId?.compareUuid(agent.uuid) ?? false,
                  )
                  .firstOrNull,
              onNotesTap: widget.onNotesTap,
            ),
          ),
        );
      },
    );
  }

  Widget _noAgentsFoundWidget(BuildContext context) => Center(
        child: Column(
          children: [
            const LottieNotFound(),
            Text(
              LocaleKeys.general_messages_noAgentsFound,
              style: context.textTheme.titleSmall,
            ).tr(),
          ],
        ),
      );
}

class _AgentCard extends StatelessWidget {
  const _AgentCard({
    required this.agent,
    required this.onFavoriteTap,
    required this.isFavorite,
    required this.onAgentTap,
    required this.favoriteAgent,
    required this.onNotesTap,
  });

  final Agent agent;
  final void Function(Agent, bool) onFavoriteTap;
  final bool isFavorite;
  final void Function(Agent) onAgentTap;
  final FavoriteAgent? favoriteAgent;
  final ValueSetter<FavoriteAgent> onNotesTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onAgentTap(agent),
      child: Card(
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
                        _buildAgentNameAndRole(
                          context,
                          agent,
                          favoriteAgent,
                          onNotesTap,
                        ),
                        SizedBox(height: WidgetSizes.spacingXs.h),
                        // Agent Description
                        Text(
                          agent.description ?? '',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: context.textTheme.labelSmall,
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
  Widget _buildAgentNameAndRole(BuildContext context, Agent agent,
      FavoriteAgent? favoriteAgent, ValueSetter<FavoriteAgent> onNotesTap) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                agent.displayName ?? '',
                style: context.textTheme.bodyLarge?.copyWith(
                  overflow: TextOverflow.ellipsis,
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
                        style: context.textTheme.labelMedium?.copyWith(
                          color: ColorName.white.withValues(alpha: 0.8),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
        WidgetSizes.spacingXSs.width,
        Column(
          children: [
            FavoriteIconButton(
              onFavoriteTap: () => onFavoriteTap(agent, isFavorite),
              isFavorite: isFavorite,
            ),
            if (favoriteAgent != null) ...[
              WidgetSizes.spacingXSS.h.height,
              Container(
                padding: Paddings.p4a,
                decoration: NotesTextDecoration(context),
                child: InkWell(
                  child: Text(LocaleKeys.home_pages_notes,
                      style: context.textTheme.titleSmall?.copyWith(
                        color: ColorName.white.withValues(alpha: 0.8),
                      )).tr(),
                  onTap: () => onNotesTap(favoriteAgent),
                ),
              ),
            ] else ...[
              WidgetSizes.spacingL.h.height,
            ]
          ],
        ),
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
