import 'package:flutter/material.dart';
import 'package:jadran/models/model.dart';
import 'package:jadran/viewmodel/post_cubit/post_view_model_cubit.dart';

Widget ItemCard(NodeModel model) => Card(
      // key: Key(model.uId),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              model.name,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
                height: 1.5,
              ),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  text: '${model.title} :\n',
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    height: 1.5,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: '${model.body}',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        height: 1.5,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ]),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                'Edited : ${model.time}   ${model.data}',
                style: const TextStyle(
                  fontSize: 10,
                  fontStyle: FontStyle.italic,
                  color: Colors.grey,
                ),
              ),
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(Icons.delete),
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );

Future navigatorTO(context, Widget) => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => Widget,
    ));
