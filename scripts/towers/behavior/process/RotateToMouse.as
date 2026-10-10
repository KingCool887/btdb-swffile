package towers.behavior.process
{
   import §8U§.§52§;
   import towers.Tower;
   import towers.def.TowerDef;
   
   public class RotateToMouse extends BehaviorProcess
   {
      
      private var vec:§52§ = new §52§();
      
      public function RotateToMouse()
      {
         super();
      }
      
      override public function process(param1:Tower, param2:Number) : void
      {
         var _loc3_:§52§ = null;
         if(param1.targetingSystem == TowerDef.TARGETS_MOUSE)
         {
            _loc3_ = param1.levelSlug.§#"§();
            this.vec.x = _loc3_.x - param1.x;
            this.vec.y = _loc3_.y - param1.y;
            param1.rotation = this.vec.rotation;
         }
      }
   }
}

