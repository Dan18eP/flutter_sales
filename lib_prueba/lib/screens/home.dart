import 'package:flutter/material.dart';
import '../widgets/CustomTextField.dart';
import '../utils/constants.dart';
import '../services/imc_services.dart';
import '../models/ImcModel.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
   
  TextEditingController cntPeso =  TextEditingController();
  TextEditingController cntAltura =  TextEditingController();
  ImcServices   imcSer = ImcServices();
  void calcularIMC(){
     double peso = double.parse(cntPeso.text);
     double altura = double.parse(cntAltura.text);
     
     double imc =  imcSer.calcular(peso, altura);
     String cat =  imcSer.categoria(imc);

     Imcmodel imcM = Imcmodel(categoria:cat, peso:peso,altura:altura,imc:imc);
     
    //  Navigator.push(context, 
    //   MaterialPageRoute(
    //     builder: (context){

    //     }
        
    //   )); 
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title: Text(tituloApp),),
       body: Container(
         margin: EdgeInsets.all(10),
         child: Column(
            children: [

              CustomTextField(Placeholder: labelPeso, cnt: cntPeso),
              CustomTextField(Placeholder: labelAltura, cnt: cntAltura),

              ElevatedButton(onPressed: (){

              }, child: Text(btnAceptar))
            ]
         ),

       ),
    );
  }
}