import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/constants.dart';
import 'results_page.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';
import 'package:bmi_calculator/calculator_brain.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? activeCardColour
                        : inactiveCardColour,
                    cardChild:
                        IconContent(icon: FontAwesomeIcons.mars, label: 'MALE'),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? activeCardColour
                        : inactiveCardColour,
                    cardChild: IconContent(
                        icon: FontAwesomeIcons.venus, label: 'FEMALE'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: activeCardColour,
              cardChild: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: labelTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: numberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: labelTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 20.0),
                      overlayColor: Color(0x29EB1555),
                      inactiveTrackColor: Color(0xFF8D8E98),
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xFFEB1555),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: minHeight,
                      max: maxHeight,
                      onChanged: (newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  colour: activeCardColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'WEIGHT',
                        style: labelTextStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: numberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            func: () {
                              setState(() {
                                weight--;
                              });
                            },
                          ),
                          SizedBox(width: 10.0),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            func: () {
                              setState(() {
                                weight++;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  colour: activeCardColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'AGE',
                        style: labelTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: numberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            func: () {
                              setState(() {
                                age--;
                              });
                            },
                          ),
                          SizedBox(width: 10.0),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            func: () {
                              setState(() {
                                age++;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
          BottomButton(
            onTap: () {
              CalculatorBrain calc = CalculatorBrain(height: height,weight: weight);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ResultsPage(
                    bmiResult: calc.calculateBMI(),
                    resultText: calc.getResults(),
                    interpretation: calc.getInterpretation(),
                  )));
            },
            buttonTitle: 'CALCULATE',
          )
        ],
      ),
    );
  }
}
