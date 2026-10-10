package towers.behavior.process
{
   import §8U§.§52§;
   import §;M§.§"L§;
   import towers.Tower;
   
   public class RotateToTarget extends BehaviorProcess
   {
      
      private var vec:§52§ = new §52§();
      
      public function RotateToTarget()
      {
         super();
      }
      
      override public function process(param1:Tower, param2:Number) : void
      {
         if(!param1.§>§ || param1.§+A§.length <= 0)
         {
            return;
         }
         var _loc3_:§"L§ = param1.§+A§[param1.§+A§.length - 1];
         this.vec.x = _loc3_.x - param1.x;
         this.vec.y = _loc3_.y - param1.y;
         param1.rotation = this.vec.rotation;
      }
   }
}

