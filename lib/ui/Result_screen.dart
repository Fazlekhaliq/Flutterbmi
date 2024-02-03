import 'package:bmi/utils/colors.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final String text;
  final String result;
  final String details;
  const ResultScreen({super.key, required this.text, required this.result, required this.details});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator",style: TextStyle(
          color: whiteColor,
        ),),
      ),
      body: Column(
        children: [
          Text("your Results",style: TextStyle(
            color: whiteColor,
            fontSize: 40,
          ),),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 10),
            child: Container(
              height: 450,
              width: double.infinity,
              decoration: BoxDecoration(
                color: inActiveCardColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Column(
                 crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20,),
                    Text(details.toString(),
                      style: TextStyle(
                        color: Colors.red.shade500,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),),
                    SizedBox(height: 30,),

                    Text(result.toString(),
                      style: TextStyle(
                      color: whiteColor,
                        fontSize: 80,
                        fontWeight: FontWeight.w900,
                    ),),
                    SizedBox(height: 20,),
                    Text(text.toString(),style: TextStyle(
                      color: whiteColor,
                      fontSize: 18,
                    ),),
                    SizedBox(height: 30,),
                    Container(
                      height: 80,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: activeCardColour,

                      ),
                      child: Center(
                        child: Text("Save Results",style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),),
                      ),
                    )


                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
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
          ),


        ],
      ),
    );
  }
}
