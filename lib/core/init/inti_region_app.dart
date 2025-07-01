import 'package:flutter/material.dart';
import 'package:thingsboard_app/core/auth/login/login_page.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/utils/services/local_database/i_local_database_service.dart';
import 'package:thingsboard_app/widgets/tb_progress_indicator.dart';

class ThingsboardInitRegionApp extends TbPageWidget {
  ThingsboardInitRegionApp(super.tbContext, {super.key});

  @override
  State<StatefulWidget> createState() => _ThingsboardInitAppState();
}

class _ThingsboardInitAppState extends TbPageState<ThingsboardInitRegionApp> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initTbContext(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Container(
              alignment: Alignment.center,
              color: Colors.white,
              child: TbProgressIndicator(tbContext, size: 50.0),
            ),
          );
        }
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(child: Text('Initialization error: \\${snapshot.error}')),
          );
        }
        return LoginPage(tbContext);
      },
    );
  }
}
