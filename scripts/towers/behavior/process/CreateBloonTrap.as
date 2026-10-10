package towers.behavior.process
{
   import entities.BloonTrap;
   import flash.utils.Dictionary;
   import towers.Tower;
   
   public class CreateBloonTrap extends BehaviorProcess
   {
      
      private static var time:Dictionary = new Dictionary();
      
      public static var hasTrap:Dictionary = new Dictionary();
      
      public function CreateBloonTrap()
      {
         super();
      }
      
      override public function process(param1:Tower, param2:Number) : void
      {
         if(param1 in hasTrap && time[param1] >= 2.6)
         {
            return;
         }
         if(time[param1] == null)
         {
            time[param1] = 2.6;
         }
         time[param1] += param2;
         if(!(param1 in hasTrap) && time[param1] >= 2.8)
         {
            this.create(param1);
            time[param1] = 0;
         }
      }
      
      private function create(param1:Tower) : void
      {
         var _loc2_:BloonTrap = new BloonTrap();
         _loc2_.initialise(param1.levelSlug.§7<§[0],-0.5,param1);
         param1.levelSlug.§?3§(_loc2_);
         hasTrap[param1] = _loc2_;
      }
   }
}

