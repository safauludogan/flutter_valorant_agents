/// Hive cache register adapter id
library;

/// Hive adapter id
enum HiveAdapterId {
  /// Agents
  agentResponse(10);

  final int value;
  const HiveAdapterId(this.value);
}
