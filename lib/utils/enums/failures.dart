import '../../constants/constants.dart';
import '../../constants/paths.dart';

enum FailuresEnum {
  unknown,
  parseError,
  notFoundElements,
  unauthorized,
  network,
  brightness,

  ///AppConfigs
  notConfigFound,
  notConfigsFound,

  ///AppConfigs
  urlParseError,
  urlLaunchError
}

Map<String, Object> mapFailures = {
  "failures": [
    {
      "id": "unknown",
      "title": lblUnknownTitle,
      "subtitle": lblUnknownDescription,
      "action": "none",
      "urlImage": unknown,
    },
    {
      "id": "parseError",
      "title": lblParseErrorTitle,
      "subtitle": lblParseErrorDescription,
      "action": "none",
      "urlImage": parseError,
    },
    {
      "id": "notFoundElements",
      "title": lblNotFoundElementsTitle,
      "subtitle": lblNotFoundElementsDescription,
      "action": "none",
      "urlImage": notFoundElements,
    },
    {
      "id": "unauthorized",
      "title": lblUnauthorizedTitle,
      "subtitle": lblUnauthorizedDescription,
      "action": "none",
      "urlImage": unauthorized,
    },
    {
      "id": "network",
      "title": lblNetworkTitle,
      "subtitle": lblNetworkDescription,
      "action": "none",
      "urlImage": network,
    },
    {
      "id": "brightness",
      "title": lblBrightnessErrorTitle,
      "subtitle": lblBrightnessErrorDescription,
      "action": "none",
      "urlImage": notFoundElements,
    },
    {
      "id": "notConfigFound",
      "title": lblAppConfigErrorTitle,
      "subtitle": lblAppConfigErrorDescription,
      "action": "none",
      "urlImage": notFoundElements,
    },
    {
      "id": "notConfigsFound",
      "title": lblAppConfigsErrorTitle,
      "subtitle": lblAppConfigsErrorDescription,
      "action": "none",
      "urlImage": notFoundElements,
    },
    {
      "id": "urlParseError",
      "title": lblUrlParseErrorTitle,
      "subtitle": lblUrlParseErrorDescription,
      "action": "none",
      "urlImage": notFoundElements,
    },
    {
      "id": "urlLaunchError",
      "title": lblUrlLaunchErrorTitle,
      "subtitle": lblUrlLaunchErrorDescription,
      "action": "none",
      "urlImage": notFoundElements,
    }
  ]
};
