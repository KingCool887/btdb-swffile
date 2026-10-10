package towers.upgrades
{
   import §>@§.§-A§;
   import §>@§.§<<§;
   import events.PropertyModEvent;
   import flash.events.EventDispatcher;
   
   public class IceEffectModDef extends EventDispatcher
   {
      
      private static var displayOrder:Vector.<String> = null;
      
      private var lifespan_:§<<§ = §-A§.§]H§();
      
      private var lifespanAsScale_:Boolean = false;
      
      private var permafrost_:§<<§ = §-A§.§]H§();
      
      private var freezeLayers_:§<<§ = §-A§.§]H§();
      
      public function IceEffectModDef()
      {
         super();
      }
      
      public static function getDisplayOrder() : Vector.<String>
      {
         if(displayOrder == null)
         {
            displayOrder = new Vector.<String>();
            displayOrder.push("lifespan","permafrost","freezeLayers");
         }
         return displayOrder;
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
      
      public function Lifespan(param1:Number) : IceEffectModDef
      {
         this.lifespan = param1;
         return this;
      }
      
      public function set lifespanAsScale(param1:Boolean) : void
      {
         if(this.lifespanAsScale_ != param1)
         {
            this.lifespanAsScale_ = param1;
            dispatchEvent(new PropertyModEvent("lifespanAsScale"));
         }
      }
      
      public function get lifespanAsScale() : Boolean
      {
         return this.lifespanAsScale_;
      }
      
      public function LifespanAsScale(param1:Boolean) : IceEffectModDef
      {
         this.lifespanAsScale = param1;
         return this;
      }
      
      public function set permafrost(param1:Number) : void
      {
         if(this.permafrost_.value != param1)
         {
            this.permafrost_.value = param1;
            dispatchEvent(new PropertyModEvent("permafrost"));
         }
      }
      
      public function get permafrost() : Number
      {
         return this.permafrost_.value;
      }
      
      public function Permafrost(param1:Number) : IceEffectModDef
      {
         this.permafrost = param1;
         return this;
      }
      
      public function set freezeLayers(param1:int) : void
      {
         if(this.freezeLayers_.value != param1)
         {
            this.freezeLayers_.value = param1;
            dispatchEvent(new PropertyModEvent("freezeLayers"));
         }
      }
      
      public function get freezeLayers() : int
      {
         return this.freezeLayers_.value;
      }
      
      public function FreezeLayers(param1:int) : IceEffectModDef
      {
         this.freezeLayers = param1;
         return this;
      }
   }
}

