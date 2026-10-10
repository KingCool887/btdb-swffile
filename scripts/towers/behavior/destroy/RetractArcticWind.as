package towers.behavior.destroy
{
   import towers.Tower;
   import towers.behavior.initialise.SpawnArcticWind;
   
   public class RetractArcticWind extends BehaviorDestroy
   {
      
      public function RetractArcticWind()
      {
         super();
      }
      
      override public function execute(param1:Tower) : void
      {
         if(SpawnArcticWind.arcticWinds[param1])
         {
            SpawnArcticWind.arcticWinds[param1].destroy();
            SpawnArcticWind.arcticWinds[param1] = null;
         }
      }
   }
}

