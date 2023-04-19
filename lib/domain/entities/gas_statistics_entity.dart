class GasStatisticsEntity {
  final double maxGood;
  final double maxFair;
  final double maxModerate;
  final double maxPoor;

  Map<String, double> get gasStatisticsMap {
    return {
      'Good': maxGood,
      'Fair': maxFair,
      'Moderate': maxModerate,
      'Poor': maxPoor,
    };
  }

  const GasStatisticsEntity({
    required this.maxGood,
    required this.maxFair,
    required this.maxModerate,
    required this.maxPoor,
  });
}
