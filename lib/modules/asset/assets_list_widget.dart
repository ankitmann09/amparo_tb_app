import 'package:thingsboard_app/core/entity/entities_list_widget.dart';
import 'package:thingsboard_app/modules/asset/assets_base.dart';
import 'package:thingsboard_app/thingsboard_client.dart';

class AssetsListWidget extends EntitiesListPageLinkWidget<Asset>
    with AssetsBase {
  AssetsListWidget(
    super.tbContext, {
    super.key,
    super.controller,
  });

  @override
  void onViewAll() {
    navigateTo('/assets');
  }
}
