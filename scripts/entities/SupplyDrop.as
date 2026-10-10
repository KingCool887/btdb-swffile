package entities
{
   import §8U§.§52§;
   import §;M§.§"L§;
   import assets.projectile.BananaCrate;
   import assets.sound.CrateDrop;
   import assets.towers.OperationDartStorm;
   import display.Clip;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.geom.Rectangle;
   import sound.§^5§;
   import towers.Tower;
   import utils.§-B§;
   import utils.Rndm;
   
   public class SupplyDrop extends §"L§
   {
      
      private var clip:Clip = new Clip();
      
      private var start:§52§ = null;
      
      private var §3X§:§52§ = null;
      
      private var flightTime:§-B§ = new §-B§(5);
      
      private var crateTimer:§-B§ = new §-B§(1 + Rndm.random() * (this.flightTime.delay - 2));
      
      private var owner:Tower = null;
      
      public function SupplyDrop()
      {
         super();
      }
      
      public function initialise(param1:Tower) : void
      {
         var levelBoundries:Rectangle;
         var tempRotation:§52§;
         var owner:Tower = param1;
         this.owner = owner;
         levelBoundries = owner.levelSlug.§1§;
         this.start = new §52§(levelBoundries.x,levelBoundries.y + 60 + Rndm.random() * (levelBoundries.height - 60));
         this.§3X§ = new §52§(levelBoundries.right,levelBoundries.y + 60 + Rndm.random() * (levelBoundries.height - 60));
         this.clip.initialise(OperationDartStorm,1);
         this.clip.gotoLabel("Idle");
         this.flightTime.addEventListener(§-B§.COMPLETE,function(param1:Event):void
         {
            destroy();
            flightTime.removeEventListener(§-B§.COMPLETE,arguments.callee);
         });
         this.crateTimer.addEventListener(§-B§.COMPLETE,function(param1:Event):void
         {
            var _loc3_:Banana = null;
            if(owner == null || owner.levelSlug == null)
            {
               return;
            }
            if(owner.levelSlug.§[C§() == true)
            {
               _loc3_ = new Banana();
               owner.levelSlug.§?3§(_loc3_);
               _loc3_.initialise(owner,Rndm.random() * 1000 + 500,10,BananaCrate);
               _loc3_.x = x;
               _loc3_.y = y;
               crateTimer.removeEventListener(§-B§.COMPLETE,arguments.callee);
               new §^5§(CrateDrop).play();
            }
         });
         tempRotation = new §52§(this.§3X§.x - this.start.x,this.§3X§.y - this.start.y);
         rotation = tempRotation.rotation;
         z = 50;
      }
      
      override public function process(param1:Number) : void
      {
         x = this.start.x + (this.§3X§.x - this.start.x) * (this.flightTime.current / this.flightTime.delay);
         y = this.start.y + (this.§3X§.y - this.start.y) * (this.flightTime.current / this.flightTime.delay);
      }
      
      override public function draw(param1:BitmapData) : void
      {
         this.clip.drawRotated(param1,x,y,rotation);
      }
   }
}

