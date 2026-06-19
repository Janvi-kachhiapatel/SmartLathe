class FeedTable {
  static const Map<String, double> roughingFeed = {
    "Gray Cast Iron": 0.60,
    "Mild Steel": 0.50,
    "Copper Alloy": 0.40,
    "Aluminium Alloy": 0.45,
  };

  static const Map<String, double> finishingFeed = {
    "Gray Cast Iron": 0.20,
    "Mild Steel": 0.25,
    "Copper Alloy": 0.20,
    "Aluminium Alloy": 0.15,
  };

  static double getFeed({
    required String material,
    required String operation,
  }) {
    if (operation == "Roughing") {
      return roughingFeed[material] ?? 0.4;
    }

    return finishingFeed[material] ?? 0.2;
  }
}