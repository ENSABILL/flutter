import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'paymentInvoice.dart';
import 'paymentHistory.dart';
import 'package:banking/constants/app_constants.dart';
import 'package:banking/components/data_generator.dart';
import 'package:banking/components/data_generator.dart';
import 'package:banking/components/banking_model.dart';
import 'package:banking/constants/app_constants.dart';

// ignore: must_be_immutable
class BankingPaymentDetails extends StatefulWidget {
  static var tag = "/BankingPaymentDetails";
  String? headerText;

  BankingPaymentDetails({this.headerText});

  @override
  _BankingPaymentDetailsState createState() => _BankingPaymentDetailsState();
}

class _BankingPaymentDetailsState extends State<BankingPaymentDetails> {
  late List<BankingServiceModel> mList;

  @override
  void initState() {
    super.initState();
    mList = bankingPaymentDetailList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Banking_app_Background,
      body: Container(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              30.height,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(Icons.chevron_left, size: 25, color: Banking_blackColor)
                      .onTap(
                        () {
                      finish(context);
                    },
                  ),
                  20.height,
                  Text(widget.headerText!,
                      style: boldTextStyle(
                          size: 30, color: Banking_TextColorPrimary)),
                ],
              ),
              ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: mList.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.only(top: 8, bottom: 8),
                      decoration: boxDecorationWithShadow(
                          borderRadius: BorderRadius.circular(10),
                          backgroundColor: Banking_whitePureColor),
                      child: Row(
                        children: <Widget>[
                          Container(
                            height: 60,
                            width: 60,
                            padding: EdgeInsets.all(16),
                            decoration: boxDecorationWithRoundedCorners(
                                borderRadius: BorderRadius.circular(30),
                                backgroundColor: Banking_Primary),
                            child: Image.asset(mList[index].img!,
                                height: 20,
                                width: 20,
                                color: Banking_whitePureColor),
                          ).paddingAll(spacing_standard),
                          Text(mList[index].nameService!,
                              style: primaryTextStyle(
                                  color: Banking_TextColorPrimary,
                                  size: 18,
                                  fontFamily: fontRegular)),
                        ],
                      ),
                    ).onTap(() {
                      if (index == 0) {
                        BankingPaymentInvoice().launch(context);
                      } else {
                        BankingPaymentHistory().launch(context);
                      }
                      setState(() {});
                    });
                  }),
            ],
          ),
        ),
      ),
    );
  }
}