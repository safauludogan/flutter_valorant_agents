import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_valorant_agents/product/animation/fade_transition_curved.animate_mixin.dart';
import 'package:flutter_valorant_agents/product/utility/size/widget_size.dart';
import 'package:flutter_valorant_agents/ui/styles/paddings.dart';
import 'package:flutter_valorant_agents/ui/views/home/home_viewmodel.dart';
import 'package:flutter_valorant_agents/ui/views/home/mixin/home_view_mixin.dart';
import 'package:gen/gen.dart';
import 'package:stacked/stacked.dart';
import 'package:widgets/widgets.dart';

part 'widget/agents_card_listview.dart';

class HomeView extends StackedView<HomeViewModel> with HomeViewMixin {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, HomeViewModel viewModel, Widget? child) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: Paddings.p16h,
        child: Center(
          child: viewModel.isBusy
              ? LoadingCircular()
              : _AgentsCardListView(agents: viewModel.agents),
        ),
      ),
    );
  }
}
