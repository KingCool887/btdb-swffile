package towers.behavior.destroy
{
   import towers.Tower;
   import towers.behavior.initialise.DeployMonkeyAce;
   
   public class RemoveAceAircraft extends BehaviorDestroy
   {
      
      public function RemoveAceAircraft()
      {
         super();
      }
      
      override public function execute(param1:Tower) : void
      {
         if(DeployMonkeyAce.aces[param1])
         {
            DeployMonkeyAce.aces[param1].destroy();
         }
      }
   }
}

