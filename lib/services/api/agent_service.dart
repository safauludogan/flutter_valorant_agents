import 'package:dio_nexus/dio_nexus.dart';
import 'package:flutter_valorant_agents/app/app.locator.dart';
import 'package:flutter_valorant_agents/product/utility/constants/enum/product_service_path.dart';
import 'package:flutter_valorant_agents/services/product_network_service.dart';
import 'package:gen/gen.dart';

/// Agent service for valorant agents
class AgentService {
  final _productNetworkService = locator<ProductNetworkService>();

  /// Get all agents
  Future<IResponseModel<AgentResponse?>?> getAllAgents() async {
    return _productNetworkService.sendRequest<AgentResponse, AgentResponse>(
      ProductServicePath.agents.value,
      responseModel: AgentResponse(),
      requestType: RequestType.GET,
    );
  }
}
