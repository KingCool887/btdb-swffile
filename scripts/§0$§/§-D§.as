package §0$§
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import ninjakiwi.mynk.MyNK;
   import premium.§6-§;
   import profile.Profile;
   
   public class §-D§ extends §`A§
   {
      
      private var profila:Profile;
      
      private var §#8§:Vector.<StoreItemBtn> = new Vector.<StoreItemBtn>();
      
      private var §<T§:§6-§ = null;
      
      public function §-D§()
      {
         super();
      }
      
      override public function §,B§(param1:MovieClip) : void
      {
         super.§,B§(param1);
         this.profila = §?V§.instance.profila;
         mc.close_btn.click = this.§-8§;
         mc.next_btn.valid = false;
         mc.prev_btn.valid = false;
         this.§ 6§();
      }
      
      override public function show(param1:* = null) : void
      {
         super.show(param1);
         this.§%>§();
         this.profila.SigShopItemUsesChanged().add(this.§%>§);
      }
      
      override public function hide(param1:* = null) : void
      {
         this.profila.SigShopItemUsesChanged().remove(this.§%>§);
         super.hide(param1);
      }
      
      private function §-8§(param1:Event) : void
      {
         this.hide();
      }
      
      private function § 6§() : void
      {
         var _loc4_:§6-§ = null;
         var _loc5_:StoreItemBtn = null;
         var _loc6_:Class = null;
         var _loc7_:Vector.<StoreItemBtn> = null;
         var _loc8_:int = 0;
         var _loc1_:int = 0;
         while(_loc1_ < mc.numChildren)
         {
            if(mc.getChildAt(_loc1_) is StoreItemBtn)
            {
               this.§#8§.push(mc.getChildAt(_loc1_));
            }
            _loc1_++;
         }
         var _loc2_:Vector.<§6-§> = §?V§.instance.§0J§.§'K§;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            _loc4_ = _loc2_[_loc3_];
            if(_loc3_ < this.§#8§.length)
            {
               _loc5_ = this.§#8§[_loc3_];
            }
            else
            {
               _loc5_ = new StoreItemBtn();
               this.§#8§.push(_loc5_);
            }
            _loc5_.extra = _loc4_;
            _loc5_.free_label.visible = false;
            _loc5_.name_txt.text = _loc4_.name;
            _loc5_.buyCost_txt.text = _loc4_.price.toString();
            _loc6_ = _loc4_.thumb;
            _loc5_.holder_mc.addChild(new _loc6_());
            if(_loc4_.§+5§ == §6-§.§^9§)
            {
               _loc5_.coinChoose.gotoAndStop("NKCoin");
            }
            else
            {
               _loc5_.coinChoose.gotoAndStop("Medallion");
            }
            _loc5_.click = this.§=;§;
            _loc3_++;
         }
         if(_loc3_ < this.§#8§.length)
         {
            _loc7_ = this.§#8§.splice(_loc3_,uint.MAX_VALUE);
            _loc8_ = 0;
            while(_loc8_ < _loc7_.length)
            {
               mc.removeChild(_loc7_[_loc8_]);
               _loc8_++;
            }
         }
      }
      
      private function §%>§() : void
      {
         var _loc1_:StoreItemBtn = null;
         for each(_loc1_ in this.§#8§)
         {
            this.§"O§(_loc1_);
         }
      }
      
      private function §"O§(param1:StoreItemBtn) : void
      {
         var _loc2_:§6-§ = §6-§(param1.extra);
         if(_loc2_.§+5§ == §6-§.§^Y§)
         {
            if(this.profila.medallions < _loc2_.price)
            {
               param1.valid = false;
            }
            else
            {
               param1.valid = true;
            }
         }
         param1.tooltip = _loc2_.description;
         if(_loc2_.§#C§ != 0)
         {
            if(this.profila.shopItemUses[_loc2_.id].value >= _loc2_.§#C§)
            {
               param1.valid = false;
               param1.tooltip += "\nPURCHASED.";
            }
            else
            {
               param1.tooltip += "\n" + (_loc2_.§#C§ - this.profila.shopItemUses[_loc2_.id].value).toString() + " uses remaining.";
            }
         }
         var _loc3_:int = _loc2_.§-R§ - this.profila.shopItemUses[_loc2_.id].value;
         if(_loc3_ > 0)
         {
            param1.free_label.visible = true;
            param1.free_label.num_txt.text = String(_loc3_);
            param1.tooltip += "\n" + _loc3_ + " free uses remaining";
         }
         else
         {
            param1.free_label.visible = false;
         }
      }
      
      private function §=;§(param1:Event) : void
      {
         var _loc2_:StoreItemBtn = StoreItemBtn(param1.target);
         var _loc3_:§6-§ = §6-§(_loc2_.extra);
         if(_loc3_.§+5§ == §6-§.§^9§)
         {
            if(_loc3_.§-R§ > this.profila.shopItemUses[_loc3_.id].value)
            {
               this.§<T§ = _loc3_;
               §&K§.instance.§>1§.show({
                  "yesFunction":this.§5,§,
                  "msg":"Do you want to use a free " + _loc3_.name + "?"
               });
            }
            else
            {
               MyNK.ey.store.showItem(_loc3_.§7H§);
            }
         }
         else if(this.profila.medallions >= _loc3_.price)
         {
            this.§<T§ = _loc3_;
            §&K§.instance.§>1§.show({
               "yesFunction":this.§5G§,
               "msg":"Purchase this item for " + _loc3_.price + " Medallions?"
            });
         }
      }
      
      private function §5,§() : void
      {
         §&K§.instance.§>1§.§&1§();
         this.profila.SigShopItemUsesChanged().add(this.§>3§);
         §?V§.instance.§8'§(this.§<T§.§^>§);
      }
      
      private function §>3§() : void
      {
         this.§%>§();
         this.profila.SigShopItemUsesChanged().remove(this.§>3§);
         §&K§.instance.§>1§.hide();
      }
      
      private function §5G§() : void
      {
         this.profila.SigMedallionsChanged().add(this.§1+§);
         §&K§.instance.§>1§.§&1§();
         MyNK.ey.user.buyCurrencyItems([[this.§<T§.§9%§,1]]);
      }
      
      private function §1+§(param1:int) : void
      {
         this.profila.SigMedallionsChanged().remove(this.§1+§);
         this.profila.applyPurchasedItem(this.§<T§.id);
         this.§%>§();
         §&K§.instance.§>1§.hide();
      }
   }
}

