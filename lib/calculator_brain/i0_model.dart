class IOModel{

  String input = "0";
  String output = "";

  resetInput(){
    input = "0";
  }

  resetOutput(){
    output = "";
  }

  resetAll(){
    input = "0";
    output = "";
  }

  removeLastFromInput(){
    input = input.substring(0,input.length-2);
  }
}