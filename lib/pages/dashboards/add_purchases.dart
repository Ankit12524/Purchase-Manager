import 'package:flutter/material.dart';
import 'package:purchase_manager/pages/templates/pop_ups.dart';
import 'package:purchase_manager/pages/templates/pop_ups.dart';


class AddPurchases extends StatefulWidget {
  const AddPurchases({super.key});

  @override
  State<AddPurchases> createState() => _AddPurchasesState();
}

class _AddPurchasesState extends State<AddPurchases> {

  DateTime newdate = DateTime.now();
  TimeOfDay newtime = TimeOfDay.now();

  String INVnumber = '5';

  @override
  Widget build(BuildContext context) {

    DateTime finalDate = DateTime(newdate.year,newdate.month,newdate.minute,newtime.hour,newtime.minute);

    return WillPopScope(
      onWillPop:  () async => await confirmationDiaglog(context),
      child: Scaffold(
        appBar: AppBar(title: Text('Add Purchases'),),
        body: Container(
          margin: EdgeInsets.all(10),
          width: double.maxFinite,
          height: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () async {
                        INVnumber = await singleTextInput(context, 'Invoice No.', INVnumber);
                        setState(() {
                        });
                      },
                      child: Text('Invoice No. ${INVnumber}')),
                  TextButton(
                      onPressed: () async {newdate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2020),
                        lastDate: DateTime(2030)) ?? newdate;
                        setState(() {});},
                      child: Text('${newdate.day}-${newdate.month}-${newdate.year} ')),
                  TextButton(
                      onPressed: () async {
                        newtime = await showTimePicker(
                            context: context,
                            initialTime: newtime) ?? newtime;
                        setState(() {});
                      }, child: Text('${newtime.hour}:${newtime.minute}'))

                ],
              ),
              Text('${newdate.day}-${newdate.month}-${newdate.year}::${newtime.hour}:${newtime.minute}')
            ],
          ),
        ),
      ),
    );
  }
}
