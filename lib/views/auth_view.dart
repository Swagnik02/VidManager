import 'package:flutter/material.dart';
import 'package:vidmanager/component/register_column.dart';

class AuthView extends StatefulWidget {
  const AuthView({super.key});

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        backgroundColor: Colors.green,
        body: Padding(
          padding: const EdgeInsetsDirectional.all(16.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(
                  0.00,
                  10.0,
                  0.00,
                  0.00,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('tinder'),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(
                    0.00,
                    20.0,
                    0.00,
                    40.00,
                  ),
                  child: DefaultTabController(
                    length: 2,
                    initialIndex: 0,
                    child: Column(
                      children: [
                        TabBar(
                          indicatorColor: Colors.green.shade200,
                          tabs: const [
                            Tab(
                              text: 'Register',
                            ),
                            Tab(
                              text: 'Login',
                            ),
                          ],
                        ),
                        Expanded(
                          child: Container(
                            decoration: const BoxDecoration(
                              border: Border(
                                left: BorderSide(
                                  color: Colors.white,
                                  width: 1.0,
                                ),
                                right: BorderSide(
                                  color: Colors.white,
                                  width: 1.0,
                                ),
                                bottom: BorderSide(
                                  color: Colors.white,
                                  width: 1.0,
                                ),
                              ),
                            ),
                            child: TabBarView(
                              children: [
                                const RegisterColumn(),
                                Column(
                                  children: const [Text('Tab 2')],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
