/// Hive cache register adapter id
library;

/// Hive adapter id
enum HiveAdapterId {
  /// Login
  login(10),

  /// Token
  token(20),

  /// Profile
  profile(30),

  /// User daily plan
  userNutritionalPlan(40),

  /// User favorite food id
  userFavoriteFoodId(50),

  /// Food
  food(60),

  /// Meal
  meal(70);

  final int value;
  const HiveAdapterId(this.value);
}
