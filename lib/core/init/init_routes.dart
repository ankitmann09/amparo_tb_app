import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:thingsboard_app/config/routes/router.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/core/init/inti_region_app.dart';
import 'package:thingsboard_app/core/auth/login/region.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/utils/services/endpoint/i_endpoint_service.dart';
import 'package:thingsboard_app/widgets/tb_progress_indicator.dart';

import 'init_app.dart';

class DirectLoginRedirectPage extends StatelessWidget {
  const DirectLoginRedirectPage(this.tbContext, {Key? key}) : super(key: key);
  final TbContext tbContext;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getIt<IEndpointService>().setRegion(Region.custom);
      tbContext.router.navigateTo(context, '/login', replace: true);
    });
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}

class DirectLoginInitApp extends TbPageWidget {
  DirectLoginInitApp(TbContext tbContext, {Key? key}) : super(tbContext, key: key);

  @override
  State<StatefulWidget> createState() => _DirectLoginInitAppState();
}

class _DirectLoginInitAppState extends TbPageState<DirectLoginInitApp> {
  bool _navigated = false;

  @override
  void initState() {
    super.initState();
    getIt<IEndpointService>().setRegion(Region.custom).then((_) {
      initTbContext().then((_) {
        if (!_navigated) {
          _navigated = true;
          WidgetsBinding.instance.addPostFrameCallback((_) {
            tbContext.router.navigateTo(context, '/login', replace: true);
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: Colors.white,
        child: TbProgressIndicator(tbContext, size: 50.0),
      ),
    );
  }
}

class InitRoutes extends TbRoutes {
  InitRoutes(TbContext tbContext) : super(tbContext);

  late final initHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      return ThingsboardInitApp(tbContext);
    },
  );

  late final regionSelectedHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      return ThingsboardInitRegionApp(tbContext);
    },
  );

  late final directLoginHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      return DirectLoginInitApp(tbContext);
    },
  );

  @override
  void doRegisterRoutes(router) {
    router.define('/', handler: directLoginHandler);
  }
}
