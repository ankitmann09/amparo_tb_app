import 'package:thingsboard_app/core/entity/entities_base.dart';
import 'package:thingsboard_app/core/entity/entities_list.dart';
import 'package:thingsboard_app/thingsboard_client.dart';

import 'assets_base.dart';

class AssetsList extends BaseEntitiesWidget<Asset, PageLink>
    with AssetsBase, EntitiesListStateBase {
  AssetsList(
    super.tbContext,
    super.pageKeyController, {
    super.key,
    searchMode = false,
  }) : super(searchMode: searchMode);
}
