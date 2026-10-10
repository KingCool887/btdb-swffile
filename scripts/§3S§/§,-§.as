package §3S§
{
   import §8K§.§!<§;
   import abilities.def.AbilityDef;
   import assets.sounds.Select;
   import assets.sounds.Upgrade;
   import assets.towers.BananaInvestmentsAdvisory;
   import assets.towers.MoneyBank;
   import display.ui.Button;
   import entities.§^H§;
   import events.LevelEvent;
   import events.PropertyModEvent;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.utils.getQualifiedClassName;
   import game.§6$§;
   import profile.Profile;
   import sound.§^5§;
   import state.§9M§;
   import state.State;
   import towers.Tower;
   import towers.behavior.initialise.DeployMonkeyAce;
   import towers.behavior.roundStart.BananaEmitter;
   import towers.def.TowerDef;
   import towers.upgrades.UpgradeDef;
   import towers.upgrades.UpgradePathDef;
   
   public class §,-§ extends §"I§
   {
      
      public static var §2=§:§^5§ = new §^5§(Select);
      
      public var tower:Tower = null;
      
      private var §"0§:§6$§;
      
      public var §!,§:Profile = §?V§.instance.profila;
      
      private var msg:§9M§ = null;
      
      public function §,-§(param1:§!<§)
      {
         this.§"0§ = §?V§.instance.§"0§;
         super(param1);
      }
      
      public function §=P§(param1:Event) : void
      {
         var e:Event = param1;
         if(this.tower.def == null)
         {
            §!Y§.§^W§(§ 2§.§@!§,null);
            return;
         }
         if(getQualifiedClassName(§ 2§.mc.bottomPannel.towerSelected.holder_mc.getChildAt(0)) != getQualifiedClassName(this.tower.def.detailSmall))
         {
            while(§ 2§.mc.bottomPannel.towerSelected.holder_mc.numChildren > 0)
            {
               § 2§.mc.bottomPannel.towerSelected.holder_mc.removeChildAt(0);
            }
            if(this.tower.def.detailSmall != null)
            {
               § 2§.mc.bottomPannel.towerSelected.holder_mc.addChild(new (Class(this.tower.def.detailSmall))());
            }
         }
         § 2§.mc.bottomPannel.towerSelected.pops.text = String(this.tower.popCount);
         § 2§.mc.bottomPannel.towerSelected.sell.sellLabel.text = "SELL FOR $" + String(int(this.tower.spentOn * § 2§.§37§.value));
         § 2§.mc.bottomPannel.towerSelected.label.text = this.tower.def.label;
         § 2§.range.process(this.tower.def);
         § 2§.range.x = this.tower.x;
         § 2§.range.y = this.tower.y;
         § 2§.§33§.x = this.tower.x;
         § 2§.§33§.y = this.tower.y;
         § 2§.mc.bottomPannel.towerSelected.balance_mc.visible = false;
         if(this.tower.def.display == MoneyBank || this.tower.def.display == BananaInvestmentsAdvisory)
         {
            § 2§.mc.bottomPannel.towerSelected.balance_mc.visible = true;
            § 2§.mc.bottomPannel.towerSelected.balance_mc.balance_txt.text = "$" + String((this.tower.def.behavior.roundStart as BananaEmitter).getBankedFunds(this.tower));
            § 2§.mc.bottomPannel.towerSelected.balance_mc.extra = {
               "emitter":this.tower.def.behavior.roundStart as BananaEmitter,
               "tower":this.tower
            };
            § 2§.mc.bottomPannel.towerSelected.balance_mc.click = function(param1:Event):void
            {
               (param1.target as Button).extra.emitter.collect((param1.target as Button).extra.tower);
            };
         }
      }
      
      private function setTargetPriority(param1:int) : void
      {
         this.§"0§.§-W§.§90§(this.tower,param1);
         this.§3B§();
      }
      
      private function setAceFlightPath(param1:int) : void
      {
         this.§"0§.§-W§.setAceFlightPath(this.tower,param1);
         this.§3B§();
      }
      
      private function §3B§() : void
      {
         var prio:int = 0;
         if(!this.tower)
         {
            return;
         }
         if(this.tower.def.canPriorityTarget)
         {
            § 2§.mc.bottomPannel.towerSelected.first.visible = true;
            § 2§.mc.bottomPannel.towerSelected.last.visible = true;
            § 2§.mc.bottomPannel.towerSelected.close.visible = true;
            § 2§.mc.bottomPannel.towerSelected.strong.visible = true;
         }
         else
         {
            § 2§.mc.bottomPannel.towerSelected.first.visible = false;
            § 2§.mc.bottomPannel.towerSelected.last.visible = false;
            § 2§.mc.bottomPannel.towerSelected.close.visible = false;
            § 2§.mc.bottomPannel.towerSelected.strong.visible = false;
         }
         § 2§.mc.bottomPannel.towerSelected.first.valid = true;
         § 2§.mc.bottomPannel.towerSelected.last.valid = true;
         § 2§.mc.bottomPannel.towerSelected.close.valid = true;
         § 2§.mc.bottomPannel.towerSelected.strong.valid = true;
         switch(this.tower.§+4§)
         {
            case Tower.§'V§:
               § 2§.mc.bottomPannel.towerSelected.first.valid = false;
               break;
            case Tower.§#F§:
               § 2§.mc.bottomPannel.towerSelected.last.valid = false;
               break;
            case Tower.§%$§:
               § 2§.mc.bottomPannel.towerSelected.close.valid = false;
               break;
            case Tower.§8T§:
               § 2§.mc.bottomPannel.towerSelected.strong.valid = false;
         }
         § 2§.mc.bottomPannel.towerSelected.flightPaths.visible = false;
         if(this.tower.§`!§ == "MonkeyAce" && Boolean(DeployMonkeyAce.aces[this.tower]))
         {
            § 2§.mc.bottomPannel.towerSelected.flightPaths.visible = true;
            § 2§.mc.bottomPannel.towerSelected.flightPaths.vert_btn.valid = true;
            § 2§.mc.bottomPannel.towerSelected.flightPaths.horiz_btn.valid = true;
            § 2§.mc.bottomPannel.towerSelected.flightPaths.circle_btn.valid = true;
            prio = (DeployMonkeyAce.aces[this.tower] as §^H§).§6<§;
            switch(prio)
            {
               case §^H§.§32§:
                  § 2§.mc.bottomPannel.towerSelected.flightPaths.vert_btn.valid = false;
                  break;
               case §^H§.§8H§:
                  § 2§.mc.bottomPannel.towerSelected.flightPaths.horiz_btn.valid = false;
                  break;
               case §^H§.§1%§:
                  § 2§.mc.bottomPannel.towerSelected.flightPaths.circle_btn.valid = false;
            }
         }
         § 2§.mc.bottomPannel.towerSelected.balance_mc.visible = false;
         if(this.tower.def.display == MoneyBank || this.tower.def.display == BananaInvestmentsAdvisory)
         {
            § 2§.mc.bottomPannel.towerSelected.balance_mc.visible = true;
            § 2§.mc.bottomPannel.towerSelected.balance_mc.balance_txt.text = "$" + String((this.tower.def.behavior.roundStart as BananaEmitter).getBankedFunds(this.tower));
            § 2§.mc.bottomPannel.towerSelected.balance_mc.extra = {
               "emitter":this.tower.def.behavior.roundStart as BananaEmitter,
               "tower":this.tower
            };
            § 2§.mc.bottomPannel.towerSelected.balance_mc.click = function(param1:Event):*
            {
               (param1.target as Button).extra.emitter.collect((param1.target as Button).extra.tower);
            };
         }
      }
      
      public function §?7§(param1:KeyboardEvent) : void
      {
         if(§?V§.instance.§"0§.§ 2§.§7>§.§>F§)
         {
            return;
         }
         if(this.§"0§.§-W§.§+#§ == null)
         {
            return;
         }
         if(param1.keyCode == 8)
         {
            this.sell(null);
            return;
         }
         if(param1.charCode == ",".charCodeAt(0) || param1.charCode == "<".charCodeAt(0))
         {
            if(§ 2§.mc.bottomPannel.towerSelected["upgradePath1"].next.hit_btn.valid)
            {
               this.upgradePath(0);
               §?V§.instance.tooltip.hide();
            }
         }
         else if(param1.charCode == ".".charCodeAt(0) || param1.charCode == ">".charCodeAt(0))
         {
            if(§ 2§.mc.bottomPannel.towerSelected["upgradePath2"].next.hit_btn.valid)
            {
               this.upgradePath(1);
               §?V§.instance.tooltip.hide();
            }
         }
      }
      
      override public function enter(param1:§9M§) : void
      {
         var towerDef:TowerDef;
         var message:§9M§ = param1;
         §2=§.play();
         this.tower = §<Y§(message).tower;
         this.§3B§();
         towerDef = this.tower.def;
         § 2§.§%2§(this.tower);
         § 2§.mc.bottomPannel.buildPanel.visible = false;
         § 2§.mc.bottomPannel.towerSelected.visible = true;
         § 2§.mc.bottomPannel.towerSelected.first.click = function(param1:Event):*
         {
            setTargetPriority(Tower.§'V§);
         };
         § 2§.mc.bottomPannel.towerSelected.last.click = function(param1:Event):*
         {
            setTargetPriority(Tower.§#F§);
         };
         § 2§.mc.bottomPannel.towerSelected.close.click = function(param1:Event):*
         {
            setTargetPriority(Tower.§%$§);
         };
         § 2§.mc.bottomPannel.towerSelected.strong.click = function(param1:Event):*
         {
            setTargetPriority(Tower.§8T§);
         };
         § 2§.mc.bottomPannel.towerSelected.flightPaths.vert_btn.click = function(param1:Event):*
         {
            setAceFlightPath(§^H§.§32§);
         };
         § 2§.mc.bottomPannel.towerSelected.flightPaths.horiz_btn.click = function(param1:Event):*
         {
            setAceFlightPath(§^H§.§8H§);
         };
         § 2§.mc.bottomPannel.towerSelected.flightPaths.circle_btn.click = function(param1:Event):*
         {
            setAceFlightPath(§^H§.§1%§);
         };
         § 2§.mc.bottomPannel.towerSelected.pops.text = String(this.tower.popCount);
         this.tower.addEventListener(PropertyModEvent.mod,this.§=P§);
         while(§ 2§.mc.bottomPannel.towerSelected.holder_mc.numChildren > 0)
         {
            § 2§.mc.bottomPannel.towerSelected.holder_mc.removeChildAt(0);
         }
         if(this.tower.def.detailSmall != null)
         {
            § 2§.mc.bottomPannel.towerSelected.holder_mc.addChild(new (Class(this.tower.def.detailSmall))());
         }
         this.msg = message;
         § 2§.mc.bottomPannel.towerSelected.sell.click = this.sell;
         § 2§.mc.bottomPannel.towerSelected.sell.sellLabel.mouseEnabled = false;
         § 2§.mc.bottomPannel.towerSelected.sell.valid = true;
         § 2§.mc.bottomPannel.towerSelected.sell.sellLabel.text = "SELL FOR $" + String(int(this.tower.spentOn * § 2§.§37§.value));
         § 2§.mc.bottomPannel.towerSelected.sell.tooltip = null;
         if(this.tower.§9<§())
         {
            § 2§.mc.bottomPannel.towerSelected.sell.tooltip = "Can not sell the " + this.tower.def.label + " until all towers on top of it are removed or sold";
            § 2§.mc.bottomPannel.towerSelected.sell.valid = false;
         }
         else if(!this.tower.§5N§)
         {
            § 2§.mc.bottomPannel.towerSelected.sell.valid = false;
            § 2§.mc.bottomPannel.towerSelected.sell.sellLabel.text = "Can\'t Sell";
         }
         else
         {
            § 2§.mc.bottomPannel.towerSelected.sell.valid = true;
         }
         §?V§.instance.stage.addEventListener(KeyboardEvent.KEY_UP,this.§?7§);
         § 2§.mc.bottomPannel.towerSelected.label.text = towerDef.label;
         § 2§.range.x = this.tower.x;
         § 2§.range.y = this.tower.y;
         § 2§.§33§.x = this.tower.x;
         § 2§.§33§.y = this.tower.y;
         § 2§.range.process(towerDef);
         § 2§.range.visible = true;
         this.§1N§(this.tower);
         this.§ $§();
         § 2§.§;H§.§%&§(this.tower);
      }
      
      private function sell(param1:Event) : void
      {
         this.§"0§.§-W§.§4>§(this.tower.spentOn * § 2§.§37§.value);
         this.§"0§.§-W§.§&U§(this.tower);
         §!Y§.§^W§(§ 2§.§@!§,this.msg);
      }
      
      public function upgradePath1(param1:MouseEvent) : void
      {
         this.upgradePath(0);
      }
      
      public function upgradePath2(param1:MouseEvent) : void
      {
         this.upgradePath(1);
      }
      
      public function upgradePath(param1:int) : void
      {
         var _loc2_:int = this.tower.§ ?§(param1);
         var _loc3_:int = this.§"0§.§-W§.§ P§(_loc2_,this.tower.x,this.tower.y,this.tower);
         if(_loc3_ > this.§"0§.§-W§.cash.value)
         {
            return;
         }
         var _loc4_:int = this.tower.§7'§[param1];
         if(_loc4_ == 3 && true == false)
         {
            return;
         }
         new §^5§(Upgrade).play();
         this.§"0§.§-W§.§]3§(_loc3_);
         this.tower.spentOn += _loc3_;
         this.§"0§.§-W§.§-T§(this.tower,param1);
         var _loc5_:Button = § 2§.mc.bottomPannel.towerSelected["upgradePath" + String(param1 + 1)].next.hit_btn;
         _loc5_.handleMouseOut(null);
         this.§1N§(this.tower,param1);
         _loc5_.handleMouseOver(null);
         § 2§.§%+§.addTower(this.tower);
         this.§ $§();
         § 2§.§]1§.§%&§(§ 2§.§]1§.tower);
         § 2§.§;H§.§%&§(§ 2§.§;H§.tower);
      }
      
      public function §'1§(param1:Event) : void
      {
         this.§,W§(0);
         this.§,W§(1);
      }
      
      public function §,W§(param1:int) : void
      {
         var _loc3_:int = 0;
         var _loc2_:MovieClip = § 2§.mc.bottomPannel.towerSelected["upgradePath" + String(param1 + 1)].next;
         if(_loc2_.currentLabel == "CanBuy" || _loc2_.currentLabel == "CantAfford" || _loc2_.currentLabel == "CanBuyEnd" || _loc2_.currentLabel == "CantAffordEnd")
         {
            _loc3_ = int(_loc2_.hit_btn.extra.cost);
            if(this.§"0§.§-W§.cash.value < _loc3_)
            {
               _loc2_.gotoAndStop("CantAffordEnd");
               _loc2_.hit_btn.valid = false;
               _loc2_.cost_txt.text = "$" + String(_loc3_);
            }
            else
            {
               _loc2_.gotoAndStop("CanBuyEnd");
               _loc2_.hit_btn.valid = true;
               _loc2_.cost_txt.text = "$" + String(_loc3_);
            }
         }
      }
      
      public function §<7§(param1:int, param2:Boolean) : void
      {
         var _loc9_:UpgradeDef = null;
         var _loc10_:MovieClip = null;
         var _loc11_:int = 0;
         var _loc12_:UpgradeDef = null;
         var _loc3_:int = param1 == 0 ? 1 : 0;
         var _loc4_:* = § 2§.mc.bottomPannel.towerSelected["upgradePath" + String(param1 + 1)].next;
         var _loc5_:* = § 2§.mc.bottomPannel.towerSelected["upgradePath" + String(param1 + 1)].current;
         this.§"0§.§-W§.addEventListener(LevelEvent.CASH_CHANGE,this.§'1§,false,0,true);
         if(_loc4_.holder_mc.numChildren > 0)
         {
            _loc4_.holder_mc.removeChildAt(0);
         }
         var _loc6_:UpgradePathDef = this.tower.§&@§;
         var _loc7_:int = this.tower.§7'§[param1];
         var _loc8_:int = this.tower.§7'§[_loc3_];
         if(_loc7_ == 4)
         {
            _loc4_.gotoAndStop("LockedMax");
            _loc4_.hit_btn.tooltip = "All upgrades for this path have been purchased.";
            _loc4_.hit_btn.click = null;
            _loc4_.hit_btn.valid = false;
         }
         else if(_loc7_ == 3 && true == false)
         {
            if(param2)
            {
               _loc4_.gotoAndPlay("Locked");
            }
            else
            {
               _loc4_.gotoAndStop("LockedEnd");
            }
            _loc4_.hit_btn.tooltip = "This upgrade is locked until it is purchased from the tower menu.";
            _loc4_.hit_btn.click = null;
            _loc4_.hit_btn.valid = false;
            _loc9_ = _loc6_.upgrades[param1][_loc7_];
            if(_loc9_.thumb)
            {
               _loc10_ = new (Class(_loc9_.thumb))();
               _loc4_.holder_mc.addChild(_loc10_);
            }
         }
         else if(_loc7_ == 2 && _loc8_ >= 3)
         {
            if(param2)
            {
               _loc4_.gotoAndPlay("LockedPath");
            }
            else
            {
               _loc4_.gotoAndStop("LockedPathEnd");
            }
            _loc4_.hit_btn.tooltip = "No further upgrades can be bought for this path due to level 3 or 4 upgrades bought for the other path.";
            _loc4_.hit_btn.click = null;
            _loc4_.hit_btn.valid = false;
         }
         else
         {
            _loc9_ = _loc6_.upgrades[param1][_loc7_];
            _loc11_ = this.§"0§.§-W§.§ P§(_loc9_.cost,this.tower.x,this.tower.y,this.tower);
            _loc4_.hit_btn.extra = {"cost":_loc11_};
            if(_loc11_ <= this.§"0§.§-W§.cash.value)
            {
               if(param2)
               {
                  _loc4_.gotoAndPlay("CanBuy");
               }
               else
               {
                  _loc4_.gotoAndStop("CanBuyEnd");
               }
               _loc4_.hit_btn.valid = true;
            }
            else
            {
               if(param2)
               {
                  _loc4_.gotoAndPlay("CantAfford");
               }
               else
               {
                  _loc4_.gotoAndStop("CantAffordEnd");
               }
               _loc4_.hit_btn.valid = false;
            }
            _loc4_.cost_txt.text = "$" + String(_loc11_);
            _loc4_.hit_btn.tooltip = "<font color=\'#EDE2D5\' face=\'Oetztype\'>" + _loc9_.label + "\n$" + String(_loc11_) + "</font>\n" + _loc9_.description;
            _loc4_.hit_btn.click = this["upgradePath" + String(param1 + 1)];
            if(_loc9_.thumb)
            {
               _loc10_ = new (Class(_loc9_.thumb))();
               _loc4_.holder_mc.addChild(_loc10_);
            }
         }
         if(_loc5_.holder_mc.numChildren > 0)
         {
            _loc5_.holder_mc.removeChildAt(0);
         }
         _loc5_.hit_btn.valid = false;
         if(_loc7_ > 0)
         {
            _loc12_ = _loc6_.upgrades[param1][_loc7_ - 1];
            if(param2)
            {
               _loc5_.gotoAndPlay("Bought");
            }
            else
            {
               _loc5_.gotoAndStop(25);
            }
            _loc5_.hit_btn.tooltip = "<font color=\'#EDE2D5\' face=\'Oetztype\'>" + _loc12_.label + "</font>\n" + _loc12_.description;
            if(_loc12_.thumb)
            {
               _loc10_ = new (Class(_loc12_.thumb))();
               _loc5_.holder_mc.addChild(_loc10_);
            }
            § 2§.mc.bottomPannel.towerSelected["upgradePath" + String(param1 + 1)].upgradeBar1_mc.gotoAndStop(_loc7_ + 1);
         }
         else
         {
            _loc5_.gotoAndStop("NoUpgrade");
            _loc5_.pathNo_txt.text = String(param1 + 1);
            _loc5_.hit_btn.tooltip = null;
            § 2§.mc.bottomPannel.towerSelected["upgradePath" + String(param1 + 1)].upgradeBar1_mc.gotoAndStop(1);
         }
      }
      
      public function §1N§(param1:Tower, param2:int = -1) : void
      {
         if(param1.§&@§ == null)
         {
            § 2§.mc.bottomPannel.towerSelected.upgradePath1.visible = false;
            § 2§.mc.bottomPannel.towerSelected.upgradePath2.visible = false;
            return;
         }
         § 2§.mc.bottomPannel.towerSelected.upgradePath1.visible = true;
         § 2§.mc.bottomPannel.towerSelected.upgradePath2.visible = true;
         this.§<7§(0,param2 == 0);
         this.§<7§(1,param2 == 1);
      }
      
      override public function message(param1:§9M§) : State
      {
         if(§<Y§(param1).type == §<Y§.§ 9§)
         {
            return § 2§.§@J§;
         }
         if(§<Y§(param1).type == §<Y§.§3F§)
         {
            return § 2§.§@!§;
         }
         if(§<Y§(param1).type == §<Y§.§@P§)
         {
            return § 2§.§@!§;
         }
         return null;
      }
      
      override public function exit() : void
      {
         § 2§.mc.bottomPannel.buildPanel.visible = true;
         § 2§.mc.bottomPannel.towerSelected.visible = false;
         § 2§.range.visible = false;
         § 2§.§&X§();
         this.tower.removeEventListener(PropertyModEvent.mod,this.§=P§);
         §?V§.instance.stage.removeEventListener(KeyboardEvent.KEY_UP,this.§?7§);
         § 2§.§;H§.§%&§(null);
      }
      
      private function § $§() : void
      {
         if(this.tower.def.abilities)
         {
            § 2§.mc.bottomPannel.towerSelected.activate.visible = true;
            § 2§.mc.bottomPannel.towerSelected.activate.click = this.§+<§;
         }
         else
         {
            § 2§.mc.bottomPannel.towerSelected.activate.visible = false;
         }
      }
      
      private function §+<§(param1:Event) : void
      {
         var _loc2_:AbilityDef = this.tower.def.abilities[0];
         this.tower.levelSlug.§6@§(this.tower,_loc2_.id);
      }
   }
}

