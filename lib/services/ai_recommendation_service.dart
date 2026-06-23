class AIRecommendationService {
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 292fff0476037f438e8d105c003a0f2e0c69c191
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
<<<<<<< HEAD
=======

static List<String> generate({

required double recommendedRPM,

required double actualRPM,

required double vibration,

required double temperature,

}){

List<String> tips=[];

if(actualRPM<recommendedRPM-50){

tips.add(
"Increase spindle RPM to improve cutting efficiency.");

}

if(actualRPM>recommendedRPM+50){

tips.add(
"Reduce spindle RPM to prevent tool wear.");

}

if(vibration>2){

tips.add(
"High vibration detected. Check tool clamping.");

}

if(temperature>50){

tips.add(
"Temperature is high. Use coolant.");

}

if(tips.isEmpty){

tips.add(
"Machine operating within optimal conditions.");

}

return tips;

}

>>>>>>> 9c5fb487dc294f720fb3d4a2b3f7be04454fe9ce
=======
>>>>>>> 292fff0476037f438e8d105c003a0f2e0c69c191
}