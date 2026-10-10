package abilities
{
   import abilities.def.AbilityDef;
   import towers.Tower;
   import towers.upgrades.AddDef;
   import towers.upgrades.ProjectileModDef;
   import towers.upgrades.UpgradeDef;
   import towers.upgrades.WeaponModDef;
   
   public class MIBCallToArms extends Ability
   {
      
      private static var upgrade:UpgradeDef = new UpgradeDef().Id("MIB").Add(new AddDef().WeaponMod(new WeaponModDef().ReloadTime(0.5).ReloadTimeAsScale(true).ProjectileMod(new ProjectileModDef().Pierce(2).PierceAsScale(true))));
      
      public function MIBCallToArms()
      {
         super();
      }
      
      override public function execute(param1:Tower, param2:AbilityDef) : void
      {
         var _loc4_:Tower = null;
         var _loc3_:Vector.<Tower> = param1.levelSlug.§+9§(param1.x,param1.y,param1.def.rangeOfVisibility);
         for each(_loc4_ in _loc3_)
         {
            if(!(_loc4_ == param1 || _loc4_.def == null || _loc4_.def.areaEffects != null))
            {
               new TempUpgradeInstance(_loc4_,upgrade,10);
            }
         }
         super.execute(param1,param2);
      }
   }
}

