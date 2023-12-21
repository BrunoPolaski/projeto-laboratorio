import 'package:app_facul/app/presentation/layout/custom_size.dart';
import 'package:app_facul/app/presentation/themes/colors.dart';
import 'package:app_facul/app/presentation/themes/typography.dart';
import 'package:flutter/material.dart';

class CustomPaymentCard extends StatefulWidget {
  final bool isPaid;
  final String typeOfPayment;
  final String dateText;
  final double valueText;
  final String debtor;

  const CustomPaymentCard(
      {super.key,
      required this.isPaid,
      required this.typeOfPayment,
      required this.dateText,
      required this.valueText,
      required this.debtor});

  @override
  // ignore: library_private_types_in_public_api
  _CustomPaymentCardState createState() => _CustomPaymentCardState();
}

class _CustomPaymentCardState extends State<CustomPaymentCard> {
  var icon;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.typeOfPayment == "DEFAULT") {
      icon = Icons.help_outline_rounded;
    } else if (widget.typeOfPayment == "CREDIT_CARD") {
      icon = Icons.credit_card_rounded;
    } else if (widget.typeOfPayment == "DEBIT_CARD") {
      icon = Icons.credit_card_rounded;
    } else if (widget.typeOfPayment == "CASH") {
      icon = Icons.attach_money_rounded;
    } else if (widget.typeOfPayment == "BANK_SLIP") {
      icon = Icons.receipt_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: CustomWidth.custom(20)),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              height: CustomHeight.custom(100),
              decoration: BoxDecoration(
                color: AppColors.lightGreen.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(icon, color: AppColors.green, size: 60),
                      Container(
                        width: CustomWidth.custom(100),
                        child: widget.isPaid
                            ? Text(
                                "Recebido em: \n${widget.dateText.substring(5, 10).replaceAll("-", "/")}",
                                style: AppTypography.textBodyGreenSemiBold,
                              )
                            : Text(
                                "Receber em: \n${widget.dateText.substring(5, 10).replaceAll("-", "/")}",
                                style: AppTypography.textBodyGreenSemiBold,
                              ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                          child: Text(
                        "R\$ ${widget.valueText.toStringAsFixed(2).replaceAll(".", ",")}",
                        style: AppTypography.textTitleGreenSemiBold,
                      )),
                      Text(
                        widget.debtor.toString(),
                        style: AppTypography.textBodyGreen,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
