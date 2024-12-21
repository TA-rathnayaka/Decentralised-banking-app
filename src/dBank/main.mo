import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor dBank{
  stable var currentValue:Float = 300;
  stable var startTime = Time.now();
  Debug.print(debug_show(startTime));

  // Debug.print(debug_show(currentValue));
  // let id = 1232423;
  // Debug.print(debug_show(id));
  
  public func topUp(amount:Float){
   currentValue += amount;
   Debug.print(debug_show(currentValue));
  };
  public func withdraw(amount:Float){
    let tempValue: Float = currentValue - amount;
    if (tempValue>= 0){
    currentValue -= amount;
    Debug.print(debug_show(currentValue));}
    else{
      Debug.print("Amount is too large, current value is less than zero");
    }
  };
  public query func  checkBalance(): async Float  {
     return currentValue;
  };

  public func compound(){
    let currentTime = Time.now();
    let timeElapsed = (currentTime - startTime) / 1000000000;
    currentValue := currentValue * ((1.01) ** Float.fromInt((timeElapsed)));
    startTime := currentTime;
  };
  // topUp();
}