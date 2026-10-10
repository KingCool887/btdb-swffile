package weapons
{
   import §8U§.§52§;
   import §;M§.§"L§;
   import §>@§.§-A§;
   import §>@§.§<<§;
   import assets.projectile.IceShard;
   import assets.towers.SuperMonkey;
   import bloons.Bloon;
   import events.PropertyModEvent;
   import projectiles.Projectile;
   import projectiles.def.ProjectileDef;
   import towers.Tower;
   import utils.Pool;
   import utils.Rndm;
   
   public class Spread extends Standard
   {
      
      private static var angleTempVect:§52§ = new §52§();
      
      private var angle_:§<<§ = §-A§.§]H§();
      
      private var count_:§<<§ = §-A§.§]H§();
      
      private var rotate_:Boolean = true;
      
      private var randRotate_:Boolean = false;
      
      private var offset_:Number = 0;
      
      private var tempRotation:§52§ = new §52§();
      
      public function Spread()
      {
         super();
      }
      
      public function set angle(param1:Number) : void
      {
         if(this.angle_.value != param1)
         {
            this.angle_.value = param1;
            dispatchEvent(new PropertyModEvent("angle"));
         }
      }
      
      override public function destroy() : void
      {
         §-A§.§&!§(this.angle_);
         §-A§.§&!§(this.count_);
         super.destroy();
      }
      
      public function get angle() : Number
      {
         return this.angle_.value;
      }
      
      public function Angle(param1:Number) : Spread
      {
         this.angle = param1;
         return this;
      }
      
      public function set offset(param1:Number) : void
      {
         if(this.offset_ != param1)
         {
            this.offset_ = param1;
            dispatchEvent(new PropertyModEvent("offset"));
         }
      }
      
      public function get offset() : Number
      {
         return this.offset_;
      }
      
      public function Offset(param1:Number) : Spread
      {
         this.offset = param1;
         return this;
      }
      
      public function set count(param1:int) : void
      {
         if(this.count_.value != param1)
         {
            this.count_.value = param1;
            dispatchEvent(new PropertyModEvent("count"));
         }
      }
      
      public function get count() : int
      {
         return this.count_.value;
      }
      
      public function Count(param1:int) : Spread
      {
         this.count = param1;
         return this;
      }
      
      public function set rotate(param1:Boolean) : void
      {
         if(this.rotate_ != param1)
         {
            this.rotate_ = param1;
            dispatchEvent(new PropertyModEvent("rotate"));
         }
      }
      
      public function get rotate() : Boolean
      {
         return this.rotate_;
      }
      
      public function Rotate(param1:Boolean) : Spread
      {
         this.rotate = param1;
         return this;
      }
      
      public function set randRotate(param1:Boolean) : void
      {
         if(this.randRotate_ != param1)
         {
            this.randRotate_ = param1;
            dispatchEvent(new PropertyModEvent("randRotate"));
         }
      }
      
      public function get randRotate() : Boolean
      {
         return this.randRotate_;
      }
      
      public function RandRotate(param1:Boolean) : Spread
      {
         this.randRotate_ = param1;
         return this;
      }
      
      public function Range(param1:Number) : Spread
      {
         range = param1;
         return this;
      }
      
      public function ReloadTime(param1:Number) : Spread
      {
         reloadTime = param1;
         return this;
      }
      
      public function Power(param1:Number) : Spread
      {
         power = param1;
         return this;
      }
      
      public function Projectile(param1:ProjectileDef) : Spread
      {
         projectile = param1;
         return this;
      }
      
      public function Proxied(param1:Boolean) : Spread
      {
         proxied = param1;
         return this;
      }
      
      override public function execute(param1:Tower, param2:§"L§, param3:§"L§, param4:§52§ = null) : void
      {
         var _loc9_:projectiles.Projectile = null;
         if(param1.def == null)
         {
            return;
         }
         if(param3 != null)
         {
            angleTempVect.x = param3.x - param2.x;
            angleTempVect.y = param3.y - param2.y;
            if(this.rotate)
            {
               param1.rotation = angleTempVect.rotation;
            }
         }
         else
         {
            angleTempVect.x = 1;
            angleTempVect.y = 0;
            angleTempVect.rotation = param1.rotation;
         }
         if(this.randRotate)
         {
            angleTempVect.rotation = Rndm.random() * Math.PI * 2;
         }
         if(this.offset != 0)
         {
            angleTempVect.rotation += this.offset;
         }
         var _loc5_:Number = angleTempVect.rotation - this.angle / 2;
         var _loc6_:Number = 0;
         var _loc7_:* = this.count;
         if(param1.def.display == SuperMonkey)
         {
            _loc7_ = 1;
         }
         if(_loc7_ > 1 && this.angle > 0)
         {
            _loc6_ = this.angle / (_loc7_ - 1);
         }
         else
         {
            _loc6_ = 0;
         }
         var _loc8_:int = 0;
         while(_loc8_ < _loc7_)
         {
            _loc9_ = Pool.get(projectiles.Projectile);
            _loc9_.initialise(projectile,param1.levelSlug);
            if(projectile.display == IceShard)
            {
               _loc9_.§9H§.push(Bloon(param2).id);
            }
            _loc9_.owner = param1;
            _loc9_.x = param2.x;
            _loc9_.y = param2.y;
            if(param4 != null)
            {
               this.tempRotation.x = param4.x;
               this.tempRotation.y = param4.y;
               this.tempRotation.§ =§(param1.rotation);
               _loc9_.x += this.tempRotation.x;
               _loc9_.y += this.tempRotation.y;
            }
            _loc9_.lifespan = range / power;
            _loc9_.§#J§.x = power;
            _loc9_.§#J§.y = 0;
            _loc9_.§#J§.§ =§(_loc5_ + _loc6_ * _loc8_);
            _loc9_.rotation = _loc9_.§#J§.rotation;
            param1.levelSlug.addProjectile(_loc9_);
            _loc8_++;
         }
      }
   }
}

