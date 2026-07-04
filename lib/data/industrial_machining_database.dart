// class IndustrialMachiningDatabase {
//   static const Map<String, dynamic> database = {
//     //--------------------------------------------------
//     // Mild Steel
//     //--------------------------------------------------
//     "Mild Steel": {
//       "HSS": {
//         "Roughing": {
//           "speedMin": 25.0,
//           "speedMax": 35.0,
//           "feedMin": 0.25,
//           "feedMax": 0.45,
//           "doc": 2.5,
//         },
//         "Finishing": {
//           "speedMin": 35.0,
//           "speedMax": 45.0,
//           "feedMin": 0.10,
//           "feedMax": 0.20,
//           "doc": 0.80,
//         }
//       },

//       "Carbide": {
//         "Roughing": {
//           "speedMin": 90.0,
//           "speedMax": 130.0,
//           "feedMin": 0.30,
//           "feedMax": 0.60,
//           "doc": 3.50,
//         },
//         "Finishing": {
//           "speedMin": 130.0,
//           "speedMax": 180.0,
//           "feedMin": 0.12,
//           "feedMax": 0.30,
//           "doc": 1.00,
//         }
//       }
//     },

//     //--------------------------------------------------
//     // Stainless Steel
//     //--------------------------------------------------
//     "SS304": {
//       "HSS": {
//         "Roughing": {
//           "speedMin": 18.0,
//           "speedMax": 28.0,
//           "feedMin": 0.20,
//           "feedMax": 0.35,
//           "doc": 2.0,
//         },
//         "Finishing": {
//           "speedMin": 28.0,
//           "speedMax": 38.0,
//           "feedMin": 0.10,
//           "feedMax": 0.20,
//           "doc": 0.80,
//         }
//       },

//       "Carbide": {
//         "Roughing": {
//           "speedMin": 70.0,
//           "speedMax": 110.0,
//           "feedMin": 0.25,
//           "feedMax": 0.45,
//           "doc": 3.00,
//         },
//         "Finishing": {
//           "speedMin": 120.0,
//           "speedMax": 180.0,
//           "feedMin": 0.10,
//           "feedMax": 0.25,
//           "doc": 1.00,
//         }
//       }
//     },

//     //--------------------------------------------------
//     // Cast Iron
//     //--------------------------------------------------
//     "Cast Iron": {
//       "HSS": {
//         "Roughing": {
//           "speedMin": 18.0,
//           "speedMax": 28.0,
//           "feedMin": 0.30,
//           "feedMax": 0.60,
//           "doc": 3.0,
//         },
//         "Finishing": {
//           "speedMin": 30.0,
//           "speedMax": 40.0,
//           "feedMin": 0.12,
//           "feedMax": 0.22,
//           "doc": 1.0,
//         }
//       },

//       "Carbide": {
//         "Roughing": {
//           "speedMin": 100.0,
//           "speedMax": 170.0,
//           "feedMin": 0.35,
//           "feedMax": 0.70,
//           "doc": 4.0,
//         },
//         "Finishing": {
//           "speedMin": 180.0,
//           "speedMax": 250.0,
//           "feedMin": 0.15,
//           "feedMax": 0.30,
//           "doc": 1.20,
//         }
//       }
//     },

//     //--------------------------------------------------
//     // Aluminium
//     //--------------------------------------------------
//     "Aluminium Alloy": {
//       "HSS": {
//         "Roughing": {
//           "speedMin": 80.0,
//           "speedMax": 120.0,
//           "feedMin": 0.30,
//           "feedMax": 0.60,
//           "doc": 3.5,
//         },
//         "Finishing": {
//           "speedMin": 120.0,
//           "speedMax": 180.0,
//           "feedMin": 0.15,
//           "feedMax": 0.30,
//           "doc": 1.00,
//         }
//       },

//       "Carbide": {
//         "Roughing": {
//           "speedMin": 250.0,
//           "speedMax": 400.0,
//           "feedMin": 0.35,
//           "feedMax": 0.80,
//           "doc": 5.0,
//         },
//         "Finishing": {
//           "speedMin": 400.0,
//           "speedMax": 650.0,
//           "feedMin": 0.15,
//           "feedMax": 0.35,
//           "doc": 1.50,
//         }
//       }
//     },

//     //--------------------------------------------------
//     // Copper
//     //--------------------------------------------------
//     "Copper": {
//       "HSS": {
//         "Roughing": {
//           "speedMin": 60.0,
//           "speedMax": 90.0,
//           "feedMin": 0.25,
//           "feedMax": 0.45,
//           "doc": 2.5,
//         },
//         "Finishing": {
//           "speedMin": 90.0,
//           "speedMax": 120.0,
//           "feedMin": 0.10,
//           "feedMax": 0.20,
//           "doc": 0.80,
//         }
//       },

//       "Carbide": {
//         "Roughing": {
//           "speedMin": 180.0,
//           "speedMax": 260.0,
//           "feedMin": 0.30,
//           "feedMax": 0.60,
//           "doc": 3.50,
//         },
//         "Finishing": {
//           "speedMin": 260.0,
//           "speedMax": 380.0,
//           "feedMin": 0.12,
//           "feedMax": 0.25,
//           "doc": 1.0,
//         }
//       }
//     }
//   };
// }
class IndustrialMachiningDatabase {
  // ---------------- TABLE 2.5.1 ----------------
  // Cutting Speed (m/s)

  static const cuttingSpeedTable = {
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

    "Copper Alloys": {
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

  // ---------------- TABLE 2.5.2 ----------------
  // Feed (mm/rev)

  static const feedTable = {
    "Gray Cast Iron": {
      "Turning": [0.25, 0.32],
      "Drilling": [0.35, 0.52],
      "Thread Cutting": [0.12, 0.14],
      "Reaming": [0.10, 0.13],
    },

    "Mild Steel": {
      "Turning": [0.42, 0.52],
      "Drilling": [0.47, 0.58],
      "Thread Cutting": [0.15, 0.17],
      "Reaming": [0.17, 0.25],
    },

    "Copper Alloys": {
      "Turning": [0.80, 1.00],
      "Drilling": [0.42, 0.75],
      "Thread Cutting": [0.25, 0.40],
      "Reaming": [0.12, 0.25],
    },

    "Aluminium Alloy": {
      "Turning": [0.50, 0.90],
      "Drilling": [0.50, 0.90],
      "Thread Cutting": [0.20, 0.30],
      "Reaming": [0.30, 0.40],
    },
  };
}