class AlarmService {
  static List<Map<String, dynamic>> generate(
      Map<String, dynamic> data,
      bool backendConnected) {

    List<Map<String, dynamic>> alarms = [];

    void addAlarm(
      String title,
      String severity,
      dynamic value,
    ) {
      alarms.add({
        "title": title,
        "severity": severity,
        "value": value,
        "time": DateTime.now(),
      });
    }

    // ------------------------
    // Backend
    // ------------------------

    if (!backendConnected) {
      addAlarm(
        "Backend Connection Lost",
        "CRITICAL",
        "",
      );
      return alarms;
    }

    // ------------------------
    // Machine
    // ------------------------

    final machine =
        (data["machine"]?["status"] ?? "OFF");

    if (machine != "ON") {
      addAlarm(
        "Machine Stopped",
        "INFO",
        "",
      );
    }

    // ------------------------
    // Emergency
    // ------------------------

    if ((data["chuck"]?["red_buzzer"] ?? 0) == 1) {
      addAlarm(
        "Emergency Stop Activated",
        "CRITICAL",
        "",
      );
    }

    // ------------------------
    // Chuck
    // ------------------------

    if ((data["chuck"]?["chuck_on"] ?? 0) == 0) {
      addAlarm(
        "Chuck Open",
        "WARNING",
        "",
      );
    }

    // ------------------------
    // RPM
    // ------------------------

    double rpm =
        (data["vibit1"]?["rpm"] ?? 0).toDouble();

    if (machine == "ON" && rpm < 300) {
      addAlarm(
        "Low RPM",
        "WARNING",
        rpm,
      );
    }

    if (rpm > 2500) {
      addAlarm(
        "RPM Overspeed",
        "CRITICAL",
        rpm,
      );
    }

    // ------------------------
    // Tool Temperature
    // ------------------------

    double toolTemp =
        (data["vibit1"]?["temperature"] ?? 0)
            .toDouble();

    if (toolTemp > 60) {
      addAlarm(
        "Tool Temperature Critical",
        "CRITICAL",
        toolTemp,
      );
    } else if (toolTemp > 50) {
      addAlarm(
        "Tool Temperature High",
        "WARNING",
        toolTemp,
      );
    } else if (toolTemp > 40) {
      addAlarm(
        "Tool Temperature Rising",
        "INFO",
        toolTemp,
      );
    }

    // ------------------------
    // Headstock Temperature
    // ------------------------

    double headTemp =
        (data["vibit2"]?["temperature"] ?? 0)
            .toDouble();

    if (headTemp > 60) {
      addAlarm(
        "Headstock Temperature Critical",
        "CRITICAL",
        headTemp,
      );
    } else if (headTemp > 50) {
      addAlarm(
        "Headstock Temperature High",
        "WARNING",
        headTemp,
      );
    }

    // ------------------------
    // Tool Vibration
    // ------------------------

    double toolVib =
        (data["vibit1"]?["z_rms_velocity"] ?? 0)
            .toDouble();

    if (toolVib > 4) {
      addAlarm(
        "Tool Vibration Critical",
        "CRITICAL",
        toolVib,
      );
    } else if (toolVib > 2.5) {
      addAlarm(
        "Tool Vibration High",
        "WARNING",
        toolVib,
      );
    }

    // ------------------------
    // Headstock Vibration
    // ------------------------

    double headVib =
        (data["vibit2"]?["z_rms_velocity"] ?? 0)
            .toDouble();

    if (headVib > 4) {
      addAlarm(
        "Headstock Vibration Critical",
        "CRITICAL",
        headVib,
      );
    } else if (headVib > 2.5) {
      addAlarm(
        "Headstock Vibration High",
        "WARNING",
        headVib,
      );
    }

    // ------------------------
    // Voltage
    // ------------------------

    double voltage =
        (data["energy"]?["data"]?["avg_voltage_LN"] ?? 230)
            .toDouble();

    if (voltage < 180 || voltage > 260) {
      addAlarm(
        "Voltage Critical",
        "CRITICAL",
        voltage,
      );
    } else if (voltage < 200) {
      addAlarm(
        "Voltage Low",
        "WARNING",
        voltage,
      );
    }

    // ------------------------
    // Current
    // ------------------------

    double current =
        (data["energy"]?["data"]?["avg_current"] ?? 0)
            .toDouble();

    if (current > 20) {
      addAlarm(
        "Current Overload",
        "CRITICAL",
        current,
      );
    } else if (current > 15) {
      addAlarm(
        "High Current",
        "WARNING",
        current,
      );
    }

    // ------------------------
    // Power Factor
    // ------------------------

    double pf =
        (data["energy"]?["data"]?["avg_PF"] ?? 1)
            .toDouble();

    if (pf < 0.80) {
      addAlarm(
        "Power Factor Low",
        "CRITICAL",
        pf,
      );
    } else if (pf < 0.90) {
      addAlarm(
        "Power Factor Warning",
        "WARNING",
        pf,
      );
    }

    // ------------------------
    // Frequency
    // ------------------------

    double frequency =
        (data["energy"]?["data"]?["frequency"] ?? 50)
            .toDouble();

    if (frequency < 48 || frequency > 52) {
      addAlarm(
        "Frequency Critical",
        "CRITICAL",
        frequency,
      );
    } else if (frequency < 49 || frequency > 51) {
      addAlarm(
        "Frequency Warning",
        "WARNING",
        frequency,
      );
    }

    return alarms;
  }
}