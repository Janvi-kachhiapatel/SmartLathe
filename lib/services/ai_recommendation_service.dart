class AIRecommendationService {
  static List<String> generate({
    required double recommendedRPM,
    required double actualRPM,
    required double recommendedFeed,
    required double actualFeed,
    required double vibration,
    required double temperature,
    required double power,
  }) {
    List<String> tips = [];

    // RPM
    if (actualRPM < recommendedRPM * 0.95) {
      tips.add("🟡 Increase spindle RPM.");
    } else if (actualRPM > recommendedRPM * 1.05) {
      tips.add("🟡 Reduce spindle RPM.");
    } else {
      tips.add("🟢 RPM is within recommended range.");
    }

    // Feed
    if (actualFeed > recommendedFeed * 1.10) {
      tips.add("🟠 Feed is higher than recommended.");
    } else {
      tips.add("🟢 Feed rate is normal.");
    }

    // Temperature
    if (temperature > 55) {
      tips.add("🔴 High temperature detected. Check coolant.");
    } else {
      tips.add("🟢 Temperature is normal.");
    }

    // Vibration
    if (vibration > 2.5) {
      tips.add("🔴 Excessive vibration detected.");
    } else {
      tips.add("🟢 Vibration is within limits.");
    }

    // Power
    if (power > 4.5) {
      tips.add("🟠 Power consumption is high.");
    }

    return tips;
  }
}