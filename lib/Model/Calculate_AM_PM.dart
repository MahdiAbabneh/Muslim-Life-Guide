import 'package:intl/intl.dart';
import '../Compouents/widgets.dart';

var asr=timer_Pray[3].split(":");
var sun=timer_Pray[1].split(":");
int asr_hour=num.parse(asr[0]).toInt(),
    sun_hour=num.parse(sun[0]).toInt(),
    asr_minute=num.parse(asr[1]).toInt(),
    sun_minute=num.parse(sun[1]).toInt(),
    check_hour=num.parse(DateFormat('HH').format(DateTime.now())).toInt(),
    check_minute=num.parse(DateFormat('mm').format(DateTime.now())).toInt();


var Is_AM_PM=((check_hour>asr_hour ||(check_hour==asr_hour && check_minute>asr_minute))
    && (check_hour>sun_hour ||(check_hour==sun_hour && check_minute<sun_hour)));