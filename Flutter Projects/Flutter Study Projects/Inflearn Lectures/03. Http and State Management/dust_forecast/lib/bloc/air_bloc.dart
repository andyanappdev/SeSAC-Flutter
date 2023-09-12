import 'package:dust_forecast/models/AirResult.dart';
import 'package:dust_forecast/resources/airvisual_api_provider.dart';
import 'package:rxdart/rxdart.dart';

class AirBloc {
  final _repository = AirvisualApiProvider();
  final _airSubject = BehaviorSubject<AirResult>();

  AirBloc() {
    fetch();
  }

  void fetch() async {
    var airResult = await _repository.fetchAirResult();
    _airSubject.add(airResult);
  }

  Stream<AirResult> get airResult => _airSubject.stream;
}
