package towers
{
   import §+C§.§0>§;
   import §8U§.§52§;
   import §;M§.§"L§;
   import §>@§.§-A§;
   import §>@§.§<<§;
   import abilities.Overclock;
   import abilities.OverclockPick;
   import abilities.def.AbilityDef;
   import abilities.def.SupplyDropDef;
   import assest.towers.BloonsDayDevice;
   import assest.towers.BloonsDayDevicePro;
   import assets.towers.AirBase;
   import assets.towers.LaserMonkey;
   import assets.towers.MonkeyVillage;
   import assets.towers.PlasmaVision;
   import bloons.Bloon;
   import display.Clip;
   import display.LabelOverCommand;
   import entities.BloonTrap;
   import events.LevelEvent;
   import events.PropertyModEvent;
   import flash.display.BitmapData;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.utils.Dictionary;
   import game.§6$§;
   import projectiles.behavior.process.FollowPath;
   import towers.behavior.BehaviorDef;
   import towers.behavior.process.CreateBloonTrap;
   import towers.behavior.roundOver.BehaviorRoundOver;
   import towers.behavior.roundOver.HealthyBananas;
   import towers.behavior.roundOver.Intrest;
   import towers.behavior.roundStart.BananaEmitionTimer;
   import towers.behavior.roundStart.BananaEmitter;
   import towers.def.AltDisplayAddonDef;
   import towers.def.AreaEffectDef;
   import towers.def.DisplayAddonDef;
   import towers.def.TowerDef;
   import towers.upgrades.Combinator;
   import towers.upgrades.UpgradeDef;
   import towers.upgrades.UpgradePathDef;
   import utils.§-B§;
   import utils.Pool;
   import utils.Rndm;
   import weapons.CreateSentry;
   import weapons.FireAtReticle;
   import weapons.HasReloadTime;
   import weapons.SpikeSpread;
   import weapons.Weapon;
   
   public class Tower extends §"L§
   {
      
      public static const §'V§:int = 0;
      
      public static const §#F§:int = 1;
      
      public static const §8T§:int = 2;
      
      public static const §%$§:int = 3;
      
      public static const §1D§:String = "TOWER_FIRE";
      
      public static var §20§:int = 0;
      
      public var id:String = null;
      
      public var def:TowerDef;
      
      public var §0,§:TowerDef = null;
      
      public var upgrades:Vector.<UpgradeDef> = new Vector.<UpgradeDef>();
      
      public var §&@§:UpgradePathDef = null;
      
      public var §7'§:Vector.<int> = Vector.<int>([0,0]);
      
      public var §`!§:String = null;
      
      public var §^O§:Rndm = null;
      
      public var effect:MovieClip = null;
      
      public var occupiedSpace:MovieClip = null;
      
      private var §<8§:§<<§ = §-A§.§]H§();
      
      public var §5N§:Boolean = true;
      
      private var §,&§:§<<§ = §-A§.§]H§(0);
      
      public var parentTower:Tower = null;
      
      public var targetMask:int = 0;
      
      public var §+4§:int = 0;
      
      public var §'9§:Boolean = true;
      
      public var §+A§:Vector.<Bloon> = new Vector.<Bloon>();
      
      private var currentTarget:Bloon = null;
      
      public var clip:Clip = new Clip();
      
      public var addonClips:Vector.<Clip> = new Vector.<Clip>();
      
      public var addonRotation:Dictionary = new Dictionary();
      
      private var §77§:Vector.<§-B§>;
      
      public var §>2§:Dictionary = null;
      
      public var §>§:Boolean = false;
      
      public var §]F§:Vector.<Vector.<Bloon>> = new Vector.<Vector.<Bloon>>();
      
      public var pause:Boolean = false;
      
      public var pauseDraw:Boolean = false;
      
      public var §`6§:* = false;
      
      public var §^R§:Boolean = false;
      
      private var loop:Boolean = false;
      
      private var §9U§:int = 0;
      
      private var §]"§:Boolean = false;
      
      private var §&V§:Boolean = false;
      
      private var instance:Tower = null;
      
      private var §"0§:§6$§ = null;
      
      protected var levelSlugg:§0>§ = null;
      
      private var §-G§:Vector.<Tower>;
      
      public var targetingSystem:int = -1;
      
      private var §@"§:Number = 0;
      
      public function Tower()
      {
         super();
         this.instance = this;
         this.§"0§ = §?V§.instance.§"0§;
         this.§"0§.addEventListener(LevelEvent.ROUND_START,this.roundStart);
         this.§"0§.addEventListener(LevelEvent.ROUND_OVER,this.roundOver);
      }
      
      public function get levelSlug() : §0>§
      {
         return this.levelSlugg;
      }
      
      public function initialise(param1:TowerDef, param2:§0>§, param3:Boolean = true) : void
      {
         var weapon:Weapon = null;
         var behavior:BehaviorDef = null;
         var rotate:Boolean = false;
         var weaponRotate:Object = null;
         var addon:DisplayAddonDef = null;
         var addonClip:Clip = null;
         var addonClipClass:Class = null;
         var possibleAlt:AltDisplayAddonDef = null;
         var hasReloadTime:HasReloadTime = null;
         var timer:§-B§ = null;
         var i:int = 0;
         var ability:AbilityDef = null;
         var cooldownTime:Number = NaN;
         var ttt:§-B§ = null;
         var maskFlag:int = 0;
         var def:TowerDef = param1;
         var levelSlugg:§0>§ = param2;
         var updateBase:Boolean = param3;
         if(def == null)
         {
            return;
         }
         this.levelSlugg = levelSlugg;
         this.currentTarget = null;
         this.§>§ = false;
         if(this.§0,§ && this.upgrades && this.upgrades.length > 0 && updateBase == true)
         {
            this.initialise(Combinator.combine(def,this.upgrades),levelSlugg,false);
            this.§0,§ = def;
            return;
         }
         this.§&@§ = §?V§.instance.§=K§.§?P§(def.id);
         if(this.targetingSystem == -1)
         {
            this.targetingSystem = def.targetingSystem;
         }
         if(this.def != null)
         {
            behavior = this.def.behavior;
            if(behavior != null && behavior.roundOver != null && levelSlugg.§0=§())
            {
               if(behavior.roundOver.isCalledOnReInit == true)
               {
                  if(!(behavior.roundOver is Intrest || behavior.roundOver is HealthyBananas))
                  {
                     behavior.roundOver.execute(this);
                  }
               }
            }
            this.§;+§();
         }
         if(def.weapons)
         {
            rotate = false;
            for each(weaponRotate in def.weapons)
            {
               if(weaponRotate.hasOwnProperty("rotate"))
               {
                  if(weaponRotate.rotate)
                  {
                     rotate = true;
                     break;
                  }
               }
            }
            if(rotation == 0)
            {
               if(rotate || def.id == "MonkeyApprentice" || def.id == "SniperMonkey" || def.id == "MonkeyBuccaneer" || def.id == "DartlingGun" || def.id == "TribalTurtle")
               {
                  rotation = -Math.PI / 2;
               }
            }
         }
         this.def = def;
         if(updateBase)
         {
            this.§0,§ = def;
         }
         this.occupiedSpace = new (Class(def.occupiedSpace))();
         this.occupiedSpace.x = x;
         this.occupiedSpace.y = y;
         this.clip.initialise(def.display,0);
         this.clip.stop();
         if(this.clip.hasLabel("Loop"))
         {
            this.loop = true;
            this.clip.labelOver["Loop"] = new LabelOverCommand();
            this.clip.labelOver["Loop"].command = LabelOverCommand.gotoAndPlay;
            this.clip.labelOver["Loop"].frameLabelTo = "Loop";
         }
         else
         {
            this.loop = false;
         }
         if(this.clip.hasLabel("Ambient"))
         {
            this.§]"§ = true;
            this.clip.play();
            this.clip.looping = true;
         }
         else
         {
            this.§]"§ = false;
         }
         if(this.clip.hasLabel("Throw1"))
         {
            this.§9U§ = 1;
         }
         this.§&V§ = false;
         if(this.clip.hasLabel("Throw"))
         {
            this.§&V§ = true;
         }
         if(def.display == MonkeyVillage || def.display == AirBase || def.display == BloonsDayDevice || def.display == BloonsDayDevicePro)
         {
            this.clip.play();
            this.clip.looping = true;
         }
         if(this.addonClips.length > 0)
         {
            this.addonClips.splice(0,this.addonClips.length);
         }
         this.addonRotation = new Dictionary();
         if(def.displayAddons != null)
         {
            for each(addon in def.displayAddons)
            {
               addonClip = new Clip();
               addonClipClass = addon.clip;
               if(addon.alts != null)
               {
                  for each(possibleAlt in addon.alts)
                  {
                     if(possibleAlt.useFor == def.display)
                     {
                        addonClipClass = possibleAlt.display;
                        break;
                     }
                  }
               }
               addonClip.initialise(addonClipClass,0);
               if(addon.loop)
               {
                  addonClip.play();
                  addonClip.looping = true;
               }
               else
               {
                  addonClip.stop();
                  addonClip.looping = false;
               }
               this.addonClips.push(addonClip);
            }
         }
         if(this.§`!§ == "Sentry" || this.§`!§ == "SentrySprockets")
         {
            CreateSentry.addDestroyer(this);
         }
         this.§77§ = new Vector.<§-B§>();
         for each(weapon in def.weapons)
         {
            hasReloadTime = weapon as HasReloadTime;
            if(hasReloadTime != null)
            {
               timer = new §-B§(hasReloadTime.reloadTime);
               this.§77§.push(timer);
            }
         }
         if(Boolean(def.abilities) && def.abilities.length > 0)
         {
            if(this.§>2§ == null)
            {
               this.§>2§ = new Dictionary();
            }
            i = 0;
            while(i < def.abilities.length)
            {
               ability = def.abilities[i];
               cooldownTime = ability.cooldown;
               if(this.§>2§[ability.id] == null)
               {
                  timer = new §-B§(cooldownTime);
                  timer.stop();
                  this.§>2§[ability.id] = timer;
                  if(ability is SupplyDropDef)
                  {
                     timer.start();
                     ttt = new §-B§(timer.delay + 0.5);
                     ttt.addEventListener(§-B§.COMPLETE,function(param1:Event):*
                     {
                        ttt.removeEventListener(§-B§.COMPLETE,arguments.callee);
                     });
                  }
               }
               else if(this.§>2§[ability.id].delay != cooldownTime)
               {
                  if(this.§>2§[ability.id].current > cooldownTime)
                  {
                     this.§>2§[ability.id].current = cooldownTime;
                  }
                  this.§>2§[ability.id].reset(cooldownTime);
                  this.§>2§[ability.id].stop();
               }
               i++;
            }
         }
         if(def.behavior != null)
         {
            if(def.behavior.initialise != null)
            {
               def.behavior.initialise.execute(this);
            }
            if(def.behavior.roundStart != null)
            {
               def.behavior.roundStart.execute(this);
            }
         }
         this.targetMask = 0;
         if(def.targetMask != null)
         {
            for each(maskFlag in def.targetMask)
            {
               this.targetMask |= maskFlag;
            }
         }
         this.§0;§();
         this.§4K§();
         dispatchEvent(new PropertyModEvent("def"));
      }
      
      override public function destroy() : void
      {
         var _loc2_:BehaviorRoundOver = null;
         var _loc3_:BananaEmitionTimer = null;
         if(this.def == null)
         {
            return;
         }
         this.§-G§ = null;
         this.currentTarget = null;
         var _loc1_:BehaviorDef = this.def.behavior;
         if(_loc1_ != null && _loc1_.roundOver != null)
         {
            _loc2_ = _loc1_.roundOver;
            if(!(_loc2_ is Intrest || _loc2_ is HealthyBananas))
            {
               _loc2_.execute(this);
            }
         }
         if(_loc1_ != null && _loc1_.destroy != null)
         {
            _loc1_.destroy.execute(this);
         }
         if(BananaEmitter.bankedTowerFunds[this] != null)
         {
            BananaEmitter.bankedTowerFunds[this] = null;
            delete BananaEmitter.bankedTowerFunds[this];
         }
         if(BananaEmitter.towerTimers[this] != null)
         {
            for each(_loc3_ in BananaEmitter.towerTimers[this])
            {
               _loc3_.cancel();
            }
         }
         if(this.def.behavior != null)
         {
            if(this.def.behavior.initialise != null)
            {
               this.def.behavior.initialise.cleanup(this);
            }
            if(this.def.behavior.roundStart != null)
            {
               this.def.behavior.roundStart.cleanup(this);
            }
            if(this.def.behavior.process != null)
            {
               this.def.behavior.process.cleanup(this);
            }
            if(this.def.behavior.roundOver != null)
            {
               this.def.behavior.roundOver.cleanup(this);
            }
            if(this.def.behavior.destroy != null)
            {
               this.def.behavior.destroy.cleanup(this);
            }
         }
         this.§"0§.removeEventListener(LevelEvent.ROUND_START,this.roundStart);
         this.§"0§.removeEventListener(LevelEvent.ROUND_OVER,this.roundOver);
         this.§;+§();
         if(FollowPath.concreteCurves[this] != null)
         {
            FollowPath.concreteCurves[this] == null;
         }
         this.def = null;
         this.§0,§ = null;
         this.§77§ = null;
         this.effect = null;
         Pool.release(this);
         this.upgrades.splice(0,this.upgrades.length);
         this.spentOn = 0;
         this.popCount = 0;
         rotation = 0;
         this.pause = false;
         this.§>2§ = null;
         this.levelSlugg = null;
         this.§"0§ = null;
         super.destroy();
      }
      
      private function roundStart(param1:Event) : void
      {
         var _loc2_:BehaviorDef = this.def.behavior;
         if(_loc2_ != null && _loc2_.roundStart != null)
         {
            _loc2_.roundStart.execute(this.instance);
         }
      }
      
      private function roundOver(param1:Event) : void
      {
         var _loc2_:BehaviorDef = this.def.behavior;
         if(_loc2_ != null && _loc2_.roundOver != null)
         {
            _loc2_.roundOver.execute(this.instance);
         }
      }
      
      public function §4K§() : void
      {
         z = 1 + y / §?V§.§-?§.height * 0.5;
      }
      
      public function §0;§() : void
      {
         var _loc2_:Tower = null;
         var _loc3_:AreaEffectDef = null;
         var _loc4_:TowerDef = null;
         var _loc5_:Number = NaN;
         if(this.def == null || this.def.areaEffects == null)
         {
            return;
         }
         var _loc1_:Vector.<Tower> = this.levelSlugg.§+9§(x,y,this.def.rangeOfVisibility);
         for each(_loc2_ in _loc1_)
         {
            if(!(_loc2_ == this || _loc2_.def && _loc2_.def.areaEffects || _loc2_.def == null))
            {
               for each(_loc3_ in this.def.areaEffects)
               {
                  if(_loc3_.upgrade != null)
                  {
                     _loc2_.upgrades.push(_loc3_.upgrade);
                  }
               }
               _loc4_ = Combinator.combine(_loc2_.§0,§,_loc2_.upgrades);
               if(_loc4_ != this.def)
               {
                  _loc5_ = _loc2_.rotation;
                  _loc2_.initialise(_loc4_,this.levelSlugg,false);
                  _loc2_.rotation = _loc5_;
                  this.levelSlugg.§ U§(_loc2_);
               }
            }
         }
      }
      
      public function §;+§() : void
      {
         var _loc2_:Tower = null;
         var _loc3_:AreaEffectDef = null;
         var _loc4_:TowerDef = null;
         var _loc5_:int = 0;
         var _loc6_:Number = NaN;
         if(this.def == null || this.def.areaEffects == null)
         {
            return;
         }
         var _loc1_:Vector.<Tower> = this.levelSlugg.§+9§(x,y,this.def.rangeOfVisibility);
         for each(_loc2_ in _loc1_)
         {
            if(!(_loc2_ == this || _loc2_.def && _loc2_.def.areaEffects || _loc2_.def == null))
            {
               for each(_loc3_ in this.def.areaEffects)
               {
                  if(_loc3_.upgrade != null)
                  {
                     _loc5_ = int(_loc2_.upgrades.indexOf(_loc3_.upgrade));
                     if(_loc5_ != -1)
                     {
                        _loc2_.upgrades.splice(_loc5_,1);
                     }
                  }
               }
               _loc4_ = Combinator.combine(_loc2_.§0,§,_loc2_.upgrades);
               if(_loc4_ != this.def)
               {
                  _loc6_ = _loc2_.rotation;
                  _loc2_.initialise(_loc4_,this.levelSlugg,false);
                  _loc2_.rotation = _loc6_;
                  this.levelSlugg.§ U§(_loc2_);
               }
            }
         }
      }
      
      public function §7+§(param1:UpgradeDef, param2:Boolean = true) : void
      {
         if(this.upgrades.indexOf(param1) != -1)
         {
            return;
         }
         this.upgrades.push(param1);
         if(param2)
         {
            this.initialise(Combinator.combine(this.§0,§,this.upgrades),this.levelSlugg,false);
         }
      }
      
      public function removeUpgrade(param1:UpgradeDef, param2:Boolean = true) : void
      {
         var _loc3_:int = int(this.upgrades.indexOf(param1));
         if(_loc3_ == -1)
         {
            return;
         }
         this.upgrades.splice(_loc3_,1);
         if(param2)
         {
            this.initialise(Combinator.combine(this.§0,§,this.upgrades),this.levelSlugg,false);
         }
      }
      
      public function §,N§(param1:AbilityDef) : §-B§
      {
         return this.§>2§[param1.id];
      }
      
      public function §^I§(param1:String) : Boolean
      {
         var _loc3_:AbilityDef = null;
         if(param1.indexOf("Overclock_") == 0)
         {
            var _loc4_:Array = param1.split("_");
            var _loc5_:§52§ = levelSlug.§#"§();
            new Overclock(int(_loc4_[1]),int(_loc4_[2])).execute(this,OverclockPick.OC_DEF);
            return;
         }
         if(param1 == "ClickTrap")
         {
            var _loc6_:BloonTrap = CreateBloonTrap.hasTrap[this];
            if(Boolean(_loc6_))
            {
               _loc6_.destroy();
            }
            return;
         }
         if(this.§>2§[param1].running)
         {
            return false;
         }
         this.§>2§[param1].reset();
         var _loc2_:int = 0;
         while(_loc2_ < this.def.abilities.length)
         {
            _loc3_ = this.def.abilities[_loc2_];
            if(_loc3_.id == param1)
            {
               new _loc3_.ability().execute(this,_loc3_);
            }
            _loc2_++;
         }
         return true;
      }
      
      public function set popCount(param1:int) : void
      {
         if(param1 != 0 && this.parentTower != null)
         {
            this.parentTower.popCount += param1 - this.popCount;
         }
         if(this.§,&§.value != param1)
         {
            this.§,&§.value = param1;
            dispatchEvent(new PropertyModEvent("popCount"));
         }
      }
      
      public function get popCount() : int
      {
         return this.§,&§.value;
      }
      
      public function set spentOn(param1:Number) : void
      {
         if(this.§<8§.value != param1)
         {
            this.§<8§.value = param1;
            dispatchEvent(new PropertyModEvent("spentOn"));
         }
      }
      
      public function get spentOn() : Number
      {
         return this.§<8§.value;
      }
      
      private function §6P§() : void
      {
         var _loc3_:Weapon = null;
         var _loc4_:§-B§ = null;
         if(this.def.weapons == null)
         {
            return;
         }
         if((this.levelSlugg.allBloons.length > 0 || this.§0,§.id == "SpikeFactory" && this.levelSlugg.§0=§ || this.§`!§ == "Engineer") == false)
         {
            return;
         }
         var _loc1_:Boolean = false;
         var _loc2_:int = 0;
         while(_loc2_ < this.def.weapons.length)
         {
            _loc3_ = this.def.weapons[_loc2_];
            _loc4_ = this.§77§[_loc2_];
            if(!this.§77§[_loc2_].running)
            {
               if(!_loc3_.proxied)
               {
                  if(_loc1_ == false && !(_loc3_ is SpikeSpread) && !(_loc3_ is CreateSentry) && this.def.requiresTarget && (this.currentTarget == null || this.currentTarget.type == -1 || this.§@"§ > 0.5 || this.§7L§(this.currentTarget) == false || this.currentTarget.§ !§))
                  {
                     this.currentTarget = null;
                     this.levelSlugg.§%Y§.§["§(this);
                     if(this.§+A§.length > 0)
                     {
                        this.currentTarget = this.§+A§[this.§+A§.length - 1];
                        _loc1_ = true;
                        this.§@"§ = 0;
                     }
                  }
                  if(this.currentTarget != null || this.def.requiresTarget == false || _loc3_ is CreateSentry || _loc3_ is SpikeSpread)
                  {
                     if(_loc2_ == 0)
                     {
                        if(this.§&V§)
                        {
                           if(this.§>§ == true)
                           {
                              this.§8F§(_loc2_);
                           }
                           this.clip.gotoAndPlay(0);
                           this.§>§ = true;
                        }
                        else if(this.§9U§ != 0)
                        {
                           if(!this.clip.hasLabel("Throw" + String(this.§9U§)))
                           {
                              this.§9U§ = 1;
                           }
                           this.clip.gotoLabel("Throw" + String(this.§9U§));
                           this.clip.play();
                           ++this.§9U§;
                           this.§8F§(_loc2_);
                        }
                        else if(this.loop)
                        {
                           if(this.clip.currentLabel != "Loop")
                           {
                              this.clip.gotoLabel("Loop");
                              this.clip.play();
                           }
                           this.§8F§(_loc2_);
                        }
                        else
                        {
                           this.§8F§(_loc2_);
                        }
                     }
                     else
                     {
                        this.§8F§(_loc2_);
                     }
                     this.§77§[_loc2_].reset();
                  }
               }
            }
            _loc2_++;
         }
      }
      
      private function §#L§() : void
      {
         if(this.§>§ && this.clip.currentLabel == "Throw")
         {
            this.§>§ = false;
            this.§8F§(0);
         }
      }
      
      private function §8F§(param1:int) : void
      {
         var _loc2_:Weapon = this.def.weapons[param1];
         if(this.def.weaponOffsets && this.def.weaponOffsets.length > param1 && this.def.weaponOffsets[param1] && this.def.display != LaserMonkey && this.def.display != PlasmaVision)
         {
            _loc2_.execute(this,this,this.currentTarget,this.def.weaponOffsets[param1]);
         }
         else
         {
            _loc2_.execute(this,this,this.currentTarget);
         }
         this.dispatchEvent(new Event(§1D§));
      }
      
      override public function process(param1:Number) : void
      {
         var _loc2_:Clip = null;
         if(this.pause)
         {
            this.clip.process();
            for each(_loc2_ in this.addonClips)
            {
               _loc2_.process();
            }
            return;
         }
         this.§@"§ += param1;
         if(this.loop && (this.currentTarget == null && this.def.requiresTarget == true || this.levelSlugg.allBloons.length == 0))
         {
            this.clip.gotoAndStop(0);
         }
         this.§6P§();
         this.§#L§();
         if(this.def.behavior != null && this.def.behavior.process != null)
         {
            this.def.behavior.process.process(this,param1);
         }
         this.clip.process();
         for each(_loc2_ in this.addonClips)
         {
            _loc2_.process();
         }
      }
      
      public function §7L§(param1:Bloon) : Boolean
      {
         var _loc2_:Number = this.x - param1.x;
         var _loc3_:Number = this.y - param1.y;
         var _loc4_:Number = _loc2_ * _loc2_ + _loc3_ * _loc3_;
         var _loc5_:Number = this.def.rangeOfVisibility + param1.§;-§;
         var _loc6_:Number = _loc5_ * _loc5_;
         if(_loc4_ <= _loc6_)
         {
            return true;
         }
         return false;
      }
      
      private function §@S§(param1:BitmapData, param2:Clip, param3:int) : *
      {
         if(!this.def.displayAddons[param3].rotate)
         {
            param2.quickDraw(param1,x,y);
         }
         else if(this.addonRotation[param2] == null)
         {
            param2.drawRotated(param1,x,y,rotation);
         }
         else
         {
            param2.drawRotated(param1,x,y,this.addonRotation[param2]);
         }
      }
      
      override public function draw(param1:BitmapData) : void
      {
         var _loc3_:Clip = null;
         if(this.pauseDraw || this.def == null || this.def.display == null)
         {
            return;
         }
         var _loc2_:int = 0;
         for each(_loc3_ in this.addonClips)
         {
            if(this.def.displayAddons[_loc2_].z < -1)
            {
               if(this.§^R§ && _loc2_ == 3)
               {
                  continue;
               }
               this.§@S§(param1,_loc3_,_loc2_);
            }
            _loc2_++;
         }
         _loc2_ = 0;
         for each(_loc3_ in this.addonClips)
         {
            if(this.def.displayAddons[_loc2_].z < 0 && this.def.displayAddons[_loc2_].z >= -1)
            {
               if(this.§^R§ && _loc2_ == 3)
               {
                  continue;
               }
               this.§@S§(param1,_loc3_,_loc2_);
            }
            _loc2_++;
         }
         if(!this.§`6§)
         {
            if(rotation == 0)
            {
               if(this.effect != null)
               {
                  this.clip.drawWithEffect(param1,x,y,this.effect,rotation,true);
               }
               else
               {
                  this.clip.quickDraw(param1,x,y);
               }
            }
            else if(this.effect != null)
            {
               this.clip.drawWithEffect(param1,x,y,this.effect,rotation,true);
            }
            else
            {
               this.clip.drawRotated(param1,x,y,rotation);
            }
         }
         _loc2_ = 0;
         for each(_loc3_ in this.addonClips)
         {
            if(this.def.displayAddons[_loc2_].z >= 0 && this.def.displayAddons[_loc2_].z < 2)
            {
               this.§@S§(param1,_loc3_,_loc2_);
            }
            _loc2_++;
         }
         _loc2_ = 0;
         for each(_loc3_ in this.addonClips)
         {
            if(this.def.displayAddons[_loc2_].z >= 2)
            {
               this.§@S§(param1,_loc3_,_loc2_);
            }
            _loc2_++;
         }
      }
      
      public function §#N§(param1:Tower) : void
      {
         if(this.§-G§ == null)
         {
            this.§-G§ = new Vector.<Tower>();
         }
         this.§-G§.push(param1);
         this.§!7§(param1);
         this.§5N§ = false;
      }
      
      public function §<B§(param1:Tower) : Boolean
      {
         if(this.§-G§ == null)
         {
            return false;
         }
         var _loc2_:int = 0;
         while(_loc2_ < this.§-G§.length)
         {
            if(param1 == this.§-G§[_loc2_])
            {
               this.§-G§.splice(_loc2_,1);
               this.§87§(param1);
               if(this.§-G§.length == 0)
               {
                  this.§5N§ = true;
               }
               return true;
            }
            _loc2_++;
         }
         return false;
      }
      
      public function §9<§() : Boolean
      {
         if(this.§-G§ == null)
         {
            return false;
         }
         return this.§-G§.length > 0;
      }
      
      public function §!7§(param1:Tower) : void
      {
         var _loc2_:AreaEffectDef = null;
         var _loc3_:Number = NaN;
         if(this.def == null || this.def.platformEffects == null)
         {
            return;
         }
         if(Boolean(param1.def) && Boolean(param1.def.areaEffects))
         {
            return;
         }
         for each(_loc2_ in this.def.platformEffects)
         {
            if(_loc2_.upgrade != null)
            {
               param1.upgrades.push(_loc2_.upgrade);
            }
         }
         _loc3_ = param1.rotation;
         param1.initialise(Combinator.combine(param1.§0,§,param1.upgrades),this.levelSlugg,false);
         param1.rotation = _loc3_;
         this.levelSlugg.§ U§(param1);
      }
      
      public function §87§(param1:Tower) : void
      {
         var _loc2_:AreaEffectDef = null;
         var _loc3_:Number = NaN;
         var _loc4_:int = 0;
         if(this.def == null || this.def.areaEffects == null)
         {
            return;
         }
         if(Boolean(param1.def) && Boolean(param1.def.areaEffects))
         {
            return;
         }
         for each(_loc2_ in this.def.platformEffects)
         {
            if(_loc2_.upgrade != null)
            {
               _loc4_ = int(param1.upgrades.indexOf(_loc2_.upgrade));
               if(_loc4_ != -1)
               {
                  param1.upgrades.splice(_loc4_,1);
               }
            }
         }
         _loc3_ = param1.rotation;
         param1.initialise(Combinator.combine(param1.§0,§,param1.upgrades),this.levelSlugg,false);
         param1.rotation = _loc3_;
         this.levelSlugg.§ U§(param1);
      }
      
      public function § ?§(param1:int) : Number
      {
         return this.§&@§.upgrades[param1][this.§7'§[param1]].cost;
      }
      
      public function upgradePath(param1:int) : Boolean
      {
         var _loc3_:int = 0;
         var _loc4_:UpgradeDef = null;
         if(this.§7'§[param1] >= 2 && this.§7'§[1 - param1] >= 3)
         {
            return false;
         }
         ++this.§7'§[param1];
         var _loc2_:UpgradeDef = this.§&@§.upgrades[param1][this.§7'§[param1] - 1];
         if(_loc2_.assign)
         {
            _loc3_ = 0;
            while(_loc3_ < this.§7'§[param1] - 1)
            {
               _loc4_ = this.§&@§.upgrades[param1][_loc3_];
               this.removeUpgrade(_loc4_,false);
               _loc3_++;
            }
            this.initialise(_loc2_.assign,this.levelSlugg);
         }
         else
         {
            this.§7+§(_loc2_,true);
         }
         if(this.§0,§.id == "AircraftCarrier")
         {
            rotation = 0;
         }
         return true;
      }
      
      public function §0B§(param1:Number, param2:Number) : void
      {
         FireAtReticle.SetLocation(this,param1,param2);
         var _loc3_:§52§ = new §52§();
         _loc3_.x = param1 - this.x;
         _loc3_.y = param2 - this.y;
         this.rotation = _loc3_.rotation;
      }
   }
}

