import 'dart:math';

class BMICalculate{
  final int height;
  final int weight;
  double? bmi;
  BMICalculate({required this.height, required this.weight,this.bmi = 0});

   String calculate(){
     bmi = weight / pow(height/100, 2);
     return bmi!.toStringAsFixed(2);
   }

   String feedback(){
     if(bmi! >= 25){
       return "You are Overweight";
     }
     else if(bmi! >= 18.5){
       return "You have a normal weight";
     }
     else{
       return "You are Underweight";
     }
   }
  String result(){
    if(bmi! >= 25){
      return "OverWeight";
    }
    else if(bmi! >= 18.5){
      return "Normal";
    }
    else{
      return "Underweight";
    }
  }

}