import 'package:flutter/material.dart';
import 'package:vendor_app/helper/sizebox.dart';

import '../../../helper/colors.dart';
import '../../../helper/common_appbar.dart';

class PaymentHistoryScreen extends StatelessWidget {
  const PaymentHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonAppbar(
        isDrawerRequired: true,
        title: 'Payment History',
        body: ListView(
          children: [
            PaymentHistoryText(
              paymentStatus: 'Successful',
              paymentStatusColor: AppColors.greenColor,
              amount: '1,200',
              payeeName: 'John Doe',
            ),
            PaymentHistoryText(
              paymentStatus: 'Failed',
              paymentStatusColor: AppColors.redColor,
              amount: '1,500',
              payeeName: 'Jane Smith',
            ),
            PaymentHistoryText(
              paymentStatus: 'Successful',
              paymentStatusColor: AppColors.greenColor,
              amount: '800',
              payeeName: 'Alex Johnson',
            ),
            PaymentHistoryText(
              paymentStatus: 'Successful',
              paymentStatusColor: AppColors.greenColor,
              amount: '950',
              payeeName: 'Maria Garcia',
            ),
            PaymentHistoryText(
              paymentStatus: 'Failed',
              paymentStatusColor: AppColors.redColor,
              amount: '1,200',
              payeeName: 'David Lee',
            ),
            PaymentHistoryText(
              paymentStatus: 'Successful',
              paymentStatusColor: AppColors.greenColor,
              amount: '650',
              payeeName: 'Sophia Brown',
            ),
            PaymentHistoryText(
              paymentStatus: 'Successful',
              paymentStatusColor: AppColors.greenColor,
              amount: '1,200',
              payeeName: 'John Doe',
            ),
            PaymentHistoryText(
              paymentStatus: 'Failed',
              paymentStatusColor: AppColors.redColor,
              amount: '1,500',
              payeeName: 'Jane Smith',
            ),
            PaymentHistoryText(
              paymentStatus: 'Successful',
              paymentStatusColor: AppColors.greenColor,
              amount: '800',
              payeeName: 'Alex Johnson',
            ),
            PaymentHistoryText(
              paymentStatus: 'Successful',
              paymentStatusColor: AppColors.greenColor,
              amount: '950',
              payeeName: 'Maria Garcia',
            ),
            PaymentHistoryText(
              paymentStatus: 'Failed',
              paymentStatusColor: AppColors.redColor,
              amount: '1,200',
              payeeName: 'David Lee',
            ),
            PaymentHistoryText(
              paymentStatus: 'Successful',
              paymentStatusColor: AppColors.greenColor,
              amount: '650',
              payeeName: 'Sophia Brown',
            ),
          ],
        ));
  }
}

class PaymentHistoryText extends StatelessWidget {
  final String payeeName;
  final String amount;
  final String paymentStatus;
  final Color paymentStatusColor;

  const PaymentHistoryText({
    super.key,
    required this.payeeName,
    required this.amount,
    required this.paymentStatus,
    required this.paymentStatusColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 5),
      child: Card(
        elevation: 3,
        color: AppColors.whiteColor,
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.all(5),
              height: 60,
              width: 40,
              decoration: BoxDecoration(
                  color: Colors.amber, borderRadius: BorderRadius.circular(10)),
              child: Center(child: Text('Vn')),
            ),
            setWidth(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Paid to',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: AppColors.iconColor),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          payeeName,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        width: 100,
                        child: Text(
                          '\u{20B9} $amount',
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    paymentStatus,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: paymentStatusColor),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
