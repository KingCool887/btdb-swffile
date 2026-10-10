package game
{
   import §>@§.§-A§;
   import §>@§.§<<§;
   
   public class Balance
   {
      
      public static var instance:Balance = new Balance();
      
      §-A§.§]H§();
      
      public var STARTING_ENERGY:§<<§ = §-A§.§]H§(50);
      
      public var ENERGY_COST_PER_GAME:§<<§ = §-A§.§]H§(5);
      
      public var ENERGY_COST_SPY:§<<§ = §-A§.§]H§(3);
      
      public var ENERGY_COST_EXTRA_TOWER:§<<§ = §-A§.§]H§(6);
      
      public var ENERGY_REGEN_TIME:§<<§ = §-A§.§]H§(720);
      
      public var MEDS_FOR_WIN:§<<§ = §-A§.§]H§(5);
      
      public var MEDS_FOR_LOSS:§<<§ = §-A§.§]H§(2);
      
      public var BATTLESCORE_FOR_WIN:§<<§ = §-A§.§]H§(10);
      
      public var BATTLESCORE_FOR_LOSS:§<<§ = §-A§.§]H§(2);
      
      public var SURRENDER_ROUND_REWARD:§<<§ = §-A§.§]H§(7);
      
      public var COST_MULTIPLIER_REGEN:§<<§ = §-A§.§]H§(1.8);
      
      public var COST_MULTIPLIER_CAMO:§<<§ = §-A§.§]H§(2.5);
      
      public var UNLOCK_ROUND_REGEN:§<<§ = §-A§.§]H§(6);
      
      public var UNLOCK_ROUND_CAMO:§<<§ = §-A§.§]H§(12);
      
      public var STARTING_CASH:§<<§ = §-A§.§]H§(650);
      
      public var STARTING_HEALTH:§<<§ = §-A§.§]H§(150);
      
      public var CASH_PER_TICK_MINIMUM:§<<§ = §-A§.§]H§(0);
      
      public var CASH_PER_TICK_STARTING:§<<§ = §-A§.§]H§(250);
      
      public var CASH_PER_TICK_STARTING_DEFEND:§<<§ = §-A§.§]H§(25);
      
      public var CASH_PER_TICK_MAXIMUM_DEFEND:§<<§ = §-A§.§]H§(3000);
      
      public var GIVE_CASH_TIME:§<<§ = §-A§.§]H§(6);
      
      public var FIRST_ROUND_START_TIME:§<<§ = §-A§.§]H§(6);
      
      public var ROUND_EXPIRY_TIME_BASE:§<<§ = §-A§.§]H§(8);
      
      public var ROUND_EXPIRY_TIME_MUL:§<<§ = §-A§.§]H§(1.5);
      
      public var PREMATCH_SCREEN_TIME:§<<§ = §-A§.§]H§(30);
      
      public var MAX_BLOON_QUE_SIZE:§<<§ = §-A§.§]H§(10);
      
      public var §%T§:§<<§ = §-A§.§]H§(0.2);
      
      public var §+;§:§<<§ = §-A§.§]H§(4);
      
      public function Balance()
      {
         super();
      }
      
      public function applyBalanceData(param1:String) : void
      {
         var _loc8_:String = null;
         var _loc9_:int = 0;
         var _loc10_:String = null;
         var _loc11_:* = undefined;
         var _loc12_:BloonSendDef = null;
         param1 = param1.replace(/ =/g,"=");
         param1 = param1.replace(/= /g,"=");
         var _loc2_:String = param1.substring(param1.indexOf("baseVals") + "baseVals".length,param1.indexOf("baseValsEnd"));
         var _loc3_:Array = _loc2_.split(";");
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_.length)
         {
            _loc8_ = _loc3_[_loc4_];
            _loc9_ = _loc8_.indexOf("=");
            _loc10_ = _loc8_.substring(0,_loc9_);
            _loc11_ = _loc8_.substring(_loc9_ + 1);
            if(_loc10_ != null && _loc10_ != "")
            {
               this[_loc10_].value = _loc11_;
            }
            _loc4_++;
         }
         §?V§.instance.§7?§.§6#§();
         var _loc5_:String = param1.substring(param1.indexOf("bloonSets") + "bloonSets".length,param1.indexOf("bloonSetsEnd"));
         var _loc6_:Array = _loc5_.split(",");
         var _loc7_:int = 0;
         while(_loc7_ < _loc6_.length)
         {
            _loc12_ = new BloonSendDef();
            _loc3_ = _loc6_[_loc7_].split(";");
            _loc4_ = 0;
            while(_loc4_ < _loc3_.length)
            {
               _loc8_ = _loc3_[_loc4_];
               _loc9_ = _loc8_.indexOf("=");
               _loc10_ = _loc8_.substring(0,_loc9_);
               _loc11_ = _loc8_.substring(_loc9_ + 1);
               if(_loc10_ != null && _loc10_ != "")
               {
                  _loc12_[_loc10_] = _loc11_;
               }
               _loc4_++;
            }
            §?V§.instance.§7?§.§4W§(_loc12_);
            _loc7_++;
         }
      }
   }
}

