class StringAnalyzer {
  String? _name;
  var _value;
  int _indent = 0;
  int? _index;

  int? get index => _index;

  int get indent => _indent;

  dynamic get value => _value;

  String? get name => _name;

  StringAnalyzer(String input) {
    int i;
    var b = false;

    while (input.startsWith('  ')) {
      input = input.substring(2);
      _indent++;
    }

    input = input.trim();

    if (input.contains('=')) {
      List equalSplit = input.split('=');
      List spaceSplit = equalSplit[0].split(' ');

      _name = spaceSplit[0];
      i = 1;

      if (spaceSplit.length == 1) {
        spaceSplit.add('');
      }

      do {
        if (spaceSplit[i].trim() == '') {
          b = false;
          i++;
        } else {
          b = true;
        }
      } while (!b && (i < spaceSplit.length));

      if (equalSplit[1].split(',').length > 1) {
        List commaSplit = equalSplit[1].split(',');
        _value = [];
        if (b) {
          switch (spaceSplit[i]) {
            case 'b':
              {
                for (var element in commaSplit) {
                  if (element.trim() == 'true') {
                    _value.add(true);
                  } else if (element.trim() == 'false') {
                    _value.add(false);
                  }
                }
              }
              break;

            case 'n':
              {
                for (var element in commaSplit) {
                  _value.add(num.parse(element.trim()));
                }
              }
              break;

            case 'd':
              {
                for (var element in commaSplit) {
                  _value.add(DateTime.parse(element.trim().split('').join())
                      .toString());
                }
              }
              break;

            default:
              {
                print('Invalid type descriptor');
              }
              break;
          }
        } else {
          for (var element in commaSplit) {
            _value.add(element.trim());
          }
        }
      } else {
        if (b) {
          switch (spaceSplit[i]) {
            case 'b':
              {
                _value = equalSplit[1].trim();
                if (_value == 'true') {
                  _value = true;
                } else if (_value == 'false') {
                  _value = false;
                }
              }
              break;

            case 'n':
              {
                _value = num.parse(equalSplit[1].trim());
              }
              break;

            case 'd':
              {
                _value = DateTime.parse(equalSplit[1].trim().split('').join())
                    .toString();
              }
              break;

            default:
              {
                print('Invalid type descriptor');
              }
              break;
          }
        } else {
          _value = equalSplit[1].trim();
        }
      }
    } else {
      if (input.contains('[')) {
        _name = input.substring(0, input.indexOf('['));
        _index = int.parse(input[input.indexOf('[') + 1]);
        _value = {};
      } else {
        _name = input.trim();
        _value = {};
      }
    }
  }
}
