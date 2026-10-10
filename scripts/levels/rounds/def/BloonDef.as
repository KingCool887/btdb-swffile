package levels.rounds.def
{
   import events.PropertyModEvent;
   import flash.events.EventDispatcher;
   
   public class BloonDef extends EventDispatcher
   {
      
      private static var displayOrder:Vector.<String> = null;
      
      private var type_:int = 0;
      
      private var camo_:Boolean = false;
      
      private var regen_:Boolean = false;
      
      public function BloonDef()
      {
         super();
      }
      
      public static function getDisplayOrder() : Vector.<String>
      {
         if(displayOrder == null)
         {
            displayOrder = new Vector.<String>();
            displayOrder.push("type","camo","regen");
         }
         return displayOrder;
      }
      
      public function set type(param1:int) : void
      {
         if(this.type_ != param1)
         {
            this.type_ = param1;
            dispatchEvent(new PropertyModEvent("type"));
         }
      }
      
      public function get type() : int
      {
         return this.type_;
      }
      
      public function Type(param1:int) : BloonDef
      {
         this.type = param1;
         return this;
      }
      
      public function set camo(param1:Boolean) : void
      {
         if(this.camo_ != param1)
         {
            this.camo_ = param1;
            dispatchEvent(new PropertyModEvent("camo"));
         }
      }
      
      public function get camo() : Boolean
      {
         return this.camo_;
      }
      
      public function Camo(param1:Boolean) : BloonDef
      {
         this.camo = param1;
         return this;
      }
      
      public function set regen(param1:Boolean) : void
      {
         if(this.regen_ != param1)
         {
            this.regen_ = param1;
            dispatchEvent(new PropertyModEvent("regen"));
         }
      }
      
      public function get regen() : Boolean
      {
         return this.regen_;
      }
      
      public function Regen(param1:Boolean) : BloonDef
      {
         this.regen = param1;
         return this;
      }
   }
}

