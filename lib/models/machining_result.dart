class MachiningResult {
  final double cuttingSpeed;
  final double rpm;
  final double feed;
  final double feedRate;
  final double depthOfCut;
  final double machiningTime;
  final double mrr;
  final String recommendation;

  MachiningResult({
    required this.cuttingSpeed,
    required this.rpm,
    required this.feed,
    required this.feedRate,
    required this.depthOfCut,
    required this.machiningTime,
    required this.mrr,
    required this.recommendation,
  });
}