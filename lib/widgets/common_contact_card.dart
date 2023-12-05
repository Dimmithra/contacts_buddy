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
    required this.onpressDelete,
  });
  final String title;
  final String? subTitle;
  final String? firstName;
  final String? lastName;
  final String? pMobileNo;
  final String? email;
  final String? secMobileNo;
  final String? specialNote;
  final Function() onpressDelete;
  @override
  Widget build(BuildContext context) {
    return ExpansionTileCard(
      baseColor: Color.fromARGB(255, 0, 60, 255),
      expandedColor: Colors.blue,
      subtitle: Text("$subTitle",
          style: TextStyle(color: Colors.white, fontSize: 18)),
      title: Text(title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          )),
      borderRadius: BorderRadius.circular(20),
      leading: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.grey[400],
          ),
          child: Icon(Icons.person)),
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
                  ),
                  Text(
                    '$lastName',
                  ),
                  Text(
                    '$pMobileNo',
                  ),
                  Text(
                    '$secMobileNo',
                  ),
                  Text(
                    '$email:',
                  ),
                  Text(
                    '$specialNote:',
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          onPressed: onpressDelete,
                          icon: Icon(Icons.delete),
                        ),
                        Icon(Icons.edit),
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
