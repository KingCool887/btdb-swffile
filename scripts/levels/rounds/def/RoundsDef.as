package levels.rounds.def
{
   import events.PropertyModEvent;
   import flash.events.EventDispatcher;
   
   public class RoundsDef extends EventDispatcher
   {
      
      private static var displayOrder:Vector.<String> = null;
      
      private var rounds_:Vector.<RoundDef> = null;
      
      public function RoundsDef()
      {
         super();
      }
      
      public static function getDisplayOrder() : Vector.<String>
      {
         if(displayOrder == null)
         {
            displayOrder = new Vector.<String>();
            displayOrder.push("rounds");
         }
         return displayOrder;
      }
      
      public function set rounds(param1:Vector.<RoundDef>) : void
      {
         if(this.rounds_ != param1)
         {
            this.rounds_ = param1;
            dispatchEvent(new PropertyModEvent("rounds"));
         }
      }
      
      public function get rounds() : Vector.<RoundDef>
      {
         return this.rounds_;
      }
      
      public function Rounds(param1:Vector.<RoundDef>) : RoundsDef
      {
         this.rounds = param1;
         return this;
      }
   }
}

