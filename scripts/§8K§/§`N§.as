package §8K§
{
   import events.LevelEvent;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.ui.Keyboard;
   import flash.utils.Dictionary;
   import game.§6$§;
   import game.§;&§;
   import game.Balance;
   
   public class §`N§
   {
      
      public static var §36§:Dictionary = new Dictionary();
      
      §36§["1"] = Keyboard.NUMBER_1;
      §36§["2"] = Keyboard.NUMBER_2;
      §36§["3"] = Keyboard.NUMBER_3;
      §36§["4"] = Keyboard.NUMBER_4;
      
      private var §"0§:§6$§;
      
      private var §[$§:MovieClip;
      
      private var §%D§:Vector.<IncomeBoostBtn>;
      
      private var §;V§:Boolean = false;
      
      public function §`N§()
      {
         super();
      }
      
      public function §,B§(param1:MovieClip) : void
      {
         this.§[$§ = param1;
         this.§"0§ = §?V§.instance.§"0§;
         this.§6C§();
      }
      
      private function §6C§() : void
      {
         var _loc3_:§;&§ = null;
         this.§%D§ = new Vector.<IncomeBoostBtn>();
         var _loc1_:int = 0;
         while(_loc1_ < this.§[$§.numChildren)
         {
            if(this.§[$§.getChildAt(_loc1_) is IncomeBoostBtn)
            {
               this.§%D§.push(this.§[$§.getChildAt(_loc1_));
            }
            _loc1_++;
         }
         var _loc2_:int = 0;
         while(_loc2_ < §?V§.instance.§+J§.§ 5§.length)
         {
            _loc3_ = §?V§.instance.§+J§.§ 5§[_loc2_];
            this.§%D§[_loc2_].cost.text = "$" + _loc3_.cost.toString();
            this.§%D§[_loc2_].incomeBoost.text = "+" + _loc3_.incomeBoost.toString();
            this.§%D§[_loc2_].extra = _loc3_;
            this.§%D§[_loc2_].click = this.§#Q§;
            this.§%D§[_loc2_].tooltip = "<font color=\'#E0CDB6\' face=\'Oetztype\'>" + _loc3_.name + "\n$" + _loc3_.cost + "</font>\nSpend $" + _loc3_.cost + " to boost your income change by +$" + _loc3_.incomeBoost + ".";
            _loc2_++;
         }
      }
      
      public function §3I§() : void
      {
         this.§;V§ = false;
         var _loc1_:int = 0;
         while(_loc1_ < this.§%D§.length)
         {
            this.§%D§[_loc1_].extra.cooldownTimer = 0;
            this.§%D§[_loc1_].cooldown_mc.gotoAndStop(94);
            _loc1_++;
         }
         this.§97§(null);
         this.§"0§.§-W§.addEventListener(LevelEvent.CASH_CHANGE,this.§97§);
         §?V§.instance.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.§;§);
      }
      
      public function §<E§() : void
      {
         this.§"0§.§-W§.removeEventListener(LevelEvent.CASH_CHANGE,this.§97§);
         §?V§.instance.stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.§;§);
      }
      
      public function process(param1:Number) : void
      {
         var _loc4_:Number = NaN;
         var _loc2_:Boolean = false;
         var _loc3_:int = 0;
         while(_loc3_ < this.§%D§.length)
         {
            if(this.§%D§[_loc3_].extra.cooldownTimer > 0)
            {
               this.§%D§[_loc3_].extra.cooldownTimer -= param1;
               _loc4_ = this.§%D§[_loc3_].extra.cooldownTimer / this.§%D§[_loc3_].extra.cooldown;
               if(_loc4_ < 0)
               {
                  _loc4_ = 0;
               }
               _loc4_ = 1 - _loc4_;
               this.§%D§[_loc3_].cooldown_mc.gotoAndStop(int(94 * _loc4_));
               if(this.§%D§[_loc3_].extra.cooldownTimer <= 0)
               {
                  _loc2_ = true;
               }
            }
            _loc3_++;
         }
         if(_loc2_)
         {
            this.§97§(null);
         }
      }
      
      private function §97§(param1:LevelEvent) : void
      {
         var _loc2_:int = this.§"0§.§-W§.cash.value;
         var _loc3_:int = 0;
         while(_loc3_ < this.§%D§.length)
         {
            if(this.§;V§)
            {
               this.§%D§[_loc3_].valid = false;
            }
            else if(this.§%D§[_loc3_].extra.cooldownTimer > 0)
            {
               this.§%D§[_loc3_].valid = false;
            }
            else if(this.§%D§[_loc3_].extra.cost > _loc2_)
            {
               this.§%D§[_loc3_].valid = false;
            }
            else
            {
               this.§%D§[_loc3_].valid = true;
            }
            _loc3_++;
         }
      }
      
      private function §#Q§(param1:Event) : void
      {
         this.§"5§(IncomeBoostBtn(param1.target));
      }
      
      private function §"5§(param1:IncomeBoostBtn) : void
      {
         var _loc3_:Number = NaN;
         var _loc2_:§;&§ = §;&§(param1.extra);
         if(this.§"0§.§-W§.§7F§(_loc2_.cost) && _loc2_.cooldownTimer <= 0)
         {
            _loc2_.cooldownTimer = _loc2_.cooldown;
            this.§"0§.§-W§.§]3§(_loc2_.cost);
            _loc3_ = _loc2_.incomeBoost;
            if(this.§"0§.§-W§.§3V§ > 0)
            {
               _loc3_ *= 1 + Balance.instance.§%T§.value;
            }
            if(this.§"0§.§#3§.value + _loc3_ > Balance.instance.CASH_PER_TICK_MAXIMUM_DEFEND.value)
            {
               this.§"0§.§#3§.value = Balance.instance.CASH_PER_TICK_MAXIMUM_DEFEND.value;
               this.§;V§ = true;
               this.§97§(null);
            }
            else
            {
               this.§"0§.§0<§(_loc3_);
            }
         }
      }
      
      private function §;§(param1:KeyboardEvent) : void
      {
         var _loc3_:IncomeBoostBtn = null;
         var _loc4_:§;&§ = null;
         var _loc5_:int = 0;
         if(§?V§.instance.§"0§.§ 2§.§7>§.§>F§)
         {
            return;
         }
         var _loc2_:int = 0;
         while(_loc2_ < this.§%D§.length)
         {
            _loc3_ = this.§%D§[_loc2_];
            _loc4_ = §;&§(_loc3_.extra);
            if(_loc3_.valid == true)
            {
               _loc5_ = int(§36§[_loc4_.hotkey]);
               if(param1.keyCode == _loc5_)
               {
                  this.§"5§(_loc3_);
                  break;
               }
            }
            _loc2_++;
         }
      }
      
      public function set x(param1:Number) : void
      {
         this.§[$§.x = param1;
      }
      
      public function set visible(param1:Boolean) : void
      {
         this.§[$§.visible = param1;
      }
   }
}

