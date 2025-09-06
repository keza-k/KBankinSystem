import 'package:flutter/material.dart';
import 'package:kbankinsystem/features/authentications/screens/landingpage/home.dart';
import 'package:kbankinsystem/features/authentications/screens/transaction_forms/deposits.dart';
import 'package:kbankinsystem/features/authentications/screens/transaction_forms/tranfer.dart';
import 'package:kbankinsystem/features/authentications/screens/transaction_forms/withdraw.dart';
import 'package:kbankinsystem/utils/constants/colors.dart';
import 'package:kbankinsystem/utils/helpers/helper_functions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(body: Center(child: Text("Home Screen")));
}

class DepositScreen extends StatelessWidget {
  const DepositScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(body: Center());
}

class WithdrawScreen extends StatelessWidget {
  const WithdrawScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(body: Center(child: Text("Withdraw Screen")));
}

class TransferScreen extends StatelessWidget {
  const TransferScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(body: Center(child: Text("Transfer Screen")));
}




  final List<Widget> _screens = [
    const HomeScreenn(mesaage: 'Dear Client, your balance is 2000000 ',),
    const DepositForm(),
    const WithdrawForm(),
    const TransferForm(),
    
  ];

class Landingpage extends StatefulWidget{
  const Landingpage({super.key});

@override
  _LandingPageState createState() => _LandingPageState();
}
class _LandingPageState extends State<Landingpage>{
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final dark = KHelperFunctions.isDarkMode(context);

    Icon navIcon(IconData icon){
      return Icon(
        icon,
        size: 28,
        color: dark? Colors.white:Colors.black,
        );
    }

    return Scaffold(
      body: _screens[selectedIndex],
      bottomNavigationBar: 
      
      NavigationBar(
        height: 70,
        elevation: 0,
        backgroundColor: dark? KColors.black: Colors.white,
        indicatorColor: dark? KColors.black: Colors.white,
        onDestinationSelected: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        
        destinations: [
          NavigationDestination(icon: navIcon(Icons.home), label: 'Home'),
          NavigationDestination(icon: navIcon(Icons.money), label: 'Deposit' ),
          NavigationDestination(icon: navIcon(Icons.money), label: 'Withdraw'),
          NavigationDestination(icon: navIcon(Icons.money), label: 'Transfer'),

        ]
        ),

      
    );
  }
}