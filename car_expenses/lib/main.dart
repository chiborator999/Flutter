import 'package:car_expenses/inputField.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Car Expenses Calculator',
      home: CarExpensesApp(),
    );
  }
}

class CarExpensesApp extends StatefulWidget {
  const CarExpensesApp({super.key});

  @override
  State<CarExpensesApp> createState() => _CarExpensesAppState();
}

class _CarExpensesAppState extends State<CarExpensesApp> {
  final taxController = new TextEditingController();
  final insuranceController = new TextEditingController();
  final inspectionController = new TextEditingController();
  final maintenanceController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final inputFieldTextList = [
      'Car tax',
      'Car insurance',
      'Annual car inspection',
      'Annual car maintenance',
    ];

    double Sum() {
      var sumTax = double.tryParse(taxController.text);
      var sumInsurance = double.tryParse(insuranceController.text);
      var sumInspection = double.tryParse(inspectionController.text);
      var sumMaintenance = double.tryParse(maintenanceController.text);
      return (sumTax ?? 0) +
          (sumInsurance ?? 0) +
          (sumInspection ?? 0) +
          (sumMaintenance ?? 0);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Car Expenses Calculator'),
        centerTitle: true,
      ),
      body: Column(children: [
        InputField(inputFieldTextList[0], taxController),
        InputField(inputFieldTextList[1], insuranceController),
        InputField(inputFieldTextList[2], inspectionController),
        InputField(inputFieldTextList[3], maintenanceController),
      ]),
      floatingActionButton: Wrap(direction: Axis.horizontal, children: [
        Container(
            margin: EdgeInsets.all(10),
            child: FloatingActionButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                        content: Container(
                      child: Text(
                        '${(Sum() / 12).toStringAsFixed(2)}/month\n${(Sum() / 52).toStringAsFixed(2)}/week\n${(Sum() / 8766).toStringAsFixed(2)}/hour\n${(Sum() / 525960).toStringAsFixed(5)}/minutes\n${(Sum() / 31536000).toStringAsFixed(6)}/seconds',
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.blueAccent.shade400),
                      ),
                    ));
                  },
                );
              },
              tooltip: 'Show me the value!',
              child: const Icon(Icons.calculate_outlined),
            )),
        Container(
            margin: EdgeInsets.all(10),
            child: FloatingActionButton(
              onPressed: () {
                taxController.clear();
                insuranceController.clear();
                inspectionController.clear();
                maintenanceController.clear();
              },
              child: const Icon(Icons.restart_alt_outlined),
            ))
      ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
