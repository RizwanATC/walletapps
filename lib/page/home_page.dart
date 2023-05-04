import 'package:flutter/material.dart';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_project/bar%20graph/bar_graph.dart';








class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final TextEditingController _rentController = TextEditingController();
  final TextEditingController _electricityController = TextEditingController();
  final TextEditingController _waterController = TextEditingController();
  final TextEditingController _internetController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _familyController = TextEditingController();
  final TextEditingController _debtController = TextEditingController();
  final TextEditingController _vehicleController = TextEditingController();
  final TextEditingController _foodController = TextEditingController();
  final TextEditingController _otherController = TextEditingController();

  double _totalCommitment = 0.0;
  @override
  void dispose() {
    _rentController.dispose();
    _electricityController.dispose();
    _waterController.dispose();
    _internetController.dispose();
    _phoneController.dispose();
    _familyController.dispose();
    _debtController.dispose();
    _vehicleController.dispose();
    _foodController.dispose();
    _otherController.dispose();
    super.dispose();
  }
  void _calculateTotalCommitment() {
    double rent = double.tryParse(_rentController.text) ?? 0;
    double electricity = double.tryParse(_electricityController.text) ?? 0;
    double water = double.tryParse(_waterController.text) ?? 0;
    double internet = double.tryParse(_internetController.text) ?? 0;
    double phone = double.tryParse(_phoneController.text) ?? 0;
    double family = double.tryParse(_familyController.text) ?? 0;
    double debt = double.tryParse(_debtController.text) ?? 0;
    double vehicle = double.tryParse(_vehicleController.text) ?? 0;
    double food = double.tryParse(_foodController.text) ?? 0;
    double other = double.tryParse(_otherController.text) ?? 0;

    double totalCommitment =
        rent + electricity + water + internet + phone + family + debt + vehicle + food + other;

    setState(() {
      _totalCommitment = totalCommitment;
    });
  }
  String firstDisplayText = '';
  String portionOne = '';
  String portionTwo = '';
  String portionThree = '';
  String portionFour = '';

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
    double fiftyPercent = totalNetSalary * 0.5;
    double thirtyPercent = totalNetSalary * 0.3;
    double twentyPercent = totalNetSalary * 0.2;
    double seventyPercent = totalNetSalary * 0.7;
    double tenPercent = totalNetSalary * 0.1;

    return {
      'epf': epf,
      'socso': socso,
      'eis': eis,
      'tax': tax,
      'netSalary': totalNetSalary,
      'fiftyPercent': fiftyPercent,
      'thirtyPercent': thirtyPercent,
      'twentyPercent': twentyPercent,
      'seventyPercent': seventyPercent,
      'tenPercent': tenPercent,
    };
  }






  bool _isExpanded = false;
  bool _isBudgetExpend = false;
  TextEditingController _textEditingController = TextEditingController();
  String _displayText = '';
  String _displayTextOne = '';
  String _displayTextTwo = '';



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






  List<double> portionSum = [0, 0, 0];

  void _update1stOptionText() {
    double salary = double.tryParse(_textEditingController.text) ?? 0;
    Map<String, double> values = _calculateValues(salary);
    setState(() {
      double totalNetSalary = values['netSalary'] ?? 0;
      firstDisplayText = 'Net Salary: RM ${totalNetSalary.toStringAsFixed(2)}';
      double portionOne = totalNetSalary * 0.5;
      double portionTwo = totalNetSalary * 0.3;
      double portionThree = totalNetSalary * 0.2;
      portionOne = double.parse(portionOne.toStringAsFixed(2));
      portionTwo = double.parse(portionTwo.toStringAsFixed(2));
      portionThree = double.parse(portionThree.toStringAsFixed(2));
      double perConvertOne =  (totalNetSalary * 0.5) / totalNetSalary * 100;
      double perConvertTwo =  (totalNetSalary * 0.3) / totalNetSalary * 100;
      double perConvertThree =  (totalNetSalary * 0.2) / totalNetSalary * 100;

      portionSum = [perConvertOne, perConvertTwo, perConvertThree];
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

  void _updateDisplayfirstBudget() {
    double salary = double.tryParse(_textEditingController.text) ?? 0;
    Map<String, double> values = _calculateValues(salary);
    setState(() {
      _displayTextOne = '50% Needs: \nRM ${values['fiftyPercent']?.toStringAsFixed(2) ?? "N/A\n\n"}\n\n30% Wills: \nRM ${values['thirtyPercent']?.toStringAsFixed(2) ?? "N/A\n\n"}'
          '\n\n20% Savings: \nRM ${values['twentyPercent']?.toStringAsFixed(2) ?? "N/A"}';





    });
  }
  void _updateDisplaySecondBudget() {
    double salary = double.tryParse(_textEditingController.text) ?? 0;
    Map<String, double> values = _calculateValues(salary);
    setState(() {
      _displayTextTwo = '70% Needs: \nRM ${values['seventyPercent']?.toStringAsFixed(2) ?? "N/A\n\n"}\n\n20% Wills: \nRM ${values['twentyPercent']?.toStringAsFixed(2) ?? "N/A\n\n"}'
          '\n\n10% Savings: \nRM ${values['tenPercent']?.toStringAsFixed(2) ?? "N/A"}';





    });
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: label,
        ),
      ),
    );
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
          child: Column(
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
                              _updateDisplayfirstBudget();
                              _updateDisplaySecondBudget();
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
                          SizedBox(height: 8),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Card(
                                      child: Padding(
                                          padding: EdgeInsets.all(16.0),
                                          child:Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Budget 50 | 30 | 20',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(height: 8),
                                              Text(
                                                _displayTextOne,
                                                style: TextStyle(
                                                  fontSize: 14,
                                                ),
                                              ),

                                            ],
                                          )
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Card(
                                      child: Padding(
                                          padding: EdgeInsets.all(16.0),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Budget 70 | 20 | 10',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(height: 8),
                                              Text(
                                                _displayTextTwo,
                                                style: TextStyle(
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          )

                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                      Text(
                                        'Enter Your Monthly Commitments',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 16),
                                      _buildTextField('Rent', _rentController),
                                      _buildTextField('Electricity', _electricityController),
                                      _buildTextField('Water', _waterController),
                                      _buildTextField('Internet', _internetController),
                                      _buildTextField('Phone Bill', _phoneController),
                                      _buildTextField('Family', _familyController),
                                      _buildTextField('Debt', _debtController),
                                      _buildTextField('Vehicle', _vehicleController),
                                      _buildTextField('Food and Drinks', _foodController),
                                      _buildTextField('Other Commitments', _otherController),
                                      SizedBox(height: 16),
                                      ElevatedButton(
                                        onPressed: _calculateTotalCommitment,
                                        child: Text('Calculate Total Commitment'),
                                      ),
                                      SizedBox(height: 16),
                                      Text(
                                        'Total Commitment: RM ${_totalCommitment.toStringAsFixed(2)}',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),

                                ),
                              )
                            ],
                          )






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
                  child: Text('Recalculate'),
                ),
              ],
              SizedBox(height: 16),

              // New text widget


            ],


          ),

        )


    );
  }
}
