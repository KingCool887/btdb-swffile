package towers.behavior.roundOver
{
   import towers.Tower;
   
   public class StopAnimation extends BehaviorRoundOver
   {
      
      public function StopAnimation()
      {
         super();
      }
      
      override public function execute(param1:Tower) : void
      {
         param1.clip.gotoAndStop(0);
      }
   }
}

