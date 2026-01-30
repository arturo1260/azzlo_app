import 'package:flutter/material.dart';

import '../../core/styles/app_colors.dart';

class ForgetPasswordPage extends StatefulWidget{
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPage();

}

class _ForgetPasswordPage extends State<ForgetPasswordPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Form (
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 250,
                child: TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.surface,
                    hintText: "Confirmar email",

                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: AppColors.primaryLight
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: AppColors.primary,
                          width: 2
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),

                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: AppColors.error
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),

                    focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: AppColors.primary
                        ),
                        borderRadius: BorderRadius.circular(12)
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20,),

              ElevatedButton(onPressed: () {}, child: Text("Enviar email")),
            ],
          ),
        ),
      ),
    );
  }
}