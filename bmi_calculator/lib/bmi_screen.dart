import 'package:flutter/material.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({super.key});

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  double sliderValue = 0;
  double weightValue = 0;
  double ageValue = 0;
  String gender = "";

  //------------//
  double bmiResult = 0;
  //------------//

  double calculateBmi() {
    double heightMeter = sliderValue / 100;
    return weightValue / (heightMeter * heightMeter);
  }

  String bmiCategory() {
    double bmi = calculateBmi();

    if (bmi < 17) {
      return "berat badan rendah";
    } else if (bmi >= 17 && bmi <= 25) {
      return "Berat badan normal";
    } else if (bmi >= 25 && bmi <= 27) {
      return "berat badan berlebih";
    } else if (bmi > 27) {
      return "Obesitas, segera kedokter";
    } else {
      return "error";
    }
  }

  /*
  BMI Normal berada pada kisaran 17-25
Jika angka BMI melebihi 25, maka kamu memiliki berat badan berlebih
Jika angka BMI berada di bawah 17, maka kamu memiliki berat badan rendah
Jika angka BMI sudah melebihi angka 27, sebaiknya segera dilakukan penanganan untuk mencegah timbulnya penyakit
   */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D1232),
      appBar: AppBar(
        backgroundColor: const Color(0xFF121639),
        centerTitle: true,
        title: const Text(
          "BMI CALCULATOR",
          style:
              TextStyle(color: Color(0xFFCBCFEB), fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
        child: ListView(
          children: [
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        gender = "male";
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: const Color.fromARGB(255, 34, 37, 70),
                      ),
                      height: 160,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.male,
                            size: 85,
                            color: gender == "male"
                                ? const Color(0xFFEEEEF7)
                                : const Color(0xFF686C8A),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "MALE",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: gender == "male"
                                  ? const Color(0xFFEEEEF7)
                                  : const Color(0xFF686C8A),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        gender = "female";
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: const Color.fromARGB(255, 34, 37, 70),
                      ),
                      height: 160,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.female,
                            size: 85,
                            color: gender == "female"
                                ? const Color(0xFFEEEEF7)
                                : const Color(0xFF686C8A),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "FEMALE",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: gender == "female"
                                  ? const Color(0xFFEEEEF7)
                                  : const Color(0xFF686C8A),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: const Color(0xFF13173C),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    "HEIGHT",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Color(0xFFCBCFEB)),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        sliderValue.round().toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 70,
                            color: Color(0xFFEEEEF7)),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 12),
                        child: Text(
                          "cm",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 19,
                              color: Color(0xFFEEEEF7)),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: SliderTheme(
                      data: const SliderThemeData(
                        showValueIndicator: ShowValueIndicator.never,
                      ),
                      child: Slider(
                        thumbColor: const Color(0xFFFE0066),
                        activeColor: const Color(0xFFFE0066),
                        inactiveColor: const Color(0xFFEEEEF7),
                        secondaryActiveColor: Colors.lime,
                        overlayColor: MaterialStatePropertyAll(
                          const Color(0xFFFE0066).withOpacity(0.3),
                        ),
                        max: 300,
                        divisions: 300,
                        value: sliderValue,
                        label: sliderValue.round().toString(),
                        onChanged: (double value) {
                          setState(() {
                            sliderValue = value;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color(0xFF13173C),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "WEIGHT",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Color(0xFFCBCFEB)),
                        ),
                        Text(
                          weightValue.round().toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 70,
                              color: Color(0xFFEEEEF7)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  if (weightValue >= 1) {
                                    weightValue--;
                                  }
                                });
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                  Colors.white.withOpacity(0.05),
                                ),
                              ),
                              icon: const Icon(
                                Icons.remove,
                                size: 40,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  weightValue++;
                                });
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                  Colors.white.withOpacity(0.05),
                                ),
                              ),
                              icon: const Icon(
                                Icons.add,
                                size: 40,
                                color: Colors.white,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color(0xFF13173C),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "AGE",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Color(0xFFCBCFEB)),
                        ),
                        Text(
                          ageValue.round().toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 70,
                              color: Color(0xFFEEEEF7)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  if (ageValue >= 1) {
                                    ageValue--;
                                  }
                                });
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                  Colors.white.withOpacity(0.05),
                                ),
                              ),
                              icon: const Icon(
                                Icons.remove,
                                size: 40,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  ageValue++;
                                });
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                  Colors.white.withOpacity(0.05),
                                ),
                              ),
                              icon: const Icon(
                                Icons.add,
                                size: 40,
                                color: Colors.white,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Spacer(),
            TextButton(
                style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Color(0xFFFE0066))),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text(
                        "Your BMI",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Colors.black),
                      ),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            calculateBmi().toStringAsFixed(1).toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 85,
                                color: Color.fromARGB(255, 0, 0, 0)),
                          ),
                          Text(
                            bmiCategory(),
                            style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 17,
                                color: Color.fromARGB(255, 0, 0, 0)),
                          ),
                        ],
                      ),
                      actions: <Widget>[
                        TextButton(
                          style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Color(0xFFFE0066))),
                          onPressed: () {
                            setState(() {
                              calculateBmi();
                            });
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            "Ok",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                child: const Text(
                  "CALCULATE YOUR BMI",
                  style: TextStyle(color: Colors.white),
                )),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
