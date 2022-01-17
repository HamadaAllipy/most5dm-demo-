import 'package:flutter/material.dart';

class NumericBad extends StatelessWidget {

  final Function(int) onNumberSelected;
  const NumericBad({Key? key, required this.onNumberSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF5F4F9),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.11,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildNumber(1),
                _buildNumber(2),
                _buildNumber(3),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.11,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildNumber(4),
                _buildNumber(5),
                _buildNumber(6),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.11,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildNumber(7),
                _buildNumber(8),
                _buildNumber(9),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.11,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildEmptySpace(),
                _buildNumber(0),
                _buildBackSpace(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNumber(int number) {
    return Expanded(
      child: GestureDetector(
        onTap: (){
          onNumberSelected(number);
        },
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: Text(
                number.toString(),
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1F1F1F),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmptySpace() {
    return Expanded(
      child: Container(),
    );
  }

  Widget _buildBackSpace() {
    return Expanded(
      child: GestureDetector(
        onTap: (){
          onNumberSelected(-1);
        },
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Center(
              child: Icon(
                Icons.backspace,
                color: Color(0xFF1F1F1F),
                size: 28,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
