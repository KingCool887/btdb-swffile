package abilities
{
   import abilities.def.AbilityDef;
   import assests.effects.DartMonkeyFullScreen;
   import assests.effects.DartMonkeyLightningblast;
   import assets.towers.DartLongSharp;
   import assets.towers.DartLongerRazor;
   import assets.towers.DartMonkey;
   import assets.towers.DartSuperCall;
   import assets.towers.SuperMonkey;
   import assets.towers.TripleShot;
   import entities.Effect;
   import flash.events.Event;
   import towers.Tower;
   import towers.def.TowerDef;
   import towers.def.TowerDisplayMod;
   import towers.upgrades.AddDef;
   import towers.upgrades.UpgradeDef;
   import towers.upgrades.WeaponModDef;
   import utils.§-B§;
   
   public class SuperMonkeyFanClub extends Ability
   {
      
      private var oldDef:TowerDef = null;
      
      public function SuperMonkeyFanClub()
      {
         super();
      }
      
      override public function execute(param1:Tower, param2:AbilityDef) : void
      {
         var superUpgrade:* = undefined;
         var t:Tower = null;
         var mc:Effect = null;
         var timer:§-B§ = null;
         var tower:Tower = param1;
         var def:AbilityDef = param2;
         superUpgrade = new UpgradeDef().Add(new AddDef().Display(Vector.<TowerDisplayMod>([new TowerDisplayMod().UseFor(DartMonkey).Display(SuperMonkey),new TowerDisplayMod().UseFor(TripleShot).Display(SuperMonkey),new TowerDisplayMod().UseFor(DartSuperCall).Display(SuperMonkey),new TowerDisplayMod().UseFor(DartLongerRazor).Display(SuperMonkey),new TowerDisplayMod().UseFor(DartLongSharp).Display(SuperMonkey)])).RangeOfVisibility(40).WeaponMod(new WeaponModDef().ReloadTimeAsScale(true).ReloadTime(0.05)));
         var convertTowers:Vector.<Tower> = new Vector.<Tower>();
         convertTowers.push(tower);
         for each(t in tower.levelSlug.§?0§)
         {
            if(t != tower)
            {
               if(t.def.id == "DartMonkey" || t.def.id == "TripleDarts" || t.def.id == "SuperMonkeyFanClub")
               {
                  convertTowers.push(t);
                  if(convertTowers.length >= 10)
                  {
                     break;
                  }
               }
            }
         }
         mc = new Effect();
         mc.initialise(DartMonkeyFullScreen,4);
         tower.levelSlug.§?3§(mc);
         for each(t in convertTowers)
         {
            timer = new §-B§(15);
            timer.extra = {
               "oldDef":t.def,
               "tower":t
            };
            t.§7+§(superUpgrade);
            mc = new Effect();
            mc.initialise(DartMonkeyLightningblast,3);
            mc.x = t.x;
            mc.y = t.y;
            tower.levelSlug.§?3§(mc);
            timer.addEventListener(§-B§.COMPLETE,function(param1:Event):void
            {
               (param1.target as §-B§).extra.tower.removeUpgrade(superUpgrade);
            });
         }
         super.execute(tower,def);
      }
   }
}

