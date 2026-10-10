package §8K§
{
   import §>@§.§-A§;
   import §>@§.§<<§;
   import assets.gui.BloonSendButton;
   import display.ui.CheckButton;
   import events.LevelEvent;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.ui.Keyboard;
   import flash.utils.Dictionary;
   import game.§-3§;
   import game.§6$§;
   import game.§9;§;
   import game.Balance;
   import game.BloonSendDef;
   
   public class §#G§
   {
      
      public static var §36§:Dictionary = new Dictionary();
      
      §36§["1"] = Keyboard.NUMBER_1;
      §36§["2"] = Keyboard.NUMBER_2;
      §36§["3"] = Keyboard.NUMBER_3;
      §36§["4"] = Keyboard.NUMBER_4;
      §36§["5"] = Keyboard.NUMBER_5;
      §36§["6"] = Keyboard.NUMBER_6;
      §36§["7"] = Keyboard.NUMBER_7;
      §36§["8"] = Keyboard.NUMBER_8;
      §36§["9"] = Keyboard.NUMBER_9;
      §36§["0"] = Keyboard.NUMBER_0;
      §36§["U"] = Keyboard.U;
      §36§["u"] = Keyboard.U;
      §36§["I"] = Keyboard.I;
      §36§["i"] = Keyboard.I;
      §36§["O"] = Keyboard.O;
      §36§["o"] = Keyboard.O;
      §36§["P"] = Keyboard.P;
      §36§["p"] = Keyboard.P;
      
      private var §"0§:§6$§;
      
      private var §!P§:MovieClip;
      
      private var §'&§:MovieClip;
      
      private var bloonMask:MovieClip = null;
      
      private var camoChk:CheckButton = null;
      
      private var regenChk:CheckButton = null;
      
      private var §09§:Number = 0;
      
      private var §7?§:§9;§ = null;
      
      private var §1@§:Vector.<BloonSendButton>;
      
      private var §#4§:§<<§ = §-A§.§]H§(1);
      
      private var §4#§:Boolean = false;
      
      public function §#G§()
      {
         super();
      }
      
      public function §,B§(param1:MovieClip) : void
      {
         this.§!P§ = param1;
         this.§"0§ = §?V§.instance.§"0§;
         this.bloonMask = this.§!P§.bloonMask;
         this.camoChk = this.§!P§.camoChk;
         this.regenChk = this.§!P§.regenChk;
         this.camoChk.click = this.§`M§;
         this.regenChk.click = this.§^M§;
         this.§'&§ = new MovieClip();
         this.§'&§.x = this.§!P§.bloonMask.x;
         this.§'&§.y = this.§!P§.bloonMask.y;
         this.§!P§.addChild(this.§'&§);
         this.§'&§.mask = this.bloonMask;
         this.§!P§.upBtn.click = this.§[V§;
         this.§!P§.downBtn.click = this.§73§;
      }
      
      private function §6R§() : void
      {
         var _loc2_:BloonSendDef = null;
         var _loc3_:BloonSendButton = null;
         this.§7?§ = §?V§.instance.§7?§;
         while(this.§'&§.numChildren > 0)
         {
            this.§'&§.removeChildAt(0);
         }
         this.§1@§ = new Vector.<BloonSendButton>();
         var _loc1_:int = 0;
         while(_loc1_ < this.§7?§.§+M§.length)
         {
            _loc2_ = this.§7?§.§+M§[_loc1_];
            _loc3_ = new BloonSendButton();
            _loc3_.holder_mc.addChild(new _loc2_.thumbStandard());
            _loc3_.qty_txt.text = "x" + _loc2_.quantity.toString();
            _loc3_.y = _loc1_ % 2 * 36;
            _loc3_.x = int(_loc1_ / 2) * 36;
            var _temp_1:* = _loc3_;
            _loc3_.scaleY = 0.75;
            _temp_1.scaleX = 0.75;
            _loc3_.extra = _loc2_;
            _loc3_.click = this.§>D§;
            _loc3_.valid = false;
            this.§5#§(_loc3_);
            this.§1@§.push(_loc3_);
            this.§'&§.addChild(_loc3_);
            _loc1_++;
         }
      }
      
      public function §3I§() : void
      {
         this.§4#§ = false;
         this.§#4§.value = 1;
         this.§6R§();
         this.§#=§();
         this.§7N§();
         this.§-E§(null);
         this.§"0§.§-W§.addEventListener(LevelEvent.CASH_CHANGE,this.§13§);
         this.§"0§.§-W§.§%B§.add(this.§2@§);
         this.§"0§.addEventListener(LevelEvent.ROUND_START,this.§-E§);
         §?V§.instance.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.§;§);
         this.§'&§.addEventListener(Event.ENTER_FRAME,this.§06§);
         this.§'&§.x = this.bloonMask.x;
         this.§09§ = this.bloonMask.x;
         this.§"0§.§9@§.§`9§.add(this.§'W§);
         this.§"0§.§9@§.§83§.add(this.§'W§);
      }
      
      public function §<E§() : void
      {
         this.§"0§.§-W§.removeEventListener(LevelEvent.CASH_CHANGE,this.§13§);
         this.§"0§.§-W§.§%B§.remove(this.§2@§);
         this.§"0§.removeEventListener(LevelEvent.ROUND_START,this.§-E§);
         §?V§.instance.stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.§;§);
         this.§'&§.removeEventListener(Event.ENTER_FRAME,this.§06§);
         this.§"0§.§9@§.§`9§.remove(this.§'W§);
         this.§"0§.§9@§.§83§.remove(this.§'W§);
      }
      
      private function §<=§(param1:BloonSendDef) : Number
      {
         return param1.cost * this.§#4§.value;
      }
      
      private function §13§(param1:LevelEvent) : void
      {
         var _loc4_:BloonSendButton = null;
         var _loc5_:BloonSendDef = null;
         var _loc2_:int = this.§"0§.§-W§.cash.value;
         var _loc3_:int = 0;
         while(_loc3_ < this.§1@§.length)
         {
            _loc4_ = this.§1@§[_loc3_];
            _loc5_ = this.§7?§.§+M§[_loc3_];
            if(this.§4#§ || _loc5_.unlockRound > this.§"0§.§+O§ + 1 || this.§<=§(_loc5_) > _loc2_)
            {
               _loc4_.valid = false;
            }
            else
            {
               _loc4_.valid = true;
            }
            _loc3_++;
         }
      }
      
      private function §-E§(param1:LevelEvent) : void
      {
         var _loc4_:BloonSendButton = null;
         var _loc5_:BloonSendDef = null;
         var _loc2_:int = this.§"0§.§-W§.cash.value;
         var _loc3_:int = 0;
         while(_loc3_ < this.§1@§.length)
         {
            _loc4_ = this.§1@§[_loc3_];
            _loc5_ = BloonSendDef(_loc4_.extra);
            if(_loc5_.unlockRound > this.§"0§.§+O§ + 1)
            {
               if(_loc4_.lock_mc.visible == false)
               {
                  _loc4_.lock_mc.visible = true;
                  this.§5#§(_loc4_);
               }
            }
            else if(_loc4_.lock_mc.visible == true)
            {
               _loc4_.lock_mc.visible = false;
               this.§5#§(_loc4_);
            }
            _loc3_++;
         }
         this.§13§(null);
         if(Balance.instance.UNLOCK_ROUND_REGEN.value <= this.§"0§.§+O§ + 1)
         {
            this.regenChk.valid = true;
         }
         if(Balance.instance.UNLOCK_ROUND_CAMO.value <= this.§"0§.§+O§ + 1)
         {
            this.camoChk.valid = true;
         }
      }
      
      private function §#=§() : void
      {
         this.regenChk.valid = false;
         this.camoChk.valid = false;
         var _loc1_:String = "<font color=\'#E0CDB6\' face=\'Oetztype\'>Add Camo</font>\nThe bloons you send against your opponent will have camo applied to them for an extra cost.\nCost multiplier: x" + Balance.instance.COST_MULTIPLIER_CAMO.value + "\nHotkey: -";
         var _loc2_:String = "<font color=\'#E0CDB6\' face=\'Oetztype\'>Add Regrow</font>\nThe bloons you send against your opponent will have regrow applied to them for an extra cost.\nCost multiplier: x" + Balance.instance.COST_MULTIPLIER_REGEN.value + "\nHotkey: =";
         _loc2_ += "\nUnlocks: Round " + Balance.instance.UNLOCK_ROUND_REGEN.value;
         _loc1_ += "\nUnlocks: Round " + Balance.instance.UNLOCK_ROUND_CAMO.value;
         this.camoChk.tooltip = _loc1_;
         this.regenChk.tooltip = _loc2_;
      }
      
      private function §'W§(param1:int = 0, param2:String = null, param3:Boolean = false, param4:Boolean = false) : void
      {
         if(this.§"0§.§9@§.§4O§.length >= Balance.instance.MAX_BLOON_QUE_SIZE.value)
         {
            if(this.§4#§ == false)
            {
               this.§4#§ = true;
               this.§13§(null);
            }
         }
         else if(this.§4#§ == true)
         {
            this.§4#§ = false;
            this.§13§(null);
         }
      }
      
      private function §2@§() : void
      {
         var _loc2_:BloonSendButton = null;
         var _loc1_:int = 0;
         while(_loc1_ < this.§1@§.length)
         {
            _loc2_ = this.§1@§[_loc1_];
            this.§5#§(_loc2_);
            _loc1_++;
         }
      }
      
      private function §06§(param1:Event) : void
      {
         this.§'&§.x += (this.§09§ - this.§'&§.x) / 2;
         if(Math.abs(this.§'&§.x - this.§09§) < 0.2)
         {
            this.§'&§.x = this.§09§;
         }
         if(this.§'&§.x >= this.bloonMask.x)
         {
            this.§!P§.upBtn.valid = false;
         }
         else
         {
            this.§!P§.upBtn.valid = true;
         }
         if(this.§'&§.x <= this.bloonMask.x + this.bloonMask.width - this.§'&§.width)
         {
            this.§!P§.downBtn.valid = false;
         }
         else
         {
            this.§!P§.downBtn.valid = true;
         }
      }
      
      private function §[V§(param1:Event) : void
      {
         this.§09§ += 3 * 36;
         if(this.§09§ > this.bloonMask.x)
         {
            this.§09§ = this.bloonMask.x;
         }
      }
      
      private function §73§(param1:Event) : void
      {
         this.§09§ -= 3 * 36;
         if(this.§09§ < this.bloonMask.x + this.bloonMask.width - this.§'&§.width)
         {
            this.§09§ = this.bloonMask.x + this.bloonMask.width - this.§'&§.width;
         }
      }
      
      private function §>D§(param1:Event) : void
      {
         this.§1L§(BloonSendButton(param1.target));
      }
      
      private function §1L§(param1:BloonSendButton) : void
      {
         var _loc3_:Boolean = false;
         var _loc4_:Boolean = false;
         var _loc2_:BloonSendDef = BloonSendDef(param1.extra);
         if(this.§"0§.§-W§.§7F§(this.§<=§(_loc2_)) && _loc2_.unlockRound <= this.§"0§.§+O§ + 1)
         {
            _loc3_ = this.regenChk.checked;
            _loc4_ = this.camoChk.checked;
            if(Balance.instance.UNLOCK_ROUND_REGEN.value > this.§"0§.§+O§ + 1)
            {
               _loc3_ = false;
               this.regenChk.valid = false;
               this.regenChk.checked = false;
            }
            if(Balance.instance.UNLOCK_ROUND_CAMO.value > this.§"0§.§+O§ + 1)
            {
               _loc4_ = false;
               this.camoChk.valid = false;
               this.camoChk.checked = false;
            }
            this.§"0§.§-W§.§]3§(this.§<=§(_loc2_));
            this.§"0§.§0<§(this.§!8§(_loc2_));
            this.§"0§.§9@§.§%,§(§-3§.§20§++,_loc2_,_loc4_,_loc3_);
         }
      }
      
      private function §!8§(param1:BloonSendDef) : Number
      {
         var _loc2_:Number = NaN;
         if(this.§"0§.§-W§.§3V§ <= 0)
         {
            return param1.incomeChange;
         }
         if(param1.incomeChange >= 0)
         {
            _loc2_ = param1.incomeChange * (1 + Balance.instance.§%T§.value);
         }
         else
         {
            _loc2_ = param1.incomeChange * (1 - Balance.instance.§%T§.value);
         }
         return _loc2_;
      }
      
      private function §;§(param1:KeyboardEvent) : void
      {
         var _loc3_:BloonSendButton = null;
         var _loc4_:BloonSendDef = null;
         var _loc5_:Boolean = false;
         var _loc6_:String = null;
         var _loc7_:int = 0;
         if(§?V§.instance.§"0§.§ 2§.§7>§.§>F§)
         {
            return;
         }
         if(param1.keyCode == Keyboard.MINUS)
         {
            this.§7N§();
            return;
         }
         if(param1.keyCode == Keyboard.EQUAL)
         {
            this.§7N§();
            return;
         }
         var _loc2_:int = 0;
         while(_loc2_ < this.§1@§.length)
         {
            _loc3_ = this.§1@§[_loc2_];
            _loc4_ = BloonSendDef(_loc3_.extra);
            if(_loc3_.valid == true && _loc3_.lock_mc.visible == false)
            {
               _loc5_ = _loc4_.hotkey.indexOf("Shift+") != -1;
               _loc6_ = _loc5_ == true ? _loc4_.hotkey.slice(6) : _loc4_.hotkey;
               _loc7_ = int(§36§[_loc6_]);
               if(_loc5_ == param1.shiftKey && param1.keyCode == _loc7_)
               {
                  this.§1L§(_loc3_);
                  break;
               }
            }
            _loc2_++;
         }
      }
      
      private function §`M§(param1:Event) : void
      {
         this.§7N§();
      }
      
      private function §^M§(param1:Event) : void
      {
         this.§7N§();
      }
      
      private function §7N§() : void
      {
         var _loc4_:BloonSendButton = null;
         var _loc5_:BloonSendDef = null;
         var _loc1_:Boolean = this.regenChk.checked;
         var _loc2_:Boolean = this.camoChk.checked;
         if(Balance.instance.UNLOCK_ROUND_REGEN.value > this.§"0§.§+O§ + 1)
         {
            _loc1_ = false;
            this.regenChk.valid = false;
            this.regenChk.checked = false;
         }
         if(Balance.instance.UNLOCK_ROUND_CAMO.value > this.§"0§.§+O§ + 1)
         {
            _loc2_ = false;
            this.camoChk.valid = false;
            this.camoChk.checked = false;
         }
         var _loc3_:int = 0;
         while(_loc3_ < this.§1@§.length)
         {
            _loc4_ = this.§1@§[_loc3_];
            _loc5_ = BloonSendDef(_loc4_.extra);
            _loc4_.holder_mc.removeChildAt(0);
            if(_loc2_ && _loc1_)
            {
               _loc4_.holder_mc.addChild(new _loc5_.thumbRegenCamo());
               this.§#4§.value = Balance.instance.COST_MULTIPLIER_REGEN.value * Balance.instance.COST_MULTIPLIER_CAMO.value;
            }
            else if(_loc1_)
            {
               _loc4_.holder_mc.addChild(new _loc5_.thumbRegen());
               this.§#4§.value = Balance.instance.COST_MULTIPLIER_REGEN.value;
            }
            else if(_loc2_)
            {
               _loc4_.holder_mc.addChild(new _loc5_.thumbCamo());
               this.§#4§.value = Balance.instance.COST_MULTIPLIER_CAMO.value;
            }
            else
            {
               _loc4_.holder_mc.addChild(new _loc5_.thumbStandard());
               this.§#4§.value = 1;
            }
            this.§5#§(_loc4_);
            _loc3_++;
         }
         this.§13§(null);
      }
      
      private function §5#§(param1:BloonSendButton) : void
      {
         var _loc2_:BloonSendDef = BloonSendDef(param1.extra);
         var _loc3_:String = "<font color=\'#E0CDB6\' face=\'Oetztype\'>" + _loc2_.name + " x" + _loc2_.quantity + "\n$" + this.§<=§(_loc2_).toFixed(1) + "</font>\nSend " + _loc2_.quantity + " " + _loc2_.name + " against your opponent.";
         if(param1.lock_mc.visible == true)
         {
            _loc3_ += "\nUnlocks: Round " + _loc2_.unlockRound;
         }
         _loc3_ += "\nHotkey: " + _loc2_.hotkey;
         if(_loc2_.incomeChange > 0)
         {
            _loc3_ += "\n<font color=\'#00EE00\'>Income Change: " + this.§!8§(_loc2_).toFixed(1) + "</font>";
         }
         else
         {
            _loc3_ += "\n<font color=\'#EE0000\'>Income Change: " + this.§!8§(_loc2_).toFixed(1) + "</font>";
         }
         param1.tooltip = _loc3_;
      }
      
      public function set x(param1:Number) : void
      {
         this.§!P§.x = param1;
      }
      
      public function set visible(param1:Boolean) : void
      {
         this.§!P§.visible = param1;
      }
   }
}

