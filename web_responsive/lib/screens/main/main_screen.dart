import 'package:flutter/material.dart';
import 'package:web_responsive_ui/core/style/color.dart';
import 'package:web_responsive_ui/core/responsi/responsive.dart';
import 'package:web_responsive_ui/models/write.dart';
import 'package:universal_html/html.dart' as html;
import '../widget/cupertino_switch.dart';
import 'components/side_menu.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key, required this.children}) : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Responsive.isDesktop(context)
          ? null
          : AppBar(
              toolbarHeight: 50, // default is 56
              actions: <Widget>[
                Row(
                  children: [
                    Responsive.isMobile(context)
                        ? Container()
                        : const CupertinoSwitchW(
                            width: null,
                            height: 32,
                          ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: primaryColor, width: 2),
                      ),
                      child: Row(
                        children: [
                          MaterialButton(
                            onPressed: () async {
                              html.window.open(
                                  "https://www.linkedin.com/in/albertoguaman",
                                  "LikedIn");
                            },
                            child: Text(
                              Write.linkedin.toUpperCase(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: primaryColor, width: 2),
                      ),
                      child: Row(
                        children: [
                          MaterialButton(
                            onPressed: () async {
                              html.window.open(
                                  "https://www.instagram.com/tinguar_technology",
                                  "Instagram");
                            },
                            child: Text(
                              Write.instagram.toUpperCase(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
              backgroundColor: bgColor,
              leading: Builder(
                builder: (context) => IconButton(
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    icon: const Icon(Icons.menu)),
              )),
      drawer: const SideMenu(),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: maxWidth),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (Responsive.isDesktop(context))
                const Expanded(
                  flex: 2,
                  child: SideMenu(),
                ),
              const SizedBox(width: defaultPadding),
              Expanded(
                  flex: 7,
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        ...children,
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
      floatingActionButton: Responsive.isMobile(context)
          ? const Padding(
              padding: EdgeInsets.symmetric(vertical: 50.0),
              child: CupertinoSwitchW(
                width: 113,
              ),
            )
          : Container(),
    );
  }
}
