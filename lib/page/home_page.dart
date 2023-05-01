import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Map<String, double> _calculateValues(double salary) {
    double epf = (salary * 0.11).toDouble();
    double socso = (salary * 0.02).toDouble();
    double eis = (salary * 0.002).toDouble();
    double taxableIncome = salary - epf - socso - eis - 9000;

    double tax;
    if (taxableIncome <= 0) {
      tax = 0;
    } else if (taxableIncome <= 5000) {
      tax = taxableIncome * 0.01;
    } else if (taxableIncome <= 20000) {
      tax = 50 + ((taxableIncome - 5000) * 0.03);
    } else if (taxableIncome <= 35000) {
      tax = 650 + ((taxableIncome - 20000) * 0.08);
    } else if (taxableIncome <= 50000) {
      tax = 2450 + ((taxableIncome - 35000) * 0.14);
    } else {
      tax = 6000 + ((taxableIncome - 50000) * 0.24);
    }
    double totalNetSalary = salary - epf - socso - eis - tax ;
    return {
      'epf': epf,
      'socso': socso,
      'eis': eis,
      'tax': tax,
      'netSalary': totalNetSalary,

    };
  }


  bool _isExpanded = false;
  TextEditingController _textEditingController = TextEditingController();
  String _displayText = '';
  int _enteredNumber = 0;
  void _updateEnteredNumber(String value) {
    // Convert the entered value to an integer
    int? enteredNumber = int.tryParse(value);

    // If the entered value is a number, update the _enteredNumber variable
    if (enteredNumber != null) {
      setState(() {
        _enteredNumber = enteredNumber;
      });
    }
  }


  void _expandCard() {
    setState(() {
      _isExpanded = true;
    });
  }

  // Function to collapse the card
  void _collapseCard() {
    setState(() {
      _isExpanded = false;
      _textEditingController.clear();
      _displayText = '';
    });
  }

  // Function to update the display text
  void _updateDisplayText() {
    double salary = double.tryParse(_textEditingController.text) ?? 0;
    Map<String, double> values = _calculateValues(salary);
    setState(() {
      _displayText = 'Salary: RM $salary\nEPF: RM ${values['epf']?.toStringAsFixed(2) ?? "N/A"}'
          '\nSocso: RM ${values['socso']?.toStringAsFixed(2) ?? "N/A"}\nEIS: RM ${values['eis']?.toStringAsFixed(2) ?? "N/A"}'
          '\nTax: RM ${values['tax']?.toStringAsFixed(2) ?? "N/A"}\nNet Salary: RM ${values['netSalary']?.toStringAsFixed(2) ?? "N/A"}';


    });
  }
  //alert
  void _showAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Info'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('1. This area will auto calculate your total salary minus EPF, SOCSO, EIS, and tax.'),
              SizedBox(height: 10),
              Text('2. Tax will be calculated based on your salary range.'),
              SizedBox(height: 10),
              Text('3. The following calculation is based on the guidelines of the Malaysian government:'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: [
          Card(
            child: InkWell(
              onTap: () {
                _expandCard();
              },
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Salary Calculation',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            _showAlert(context);
                          },
                          child: Icon(
                            Icons.info_outline,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      "The following calculation is based on the guidelines of the Malaysian government:",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),

                    if (_isExpanded) ...[
                      SizedBox(height: 16),
                      TextField(
                        controller: _textEditingController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter Total Salary',
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          _updateEnteredNumber(value);
                        },
                      ),
                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          _updateDisplayText();
                        },
                        child: Text('Calculate'),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'KWSP Calculation:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        _displayText,
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),


          if (_isExpanded) ...[
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _collapseCard();
              },
              child: Text('Close'),
            ),
          ],
          SizedBox(height: 16),

          // New text widget
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Budget Calculation',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 16),
          Card(
            child: InkWell(
              onTap: () {
                // Add onTap function here
              },
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '70%/30%/20% test/needs/desire',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
          Card(
            child: InkWell(
              onTap: () {
                // Add onTap function here
              },
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '70%/30%/20% test/needs/desire',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
          Card(
            child: InkWell(
              onTap: () {
                // Add onTap function here
              },
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '70%/30%/20% test/needs/desire',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
          Card(
            child: InkWell(
              onTap: () {
                // Add onTap function here
              },
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [


                  ],
                ),
              ),
            ),
          ),






        ],


      ),

    );
  }
}
