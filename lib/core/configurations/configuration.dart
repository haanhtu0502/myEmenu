import 'default_config.dart';

class Configurations {
  static String _baseUrl = DefaultConfig.baseUrl;
  static String _domainUrl = DefaultConfig.domainUrl;
  static String _name = DefaultConfig.name;
  static String _environment = DefaultConfig.environment;
  static String _mode = DefaultConfig.mode;
  static String _tenantUrl = DefaultConfig.tenantUrl;
  static String _openAiUrl = DefaultConfig.openAiUrl;
  static String _registerUrl = DefaultConfig.registerUrl;

  static String get registerUrl => _registerUrl;
  void setConfigurationValues(Map<String, dynamic> value) {
    _name = value['name'] ?? DefaultConfig.name;
    _environment = value['environment'] ?? DefaultConfig.environment;
    _baseUrl = value['baseUrl'] ?? DefaultConfig.baseUrl;
    _mode = value['mode'] ?? DefaultConfig.mode;
    _domainUrl = value['domainUrl'] ?? DefaultConfig.domainUrl;
    _tenantUrl = value['tenantUrl'] ?? DefaultConfig.tenantUrl;
    _openAiUrl = value['openAiUrl'] ?? DefaultConfig.openAiUrl;
    _registerUrl = value['registerUrl'] ?? DefaultConfig.registerUrl;
  }

  static String get domainUrl => _domainUrl;
  static String get baseUrl => _baseUrl;
  static String get name => _name;
  static String get environment => _environment;
  static String get mode => _mode;
  static String get tenantUrl => _tenantUrl;
  static String get openAiUrl => _openAiUrl;

  static bool get isMobileMode => _mode == 'mobile';
}
