import 'package:flutter/material.dart';
import 'package:kbsg/components/cust_button.dart';
import 'package:kbsg/components/cust_text_field.dart';
import 'package:kbsg/constants/constants.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen>
    with TickerProviderStateMixin {
  Constants constants = Constants();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Edit Profile",
          style: TextStyle(
            color: Color(0xFF1F2937),
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: _editFields(),
          ),
        ),
      ),
    );
  }

  Widget _editFields() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _dp(),
          const SizedBox(
            height: 40,
          ),
          const CustomTextField(
            hint: "",
            label: "Name",
          ),
          const CustomTextField(
            hint: "abc@gmail.com",
            label: "Email Address",
          ),
          const CustomTextField(
            hint: "",
            label: "Password",
          ),
          const Spacer(),
          const CustButton(label: "Save Changes"),
          const Spacer(),
        ],
      ),
    );
  }

  Widget _dp() {
    return Container(
      height: 80,
      width: 80,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 0),
          ),
        ],
        image: DecorationImage(
          image: NetworkImage(
              "https://shotkit.com/wp-content/uploads/2021/06/cool-profile-pic-matheus-ferrero.jpeg"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
