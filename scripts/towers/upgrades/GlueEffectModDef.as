package towers.upgrades
{
   import §>@§.§-A§;
   import §>@§.§<<§;
   import events.PropertyModEvent;
   import flash.events.EventDispatcher;
   
   public class GlueEffectModDef extends EventDispatcher
   {
      
      private static var displayOrder:Vector.<String> = null;
      
      private var soak_:Boolean = false;
      
      private var speedScale_:§<<§ = §-A§.§]H§();
      
      private var speedScaleAsScale_:Boolean = false;
      
      private var corosionInterval_:§<<§ = §-A§.§]H§();
      
      private var lifespan_:§<<§ = §-A§.§]H§();
      
      public function GlueEffectModDef()
      {
         super();
      }
      
      public static function getDisplayOrder() : Vector.<String>
      {
         if(displayOrder == null)
         {
            displayOrder = new Vector.<String>();
            displayOrder.push("soak","corosionInterval","lifespan");
         }
         return displayOrder;
      }
      
      public function set soak(param1:Boolean) : void
      {
         if(this.soak_ != param1)
         {
            this.soak_ = param1;
            dispatchEvent(new PropertyModEvent("soak"));
         }
      }
      
      public function get soak() : Boolean
      {
         return this.soak_;
      }
      
      public function Soak(param1:Boolean) : GlueEffectModDef
      {
         this.soak = param1;
         return this;
      }
      
      public function set speedScale(param1:Number) : void
      {
         if(this.speedScale_.value != param1)
         {
            this.speedScale_.value = param1;
            dispatchEvent(new PropertyModEvent("speedScale"));
         }
      }
      
      public function get speedScale() : Number
      {
         return this.speedScale_.value;
      }
      
      public function SpeedScale(param1:Number) : GlueEffectModDef
      {
         this.speedScale = param1;
         return this;
      }
      
      public function get speedScaleAsScale() : Boolean
      {
         return this.speedScaleAsScale_;
      }
      
      public function set speedScaleAsScale(param1:Boolean) : void
      {
         this.speedScaleAsScale_ = param1;
      }
      
      public function SpeedScaleAsScale(param1:Boolean) : GlueEffectModDef
      {
         this.speedScaleAsScale_ = param1;
         return this;
      }
      
      public function set corosionInterval(param1:Number) : void
      {
         if(this.corosionInterval_.value != param1)
         {
            this.corosionInterval_.value = param1;
            dispatchEvent(new PropertyModEvent("corosionInterval"));
         }
      }
      
      public function get corosionInterval() : Number
      {
         return this.corosionInterval_.value;
      }
      
      public function CorosionInterval(param1:Number) : GlueEffectModDef
      {
         this.corosionInterval = param1;
         return this;
      }
      
      public function set lifespan(param1:Number) : void
      {
         if(this.lifespan_.value != param1)
         {
            this.lifespan_.value = param1;
            dispatchEvent(new PropertyModEvent("lifespan"));
         }
      }
      
      public function get lifespan() : Number
      {
         return this.lifespan_.value;
      }
      
      public function Lifespan(param1:Number) : GlueEffectModDef
      {
         this.lifespan = param1;
         return this;
      }
   }
}

