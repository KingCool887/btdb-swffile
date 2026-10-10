package towers.upgrades
{
   import §>@§.§-A§;
   import §>@§.§<<§;
   import events.PropertyModEvent;
   import flash.events.EventDispatcher;
   
   public class BananaModDef extends EventDispatcher
   {
      
      private static var displayOrder:Vector.<String> = null;
      
      private var cashPerRound_:§<<§ = §-A§.§]H§();
      
      private var cashPerPacket_:§<<§ = §-A§.§]H§();
      
      private var lifespan_:§<<§ = §-A§.§]H§();
      
      private var cashScale_:§<<§ = §-A§.§]H§();
      
      public function BananaModDef()
      {
         super();
      }
      
      public static function getDisplayOrder() : Vector.<String>
      {
         if(displayOrder == null)
         {
            displayOrder = new Vector.<String>();
            displayOrder.push("cashPerRound","cashPerPacket","lifespan","cashScale");
         }
         return displayOrder;
      }
      
      public function set cashPerRound(param1:int) : void
      {
         if(this.cashPerRound_.value != param1)
         {
            this.cashPerRound_.value = param1;
            dispatchEvent(new PropertyModEvent("cashPerRound"));
         }
      }
      
      public function get cashPerRound() : int
      {
         return this.cashPerRound_.value;
      }
      
      public function CashPerRound(param1:int) : BananaModDef
      {
         this.cashPerRound = param1;
         return this;
      }
      
      public function set cashPerPacket(param1:int) : void
      {
         if(this.cashPerPacket_.value != param1)
         {
            this.cashPerPacket_.value = param1;
            dispatchEvent(new PropertyModEvent("cashPerPacket"));
         }
      }
      
      public function get cashPerPacket() : int
      {
         return this.cashPerPacket_.value;
      }
      
      public function CashPerPacket(param1:int) : BananaModDef
      {
         this.cashPerPacket = param1;
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
      
      public function Lifespan(param1:Number) : BananaModDef
      {
         this.lifespan = param1;
         return this;
      }
      
      public function set cashScale(param1:Number) : void
      {
         if(this.cashScale_.value != param1)
         {
            this.cashScale_.value = param1;
            dispatchEvent(new PropertyModEvent("cashScale"));
         }
      }
      
      public function get cashScale() : Number
      {
         return this.cashScale_.value;
      }
      
      public function CashScale(param1:Number) : BananaModDef
      {
         this.cashScale = param1;
         return this;
      }
   }
}

