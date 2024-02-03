import 'package:bmi/function/bmi_formula.dart';
import 'package:bmi/ui/Result_screen.dart';
import 'package:bmi/utils/colors.dart';
import 'package:bmi/widgets/CustomIcontext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/Custom_Card.dart';
enum Gender{
   male,
   female,
}

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  Gender? selectedGenter;
  int weight=100;
  int age=17;
  int hight=183;
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR',style: TextStyle(
          color: whiteColor,
        ),),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(

                  child: InkWell(
                    onTap: (){
                      setState(() {
                        selectedGenter==Gender.male;
                      });
                    },
                    child: CustomCard(
                      color: selectedGenter==Gender.male
                      ?activeCardColour: inActiveCardColor,

                      childWidget: const CustomIcon(
                        icon: (Icons.male),
                        text: "Male",

                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: (){
                      setState(() {
                        selectedGenter=Gender.female;
                      });
                    },
                    child: CustomCard(
                      color: selectedGenter==Gender.female
                       ?activeCardColour: inActiveCardColor,

                      childWidget: CustomIcon(
                        icon: (Icons.female),
                        text: "Female",

                      ),
                    ),
                  ),
                )

              ],
            ),
          ),
          Expanded(
            child: CustomCard(
              color: inActiveCardColor,
              childWidget: Column(
                children: [
                  Text("Hight",style: TextStyle(
                    fontSize: 18,color: whiteColor,
                  ),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                   textBaseline: TextBaseline.ideographic,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: [
                      Text(hight.toString(),style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: whiteColor,

                      ),),
                      Text("cm",style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: whiteColor,

                      ),),

                    ],
                  ),
                  Slider(
                    min: 120,
                      max: 220,
                      value: hight.toDouble(), onChanged: (double value){
                     setState(() {
                       hight=value.round();
                     });
                  })

                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(

                  child: CustomCard(
                    color: inActiveCardColor,
                    childWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'WEIGHT',style: TextStyle(
                          fontSize: 18,
                          color:whiteColor,
                        )
                      ),
                         Text(
                        weight.toString(),style: TextStyle(
                          fontSize: 50,
                          color:whiteColor,
                       ),

                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              heroTag: null,
                              onPressed: () {
                            setState(() {
                              weight--;
                            });
                              },
                              backgroundColor: const Color(0xFF4C4F5E),
                              child: Icon(Icons.remove,size: 30,color: Colors.white,),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            FloatingActionButton(
                              heroTag: null,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              backgroundColor: const Color(0xFF4C4F5E),
                              child:  Icon(Icons.add,size: 30,color: Colors.white,),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(

                  child: CustomCard(
                    color: inActiveCardColor,
                    childWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                            'AGE',style: TextStyle(
                          fontSize: 18,
                          color:whiteColor,
                        )
                        ),
                        Text(
                          age.toString(),style: TextStyle(
                          fontSize: 50,
                          color:whiteColor,
                        ),

                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              heroTag: null,
                              onPressed: () {
                             setState(() {

                               age--;
                             });
                              },
                              backgroundColor: const Color(0xFF4C4F5E),
                              child: Icon(Icons.remove,size: 30,color: Colors.white,),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            FloatingActionButton(
                              heroTag: null,
                              onPressed: () {
                              setState(() {
                                age++;
                              });
                              },
                              backgroundColor: const Color(0xFF4C4F5E),
                              child:  Icon(Icons.add,size: 30,color: Colors.white,),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),


              ],
            ),
          ),
          InkWell(
            onTap: (){
             CalculatorBrain cal= CalculatorBrain(height: hight,weight: weight);
            final  bmi=cal.getCalculatedBMI();
            final text=cal.getResultDetails();
            final details=cal.getResultText();

              Navigator.push(context, MaterialPageRoute(builder: (_)=>ResultScreen(
                  text: text,
                  result: bmi,
                  details: details
              )));
            },
            child: Container(
              height: 80,
              width: double.infinity,
              margin: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                color: const Color(0xFFEB1455),
                borderRadius: BorderRadius.circular(10)
              ),
              child:  Center(
                child: Text(
                  'CALCULATE',
                  style: TextStyle(fontSize: 25,
                    color: whiteColor,
                  ),
                ),
              ),
            ),
          )

        ],
      ),
    );
  }
}
