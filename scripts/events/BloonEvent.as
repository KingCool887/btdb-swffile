package events
{
   import bloons.Bloon;
   import flash.events.Event;
   
   public class BloonEvent extends Event
   {
      
      public static const POP:String = "pop";
      
      public static const REMOVE:String = "remove";
      
      public static const ADD:String = "add";
      
      public static const ATTACK:String = "attack";
      
      public var bloon:Bloon;
      
      public var layers:int;
      
      public function BloonEvent(param1:String, param2:Bloon, param3:int = 1)
      {
         super(param1);
         this.bloon = param2;
         this.layers = param3;
      }
   }
}

