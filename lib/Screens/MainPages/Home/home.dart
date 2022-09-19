//import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
//import 'package:http/http.dart';

import '../../../components/constants.dart';
import '../Transactions/transactions_summary.dart';
//import '../component/model.dart';

class Home extends StatefulWidget {
  //final String userID;
  //final String solde;
  const Home({
    Key? key,
    /*required this.userID, required this.solde*/
  }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext coontext) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
      child: Column(
        children: [
          const SizedBox(
            height: kToolbarHeight,
          ),
          card(),
          const SizedBox(
            height: largePadding,
          ),
          const TransactionsSummary(),
        ],
      ),
    ));
  }

  Widget card() {
    return Container(
      padding: const EdgeInsets.all(20),
      //margin: const EdgeInsets.symmetric(horizontal: defaultPadding),
      height: 250,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: kSimpleTextColor.withOpacity(0.4),
            offset: const Offset(0, 8),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // Ce widget Column est contitué de deux autres widgets Row, qui divise la carte en deux partie Supérieure et Inférieure
        // 1er Row : Partie supérieure qui contient un logo
        // 2e Row : Partie inférieure en inférieur qui contient d'autres informations du compte
        children: [
          // Partie Supérieure
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Logo sur la carte
              Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                    color: kBackgroundBodyColor,
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                child: Center(
                  child: Image.asset(
                    "assets/logos/4-rb.png",
                  ),
                ),
              )
            ],
          ),

          // Partie inférieure
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // Ce widget Row est contitué de deux autre widgets Column qui divisent la partie inférieure en deux autre partie
            // 1er Column : Partie gauche : Information du compte
            // 2e Column : Partie droite : Boutons d'actions
            children: [
              //Partie gauche
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Label solde
                  const Text(
                    "Solde",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  // Montant solde
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      // Montant
                      Text(
                        "567,598",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(
                        width: 5,
                      ),
                      // Devise
                      Text("Fcfa",
                          style: TextStyle(color: Colors.white, fontSize: 15)),
                    ],
                  ),
                ],
              ),

              //Partie droite
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    tooltip: "Scanner un QR code",
                    onPressed: () {
                      debugPrint("Scanner un QR code");
                    },
                    icon: const Icon(
                      Icons.qr_code_scanner,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    tooltip: "Voir mon QR code",
                    onPressed: () {
                      debugPrint("Voir mon QR code");
                    },
                    icon: const Icon(
                      Icons.qr_code_2,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    tooltip: "Se recharger",
                    onPressed: () {
                      debugPrint("Se rrecharge");
                    },
                    icon: const Icon(
                      Icons.add_circle_outline,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  /*
  String mysolde = "0";
  dynamic transactionsItem;

  void accountRequest(String userID) async {
    Map<String, dynamic> account = jsonDecode("{}");

    debugPrint("Tentative de recupération des infos solde");
    Response response = await get(Uri.parse('${api}users/$userID/accounts/'));

    debugPrint("Code de la reponse : [${response.statusCode}]");
    debugPrint("Contenue de la reponse : ${response.body}");

    if (response.statusCode == 200) {
      String userAccountData = response.body.toString();
      Map<String, dynamic> tmp = jsonDecode(userAccountData);

      account = tmp['account_owner'][0];
      debugPrint("Retour du solde du client");
      mysolde = account['amount'].toString();
    } else {
      debugPrint("La requete e échouée");
      mysolde = "0";
    }
    setState(() {});
  }

  ///
  ///
  ///
  ///
  ///
  void transactionsRequest(String userID) async {
    debugPrint("TRANSACTIONS REQUEST - HOME");

    try {
      debugPrint(
          "Tentative de recupération des infos des transactions [${api}users/$userID/accounts/]");
      Response responseTransactions =
          await get(Uri.parse('${api}users/$userID/transactions/'));

      debugPrint("Code de la reponse : [${responseTransactions.statusCode}]");
      debugPrint("Contenue de la reponse : ${responseTransactions.body}");

      if (responseTransactions.statusCode == 200) {
        Map<String, dynamic> tmp =
            jsonDecode(responseTransactions.body.toString());

        debugPrint("Retour du solde du client");
        transactionsItem = tmp['user_sender'];
        debugPrint("Transactions : $transactionsItem");
      } else {
        debugPrint("La requete e échouée");
        transactionsItem = null;
        debugPrint("Transactions  : $transactionsItem");
      }
    } catch (e) {
      debugPrint(e.toString());
      transactionsItem = null;
    }
    //setState(() {});
  }

  List<TransactionModel> transactionList = [
    const TransactionModel(
      icon: Icons.call_received,
      name: "Kouassi Ezechiel",
      date: '26/08/2022 - 21:05',
      amount: '---------',
    ),
    const TransactionModel(
      icon: Icons.call_received,
      name: "Kienou Chris",
      date: '20/08/2022 - 10:05',
      amount: '---------',
    ),
    const TransactionModel(
      icon: Icons.call_made,
      name: "Ballo Seydou",
      date: '20/08/2022 - 7:32',
      amount: '---------',
    ),
    const TransactionModel(
      icon: Icons.call_received,
      name: "Nade Fabrice",
      date: '15/08/2022 - 12:04',
      amount: '---------',
    ),
    const TransactionModel(
      icon: Icons.call_received,
      name: "Coulibaly Karim",
      date: '16/08/2022 - 13:59',
      amount: '---------',
    ),
    const TransactionModel(
      icon: Icons.call_made,
      name: "Kaddy Kaddy",
      date: '22/07/2022 - 21:05',
      amount: '---------',
    ),
    const TransactionModel(
      icon: Icons.call_received,
      name: "Soumahoro keh",
      date: '01/02/2022 - 8:10',
      amount: '---------',
    ),
    const TransactionModel(
      icon: Icons.call_received,
      name: "Mambe moïse",
      date: '26/01/2022 - 9:3',
      amount: '---------',
    ),
    const TransactionModel(
      icon: Icons.call_received,
      name: "Kessy Salomon",
      date: '26/01/2022 - 20:05',
      amount: '---------',
    ),
    const TransactionModel(
      icon: Icons.call_received,
      name: "Ouattara Kader",
      date: '10/01/2022 - 19:30',
      amount: '---------',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    //accountRequest(widget.userID);
    transactionsRequest(widget.userID);
    return Scaffold(
      body: Column(
        children: <Widget>[
          appBarBottomSection(),
          mainBody(),
        ],
      ),
    );
  }

  Container appBarBottomSection() {
    //String solde = "999.999.999";
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
      ),
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 150,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: kWeightBoldColor,
              borderRadius: BorderRadius.circular(30),
              border:
                  Border.all(color: kPrimaryColor.withOpacity(0.1), width: 2),
              boxShadow: [
                BoxShadow(
                  color: kSimpleTextColor.withOpacity(0.4),
                  offset: const Offset(0, 8),
                  blurRadius: 10,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Vous disposez de',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    height: 1,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.solde,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        height: 0.9,
                      ),
                    ),
                    const Text(
                      ' Fcfa',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        height: 1,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }

  Expanded mainBody() {
    return Expanded(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 32,
            ),
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Text(
                        'Résumé transactions',
                        style: TextStyle(
                          color: kBoldTextColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Divider(),
                /*
                ListView.separated(
                  primary: false,
                  shrinkWrap: true,
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: transactionList.length,
                  itemBuilder: (context, index) => ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Container(
                      width: 60,
                      height: 60,
                      clipBehavior: Clip.hardEdge,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(),
                      child: Icon(transactionList[index].icon, size: 20),
                    ),
                    title: Text(
                      transactionList[index].name,
                      style: const TextStyle(
                        color: kPrimaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: Text(
                      transactionList[index].date,
                      style: TextStyle(
                        color: kPrimaryColor.withOpacity(0.6),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: Text(
                      transactionList[index].amount,
                      style: const TextStyle(
                        color: kPrimaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                */
                transactionsWidget(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget transactionsWidget() {
    if (transactionsItem == null || transactionsItem == [] as dynamic) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [Text("Aucune transaction éffectuée")],
      );
    } else {
      return ListView.separated(
        primary: false,
        shrinkWrap: true,
        separatorBuilder: (context, index) => const Divider(),
        itemCount: transactionsItem.length,
        itemBuilder: (context, index) => ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Container(
            width: 60,
            height: 60,
            clipBehavior: Clip.hardEdge,
            alignment: Alignment.center,
            decoration: const BoxDecoration(),
            child: (transactionsItem[index]["sender"] == widget.userID)
                ? const Icon(Icons.call_made, size: 20)
                : const Icon(Icons.call_received, size: 20),
          ),
          title: Text(
            transactionsItem[index]["recipient"],
            style: const TextStyle(
              color: kWeightBoldColor,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: Text(
            "${transactionsItem[index]["datetime"]}",
            style: TextStyle(
              color: kWeightBoldColor.withOpacity(0.6),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          trailing: Text(
            "${transactionsItem[index]["amount"]}",
            style: const TextStyle(
              color: kWeightBoldColor,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      );
    }
  }
  */
}
