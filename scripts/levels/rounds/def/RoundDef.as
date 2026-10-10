package levels.rounds.def
{
   import events.PropertyModEvent;
   import flash.events.EventDispatcher;
   
   public class RoundDef extends EventDispatcher
   {
      
      private static var displayOrder:Vector.<String> = null;
      
      private var flavorText_:String = null;
      
      private var groups_:Vector.<GroupDef> = null;
      
      public function RoundDef()
      {
         super();
      }
      
      public static function getDisplayOrder() : Vector.<String>
      {
         if(displayOrder == null)
         {
            displayOrder = new Vector.<String>();
            displayOrder.push("groups");
         }
         return displayOrder;
      }
      
      public function set groups(param1:Vector.<GroupDef>) : void
      {
         if(this.groups_ != param1)
         {
            this.groups_ = param1;
            dispatchEvent(new PropertyModEvent("groups"));
         }
      }
      
      public function get groups() : Vector.<GroupDef>
      {
         return this.groups_;
      }
      
      public function Groups(param1:Vector.<GroupDef>) : RoundDef
      {
         this.groups = param1;
         return this;
      }
      
      public function set flavorText(param1:String) : void
      {
         if(this.flavorText_ != param1)
         {
            this.flavorText_ = param1;
            dispatchEvent(new PropertyModEvent("flavorText"));
         }
      }
      
      public function get flavorText() : String
      {
         return this.flavorText_;
      }
      
      public function FlavorText(param1:String) : RoundDef
      {
         this.flavorText_ = param1;
         return this;
      }
   }
}

