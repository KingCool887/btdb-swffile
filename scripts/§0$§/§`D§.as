package §0$§
{
   import assets.AllDecals;
   import decals.§<C§;
   import display.ui.ScrollBarVertical;
   import flash.display.MovieClip;
   import flash.events.Event;
   import ninjakiwi.mynk.MyNK;
   import profile.Profile;
   
   public class §`D§ extends §`A§
   {
      
      private var profila:Profile;
      
      private var §+N§:Vector.<decalBtn>;
      
      private var §0L§:Number = 0;
      
      private var §#T§:Number = 0;
      
      private var §=F§:Number = 0;
      
      private var §!A§:Number = 0;
      
      private var §;<§:Number = 0;
      
      private var §++§:ScrollBarVertical;
      
      internal var § 8§:decalBtn = null;
      
      public function §`D§()
      {
         super();
      }
      
      override public function §,B§(param1:MovieClip) : void
      {
         super.§,B§(param1);
         this.profila = §?V§.instance.profila;
         mc.towers_btn.click = this.§3-§;
         mc.close_btn.click = this.hide;
         this.§++§ = mc.scroll;
         this.§%E§();
         this.§>!§();
      }
      
      override public function show(param1:* = null) : void
      {
         this.§%>§();
         this.§6?§();
         super.show(param1);
      }
      
      override public function hide(param1:* = null) : void
      {
         super.hide(param1);
      }
      
      private function §3-§(param1:Event) : void
      {
         this.hide();
         §&K§.instance.§0?§.show();
      }
      
      private function §%E§() : void
      {
         var _loc3_:* = 0;
         var _loc4_:decalBtn = null;
         var _loc1_:Number = 0;
         var _loc2_:Number = 0;
         _loc3_ = 0;
         while(_loc3_ < mc.container.numChildren && (this.§0L§ == 0 || this.§#T§ == 0))
         {
            _loc4_ = mc.container.getChildAt(_loc3_) as decalBtn;
            if(_loc4_)
            {
               if(_loc3_ == 0)
               {
                  _loc1_ = _loc4_.x;
                  _loc2_ = _loc4_.y;
                  this.§=F§ = _loc4_.x;
                  this.§!A§ = _loc4_.y;
               }
               else
               {
                  if(this.§0L§ == 0)
                  {
                     this.§0L§ = _loc4_.x - _loc1_;
                  }
                  if(this.§#T§ == 0)
                  {
                     this.§#T§ = _loc4_.y - _loc2_;
                  }
                  if(this.§#T§ != 0)
                  {
                     this.§;<§ = _loc3_;
                  }
               }
            }
            _loc3_++;
         }
         _loc3_ = 0;
         while(_loc3_ < mc.container.numChildren)
         {
            _loc4_ = mc.container.getChildAt(_loc3_) as decalBtn;
            if(_loc4_)
            {
               mc.container.removeChildAt(_loc3_);
               _loc3_--;
            }
            _loc3_++;
         }
      }
      
      private function §>!§() : void
      {
         var _loc2_:§<C§ = null;
         var _loc3_:MovieClip = null;
         var _loc4_:decalBtn = null;
         this.§+N§ = new Vector.<decalBtn>();
         var _loc1_:int = 0;
         while(_loc1_ < §?V§.instance.§%5§.§'"§.length)
         {
            _loc2_ = §?V§.instance.§%5§.§'"§[_loc1_];
            _loc3_ = new AllDecals();
            _loc3_.gotoAndStop(_loc2_.§0Y§);
            _loc4_ = new decalBtn();
            mc.container.addChild(_loc4_);
            this.§+N§.push(_loc4_);
            _loc4_.x = this.§=F§ + _loc1_ % this.§;<§ * this.§0L§;
            _loc4_.y = this.§!A§ + int(_loc1_ / this.§;<§) * this.§#T§;
            _loc4_.tooltip = _loc2_.name;
            _loc4_.cost_txt.text = String(_loc2_.cost);
            _loc4_.extra = _loc2_;
            _loc3_.scaleX = 2.4;
            _loc3_.scaleY = 2.4;
            _loc4_.holder_mc.addChild(_loc3_);
            _loc4_.check.visible = false;
            _loc4_.click = this.§6M§;
            _loc1_++;
         }
         this.§++§.SetScrollableObject(mc.container,mc.button_mask);
      }
      
      private function §%>§() : void
      {
         var _loc2_:decalBtn = null;
         var _loc1_:int = 0;
         while(_loc1_ < this.§+N§.length)
         {
            _loc2_ = this.§+N§[_loc1_];
            if(this.profila.isDecalUnlocked(_loc2_.extra.id) == true)
            {
               _loc2_.valid = true;
               _loc2_.check.visible = true;
               _loc2_.bought.visible = true;
               _loc2_.medal.visible = false;
               _loc2_.cost_txt.text = "Owned";
            }
            else
            {
               if(_loc2_.extra.cost > this.profila.medallions)
               {
                  _loc2_.valid = false;
               }
               else
               {
                  _loc2_.valid = true;
               }
               _loc2_.check.visible = false;
               _loc2_.bought.visible = false;
               _loc2_.medal.visible = true;
               _loc2_.cost_txt.text = _loc2_.extra.cost;
            }
            _loc1_++;
         }
      }
      
      private function §6M§(param1:Event) : void
      {
         var _loc2_:decalBtn = decalBtn(param1.target);
         if(_loc2_.check.visible == true)
         {
            if(_loc2_.check.checked == true)
            {
               this.profila.setActiveDecal(0);
               _loc2_.check.checked = false;
            }
            else
            {
               this.profila.setActiveDecal(_loc2_.extra.id);
               this.§6?§();
            }
         }
         else if(this.profila.medallions >= _loc2_.extra.cost)
         {
            this.§ 8§ = _loc2_;
            §&K§.instance.§>1§.show({
               "yesFunction":this.§]N§,
               "msg":"Purchase this bloon decal for " + _loc2_.extra.cost + " Medallions?"
            });
         }
      }
      
      private function §]N§() : void
      {
         §&K§.instance.§>1§.§&1§();
         this.profila.SigMedallionsChanged().add(this.§!>§);
         MyNK.ey.user.buyCurrencyItems([[this.§ 8§.extra.currencyID,1]]);
      }
      
      private function §!>§(param1:int) : void
      {
         this.profila.SigMedallionsChanged().remove(this.§!>§);
         this.profila.unlockDecal(this.§ 8§.extra.id);
         this.§%>§();
         this.profila.setActiveDecal(this.§ 8§.extra.id);
         this.§6?§();
         §&K§.instance.§>1§.hide();
      }
      
      private function §6?§() : void
      {
         var _loc2_:decalBtn = null;
         var _loc1_:int = 0;
         while(_loc1_ < this.§+N§.length)
         {
            _loc2_ = this.§+N§[_loc1_];
            _loc2_.check.checked = false;
            if(_loc2_.extra.id == this.profila.activeDecal)
            {
               _loc2_.check.checked = true;
            }
            _loc1_++;
         }
      }
   }
}

