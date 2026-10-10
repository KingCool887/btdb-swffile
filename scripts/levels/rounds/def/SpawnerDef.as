package levels.rounds.def
{
   import events.PropertyModEvent;
   import flash.events.EventDispatcher;
   
   public class SpawnerDef extends EventDispatcher
   {
      
      private static var displayOrder:Vector.<String> = null;
      
      private var start_:Number = 0;
      
      private var length_:Number = 0;
      
      private var count_:int = 1;
      
      public function SpawnerDef()
      {
         super();
      }
      
      public static function getDisplayOrder() : Vector.<String>
      {
         if(displayOrder == null)
         {
            displayOrder = new Vector.<String>();
            displayOrder.push("start","length","count");
         }
         return displayOrder;
      }
      
      public function set start(param1:Number) : void
      {
         if(this.start_ != param1)
         {
            this.start_ = param1;
            dispatchEvent(new PropertyModEvent("start"));
         }
      }
      
      public function get start() : Number
      {
         return this.start_;
      }
      
      public function Start(param1:Number) : SpawnerDef
      {
         this.start = param1;
         return this;
      }
      
      public function set length(param1:Number) : void
      {
         if(this.length_ != param1)
         {
            this.length_ = param1;
            dispatchEvent(new PropertyModEvent("length"));
         }
      }
      
      public function get length() : Number
      {
         return this.length_;
      }
      
      public function Length(param1:Number) : SpawnerDef
      {
         this.length = param1;
         return this;
      }
      
      public function set count(param1:int) : void
      {
         if(this.count_ != param1)
         {
            this.count_ = param1;
            dispatchEvent(new PropertyModEvent("count"));
         }
      }
      
      public function get count() : int
      {
         return this.count_;
      }
      
      public function Count(param1:int) : SpawnerDef
      {
         this.count = param1;
         return this;
      }
   }
}

