import 'package:flutter/material.dart';
import 'package:most5dm/modules/auth/view/widgets/numeric_bad.dart';

class BankAccountScreen extends StatefulWidget {
  const BankAccountScreen({Key? key}) : super(key: key);

  @override
  State<BankAccountScreen> createState() => _BankAccountScreenState();
}

class _BankAccountScreenState extends State<BankAccountScreen> {

  String code = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
            size: 30,
            color: Colors.black,
          ),
        ),
        title: const Text(
          'Verify phone',
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 14),
                      child: Text(
                        'Code is sent to ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22,
                          color: Color(0xFF818181),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildCodeNumberBox(code.isNotEmpty? code.substring(0,1):''),
                          _buildCodeNumberBox(code.length > 1? code.substring(1,2):''),
                          _buildCodeNumberBox(code.length > 2? code.substring(2,3):''),
                          _buildCodeNumberBox(code.length > 3? code.substring(3,4):''),
                          _buildCodeNumberBox(code.isNotEmpty? code.substring(0,1):''),
                          _buildCodeNumberBox(code.length > 1? code.substring(1,2):''),
                          _buildCodeNumberBox(code.length > 2? code.substring(2,3):''),
                          _buildCodeNumberBox(code.length > 3? code.substring(3,4):''),
                          _buildCodeNumberBox(code.isNotEmpty? code.substring(0,1):''),
                          _buildCodeNumberBox(code.length > 1? code.substring(1,2):''),
                          _buildCodeNumberBox(code.length > 2? code.substring(2,3):''),
                          _buildCodeNumberBox(code.length > 3? code.substring(3,4):''),
                          _buildCodeNumberBox(code.isNotEmpty? code.substring(0,1):''),
                          _buildCodeNumberBox(code.length > 1? code.substring(1,2):''),
                          _buildCodeNumberBox(code.length > 2? code.substring(2,3):''),
                          _buildCodeNumberBox(code.length > 3? code.substring(3,4):''),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.13,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          print('Verify and create account action ');
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.13,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFDC3D),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Center(
                            child: Text(
                              'Verify and create account',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            NumericBad(
              onNumberSelected: (value) {
                setState(() {
                  if(value != -1){
                    if(code.length < 4){
                      code = code + value.toString();
                    }
                  }
                  else{
                    code = code.substring(0, code.length -1);
                  }
                });
                print(code);
              },
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildCodeNumberBox(String codeNumber){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: SizedBox(
        height: 20,
        width: 20,
        child: Container(
          decoration:  BoxDecoration(
            color: const Color(0xFFF6F5FA),
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 25.0,
                spreadRadius: 1,
                offset: Offset(0.0,0.75),
              ),
            ],
          ),
          child: Center(
            child: Text(
              codeNumber,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1F1F1F),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
