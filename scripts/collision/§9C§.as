package collision
{
   import §+C§.§0>§;
   import §8U§.§4&§;
   import §8U§.§52§;
   import §;M§.§&F§;
   import bloons.Bloon;
   import projectiles.Projectile;
   import towers.Tower;
   import utils.Pool;
   
   public class §9C§ implements §&F§
   {
      
      public static const §'§:Number = 40;
      
      public static const §;D§:Number = -60;
      
      public var §]C§:int = 0;
      
      public var §;<§:int = 0;
      
      public var §65§:Vector.<Vector.<Bloon>> = new Vector.<Vector.<Bloon>>();
      
      public var §=?§:Vector.<Vector.<Vector.<Bloon>>> = new Vector.<Vector.<Vector.<Bloon>>>();
      
      private var levelSlug:§0>§ = null;
      
      private var u:§52§ = new §52§();
      
      private var v:§52§ = new §52§();
      
      private var c:§52§ = new §52§();
      
      private var §>E§:§52§ = new §52§();
      
      public function §9C§()
      {
         var _loc2_:int = 0;
         var _loc3_:Vector.<Vector.<Bloon>> = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:Boolean = false;
         var _loc9_:Boolean = false;
         var _loc10_:Boolean = false;
         var _loc11_:Boolean = false;
         super();
         while(§'§ * this.§;<§ < §?V§.§-?§.width - (§;D§ + §;D§))
         {
            ++this.§;<§;
         }
         while(§'§ * this.§]C§ < §?V§.§-?§.height - (§;D§ + §;D§))
         {
            ++this.§]C§;
         }
         while(this.§65§.length < this.§;<§ * this.§]C§)
         {
            this.§65§.push(new Vector.<Bloon>());
         }
         var _loc1_:int = 0;
         while(_loc1_ < this.§]C§)
         {
            _loc2_ = 0;
            while(_loc2_ < this.§;<§)
            {
               _loc3_ = new Vector.<Vector.<Bloon>>();
               _loc4_ = _loc1_ - 1;
               _loc5_ = _loc1_ + 1;
               _loc6_ = _loc2_ - 1;
               _loc7_ = _loc2_ + 1;
               _loc8_ = _loc4_ >= 0;
               _loc9_ = _loc5_ < this.§]C§;
               _loc10_ = _loc6_ >= 0;
               _loc11_ = _loc7_ < this.§;<§;
               if(_loc8_)
               {
                  if(_loc10_)
                  {
                     _loc3_.push(this.§65§[_loc6_ + _loc4_ * this.§;<§]);
                  }
                  _loc3_.push(this.§65§[_loc2_ + _loc4_ * this.§;<§]);
                  if(_loc11_)
                  {
                     _loc3_.push(this.§65§[_loc7_ + _loc4_ * this.§;<§]);
                  }
               }
               if(_loc10_)
               {
                  _loc3_.push(this.§65§[_loc6_ + _loc1_ * this.§;<§]);
               }
               _loc3_.push(this.§65§[_loc2_ + _loc1_ * this.§;<§]);
               if(_loc11_)
               {
                  _loc3_.push(this.§65§[_loc7_ + _loc1_ * this.§;<§]);
               }
               if(_loc9_)
               {
                  if(_loc10_)
                  {
                     _loc3_.push(this.§65§[_loc6_ + _loc5_ * this.§;<§]);
                  }
                  _loc3_.push(this.§65§[_loc2_ + _loc5_ * this.§;<§]);
                  if(_loc11_)
                  {
                     _loc3_.push(this.§65§[_loc7_ + _loc5_ * this.§;<§]);
                  }
               }
               this.§=?§.push(_loc3_);
               _loc2_++;
            }
            _loc1_++;
         }
      }
      
      public function §,B§(param1:§0>§) : void
      {
         this.levelSlug = param1;
      }
      
      public function clear() : void
      {
         var _loc1_:Vector.<Bloon> = null;
         for each(_loc1_ in this.§65§)
         {
            _loc1_.splice(0,_loc1_.length);
         }
      }
      
      public function §1V§(param1:Number, param2:Number) : int
      {
         var _loc3_:int = Math.floor((param1 - §;D§) / §'§);
         var _loc4_:int = Math.floor((param2 - §;D§) / §'§);
         if(_loc3_ < 0 || _loc3_ >= this.§;<§ || _loc4_ < 0 || _loc4_ >= this.§]C§)
         {
            return -1;
         }
         return _loc4_ * this.§;<§ + _loc3_;
      }
      
      public function §%G§(param1:Number, param2:Number) : Vector.<Vector.<Bloon>>
      {
         var _loc3_:int = this.§1V§(param1,param2);
         if(_loc3_ >= 0 && _loc3_ < this.§=?§.length)
         {
            return this.§=?§[_loc3_];
         }
         return new Vector.<Vector.<Bloon>>();
      }
      
      public function §];§(param1:Bloon, param2:int) : void
      {
         var _loc3_:Vector.<Bloon> = null;
         if(param2 != -1)
         {
            if(param1.type < Bloon.MOAB)
            {
               this.§65§[param2].push(param1);
               param1.§8C§ = false;
            }
            else
            {
               for each(_loc3_ in this.§=?§[param2])
               {
                  _loc3_.push(param1);
               }
               param1.§8C§ = true;
            }
         }
      }
      
      public function § @§(param1:Bloon, param2:int) : void
      {
         var _loc3_:Vector.<Bloon> = null;
         var _loc4_:int = 0;
         if(param2 != -1)
         {
            if(!param1.§8C§)
            {
               this.§65§[param2].splice(this.§65§[param2].indexOf(param1),1);
            }
            else
            {
               for each(_loc3_ in this.§=?§[param2])
               {
                  _loc4_ = _loc3_.indexOf(param1);
                  if(_loc4_ != -1)
                  {
                     _loc3_.splice(_loc4_,1);
                  }
               }
            }
         }
      }
      
      public function §`L§(param1:Bloon, param2:int, param3:int) : void
      {
         if(param2 != -1)
         {
            this.§ @§(param1,param2);
         }
         if(param3 != -1)
         {
            this.§];§(param1,param3);
         }
      }
      
      public function §`5§(param1:Number, param2:Number, param3:Number) : Vector.<Vector.<Bloon>>
      {
         var _loc10_:int = 0;
         if(param3 > 999)
         {
            return this.§65§.slice();
         }
         var _loc4_:int = Math.max(Math.floor((param2 - param3 - §;D§) / §'§),0);
         var _loc5_:int = Math.min(Math.floor((param2 + param3 - §;D§) / §'§),this.§]C§ - 1);
         var _loc6_:int = Math.max(Math.floor((param1 - param3 - §;D§) / §'§),0);
         var _loc7_:int = Math.min(Math.floor((param1 + param3 - §;D§) / §'§),this.§;<§ - 1);
         var _loc8_:Vector.<Vector.<Bloon>> = new Vector.<Vector.<Bloon>>();
         var _loc9_:int = _loc6_;
         while(_loc9_ <= _loc7_)
         {
            _loc10_ = _loc4_;
            while(_loc10_ <= _loc5_)
            {
               if(param1 - param3 < _loc9_ * §'§ + §;D§ && param1 + param3 > _loc9_ * §'§ + §;D§ + §'§ && param2 - param3 < _loc10_ * §'§ + §;D§ && param2 + param3 > _loc10_ * §'§ + §;D§ + §'§)
               {
                  _loc8_.push(this.§65§[_loc10_ * this.§;<§ + _loc9_]);
               }
               else if(§4&§.§"'§(param1,param2,param3,_loc9_ * §'§ + §;D§,_loc10_ * §'§ + §;D§,§'§,§'§))
               {
                  _loc8_.push(this.§65§[_loc10_ * this.§;<§ + _loc9_]);
               }
               _loc10_++;
            }
            _loc9_++;
         }
         return _loc8_;
      }
      
      public function §,7§(param1:Tower) : void
      {
         if(param1 == null || param1.def == null)
         {
            return;
         }
         param1.§]F§ = this.§`5§(param1.x,param1.y,param1.def.rangeOfVisibility);
      }
      
      public function §^3§(param1:Tower) : void
      {
         param1.§]F§.splice(0,param1.§]F§.length);
      }
      
      public function process(param1:Number) : void
      {
         this.§&T§(param1);
      }
      
      public function §["§(param1:Tower) : void
      {
         var _loc3_:Vector.<Bloon> = null;
         param1.§+A§.splice(0,param1.§+A§.length);
         if(this.levelSlug.allBloons.length == 0)
         {
            return;
         }
         var _loc2_:§52§ = Pool.get(§52§);
         _loc2_.x = param1.x;
         _loc2_.y = param1.y;
         for each(_loc3_ in param1.§]F§)
         {
            if(_loc3_.length > 0)
            {
               this.§%P§(_loc2_,param1.def.rangeOfVisibility,param1.targetMask,param1.§+A§,_loc3_);
            }
         }
         this.§]W§(param1.§+4§,param1.§+A§,_loc2_);
         Pool.release(_loc2_);
      }
      
      private function §%P§(param1:§52§, param2:Number, param3:int, param4:Vector.<Bloon>, param5:Vector.<Bloon>) : void
      {
         var _loc6_:Bloon = null;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         for each(_loc6_ in param5)
         {
            if(int(param3 & _loc6_.§1<§) == 0)
            {
               if(_loc6_.type != -1)
               {
                  if(!_loc6_.§ !§)
                  {
                     if(param2 >= 1200)
                     {
                        param4.push(_loc6_);
                     }
                     else
                     {
                        _loc7_ = param1.x - _loc6_.x;
                        _loc8_ = param1.y - _loc6_.y;
                        _loc9_ = _loc7_ * _loc7_ + _loc8_ * _loc8_;
                        _loc10_ = param2 + _loc6_.§;-§;
                        _loc11_ = _loc10_ * _loc10_;
                        if(_loc9_ <= _loc11_)
                        {
                           param4.push(_loc6_);
                        }
                     }
                  }
               }
            }
         }
      }
      
      private function §]W§(param1:int, param2:Vector.<Bloon>, param3:§52§) : void
      {
         switch(param1)
         {
            case Tower.§'V§:
               param2.sort(this.§;4§);
               break;
            case Tower.§#F§:
               param2.sort(this.§!2§);
               break;
            case Tower.§%$§:
               this.§>E§.x = param3.x;
               this.§>E§.y = param3.y;
               param2.sort(this.§5&§);
               break;
            case Tower.§8T§:
               param2.sort(this.§4V§);
         }
      }
      
      private function §&T§(param1:Number) : void
      {
         var _loc2_:Projectile = null;
         var _loc3_:Vector.<Vector.<Bloon>> = null;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:Bloon = null;
         for each(_loc2_ in this.levelSlug.§,>§)
         {
            if(!(_loc2_.def == null || _loc2_.pierce <= 0 || _loc2_.effectMask == Bloon.§6%§))
            {
               _loc4_ = _loc2_.def.radius;
               _loc5_ = _loc2_.§#J§.§!X§;
               if(_loc2_.§3H§)
               {
                  if(_loc2_.§ S§ == null)
                  {
                     _loc2_.§ S§ = this.§`5§(_loc2_.x,_loc2_.y,_loc4_);
                  }
                  _loc3_ = _loc2_.§ S§;
               }
               else if(_loc4_ < 11)
               {
                  if(§?V§.instance.§"0§.§+O§ > 35)
                  {
                     _loc3_ = new Vector.<Vector.<Bloon>>();
                     _loc7_ = this.§1V§(_loc2_.x,_loc2_.y);
                     if(_loc7_ != -1)
                     {
                        _loc3_.push(this.§65§[_loc7_]);
                     }
                     _loc8_ = this.§1V§(_loc2_.x + _loc2_.§#J§.x,_loc2_.y + _loc2_.§#J§.y);
                     if(_loc8_ != -1 && _loc8_ != _loc7_)
                     {
                        _loc3_.push(this.§65§[_loc8_]);
                     }
                  }
                  else
                  {
                     _loc3_ = this.§%G§(_loc2_.x,_loc2_.y);
                  }
               }
               else
               {
                  _loc3_ = this.§`5§(_loc2_.x,_loc2_.y,_loc4_);
               }
               _loc6_ = 0;
               while(_loc6_ < _loc3_.length)
               {
                  for each(_loc9_ in _loc3_[_loc6_])
                  {
                     if(_loc9_.type != -1)
                     {
                        if(int(_loc2_.effectMask & _loc9_.§1<§) == 0)
                        {
                           if(!_loc9_.§ !§)
                           {
                              if(!_loc9_.§[Q§(_loc2_))
                              {
                                 this.u.x = _loc2_.x;
                                 this.u.y = _loc2_.y;
                                 this.v.x = _loc2_.§#J§.x * param1;
                                 this.v.y = _loc2_.§#J§.y * param1;
                                 this.c.x = _loc9_.x;
                                 this.c.y = _loc9_.y;
                                 if(§4&§.§#O§(this.u,_loc4_ + _loc5_,this.c,_loc9_.radius))
                                 {
                                    if(§4&§.§#O§(this.u,_loc4_,this.c,_loc9_.radius) || §4&§.§#D§(this.u,this.v,this.c,_loc9_.radius))
                                    {
                                       _loc9_.§99§(_loc2_);
                                       _loc2_.§99§();
                                       if(_loc2_.pierce <= 0 || _loc2_.def == null)
                                       {
                                          break;
                                       }
                                    }
                                 }
                              }
                           }
                        }
                     }
                  }
                  if(_loc2_.pierce <= 0 || _loc2_.def == null)
                  {
                     break;
                  }
                  _loc6_++;
               }
            }
         }
      }
      
      public function §^§(param1:Projectile, param2:Number, param3:int) : Bloon
      {
         var _loc7_:Bloon = null;
         var _loc4_:Vector.<Bloon> = new Vector.<Bloon>();
         var _loc5_:Vector.<Vector.<Bloon>> = this.§`5§(param1.x,param1.y,param2);
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_.length)
         {
            for each(_loc7_ in _loc5_[_loc6_])
            {
               if(_loc7_.type != -1)
               {
                  if(int(param1.effectMask & _loc7_.§1<§) == 0)
                  {
                     if(!_loc7_.§ !§)
                     {
                        if(!_loc7_.§[Q§(param1))
                        {
                           _loc4_.push(_loc7_);
                        }
                     }
                  }
               }
            }
            _loc6_++;
         }
         this.v.x = param1.x;
         this.v.y = param1.y;
         this.§]W§(param3,_loc4_,this.v);
         if(_loc4_.length == 0)
         {
            return null;
         }
         return _loc4_[_loc4_.length - 1];
      }
      
      public function §3=§(param1:Projectile, param2:Number, param3:int, param4:Number) : Bloon
      {
         var _loc10_:Bloon = null;
         var _loc11_:Number = NaN;
         var _loc5_:Vector.<Bloon> = new Vector.<Bloon>();
         var _loc6_:Vector.<Vector.<Bloon>> = this.§`5§(param1.x,param1.y,param2);
         var _loc7_:Number = 999999999;
         var _loc8_:Bloon = null;
         var _loc9_:int = 0;
         while(_loc9_ < _loc6_.length)
         {
            for each(_loc10_ in _loc6_[_loc9_])
            {
               if(_loc10_.type != -1)
               {
                  if(int(param1.effectMask & _loc10_.§1<§) == 0)
                  {
                     if(!_loc10_.§ !§)
                     {
                        if(!_loc10_.§[Q§(param1))
                        {
                           this.v.x = _loc10_.x - param1.x;
                           this.v.y = _loc10_.y - param1.y;
                           if(this.v.§6T§() < _loc7_)
                           {
                              _loc11_ = param1.§#J§.§^1§(this.v);
                              if(Math.abs(_loc11_) <= param4)
                              {
                                 _loc7_ = this.v.§6T§();
                                 _loc8_ = _loc10_;
                              }
                           }
                        }
                     }
                  }
               }
            }
            _loc9_++;
         }
         return _loc8_;
      }
      
      public function §9B§(param1:§52§, param2:Number, param3:int, param4:int, param5:Vector.<Bloon> = null) : Vector.<Bloon>
      {
         var _loc9_:Bloon = null;
         var _loc6_:Vector.<Bloon> = new Vector.<Bloon>();
         var _loc7_:Vector.<Vector.<Bloon>> = this.§`5§(param1.x,param1.y,param2);
         var _loc8_:int = 0;
         while(_loc8_ < _loc7_.length)
         {
            for each(_loc9_ in _loc7_[_loc8_])
            {
               if(_loc9_.type != -1)
               {
                  if(int(param3 & _loc9_.§1<§) == 0)
                  {
                     if(!_loc9_.§ !§)
                     {
                        if(!(Boolean(param5) && param5.indexOf(_loc9_) != -1))
                        {
                           _loc6_.push(_loc9_);
                        }
                     }
                  }
               }
            }
            _loc8_++;
         }
         this.v.x = param1.x;
         this.v.y = param1.y;
         this.§]W§(param4,_loc6_,this.v);
         return _loc6_;
      }
      
      private function §;4§(param1:Bloon, param2:Bloon) : int
      {
         if(param1.§]4§() < param2.§]4§())
         {
            return 1;
         }
         return -1;
      }
      
      private function §!2§(param1:Bloon, param2:Bloon) : int
      {
         if(param1.§&E§() < param2.§&E§())
         {
            return 1;
         }
         return -1;
      }
      
      private function §5&§(param1:Bloon, param2:Bloon) : int
      {
         var _loc3_:Number = this.§>E§.x - param1.x;
         var _loc4_:Number = this.§>E§.y - param1.y;
         var _loc5_:Number = _loc3_ * _loc3_ + _loc4_ * _loc4_;
         _loc3_ = this.§>E§.x - param2.x;
         _loc4_ = this.§>E§.y - param2.y;
         var _loc6_:Number = _loc3_ * _loc3_ + _loc4_ * _loc4_;
         if(_loc5_ > _loc6_)
         {
            return -1;
         }
         return 1;
      }
      
      private function §4V§(param1:Bloon, param2:Bloon) : int
      {
         if(param1.type > param2.type)
         {
            return 1;
         }
         if(param2.type > param1.type)
         {
            return -1;
         }
         if(param1.§#+§ > param2.§#+§)
         {
            return 1;
         }
         if(param2.§#+§ > param1.§#+§)
         {
            return -1;
         }
         if(param1.overallProgress > param2.overallProgress)
         {
            return 1;
         }
         return -1;
      }
      
      private function §]!§(param1:Bloon) : int
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.§65§.length)
         {
            if(this.§65§[_loc2_].indexOf(param1) != -1)
            {
               return _loc2_;
            }
            _loc2_++;
         }
         return -1;
      }
   }
}

