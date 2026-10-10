package levels.rounds.def
{
   import events.PropertyModEvent;
   import flash.events.EventDispatcher;
   
   public class GroupDef extends EventDispatcher
   {
      
      private static var displayOrder:Vector.<String> = null;
      
      private var bloon_:BloonDef = null;
      
      private var spawners_:Vector.<SpawnerDef> = null;
      
      public function GroupDef()
      {
         super();
      }
      
      public static function getDisplayOrder() : Vector.<String>
      {
         if(displayOrder == null)
         {
            displayOrder = new Vector.<String>();
            displayOrder.push("bloon","spawners");
         }
         return displayOrder;
      }
      
      public function set bloon(param1:BloonDef) : void
      {
         if(this.bloon_ != param1)
         {
            this.bloon_ = param1;
            dispatchEvent(new PropertyModEvent("bloon"));
         }
      }
      
      public function get bloon() : BloonDef
      {
         return this.bloon_;
      }
      
      public function Bloon(param1:BloonDef) : GroupDef
      {
         this.bloon = param1;
         return this;
      }
      
      public function set spawners(param1:Vector.<SpawnerDef>) : void
      {
         if(this.spawners_ != param1)
         {
            this.spawners_ = param1;
            dispatchEvent(new PropertyModEvent("spawners"));
         }
      }
      
      public function get spawners() : Vector.<SpawnerDef>
      {
         return this.spawners_;
      }
      
      public function Spawners(param1:Vector.<SpawnerDef>) : GroupDef
      {
         this.spawners = param1;
         return this;
      }
   }
}

