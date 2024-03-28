import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:portfolio/firebase/admin/portfolio_controller.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_enums.dart';
import '../../../../core/utils/app_extensions.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/custom_button.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  late GlobalKey<FormState> _formKey;
  late TextEditingController _emailController;
  late TextEditingController _messageController;
  late TextEditingController _nameController;
  late TextEditingController _numberController;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey();
    _emailController = TextEditingController();
    _messageController = TextEditingController();
    _nameController = TextEditingController();
    _numberController = TextEditingController();
  }

  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _messageController.dispose();
    _nameController.dispose();
    _numberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _getFormWidth(context.width),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: _nameController,
              style: AppStyles.s14,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _emailController,
              style: AppStyles.s14,
              decoration: const InputDecoration(labelText: 'E-mail'),
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _numberController,
              style: AppStyles.s14,
              decoration: const InputDecoration(labelText: 'Contact number with country Code'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _messageController,
              maxLines: 5,
              style: AppStyles.s14,
              decoration: const InputDecoration(
                labelText: 'Project description here... ',
              ),
            ),
            const SizedBox(height: 16),
            CustomButton(
              label: 'Submit',
              onPressed: () =>_sendMessages(),
              backgroundColor: AppColors.primaryColor,
              width: _getFormWidth(context.width),
            ),
          ],
        ),
      ),
    );
  }

  double _getFormWidth(double deviceWidth) {
    if (deviceWidth < DeviceType.mobile.getMaxWidth()) {
      return deviceWidth;
    } else if (deviceWidth < DeviceType.ipad.getMaxWidth()) {
      return deviceWidth / 1.6;
    } else if (deviceWidth < DeviceType.smallScreenLaptop.getMaxWidth()) {
      return deviceWidth / 2;
    } else {
      return deviceWidth / 2.5;
    }
  }

  _sendMessages()async{
    setState(() =>_isLoading = true);
    var data = {
      "name" : _nameController.text,
      "email" : _emailController.text,
      "phone" : _numberController.text,
      "message" : _messageController.text
    };
    PortfolioController.addMessages(context, data);

    _nameController.clear();
    _emailController.clear();
    _nameController.clear();
    _messageController.clear();
    setState(() =>_isLoading = false);

  }

  Future<void> sendEmail() async {
    // // Note that using a username and password for gmail only works if
    // // you have two-factor authentication enabled and created an App password.
    // // Search for "gmail app password 2fa"
    // // The alternative is to use oauth.
    // String username = 'nayon.coders@gmail.com';
    //
    // final smtpServer = gmail(username, password);
    // // Use the SmtpServer class to configure an SMTP server:
    // // final smtpServer = SmtpServer('smtp.domain.com');
    // // See the named arguments of SmtpServer for further configuration
    // // options.
    //
    // // Create our message.
    // final message = Message()
    //   ..from = Address(username, '$_nameController')
    //   ..recipients.add('$_emailController')
    //   ..subject = '$_nameController :: 😀 :: $_numberController :: 😀 :: ${DateTime.now()}'
    //   ..text = '$_messageController';
    //
    //
    //
    // // Sending multiple messages with the same connection
    // //
    // // Create a smtp client that will persist the connection
    // var connection = PersistentConnection(smtpServer);
    //
    // // Send the first message
    // await connection.send(message);
    //
    //
    // // close the connection
    // await connection.close();
    ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(
         backgroundColor: Colors.red,
        duration: Duration(milliseconds: 5000),
        content: Text("Please contact with me in Whatsapp. I am always ready reply you..\n Thank You."),
      ),
    );

  }
}
