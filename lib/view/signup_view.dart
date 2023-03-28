
import 'package:flutter/material.dart';
import 'package:mvvm_provider/utilities/routes/routes_name.dart';
import 'package:provider/provider.dart';

import '../res/components/round_button.dart';
import '../utilities/utils.dart';
import '../view_model/auth_view_model.dart';


class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  _SignUpViewState createState() => _SignUpViewState();
}
TextEditingController email = TextEditingController();
TextEditingController pass = TextEditingController();

ValueNotifier<bool> obsecure = ValueNotifier<bool>(true);

FocusNode emailnode = FocusNode();
FocusNode passnode = FocusNode();

class _SignUpViewState extends State<SignUpView> {
  @override

  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  //   email.dispose();
  //   pass.dispose();
  //
  //   emailnode.dispose();
  //   passnode.dispose();
  //
  //   obsecure.dispose();
  // }


  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height*1;
    final authViewModel = Provider.of<AuthViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("SignUp"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextFormField(
                controller: email,
                focusNode: emailnode,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: 'email',
                  prefixIcon: Icon(Icons.alternate_email),

                ),
                onFieldSubmitted:(value) {
                  Utils.FieldFocusChange(context, emailnode, passnode);

                  //FocusScope.of(context).requestFocus(passnode);
                },

              ),
            ),

            Padding(
                padding: const EdgeInsets.all(18.0),
                child: ValueListenableBuilder(valueListenable: obsecure, builder: (context, value, chlid){
                  return TextFormField(
                    controller: pass,
                    obscureText: obsecure.value,
                    obscuringCharacter: "*",
                    focusNode: passnode,
                    decoration: InputDecoration(
                        hintText: 'password',
                        prefixIcon: const Icon(Icons.lock_outline),
                        suffixIcon: InkWell(
                            onTap: (){
                              obsecure.value = !obsecure.value;
                            },
                            child: Icon( obsecure.value ? Icons.visibility_off_outlined : Icons.visibility_outlined))

                    ),

                  );
                })
            ),
            SizedBox(height: height*.085,),
            Center(child: RoundButton(title: "SignUp",
                loading: authViewModel.signuploading,
                onPress: (){
                  if(email.text.isEmpty){
                    Utils.flushBarErrorMessage("Please enter email", context);

                  }
                  else if(pass.text.isEmpty){
                    Utils.flushBarErrorMessage("Please enter password", context);


                  }else if(pass.text.length < 6){
                    Utils.flushBarErrorMessage("Please enter 6 digit ", context);


                  }
                  else{
                    Map data = {
                      'email' : email.text.toString(),
                      'password' : pass.text.toString()
                    };
                    authViewModel.signUpApi(context, data);
                    print("Api hit");

                  }

                })),
            SizedBox(height: height*.02,),
            InkWell(
              onTap: (){
                Navigator.pushNamed(context, RoutesName.loginScreen);
              },
              child: Text("Already have an account? Login"),)
          ],
        ),
      ),
    );
  }
}
