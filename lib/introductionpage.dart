import "package:e_commerce_app/signuppage.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
// For JSON decoding

class IntroductionPage extends StatefulWidget {
  const IntroductionPage({super.key});

  @override
  State<IntroductionPage> createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  int currentStep = 1;
  List<Widget> introductionscreens = [
    Center(
      child: Column(
        children: [
        
          Image.asset(
            "assets/intro3.jpg",
            width: double.infinity,
            fit: BoxFit.cover,
            
          ),
          const SizedBox(
            height: 100,
          ),
          const Text(
            "Set your Location",
            style: TextStyle(color: Colors.orangeAccent, fontSize: 25,fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 40,
          ),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "Allow the app to access your current location and choose any thing you want from the store",
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
          ),
          

        ],
      ),
    ),
    Center(
      child: Column(
        children: [
         
          Image.asset(
            "assets/intro1.jpg",
            height: 200,
            width: double.infinity,
            
          ),
          const SizedBox(
            height: 100,
          ),
          const Text(
            "Set your Location",
            style: TextStyle(color: Colors.orangeAccent, fontSize: 25),
          ),
          const SizedBox(
            height: 40,
          ),
          const Text(
            "Allow the app to access your current location and choose any thing you want from the store",
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
          const Text("Step2"),
        ],
      ),
    ),
    Center(
      child: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          Image.asset(
            "assets/intro1.jpg",
          ),
          const SizedBox(
            height: 100,
          ),
          const Text(
            "Set your Location",
            style: TextStyle(color: Colors.orangeAccent, fontSize: 25,fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 40,
          ),
          const Text(
            "Allow the app to access your current location and choose any thing you want from the store",
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
          const Text("Step3"),
        ],
      ),
    )
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          children: [
            Expanded( child: introductionscreens[currentStep - 1]),
           
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                AnimatedContainer(
                  color: Colors.orange,
                  height: 5,
                  duration: const Duration(seconds: 2),
                  child: Container(
                    width: currentStep == 1
                        ? MediaQuery.of(context).size.width / 3
                        : currentStep == 2
                            ? MediaQuery.of(context).size.width * (2 / 3)
                            : MediaQuery.of(context).size.width,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {
                          if (currentStep != 1) {
                            setState(() {
                              currentStep--;
                            });
                          }
                        },
                        child: const Text("Previous")),
                    TextButton(
                        onPressed: () {
                          if (currentStep != 3) {
                            setState(() {
                              currentStep++;
                            });
                          } else {
                            Navigator.of(context).pushReplacement(
                                CupertinoPageRoute(
                                    builder: (context) => const SignUpPage()));
                          }
                        },
                        child: const Text("Next"))
                  ],
                )
              ],
            )
          ],
        
      ),
    );
  }
}
