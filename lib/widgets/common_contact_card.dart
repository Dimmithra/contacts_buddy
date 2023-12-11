import 'package:contacts_buddy/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';

class CommonContactCard extends StatelessWidget {
  const CommonContactCard({
    super.key,
    required this.title,
    this.subTitle,
    this.firstName,
    this.lastName,
    this.pMobileNo,
    this.email,
    this.secMobileNo,
    this.specialNote,
    required this.delete,
    required this.updateIcon,
    this.mobile1,
    this.mobile2,
  });
  final String title;
  final String? subTitle;
  final String? firstName;
  final String? lastName;
  final String? pMobileNo;
  final String? email;
  final String? secMobileNo;
  final String? specialNote;
  final Widget delete;
  final Widget updateIcon;
  final Widget? mobile1;
  final Widget? mobile2;
  @override
  Widget build(BuildContext context) {
    return ExpansionTileCard(
      baseColor: Color.fromARGB(255, 0, 60, 255),
      expandedColor: Colors.blue,
      subtitle: Text("$subTitle",
          style: TextStyle(color: Colors.white, fontSize: 18)),
      title: Text(title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          )),
      borderRadius: BorderRadius.circular(20),
      leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.grey[400],
          ),
          child: const Icon(Icons.person)),
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$firstName',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '$lastName',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '$pMobileNo',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '$secMobileNo',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '$email:',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '$specialNote:',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: kDeleteColor,
                          ),
                          child: delete,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: kDefAppBarColor,
                          ),
                          child: updateIcon,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          // decoration: BoxDecoration(
                          //   borderRadius: BorderRadius.circular(25),
                          //   color: kDefAppBarColor,
                          // ),
                          child: mobile1,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          // decoration: BoxDecoration(
                          //   borderRadius: BorderRadius.circular(25),
                          //   color: kDefAppBarColor,
                          // ),
                          child: mobile2,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
