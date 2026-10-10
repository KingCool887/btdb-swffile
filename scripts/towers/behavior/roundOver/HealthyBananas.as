package towers.behavior.roundOver
{
   import events.PropertyModEvent;
   import towers.Tower;
   import towers.behavior.roundStart.BananaEmitter;
   import towers.upgrades.UpgradeDef;
   
   public class HealthyBananas extends BehaviorRoundOver
   {
      
      public function HealthyBananas()
      {
         super();
      }
      
      override public function execute(param1:Tower) : void
      {
         var _loc3_:UpgradeDef = null;
         var _loc4_:BananaEmitter = null;
         var _loc2_:int = 1;
         if(param1.def.id == "MonkeyBank" || param1.def.id == "BananaRepublic")
         {
            _loc2_ = 4;
         }
         if(param1.def.id == "BananaInvestmentsAdvisory" || param1.def.id == "BananaResearchFacility")
         {
            _loc2_ = 5;
         }
         for each(_loc3_ in param1.upgrades)
         {
            if(_loc3_.id == "MoreBananas" || _loc3_.id == "BananaPlantation" || _loc3_.id == "LongLifeBananas" || _loc3_.id == "ValuableBananas")
            {
               _loc2_++;
            }
         }
         param1.levelSlug.§ W§(param1.levelSlug.§#+§.value + _loc2_);
         if(Boolean(param1.def) && Boolean(param1.def.behavior) && Boolean(param1.def.behavior.roundStart))
         {
            _loc4_ = param1.def.behavior.roundStart as BananaEmitter;
            if(_loc4_ != null)
            {
               _loc4_.setBankedFunds(_loc4_.getBankedFunds(param1) * _loc4_.intrestMultiplier,param1);
               param1.dispatchEvent(new PropertyModEvent("funds"));
            }
         }
      }
   }
}

