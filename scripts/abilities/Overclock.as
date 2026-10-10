package abilities
{
   import abilities.def.AbilityDef;
   import assests.effects.EngineerAura;
   import assests.effects.EngineerAura2;
   import entities.Effect;
   import entities.TimedEffect;
   import towers.Tower;
   import towers.behavior.roundStart.BananaEmitter;
   import towers.upgrades.AddDef;
   import towers.upgrades.ProjectileModDef;
   import towers.upgrades.UpgradeDef;
   import towers.upgrades.WeaponModDef;
   import weapons.HasReloadTime;
   
   public class Overclock extends Ability
   {
      
      private static var overclockCombat:UpgradeDef = new UpgradeDef().Id("OverclockCombat").Add(new AddDef().WeaponMod(new WeaponModDef().ReloadTime(0.5).ReloadTimeAsScale(true)));
      
      private static var overclockPierce:UpgradeDef = new UpgradeDef().Id("OverclockPierce").Add(new AddDef().WeaponMod(new WeaponModDef().ProjectileMod(new ProjectileModDef().Pierce(2).PierceAsScale(2))));
      
      private static var overclockVillage:UpgradeDef = new UpgradeDef().Id("OverclockVillage").Add(new AddDef().RangeOfVisibility(1.25).RangeOfVisibilityAsScale(true));
      
      private var wrenchX:int = 0;
      
      private var wrenchY:int = 0;
      
      public var success:Boolean = false;
      
      public function Overclock(wrenchX:int, wrenchY:int)
      {
         this.wrenchX = wrenchX;
         this.wrenchY = wrenchY;
         super();
      }
      
      public static function getTarget(param1:Tower, wrenchX:int, wrenchY:int) : Tower
      {
         var search:Vector.<Tower> = param1.levelSlug.§?0§;
         var minDist:Number = 100000000;
         var selected:Tower = null;
         for each(var t:Tower in search)
         {
            var dx:Number = t.x - wrenchX;
            var dy:Number = t.y - wrenchY;
            var dist:Number = dx * dx + dy * dy;
            if(dist <= minDist && t.def != null)
            {
               minDist = dist;
               selected = t;
            }
         }
         if(§?V§.instance.§"0§.§-W§ == param1.levelSlug && minDist > 2500)
         {
            return null;
         }
         return selected;
      }
      
      override public function execute(param1:Tower, param2:AbilityDef) : void
      {
         var _loc3_:Tower = getTarget(param1,wrenchX,wrenchY);
         var _loc5_:TimedEffect = null;
         var _loc6_:Effect = null;
         var _loc8_:HasReloadTime = null;
         if(_loc3_ == null)
         {
            return;
         }
         param1.§>2§["OverclockPick"].reset();
         param1.§>2§["OverclockPick"].start();
         var _loc4_:UpgradeDef = overclockCombat;
         if(_loc3_.def.weapons != null && _loc3_.def.weapons[0] is HasReloadTime)
         {
            _loc8_ = _loc3_.def.weapons[0] as HasReloadTime;
            if(_loc8_.reloadTime <= 1 / 30)
            {
               _loc4_ = overclockPierce;
            }
         }
         if(_loc3_.§`!§ == "BananaFarm")
         {
            BananaEmitter.cancel = false;
            _loc3_.def.behavior.roundStart.execute(_loc3_);
            BananaEmitter.cancel = true;
            this.success = true;
            return;
         }
         if(_loc3_.§`!§ == "MonkeyVillage")
         {
            _loc4_ = overclockVillage;
         }
         new TempUpgradeInstance(_loc3_,_loc4_,60);
         _loc5_ = new TimedEffect();
         _loc5_.initialise(EngineerAura2,3,60,_loc3_);
         _loc5_.x = _loc3_.x;
         _loc5_.y = _loc3_.y;
         _loc5_.z = _loc3_.z - 0.001;
         param1.levelSlug.§?3§(_loc5_);
         _loc6_ = new Effect();
         _loc6_.initialise(EngineerAura,3);
         _loc6_.x = _loc3_.x;
         _loc6_.y = _loc3_.y;
         param1.levelSlug.§?3§(_loc6_);
         super.execute(param1,param2);
         this.success = true;
      }
   }
}

