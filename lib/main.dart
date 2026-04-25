import 'package:flutter/material.dart';

void main(){
  runApp(calculator());
}
class calculator extends StatelessWidget{
  const calculator({super.key});
  @override
  Widget build(BuildContext context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: calculatorScreen()
        );
  }

}
class calculatorScreen extends StatefulWidget{
  const calculatorScreen({super.key});

  @override
  State<calculatorScreen> createState() => _calculatorScreen();

  }

class _calculatorScreen extends State<calculatorScreen>{
  String output = "0";
  String _output = "0";
  double num1 = 0;
  double num2 = 0;
  String operator = "";
  String Expression = '';
  buttonPressed(String bText){
    if(bText == "C"){
      _output = "0";
      Expression= "";
      num1 = 0;
      num2 = 0;
      operator = "";
    }
    else if(bText == "+" || bText == "-" || bText == "/" || bText == "*" || bText == "%"){
      operator = bText;
      Expression = output + " " + operator;
      num1 = double.parse(output);
      _output = "";

    }
    else if(bText == "="){
      num2 = double.parse(output);
      switch(operator){
        case '+' :
          _output = (num1 + num2).toString();
          break;

        case '-' :
          _output = (num1 - num2).toString();
          break;

        case '*' :
          _output = (num1 * num2).toString();
          break;

        case '/' :
          _output = (num1 / num2).toString();
          break;
        case '%' :
          _output = (num1 / 100).toString();
          break;
      }
      num1 = 0;
      num2 = 0;
      operator = "";

    }
    else{
        _output +=bText;
    }
    setState(() {
      output = double.parse(_output).toStringAsFixed(2).
      replaceAll(RegExp(r'\.00$'),'');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Calculator App",
        style: TextStyle(color: Colors.black,
            fontSize: 34 ,
            fontWeight: FontWeight.bold , )
        ),
            backgroundColor: Colors.white
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(horizontal:12 ,vertical: 12),
            margin: const EdgeInsets.all(2),

            child: Expanded( flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(Expression, style: TextStyle(
                  fontSize: 24,
                  color: Colors.grey
                ), ),

                Text(output, style: TextStyle(
                    fontSize: 48,
                    color: Colors.black
                ),),

              ],
            )
    )

          ),
          const Divider(
            color: Colors.black,
          ),
          Expanded(flex: 5,
            child:
          SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    buildButton("C", Colors.white70),
                    buildButton("DC", Colors.white70),
                    buildButton("+/-", Colors.white70),
                    buildButton("/", Colors.green),
                  ],
                ),
                Row(
                    children: [
                      buildButton("7", Colors.white70),
                      buildButton("8", Colors.white70),
                      buildButton("9", Colors.white70),
                      buildButton("*", Colors.green),
                    ]
                ),
                Row(
                    children: [
                      buildButton("4", Colors.white70),
                      buildButton("5", Colors.white70),
                      buildButton("6", Colors.white70),
                      buildButton("_", Colors.green),
                    ]
                ),
                Row(
                    children: [
                      buildButton("1", Colors.white70),
                      buildButton("2", Colors.white70),
                      buildButton("3", Colors.white70),
                      buildButton("+", Colors.green),
                    ]
                ),
                Row(
                    children: [
                      buildButton("%", Colors.white70),
                      buildButton("0", Colors.white70),
                      buildButton(".", Colors.white70),
                      buildButton("=", Colors.green),
                    ]
                )
              ],
            )

          ),

          )]
      )
    );
  }

  Widget buildButton(String buttonText, Color buttonColor){
    return Expanded(
        child: Container(
          margin: const EdgeInsets.all(10),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(24),
                backgroundColor: buttonColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(8)

              )),
            onPressed: (){
              buttonPressed(buttonText);
            },
            child: Text(buttonText , style: TextStyle(
          fontSize: 24,
          color: Colors.black,
            ),)
        ),
        )
    );
  }
}