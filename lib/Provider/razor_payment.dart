import 'package:razorpay_flutter/razorpay_flutter.dart';

class RazorPaymentService {
  Razorpay? _razorpay;

  void externalwallet(ExternalWalletResponse response) {
    print(response.walletName);
  }

  void paymentSuccess(PaymentSuccessResponse response) {
    print("SUCCESS: " + response.paymentId.toString());
  }

  void paymentError(PaymentFailureResponse response) {
    print("ERROR: " +
        response.message.toString() +
        " - " +
        response.code.toString());
  }

  initPaymentGateway() {
    _razorpay = Razorpay();
    _razorpay!.on(Razorpay.EVENT_EXTERNAL_WALLET, externalwallet);
    _razorpay!.on(Razorpay.EVENT_PAYMENT_SUCCESS, paymentSuccess);
    _razorpay!.on(Razorpay.EVENT_PAYMENT_ERROR, paymentError);
  }

  getPayment() {
    var options = {
      'key': 'RAZOR_KEY',
      'amount': 10,
      'description': 'Payment for our Products',
      'prefill': {
        "contact": "+60XXXXXXX",
        "email": "support@aqwise.com",
      },
      'name': 'Admin'
    };
    try {
      _razorpay!.open(options);
    } catch (e) {
      print(e);
    }
  }
}
