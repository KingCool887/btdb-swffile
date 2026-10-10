package §>@§
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.TimerEvent;
   import flash.utils.ByteArray;
   import flash.utils.Timer;
   
   internal final class §5=§ implements §<<§
   {
      
      internal static const § H§:String = "braap braap";
      
      private static const § %§:int = 8;
      
      internal static const §;!§:EventDispatcher = new EventDispatcher();
      
      private static const §!6§:Array = [];
      
      private static const §&N§:Array = [];
      
      private static const §4H§:Array = [];
      
      private static const §'B§:Array = [];
      
      private static const §?>§:ByteArray = new ByteArray();
      
      private static const §4F§:ByteArray = new ByteArray();
      
      private static const §%7§:Timer = new Timer(100);
      
      §%7§.addEventListener(TimerEvent.TIMER,§&0§);
      §%7§.start();
      
      private var §-C§:Number = 0;
      
      private var §`K§:int = 0;
      
      private var scratchBytes1:ByteArray = new ByteArray();
      
      private var scratchBytes2:ByteArray = new ByteArray();
      
      public function §5=§(param1:Number = 0)
      {
         super();
         §#6§(this);
         this.value = param1;
      }
      
      private static function §&0§(param1:TimerEvent = null) : void
      {
         var _loc3_:§5=§ = null;
         var _loc4_:Number = NaN;
         var _loc5_:ByteArray = null;
         var _loc6_:int = 0;
         var _loc2_:Boolean = false;
         for each(_loc3_ in §!6§)
         {
            _loc4_ = Number(§&N§[_loc3_.§`K§]);
            if(_loc4_ != _loc3_.§-C§)
            {
               _loc2_ = true;
            }
            §?>§.position = 0;
            §4F§.position = 0;
            §?>§.writeDouble(§4H§[_loc3_.§`K§]);
            _loc5_ = §'B§[_loc3_.§`K§];
            _loc6_ = 0;
            while(_loc6_ < § %§)
            {
               §4F§[_loc6_] = §?>§[_loc6_] ^ _loc5_[_loc6_];
               _loc6_++;
            }
            if(_loc3_.§-C§ != §4F§.readDouble())
            {
               _loc2_ = true;
            }
            §4H§[_loc3_.§`K§] = _loc3_.§-C§;
            §&N§[_loc3_.§`K§] = _loc3_.§-C§;
            _loc5_.position = 0;
            _loc5_.writeDouble(0);
            if(--_loc3_.§`K§ < 0)
            {
               _loc3_.§`K§ = §!6§.length - 1;
            }
         }
         §&N§.push(§&N§.shift());
         §4H§.push(§4H§.shift());
         §'B§.push(§'B§.shift());
         if(_loc2_)
         {
            §;!§.dispatchEvent(new Event(§ H§));
         }
      }
      
      private static function §#6§(param1:§5=§) : void
      {
         var _loc2_:int = int(§!6§.length);
         param1.§`K§ = _loc2_;
         §!6§[_loc2_] = param1;
         §&N§[_loc2_] = param1.§-C§;
         §4H§[_loc2_] = param1.§-C§;
         §'B§[_loc2_] = new ByteArray();
         ByteArray(§'B§[_loc2_]).length = § %§;
      }
      
      public function get value() : Number
      {
         return this.§-C§;
      }
      
      public function set value(param1:Number) : void
      {
         var _loc2_:Number = Number(§4H§[this.§`K§]);
         this.§[%§(_loc2_,param1,§'B§[this.§`K§]);
         this.§-C§ = param1;
         §&N§[this.§`K§] = param1;
      }
      
      private function §[%§(param1:Number, param2:Number, param3:ByteArray) : void
      {
         this.scratchBytes1.position = 0;
         this.scratchBytes2.position = 0;
         this.scratchBytes1.writeDouble(param1);
         this.scratchBytes2.writeDouble(param2);
         var _loc4_:int = 0;
         while(_loc4_ < § %§)
         {
            param3[_loc4_] = this.scratchBytes1[_loc4_] ^ this.scratchBytes2[_loc4_];
            _loc4_++;
         }
      }
   }
}

