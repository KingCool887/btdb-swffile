package game
{
   import §>@§.§-A§;
   import §>@§.§<<§;
   
   public class BloonSendDef
   {
      
      public var id:String = null;
      
      public var type:int = 0;
      
      public var name:String = "";
      
      public var hotkey:String = "";
      
      private var §0!§:§<<§ = §-A§.§]H§();
      
      private var §;C§:§<<§ = §-A§.§]H§();
      
      private var cost_:§<<§ = §-A§.§]H§();
      
      private var §+V§:§<<§ = §-A§.§]H§();
      
      private var §^#§:§<<§ = §-A§.§]H§();
      
      public var thumbStandard:Class = null;
      
      public var thumbCamo:Class = null;
      
      public var thumbRegen:Class = null;
      
      public var thumbRegenCamo:Class = null;
      
      public function BloonSendDef()
      {
         super();
      }
      
      public function ID(param1:String) : BloonSendDef
      {
         this.id = param1;
         return this;
      }
      
      public function Type(param1:int) : BloonSendDef
      {
         this.type = param1;
         return this;
      }
      
      public function Name(param1:String) : BloonSendDef
      {
         this.name = param1;
         return this;
      }
      
      public function Hotkey(param1:String) : BloonSendDef
      {
         this.hotkey = param1;
         return this;
      }
      
      public function Quantity(param1:int) : BloonSendDef
      {
         this.quantity = param1;
         return this;
      }
      
      public function Interval(param1:Number) : BloonSendDef
      {
         this.interval = param1;
         return this;
      }
      
      public function Cost(param1:int) : BloonSendDef
      {
         this.cost = param1;
         return this;
      }
      
      public function IncomeChange(param1:Number) : BloonSendDef
      {
         this.incomeChange = param1;
         return this;
      }
      
      public function UnlockRound(param1:int) : BloonSendDef
      {
         this.unlockRound = param1;
         return this;
      }
      
      public function ThumbStandard(param1:Class) : BloonSendDef
      {
         this.thumbStandard = param1;
         return this;
      }
      
      public function ThumbCamo(param1:Class) : BloonSendDef
      {
         this.thumbCamo = param1;
         return this;
      }
      
      public function ThumbRegen(param1:Class) : BloonSendDef
      {
         this.thumbRegen = param1;
         return this;
      }
      
      public function ThumbRegenCamo(param1:Class) : BloonSendDef
      {
         this.thumbRegenCamo = param1;
         return this;
      }
      
      public function get quantity() : int
      {
         return this.§0!§.value;
      }
      
      public function set quantity(param1:int) : void
      {
         this.§0!§.value = param1;
      }
      
      public function get interval() : Number
      {
         return this.§;C§.value;
      }
      
      public function set interval(param1:Number) : void
      {
         this.§;C§.value = param1;
      }
      
      public function get cost() : Number
      {
         return this.cost_.value;
      }
      
      public function set cost(param1:Number) : void
      {
         this.cost_.value = param1;
      }
      
      public function get incomeChange() : Number
      {
         return this.§+V§.value;
      }
      
      public function set incomeChange(param1:Number) : void
      {
         this.§+V§.value = param1;
      }
      
      public function get unlockRound() : int
      {
         return this.§^#§.value;
      }
      
      public function set unlockRound(param1:int) : void
      {
         this.§^#§.value = param1;
      }
   }
}

