import 'package:flutter/material.dart';

class Converter extends StatefulWidget {
  const Converter({Key? key}) : super(key: key);

  @override
  State<Converter> createState() => _ConverterState();
}

class _ConverterState extends State<Converter> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController feetController = TextEditingController();
  TextEditingController inchController = TextEditingController();
  double? feetValue;
  String convertedHeight = "0";
  double inchValue = 0;

  heightConverter(){
    if(!_formKey.currentState!.validate()){
      return ;
    }
    final snack = SnackBar(
    backgroundColor: const Color(0x0ff0a031),
    content: Row(children: const [Icon(Icons.check),SizedBox(width: 5,),Text("Height has been imported",style: TextStyle(color: Colors.white),)],));
    ScaffoldMessenger.of(context).showSnackBar(snack);
    try{
    feetValue = double.parse(feetController.text);
    inchValue = double.parse(inchController.text);
    convertedHeight = (((feetValue! * 12) + inchValue) * 2.54).round().toString() ;
    setState(() {
      convertedHeight = convertedHeight;
    });
    }
    catch(e){
      convertedHeight = "100";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("BMI Converter"),
      leading: IconButton(onPressed: (){
        Navigator.pop(context,convertedHeight);
      },icon: const Icon(Icons.arrow_back_sharp),
      )
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.only(left: 10,right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                // crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Expanded(flex :1,child: Text("Height:",style: TextStyle(fontSize: 20),)),
                  Expanded(flex:2,child: TextFormField(
                    validator: (value){
                      if(value!.isNotEmpty && int.parse(value!) <= 10){return null;}
                      else if(value.isEmpty){
                        return "Empty";
                      }
                      else{
                        return 'Enter value below 10';
                      }
                    },
                    controller: feetController,
                    keyboardType:TextInputType.number,
                  decoration: const InputDecoration(labelText:"Feet",border: OutlineInputBorder())
                  )
                  ),
                  const SizedBox(width: 20,),
                  Expanded(flex:1,child: TextFormField(
                      validator: (value){
                        if(value!.isNotEmpty && int.parse(value!) <= 12){return null;}
                        else if(value!.isEmpty) {
                          return "Empty";
                        }
                        else{
                          return 'value > 12';
                        }
                      },
                      controller: inchController,
                      keyboardType:TextInputType.number,
                      decoration: const InputDecoration(labelText:"Inches",border: OutlineInputBorder()
                      ))),
                ],
              ),
              const SizedBox(height: 30,),
              Row(children: [const Text("Result : ",style: TextStyle(fontSize: 30),),
              Text("${convertedHeight}cm",style: const TextStyle(fontSize: 30),)],),
              const SizedBox(height: 30,),


              ElevatedButton(onPressed: heightConverter,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
                child: const Text("Convert"),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
