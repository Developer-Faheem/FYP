import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylesage/commons/widgets/custom_appbar1.dart';
import 'package:stylesage/features/Personalization/screens/privacy_policy/widgets/privacy_policy_item.dart';
import 'package:stylesage/features/Personalization/screens/privacy_policy/widgets/privacy_policy_subitem.dart';
import 'package:stylesage/features/Personalization/screens/privacy_policy/widgets/section_title.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/sizes.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: SColors.bgMainScreens,
      child: SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
              preferredSize: AppBar().preferredSize,
              child: CustomAppbar1(
                title: "Privacy Policy",
                isOutlined: false,
                onPressedCallback: () {
                  Get.back();
                },
              )),
          body: const SingleChildScrollView(
            padding: EdgeInsets.only(
                left: SSizes.lg, right: SSizes.lg, top: SSizes.sm),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SectionTitle('1. Information We Collect'),
                PrivacyPolicyItem(
                  title: '1.1 Information You Provide:',
                  content:
                      'We collect information you provide when you use Style Sage, including:',
                ),
                PrivacyPolicySubItem(
                  title: 'Account Information:',
                  content:
                      'When you create an account, we collect your name, email address, phone number, and other optional profile information.',
                ),
                PrivacyPolicySubItem(
                  title: 'Appointment Details:',
                  content:
                      'When you book appointments, we collect information about the services you request, date, time, and the salon you choose.',
                ),
                PrivacyPolicySubItem(
                  title: 'Payment Information:',
                  content:
                      'When you make payments through Style Sage, we collect payment card information, billing address, and transaction details.',
                ),
                PrivacyPolicySubItem(
                  title: 'Communications:',
                  content:
                      'We collect the content of messages and other communications you send through the app, including customer support inquiries.',
                ),
                PrivacyPolicyItem(
                  title: '1.2 Automatically Collected Information:',
                  content:
                      'We collect certain information automatically, including:',
                ),
                PrivacyPolicySubItem(
                  title: 'Device Information:',
                  content:
                      'We collect device-specific information such as device type, operating system, and unique device identifiers.',
                ),
                PrivacyPolicySubItem(
                  title: 'Log Information:',
                  content:
                      'We record details of your use of the app, including search queries, app performance, and other usage information.',
                ),
                PrivacyPolicySubItem(
                  title: 'Location Information:',
                  content:
                      'With your consent, we collect location information to provide salon recommendations and appointment reminders.',
                ),
                PrivacyPolicyItem(
                  title: '1.3 Cookies and Similar Technologies:',
                  content:
                      'We use cookies and similar technologies to collect information about your interactions with Style Sage and to improve our services.',
                ),
                SectionTitle('2. How We Use Your Information'),
                PrivacyPolicyItem(
                  title:
                      'We use the information we collect for various purposes, including:',
                  content: '',
                ),
                PrivacyPolicySubItem(
                  title: "",
                  content:
                      'Providing and maintaining the app\'s functionality and services.',
                ),
                PrivacyPolicySubItem(
                  title: '',
                  content:
                      'Processing your appointments, payments, and communications.',
                ),
                PrivacyPolicySubItem(
                  title: '',
                  content:
                      'Personalizing your experience and offering salon recommendations.',
                ),
                PrivacyPolicySubItem(
                  title: '',
                  content:
                      'Analyzing usage and app performance for improvements.',
                ),
                PrivacyPolicySubItem(
                  title: '',
                  content: 'Complying with legal obligations.',
                ),
                SectionTitle('3. Data Sharing'),
                PrivacyPolicyItem(
                  title:
                      'We do not sell your personal information. We may share your information with:',
                  content: '',
                ),
                PrivacyPolicySubItem(
                  title: '',
                  content: 'Salons you book with to fulfill your appointments.',
                ),
                PrivacyPolicySubItem(
                  title: '',
                  content: 'Payment processors for transaction processing.',
                ),
                PrivacyPolicySubItem(
                  title: '',
                  content:
                      'Service providers that assist us in delivering our services.',
                ),
                PrivacyPolicySubItem(
                  title: '',
                  content:
                      'When required by law or to protect our rights or safety.',
                ),
                SectionTitle('4. Your Choices'),
                PrivacyPolicyItem(
                  title:
                      'You can manage your information and privacy preferences by:',
                  content: '',
                ),
                PrivacyPolicySubItem(
                  title: '',
                  content: 'Updating your profile and notification settings.',
                ),
                PrivacyPolicySubItem(
                  title: '',
                  content: 'Adjusting location settings on your device.',
                ),
                PrivacyPolicySubItem(
                  title: '',
                  content: 'Opting out of promotional communications.',
                ),
                SectionTitle('5. Security'),
                PrivacyPolicyItem(
                  title: '',
                  content:
                      'We take reasonable measures to protect your information from unauthorized access and use.',
                ),
                SectionTitle('6. Changes to this Privacy Policy'),
                PrivacyPolicyItem(
                  title: '',
                  content:
                      'We may update this Privacy Policy to reflect changes in our practices or for legal reasons. We will notify you of any significant changes.',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
