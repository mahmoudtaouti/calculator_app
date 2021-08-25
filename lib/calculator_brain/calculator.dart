import 'dart:collection';
import 'dart:core';


var digits = <String>['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
var operators = <String>['+', '-', 'x', '/', '%', '.'];
var leftBracket = '(';
var rightBracket = ')';

class Calculator {
  const Calculator();

  num _eval(num n2, num n1, String operator) {
    switch (operator) {
      case '+':
        return n1 + n2;
      case '-':
        return n1 - n2;
      case 'x':
        return n1 * n2;
      case '/':
        return n1 / n2;
      case '%':
        return n1 * n2 / 100;
      case '.':
        String sn1 = n1.toString();
        String sn2 = n2.toString();
        return double.tryParse(sn1 + '.' + sn2);
      default:
        return 0;
    }
  }

  int _getPriority(String _operator) {
    switch (_operator) {
      case '+':
      case '-':
        return 0;
      case 'x':
      case '/':
      case '%':
        return 1;
      case '.':
        return 2;
      default:
        return -1;
    }
  }

  bool isLeftBracket(String op) {
    return op == leftBracket;
  }

  bool isRightBracket(String op) {
    return op == rightBracket;
  }

  bool isOperator(String op) {
    return operators.contains(op);
  }

  bool isDigit(String op) {
    return digits.contains(op);
  }

  num calculate(String expr) {
    Queue<String> operators = new ListQueue<String>();
    Queue<num> operands = new ListQueue<num>();

    //True if the last character was a digit
    //to accept numbers with more digits
    bool lastDig = true;

    // INIT
    operands.addLast(0);

    expr.split('').forEach((String c) {
      if (isDigit(c)) {
        if (lastDig) {
          num last = operands.removeLast();
          operands.addLast(last * 10 + int.parse(c));
        } else
          operands.addLast(int.parse(c));
      } else if (isOperator(c)) {
        if (!lastDig) throw new ArgumentError('Illegal expression');

        if (operators.isEmpty)
          operators.addLast(c);
        else {
          while (operators.isNotEmpty &&
              operands.isNotEmpty &&
              _getPriority(c) <= _getPriority(operators.last)) {
            num op1 = operands.removeLast();
            num op2 = operands.removeLast();
            String op = operators.removeLast();

            // op1 and op2 not in reverse order!
            num res = _eval(op1, op2, op);
            operands.addLast(res);
          }
          operators.addLast(c);
        }
      }
      lastDig = isDigit(c);
    });

    while (operators.isNotEmpty) {
      num op1 = operands.removeLast();
      num op2 = operands.removeLast();
      String op = operators.removeLast();

      // op1 and op2 in reverse order!
      num res = _eval(op1, op2, op);
      operands.addLast(res);
    }

    return operands.removeLast();
  }


  // check if brackets is correctly formed
  // before calculateWithBrackets called
  bool bracketChecker(String input){
    Queue<String> brackets = ListQueue<String>();
    List<String> charSet = input.split('');
    for(String c in charSet){
      if (isLeftBracket(c)) {
        brackets.addLast(c);
        continue;
      }
      if (isRightBracket(c)) {
        if (brackets.isEmpty) {
          return false;
        }
        if (isLeftBracket(brackets.last) && isRightBracket(c)) {
          brackets.removeLast();
          continue;
        }
        return false;
      }
    }
    return brackets.isEmpty;
  }


  /// recursive function to calculate expressions with brackets
  String calculateWithBrackets(String inPut){
    String string = inPut;
    final int starter = 0;
    for(int i = starter; i< string.length; i++){
      if (isRightBracket(string[i])) {
        int k = i;
        while(k > 0 && !isLeftBracket(string[k])) {
          k -= 1;
        }
        String expression = '';
        int p = k + 1;
        while(p < i){
          expression = expression + string[p];
          p++;
        }
        num temp = calculate(expression);
        string = string.replaceRange(k, i+1, temp.toString());
        i = starter ;
      }
    }

    //return result if complete else recalculate
    //ex: ( calculate(7*5) ) -1 => calculate(35-1) => 34
    num result = num.tryParse(string);
    if (result != null) {
      return result.toString();
    } else{
    return calculate(string).toString();
    }
  }

}
