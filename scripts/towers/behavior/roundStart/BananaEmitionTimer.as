package towers.behavior.roundStart
{
   import §+C§.§0>§;
   import §>@§.§-A§;
   import §>@§.§<<§;
   import entities.Banana;
   import events.PropertyModEvent;
   import flash.events.Event;
   import towers.Tower;
   import utils.§-B§;
   
   public class BananaEmitionTimer
   {
      
      private var tower:Tower = null;
      
      private var timer:§-B§ = null;
      
      private var cash:§<<§ = §-A§.§]H§(0);
      
      private var lifespan:Number = 0;
      
      private var emitter:BananaEmitter = null;
      
      private var asset:Class = null;
      
      private var levelSlug:§0>§ = null;
      
      public function BananaEmitionTimer()
      {
         super();
      }
      
      public function initialise(param1:Tower, param2:Number, param3:int, param4:Number, param5:Class, param6:BananaEmitter = null) : void
      {
         this.tower = param1;
         this.cash.value = param3;
         this.lifespan = param4;
         this.emitter = param6;
         this.asset = param5;
         this.timer = new §-B§(param2);
         this.levelSlug = tower.levelSlug;
         this.timer.addEventListener(§-B§.COMPLETE,this.emit);
      }
      
      public function cancel() : void
      {
         this.timer.stop();
         this.timer.removeEventListener(§-B§.COMPLETE,this.emit);
      }
      
      public function emit(param1:Event) : void
      {
         var _loc2_:Banana = null;
         if(this.emitter == null)
         {
            if(this.levelSlug.§[C§() == true)
            {
               if(this.tower.def != null)
               {
                  _loc2_ = new Banana();
                  this.levelSlug.§?3§(_loc2_);
                  _loc2_.initialise(this.tower,this.cash.value,this.lifespan,this.asset);
                  _loc2_.x = this.tower.x;
                  _loc2_.y = this.tower.y;
               }
               this.timer.removeEventListener(§-B§.COMPLETE,this.emit);
            }
         }
         else
         {
            this.emitter.setBankedFunds(this.emitter.getBankedFunds(this.tower) + this.cash.value,this.tower);
            this.tower.dispatchEvent(new PropertyModEvent("funds"));
         }
      }
   }
}

