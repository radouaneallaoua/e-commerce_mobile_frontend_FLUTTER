import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                        title: const Text("address"),
                        content: Padding(
                          padding: const EdgeInsets.all(4),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 15,
                              ),
                              const Center(
                                child: Text(
                                    "Choose an address shipping from yours set addresses"),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              DropdownButton(
                                hint: const Text("address"),
                                onTap: (){
                                  
                                },
                                items: const [
                                DropdownMenuItem(
                                  value: 1,
                                  child: Text("address 1"),
                                ),
                                DropdownMenuItem(
                                  value: 2,
                                  child: Text("address 2"),
                                ),
                                DropdownMenuItem(
                                  value: 3,
                                  child: Text("address 3"),
                                ),
                                DropdownMenuItem(
                                  value: 4,
                                  child: Text("address 4"),
                                ),
                              ], onChanged: null)
                            ],
                          ),
                        )),
                    const Step(title: Text("pricing"), content: Text("Content2")),
                  ]),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ));
  }
}
