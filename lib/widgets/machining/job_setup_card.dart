import 'package:flutter/material.dart';

class JobSetupCard extends StatelessWidget {
  final String? tool;
  final String? material;
  final String? operation;
  final bool finishing;

  final TextEditingController diameterController;

  final ValueChanged<String?> onToolChanged;
  final ValueChanged<String?> onMaterialChanged;
  final ValueChanged<String?> onOperationChanged;
  final ValueChanged<bool> onFinishChanged;
  final VoidCallback onCalculate;

  const JobSetupCard({
    super.key,
    required this.tool,
    required this.material,
    required this.operation,
    required this.finishing,
    required this.diameterController,
    required this.onToolChanged,
    required this.onMaterialChanged,
    required this.onOperationChanged,
    required this.onFinishChanged,
    required this.onCalculate,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [

            const Row(
              children: [
                Icon(Icons.engineering,color: Colors.blue),
                SizedBox(width:10),
                Text(
                  "Job Setup",
                  style: TextStyle(
                    fontSize:22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            const SizedBox(height:20),

            DropdownButtonFormField<String>(
              value: tool,
              decoration: const InputDecoration(
                labelText: "Tool Material",
                border: OutlineInputBorder(),
              ),
              items: const [

                DropdownMenuItem(
                    value:"HSS",
                    child: Text("HSS")),

                DropdownMenuItem(
                    value:"Carbide",
                    child: Text("Carbide")),

                DropdownMenuItem(
                    value:"Ceramic",
                    child: Text("Ceramic")),

              ],
              onChanged:onToolChanged,
            ),

            const SizedBox(height:16),

            DropdownButtonFormField<String>(
              value: material,
              decoration: const InputDecoration(
                labelText:"Workpiece Material",
                border: OutlineInputBorder(),
              ),
              items: const [

                DropdownMenuItem(
                    value:"Mild Steel",
                    child: Text("Mild Steel")),

                DropdownMenuItem(
                    value:"Aluminium Alloy",
                    child: Text("Aluminium Alloy")),

                DropdownMenuItem(
                    value:"Copper Alloy",
                    child: Text("Copper Alloy")),

                DropdownMenuItem(
                    value:"Gray Cast Iron",
                    child: Text("Gray Cast Iron")),

              ],
              onChanged:onMaterialChanged,
            ),

            const SizedBox(height:16),

            DropdownButtonFormField<String>(
              value: operation,
              decoration: const InputDecoration(
                labelText:"Operation",
                border: OutlineInputBorder(),
              ),
              items: const [

                DropdownMenuItem(
                    value:"Turning",
                    child: Text("Turning")),

                DropdownMenuItem(
                    value:"Facing",
                    child: Text("Facing")),

                DropdownMenuItem(
                    value:"Threading",
                    child: Text("Threading")),

              ],
              onChanged:onOperationChanged,
            ),

            const SizedBox(height:16),

            TextField(
              controller: diameterController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText:"Diameter (mm)",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height:16),

            SwitchListTile(
              value: finishing,
              title: const Text("Finishing"),
              onChanged:onFinishChanged,
            ),

            const SizedBox(height:18),

            SizedBox(
              width: double.infinity,
              height:55,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.calculate),
                label: const Text(
                  "Calculate Recommendation",
                ),
                onPressed:onCalculate,
              ),
            ),
          ],
        ),
      ),
    );
  }
}