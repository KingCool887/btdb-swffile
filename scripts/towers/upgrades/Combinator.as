package towers.upgrades
{
   import abilities.def.AbilityDef;
   import assets.projectile.FragShard;
   import projectiles.behavior.BehaviorDef;
   import projectiles.behavior.collision.BehaviorCollision;
   import projectiles.behavior.collision.CollisionSpawnProjectile;
   import projectiles.behavior.collision.SpawnSpreadCollision;
   import projectiles.behavior.destroy.BehaviorDestroy;
   import projectiles.behavior.destroy.SpawnProjectile;
   import projectiles.def.BurnEffectDef;
   import projectiles.def.DamageEffectDef;
   import projectiles.def.GlueEffectDef;
   import projectiles.def.ProjectileDef;
   import projectiles.def.StunEffectDef;
   import projectiles.def.WindEffectDef;
   import towers.behavior.BehaviorDef;
   import towers.behavior.initialise.DeployMonkeyAce;
   import towers.behavior.process.BloonchipperStore;
   import towers.behavior.roundStart.BananaEmitter;
   import towers.behavior.roundStart.SwapForProjectile;
   import towers.def.AreaEffectDef;
   import towers.def.DisplayAddonDef;
   import towers.def.TowerDef;
   import towers.def.TowerDisplayMod;
   import utils.ObjectHelper;
   import weapons.HasChildWeapons;
   import weapons.HasPower;
   import weapons.HasProjectile;
   import weapons.HasRange;
   import weapons.HasReloadTime;
   import weapons.HasSpread;
   import weapons.LaunchAircraft;
   import weapons.Spread;
   import weapons.Weapon;
   
   public class Combinator
   {
      
      public static var cache:Vector.<Cache> = new Vector.<Cache>();
      
      public function Combinator()
      {
         super();
      }
      
      public static function areUpgradesEqual(param1:Vector.<UpgradeDef>, param2:Vector.<UpgradeDef>) : Boolean
      {
         var _loc3_:UpgradeDef = null;
         if(param1.length != param2.length)
         {
            return false;
         }
         for each(_loc3_ in param1)
         {
            if(param2.indexOf(_loc3_) == -1)
            {
               return false;
            }
         }
         return true;
      }
      
      public static function detailLevel(param1:String, param2:Class) : int
      {
         var _loc5_:Vector.<UpgradeDef> = null;
         var _loc6_:int = 0;
         var _loc7_:UpgradeDef = null;
         var _loc3_:Vector.<Vector.<UpgradeDef>> = §?V§.instance.§=K§.§?P§(param1).upgrades;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_.length)
         {
            _loc5_ = _loc3_[_loc4_];
            _loc6_ = 0;
            while(_loc6_ < _loc5_.length)
            {
               _loc7_ = _loc5_[_loc6_];
               if(Boolean(_loc7_.add) && _loc7_.add.detail == param2)
               {
                  return _loc6_ + 1;
               }
               if(Boolean(_loc7_.assign) && _loc7_.assign.detail == param2)
               {
                  return _loc6_ + 1;
               }
               _loc6_++;
            }
            _loc4_++;
         }
         return -1;
      }
      
      public static function combine(param1:TowerDef, param2:Vector.<UpgradeDef>) : TowerDef
      {
         var _loc4_:UpgradeDef = null;
         var _loc5_:Vector.<UpgradeDef> = null;
         var _loc6_:Cache = null;
         var _loc7_:TowerDef = null;
         var _loc8_:UpgradeDef = null;
         var _loc9_:Boolean = false;
         var _loc10_:UpgradeDef = null;
         var _loc11_:AddDef = null;
         var _loc12_:Weapon = null;
         var _loc13_:WeaponReplaceDef = null;
         var _loc14_:Weapon = null;
         var _loc15_:SwapForProjectile = null;
         var _loc16_:TowerDisplayMod = null;
         var _loc17_:BananaEmitter = null;
         var _loc18_:BloonchipperStore = null;
         var _loc19_:DeployMonkeyAce = null;
         var _loc20_:TowerDisplayMod = null;
         var _loc21_:DisplayAddonDef = null;
         var _loc22_:TowerDisplayMod = null;
         var _loc23_:AreaEffectDef = null;
         var _loc24_:AbilityDef = null;
         var _loc25_:AbilityModDef = null;
         var _loc26_:AbilityDef = null;
         var _loc27_:WeaponModDef = null;
         var _loc28_:Vector.<Weapon> = null;
         var _loc29_:LaunchAircraft = null;
         var _loc30_:HasRange = null;
         var _loc31_:HasReloadTime = null;
         var _loc32_:HasPower = null;
         var _loc33_:HasSpread = null;
         var _loc34_:Spread = null;
         var _loc35_:HasChildWeapons = null;
         var _loc36_:Weapon = null;
         var _loc37_:Vector.<ProjectileDef> = null;
         var _loc38_:HasProjectile = null;
         var _loc39_:HasChildWeapons = null;
         var _loc40_:ProjectileDef = null;
         var _loc41_:SpawnProjectile = null;
         var _loc42_:CollisionSpawnProjectile = null;
         var _loc43_:SpawnSpreadCollision = null;
         var _loc44_:SpawnProjectile = null;
         var _loc45_:* = undefined;
         var _loc46_:HasProjectile = null;
         var _loc47_:ProjectileBehaviorModDef = null;
         var _loc48_:ProjectileDisplayMod = null;
         var _loc49_:SpawnProjectile = null;
         var _loc50_:Boolean = false;
         var _loc51_:SpawnSpreadCollision = null;
         var _loc52_:int = 0;
         var _loc53_:int = 0;
         var _loc3_:Vector.<UpgradeDef> = new Vector.<UpgradeDef>();
         for each(_loc4_ in param2)
         {
            _loc9_ = true;
            for each(_loc10_ in _loc3_)
            {
               if(_loc10_.id != null && _loc10_.id == _loc4_.id)
               {
                  _loc9_ = false;
                  break;
               }
            }
            if(_loc9_)
            {
               _loc3_.push(_loc4_);
            }
         }
         _loc5_ = new Vector.<UpgradeDef>();
         for each(_loc4_ in _loc3_)
         {
            if(_loc4_.id != null && _loc4_.id.indexOf("Specialty") != -1)
            {
               _loc5_.push(_loc4_);
            }
         }
         for each(_loc4_ in _loc5_)
         {
            _loc3_.splice(_loc3_.indexOf(_loc4_),1);
         }
         _loc3_ = _loc3_.concat(_loc5_);
         if(_loc3_ == null || _loc3_.length == 0)
         {
            return param1;
         }
         for each(_loc6_ in cache)
         {
            if(_loc6_.tower == param1)
            {
               if(areUpgradesEqual(_loc3_,_loc6_.upgrades))
               {
                  return _loc6_.result;
               }
            }
         }
         _loc7_ = ObjectHelper.§'A§(param1) as TowerDef;
         for each(_loc8_ in _loc3_)
         {
            _loc11_ = _loc8_.add;
            if(_loc11_ != null)
            {
               if(_loc11_.weapons)
               {
                  for each(_loc12_ in _loc11_.weapons)
                  {
                     if(_loc7_.weapons == null)
                     {
                        _loc7_.weapons = new Vector.<Weapon>();
                     }
                     _loc7_.weapons.push(ObjectHelper.§'A§(_loc12_));
                  }
               }
               if(_loc11_.replaceWeapons)
               {
                  for each(_loc13_ in _loc11_.replaceWeapons)
                  {
                     for each(_loc14_ in _loc7_.weapons)
                     {
                        if(_loc13_.replaceWeaponID == _loc14_.id)
                        {
                           _loc7_.weapons.splice(_loc7_.weapons.indexOf(_loc14_),1,ObjectHelper.§'A§(_loc13_.withWeapon));
                        }
                     }
                  }
               }
            }
         }
         for each(_loc8_ in _loc3_)
         {
            _loc11_ = _loc8_.add;
            if(_loc11_ != null)
            {
               if(_loc7_.behavior != null && _loc7_.behavior.roundStart != null && _loc11_.weaponMod != null && _loc11_.weaponMod.projectileMod != null)
               {
                  _loc15_ = _loc7_.behavior.roundStart as SwapForProjectile;
                  if(_loc15_ != null)
                  {
                     if(!_loc11_.weaponMod.projectileMod.pierceAsScale)
                     {
                        _loc15_.projectile.pierce += _loc11_.weaponMod.projectileMod.pierce;
                     }
                     else
                     {
                        _loc15_.projectile.pierce *= _loc11_.weaponMod.projectileMod.pierce;
                     }
                  }
               }
               if(_loc11_.detail != null)
               {
                  if(detailLevel(param1.id,_loc11_.detail) >= detailLevel(param1.id,_loc7_.detail))
                  {
                     _loc7_.detail = _loc11_.detail;
                  }
                  if(_loc11_.detailSmall != null)
                  {
                     if(detailLevel(param1.id,_loc11_.detail) >= detailLevel(param1.id,_loc7_.detail))
                     {
                        _loc7_.detailSmall = _loc11_.detailSmall;
                     }
                  }
               }
               if(!_loc11_.rangeOfVisibilityAsScale)
               {
                  _loc7_.rangeOfVisibility += _loc11_.rangeOfVisibility;
               }
               else
               {
                  _loc7_.rangeOfVisibility *= _loc11_.rangeOfVisibility;
               }
               if(_loc11_.display != null)
               {
                  for each(_loc16_ in _loc11_.display)
                  {
                     if(_loc16_.useFor == _loc7_.display)
                     {
                        _loc7_.display = _loc16_.display;
                        if(_loc16_.weaponOffsets != null)
                        {
                           _loc7_.weaponOffsets = _loc16_.weaponOffsets;
                        }
                     }
                  }
               }
               if(_loc11_.behavior != null)
               {
                  if(_loc11_.behavior.behaviorSet)
                  {
                     if(_loc7_.behavior == null)
                     {
                        _loc7_.behavior = new towers.behavior.BehaviorDef();
                     }
                     if(_loc11_.behavior.behaviorSet.process)
                     {
                        _loc7_.behavior.process = _loc11_.behavior.behaviorSet.process;
                     }
                     if(_loc11_.behavior.behaviorSet.initialise)
                     {
                        _loc7_.behavior.initialise = _loc11_.behavior.behaviorSet.initialise;
                     }
                     if(_loc11_.behavior.behaviorSet.roundStart)
                     {
                        _loc7_.behavior.roundStart = _loc11_.behavior.behaviorSet.roundStart;
                     }
                     if(_loc11_.behavior.behaviorSet.roundOver)
                     {
                        _loc7_.behavior.roundOver = _loc11_.behavior.behaviorSet.roundOver;
                     }
                     if(_loc11_.behavior.behaviorSet.destroy)
                     {
                        _loc7_.behavior.destroy = _loc11_.behavior.behaviorSet.destroy;
                     }
                  }
                  if(Boolean(_loc11_.behavior.bananaMod) && Boolean(_loc7_.behavior) && _loc7_.behavior.roundStart is BananaEmitter)
                  {
                     _loc17_ = _loc7_.behavior.roundStart as BananaEmitter;
                     _loc17_.cashPerPacket += _loc11_.behavior.bananaMod.cashPerPacket;
                     _loc17_.cashPerRound += _loc11_.behavior.bananaMod.cashPerRound;
                     _loc17_.lifespan += _loc11_.behavior.bananaMod.lifespan;
                     _loc17_.cashScale += _loc11_.behavior.bananaMod.cashScale;
                  }
                  if(Boolean(_loc11_.behavior.bloonchipperStoreMod) && Boolean(_loc7_.behavior) && _loc7_.behavior.process is BloonchipperStore)
                  {
                     _loc18_ = _loc7_.behavior.process as BloonchipperStore;
                     _loc18_.chipTime += _loc11_.behavior.bloonchipperStoreMod.chipTime;
                  }
                  if(Boolean(_loc11_.behavior.display) && Boolean(_loc7_.behavior) && _loc7_.behavior.initialise is DeployMonkeyAce)
                  {
                     _loc19_ = _loc7_.behavior.initialise as DeployMonkeyAce;
                     for each(_loc20_ in _loc11_.behavior.display)
                     {
                        if(_loc20_.useFor == _loc19_.display)
                        {
                           _loc19_.display = _loc20_.display;
                        }
                     }
                  }
               }
               if(_loc11_.displayAddons)
               {
                  if(_loc7_.displayAddons == null)
                  {
                     _loc7_.displayAddons = new Vector.<DisplayAddonDef>();
                  }
                  for each(_loc21_ in _loc11_.displayAddons)
                  {
                     _loc7_.displayAddons.push(_loc21_);
                  }
               }
               if(_loc11_.displayAddonMods)
               {
                  for each(_loc22_ in _loc11_.displayAddonMods)
                  {
                     for each(_loc21_ in _loc7_.displayAddons)
                     {
                        if(_loc21_.clip == _loc22_.useFor)
                        {
                           _loc21_.clip = _loc22_.display;
                        }
                     }
                  }
               }
               if(_loc11_.removeFromTargetMask != null && _loc7_.targetMask != null)
               {
                  for each(_loc52_ in _loc11_.removeFromTargetMask)
                  {
                     _loc53_ = _loc7_.targetMask.indexOf(_loc52_);
                     if(_loc53_ != -1)
                     {
                        _loc7_.targetMask.splice(_loc53_,1);
                     }
                  }
               }
               if(_loc11_.areaEffects)
               {
                  if(_loc7_.areaEffects == null)
                  {
                     _loc7_.areaEffects = new Vector.<AreaEffectDef>();
                  }
                  for each(_loc23_ in _loc11_.areaEffects)
                  {
                     _loc7_.areaEffects.push(_loc23_);
                  }
               }
               if(_loc11_.abilities)
               {
                  if(_loc7_.abilities == null)
                  {
                     _loc7_.abilities = new Vector.<AbilityDef>();
                  }
                  for each(_loc24_ in _loc11_.abilities)
                  {
                     _loc7_.abilities.push(ObjectHelper.§'A§(_loc24_));
                  }
               }
               if(_loc11_.abilityMod)
               {
                  _loc25_ = _loc11_.abilityMod;
                  for each(_loc26_ in _loc7_.abilities)
                  {
                     if(!_loc25_.cooldownAsScale)
                     {
                        _loc26_.cooldown += _loc25_.cooldown;
                     }
                     else
                     {
                        _loc26_.cooldown *= _loc25_.cooldown;
                     }
                  }
               }
               if(_loc11_.weaponMod)
               {
                  _loc27_ = _loc11_.weaponMod;
                  _loc28_ = null;
                  if(_loc7_.weapons == null)
                  {
                     _loc28_ = new Vector.<Weapon>();
                  }
                  else
                  {
                     _loc28_ = _loc7_.weapons.concat();
                  }
                  for each(_loc12_ in _loc28_)
                  {
                     _loc29_ = _loc12_ as LaunchAircraft;
                     if(_loc29_ != null)
                     {
                        _loc28_ = _loc28_.concat(_loc29_.aircraftWeapon);
                     }
                  }
                  for each(_loc12_ in _loc28_)
                  {
                     if(!(_loc27_.specific != null && _loc27_.specific != _loc12_.id))
                     {
                        _loc30_ = _loc12_ as HasRange;
                        if(_loc30_)
                        {
                           if(!_loc27_.rangeAsScale)
                           {
                              _loc30_.range += _loc27_.range;
                           }
                           else
                           {
                              _loc30_.range *= _loc27_.range;
                           }
                        }
                        _loc31_ = _loc12_ as HasReloadTime;
                        if(_loc31_)
                        {
                           if(!_loc27_.reloadTimeAsScale)
                           {
                              _loc31_.reloadTime += _loc27_.reloadTime;
                              if(_loc31_.reloadTime < 1 / 30)
                              {
                                 _loc31_.reloadTime = 1 / 30;
                              }
                           }
                           else
                           {
                              _loc31_.reloadTime *= _loc27_.reloadTime;
                              if(_loc31_.reloadTime < 1 / 30)
                              {
                                 _loc31_.reloadTime = 1 / 30;
                              }
                           }
                        }
                        _loc32_ = _loc12_ as HasPower;
                        if(_loc32_)
                        {
                           _loc32_.power += _loc27_.power;
                        }
                        _loc33_ = _loc12_ as HasSpread;
                        if(_loc33_)
                        {
                           _loc33_.spread += _loc27_.spread;
                        }
                        _loc34_ = _loc12_ as Spread;
                        if(_loc34_)
                        {
                           _loc34_.count += _loc27_.count;
                        }
                        if(_loc27_.addChild)
                        {
                           _loc35_ = _loc12_ as HasChildWeapons;
                           if(_loc35_)
                           {
                              if(_loc35_.childWeapons == null)
                              {
                                 _loc35_.childWeapons = new Vector.<Weapon>();
                              }
                              _loc35_.childWeapons.push(_loc27_.addChild);
                           }
                        }
                        if(_loc27_.removeChild != null)
                        {
                           _loc35_ = _loc12_ as HasChildWeapons;
                           if((Boolean(_loc35_)) && _loc35_.childWeapons != null)
                           {
                              for each(_loc36_ in _loc35_.childWeapons)
                              {
                                 if(_loc27_.removeChild.id == _loc36_.id)
                                 {
                                    _loc35_.childWeapons.splice(_loc35_.childWeapons.indexOf(_loc36_),1);
                                    break;
                                 }
                              }
                           }
                        }
                        if(_loc27_.projectileMod)
                        {
                           _loc37_ = new Vector.<ProjectileDef>();
                           _loc38_ = _loc12_ as HasProjectile;
                           if((Boolean(_loc38_)) && Boolean(_loc38_.projectile))
                           {
                              _loc37_.push(_loc38_.projectile);
                              if(Boolean(_loc38_.projectile.behavior) && Boolean(_loc38_.projectile.behavior.destroy))
                              {
                                 _loc41_ = _loc38_.projectile.behavior.destroy as SpawnProjectile;
                                 if((Boolean(_loc41_)) && Boolean(_loc41_.projectile))
                                 {
                                    _loc37_.push(_loc41_.projectile);
                                 }
                              }
                              if(Boolean(_loc38_.projectile.behavior) && Boolean(_loc38_.projectile.behavior.collision))
                              {
                                 _loc42_ = _loc38_.projectile.behavior.collision as CollisionSpawnProjectile;
                                 if((Boolean(_loc42_)) && Boolean(_loc42_.projectile))
                                 {
                                    _loc37_.push(_loc42_.projectile);
                                    if(_loc42_.next)
                                    {
                                       _loc43_ = _loc42_.next as SpawnSpreadCollision;
                                       if(_loc43_)
                                       {
                                          _loc37_.push(_loc43_.projectile);
                                          if(Boolean(_loc43_.projectile.behavior) && Boolean(_loc43_.projectile.behavior.destroy))
                                          {
                                             _loc44_ = _loc43_.projectile.behavior.destroy as SpawnProjectile;
                                             if(_loc44_)
                                             {
                                                _loc37_.push(_loc44_.projectile);
                                             }
                                          }
                                       }
                                    }
                                 }
                              }
                           }
                           _loc39_ = _loc12_ as HasChildWeapons;
                           if(_loc39_)
                           {
                              for each(_loc45_ in _loc39_.childWeapons)
                              {
                                 _loc46_ = _loc45_ as HasProjectile;
                                 if(_loc46_ != null)
                                 {
                                    _loc37_.push(_loc46_.projectile);
                                    if(Boolean(_loc46_.projectile.behavior) && Boolean(_loc46_.projectile.behavior.destroy))
                                    {
                                       _loc41_ = _loc46_.projectile.behavior.destroy as SpawnProjectile;
                                       if((Boolean(_loc41_)) && Boolean(_loc41_.projectile))
                                       {
                                          _loc37_.push(_loc41_.projectile);
                                       }
                                    }
                                    if(Boolean(_loc46_.projectile.behavior) && Boolean(_loc46_.projectile.behavior.collision))
                                    {
                                       _loc42_ = _loc46_.projectile.behavior.collision as CollisionSpawnProjectile;
                                       if((Boolean(_loc42_)) && Boolean(_loc42_.projectile))
                                       {
                                          _loc37_.push(_loc42_.projectile);
                                       }
                                    }
                                 }
                              }
                           }
                           for each(_loc40_ in _loc37_)
                           {
                              if(_loc40_ != null)
                              {
                                 if(!_loc27_.projectileMod.pierceAsScale)
                                 {
                                    _loc40_.pierce += _loc27_.projectileMod.pierce;
                                 }
                                 else
                                 {
                                    _loc40_.pierce *= _loc27_.projectileMod.pierce;
                                 }
                                 _loc40_.radius += _loc27_.projectileMod.radius;
                                 if(_loc27_.projectileMod.display != null)
                                 {
                                    for each(_loc48_ in _loc27_.projectileMod.display)
                                    {
                                       if(_loc48_.useFor == _loc40_.display)
                                       {
                                          _loc40_.display = _loc48_.display;
                                          _loc40_.additiveBlend = _loc48_.additiveBlend;
                                       }
                                    }
                                 }
                                 if(Boolean(_loc40_.behavior) && Boolean(_loc40_.behavior.destroy))
                                 {
                                    _loc41_ = _loc40_.behavior.destroy as SpawnProjectile;
                                    if((Boolean(_loc41_)) && Boolean(_loc41_.projectile) && _loc41_.projectile.display != null)
                                    {
                                       for each(_loc48_ in _loc27_.projectileMod.display)
                                       {
                                          if(_loc48_.useFor == _loc41_.projectile.display)
                                          {
                                             _loc41_.projectile.display = _loc48_.display;
                                          }
                                       }
                                    }
                                 }
                                 if(_loc27_.projectileMod.popCashScale)
                                 {
                                    _loc40_.popCashScale += _loc27_.projectileMod.popCashScale;
                                 }
                                 _loc47_ = _loc27_.projectileMod.behaviorMod;
                                 if(_loc47_)
                                 {
                                    if(_loc47_.setProcess)
                                    {
                                       if(!_loc40_.behavior)
                                       {
                                          _loc40_.behavior = new projectiles.behavior.BehaviorDef();
                                       }
                                       _loc40_.behavior.process = _loc47_.setProcess;
                                    }
                                    if(_loc47_.addDestroy)
                                    {
                                       if(Boolean(_loc40_.behavior) && Boolean(_loc40_.behavior.destroy))
                                       {
                                          _loc40_.behavior.destroy.next = ObjectHelper.§'A§(_loc47_.addDestroy) as BehaviorDestroy;
                                       }
                                       else
                                       {
                                          if(!_loc40_.behavior)
                                          {
                                             _loc40_.behavior = new projectiles.behavior.BehaviorDef();
                                          }
                                          _loc40_.behavior.destroy = ObjectHelper.§'A§(_loc47_.addDestroy) as BehaviorDestroy;
                                          _loc49_ = _loc40_.behavior.destroy as SpawnProjectile;
                                          if(_loc49_)
                                          {
                                             if(Boolean(_loc40_.glueEffect) && _loc40_.glueEffect.soak)
                                             {
                                                if(_loc49_.projectile.glueEffect == null)
                                                {
                                                   _loc49_.projectile.glueEffect = new GlueEffectDef();
                                                }
                                                _loc49_.projectile.glueEffect.soak = _loc40_.glueEffect.soak;
                                                _loc49_.projectile.glueEffect.corosionInterval = _loc40_.glueEffect.corosionInterval;
                                                _loc40_.glueEffect.lifespan = _loc40_.glueEffect.lifespan;
                                             }
                                          }
                                       }
                                    }
                                    if(_loc47_.addCollision)
                                    {
                                       if(Boolean(_loc40_.behavior) && Boolean(_loc40_.behavior.collision))
                                       {
                                          _loc40_.behavior.collision.next = ObjectHelper.§'A§(_loc47_.addCollision) as BehaviorCollision;
                                       }
                                       else
                                       {
                                          _loc50_ = true;
                                          _loc51_ = _loc47_.addCollision as SpawnSpreadCollision;
                                          if((Boolean(_loc51_)) && _loc51_.projectile.display == FragShard)
                                          {
                                             _loc50_ = false;
                                          }
                                          if(_loc50_)
                                          {
                                             if(!_loc40_.behavior)
                                             {
                                                _loc40_.behavior = new projectiles.behavior.BehaviorDef();
                                             }
                                             _loc40_.behavior.collision = ObjectHelper.§'A§(_loc47_.addCollision) as BehaviorCollision;
                                             _loc49_ = _loc40_.behavior.collision as SpawnProjectile;
                                             if(_loc49_)
                                             {
                                                if(Boolean(_loc40_.glueEffect) && _loc40_.glueEffect.soak)
                                                {
                                                   if(_loc49_.projectile.glueEffect == null)
                                                   {
                                                      _loc49_.projectile.glueEffect = new GlueEffectDef();
                                                   }
                                                   _loc49_.projectile.glueEffect.soak = _loc40_.glueEffect.soak;
                                                   _loc49_.projectile.glueEffect.corosionInterval = _loc40_.glueEffect.corosionInterval;
                                                   _loc40_.glueEffect.lifespan = _loc40_.glueEffect.lifespan;
                                                }
                                             }
                                          }
                                       }
                                    }
                                 }
                                 if(_loc27_.projectileMod.iceEffectMod)
                                 {
                                    if(!_loc27_.projectileMod.iceEffectMod.lifespanAsScale)
                                    {
                                       _loc40_.iceEffect.lifespan += _loc27_.projectileMod.iceEffectMod.lifespan;
                                    }
                                    else
                                    {
                                       _loc40_.iceEffect.lifespan *= _loc27_.projectileMod.iceEffectMod.lifespan;
                                    }
                                    _loc40_.iceEffect.freezeLayers += _loc27_.projectileMod.iceEffectMod.freezeLayers;
                                    _loc40_.iceEffect.permafrost += _loc27_.projectileMod.iceEffectMod.permafrost;
                                 }
                                 if(_loc27_.projectileMod.glueEffectMod)
                                 {
                                    if(_loc27_.projectileMod.glueEffectMod.soak)
                                    {
                                       _loc40_.glueEffect.soak = _loc27_.projectileMod.glueEffectMod.soak;
                                    }
                                    _loc40_.glueEffect.corosionInterval += _loc27_.projectileMod.glueEffectMod.corosionInterval;
                                    _loc40_.glueEffect.lifespan += _loc27_.projectileMod.glueEffectMod.lifespan;
                                    if(_loc27_.projectileMod.glueEffectMod.speedScaleAsScale)
                                    {
                                       _loc40_.glueEffect.speedScale *= _loc27_.projectileMod.glueEffectMod.speedScale;
                                    }
                                    else
                                    {
                                       _loc40_.glueEffect.speedScale += _loc27_.projectileMod.glueEffectMod.speedScale;
                                    }
                                 }
                                 if(_loc27_.projectileMod.stunEffectMod)
                                 {
                                    if(_loc40_.stunEffect == null)
                                    {
                                       _loc40_.stunEffect = new StunEffectDef();
                                    }
                                    if(_loc27_.projectileMod.stunEffectMod.lifespanAsScale)
                                    {
                                       _loc40_.stunEffect.lifespan *= _loc27_.projectileMod.stunEffectMod.lifespan;
                                    }
                                    else
                                    {
                                       _loc40_.stunEffect.lifespan += _loc27_.projectileMod.stunEffectMod.lifespan;
                                    }
                                    _loc40_.stunEffect.cantEffect = _loc27_.projectileMod.stunEffectMod.cantEffect;
                                 }
                                 if(_loc27_.projectileMod.burnEffectMod)
                                 {
                                    if(_loc40_.burnEffect == null)
                                    {
                                       _loc40_.burnEffect = new BurnEffectDef();
                                    }
                                    _loc40_.burnEffect.lifespan += _loc27_.projectileMod.burnEffectMod.lifespan;
                                    _loc40_.burnEffect.burnInterval += _loc27_.projectileMod.burnEffectMod.burnInterval;
                                 }
                                 if(_loc27_.projectileMod.windeffectMod)
                                 {
                                    if(_loc40_.windEffect == null)
                                    {
                                       _loc40_.windEffect = new WindEffectDef();
                                    }
                                    _loc40_.windEffect.chance += _loc27_.projectileMod.windeffectMod.chance;
                                 }
                                 if(_loc27_.projectileMod.removeFromEffectMask != null && _loc40_.effectMask != null)
                                 {
                                    for each(_loc52_ in _loc27_.projectileMod.removeFromEffectMask)
                                    {
                                       _loc53_ = _loc40_.effectMask.indexOf(_loc52_);
                                       if(_loc53_ != -1)
                                       {
                                          _loc40_.effectMask.splice(_loc53_,1);
                                       }
                                    }
                                 }
                                 if(_loc27_.projectileMod.damageEffectMod)
                                 {
                                    if(_loc40_.damageEffect == null)
                                    {
                                       _loc40_.damageEffect = new DamageEffectDef();
                                    }
                                    _loc40_.damageEffect.damage += _loc27_.projectileMod.damageEffectMod.damage;
                                    if(_loc27_.projectileMod.damageEffectMod.canBreakIce)
                                    {
                                       _loc40_.damageEffect.canBreakIce = true;
                                    }
                                    if(_loc27_.projectileMod.damageEffectMod.removeFromCantBreak != null && _loc40_.damageEffect != null && _loc40_.damageEffect.cantBreak != null)
                                    {
                                       for each(_loc52_ in _loc27_.projectileMod.damageEffectMod.removeFromCantBreak)
                                       {
                                          _loc53_ = _loc40_.damageEffect.cantBreak.indexOf(_loc52_);
                                          if(_loc53_ != -1)
                                          {
                                             _loc40_.damageEffect.cantBreak.splice(_loc53_,1);
                                          }
                                       }
                                    }
                                 }
                              }
                           }
                        }
                     }
                  }
               }
            }
         }
         _loc6_ = new Cache();
         _loc6_.tower = param1;
         _loc6_.upgrades = _loc3_;
         _loc6_.result = _loc7_;
         cache.push(_loc6_);
         return _loc7_;
      }
   }
}

