import 'package:flutter/material.dart';

import '../extension/card.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key, this.result , this.calculate,this.feedback});
  final String? result ;
  final String? calculate;
  final String? feedback;


  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI CALCULATOR"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Text("Result",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),
          ),
          Expanded(
            child: ReusableCard(
              color: const Color(0xff1d1e33),
              myChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text("STATUS",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.green),),
                  Text("${widget.calculate}",style: const TextStyle(fontSize: 60,fontWeight: FontWeight.bold),),
                  Text("${widget.feedback}",style: const TextStyle(fontSize: 30),),
                ],
              ),
            ),
          ),
          ElevatedButton(onPressed: (){
           Navigator.of(context).pop();
          },
            style:ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.pink),
              minimumSize: MaterialStateProperty.all(const Size(double.infinity,50),)
            ),

            child: const Text("Calculate"),)
        ],
      ),

    );
  }
}
