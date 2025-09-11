import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:kbankinsystem/features/authentications/screens/landingpage/home.dart';
import 'package:kbankinsystem/features/authentications/screens/transaction_forms/deposits.dart';
import 'package:kbankinsystem/features/authentications/screens/transaction_forms/tranfer.dart';
import 'package:kbankinsystem/features/authentications/screens/transaction_forms/withdraw.dart';
import 'package:kbankinsystem/utils/constants/colors.dart';
import 'package:kbankinsystem/utils/helpers/helper_functions.dart';


  final List<Widget> _screens = [];
  String bal = "";
  List trans = [];
class Landingpage extends StatefulWidget{
  const Landingpage({super.key, required this.balance, required this.transactions});

  final String balance;
  final List transactions;




@override
  _LandingPageState createState() => _LandingPageState();
}
class _LandingPageState extends State<Landingpage>{

  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    bal = widget.balance;
    trans = widget.transactions;
    // controller = Get.put(NavigationController(
    //   initialBalance: widget.balance,
    //   initialTransactions: widget.transactions,
    // ));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final dark = KHelperFunctions.isDarkMode(context);
    final controller = Get.put(NavigationController());



    Icon navIcon(IconData icon){
      return Icon(
        icon,
        size: 28,
        color: dark? Colors.white:Colors.black,
        );
    }

    return Scaffold(
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
      bottomNavigationBar: 
      
      Obx(
          ()=> NavigationBar(
          height: 70,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          backgroundColor: dark? KColors.black: Colors.white,
          indicatorColor: dark? KColors.black: Colors.white,
              onDestinationSelected: (index) => controller.selectedIndex.value = index,

          destinations: [
            NavigationDestination(icon: navIcon(Icons.home), label: 'Home'),
            NavigationDestination(icon: navIcon(Icons.money), label: 'Deposit' ),
            NavigationDestination(icon: navIcon(Icons.money), label: 'Withdraw'),
            NavigationDestination(icon: navIcon(Icons.money), label: 'Transfer'),

          ]
          ),
      ),

      
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  // final RxString balance = "".obs;
  // final RxList transactions = [].obs;
  // NavigationController({
  //   required String initialBalance,
  //   required List initialTransactions,
  // }) {
  //   balance.value = initialBalance;
  //   transactions.value = initialTransactions;
  // }
  final screens  = [ HomeScreenn(message: "KKKKK", transactions: trans, balance: bal), const DepositForm(), const WithdrawForm(),const TransferForm()];
}