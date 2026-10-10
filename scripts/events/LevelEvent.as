package events
{
   import flash.events.Event;
   
   public class LevelEvent extends Event
   {
      
      public static const CASH_CHANGE:String = "cashChange";
      
      public static const HEALTH_CHANGE:String = "healthChange";
      
      public static const ROUND_OVER:String = "roundOver";
      
      public static const ROUND_START:String = "roundStart";
      
      public static const PATH_CHANGE:String = "pathChange";
      
      public static const RESERVES_CHANGED:String = "reservesChanged";
      
      public static const BLOON_LEAKED:String = "bloonLeaked";
      
      public function LevelEvent(param1:String)
      {
         super(param1);
      }
   }
}

