package §8K§
{
   import abilities.def.AbilityDef;
   import assets.gui.AbilityBtn;
   import display.ui.Button;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.utils.Dictionary;
   import towers.Tower;
   
   public class §@<§
   {
      
      internal var container:MovieClip;
      
      internal var §6§:Dictionary;
      
      internal var §;;§:Dictionary;
      
      internal var §&W§:Dictionary;
      
      public function §@<§()
      {
         super();
      }
      
      public function §,B§(param1:MovieClip) : void
      {
         this.container = param1;
      }
      
      public function §6+§(param1:Vector.<Tower>) : void
      {
         this.reset();
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            this.addTower(param1[_loc2_]);
            _loc2_++;
         }
      }
      
      public function reset() : void
      {
         while(this.container.numChildren > 0)
         {
            this.container.removeChildAt(0);
         }
         this.§6§ = new Dictionary();
         this.§;;§ = new Dictionary();
         this.§&W§ = new Dictionary();
      }
      
      public function addTower(param1:Tower) : void
      {
         var _loc2_:int = 0;
         var _loc3_:AbilityDef = null;
         var _loc4_:§#E§ = null;
         var _loc5_:MovieClip = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         if(this.§6§ == null)
         {
            return;
         }
         if(param1.def.abilities)
         {
            _loc2_ = 0;
            while(_loc2_ < param1.def.abilities.length)
            {
               _loc3_ = param1.def.abilities[_loc2_];
               if(this.§6§[param1] == null)
               {
                  this.§6§[param1] = new Dictionary();
               }
               if(this.§6§[param1][_loc3_.id] == null)
               {
                  _loc4_ = new §#E§();
                  _loc4_.§;8§ = _loc3_;
                  _loc4_.tower = param1;
                  _loc4_.button = new AbilityBtn();
                  _loc4_.button.tooltip = "<font color=\'#EDE2D5\' face=\'Oetztype\'>" + _loc3_.label + "</font>\n" + _loc3_.description;
                  _loc4_.button.extra = _loc4_;
                  _loc4_.button.click = this.§"U§;
                  _loc5_ = new _loc3_.thumb();
                  _loc5_.stop();
                  _loc4_.button.holder_mc.addChild(_loc5_);
                  _loc4_.button.qty_txt.text = "";
                  this.container.addChild(_loc4_.button);
                  _loc4_.timer = param1.§,N§(_loc3_);
                  this.§6§[param1][_loc3_.id] = _loc4_;
                  if(this.§;;§[_loc3_.id] != null)
                  {
                     _loc4_.button.x = this.§;;§[_loc3_.id];
                     this.§&W§[_loc3_.id] += 1;
                  }
                  else
                  {
                     _loc6_ = 0;
                     for each(_loc7_ in this.§;;§)
                     {
                        _loc6_++;
                     }
                     this.§;;§[_loc3_.id] = 10 + _loc6_ * 34;
                     _loc4_.button.x = this.§;;§[_loc3_.id];
                     this.§&W§[_loc3_.id] = 1;
                  }
               }
               _loc2_++;
            }
            this.§4M§();
         }
      }
      
      public function removeTower(param1:Tower) : void
      {
         var _loc2_:int = 0;
         var _loc3_:AbilityDef = null;
         var _loc4_:int = 0;
         var _loc5_:String = null;
         var _loc6_:Dictionary = null;
         var _loc7_:§#E§ = null;
         if(param1.def.abilities)
         {
            _loc2_ = 0;
            while(_loc2_ < param1.def.abilities.length)
            {
               _loc3_ = param1.def.abilities[_loc2_];
               if(this.§6§[param1][_loc3_.id] != null)
               {
                  this.container.removeChild(this.§6§[param1][_loc3_.id].button);
                  delete this.§6§[param1][_loc3_.id];
                  this.§&W§[_loc3_.id] = this.§&W§[_loc3_.id] - 1;
                  if(this.§&W§[_loc3_.id] == 0)
                  {
                     delete this.§&W§[_loc3_.id];
                     _loc4_ = int(this.§;;§[_loc3_.id]);
                     delete this.§;;§[_loc3_.id];
                     for(_loc5_ in this.§;;§)
                     {
                        if(this.§;;§[_loc5_] > _loc4_)
                        {
                           this.§;;§[_loc5_] -= 34;
                        }
                     }
                     for each(_loc6_ in this.§6§)
                     {
                        for each(_loc7_ in _loc6_)
                        {
                           _loc7_.button.x = this.§;;§[_loc7_.§;8§.id];
                        }
                     }
                  }
               }
               _loc2_++;
            }
         }
      }
      
      public function §%>§() : void
      {
         var _loc2_:Dictionary = null;
         var _loc3_:§#E§ = null;
         var _loc4_:Object = null;
         var _loc1_:Dictionary = new Dictionary();
         for each(_loc2_ in this.§6§)
         {
            for each(_loc3_ in _loc2_)
            {
               if(_loc1_[_loc3_.§;8§.id] == null)
               {
                  _loc1_[_loc3_.§;8§.id] = {
                     "count":(_loc3_.timer.running ? 0 : 1),
                     "current":_loc3_
                  };
               }
               else
               {
                  _loc4_ = _loc1_[_loc3_.§;8§.id];
                  _loc4_.count += _loc3_.timer.running ? 0 : 1;
                  if(_loc4_.current.timer.running == true && (_loc3_.timer.running == false || _loc3_.timer.current > _loc4_.current.timer.current))
                  {
                     _loc4_.current = _loc3_;
                  }
               }
            }
         }
         for each(_loc4_ in _loc1_)
         {
            this.container.addChild(_loc4_.current.button);
            if(_loc4_.count > 1)
            {
               _loc4_.current.button.qty_txt.text = _loc4_.count;
            }
            else
            {
               _loc4_.current.button.qty_txt.text = "";
            }
         }
      }
      
      public function §4M§() : void
      {
         var _loc1_:Dictionary = null;
         var _loc2_:§#E§ = null;
         var _loc3_:Number = NaN;
         this.§%>§();
         for each(_loc1_ in this.§6§)
         {
            for each(_loc2_ in _loc1_)
            {
               _loc2_.button.valid = _loc2_.timer.running == false;
               if(_loc2_.timer.running == true)
               {
                  _loc3_ = _loc2_.timer.current / _loc2_.timer.delay;
                  _loc2_.button.coolDown_mc.gotoAndStop(int(_loc3_ * (_loc2_.button.coolDown_mc.totalFrames - 1)) + 1);
               }
            }
         }
      }
      
      public function §&1§() : void
      {
         var _loc1_:Dictionary = null;
         var _loc2_:§#E§ = null;
         for each(_loc1_ in this.§6§)
         {
            for each(_loc2_ in _loc1_)
            {
               _loc2_.button.valid = false;
            }
         }
      }
      
      public function §"U§(param1:Event) : void
      {
         var _loc2_:§#E§ = §#E§(Button(param1.target).extra);
         _loc2_.tower.levelSlug.§6@§(_loc2_.tower,_loc2_.§;8§.id);
      }
      
      public function set x(param1:Number) : void
      {
         this.container.x = param1;
      }
   }
}

