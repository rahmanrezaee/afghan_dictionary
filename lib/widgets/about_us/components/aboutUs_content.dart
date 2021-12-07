import 'package:fghan_dicitionary/constants.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUsContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: ListView(
        shrinkWrap: true,
        children: [
          Row(
            children: [
              Expanded(
                  child: Text(
                "Afghan Dictionary",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline6,
              )),
            ],
          ),
          Row(
            children: [
              Expanded(
                  child: Text(
                "Dari, Pashto, English Dictionary that easy find word",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.subtitle2,
              )),
            ],
          ),
          Row(
            children: [
              Expanded(
                  child: Text(
                "Version: 1.0.0",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.caption,
              )),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                  child: Text(
                "Open Source project You can expand it with you own idea, or you can contribute this project for make a better version",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.subtitle1,
              )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () async {
                    if (await canLaunch(
                        "https://github.com/rahmanrezaee/afghan_dictionary"))
                      launch(
                          "https://github.com/rahmanrezaee/afghan_dictionary");
                  },
                  child: Text(
                    "Open Repository",
                    textAlign: TextAlign.center,
                  )),
            ],
          ),
          Divider(),
          Row(
            children: [
              Expanded(
                  child: Text(
                "Developer: Rahman Rezaee",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline6,
              )),
            ],
          ),
          Row(
            children: [
              Expanded(
                  child: Text(
                "(Senior Flutter Developer)",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.subtitle1,
              )),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Image.asset(
                  "assets/images/linkedin.png",
                  width: 36,
                ),
                onPressed: () async {
                  if (await canLaunch(
                      "https://www.linkedin.com/in/rahman-rezaee-07488115a/"))
                    launch(
                        "https://www.linkedin.com/in/rahman-rezaee-07488115a/");
                },
              ),
              SizedBox(width: 10),
              IconButton(
                icon: Image.asset(
                  "assets/images/github.png",
                  width: 36,
                ),
                onPressed: () async {
                  if (await canLaunch("https://github.com/rahmanrezaee"))
                    launch("https://github.com/rahmanrezaee");
                },
              ),
              SizedBox(width: 10),
              IconButton(
                icon: Image.asset(
                  "assets/images/facebook.png",
                  width: 36,
                ),
                onPressed: () async {
                  if (await canLaunch(
                      "https://www.facebook.com/Rahmanrezaee1234/"))
                    launch("https://www.facebook.com/Rahmanrezaee1234/");
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
