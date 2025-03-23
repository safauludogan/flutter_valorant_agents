import 'package:dio_nexus/dio_nexus.dart';
import 'package:flutter_valorant_agents/app/app.locator.dart';
import 'package:flutter_valorant_agents/product/utility/constants/enum/product_service_path.dart';
import 'package:flutter_valorant_agents/product/utility/constants/enum/query_parameters.dart';
import 'package:flutter_valorant_agents/services/manager/product_network_service.dart';
import 'package:gen/gen.dart';

/// Agent service for valorant agents
class AgentService {
  final _productNetworkService = locator<ProductNetworkService>();

  /// Get all agents
  Future<IResponseModel<AgentResponse?>?> getAllAgents() async {
    return _productNetworkService.sendRequest<AgentResponse, AgentResponse>(
      ProductServicePath.agents.value,
      queryParameters: {
        QueryParameters.isPlayableCharacter.name: true,
      },
      responseModel: AgentResponse(),
      requestType: RequestType.GET,
    );
  }

  /// Get  agent
  Future<IResponseModel<AgentResponse?>?> getAllAgentById(
      {required String id}) async {
    return _productNetworkService.sendRequest<AgentResponse, AgentResponse>(
      '${ProductServicePath.agents.value}/$id',
      responseModel: AgentResponse(),
      requestType: RequestType.GET,
    );
  }
}
