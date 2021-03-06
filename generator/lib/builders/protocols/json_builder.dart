import 'package:aws_client.generator/builders/protocols/service_builder.dart';
import 'package:aws_client.generator/model/api.dart';
import 'package:aws_client.generator/model/operation.dart';

class JsonServiceBuilder extends ServiceBuilder {
  final Api api;

  JsonServiceBuilder(this.api);

  @override
  String constructor() => '''
  final _s.JsonProtocol _protocol;
  ${api.metadata.className}({@_s.required String region, @_s.required _s.AwsClientCredentials credentials, _s.Client client, String endpointUrl,})
  : _protocol = _s.JsonProtocol(client: client, service: \'${api.metadata.endpointPrefix}\', region: region, credentials: credentials, endpointUrl: endpointUrl,);
  ''';

  @override
  String imports() => '';

  @override
  String operationContent(Operation operation) => '''// TODO: implement json
      final headers = {
        'Content-Type': 'application/x-amz-json-${api.metadata.jsonVersion ?? '1.0'}',
        'X-Amz-Target': '${api.metadata.targetPrefix}.${operation.name}'
      };
      throw UnimplementedError();''';
}
