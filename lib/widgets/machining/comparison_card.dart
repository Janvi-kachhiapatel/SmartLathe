import 'package:flutter/material.dart';

class ComparisonCard extends StatelessWidget {

  final String title;

  final String recommended;

  final String actual;

  final Color color;

  const ComparisonCard({

    super.key,

    required this.title,

    required this.recommended,

    required this.actual,

    required this.color,

  });

  @override
  Widget build(BuildContext context) {

    return Card(

      elevation: 2,

      child: Padding(

        padding: const EdgeInsets.all(15),

        child: Row(

          children: [

            Expanded(

              flex: 2,

              child: Text(

                title,

                style: const TextStyle(

                  fontWeight: FontWeight.bold,

                ),

              ),

            ),

            Expanded(

              child: Text(

                recommended,

                textAlign: TextAlign.center,

              ),

            ),

            Expanded(

              child: Text(

                actual,

                textAlign: TextAlign.center,

              ),

            ),

            CircleAvatar(

              radius: 8,

              backgroundColor: color,

            )

          ],

        ),

      ),

    );

  }

}