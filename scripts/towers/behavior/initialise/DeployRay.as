package towers.behavior.initialise
{
   import assets.projectile.DoomShot;
   import entities.§^X§;
   import flash.utils.Dictionary;
   import towers.Tower;
   
   public class DeployRay extends BehaviorInitialise
   {
      
      public static var rays:Dictionary = new Dictionary();
      
      public function DeployRay()
      {
         super();
      }
      
      override public function execute(param1:Tower) : void
      {
         var _loc2_:§^X§ = null;
         if(rays[param1] == null)
         {
            _loc2_ = new §^X§();
            _loc2_.initialise(DoomShot,99,0);
            param1.levelSlug.§?3§(_loc2_);
            rays[param1] = _loc2_;
         }
      }
   }
}

