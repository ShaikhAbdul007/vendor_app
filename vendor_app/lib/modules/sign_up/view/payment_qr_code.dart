import 'package:flutter/material.dart';
import 'package:upi_payment_qrcode_generator/upi_payment_qrcode_generator.dart';
import 'package:vendor_app/helper/sizebox.dart';
import '../../../helper/constant.dart';
import '../../../widgets/buttons.dart';

class PaymentQrCode {
  static void createQrCode(
      {required BuildContext context,
      required UPIDetails upiDetailsWithoutAmount,
      required void Function() onButtonOnPress}) {
    Constant.customShowDialog(
        context,
        SizedBox(
          height: 280,
          width: 200,
          child: ListView(
            children: [
              const Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Center(
                      child: Text(
                    'Scan to pay',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ))),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Center(
                  child: UPIPaymentQRCode(
                    upiDetails: upiDetailsWithoutAmount,
                    size: 120,
                    eyeStyle: const QrEyeStyle(
                      eyeShape: QrEyeShape.circle,
                      color: Colors.black,
                    ),
                    dataModuleStyle: const QrDataModuleStyle(
                      dataModuleShape: QrDataModuleShape.circle,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Center(
                    child: Text(
                  '\u{20B9}${upiDetailsWithoutAmount.amount ?? 0.0}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
              ),
              setHeight(height: 10),
              CustomButton(
                  height: 40, label: 'ok', onPress: onButtonOnPress, width: 50),
              setHeight(height: 20),
            ],
          ),
        ));
  }
}
