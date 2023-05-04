import 'package:flutter/material.dart';
import 'package:bmi/Functionality/bmi_calculator.dart';
import 'package:bmi/Screen/converter_screen.dart';
import 'package:bmi/Screen/result_screen.dart';
import 'card.dart';
import 'LabelIcon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'RoundedButton.dart';


enum GenderSelection{male,female}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


  final GlobalKey<FormState> _formKey= GlobalKey<FormState>();
  final inActiveColor = const Color(0xff1d1e33) ;
  final activeColor =   const Color(0x011d1e33);
  GenderSelection? selection;
  int _height = 100 ;
  int _weight = 50;
  int _age = 18;
  List options = ["Converter"];
  String? select;

  void _showHeightDialog(){
    showDialog(context: context, builder: (context){
      return AlertDialog(
        backgroundColor:  const Color(0xff1d1e33),
        title: const Text("Input Height"),
        actions: [
          Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  validator: (value){
                    if(value!.isEmpty){
                      setState(() {
                        _height = 100;
                      });
                      Navigator.of(context).pop();
                      return null;
                    }
                    else if(int.parse(value) > 320){
                      return "Height is greater than 320cm ";
                    }
                    else{
                      setState(() {
                        _height = int.parse(value);
                      });
                      Navigator.of(context).pop();
                      return null;
                    }
                  },
                  decoration: const InputDecoration(
                    hintText: "height less 320cm",
                  ),
                  keyboardType:TextInputType.number ,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.pink)
                    ),
                    onPressed: (){
                      _showHeightDialog();
                      Navigator.of(context).pop();
                      if(!_formKey.currentState!.validate()){
                        return;
                      }
                    },
                    child: const Text("Enter"))
              ],
            ),
          ),
        ],
      );
    }
    );
  }

  void _showAgeDialog(){
    showDialog(context: context, builder: (context){
      return AlertDialog(
        backgroundColor:  const Color(0xff1d1e33),
        title: const Text("Input Age"),
        actions: [
          Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  validator: (value){
                    if(value!.isEmpty){
                      setState(() {
                        _age = 18;
                      });
                      Navigator.of(context).pop();
                      return null;
                    }
                    else{
                      setState(() {
                        _age = int.parse(value);
                      });
                      Navigator.of(context).pop();
                      return null;
                    }
                  },
                  decoration: const InputDecoration(
                    hintText: "Age",
                  ),
                  keyboardType:TextInputType.number ,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.pink)
                    ),
                    onPressed: (){
                      _showAgeDialog();
                      Navigator.of(context).pop();
                      if(!_formKey.currentState!.validate()){
                        return;
                      }
                    },
                    child: const Text("Enter"))
              ],
            ),
          ),
        ],
      );
    }
    );
  }

  void _showDialog(){
    showDialog(context: context, builder: (context){
      return AlertDialog(
        backgroundColor:  const Color(0xff1d1e33),
          title: const Text("Input Weight"),
        actions: [
          Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  validator: (value){
                    if(value!.isEmpty){
                     setState(() {
                       _weight = 50;
                     });
                     Navigator.of(context).pop();
                     return null;
                    }
                    else{
                      setState(() {
                        _weight = int.parse(value);
                      });
                      Navigator.of(context).pop();
                      return null;
                    }
                  },
                  decoration: const InputDecoration(
                    hintText: "weight less than 200",
                  ),
                  keyboardType:TextInputType.number ,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.pink)
                    ),
                    onPressed: (){
                      _showDialog();
                      Navigator.of(context).pop();
                      if(!_formKey.currentState!.validate()){
                        return;
                      }
                    },
                    child: const Text("Enter"))
              ],
            ),
          ),
        ],
      );
    }
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: const Text("BMI CALCULATOR"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: DropdownButton(
              dropdownColor: const Color(0xff1d1e33),
              underline: Container(),
              icon: const Icon(Icons.more_vert,color: Colors.white,),
                items: options.map((e) => DropdownMenuItem(value:e,child: Text(e))).toList(),
                onChanged: (value)async{
             final result = await Navigator.push(context,MaterialPageRoute(builder: (context) => const Converter()));
            setState(() {
              _height = int.parse(result);
              select = value.toString();
            });
            }),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            //First block
            Expanded(
              child: Row(children: [
                Expanded(
                  child: ReusableCard(color: selection == GenderSelection.male ? activeColor : inActiveColor ,
                    onPressed: (){setState(() {
                      selection = GenderSelection.male;
                      const snackBar =  SnackBar(
                        backgroundColor:Color(0xff1d1e33) ,
                        duration: Duration(seconds: 1),
                          behavior: SnackBarBehavior.floating,
                          margin: EdgeInsets.only(left: 8,right: 8,bottom: 10),
                          content: Text("Male Selected",style: TextStyle(color: Colors.white),));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    });},
                    myChild: LabelIcon(icon: FontAwesomeIcons.mars,text: "Male")
                    ,),
                ),
                Expanded(
                  child: ReusableCard(color: selection == GenderSelection.male ?  inActiveColor : activeColor ,
                      onPressed: (){
                      setState(() {
                        selection = GenderSelection.female;
                        const snackBar =  SnackBar(
                            backgroundColor:Color(0xff1d1e33) ,
                            duration: Duration(seconds: 1),
                            behavior: SnackBarBehavior.floating,
                            margin: EdgeInsets.only(left: 8,right: 8,bottom: 10),
                            content: Text("Female Selected",style: TextStyle(color: Colors.white),));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      });
                      },
                      myChild: LabelIcon(icon: FontAwesomeIcons.venus,text: "Female",)
                  ),
                ),
              ],),
            ),
            //Second Block
            Expanded(
              child: InkWell(
                onTap: _showHeightDialog,
                child: ReusableCard(color: const Color(0xff1d1e33),
                  myChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                   const Padding(
                     padding: EdgeInsets.only(right:12),
                     child: Text("Height",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                   ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    mainAxisAlignment: MainAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                    Text("$_height",style: const TextStyle(fontSize: 50,fontWeight: FontWeight.bold),),
                    const Text("cm")
                  ],),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          trackHeight: 2,
                          activeTrackColor: Colors.white,
                          thumbColor: Colors.pink,
                          overlayColor: const Color(0x015eb155),
                          thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 15),
                          overlayShape: const RoundSliderOverlayShape(overlayRadius: 30)
                        ),
                        child: Slider(
                          value: _height.toDouble(),
                          min: 0,
                          max: 320,
                          onChanged: (double newValue){
                            setState(() {
                              _height = newValue.toInt().round();
                              // print(_height);
                            });
                          },
                        ),
                      )
                ],),
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                Expanded(
                  child: InkWell(
                    onTap: _showDialog,
                    child: ReusableCard(color: const Color(0xff1d1e33),myChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      const Padding(
                        padding: EdgeInsets.only(right:12),
                        child: Text("Weight",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                        ),
                      ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          mainAxisAlignment: MainAxisAlignment.center,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text("$_weight",style: const TextStyle(fontSize: 50,fontWeight: FontWeight.bold),),
                            const Text("kg")
                          ],),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          RoundedBtn(color: const Color(0xff0A0E21),icon: FontAwesomeIcons.plus,onPress: (){setState(() {
                            _weight = _weight + 1;
                          });},),
                          RoundedBtn(color: const Color(0xff0A0E21),icon: FontAwesomeIcons.minus,onPress: (){setState(() {
                            _weight = _weight - 1;
                          });},)
                        ],
                      )
                    ],),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: _showAgeDialog,
                    child: ReusableCard(color: const Color(0xff1d1e33,),myChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right :12),
                          child: Text("Age",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          mainAxisAlignment: MainAxisAlignment.center,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text("$_age",style: const TextStyle(fontSize: 50,fontWeight: FontWeight.bold),),
                            const Text("Yrs")
                          ],),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RoundedBtn(color: const Color(0xff0A0E21),icon: FontAwesomeIcons.plus,
                              onPress: (){
                              setState(() {
                                _age = _age + 1;
                              });
                              },),
                            RoundedBtn(color: const Color(0xff0A0E21),icon: FontAwesomeIcons.minus,onPress: (){
                              _age = _age - 1 ;
                            },)
                          ],
                        )
                      ],),
                      ),
                  ),
                )
              ],),
            ),
            ElevatedButton(onPressed: (){
              BMICalculate bmiCalculate = BMICalculate(height: _height,weight: _weight);
              Navigator.push(context, MaterialPageRoute(builder: (cxt){
                return ResultScreen(
                  result: bmiCalculate.result(),
                  calculate: bmiCalculate.calculate(),
                  feedback: bmiCalculate.feedback(),
                );}
              )
             );
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.pink),
              minimumSize: MaterialStateProperty.all(const Size(double.infinity,50)),
            ),
              child: const Text("Calculate"),
            )
          ],
        ),
      ),
    );
  }
}




