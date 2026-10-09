class ImcServices {

    double calcular(double peso, double altura){
      return peso / (altura*altura);
    }

    String categoria(double imc){
      if(imc < 18.5){
        return "bajo de peso";
      }else if (imc < 24.9){
        return "peso normal";
      }else if (imc < 29.9){
        return "sobrepeso";
      }else if (imc < 34.9){
        return "obesidad I";
      }else if (imc < 39.9){
        return "obesidad II";
      }else{
        return "obesidad III";
      }
    }
}