/// Hive adapter id
enum HiveAdapterId {
  /// Agents
  agent(10),

  /// Agent roles
  agentRole(20),

  /// Recruitment data
  recruitmentData(30),

  /// Abilities
  ability(40);

  final int value;
  const HiveAdapterId(this.value);
}
