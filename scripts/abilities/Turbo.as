package abilities
{
   import abilities.def.AbilityDef;
   import towers.Tower;
   import towers.upgrades.AddDef;
   import towers.upgrades.UpgradeDef;
   import towers.upgrades.WeaponModDef;
   
   public class Turbo extends Ability
   {
      
      private static var upgrade:UpgradeDef = new UpgradeDef().Id("Turbo").Add(new AddDef().WeaponMod(new WeaponModDef().ReloadTime(0.2).ReloadTimeAsScale(true)));
      
      public function Turbo()
      {
         super();
      }
      
      override public function execute(param1:Tower, param2:AbilityDef) : void
      {
         new TempUpgradeInstance(param1,upgrade,10);
         super.execute(param1,param2);
      }
   }
}

