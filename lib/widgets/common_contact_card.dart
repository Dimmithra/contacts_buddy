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
    this.baseColor,
    this.expandedColor,
    this.iconColor,
    this.mainIconColors,
    this.titleColor,
    this.subTitleColor,
    this.share,
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
  final Color? baseColor;
  final Color? expandedColor;
  final Color? iconColor;
  final Color? mainIconColors;
  final Color? titleColor;
  final Color? subTitleColor;
  final Function()? share;
  @override
  Widget build(BuildContext context) {
    return ExpansionTileCard(
      baseColor: baseColor,
      expandedColor: expandedColor,
      subtitle: Text("$subTitle",
          style: TextStyle(
            color: subTitleColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          )),
      title: Text(title,
          style: TextStyle(
            color: titleColor,
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
          child: Icon(
            Icons.person,
            color: mainIconColors,
          )),
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.person,
                      ),
                      Text(
                        '$firstName $lastName',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.phone,
                          ),
                          const Text(
                            '1',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            '$pMobileNo',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.phone,
                          ),
                          const Text(
                            '2',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            '$secMobileNo',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.email),
                      Text(
                        '$email',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '$specialNote',
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
                        IconButton(
                            onPressed: share, icon: const Icon(Icons.share))
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
