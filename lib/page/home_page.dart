import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  double _totalSalary = 10000;

  Map<String, double> calculatePercentages(double totalSalary) {
    double needs = totalSalary * 0.5;
    double will = totalSalary * 0.3;
    double savings = totalSalary * 0.2;

    return {'Needs': needs, 'Will': will, 'Savings': savings};
  }

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
  bool _isBudgetExpend = false;
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
  void _BudgetExpandCard() {
    setState(() {
      _isBudgetExpend = true;
    });
  }

  // Function to collapse the card
  void _BudgetCollapseCard() {
    setState(() {
      _isBudgetExpend = false;

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
              Text('3. The following calculation is based on the guidelines of the Malaysian government.'),
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
        body: SingleChildScrollView(
          child : Column(
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
              if (_isBudgetExpend) ...[
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    _BudgetCollapseCard();
                  },
                  child: Text('Close'),
                ),
              ],
              SizedBox(height: 16),

              Container(
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Card(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _isBudgetExpend = !_isBudgetExpend;
                          });
                        },
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: Text(
                                'Budget 50% Needs | 30% Will | 20 % Needs',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            if (_isBudgetExpend)
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Text(
                                      '\$${_totalSalary.toStringAsFixed(2)}',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Column(
                                          children: [
                                            Text('50%'),
                                            Text(
                                              '\$${(_totalSalary * 0.5).toStringAsFixed(2)}',
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Text('30%'),
                                            Text(
                                              '\$${(_totalSalary * 0.3).toStringAsFixed(2)}',
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Text('20%'),
                                            Text(
                                              '\$${(_totalSalary * 0.2).toStringAsFixed(2)}',
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),

                                ],
                              ),
                          ],
                        ),
                      ),
                    ),





                  ],


                ),


              ),

            ],


          ),

        )
    );
  }
}
