package projectiles.behavior.collision
{
   import events.PropertyModEvent;
   import flash.events.EventDispatcher;
   import projectiles.Projectile;
   
   public class BehaviorCollision extends EventDispatcher
   {
      
      private var next_:BehaviorCollision;
      
      public function BehaviorCollision()
      {
         super();
      }
      
      public function execute(param1:Projectile) : void
      {
      }
      
      public function set next(param1:BehaviorCollision) : void
      {
         if(this.next_ != param1)
         {
            this.next_ = param1;
            dispatchEvent(new PropertyModEvent("next"));
         }
      }
      
      public function get next() : BehaviorCollision
      {
         return this.next_;
      }
      
      public function Next(param1:BehaviorCollision) : BehaviorCollision
      {
         this.next = param1;
         return this;
      }
   }
}

