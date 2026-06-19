// class MachiningResult {

//   // Recommended values
//   final double speed;
//   final double feed;
//   final double rpm;
//   final double doc;

//   // Safe limits
//   final double minSpeed;
//   final double maxSpeed;

//   final double minFeed;
//   final double maxFeed;

//   final double minRPM;
//   final double maxRPM;

//   final double minDOC;
//   final double maxDOC;

//   // Calculated values
//   final double machiningTime;
//   final double mrr;

//   const MachiningResult({

//     required this.speed,
//     required this.feed,
//     required this.rpm,
//     required this.doc,

//     required this.minSpeed,
//     required this.maxSpeed,

//     required this.minFeed,
//     required this.maxFeed,

//     required this.minRPM,
//     required this.maxRPM,

//     required this.minDOC,
//     required this.maxDOC,

//     required this.machiningTime,
//     required this.mrr,
//   });

// }

class MachiningResult {
  final double speed;
  final double feed;
  final double rpm;
  final double doc;
  final double machiningTime;
  final double mrr;

  const MachiningResult({
    required this.speed,
    required this.feed,
    required this.rpm,
    required this.doc,
    required this.machiningTime,
    required this.mrr,
  });
}