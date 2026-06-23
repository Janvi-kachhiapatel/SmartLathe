class CuttingSpeedTable {
  static const Map<String, dynamic> table = {
    "Gray Cast Iron": {
      "HSS": {
        "Roughing": [0.3, 0.4],
        "Finishing": [0.6, 0.8],
      },
      "Carbide": {
        "Roughing": [0.7, 1.0],
        "Finishing": [1.2, 2.0],
      },
    },

    "Mild Steel": {
      "HSS": {
        "Roughing": [0.40, 0.60],
        "Finishing": [1.0, 1.5],
      },
      "Carbide": {
        "Roughing": [1.5, 2.0],
        "Finishing": [1.5, 3.0],
      },
    },

    "Copper Alloy": {
      "HSS": {
        "Roughing": [0.8, 1.0],
        "Finishing": [1.2, 1.5],
      },
      "Carbide": {
        "Roughing": [2.0, 2.5],
        "Finishing": [3.0, 3.5],
      },
    },

    "Aluminium Alloy": {
      "HSS": {
        "Roughing": [0.5, 0.9],
        "Finishing": [1.0, 2.0],
      },
      "Carbide": {
        "Roughing": [1.0, 1.5],
        "Finishing": [3.0, 3.5],
      },
    },
  };

  static double getCuttingSpeed({
    required String material,
    required String tool,
    required String operation,
  }) {
    final List values = table[material][tool][operation];

    return ((values[0] + values[1]) / 2).toDouble();
  }
}