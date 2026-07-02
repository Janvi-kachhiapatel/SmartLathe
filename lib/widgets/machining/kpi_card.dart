// import 'package:flutter/material.dart';

// class KpiCard extends StatelessWidget {

//   final IconData icon;
//   final String title;
//   final String value;
//   final String unit;


//   final IconData icon;
//   final String title;
//   final String value;

//   final Color color;

//   const KpiCard({
//     super.key,
//     required this.icon,
//     required this.title,
//     required this.value,

//     required this.unit,

//     required this.unit,

//     required this.color,
//   });

//   @override
//   Widget build(BuildContext context) {

//     return Container(
//       height: 145,
//       padding: const EdgeInsets.symmetric(
//         horizontal: 12,
//         vertical: 16,
//       ),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(18),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.shade200,
//             blurRadius: 12,
//             offset: const Offset(0, 5),
//           ),
//         ],
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           Icon(
//             icon,
//             size: 30,
//             color: color,
//           ),
//           Text(
//             title,
//             style: const TextStyle(
//               fontWeight: FontWeight.w600,
//               fontSize: 15,
//             ),
//           ),
//           Text(
//             value,
//             style: TextStyle(
//               fontSize: 28,
//               color: color,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           Text(
//             unit,
//             style: const TextStyle(
//               fontSize: 13,
//               color: Colors.grey,
//             ),
//           ),
//         ],
//       ),
//     );
//   }


//     return Container(

//       padding: const EdgeInsets.all(18),

//       decoration: BoxDecoration(

//         color: Colors.white,

//         borderRadius: BorderRadius.circular(18),

//         boxShadow: const [

//           BoxShadow(
//             blurRadius: 8,
//             color: Colors.black12,
//           )

//         ],

//       ),

//       child: Column(

//         children: [

//           CircleAvatar(

//             radius: 25,

//             backgroundColor: color.withOpacity(.15),

//             child: Icon(icon,color: color),

//           ),

//           const SizedBox(height:12),

//           Text(
//             title,
//             style: const TextStyle(
//               fontWeight: FontWeight.bold,
//             ),
//           ),

//           const SizedBox(height:8),

//           Text(
//             value,
//             style: TextStyle(
//               fontSize:22,
//               color: color,
//               fontWeight: FontWeight.bold,
//             ),
//           )

//         ],

//       ),

//     );

//   }

// }
import 'package:flutter/material.dart';

class KpiCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final String unit;
  final Color color;

  const KpiCard({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    required this.unit,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: color.withOpacity(.15),
            child: Icon(icon, color: color, size: 26),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: 24,
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            unit,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}