package §+C§
{
   import § ,§.TerrainSet;
   import §"?§.§9X§;
   import §8$§.§7;§;
   import §8U§.§52§;
   import §;M§.§-!§;
   import §>@§.§-A§;
   import §>@§.§<<§;
   import assets.sounds.Place;
   import assets.sounds.Sell;
   import bloons.Bloon;
   import collision.§9C§;
   import entities.§^H§;
   import entities.§^X§;
   import events.BloonEvent;
   import events.LevelEvent;
   import events.TowerChangedEvent;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.geom.Rectangle;
   import flash.utils.getDefinitionByName;
   import flash.utils.getQualifiedClassName;
   import game.§-3§;
   import game.§6$§;
   import game.§9=§;
   import game.BloonSendDef;
   import levels.rounds.§9"§;
   import org.osflash.signals.Signal;
   import projectiles.Projectile;
   import sound.§^5§;
   import towers.§7I§;
   import towers.Tower;
   import towers.behavior.initialise.DeployMonkeyAce;
   import towers.def.AreaEffectDef;
   import towers.def.TowerDef;
   import utils.Pool;
   import utils.Rndm;
   
   public class §0>§ extends §-!§
   {
      
      public var §#+§:§<<§ = §-A§.§]H§();
      
      public var cash:§<<§ = §-A§.§]H§();
      
      private var § '§:TerrainSet;
      
      private var §1'§:Vector.<§52§>;
      
      public var §28§:§7;§;
      
      public var §7<§:Vector.<§7;§>;
      
      public var §&B§:§7;§;
      
      public var §1I§:Vector.<§7;§>;
      
      public var §+#§:§9"§;
      
      public var §%Y§:§9C§ = new §9C§();
      
      public var §?0§:Vector.<Tower> = new Vector.<Tower>();
      
      public var allBloons:Vector.<Bloon> = new Vector.<Bloon>();
      
      public var §9$§:Vector.<Bloon> = new Vector.<Bloon>();
      
      public var §,>§:Vector.<Projectile> = new Vector.<Projectile>();
      
      public var §5+§:§9X§ = null;
      
      private var §"0§:§6$§ = null;
      
      public var §#1§:int = -1;
      
      private var §`<§:Vector.<Class> = new Vector.<Class>();
      
      public var §4O§:Vector.<§-3§> = new Vector.<§-3§>();
      
      public var §]§:Boolean = false;
      
      public var §3V§:int = 0;
      
      public var §1§:Rectangle;
      
      public var §<A§:Signal = new Signal();
      
      public var §<$§:Signal = new Signal();
      
      public var §=#§:Signal = new Signal();
      
      public var §-K§:Signal = new Signal();
      
      public var §,§:Signal = new Signal();
      
      public var §`9§:Signal = new Signal();
      
      public var §^=§:Signal = new Signal();
      
      public var §83§:Signal = new Signal();
      
      public var §!T§:Signal = new Signal();
      
      public var §`U§:Signal = new Signal();
      
      public var §"B§:Signal = new Signal();
      
      public var §4B§:Signal = new Signal();
      
      public var §%B§:Signal = new Signal();
      
      private var §?C§:int = 4;
      
      private var §="§:§^5§ = new §^5§(Place);
      
      public var §4$§:§^5§ = new §^5§(Sell);
      
      public function §0>§()
      {
         super();
      }
      
      public function get §',§() : int
      {
         return this.§?C§;
      }
      
      public function set §',§(param1:int) : void
      {
         this.§?C§ = param1;
      }
      
      public function §0K§() : TerrainSet
      {
         return this.§ '§;
      }
      
      public function §,B§(param1:§6$§, param2:§9X§, param3:int) : void
      {
         var _loc4_:§7;§ = null;
         this.§',§ = 4;
         this.§"0§ = param1;
         this.§5+§ = param2;
         this.§#1§ = param3;
         if(param3 == 0)
         {
            this.§1§ = new Rectangle(§?V§.§0U§.x,§?V§.§0U§.y,§?V§.§0U§.width / 2,§?V§.§0U§.height);
         }
         else
         {
            this.§1§ = new Rectangle(§?V§.§0U§.width / 2,§?V§.§0U§.y,§?V§.§0U§.width / 2,§?V§.§0U§.height);
         }
         this.§%Y§.§,B§(this);
         this.§?!§();
         this.§]§ = false;
         this.§3V§ = 0;
         this.§[I§(param3);
         this.§ '§ = new TerrainSet(param2.§`+§[param3]);
         this.§7<§ = param2.§'T§[param3];
         this.§1I§ = param2.§[X§[param3];
         for each(_loc4_ in this.§7<§)
         {
            _loc4_.initialise(this.§7<§);
         }
         for each(_loc4_ in this.§1I§)
         {
            _loc4_.initialise(this.§1I§);
         }
         this.§28§ = this.§7<§[0];
         this.§&B§ = this.§1I§[0];
         this.§+#§ = new §9"§(this);
         this.§+#§.§3,§ = §?V§.instance.§%-§.rounds;
         § J§(this.§+#§);
         this.§4O§ = new Vector.<§-3§>();
      }
      
      protected function §[I§(param1:int) : void
      {
         var _loc3_:int = 0;
         var _loc4_:DisplayObject = null;
         var _loc5_:String = null;
         var _loc6_:§^X§ = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:DisplayObject = null;
         var _loc10_:String = null;
         var _loc2_:MovieClip = new this.§5+§.§"§[param1]();
         if(_loc2_.bottom)
         {
            _loc3_ = 0;
            while(_loc3_ < _loc2_.bottom.numChildren)
            {
               _loc4_ = _loc2_.bottom.getChildAt(_loc3_);
               _loc5_ = getQualifiedClassName(_loc4_);
               if(!(_loc5_ == "flash.display::Shape" || _loc5_ == "flash.display::MovieClip"))
               {
                  _loc6_ = new §^X§(_loc4_.name);
                  if(_loc4_.name.indexOf("layer") != -1 || _loc4_.name.indexOf("Layer") != -1)
                  {
                     _loc7_ = int(_loc4_.name.slice(5));
                     _loc7_ = -_loc7_;
                     _loc6_.initialise(getDefinitionByName(_loc5_) as Class,_loc7_,0);
                  }
                  else
                  {
                     _loc6_.initialise(getDefinitionByName(_loc5_) as Class,-999 + _loc3_ * 0.001,0);
                  }
                  _loc6_.rotation = _loc4_.rotation / 180 * Math.PI;
                  _loc6_.x = _loc4_.x;
                  _loc6_.y = _loc4_.y;
                  §?3§(_loc6_);
                  this.§`<§.push(Class(getDefinitionByName(_loc5_)));
               }
               _loc3_++;
            }
         }
         if(_loc2_.top)
         {
            _loc8_ = 0;
            while(_loc8_ < _loc2_.top.numChildren)
            {
               _loc9_ = _loc2_.top.getChildAt(_loc8_);
               _loc10_ = getQualifiedClassName(_loc9_);
               if(!(_loc10_ == "flash.display::Shape" || _loc10_ == "flash.display::MovieClip"))
               {
                  _loc6_ = new §^X§(_loc9_.name);
                  _loc6_.initialise(getDefinitionByName(_loc10_) as Class,999 + _loc8_ * 0.001,0);
                  _loc6_.x = _loc9_.x;
                  _loc6_.y = _loc9_.y;
                  _loc6_.rotation = _loc9_.rotation / 180 * Math.PI;
                  §?3§(_loc6_);
                  this.§`<§.push(Class(getDefinitionByName(_loc5_)));
               }
               _loc8_++;
            }
         }
      }
      
      public function §<E§() : void
      {
         var _loc2_:Class = null;
         var _loc3_:Tower = null;
         var _loc4_:Projectile = null;
         var _loc1_:int = int(this.§?0§.length - 1);
         while(_loc1_ >= 0)
         {
            _loc3_ = this.§?0§[_loc1_];
            _loc3_.destroy();
            _loc1_--;
         }
         this.§<@§();
         this.§%Y§.clear();
         _loc1_ = int(this.§,>§.length - 1);
         while(_loc1_ >= 0)
         {
            _loc4_ = this.§,>§[_loc1_];
            _loc4_.destroy();
            _loc1_--;
         }
         this.§ '§ = null;
         this.§28§ = null;
         this.§7<§ = null;
         this.§&B§ = null;
         this.§1I§ = null;
         if(this.§+#§)
         {
            § D§(this.§+#§);
         }
         this.§+#§ = null;
         this.§?0§.splice(0,this.§?0§.length);
         this.allBloons.splice(0,this.allBloons.length);
         this.§,>§.splice(0,this.§,>§.length);
         for each(_loc2_ in this.§`<§)
         {
            §?V§.instance.§1=§.destroyFrames(_loc2_);
         }
         super.clear();
      }
      
      override public function process(param1:Number) : void
      {
         var _loc2_:§-3§ = null;
         Bloon.§60§ = 0;
         this.§%Y§.process(param1);
         if(this.§4O§.length > 0)
         {
            _loc2_ = this.§4O§[0];
            _loc2_.process(param1);
            if(_loc2_.§,S§())
            {
               this.§4O§.splice(0,1);
               this.§83§.dispatch();
            }
         }
         super.process(param1);
      }
      
      override public function draw(param1:BitmapData) : void
      {
         super.draw(param1);
      }
      
      public function §"6§(param1:int, param2:uint) : void
      {
         this.§+#§.§=W§(param1,param2);
         Bloon.§2+§ = 0;
      }
      
      public function §0=§() : Boolean
      {
         if(this.§+#§ == null)
         {
            return false;
         }
         if(this.§+#§.running)
         {
            return true;
         }
         if(this.§9$§.length == 0)
         {
            return false;
         }
         return true;
      }
      
      public function addBloon(param1:Bloon) : void
      {
         param1.§?"§ = this;
         §?3§(param1);
         this.allBloons.push(param1);
         this.§%Y§.§];§(param1,param1.§>>§);
         if(param1.isPlayerSent == false)
         {
            this.§9$§.push(param1);
         }
         dispatchEvent(new BloonEvent(BloonEvent.ADD,param1));
      }
      
      public function §^,§(param1:Bloon) : void
      {
         var _loc2_:int = int(this.§9$§.indexOf(param1));
         if(_loc2_ != -1)
         {
            this.§9$§.splice(_loc2_,1);
            if(this.§9$§.length == 0)
            {
               this.§<$§.dispatch();
            }
         }
         _loc2_ = int(this.allBloons.indexOf(param1));
         if(_loc2_ != -1)
         {
            this.allBloons.splice(_loc2_,1);
            this.§%Y§.§ @§(param1,param1.§>>§);
            § D§(param1);
            param1.tile = null;
            Bloon.§@§.dispatchEvent(new BloonEvent(BloonEvent.REMOVE,param1));
            Pool.release(param1);
         }
      }
      
      public function §<@§() : void
      {
         var _loc2_:Bloon = null;
         var _loc1_:int = 0;
         while(_loc1_ < this.allBloons.length)
         {
            _loc2_ = this.allBloons[_loc1_];
            this.§%Y§.§ @§(_loc2_,_loc2_.§>>§);
            § D§(_loc2_);
            _loc2_.tile = null;
            Bloon.§@§.dispatchEvent(new BloonEvent(BloonEvent.REMOVE,_loc2_));
            Pool.release(_loc2_);
            _loc1_++;
         }
         this.allBloons = new Vector.<Bloon>();
      }
      
      public function bloonLeaked(param1:Bloon) : void
      {
         this.§!+§(param1.§[&§);
         dispatchEvent(new LevelEvent(LevelEvent.BLOON_LEAKED));
      }
      
      public function §`'§(param1:String, param2:TowerDef, param3:Number, param4:Number, param5:Number, param6:uint) : Tower
      {
         var _loc8_:Vector.<AreaEffectDef> = null;
         var _loc9_:AreaEffectDef = null;
         var _loc7_:Tower = new Tower();
         _loc7_.id = param1;
         _loc7_.x = param3;
         _loc7_.y = param4;
         if(!(param2.id == "Sentry" || param2.id == "SentrySprockets"))
         {
            this.§="§.play();
         }
         if(param2.areaEffects == null)
         {
            _loc8_ = this.§,L§(param3,param4,_loc7_);
            if(_loc8_ != null)
            {
               for each(_loc9_ in _loc8_)
               {
                  if(_loc9_.upgrade != null)
                  {
                     _loc7_.§7+§(_loc9_.upgrade,false);
                  }
               }
            }
         }
         _loc7_.§`!§ = param2.id;
         _loc7_.§0,§ = param2;
         _loc7_.initialise(param2,this);
         _loc7_.rotation = param5;
         _loc7_.§^O§ = new Rndm(param6);
         this.§=#§.dispatch(new §9=§(_loc7_.id,param2.id,param3,param4,param5,param6));
         this.addTower(_loc7_);
         return _loc7_;
      }
      
      public function §&U§(param1:Tower) : void
      {
         this.§-K§.dispatch(param1.id);
         this.removeTower(param1);
         param1.destroy();
         this.§4$§.play();
      }
      
      public function addTower(param1:Tower) : void
      {
         §?3§(param1);
         this.§?0§.push(param1);
         this.§ '§.addTower(param1,this.§?0§);
         this.§%Y§.§,7§(param1);
         this.dispatchEvent(new TowerChangedEvent("TOWER_ADDED",param1));
      }
      
      public function removeTower(param1:Tower) : void
      {
         var _loc2_:int = int(this.§?0§.indexOf(param1));
         if(_loc2_ != -1)
         {
            this.§?0§.splice(_loc2_,1);
            § D§(param1);
            if(param1.def != null && param1.§`!§ != §7I§.§=2§ && param1.§`!§ != §7I§.§5I§)
            {
               this.§ '§.removeTower(param1,this.§?0§);
               this.§%Y§.§^3§(param1);
            }
         }
         if(param1.def.id == "EnergyBeacon" || param1.def.id == "MonkeyTown")
         {
            --this.§3V§;
            this.§%B§.dispatch();
         }
         this.dispatchEvent(new TowerChangedEvent("TOWER_REMOVED",param1));
      }
      
      public function §-T§(param1:Tower, param2:int) : void
      {
         var _loc3_:Boolean = param1.upgradePath(param2);
         if(_loc3_ == false)
         {
            return;
         }
         this.§ U§(param1);
         if(param1.def.id == "MonkeyTown")
         {
            ++this.§3V§;
            this.§%B§.dispatch();
         }
         this.§,§.dispatch(param1.id,param2);
      }
      
      public function § U§(param1:Tower) : void
      {
         if(param1 == null || param1.def == null)
         {
            return;
         }
         this.§%Y§.§^3§(param1);
         this.§%Y§.§,7§(param1);
         if(param1.def.id == §7I§.§'L§)
         {
            this.§ '§.updateTowerMap(this.§?0§);
         }
      }
      
      public function addProjectile(param1:Projectile) : void
      {
         §?3§(param1);
         this.§,>§.push(param1);
      }
      
      public function §7T§(param1:Projectile) : void
      {
         var _loc2_:int = int(this.§,>§.indexOf(param1));
         if(_loc2_ != -1)
         {
            this.§,>§.splice(_loc2_,1);
            § D§(param1);
         }
      }
      
      public function §,D§(param1:MovieClip, param2:Boolean = false, param3:Boolean = false, param4:Boolean = false) : Boolean
      {
         if(param3)
         {
            return this.§ '§.isOnTrack(param1);
         }
         return this.§ '§.canPlace(param1,param2,param4);
      }
      
      public function §!+§(param1:int = 1) : void
      {
         if(this != this.§"0§.§-W§)
         {
            return;
         }
         this.§#+§.value -= param1;
         if(this.§#+§.value < 0)
         {
            this.§#+§.value = 0;
         }
         this.§<A§.dispatch(this.§#+§.value);
      }
      
      public function § W§(param1:int) : void
      {
         if(this.§#+§.value == param1)
         {
            return;
         }
         this.§#+§.value = param1;
         if(this.§#+§.value < 0)
         {
            this.§#+§.value = 0;
         }
         this.§<A§.dispatch(this.§#+§.value);
      }
      
      public function §2#§(param1:Number) : void
      {
         this.cash.value = param1;
         dispatchEvent(new LevelEvent(LevelEvent.CASH_CHANGE));
      }
      
      public function §4>§(param1:Number) : void
      {
         this.cash.value += param1;
         dispatchEvent(new LevelEvent(LevelEvent.CASH_CHANGE));
      }
      
      public function §]3§(param1:Number) : void
      {
         this.cash.value -= param1;
         dispatchEvent(new LevelEvent(LevelEvent.CASH_CHANGE));
      }
      
      public function §7F§(param1:Number) : Boolean
      {
         return param1 <= this.cash.value;
      }
      
      public function § P§(param1:Number, param2:Number, param3:Number, param4:Tower) : int
      {
         var _loc7_:AreaEffectDef = null;
         var _loc5_:Number = param1;
         var _loc6_:Vector.<AreaEffectDef> = this.§,L§(param2,param3,param4);
         if(_loc6_ != null)
         {
            for each(_loc7_ in _loc6_)
            {
               _loc5_ *= _loc7_.costScale;
               if(_loc7_.costScale != 1)
               {
                  break;
               }
            }
         }
         return _loc5_;
      }
      
      public function §?!§() : void
      {
         var _loc3_:int = 0;
         var _loc1_:MovieClip = new this.§5+§.§`+§[this.§#1§]().track;
         this.§1'§ = new Vector.<§52§>();
         §?V§.instance.addChild(_loc1_);
         _loc1_.visible = false;
         var _loc2_:int = this.§1§.x;
         while(_loc2_ < this.§1§.right)
         {
            _loc3_ = this.§1§.y;
            while(_loc3_ < this.§1§.bottom)
            {
               if(_loc1_.hitTestPoint(_loc2_,_loc3_,true))
               {
                  this.§1'§.push(new §52§(_loc2_,_loc3_));
               }
               _loc3_ += 8;
            }
            _loc2_ += 8;
         }
         §?V§.instance.removeChild(_loc1_);
      }
      
      public function §?J§(param1:§52§, param2:Number) : Vector.<§52§>
      {
         var _loc5_:§52§ = null;
         var _loc3_:Vector.<§52§> = new Vector.<§52§>();
         var _loc4_:Number = Math.pow(param2,2);
         for each(_loc5_ in this.§1'§)
         {
            if(Math.pow(_loc5_.x - param1.x,2) + Math.pow(_loc5_.y - param1.y,2) <= _loc4_)
            {
               _loc3_.push(_loc5_);
            }
         }
         return _loc3_;
      }
      
      public function §4E§() : Vector.<§52§>
      {
         if(this.§1'§ == null)
         {
            this.§?!§();
         }
         return this.§1'§;
      }
      
      public function §+9§(param1:Number, param2:Number, param3:Number) : Vector.<Tower>
      {
         var _loc5_:Tower = null;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc4_:Vector.<Tower> = new Vector.<Tower>();
         for each(_loc5_ in this.§?0§)
         {
            _loc6_ = _loc5_.x - param1;
            _loc7_ = _loc5_.y - param2;
            _loc8_ = _loc6_ * _loc6_ + _loc7_ * _loc7_;
            if(_loc8_ <= param3 * param3)
            {
               _loc4_.push(_loc5_);
            }
         }
         return _loc4_;
      }
      
      public function get §[G§() : Number
      {
         return this.§+#§.§9A§;
      }
      
      public function §,L§(param1:Number, param2:Number, param3:Tower) : Vector.<AreaEffectDef>
      {
         var _loc5_:Tower = null;
         var _loc6_:AreaEffectDef = null;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc4_:Vector.<AreaEffectDef> = null;
         for each(_loc5_ in this.§?0§)
         {
            if(!(_loc5_ == param3 || _loc5_.def.areaEffects == null))
            {
               for each(_loc6_ in _loc5_.def.areaEffects)
               {
                  _loc7_ = _loc5_.x - param1;
                  _loc8_ = _loc5_.y - param2;
                  _loc9_ = _loc7_ * _loc7_ + _loc8_ * _loc8_;
                  if(_loc9_ <= _loc5_.def.rangeOfVisibility * _loc5_.def.rangeOfVisibility)
                  {
                     if(_loc4_ == null)
                     {
                        _loc4_ = new Vector.<AreaEffectDef>();
                     }
                     _loc4_.push(_loc6_);
                  }
               }
            }
         }
         return _loc4_;
      }
      
      public function §[L§(param1:§52§, param2:Boolean = false) : Bloon
      {
         var _loc6_:Bloon = null;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc3_:int = -1;
         var _loc4_:Number = Number.MAX_VALUE;
         var _loc5_:Bloon = null;
         for each(_loc6_ in this.allBloons)
         {
            if(!(_loc6_.type < _loc3_ || param2 && _loc6_.type == Bloon.§9?§))
            {
               _loc7_ = param1.x - _loc6_.x;
               _loc8_ = param1.y - _loc6_.y;
               _loc9_ = _loc7_ * _loc7_ + _loc8_ * _loc8_;
               if(_loc9_ < _loc4_ || _loc6_.type > _loc3_)
               {
                  _loc5_ = _loc6_;
                  _loc3_ = _loc6_.type;
                  _loc4_ = _loc9_;
               }
            }
         }
         return _loc5_;
      }
      
      public function §-;§(param1:Number, param2:Number, param3:Number) : Vector.<Bloon>
      {
         var _loc5_:Bloon = null;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc4_:Vector.<Bloon> = new Vector.<Bloon>();
         for each(_loc5_ in this.allBloons)
         {
            if(!_loc5_.§ !§)
            {
               _loc6_ = _loc5_.x - param1;
               _loc7_ = _loc5_.y - param2;
               _loc8_ = _loc6_ * _loc6_ + _loc7_ * _loc7_;
               if(_loc8_ <= param3 * param3)
               {
                  _loc4_.push(_loc5_);
               }
            }
         }
         return _loc4_;
      }
      
      public function §%,§(param1:int, param2:BloonSendDef, param3:Boolean, param4:Boolean) : void
      {
         var _loc5_:§-3§ = new §-3§(this,param1,param2,param3,param4);
         this.§4O§.push(_loc5_);
         this.§`9§.dispatch(param1,param2.id,param3,param4);
      }
      
      public function §[4§(param1:int) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.§4O§.length)
         {
            if(param1 == this.§4O§[_loc2_].§-0§)
            {
               this.§4O§.splice(_loc2_,1);
               this.§^=§.dispatch(param1);
               break;
            }
            _loc2_++;
         }
      }
      
      public function §<W§(param1:String) : Tower
      {
         var _loc3_:Tower = null;
         var _loc2_:int = 0;
         while(_loc2_ < this.§?0§.length)
         {
            _loc3_ = this.§?0§[_loc2_];
            if(_loc3_.id == param1)
            {
               return _loc3_;
            }
            _loc2_++;
         }
         return null;
      }
      
      public function §90§(param1:Tower, param2:int) : void
      {
         param1.§+4§ = param2;
         this.§!T§.dispatch(param1.id,param2);
      }
      
      public function setAceFlightPath(param1:Tower, param2:int) : void
      {
         (DeployMonkeyAce.aces[param1] as §^H§).§4,§(param2);
         this.§`U§.dispatch(param1.id,param2);
      }
      
      public function §6@§(param1:Tower, param2:String) : void
      {
         if(param1.§^I§(param2))
         {
            this.§"B§.dispatch(param1.id,param2);
         }
      }
      
      public function §3C§(param1:Tower, param2:Number, param3:Number) : void
      {
         param1.§0B§(param2,param3);
         this.§4B§.dispatch(param1.id,param2,param3);
      }
      
      public function §#"§() : §52§
      {
         return this.§"0§.§&Q§(this);
      }
      
      public function §[C§() : Boolean
      {
         return this.§"0§.§[C§(this);
      }
   }
}

