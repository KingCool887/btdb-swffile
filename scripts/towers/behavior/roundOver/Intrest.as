package towers.behavior.roundOver
{
   import events.PropertyModEvent;
   import towers.Tower;
   import towers.behavior.roundStart.BananaEmitter;
   
   public class Intrest extends BehaviorRoundOver
   {
      
      public function Intrest()
      {
         super();
      }
      
      override public function execute(param1:Tower) : void
      {
         var _loc2_:BananaEmitter = null;
         if(Boolean(param1.def) && Boolean(param1.def.behavior) && Boolean(param1.def.behavior.roundStart))
         {
            _loc2_ = param1.def.behavior.roundStart as BananaEmitter;
            if(_loc2_ != null)
            {
               _loc2_.setBankedFunds(_loc2_.getBankedFunds(param1) * _loc2_.intrestMultiplier,param1);
               param1.dispatchEvent(new PropertyModEvent("funds"));
            }
         }
      }
   }
}

