class CuttingParameter {

  final double recommendedSpeed;
  final double minSpeed;
  final double maxSpeed;

  final double recommendedFeed;
  final double minFeed;
  final double maxFeed;

  final double recommendedDOC;
  final double minDOC;
  final double maxDOC;

  const CuttingParameter({

    required this.recommendedSpeed,
    required this.minSpeed,
    required this.maxSpeed,

    required this.recommendedFeed,
    required this.minFeed,
    required this.maxFeed,

    required this.recommendedDOC,
    required this.minDOC,
    required this.maxDOC,
  });
}