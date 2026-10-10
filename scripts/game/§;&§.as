package game
{
   import §>@§.§-A§;
   import §>@§.§<<§;
   
   public class §;&§
   {
      
      private var §]D§:§<<§ = §-A§.§]H§();
      
      private var §"R§:§<<§ = §-A§.§]H§();
      
      public var hotkey:String = "0";
      
      public var name:String = "rah";
      
      private var §,$§:§<<§ = §-A§.§]H§();
      
      public var cooldownTimer:Number = 0;
      
      public function §;&§()
      {
         super();
      }
      
      public function Cost(param1:Number) : §;&§
      {
         this.§]D§.value = param1;
         return this;
      }
      
      public function §!Q§(param1:Number) : §;&§
      {
         this.§"R§.value = param1;
         return this;
      }
      
      public function Hotkey(param1:String) : §;&§
      {
         this.hotkey = param1;
         return this;
      }
      
      public function Name(param1:String) : §;&§
      {
         this.name = param1;
         return this;
      }
      
      public function Cooldown(param1:Number) : §;&§
      {
         this.§,$§.value = param1;
         return this;
      }
      
      public function get cooldown() : Number
      {
         return this.§,$§.value;
      }
      
      public function get incomeBoost() : Number
      {
         return this.§"R§.value;
      }
      
      public function get cost() : Number
      {
         return this.§]D§.value;
      }
   }
}

