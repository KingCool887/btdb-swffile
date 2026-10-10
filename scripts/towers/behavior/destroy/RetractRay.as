package towers.behavior.destroy
{
   import entities.§^X§;
   import towers.Tower;
   import towers.behavior.initialise.DeployRay;
   
   public class RetractRay extends BehaviorDestroy
   {
      
      public function RetractRay()
      {
         super();
      }
      
      override public function execute(param1:Tower) : void
      {
         var _loc2_:§^X§ = DeployRay.rays[param1];
         if(_loc2_ != null)
         {
            _loc2_.destroy();
         }
         DeployRay.rays[param1] = null;
      }
   }
}

