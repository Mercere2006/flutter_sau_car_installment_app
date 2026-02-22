// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CarInstallmentUi extends StatefulWidget {
  const CarInstallmentUi({super.key});

  @override
  State<CarInstallmentUi> createState() => _CarInstallmentUiState();
}

class _CarInstallmentUiState extends State<CarInstallmentUi> {
  String downPayment = "10";
  String installmentMonth = "24 เดือน";
  String monthlyResult = "0.00";

  TextEditingController carPriceController = TextEditingController();
  TextEditingController interestController = TextEditingController();

  void calculateInstallment() {
    if (carPriceController.text.isEmpty || interestController.text.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("คำเตือน"),
          content: Text("กรุณากรอกข้อมูลให้ครบถ้วน"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("ตกลง"),
            ),
          ],
        ),
      );
      return;
    }

    double carPrice = double.parse(carPriceController.text);
    double interestRate = double.parse(interestController.text);
    double downPercent = double.parse(downPayment);
    int months = int.parse(installmentMonth.split(' ')[0]);

    double financeAmount = carPrice - (carPrice * downPercent / 100);
    double totalInterest = (financeAmount * (interestRate * 100)) * (months / 12);
    double monthlyPayment = (financeAmount + totalInterest) / months;

    NumberFormat formatter = NumberFormat('#,###.00');
    setState(() {
      monthlyResult = formatter.format(monthlyPayment);
    });
  }

  void resetForm() {
    setState(() {
      carPriceController.clear();
      interestController.clear();
      downPayment = "10";
      installmentMonth = "24 เดือน";
      monthlyResult = "0.00";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Cl Calculator",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 50),
              Text("คำนวณค่างวดรถ",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue, width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset(
                    "assets/images/Car1.jpg",
                    width: 200,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "ราคารถ (บาท)",
                      style: TextStyle(fontSize: 16),
                    ),
                    TextField(
                      controller: carPriceController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        border: OutlineInputBorder(),
                        hintText: "0.00",
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "จำนวนเงินดาวน์ (%)",
                      style: TextStyle(fontSize: 16),
                    ),
                    Row(
                      children: [
                        Radio(
                          value: "10",
                          groupValue: downPayment,
                          onChanged: (value) {
                            setState(() {
                              downPayment = value.toString();
                            });
                          },
                        ),
                        Text("10"),
                        Radio(
                          value: "20",
                          groupValue: downPayment,
                          onChanged: (value) {
                            setState(() {
                              downPayment = value.toString();
                            });
                          },
                        ),
                        Text("20"),
                        Radio(
                          value: "30",
                          groupValue: downPayment,
                          onChanged: (value) {
                            setState(() {
                              downPayment = value.toString();
                            });
                          },
                        ),
                        Text("30"),
                        Radio(
                          value: "40",
                          groupValue: downPayment,
                          onChanged: (value) {
                            setState(() {
                              downPayment = value.toString();
                            });
                          },
                        ),
                        Text("40"),
                        Radio(
                          value: "50",
                          groupValue: downPayment,
                          onChanged: (value) {
                            setState(() {
                              downPayment = value.toString();
                            });
                          },
                        ),
                        Text("50"),
                      ],
                    ),
                    SizedBox(height: 15),
                    Text(
                      "ระยะเวลาผ่อน (เดือน)",
                      style: TextStyle(fontSize: 16),
                    ),
                    DropdownButtonFormField(
                        value: installmentMonth,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        items: [
                          "24 เดือน",
                          "36 เดือน",
                          "48 เดือน",
                          "60 เดือน",
                          "72 เดือน",
                        ].map((String value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            installmentMonth = value.toString();
                          });
                        }),
                    SizedBox(height: 15),
                    Text(
                      "อัตราดอกเเบี้ย (%/ปี)",
                      style: TextStyle(fontSize: 16),
                    ),
                    TextField(
                      controller: interestController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        border: OutlineInputBorder(),
                        hintText: "0.00",
                      ),
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              padding: EdgeInsets.symmetric(vertical: 20),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            onPressed: calculateInstallment,
                            child: Text("คํานวณ",
                                style: TextStyle(color: Colors.white)),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              padding: EdgeInsets.symmetric(vertical: 20),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            onPressed: resetForm,
                            child: Text("ยกเลิก",
                                style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      side: BorderSide(color: Colors.blue, width: 1.0)),
                      
                  elevation: 3.0,
                  color: Colors.lightBlue[50],                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      children: [
                        Text(
                          'ค่างวดรถต่อเดือนเป็นเงิน',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          monthlyResult,
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'บาทต่อเดือน',
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
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}