package §0$§
{
   import §8K§.§ E§;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import ninjakiwi.mynk.MyNK;
   import profile.Profile;
   import towers.§,X§;
   import towers.upgrades.UpgradeDef;
   import towers.upgrades.UpgradePathDef;
   
   public class §5§ extends §`A§
   {
      
      private var profila:Profile;
      
      private var §+>§:§,X§;
      
      private var §"V§:Vector.<§6Y§> = new Vector.<§6Y§>();
      
      private var tier4Buttons:Vector.<§,#§> = new Vector.<§,#§>();
      
      private var §";§:§ E§ = null;
      
      internal var tpd:§ E§ = null;
      
      public function §5§()
      {
         super();
      }
      
      override public function §,B§(param1:MovieClip) : void
      {
         super.§,B§(param1);
         this.profila = §?V§.instance.profila;
         this.§+>§ = §?V§.instance.§+>§;
         mc.decals_btn.click = this.§8I§;
         mc.close_btn.click = this.§-8§;
         mc.tower_info.visible = false;
         mc.tower_info.close_btn.click = this.§[W§;
         mc.tower_info.unlock_btn.click = this.§85§;
         mc.tower_info.add_meds.click = this.§6K§;
         mc.scroll.SetScrollableObject(mc.container,mc.da_mask);
         this.§"P§();
      }
      
      override public function show(param1:* = null) : void
      {
         super.show(param1);
         mc.tower_info.visible = false;
         this.§9I§();
         this.updateTier4Buttons();
         this.profila.SigMedallionsChanged().add(this.§2U§);
      }
      
      override public function hide(param1:* = null) : void
      {
         this.profila.SigMedallionsChanged().remove(this.§2U§);
         super.hide(param1);
      }
      
      private function §-8§(param1:Event) : void
      {
         this.hide();
      }
      
      private function §"P§() : void
      {
         var _loc1_:§ E§ = null;
         var _loc2_:§>I§ = null;
         var _loc3_:int = 0;
         var _loc4_:MovieClip = null;
         var _loc5_:UpgradePathDef = null;
         var _loc6_:UpgradeDef = null;
         var _loc7_:UpgradeDef = null;
         var _loc8_:MovieClip = null;
         this.§"V§ = new Vector.<§6Y§>();
         this.tier4Buttons = new Vector.<§,#§>();
         for each(_loc1_ in this.§+>§.towersInMenu)
         {
            _loc2_ = null;
            _loc3_ = 0;
            while(_loc3_ < mc.container.numChildren)
            {
               if(mc.container.getChildAt(_loc3_).name == _loc1_.tower.id)
               {
                  _loc2_ = §>I§(mc.container.getChildAt(_loc3_));
               }
               _loc3_++;
            }
            if(_loc2_ != null)
            {
               _loc2_.§30§.extra = _loc1_;
               _loc2_.§7O§.extra = _loc1_;
               _loc4_ = new (Class(_loc1_.tower.detailSmall))();
               _loc2_.§30§.holder_mc.addChild(_loc4_);
               _loc2_.§30§.name_txt.text = _loc1_.tower.label;
               _loc2_.§30§.desc_txt.text = _loc1_.tower.description;
               _loc5_ = §?V§.instance.§=K§.§?P§(_loc1_.tower.id);
               _loc6_ = _loc5_.upgrades[0][3];
               _loc7_ = _loc5_.upgrades[1][3];
               _loc4_ = new (Class(_loc6_.thumb))();
               _loc8_ = new (Class(_loc7_.thumb))();
               mc.tower_info.mainDisplay_mc.holder_mc.addChild(_loc4_);
               mc.tower_info.mainDisplay_mc.holder_mc.addChild(_loc8_);
               _loc4_.scaleX = _loc4_.scaleY = 1;
               _loc8_.scaleX = _loc8_.scaleY = 1;
               _loc2_.§7O§.holder_mc.addChild(_loc4_);
               _loc2_.§7O§.holder_mc.addChild(_loc8_);
               _loc4_.x -= 17;
               _loc4_.y -= 17;
               _loc8_.x += 17;
               _loc8_.y += 17;
               _loc2_.§30§.click = this.§5P§;
               _loc2_.§7O§.click = this.tier4Clicked;
               this.§"V§.push(_loc2_.§30§);
               this.tier4Buttons.push(_loc2_.§7O§);
            }
         }
      }
      
      private function §5P§(param1:Event) : void
      {
         var _loc2_:§6Y§ = §6Y§(param1.target);
         var _loc3_:§ E§ = § E§(_loc2_.extra);
         this.§";§ = _loc3_;
         this.§[0§(_loc3_);
      }
      
      private function tier4Clicked(param1:Event) : void
      {
         var _loc2_:§,#§ = §,#§(param1.target);
         var _loc3_:§ E§ = § E§(_loc2_.extra);
         this.§";§ = _loc3_;
         this.§[T§(_loc3_);
      }
      
      private function §9I§() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.§"V§.length)
         {
            this.§"O§(this.§"V§[_loc1_]);
            _loc1_++;
         }
      }
      
      private function updateTier4Buttons() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.tier4Buttons.length)
         {
            this.updateTier4Button(this.tier4Buttons[_loc1_]);
            _loc1_++;
         }
      }
      
      private function §"O§(param1:§6Y§) : void
      {
         var _loc3_:int = 0;
         var _loc2_:§ E§ = § E§(param1.extra);
         if(_loc2_.§70§ != 0 && this.profila.isTowerUnlocked(_loc2_.id) == false)
         {
            _loc3_ = this.§+>§.§#M§[_loc2_.§'X§];
            if(this.profila.battleScore < _loc3_)
            {
               param1.tooltip = "<font color=\'#EDE2D5\' face=\'Oetztype\'>" + _loc2_.tower.label + "</font>\n" + _loc2_.tower.description;
               param1.tooltip += "\n<font color=\'#FFD700\' face=\'Oetztype\'>Reach " + _loc3_ + " Battlescore to unlock for purchase</font>";
               param1.§81§.visible = true;
               param1.§>=§.visible = true;
               param1.§>=§.text = _loc3_.toString();
               param1.§<-§.visible = false;
               param1.§^6§.visible = false;
               param1.valid = false;
            }
            else
            {
               param1.§81§.visible = false;
               param1.§>=§.visible = false;
               param1.§^6§.text = _loc2_.§70§.toString();
               param1.§^6§.visible = true;
               param1.§<-§.visible = true;
               param1.valid = true;
            }
            param1.§#P§.visible = true;
            param1.§@E§.visible = false;
         }
         else
         {
            param1.§^6§.text = "Unlocked";
            param1.§^6§.visible = true;
            param1.§#P§.visible = false;
            param1.§<-§.visible = false;
            param1.§81§.visible = false;
            param1.§>=§.visible = false;
            param1.valid = false;
            param1.§@E§.visible = true;
         }
      }
      
      private function updateTier4Button(param1:§,#§) : void
      {
         var _loc3_:int = 0;
         var _loc2_:§ E§ = § E§(param1.extra);
         if(_loc2_.unlockTier4Cost != 0 && this.profila.isTowerTier4Unlocked(_loc2_.id) == false)
         {
            _loc3_ = this.§+>§.§#M§[_loc2_.§'X§];
            if(this.profila.battleScore < _loc3_)
            {
               param1.tooltip = "<font color=\'#EDE2D5\' face=\'Oetztype\'>" + _loc2_.tower.label + " Tier 4</font>\nThe final tier of upgrades for the " + _loc2_.tower.label;
               param1.tooltip += "\n<font color=\'#FFD700\' face=\'Oetztype\'>Reach " + _loc3_ + " Battlescore to unlock for purchase</font>";
               param1.§^6§.visible = false;
               param1.§<-§.visible = false;
               param1.valid = false;
            }
            else if(_loc2_.§70§ != 0 && this.profila.isTowerUnlocked(_loc2_.id) == false)
            {
               param1.tooltip = "<font color=\'#EDE2D5\' face=\'Oetztype\'>" + _loc2_.tower.label + " Tier 4</font>\nThe final tier of upgrades for the " + _loc2_.tower.label;
               param1.tooltip += "\n<font color=\'#FFD700\' face=\'Oetztype\'>Unlock this tower before its Tier 4 upgrade can be unlocked for purchase</font>";
               param1.§^6§.visible = false;
               param1.§<-§.visible = false;
               param1.valid = false;
            }
            else
            {
               param1.§^6§.text = _loc2_.unlockTier4Cost.toString();
               param1.§^6§.visible = true;
               param1.§<-§.visible = true;
               param1.valid = true;
            }
            param1.§#P§.visible = true;
            param1.§@E§.visible = false;
         }
         else
         {
            param1.§^6§.text = "Unlocked";
            param1.§#P§.visible = false;
            param1.§<-§.visible = false;
            param1.valid = false;
            param1.§@E§.visible = true;
         }
      }
      
      private function §[W§(param1:Event) : void
      {
         mc.tower_info.visible = false;
      }
      
      private function §@-§() : void
      {
         mc.tower_info.close_btn.valid = false;
         mc.tower_info.unlock_btn.valid = false;
         mc.tower_info.add_meds.valid = false;
      }
      
      private function §[0§(param1:§ E§) : void
      {
         mc.tower_info.visible = true;
         mc.tower_info.close_btn.valid = true;
         mc.tower_info.unlock_btn.valid = true;
         mc.tower_info.add_meds.valid = true;
         while(mc.tower_info.mainDisplay_mc.holder_mc.numChildren > 0)
         {
            mc.tower_info.mainDisplay_mc.holder_mc.removeChildAt(0);
         }
         var _loc2_:MovieClip = new (Class(param1.tower.detail))();
         mc.tower_info.mainDisplay_mc.holder_mc.addChild(_loc2_);
         mc.tower_info.towerName_txt.text = param1.tower.label;
         mc.tower_info.desc_txt.text = param1.tower.description;
         mc.tower_info.unlock_btn.visible = true;
         mc.tower_info.cost_txt.text = param1.§70§;
         if(this.profila.medallions >= param1.§70§)
         {
            mc.tower_info.unlock_btn.valid = true;
         }
         else
         {
            mc.tower_info.unlock_btn.valid = false;
         }
         mc.tower_info.unlock_btn.extra = {
            "tpd":param1,
            "forT4":false
         };
      }
      
      private function §[T§(param1:§ E§) : void
      {
         mc.tower_info.visible = true;
         mc.tower_info.close_btn.valid = true;
         mc.tower_info.unlock_btn.valid = true;
         mc.tower_info.add_meds.valid = true;
         while(mc.tower_info.mainDisplay_mc.holder_mc.numChildren > 0)
         {
            mc.tower_info.mainDisplay_mc.holder_mc.removeChildAt(0);
         }
         var _loc2_:UpgradePathDef = §?V§.instance.§=K§.§?P§(param1.tower.id);
         var _loc3_:UpgradeDef = _loc2_.upgrades[0][3];
         var _loc4_:UpgradeDef = _loc2_.upgrades[1][3];
         var _loc5_:MovieClip = new (Class(_loc3_.thumb))();
         var _loc6_:MovieClip = new (Class(_loc4_.thumb))();
         mc.tower_info.mainDisplay_mc.holder_mc.addChild(_loc5_);
         mc.tower_info.mainDisplay_mc.holder_mc.addChild(_loc6_);
         _loc5_.scaleX = _loc5_.scaleY = 1.2;
         _loc6_.scaleX = _loc6_.scaleY = 1.2;
         _loc5_.x -= 19;
         _loc5_.y -= 19;
         _loc6_.x += 19;
         _loc6_.y += 19;
         mc.tower_info.towerName_txt.text = param1.tower.label + " Tier 4";
         mc.tower_info.desc_txt.text = "Get the most powerful upgrades for this tower: " + _loc3_.label + " & " + _loc4_.label;
         mc.tower_info.unlock_btn.visible = true;
         mc.tower_info.cost_txt.text = param1.unlockTier4Cost;
         if(this.profila.medallions >= param1.unlockTier4Cost)
         {
            mc.tower_info.unlock_btn.valid = true;
         }
         else
         {
            mc.tower_info.unlock_btn.valid = false;
         }
         mc.tower_info.unlock_btn.extra = {
            "tpd":param1,
            "forT4":true
         };
      }
      
      private function §85§(param1:Event) : void
      {
         var _loc3_:Timer = null;
         this.tpd = § E§(mc.tower_info.unlock_btn.extra.tpd);
         var _loc2_:Boolean = Boolean(mc.tower_info.unlock_btn.extra.forT4);
         if(_loc2_)
         {
            if(this.profila.medallions >= this.tpd.unlockTier4Cost)
            {
               this.§@-§();
               this.profila.SigMedallionsChanged().add(this.§#&§);
               MyNK.ey.user.buyCurrencyItems([[this.tpd.unlockTier4CostCPID,1]]);
               MyNK.ey.user.track("BoughtTower",this.tpd.id.toString(),§?V§.instance.profila.battleScore,"Tier4","NULL",true);
               _loc3_ = new Timer(10);
               _loc3_.addEventListener(TimerEvent.TIMER_COMPLETE,this.§@Q§);
            }
         }
         else if(this.profila.medallions >= this.tpd.§70§)
         {
            this.§@-§();
            this.profila.SigMedallionsChanged().add(this.§+2§);
            MyNK.ey.user.buyCurrencyItems([[this.tpd.§4=§,1]]);
            MyNK.ey.user.track("BoughtTower",this.tpd.id.toString(),§?V§.instance.profila.battleScore,"Bought","NULL",true);
            _loc3_ = new Timer(10);
            _loc3_.addEventListener(TimerEvent.TIMER_COMPLETE,this.§@Q§);
         }
      }
      
      private function §@Q§(param1:Event) : void
      {
         this.§+2§(0);
      }
      
      private function §+2§(param1:int) : void
      {
         this.profila.SigMedallionsChanged().remove(this.§+2§);
         this.profila.unlockTower(this.tpd.id);
         this.§9I§();
         this.updateTier4Buttons();
         this.§[W§(null);
         this.profila.checkForTowerAchievements();
      }
      
      private function §#&§(param1:int) : void
      {
         this.profila.SigMedallionsChanged().remove(this.§#&§);
         this.profila.unlockTowerTier4(this.tpd.id);
         this.§9I§();
         this.updateTier4Buttons();
         this.§[W§(null);
         this.profila.checkForTowerAchievements();
      }
      
      private function §6K§(param1:Event) : void
      {
         MyNK.ey.store.showItems([[569,1],[571,0],[572,0]]);
      }
      
      private function §2U§(param1:int) : void
      {
         if(mc.tower_info.visible == true && this.§";§ != null)
         {
            this.§[W§(null);
            this.§[0§(this.§";§);
         }
      }
      
      private function §8I§(param1:Event) : void
      {
         this.hide();
         §&K§.instance.§ <§.show();
      }
   }
}

