import 'package:flutter/material.dart';

class HealthCard extends StatelessWidget{

final double health;

const HealthCard({
super.key,
required this.health,
});

@override
Widget build(BuildContext context){

return Card(

child:Padding(

padding: const EdgeInsets.all(20),

child:Column(

children:[

const Text(

"Machine Health",

style: TextStyle(

fontSize:22,

fontWeight: FontWeight.bold,

),

),

const SizedBox(height:20),

LinearProgressIndicator(

value: health/100,

minHeight:18,

borderRadius:
BorderRadius.circular(20),

),

const SizedBox(height:20),

Text(

"${health.toStringAsFixed(0)} %",

style: const TextStyle(

fontSize:30,

fontWeight: FontWeight.bold,

),

)

],

),

),

);

}

}