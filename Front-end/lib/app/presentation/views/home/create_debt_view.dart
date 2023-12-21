import 'package:app_facul/app/presentation/layout/custom_layout.dart';
import 'package:app_facul/app/presentation/layout/custom_size.dart';
import 'package:app_facul/app/presentation/providers/home_page_provider.dart';
import 'package:app_facul/app/presentation/themes/colors.dart';
import 'package:app_facul/app/presentation/themes/typography.dart';
import 'package:app_facul/app/presentation/widgets/common/custom_rectangle_button_widget.dart';
import 'package:app_facul/app/presentation/widgets/common/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class CreateDebtView extends StatelessWidget {
  const CreateDebtView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomePageProvider>(context);
  final formKey = GlobalKey<FormState>();

    return CustomLayout(
      horizontalPadding: 0,
        backgroundColor: Colors.white,
        appBar: AppBar(
          foregroundColor: AppColors.green,
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Text('Criar novo pagamento', style: TextStyle(color: AppColors.green),),
          leading: IconButton(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onPressed: (){
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back, color: AppColors.green,),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 5,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          CustomTextField(
                            hintText: 'Nome',
                            labelText: 'Nome',
                            keyboardType: TextInputType.name,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Nome inválido';
                              }
                              return null;
                            },
                            controller: provider.nameController,
                            prefixIcon: const Icon(Icons.person, color: AppColors.lightGreen),
                            style: AppTypography.textBodyGreen,
                          ),
                          SizedBox(height: CustomHeight.custom(20)),
                          CustomTextField(
                            hintText: 'E-mail',
                            labelText: 'E-mail',
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'E-mail inválido';
                              }
                              return null;
                            },
                            controller: provider.emailController,
                            prefixIcon: const Icon(Icons.email, color: AppColors.lightGreen),
                            style: AppTypography.textBodyGreen,
                          
                          ),
                          SizedBox(height: CustomHeight.custom(20)),
                          Row(
                            children: [
                              Expanded(
                                child: CustomTextField(
                                  hintText: 'Valor',
                                  labelText: 'Valor',
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Valor inválido';
                                    }
                                    return null;
                                  },
                                  controller: provider.valueController,
                                  prefixIcon: const Icon(Icons.monetization_on, color: AppColors.lightGreen),
                                  style: AppTypography.textBodyGreen,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 10),
                                width: CustomWidth.custom(150),
                                child: CustomTextField(
                                  hintText: 'Número de parcelas',
                                  labelText: 'Parcelas',
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Número de parcelas inválido';
                                    }
                                    return null;
                                  },
                                  controller: provider.installmentsController,
                                  prefixIcon: const Icon(Icons.format_list_numbered, color: AppColors.lightGreen),
                                  style: AppTypography.textBodyGreen,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: CustomHeight.custom(20)),
                               DropdownMenu<String>(
                                menuStyle: MenuStyle(
                                  backgroundColor: MaterialStateColor.resolveWith((states) => Colors.white),
                                ),
                                textStyle: AppTypography.textBodyGreen,
                                leadingIcon: const Icon(Icons.payment, color: AppColors.lightGreen),
                                width: CustomWidth.custom(300),
                                label: const Text('Forma de pagamento', style: TextStyle(color: AppColors.lightGreen),),
                                dropdownMenuEntries: const [
                                  DropdownMenuEntry(
                                    label: 'Em dinheiro',
                                    value: 'CASH',
                                  ),
                                  DropdownMenuEntry(
                                    label: 'Cartão de débito',
                                    value: 'DEBIT_CARD',
                                  ),
                                  DropdownMenuEntry(
                                    label: 'Cartão de crédito',
                                    value: 'CREDIT_CARD',
                                  ),
                                  DropdownMenuEntry(
                                    label: 'Boleto bancário',
                                    value: 'BANK_SLIP',
                                  ),
                                ],
                                onSelected: (value) => provider.selectedDebtType = value,
                              ),
                              if(provider.isDebtTypeSelected == false) ...[
                                const SizedBox(height: 20),
                                const Text('Selecione uma forma de pagamento', style: AppTypography.textError),
                              ],
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: CustomRectangleButtonWidget(
                height: CustomHeight.custom(60),
                width: double.infinity,
                onPressed: (){
                  if(formKey.currentState!.validate() && provider.isDebtTypeSelected){
                    provider.createDebt();
                    Navigator.pop(context);
                  } else {
                    provider.selectedDebtType == null ? provider.setEmptyDebtType() : null;
                  }
                },
                text: 'Criar pagamento',
                color: AppColors.green,
                textStyle: AppTypography.textBodyWhite,
              ),
            ),
            ]));
  }
}