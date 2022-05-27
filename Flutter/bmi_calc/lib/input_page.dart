import 'package:bmi_calculator/bmi_calc.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_content.dart';
import 'constants.dart';
import 'results_page.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = kInactiveCardColor;
  Color femaleCardColor = kInactiveCardColor;
  void updateCardColor(Gender gender) {
    if (gender == Gender.male) {
      if (maleCardColor == kInactiveCardColor) {
        maleCardColor = kActiveCardColor;
        femaleCardColor = kInactiveCardColor;
      } else {
        maleCardColor = kInactiveCardColor;
      }
    } else {
      if (femaleCardColor == kInactiveCardColor) {
        femaleCardColor = kActiveCardColor;
        maleCardColor = kInactiveCardColor;
      } else {
        femaleCardColor = kInactiveCardColor;
      }
    }
  }

  int age = 19;
  int height = 175;
  int weight = 60;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kActiveCardColor,
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          updateCardColor(Gender.male);
                        });
                      },
                      child: ReusableCard(
                        cardColor: maleCardColor,
                        cardChild: GenderCard(
                          icon: FontAwesomeIcons.mars,
                          genderName: 'MALE',
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          updateCardColor(Gender.female);
                        });
                      },
                      child: ReusableCard(
                        cardChild: GenderCard(
                          icon: FontAwesomeIcons.venus,
                          genderName: 'FEMALE',
                        ),
                        cardColor: femaleCardColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
            ReusableCard(
              cardColor: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: kLabeltextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumbertextStyle,
                      ),
                      SizedBox(
                        width: 1,
                      ),
                      Text(
                        'cm',
                        style: kLabeltextStyle,
                      ),
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    min: 100,
                    max: 250,
                    activeColor: Color(0xFFEB1555),
                    inactiveColor: Color(0xff8d8e98),
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      cardColor: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'WEIGHT',
                            style: kLabeltextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kNumbertextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              FloatingActionButton(
                                  heroTag: null,
                                  backgroundColor: Color(0xff4c4f5e),
                                  foregroundColor: Colors.white,
                                  child: Icon(FontAwesomeIcons.minus),
                                  onPressed: () {
                                    setState(() {
                                      weight--;
                                    });
                                  }),
                              SizedBox(
                                width: 10,
                              ),
                              FloatingActionButton(
                                heroTag: null,
                                backgroundColor: Color(0xff4c4f5e),
                                foregroundColor: Colors.white,
                                child: Icon(FontAwesomeIcons.plus),
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      cardColor: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'AGE',
                            style: kLabeltextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kNumbertextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              FloatingActionButton(
                                  heroTag: null,
                                  backgroundColor: Color(0xff4c4f5e),
                                  foregroundColor: Colors.white,
                                  child: Icon(FontAwesomeIcons.minus),
                                  onPressed: () {
                                    setState(() {
                                      age--;
                                    });
                                  }),
                              SizedBox(
                                width: 10,
                              ),
                              FloatingActionButton(
                                heroTag: null,
                                backgroundColor: Color(0xff4c4f5e),
                                foregroundColor: Colors.white,
                                child: Icon(FontAwesomeIcons.plus),
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                CalculatorBrain calc =
                    CalculatorBrain(height: height, weight: weight);
                print(calc.calculateBMI());
                print(calc.getResult());
                print(calc.getInterpretation());

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Results(
                      bmiResult: calc.calculateBMI(),
                      resultText: calc.getResult(),
                      interpretation: calc.getInterpretation(),
                      resultColor: calc.resultColor(),
                    ),
                  ),
                );
              },
              child: Container(
                child: Center(
                  child: Text(
                    'Calculate your BMI',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                color: Color(0xffeb1e33),
                margin: EdgeInsets.only(top: 10),
                width: double.infinity,
                height: 80,
              ),
            )
          ],
        ));
  }
}
