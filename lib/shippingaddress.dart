import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ShippingAddress extends StatefulWidget {
  const ShippingAddress({super.key});

  @override
  State<ShippingAddress> createState() => _ShippingAddressState();
}

class _ShippingAddressState extends State<ShippingAddress> {
  TextEditingController phone = TextEditingController();
  int currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[50],
        appBar: AppBar(
            title: const Text("Shipping Address"),
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(CupertinoIcons.back),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )),
        body: Column(
          children: [
            Expanded(
              child: Stepper(
                  onStepContinue: () {
                    if (currentStep != 1) {
                      setState(() {
                        currentStep++;
                      });
                    }
                  },
                  onStepCancel: () {
                    if (currentStep != 0) {
                      setState(() {
                        currentStep--;
                      });
                    }
                  },
                  onStepTapped: (value) {
                    setState(() {
                      currentStep = value;
                    });
                  },
                  currentStep: currentStep,
                  type: StepperType.horizontal,
                  steps: [
                    Step(
                        title: Text("address"),
                        content: Padding(
                          padding: EdgeInsets.all(4),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 15,
                              ),
                              Center(
                                child: Text(
                                    "Choose an address shipping from yours set addresses"),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              DropdownButton(
                                hint: Text("address"),
                                onTap: (){
                                  
                                },
                                items: [
                                DropdownMenuItem(
                                  child: Text("address 1"),
                                  value: 1,
                                ),
                                DropdownMenuItem(
                                  child: Text("address 2"),
                                  value: 2,
                                ),
                                DropdownMenuItem(
                                  child: Text("address 3"),
                                  value: 3,
                                ),
                                DropdownMenuItem(
                                  child: Text("address 4"),
                                  value: 4,
                                ),
                              ], onChanged: null)
                            ],
                          ),
                        )),
                    Step(title: Text("pricing"), content: Text("Content2")),
                  ]),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ));
  }
}
