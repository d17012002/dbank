import Debug "mo:base/Debug"; // import the debug library from the motoko base librarires
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank{
  stable var currentValue: Float = 500; // declare variable with value 10000
  currentValue := 100; // to replace the value :=

  stable var startTime = Time.now();
  startTime := Time.now();

  Debug.print("Kind of similar to console log"); // to display text
  Debug.print(debug_show(currentValue)); // to print any value

  // function in motoko
  public func topUp(amount: Float){  // argument amount datatype: nat(natural number)
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };

  public func withdraw(amount: Float){
    if (amount < currentValue){
      currentValue -= amount;
      Debug.print(debug_show(currentValue)); 
    }else{
      Debug.print("Insufficient balance")
    }
  };

  public query func checkBalance(): async Float {
    Debug.print(debug_show(currentValue)); 
    return currentValue;  
  };

  public func compound(){
    let currentTime = Time.now();
    let timeElapsedNS = currentTime - startTime;
    let timeElapsedS = timeElapsedNS/1000000000;
    let timeElapsedH = timeElapsedS/3600;
    currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsedH));
    startTime := currentTime;
    Debug.print(debug_show(currentValue));
  }

};
