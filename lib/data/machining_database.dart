class MachiningDatabase {

  static const Map<String, Map<String, dynamic>> cuttingData = {

<<<<<<< HEAD
    "Mild Steel": {

  "HSS": {

    "recommendedSpeed":180,

    "minSpeed":160,

    "maxSpeed":200,

    "recommendedFeed":0.35,

    "minFeed":0.25,

    "maxFeed":0.45,

    "recommendedDOC":2.0,

    "minDOC":1.5,

    "maxDOC":3.0,

  },

  "Carbide":{

    "recommendedSpeed":250,

    "minSpeed":220,

    "maxSpeed":280,

    "recommendedFeed":0.45,

    "minFeed":0.30,

    "maxFeed":0.60,

    "recommendedDOC":3.0,

    "minDOC":2.0,

    "maxDOC":4.0,

  }


=======
    "Mild Steel":{

      "HSS":{
        "speed":30,
        "feed":0.18,
        "doc":2.0,
      },

      "Carbide":{
        "speed":160,
        "feed":0.32,
        "doc":3.0,
      }
>>>>>>> 9c5fb487dc294f720fb3d4a2b3f7be04454fe9ce

    },

    "Aluminium":{

      "HSS":{
        "speed":90,
        "feed":0.25,
        "doc":2.5,
      },

      "Carbide":{
        "speed":320,
        "feed":0.45,
        "doc":4,
      }

    },

    "Cast Iron":{

      "HSS":{
        "speed":22,
        "feed":0.15,
        "doc":2,
      },

      "Carbide":{
        "speed":140,
        "feed":0.28,
        "doc":3,
      }

    },

    "SS304":{

      "HSS":{
        "speed":18,
        "feed":0.12,
        "doc":1.5,
      },

      "Carbide":{
        "speed":90,
        "feed":0.20,
        "doc":2.5,
      }

    }

  };

}