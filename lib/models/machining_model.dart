<<<<<<< HEAD
// // class MachiningResult {

// //   // Recommended values
// //   final double speed;
// //   final double feed;
// //   final double rpm;
// //   final double doc;

// //   // Safe limits
// //   final double minSpeed;
// //   final double maxSpeed;

// //   final double minFeed;
// //   final double maxFeed;

// //   final double minRPM;
// //   final double maxRPM;

// //   final double minDOC;
// //   final double maxDOC;

// //   // Calculated values
// //   final double machiningTime;
// //   final double mrr;

// //   const MachiningResult({

// //     required this.speed,
// //     required this.feed,
// //     required this.rpm,
// //     required this.doc,

// //     required this.minSpeed,
// //     required this.maxSpeed,

// //     required this.minFeed,
// //     required this.maxFeed,

// //     required this.minRPM,
// //     required this.maxRPM,

// //     required this.minDOC,
// //     required this.maxDOC,

// //     required this.machiningTime,
// //     required this.mrr,
// //   });

// // }

// class MachiningResult {
//   final double speed;
//   final double feed;
//   final double rpm;
//   final double doc;
//   final double machiningTime;
//   final double mrr;

//   const MachiningResult({
//     required this.speed,
//     required this.feed,
//     required this.rpm,
//     required this.doc,
//     required this.machiningTime,
//     required this.mrr,
//   });
// }
class MachiningResult {
  // -----------------------------
  // Recommended Parameters
  // -----------------------------
  final double cuttingSpeed; // m/min
  final double feedRate; // mm/rev
  final double spindleRPM; // rpm
  final double depthOfCut; // mm
  final double machiningTime; // sec
  final double materialRemovalRate; // cm³/min

  // -----------------------------
  // Recommended Limits
  // -----------------------------
  final double minSpeed;
  final double maxSpeed;

  final double minFeed;
  final double maxFeed;

  final double minRPM;
  final double maxRPM;

  // -----------------------------
  // AI Recommendation
  // -----------------------------
  final String recommendation;
  final bool safe;

  const MachiningResult({
    required this.cuttingSpeed,
    required this.feedRate,
    required this.spindleRPM,
    required this.depthOfCut,
    required this.machiningTime,
    required this.materialRemovalRate,
    required this.minSpeed,
    required this.maxSpeed,
    required this.minFeed,
    required this.maxFeed,
    required this.minRPM,
    required this.maxRPM,
    required this.recommendation,
    required this.safe,
  });

  Map<String, dynamic> toJson() {
    return {
      "cuttingSpeed": cuttingSpeed,
      "feedRate": feedRate,
      "spindleRPM": spindleRPM,
      "depthOfCut": depthOfCut,
      "machiningTime": machiningTime,
      "materialRemovalRate": materialRemovalRate,
      "minSpeed": minSpeed,
      "maxSpeed": maxSpeed,
      "minFeed": minFeed,
      "maxFeed": maxFeed,
      "minRPM": minRPM,
      "maxRPM": maxRPM,
      "recommendation": recommendation,
      "safe": safe,
    };
  }

  factory MachiningResult.fromJson(Map<String, dynamic> json) {
    return MachiningResult(
      cuttingSpeed: (json["cuttingSpeed"] ?? 0).toDouble(),
      feedRate: (json["feedRate"] ?? 0).toDouble(),
      spindleRPM: (json["spindleRPM"] ?? 0).toDouble(),
      depthOfCut: (json["depthOfCut"] ?? 0).toDouble(),
      machiningTime: (json["machiningTime"] ?? 0).toDouble(),
      materialRemovalRate:
          (json["materialRemovalRate"] ?? 0).toDouble(),
      minSpeed: (json["minSpeed"] ?? 0).toDouble(),
      maxSpeed: (json["maxSpeed"] ?? 0).toDouble(),
      minFeed: (json["minFeed"] ?? 0).toDouble(),
      maxFeed: (json["maxFeed"] ?? 0).toDouble(),
      minRPM: (json["minRPM"] ?? 0).toDouble(),
      maxRPM: (json["maxRPM"] ?? 0).toDouble(),
      recommendation: json["recommendation"] ?? "",
      safe: json["safe"] ?? true,
    );
  }
=======
class MachiningResult{

  final double speed;
  final double feed;
  final double rpm;
  final double doc;
  final double machiningTime;
  final double mrr;

  MachiningResult({

    required this.speed,
    required this.feed,
    required this.rpm,
    required this.doc,
    required this.machiningTime,
    required this.mrr,

  });

>>>>>>> 9c5fb487dc294f720fb3d4a2b3f7be04454fe9ce
}