package abilities
{
   import flash.events.Event;
   import towers.Tower;
   import towers.upgrades.UpgradeDef;
   import utils.§-B§;
   
   public class TempUpgradeInstance
   {
      
      public var tower:Tower = null;
      
      private var timer:§-B§ = null;
      
      private var upgrade:UpgradeDef;
      
      public function TempUpgradeInstance(param1:Tower, param2:UpgradeDef, param3:Number)
      {
         super();
         this.tower = param1;
         this.upgrade = param2;
         param1.§7+§(param2);
         this.timer = new §-B§(param3);
         this.timer.addEventListener(§-B§.COMPLETE,this.timeUp);
      }
      
      public function timeUp(param1:Event) : void
      {
         this.tower.removeUpgrade(this.upgrade);
      }
   }
}

