import 'dart:developer';

import 'package:get/get.dart';
import 'package:getx_standard/app/modules/example/home-with-graphql/models/a.dart';
import 'package:getx_standard/app/modules/example/home-with-graphql/models/country_model.dart';
import 'package:getx_standard/app/service/handler/exception_handler.dart';

class GraphQLController extends GetxController with ExceptionHandler {
  RxList<Country> countryList = RxList<Country>();
  RxString mutationResult = "".obs;
  CountryModel? countryModel;
  CountryoNeModel? countryoNeModel;

  /////////////////////   QUERY /////////////////////////

  Future<void> getLang(String code) async {
    showLoading();

    var query = """
    query  {
  country(code: "$code") {
    name
    native
    phone
    continent {
      name
    }
    capital
    currency
    languages {
      code
      name
    }
    emoji
  }
}

     """;

    final result = await graphQLService
        .performMutation(query)
        .catchError(handleGraphqlError);

    if (result == null) return;
    countryoNeModel = CountryoNeModel.fromJson({"data": result});

    log(result.toString());

    hideLoading();
  }

  Future<void> getCountries() async {
    showLoading();
    // Build your query string
    const query = """
    query {
   countries {
    code
    name
    emoji
      }
    }
     """;

    final result =
        await graphQLService.performQuery(query).catchError(handleGraphqlError);

    if (result == null) return;

    countryModel = CountryModel.fromJson({"data": result});

    if (countryModel?.data?.countries != null) {
      countryList.assignAll(countryModel!.data!.countries);
    }

    hideLoading();
  }

  @override
  void onReady() async {
    await getCountries();
    super.onReady();
  }
}
