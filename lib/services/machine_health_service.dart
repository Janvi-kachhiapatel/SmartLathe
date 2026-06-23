int health = 100;

class MachineHealthService {

  static int calculateHealth({

    required double recommendedRPM,
    required double liveRPM,

    required double temperature,

    required double vibration,

  }) {

    int health = 100;

    //---------------- RPM ----------------

    final diff =
        ((recommendedRPM - liveRPM).abs() /
                recommendedRPM) *
            100;

    if (diff > 15) {
      health -= 20;
    }

    //---------------- Temperature ----------------

    if (temperature > 55) {

      health -= 15;

    }

    //---------------- Vibration ----------------

    if (vibration > 4) {

      health -= 25;

    }

    if (health < 0) health = 0;

    return health;

    
  }
  
}