import 'package:thingsboard_app/core/entity/entities_base.dart';
import 'package:thingsboard_app/core/entity/entities_list.dart';
import 'package:thingsboard_app/thingsboard_client.dart';

import 'customers_base.dart';

class CustomersList extends BaseEntitiesWidget<Customer, PageLink>
    with CustomersBase, ContactBasedBase, EntitiesListStateBase {
  CustomersList(
    super.tbContext,
    super.pageKeyController, {
    super.key,
    searchMode = false,
  }) : super(searchMode: searchMode);
}
