import 'package:flutter/material.dart';
import 'package:learningapp/Provider/razor_payment.dart';
import 'package:learningapp/learner/model/payment_method.dart';

class PaymentMethodListItem extends StatelessWidget {
  const PaymentMethodListItem();

  @override
  Widget build(BuildContext context) {
    PaymentMethod paymentMethod = PaymentMethod(
      "razorpay",
      "RazorPay",
      "Click to pay with RazorPay Method",
      "assets/razorpay.png",
      "/RazorPay",
      () {
        RazorPaymentService razorPaymentService = RazorPaymentService();
        razorPaymentService.initPaymentGateway();
        razorPaymentService.getPayment();
      },
      false,
    );
    PaymentMethod paymentMethod1 = PaymentMethod(
      "paypal",
      "PayPal",
      "Click to pay with Paypal Method",
      "assets/paypal.png",
      "/PayPal",
      () {},
      true,
    );
    return Scaffold(
      body: InkWell(
          // onTap: () {
          //   if (paymentMethod.isRouteRedirect) {
          //     Navigator.of(context).pushNamed(paymentMethod.route);
          //   } else {
          //     paymentMethod.onTap();
          //   }
          // },
          child: Center(
        child: Container(
            width: 700,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            decoration: BoxDecoration(
              color: Theme.of(context).focusColor.withOpacity(0.1),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).focusColor.withOpacity(0.1),
                  blurRadius: 5,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(38.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.payment,
                        size: 60,
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      SizedBox(
                        height: 100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              'Payment Option',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Text('Select your preferred payment method',
                                style: TextStyle(fontSize: 20)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Card(
                    child: ListTile(
                      // onTap: () {
                      //   RazorPaymentService razorPaymentService = RazorPaymentService();
                      //   razorPaymentService.initPaymentGateway();
                      //   razorPaymentService.getPayment();
                      // },
                      leading: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ), // BorderRadius.all
                          image: DecorationImage(
                            image: AssetImage(paymentMethod.logo),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      title: Text(
                        paymentMethod.name,
                        maxLines: 2,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        paymentMethod.description,
                        softWrap: false,
                        style: Theme.of(context).textTheme.caption,
                      ),
                      trailing: Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.redAccent,
                      ),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ), // BorderRadius.all
                          image: DecorationImage(
                            image: AssetImage(paymentMethod1.logo),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      title: Text(
                        paymentMethod1.name,
                        maxLines: 2,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        paymentMethod1.description,
                        softWrap: false,
                        style: Theme.of(context).textTheme.caption,
                      ),
                      trailing: Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.redAccent,
                      ),
                    ),
                  ),
                ],
              ),
            )),
      )),
    ); // InkWell
  }
}
