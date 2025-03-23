import 'package:common/common.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_valorant_agents/product/extension/context_extension.dart';
import 'package:flutter_valorant_agents/product/extension/string_extension.dart';
import 'package:flutter_valorant_agents/product/manager/network_error_resolver.dart';
import 'package:flutter_valorant_agents/product/textfield/search/search_textfield.dart';
import 'package:flutter_valorant_agents/product/utility/size/widget_size.dart';
import 'package:flutter_valorant_agents/product/widget/icon/settings_icon.dart';
import 'package:flutter_valorant_agents/product/widget/shimmer/shimmer_card_listview.dart';
import 'package:flutter_valorant_agents/ui/styles/paddings.dart';
import 'package:flutter_valorant_agents/ui/styles/radiuses.dart';
import 'package:flutter_valorant_agents/ui/views/home/home_view.form.dart';
import 'package:flutter_valorant_agents/ui/views/home/home_viewmodel.dart';
import 'package:flutter_valorant_agents/ui/views/home/mixin/home_view_mixin.dart';
import 'package:flutter_valorant_agents/ui/views/home/utility/filter_all_agent_role.dart';
import 'package:flutter_valorant_agents/ui/views/home/utility/home_pages.dart';
import 'package:flutter_valorant_agents/ui/views/home/widget/decoration/role_bg_decoration.dart';
import 'package:gen/gen.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:widgets/widgets.dart';

part 'widget/agent_roles_filterchip.dart';

@FormView(
  fields: [
    FormTextField(
      name: 'searchInput',
    ),
  ],
)
class HomeView extends StackedView<HomeViewModel>
    with $HomeView, HomeViewMixin {
  HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, HomeViewModel viewModel, Widget? child) {
    return CustomKeyboardDismisser(
      child: DefaultTabController(
        length: HomePages.values.length,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: TabBar(
              tabs:
                  HomePages.values.map((e) => Tab(text: e.getTitle())).toList(),
            ),
            actions: [
              SettingsIcon(
                onPressed: () async {
                  await viewModel.navigateToSettings();
                },
              )
            ],
          ),
          body: AdaptAllView(
            phone: _Body(
                searchInputController: searchInputController,
                viewModel: viewModel),
            tablet: _Body(
                searchInputController: searchInputController,
                viewModel: viewModel),
            desktop: _Body(
                searchInputController: searchInputController,
                viewModel: viewModel),
          ),
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    required this.searchInputController,
    required this.viewModel,
  });

  final TextEditingController searchInputController;
  final HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: Paddings.p16h,
        child: viewModel.isBusy
            ? const ShimmerCardListView()
            : NetworkErrorResolver(
                child: Column(
                  children: [
                    Expanded(
                      child: NestedScrollView(
                        headerSliverBuilder: (context, innerBoxIsScrolled) => [
                          SliverAppBar(
                            floating: true,
                            snap: true,
                            bottom: PreferredSize(
                              preferredSize: Size.fromHeight(48.h),
                              child: _AgentRolesFilterChip(
                                agentRoles: viewModel.agentRoles,
                                onSelected: viewModel.onAgentRoleSelected,
                                selectedAgentRole: viewModel.selectedAgentRole,
                              ),
                            ),
                            title: viewModel.getError == null
                                ? SearchTextfield(
                                    controller: searchInputController,
                                    onChanged: (text) =>
                                        viewModel.onSearchInputChanged(
                                            viewModel.searchValue),
                                  )
                                : const SizedBox.shrink(),
                          ),
                        ],
                        body: TabBarView(
                          children: HomePages.values
                              .map((e) => e.getPage(
                                  agents: viewModel.agents,
                                  selectedAgentRole:
                                      viewModel.selectedAgentRole,
                                  onFavoriteTap: viewModel.onFavoriteTap,
                                  favoriteAgents: viewModel.favoriteAgents,
                                  checkFavoriteAgentRefresh:
                                      viewModel.getAllFavoriteAgents,
                                  onRefresh: () async => viewModel.getAgents()))
                              .toList(),
                        ),
                      ),
                    ),
                  ],
                ),
                error: viewModel.getError,
              ).resolveErrorWidget(
                receiveData: viewModel.getAgents,
                context: context,
              ),
      ),
    );
  }
}
