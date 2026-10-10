package §3@§
{
   import §8K§.§ E§;
   import assets.PlayUI.Unknown;
   import flash.display.MovieClip;
   import flash.events.Event;
   import game.Balance;
   import org.osflash.signals.Signal;
   
   public class §7A§
   {
      
      public var §5H§:Signal = new Signal();
      
      public var §?N§:Signal = new Signal();
      
      private var mc:MovieClip;
      
      private var §,I§:Boolean;
      
      private var §9&§:Vector.<TowerDisplay>;
      
      private var §?0§:Vector.<§ E§>;
      
      public var §2V§:Vector.<§ E§>;
      
      public var §=O§:uint = 4;
      
      private var enabled:Boolean = false;
      
      public var §7S§:Boolean = false;
      
      public var §^4§:Boolean = false;
      
      private var §==§:Number = 67.5;
      
      public function §7A§()
      {
         super();
      }
      
      public function §,B§(param1:MovieClip, param2:Boolean = false) : void
      {
         var i:int;
         var towerPickerMC:MovieClip = param1;
         var opPicker:Boolean = param2;
         this.mc = towerPickerMC;
         this.§,I§ = opPicker;
         this.§9&§ = new Vector.<TowerDisplay>();
         i = 0;
         while(i < this.mc.numChildren)
         {
            if(this.mc.getChildAt(i) is TowerDisplay)
            {
               this.§9&§.push(this.mc.getChildAt(i));
            }
            i++;
         }
         if(this.§,I§)
         {
            this.mc.spyBtn.click = this.§;J§;
            this.mc.spyBtn.tooltip = "<font color=\'#E0CDB6\' face=\'Oetztype\'>Spy Ability</font>\nSpend " + Balance.instance.ENERGY_COST_SPY.value + " Battle Energy to spy on your opponents loadout for this match.";
         }
         else
         {
            this.mc.prev_btn.down = function(param1:Event):*
            {
               mc.addEventListener(Event.ENTER_FRAME,§0S§);
            };
            this.mc.prev_btn.up = function(param1:Event):*
            {
               mc.removeEventListener(Event.ENTER_FRAME,§0S§);
            };
            this.mc.prev_btn.out = this.mc.prev_btn.up;
            this.mc.next_btn.down = function(param1:Event):*
            {
               mc.addEventListener(Event.ENTER_FRAME,§'#§);
            };
            this.mc.next_btn.up = function(param1:Event):*
            {
               mc.removeEventListener(Event.ENTER_FRAME,§'#§);
            };
            this.mc.next_btn.out = this.mc.next_btn.up;
            this.mc.clear_btn.click = this.§^A§;
            this.mc.extraTowerBtn.click = this.§4'§;
            this.mc.extraTowerBtn.tooltip = "<font color=\'#E0CDB6\' face=\'Oetztype\'>Extra Tower Slot</font>\nSpend " + Balance.instance.ENERGY_COST_EXTRA_TOWER.value + " Battle Energy to unlock an extra tower slot for this match.";
         }
      }
      
      public function reset() : void
      {
         this.§^A§(null);
         this.§=O§ = 4;
         if(this.mc.extraTowerBtn)
         {
            this.mc.extraTowerBtn.visible = true;
         }
         this.§7S§ = false;
         if(this.mc.spyBtn)
         {
            this.mc.spyBtn.visible = true;
         }
         this.§^4§ = false;
      }
      
      public function setup(param1:Vector.<§ E§>) : void
      {
         var _loc3_:§ E§ = null;
         var _loc4_:TowerDisplay = null;
         var _loc5_:MovieClip = null;
         this.§?0§ = param1;
         while(this.mc.holder_mc.numChildren > 0)
         {
            TowerDisplay(this.mc.holder_mc.getChildAt(0)).click = null;
            this.mc.holder_mc.removeChildAt(0);
         }
         this.mc.holder_mc.x = this.mc.towers_mask.x;
         this.mc.prev_btn.valid = false;
         var _loc2_:int = 0;
         for each(_loc3_ in param1)
         {
            _loc4_ = new TowerDisplay();
            _loc4_.tooltip = "<font color=\'#EDE2D5\' face=\'Oetztype\'>" + _loc3_.tower.label + "</font>\n" + _loc3_.tower.description;
            _loc4_.extra = _loc3_;
            _loc4_.x = _loc2_;
            _loc4_.click = this.towerSelected;
            _loc5_ = null;
            if(_loc3_.tower.detailSmall)
            {
               _loc5_ = new (Class(_loc3_.tower.detailSmall))();
            }
            else
            {
               _loc5_ = new (Class(_loc3_.tower.display))();
            }
            _loc4_.valid = true;
            _loc5_.stop();
            _loc4_.holder_mc.addChild(_loc5_);
            this.mc.holder_mc.addChild(_loc4_);
            _loc2_ += this.§==§;
         }
         this.mc.holder_mc.x = this.mc.towers_mask.x;
         this.mc.prev_btn.valid = false;
         this.mc.next_btn.valid = true;
      }
      
      private function §0S§(param1:Event) : void
      {
         this.mc.holder_mc.x += this.§==§;
         if(this.mc.holder_mc.x > this.mc.towers_mask.x)
         {
            this.mc.holder_mc.x = this.mc.towers_mask.x;
            this.mc.prev_btn.valid = false;
         }
         this.mc.next_btn.valid = true;
      }
      
      private function §'#§(param1:Event) : void
      {
         this.mc.holder_mc.x -= this.§==§;
         if(this.mc.holder_mc.x + this.mc.holder_mc.width < this.mc.towers_mask.x + this.mc.towers_mask.width)
         {
            this.mc.holder_mc.x = this.mc.towers_mask.x + this.mc.towers_mask.width - this.mc.holder_mc.width;
            this.mc.next_btn.valid = false;
         }
         this.mc.prev_btn.valid = true;
      }
      
      public function set visible(param1:Boolean) : void
      {
         this.mc.visible = param1;
      }
      
      private function towerSelected(param1:Event) : void
      {
         if(!this.enabled)
         {
            return;
         }
         var _loc2_:TowerDisplay = TowerDisplay(param1.target);
         var _loc3_:§ E§ = § E§(_loc2_.extra);
         if(this.§2V§.length == this.§=O§)
         {
            return;
         }
         var _loc4_:int = 0;
         while(_loc4_ < this.§2V§.length)
         {
            if(this.§2V§[_loc4_] == _loc3_)
            {
               return;
            }
            _loc4_++;
         }
         this.§`H§(_loc3_);
         this.§2V§.push(_loc3_);
         this.§5H§.dispatch();
      }
      
      private function §+S§(param1:Event) : void
      {
         if(!this.enabled || this.§,I§)
         {
            return;
         }
         var _loc2_:TowerDisplay = TowerDisplay(param1.target);
         this.§2V§.splice(this.§2V§.indexOf(§ E§(_loc2_.extra)),1);
         this.§><§(_loc2_);
         this.§5H§.dispatch();
      }
      
      private function §`H§(param1:§ E§) : void
      {
         var _loc2_:TowerDisplay = this.§9&§[this.§2V§.length];
         _loc2_.tooltip = "<font color=\'#EDE2D5\' face=\'Oetztype\'>" + param1.tower.label + "</font>\n" + param1.tower.description;
         _loc2_.extra = param1;
         _loc2_.click = this.§+S§;
         var _loc3_:MovieClip = null;
         if(param1.tower.detailSmall)
         {
            _loc3_ = new (Class(param1.tower.detailSmall))();
         }
         else
         {
            _loc3_ = new (Class(param1.tower.display))();
         }
         _loc3_.stop();
         while(_loc2_.holder_mc.numChildren > 0)
         {
            _loc2_.holder_mc.removeChildAt(0);
         }
         _loc2_.holder_mc.addChild(_loc3_);
      }
      
      private function §><§(param1:TowerDisplay) : void
      {
         var _loc4_:TowerDisplay = null;
         while(param1.holder_mc.numChildren > 0)
         {
            param1.holder_mc.removeChildAt(0);
         }
         var _loc2_:Boolean = false;
         var _loc3_:int = 0;
         while(_loc3_ < this.§9&§.length)
         {
            if(param1 == this.§9&§[_loc3_])
            {
               _loc2_ = true;
            }
            if(_loc2_)
            {
               _loc4_ = this.§9&§[_loc3_];
               if(_loc3_ + 1 < this.§9&§.length)
               {
                  _loc4_.holder_mc.addChild(this.§9&§[_loc3_ + 1].holder_mc.getChildAt(0));
                  _loc4_.tooltip = this.§9&§[_loc3_ + 1].tooltip;
                  _loc4_.extra = this.§9&§[_loc3_ + 1].extra;
                  _loc4_.click = this.§9&§[_loc3_ + 1].click;
               }
               else
               {
                  _loc4_.holder_mc.addChild(new Unknown());
                  _loc4_.tooltip = "Select towers to use for this match";
                  _loc4_.exra = null;
                  _loc4_.click = null;
               }
            }
            _loc3_++;
         }
      }
      
      public function §?@§(param1:Array) : void
      {
         var _loc4_:int = 0;
         var _loc5_:§ E§ = null;
         this.§^A§(null);
         this.§2V§ = new Vector.<§ E§>();
         var _loc2_:Vector.<§ E§> = new Vector.<§ E§>();
         var _loc3_:int = 0;
         while(_loc3_ < param1.length)
         {
            _loc4_ = 0;
            while(_loc4_ < §?V§.instance.§+>§.towersInMenu.length)
            {
               _loc5_ = §?V§.instance.§+>§.towersInMenu[_loc4_];
               if(param1[_loc3_] != "" && param1[_loc3_] == _loc5_.id)
               {
                  this.§`H§(_loc5_);
                  this.§2V§.push(_loc5_);
                  break;
               }
               _loc4_++;
            }
            _loc3_++;
         }
      }
      
      public function §^A§(param1:Event) : void
      {
         var _loc3_:TowerDisplay = null;
         this.§2V§ = new Vector.<§ E§>();
         var _loc2_:int = 0;
         while(_loc2_ < this.§9&§.length)
         {
            _loc3_ = this.§9&§[_loc2_];
            while(_loc3_.holder_mc.numChildren > 0)
            {
               _loc3_.holder_mc.removeChildAt(0);
            }
            _loc3_.holder_mc.addChild(new Unknown());
            _loc3_.tooltip = "Select towers to use for this match";
            _loc3_.exra = null;
            _loc3_.click = null;
            _loc2_++;
         }
         this.§5H§.dispatch();
      }
      
      public function §2,§(param1:Boolean) : void
      {
         if(this.mc.clear_btn)
         {
            this.mc.clear_btn.valid = param1;
         }
         if(this.mc.extraTowerBtn)
         {
            this.mc.extraTowerBtn.valid = param1;
         }
         if(this.mc.spyBtn)
         {
            this.mc.spyBtn.valid = param1;
         }
         this.enabled = param1;
      }
      
      public function § C§() : Boolean
      {
         if(this.§2V§.length > 0)
         {
            return true;
         }
         return false;
      }
      
      public function §8Q§(param1:Boolean) : void
      {
         var _loc4_:* = 0;
         var _loc5_:int = 0;
         var _loc6_:§ E§ = null;
         if(this.§2V§.length >= this.§=O§)
         {
            return;
         }
         var _loc2_:Vector.<§ E§> = this.§?0§.slice();
         var _loc3_:int = 0;
         while(_loc3_ < this.§2V§.length)
         {
            _loc4_ = 0;
            while(_loc4_ < _loc2_.length)
            {
               if(_loc2_[_loc4_] == this.§2V§[_loc3_])
               {
                  _loc2_.splice(_loc4_,1);
                  _loc4_--;
               }
               _loc4_++;
            }
            _loc3_++;
         }
         while(this.§2V§.length < this.§=O§)
         {
            _loc5_ = int(Math.random() * _loc2_.length);
            _loc6_ = _loc2_[_loc5_];
            if(!(_loc6_.id == 8 && !param1))
            {
               _loc2_.splice(_loc5_,1);
               this.§`H§(_loc6_);
               this.§2V§.push(_loc6_);
            }
         }
         this.§5H§.dispatch();
      }
      
      private function §4'§(param1:Event) : void
      {
         if(§?V§.instance.profila.currentEnergy >= Balance.instance.ENERGY_COST_EXTRA_TOWER.value)
         {
            §?V§.instance.profila.useEnergy(Balance.instance.ENERGY_COST_EXTRA_TOWER.value);
            this.§=O§ = 5;
            this.mc.extraTowerBtn.visible = false;
            this.§7S§ = true;
            this.§5H§.dispatch();
         }
      }
      
      private function §;J§(param1:Event) : void
      {
         if(§?V§.instance.profila.currentEnergy >= Balance.instance.ENERGY_COST_SPY.value)
         {
            §?V§.instance.profila.useEnergy(Balance.instance.ENERGY_COST_SPY.value);
            this.mc.spyBtn.visible = false;
            this.§^4§ = true;
            this.§?N§.dispatch();
         }
      }
   }
}

