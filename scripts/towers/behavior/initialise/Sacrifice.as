package towers.behavior.initialise
{
   import assests.effects.DartMonkeyLightningblast;
   import assests.effects.MonkeyGod;
   import assets.projectile.Blade;
   import assets.projectile.Dart;
   import assets.projectile.GodGlueShot;
   import assets.projectile.GodGlueSplat;
   import assets.projectile.IceBolt;
   import assets.projectile.IceExplosion;
   import assets.projectile.IceExplosionLarge;
   import assets.projectile.IceExplosionMedium;
   import assets.projectile.NuclearExplosion;
   import assets.projectile.SunBall;
   import assets.projectile.TempleMissile;
   import assets.projectile.Tornado;
   import assets.sound.TempleSacrifice;
   import bloons.Bloon;
   import entities.Effect;
   import flash.events.Event;
   import flash.utils.Dictionary;
   import projectiles.behavior.BehaviorDef;
   import projectiles.behavior.collision.CollisionSpawnProjectile;
   import projectiles.def.DamageEffectDef;
   import projectiles.def.GlueEffectDef;
   import projectiles.def.IceEffectDef;
   import projectiles.def.ProjectileDef;
   import projectiles.def.WindEffectDef;
   import sound.§^5§;
   import towers.Tower;
   import towers.behavior.BehaviorDef;
   import towers.behavior.destroy.RetractArcticWind;
   import towers.def.AreaEffectDef;
   import towers.upgrades.AddDef;
   import towers.upgrades.BehaviorModDef;
   import towers.upgrades.Combinator;
   import towers.upgrades.UpgradeDef;
   import utils.§-B§;
   import weapons.Single;
   import weapons.SingleAtMultiTarget;
   import weapons.Spread;
   import weapons.Weapon;
   
   public class Sacrifice extends BehaviorInitialise
   {
      
      public static const SACRIFICE_TYPE_FREEZE:* = 0;
      
      public static const SACRIFICE_TYPE_EXPLOSION:* = 1;
      
      public static const SACRIFICE_TYPE_SHARP:* = 2;
      
      public static const SACRIFICE_TYPE_GLUE:* = 3;
      
      public static const SACRIFICE_TYPE_WIND:* = 4;
      
      public static var sacrificeSpentOn:Dictionary = new Dictionary();
      
      public static var dont:Vector.<Tower> = new Vector.<Tower>();
      
      internal static var dart:ProjectileDef = new ProjectileDef().Display(Dart).Pierce(20).EffectMask(Vector.<int>([Bloon.§>K§])).DamageEffect(new DamageEffectDef().Damage(2).CantBreak(Vector.<int>([Bloon.§?<§])).CanBreakIce(false)).ZOffset(0.01);
      
      internal static var dart2:ProjectileDef = new ProjectileDef().Display(Dart).Pierce(30).EffectMask(Vector.<int>([Bloon.§>K§])).DamageEffect(new DamageEffectDef().Damage(3).CantBreak(Vector.<int>([Bloon.§?<§])).CanBreakIce(false)).ZOffset(0.01);
      
      internal static var blade:ProjectileDef = new ProjectileDef().Display(Blade).Pierce(40).Radius(4).EffectMask(Vector.<int>([Bloon.§>K§])).DamageEffect(new DamageEffectDef().Damage(4).CantBreak(Vector.<int>([Bloon.§?<§])).CanBreakIce(false)).ZOffset(0.01);
      
      internal static var bladePlasma:ProjectileDef = new ProjectileDef().Display(Blade).Pierce(40).Radius(4).EffectMask(Vector.<int>([Bloon.§>K§])).DamageEffect(new DamageEffectDef().Damage(4).CanBreakIce(true)).ZOffset(0.01);
      
      internal static var iceExplosion:ProjectileDef = new ProjectileDef().Display(IceExplosion).Pierce(999).Radius(200).EffectMask(Vector.<int>([Bloon.§>K§])).DamageEffect(new DamageEffectDef().Damage(1).CanBreakIce(true)).IceEffect(new IceEffectDef().Lifespan(1.5)).ZOffset(0.01);
      
      internal static var iceBomb:ProjectileDef = new ProjectileDef().Display(IceBolt).Pierce(1).Radius(5).EffectMask(Vector.<int>([Bloon.§>K§])).Behavior(new projectiles.behavior.BehaviorDef().Collision(new CollisionSpawnProjectile().Projectile(iceExplosion))).ZOffset(0.01);
      
      internal static var iceExplosion2:ProjectileDef = new ProjectileDef().Display(IceExplosionMedium).Pierce(999).Radius(250).EffectMask(Vector.<int>([Bloon.§>K§])).DamageEffect(new DamageEffectDef().Damage(1).CanBreakIce(true)).IceEffect(new IceEffectDef().Lifespan(2)).ZOffset(0.01);
      
      internal static var iceBomb2:ProjectileDef = new ProjectileDef().Display(IceBolt).Pierce(1).Radius(5).EffectMask(Vector.<int>([Bloon.§>K§])).Behavior(new projectiles.behavior.BehaviorDef().Collision(new CollisionSpawnProjectile().Projectile(iceExplosion2))).ZOffset(0.01);
      
      internal static var iceExplosion3:ProjectileDef = new ProjectileDef().Display(IceExplosionMedium).Pierce(999).Radius(250).EffectMask(Vector.<int>([Bloon.§>K§])).DamageEffect(new DamageEffectDef().Damage(1).CanBreakIce(true)).IceEffect(new IceEffectDef().Lifespan(2).FreezeLayers(2)).ZOffset(0.01);
      
      internal static var iceBomb3:ProjectileDef = new ProjectileDef().Display(IceBolt).Pierce(1).Radius(5).EffectMask(Vector.<int>([Bloon.§>K§])).Behavior(new projectiles.behavior.BehaviorDef().Collision(new CollisionSpawnProjectile().Projectile(iceExplosion3))).ZOffset(0.01);
      
      internal static var iceExplosion4:ProjectileDef = new ProjectileDef().Display(IceExplosionLarge).Pierce(999).Radius(300).EffectMask(Vector.<int>([Bloon.§>K§])).DamageEffect(new DamageEffectDef().Damage(1).CanBreakIce(true)).IceEffect(new IceEffectDef().Lifespan(2.5).FreezeLayers(2)).ZOffset(0.01);
      
      internal static var iceBomb4:ProjectileDef = new ProjectileDef().Display(IceBolt).Pierce(1).Radius(5).EffectMask(Vector.<int>([Bloon.§>K§])).Behavior(new projectiles.behavior.BehaviorDef().Collision(new CollisionSpawnProjectile().Projectile(iceExplosion4))).ZOffset(0.01);
      
      internal static var missileExplosion:ProjectileDef = new ProjectileDef().Display(NuclearExplosion).Pierce(200).Radius(200).EffectMask(Vector.<int>([Bloon.§>K§])).DamageEffect(new DamageEffectDef().Damage(1).CanBreakIce(true)).ZOffset(0.01);
      
      internal static var missile:ProjectileDef = new ProjectileDef().Display(TempleMissile).Pierce(1).Radius(5).EffectMask(Vector.<int>([Bloon.§>K§])).Behavior(new projectiles.behavior.BehaviorDef().Collision(new CollisionSpawnProjectile().Projectile(missileExplosion))).ZOffset(0.01);
      
      internal static var missileExplosion2:ProjectileDef = new ProjectileDef().Display(NuclearExplosion).Pierce(200).Radius(200).EffectMask(Vector.<int>([Bloon.§>K§])).DamageEffect(new DamageEffectDef().Damage(2).CanBreakIce(true)).ZOffset(0.01);
      
      internal static var missile2:ProjectileDef = new ProjectileDef().Display(TempleMissile).Pierce(1).Radius(5).EffectMask(Vector.<int>([Bloon.§>K§])).Behavior(new projectiles.behavior.BehaviorDef().Collision(new CollisionSpawnProjectile().Projectile(missileExplosion2))).ZOffset(0.01);
      
      internal static var missileExplosion3:ProjectileDef = new ProjectileDef().Display(NuclearExplosion).Pierce(150).Radius(150).EffectMask(Vector.<int>([Bloon.§>K§])).DamageEffect(new DamageEffectDef().Damage(2).CanBreakIce(true)).ZOffset(0.01);
      
      internal static var missile3:ProjectileDef = new ProjectileDef().Display(TempleMissile).Pierce(1).Radius(5).EffectMask(Vector.<int>([Bloon.§>K§])).Behavior(new projectiles.behavior.BehaviorDef().Collision(new CollisionSpawnProjectile().Projectile(missileExplosion3))).ZOffset(0.01);
      
      internal static var missileExplosion4:ProjectileDef = new ProjectileDef().Display(NuclearExplosion).Pierce(150).Radius(150).EffectMask(Vector.<int>([Bloon.§>K§])).DamageEffect(new DamageEffectDef().Damage(2).CanBreakIce(true).BlimpScale(10)).ZOffset(0.01);
      
      internal static var missile4:ProjectileDef = new ProjectileDef().Display(TempleMissile).Pierce(1).Radius(5).EffectMask(Vector.<int>([Bloon.§>K§])).Behavior(new projectiles.behavior.BehaviorDef().Collision(new CollisionSpawnProjectile().Projectile(missileExplosion4))).ZOffset(0.01);
      
      internal static var glueExplosion:ProjectileDef = new ProjectileDef().Display(GodGlueSplat).Pierce(150).Radius(30).EffectMask(Vector.<int>([Bloon.§>K§])).GlueEffect(new GlueEffectDef().SpeedScale(0.5).Lifespan(22.86).Soak(true)).ZOffset(0.01);
      
      internal static var glue:ProjectileDef = new ProjectileDef().Display(GodGlueShot).Pierce(1).Radius(5).EffectMask(Vector.<int>([Bloon.§>K§])).Behavior(new projectiles.behavior.BehaviorDef().Collision(new CollisionSpawnProjectile().Projectile(glueExplosion))).ZOffset(0.01);
      
      internal static var glueExplosion2:ProjectileDef = new ProjectileDef().Display(GodGlueSplat).Pierce(150).Radius(30).EffectMask(Vector.<int>([Bloon.§>K§])).GlueEffect(new GlueEffectDef().SpeedScale(0.5).Lifespan(22.86).Soak(true).CorosionInterval(2.29)).ZOffset(0.01);
      
      internal static var glue2:ProjectileDef = new ProjectileDef().Display(GodGlueShot).Pierce(1).Radius(5).EffectMask(Vector.<int>([Bloon.§>K§])).Behavior(new projectiles.behavior.BehaviorDef().Collision(new CollisionSpawnProjectile().Projectile(glueExplosion2))).ZOffset(0.01);
      
      internal static var glueExplosion3:ProjectileDef = new ProjectileDef().Display(GodGlueSplat).Pierce(150).Radius(36).EffectMask(Vector.<int>([Bloon.§>K§])).GlueEffect(new GlueEffectDef().SpeedScale(0.5).Lifespan(22.86).Soak(true).CorosionInterval(1)).ZOffset(0.01);
      
      internal static var glue3:ProjectileDef = new ProjectileDef().Display(GodGlueShot).Pierce(1).Radius(5).EffectMask(Vector.<int>([Bloon.§>K§])).Behavior(new projectiles.behavior.BehaviorDef().Collision(new CollisionSpawnProjectile().Projectile(glueExplosion3))).ZOffset(0.01);
      
      internal static var glueExplosion4:ProjectileDef = new ProjectileDef().Display(GodGlueSplat).Pierce(150).Radius(43).EffectMask(Vector.<int>([Bloon.§>K§])).GlueEffect(new GlueEffectDef().SpeedScale(0.5).Lifespan(22.86).Soak(true).CorosionInterval(0.5)).DamageEffect(new DamageEffectDef().Damage(1).CanBreakIce(true)).ZOffset(0.01);
      
      internal static var glue4:ProjectileDef = new ProjectileDef().Display(GodGlueShot).Pierce(1).Radius(5).EffectMask(Vector.<int>([Bloon.§>K§])).Behavior(new projectiles.behavior.BehaviorDef().Collision(new CollisionSpawnProjectile().Projectile(glueExplosion3))).ZOffset(0.01);
      
      internal static var glueExplosion5:ProjectileDef = new ProjectileDef().Display(GodGlueSplat).Pierce(150).Radius(52).EffectMask(Vector.<int>([Bloon.§>K§])).GlueEffect(new GlueEffectDef().SpeedScale(0.5).Lifespan(22.86).Soak(true).CorosionInterval(0.5)).DamageEffect(new DamageEffectDef().Damage(1).CanBreakIce(true)).ZOffset(0.01);
      
      internal static var glue5:ProjectileDef = new ProjectileDef().Display(GodGlueShot).Pierce(1).Radius(5).EffectMask(Vector.<int>([Bloon.§>K§])).Behavior(new projectiles.behavior.BehaviorDef().Collision(new CollisionSpawnProjectile().Projectile(glueExplosion3))).ZOffset(0.01);
      
      internal static var whirlwind:ProjectileDef = new ProjectileDef().Display(Tornado).Pierce(60).Radius(30).EffectMask(Vector.<int>([Bloon.§>K§])).WindEffect(new WindEffectDef().Speed(300)).ZOffset(0.01);
      
      internal static var whirlwind2:ProjectileDef = new ProjectileDef().Display(Tornado).Pierce(90).Radius(30).EffectMask(Vector.<int>([Bloon.§>K§])).WindEffect(new WindEffectDef().Speed(300)).ZOffset(0.01);
      
      internal static var whirlwind3:ProjectileDef = new ProjectileDef().Display(Tornado).Pierce(120).Radius(30).EffectMask(Vector.<int>([Bloon.§>K§])).WindEffect(new WindEffectDef().Speed(300)).DamageEffect(new DamageEffectDef().Damage(1).CanBreakIce(true)).ZOffset(0.01);
      
      internal static var whirlwind4:ProjectileDef = new ProjectileDef().Display(Tornado).Pierce(150).Radius(30).EffectMask(Vector.<int>([Bloon.§>K§])).WindEffect(new WindEffectDef().Speed(300)).DamageEffect(new DamageEffectDef().Damage(1).CanBreakIce(true)).ZOffset(0.01);
      
      internal static var whirlwind5:ProjectileDef = new ProjectileDef().Display(Tornado).Pierce(150).Radius(30).EffectMask(Vector.<int>([Bloon.§>K§])).WindEffect(new WindEffectDef().Speed(300)).DamageEffect(new DamageEffectDef().Damage(2).CanBreakIce(true)).ZOffset(0.01);
      
      internal static var stageGate:Vector.<int> = Vector.<int>([1500,4000,10000,30000]);
      
      internal static var sharpUpgrades:Vector.<UpgradeDef> = Vector.<UpgradeDef>([new UpgradeDef().Id("templeSharp1").Add(new AddDef().Weapons(Vector.<Weapon>([new Spread().Count(16).Angle(Math.PI * 2 * 15 / 16).ReloadTime(0.8).Projectile(dart).Range(1000).Power(600).Rotate(false)]))),new UpgradeDef().Id("templeSharp2").Add(new AddDef().Weapons(Vector.<Weapon>([new Spread().Count(16).Angle(Math.PI * 2 * 15 / 16).ReloadTime(0.8).Projectile(dart2).Range(1000).Power(600).Rotate(false)]))),new UpgradeDef().Id("templeSharp3").Add(new AddDef().Weapons(Vector.<Weapon>([new Spread().Count(16).Angle(Math.PI * 2 * 15 / 16).ReloadTime(0.8).Projectile(blade).Range(1000).Power(600).Rotate(false)]))),new UpgradeDef().Id("templeSharp4").Add(new AddDef().Weapons(Vector.<Weapon>([new Spread().Count(16).Angle(Math.PI * 2 * 31 / 32).ReloadTime(0.8).Projectile(blade).Range(1000).Power(600).Rotate(false)]))),new UpgradeDef().Id("templeSharp5").Add(new AddDef().Weapons(Vector.<Weapon>([new Spread().Count(16).Angle(Math
      .PI * 2 * 31 / 32).ReloadTime(0.8).Projectile(bladePlasma).Range(1000).Power(600).Rotate(false)])))]);
      
      internal static var freezeUpgrades:Vector.<UpgradeDef> = Vector.<UpgradeDef>([new UpgradeDef().Id("templeFreeze1").Add(new AddDef().Weapons(Vector.<Weapon>([new Single().ReloadTime(2).Projectile(iceBomb).Range(1000).Power(600).Rotate(false)]))),new UpgradeDef().Id("templeFreeze2").Add(new AddDef().Weapons(Vector.<Weapon>([new Single().ReloadTime(2).Projectile(iceBomb2).Range(1000).Power(600).Rotate(false)]))),new UpgradeDef().Id("templeFreeze3").Add(new AddDef().Weapons(Vector.<Weapon>([new Single().ReloadTime(2).Projectile(iceBomb3).Range(1000).Power(600).Rotate(false)]))),new UpgradeDef().Id("templeFreeze4").Add(new AddDef().Weapons(Vector.<Weapon>([new Single().ReloadTime(2).Projectile(iceBomb4).Range(1000).Power(600).Rotate(false)]))),new UpgradeDef().Id("templeFreeze5").Add(new AddDef().Behavior(new BehaviorModDef().BehaviorSet(new towers.behavior.BehaviorDef().Initialise(new SpawnArcticWind()).Destroy(new RetractArcticWind()))).Weapons(Vector.<Weapon>([new Single().ReloadTime(2).Projectile(iceBomb4)
      .Range(1000).Power(600).Rotate(false)])))]);
      
      internal static var explosionUpgrades:Vector.<UpgradeDef> = Vector.<UpgradeDef>([new UpgradeDef().Id("explosionUpgrade1").Add(new AddDef().Weapons(Vector.<Weapon>([new Single().ReloadTime(1).Projectile(missile).Range(1000).Power(600).Rotate(false)]))),new UpgradeDef().Id("explosionUpgrade2").Add(new AddDef().Weapons(Vector.<Weapon>([new Single().ReloadTime(1).Projectile(missile2).Range(1000).Power(600).Rotate(false)]))),new UpgradeDef().Id("explosionUpgrade3").Add(new AddDef().Weapons(Vector.<Weapon>([new SingleAtMultiTarget().ReloadTime(1).Projectile(missile3).Range(1000).Power(600).Count(3).Rotate(false)]))),new UpgradeDef().Id("explosionUpgrade4").Add(new AddDef().Weapons(Vector.<Weapon>([new SingleAtMultiTarget().ReloadTime(1).Projectile(missile4).Range(1000).Power(600).Count(3).Rotate(false)]))),new UpgradeDef().Id("explosionUpgrade5").Add(new AddDef().Weapons(Vector.<Weapon>([new SingleAtMultiTarget().ReloadTime(1).Projectile(missile4).Range(1000).Power(600).Count(6).Rotate(false)])))]);
      
      internal static var glueUpgrades:Vector.<UpgradeDef> = Vector.<UpgradeDef>([new UpgradeDef().Id("templeGlue1").Add(new AddDef().Weapons(Vector.<Weapon>([new Single().ReloadTime(0.5).Projectile(glue).Range(1000).Power(600).Rotate(false)]))),new UpgradeDef().Id("templeGlue2").Add(new AddDef().Weapons(Vector.<Weapon>([new Single().ReloadTime(0.5).Projectile(glue2).Range(1000).Power(600).Rotate(false)]))),new UpgradeDef().Id("templeGlue3").Add(new AddDef().Weapons(Vector.<Weapon>([new Single().ReloadTime(0.5).Projectile(glue3).Range(1000).Power(600).Rotate(false)]))),new UpgradeDef().Id("templeGlue4").Add(new AddDef().Weapons(Vector.<Weapon>([new Single().ReloadTime(0.5).Projectile(glue4).Range(1000).Power(600).Rotate(false)]))),new UpgradeDef().Id("templeGlue5").Add(new AddDef().Weapons(Vector.<Weapon>([new Single().ReloadTime(0.5).Projectile(glue5).Range(1000).Power(600).Rotate(false)])))]);
      
      internal static var windUpgrades:Vector.<UpgradeDef> = Vector.<UpgradeDef>([new UpgradeDef().Id("templeWind1").Add(new AddDef().Weapons(Vector.<Weapon>([new Single().Range(1000).Power(500).Projectile(whirlwind).ReloadTime(1.25).Rotate(false)]))),new UpgradeDef().Id("templeWind2").Add(new AddDef().Weapons(Vector.<Weapon>([new Single().Range(1000).Power(500).Projectile(whirlwind2).ReloadTime(1.25).Rotate(false)]))),new UpgradeDef().Id("templeWind3").Add(new AddDef().Weapons(Vector.<Weapon>([new Single().Range(1000).Power(500).Projectile(whirlwind3).ReloadTime(1.25).Rotate(false)]))),new UpgradeDef().Id("templeWind4").Add(new AddDef().Weapons(Vector.<Weapon>([new Single().Range(1000).Power(500).Projectile(whirlwind4).ReloadTime(1.25).Rotate(false)]))),new UpgradeDef().Id("templeWind5").Add(new AddDef().Weapons(Vector.<Weapon>([new Single().Range(1000).Power(500).Projectile(whirlwind5).ReloadTime(1.25).Rotate(false)])))]);
      
      internal static var upgrades:Dictionary = new Dictionary();
      
      public function Sacrifice()
      {
         super();
         upgrades[SACRIFICE_TYPE_FREEZE] = freezeUpgrades;
         upgrades[SACRIFICE_TYPE_EXPLOSION] = explosionUpgrades;
         upgrades[SACRIFICE_TYPE_SHARP] = sharpUpgrades;
         upgrades[SACRIFICE_TYPE_GLUE] = glueUpgrades;
         upgrades[SACRIFICE_TYPE_WIND] = windUpgrades;
      }
      
      public static function getGate(param1:int) : *
      {
         var _loc2_:* = int(stageGate.length - 1);
         while(_loc2_ >= 0)
         {
            if(param1 >= stageGate[_loc2_])
            {
               return _loc2_ + 1;
            }
            _loc2_--;
         }
         return 0;
      }
      
      public static function addUpgrades(param1:Tower, param2:Vector.<int>) : *
      {
         var _loc7_:int = 0;
         var _loc8_:Vector.<AreaEffectDef> = null;
         var _loc9_:int = 0;
         var _loc10_:AreaEffectDef = null;
         Sacrifice.sacrificeSpentOn[param1] = param2;
         var _loc3_:ProjectileDef = new ProjectileDef().Display(SunBall).Pierce(50).Radius(40).AdditiveBlend(true).EffectMask(Vector.<int>([Bloon.§>K§])).DamageEffect(new DamageEffectDef().Damage(3).CanBreakIce(true));
         var _loc4_:* = new UpgradeDef().Id("templePlasma").Add(new AddDef().Weapons(Vector.<Weapon>([new Single().ReloadTime(0.1).Projectile(_loc3_).Range(1000).Power(600).Rotate(false)])));
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         for each(_loc7_ in param2)
         {
            if(_loc7_ == 0)
            {
               _loc6_++;
            }
            else
            {
               _loc9_ = getGate(_loc7_);
               _loc5_ += _loc9_ + 1;
               param1.§7+§(upgrades[_loc6_][_loc9_],false);
               _loc6_++;
            }
         }
         _loc3_.pierce += 5 * _loc5_;
         _loc3_.damageEffect.damage += Math.floor(_loc5_ / 2);
         param1.§7+§(_loc4_,false);
         _loc8_ = param1.levelSlug.§,L§(param1.x,param1.y,param1);
         if(_loc8_ != null)
         {
            for each(_loc10_ in _loc8_)
            {
               if(_loc10_.upgrade != null)
               {
                  param1.§7+§(_loc10_.upgrade,false);
               }
            }
         }
         param1.initialise(Combinator.combine(§?V§.instance.§=K§.§4§("TempleOfTheMonkeyGod"),param1.upgrades),param1.levelSlug,false);
      }
      
      override public function execute(param1:Tower) : void
      {
         var sacrificedTowers:Vector.<Tower>;
         var mc:Effect = null;
         var tempTimer:§-B§ = null;
         var sT:Tower = null;
         var tID:String = null;
         var up:UpgradeDef = null;
         var tower:Tower = param1;
         if(tower.def.weapons != null || dont.indexOf(tower) != -1)
         {
            return;
         }
         dont.push(tower);
         sacrificeSpentOn[tower] = Vector.<int>([0,0,0,0,0]);
         new §^5§(TempleSacrifice).play();
         mc = new Effect();
         mc.initialise(MonkeyGod,4);
         mc.x = tower.x;
         mc.y = tower.y;
         tower.levelSlug.§?3§(mc);
         tower.pause = true;
         tower.pauseDraw = true;
         tempTimer = new §-B§((mc.clip.totalFrames - 2) / 30);
         tempTimer.extra = {"tower":tower};
         tempTimer.addEventListener(§-B§.COMPLETE,function(param1:Event):*
         {
            (param1.target as §-B§).extra.tower.pause = false;
            (param1.target as §-B§).extra.tower.pauseDraw = false;
            tempTimer.removeEventListener(§-B§.COMPLETE,arguments.callee);
            (param1.target as §-B§).extra.tower.rotation = 0;
            (param1.target as §-B§).extra.tower.addonRotation[(param1.target as §-B§).extra.tower.addonClips[0]] = Math.PI / 2;
         });
         tower.rotation = 0;
         sacrificedTowers = tower.levelSlug.§+9§(tower.x,tower.y,tower.def.rangeOfVisibility - 100);
         for each(sT in sacrificedTowers)
         {
            if(!(sT == tower || sT.def == null || !sT.§5N§ || sT.def.isPlatform))
            {
               mc = new Effect();
               mc.initialise(DartMonkeyLightningblast,4);
               mc.x = sT.x;
               mc.y = sT.y;
               tower.levelSlug.§?3§(mc);
               sacrificeSpentOn[tower][sT.def.sacrificeType] += sT.spentOn;
            }
         }
         for each(sT in sacrificedTowers)
         {
            if(!(sT == tower || sT.def == null || !sT.§5N§ || sT.def.isPlatform))
            {
               tID = sT.§`!§;
               tower.levelSlug.removeTower(sT);
               sT.destroy();
            }
         }
         tower.rotation = 0;
         if(tower.upgrades != null)
         {
            for each(up in tower.upgrades)
            {
               if(up.id != null && up.id.indexOf("Test") != -1)
               {
                  tower.removeUpgrade(up,false);
               }
            }
         }
         addUpgrades(tower,sacrificeSpentOn[tower]);
      }
   }
}

