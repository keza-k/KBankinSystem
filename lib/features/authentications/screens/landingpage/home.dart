import 'package:flutter/material.dart';
import 'package:kbankinsystem/common/widgets/appbar/appbar.dart';
import 'package:kbankinsystem/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:kbankinsystem/common/widgets/custom_shapes/containers/sectionContainers/sections.dart';
import 'package:kbankinsystem/utils/helpers/helper_functions.dart';
import 'package:kbankinsystem/utils/themes/custom_themes/texts.dart';

class HomeScreenn extends StatefulWidget {
  const HomeScreenn({super.key, required this.message, required this.transactions, required this.balance});

  final String message;
  final List transactions;
  final String balance;
  @override
  State<HomeScreenn> createState() => _HomeScreennState();
}

class _HomeScreennState extends State<HomeScreenn> {
bool obscure = true;

  @override
  Widget build(BuildContext context) {
    final dark = KHelperFunctions.isDarkMode(context);
    print("This is message=====${widget.message}  This is balace=====${widget.balance}  This is transactions=======${widget.transactions}");
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            KPrimaryHeaderContainer(
              child: Stack(
                children: [
                  KAppBar(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        
                      ),
                    ),
                  ),

                
                  Positioned(
                    top: 80,
                    left:250,
                    child: Text(
                    KTexts.homeAppBarTitle, style: Theme.of(context).textTheme.headlineMedium?.
                          copyWith(color: const Color.fromARGB(255, 255, 255, 255),
                            fontWeight: FontWeight.bold,
                          ),
                          ),
                    
                    
                  ),

                  Positioned(
                    top: 110,
                    left: 250,
                    child: Text(
                    KTexts.homeAppBarSubtitle, style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white)
                  )),
                  Positioned(
                    top: 10,
                    right: 20,
                    child: IconButton(onPressed: () {}, icon: const Icon(Icons.person_outline_rounded))
                  )
                ],
              ),
            ),

            homesections(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    KTexts.balanceSectionTitle, style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: const Color.fromARGB(255, 0, 0, 0),fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),
                    const SizedBox(height: 0,),
                  Text(
              obscure
                  ? widget.balance.replaceAll(RegExp(r"."), "*")
                  : widget.balance,
              style: const TextStyle(fontSize: 20),
            ),

            IconButton(
              icon: Icon(obscure ? Icons.visibility : Icons.visibility_off),
              onPressed: () {
                setState(() {
                  obscure = !obscure;
                });
              },
            ),
                    ],
                     ),
                     ),

                  homesections(
                              
                  child: Table(
                  border: TableBorder.all(color: Colors.black), // optional border
                  columnWidths: const {
                    0: FlexColumnWidth(2), // first column takes 2x space
                    1: FlexColumnWidth(2),
                    2: FlexColumnWidth(2), // second column takes 3x space
                  },
                  children: [
                    TableRow(
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(KTexts.accNumberHolder, style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(KTexts.accNumber, style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        // Padding(
                        //   padding: EdgeInsets.all(8.0),
                        //   child: Text(KTexts.transactionType, style: TextStyle(fontWeight: FontWeight.bold)),
                        // ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(KTexts.date, style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                    TableRow(
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(" "),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(" "),
                        ),
                        // Padding(
                        //   padding: EdgeInsets.all(8.0),
                        //   child: Text(" "),
                        // ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(" "),
                        ),

      ],
    ),
    // TableRow(
    //   children: const [
    //     Padding(
    //       padding: EdgeInsets.all(8.0),
    //       child: Text('Bob'),
    //     ),
    //     Padding(
    //       padding: EdgeInsets.all(8.0),
    //       child: Text('30'),
    //     ),
    //   ],
    // ),
  ],
),
            ),
   ] )));
  }}