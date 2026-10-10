package towers.upgrades
{
   import events.PropertyModEvent;
   import flash.events.EventDispatcher;
   
   public class BloonchipperStoreModDef extends EventDispatcher
   {
      
      private var chipTime_:Number = 0;
      
      public function BloonchipperStoreModDef()
      {
         super();
      }
      
      public function set chipTime(param1:Number) : void
      {
         if(this.chipTime_ != param1)
         {
            this.chipTime_ = param1;
            dispatchEvent(new PropertyModEvent("chipTime"));
         }
      }
      
      public function get chipTime() : Number
      {
         return this.chipTime_;
      }
      
      public function ChipTime(param1:Number) : BloonchipperStoreModDef
      {
         this.chipTime = param1;
         return this;
      }
   }
}

