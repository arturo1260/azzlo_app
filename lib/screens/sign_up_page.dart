

import 'package:azzlo_app/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../core/styles/app_colors.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUp();

}

class _SignUp extends State<SignUpPage> {
  final signUpForm = GlobalKey<FormState>();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  bool _obscurePassword = true;


  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1800),
        lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
        dateController.text = "${pickedDate.year}-${pickedDate.month}-${pickedDate.day}";
      });
    }
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  Future<void> _createUser() async {
    if(!signUpForm.currentState!.validate()) return;

    final data = await AuthService.signUp(
        fullName: fullNameController.text,
        username: userNameController.text,
        email: emailController.text,
        profilePicture: "asdasd",
        date: dateController.text,
        password: passwordController.text,
        description: descriptionController.text
    );

    if (data != null) {
      print("Usuario creado con éxito !");
      print(data);
    } else {
      print("El usuario no ha sido creado");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(),
      body: Center(
        child: Form(
          key: signUpForm,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/images/azzlo-logo.svg",
                  height: 150,
                  colorFilter: const ColorFilter.mode(
                      AppColors.primary,
                      BlendMode.srcIn),
                ),

                SizedBox(
                  width: 250,
                  child: TextFormField(
                    controller: fullNameController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.surface,
                      hintText: "Nombre Completo",

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
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Este campo es obligatorio";
                      }
                      return null;
                    },
                  ),
                ),

                const SizedBox(height: 20,),

                SizedBox(
                  width: 250,
                  child: TextFormField(
                    controller: userNameController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.surface,
                      hintText: "Nombre de usuario",

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
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Este campo es obligatorio";
                      }
                      return null;
                    },
                  ),
                ),

                const SizedBox(height: 20,),

                SizedBox(
                  width: 250,
                  child: TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.surface,
                      hintText: "Email",

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
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Este campo es obligatorio";
                      }
                      return null;
                    },
                  ),
                ),

                const SizedBox(height: 20,),

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
                    validator: (value) {
                      if (value != emailController.text) {
                        return "El email debe de coincidir";
                      } else if (value == null || value.trim().isEmpty) {
                        return "El campo es obligatorio";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),

                const SizedBox(height: 20,),

                SizedBox(
                  width: 250,
                  child: TextFormField(
                    controller: dateController,
                    readOnly: true,
                    onTap: () => _selectDate(context),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.surface,
                      hintText: "Fecha de nacimiento",

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
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Este campo es obligatorio";
                      }
                      return null;
                    },
                  ),
                ),

                const SizedBox(height: 20,),

                SizedBox(
                  width: 250,
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.surface,
                      hintText: "Contraseña",
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword ? Icons.visibility : Icons.visibility_off,
                        ),
                        onPressed: _togglePasswordVisibility,
                      ),

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
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Este campo es obligatorio";
                      }
                      return null;
                    },
                  ),
                ),

                const SizedBox(height: 20,),

                SizedBox(
                  width: 250,
                  child: TextFormField(
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.surface,
                      hintText: "Confirmar contraseña",

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
                    validator: (value) {
                      if (value != passwordController.text) {
                        return "Debe de coincidir la contraseña";
                      } else if (value == null || value.trim().isEmpty) {
                        return "El campo es obligatorio";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),

                const SizedBox(height: 20,),

                SizedBox(
                  width: 250,
                  child: TextFormField(
                    controller: descriptionController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.surface,
                      hintText: "Descripción",

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
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Este campo es obligatorio";
                      }
                      return null;
                    },
                  ),
                ),

                const SizedBox(height: 20,),

                ElevatedButton(onPressed: _createUser, style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary
                ),
                  child: Text(
                    "Enviar",
                    style: TextStyle(
                      color: AppColors.textPrimary,
                    ),
                  ),)
              ],
            )
        ),
      ),
    );
  }
}