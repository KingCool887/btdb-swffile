package weapons
{
   import §8U§.§52§;
   import §;M§.§"L§;
   import §>@§.§-A§;
   import §>@§.§<<§;
   import assets.towers.AircraftCarrier;
   import events.PropertyModEvent;
   import projectiles.Projectile;
   import projectiles.def.ProjectileDef;
   import towers.Tower;
   import utils.Pool;
   
   public class SideSpread extends Standard
   {
      
      public static var towerRotationVec:§52§ = new §52§();
      
      private static var angleTempVect:§52§ = new §52§();
      
      private var fireFromRight_:String = null;
      
      private var fireFromLeft_:String = null;
      
      private var angle_:Number;
      
      private var count_:§<<§ = §-A§.§]H§();
      
      private var rotate_:Boolean = true;
      
      public function SideSpread()
      {
         super();
      }
      
      public function set angle(param1:Number) : void
      {
         if(this.angle_ != param1)
         {
            this.angle_ = param1;
            dispatchEvent(new PropertyModEvent("angle"));
         }
      }
      
      override public function destroy() : void
      {
         §-A§.§&!§(this.count_);
         super.destroy();
      }
      
      public function get angle() : Number
      {
         return this.angle_;
      }
      
      public function Angle(param1:Number) : SideSpread
      {
         this.angle = param1;
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
      
      public function Count(param1:int) : SideSpread
      {
         this.count = param1;
         return this;
      }
      
      public function set fireFromRight(param1:String) : void
      {
         if(this.fireFromRight_ != param1)
         {
            this.fireFromRight_ = param1;
            dispatchEvent(new PropertyModEvent("fireFromRight"));
         }
      }
      
      public function get fireFromRight() : String
      {
         return this.fireFromRight_;
      }
      
      public function FireFromRight(param1:String) : SideSpread
      {
         this.fireFromRight_ = param1;
         return this;
      }
      
      public function set fireFromLeft(param1:String) : void
      {
         if(this.fireFromLeft_ != param1)
         {
            this.fireFromLeft_ = param1;
            dispatchEvent(new PropertyModEvent("fireFromLeft"));
         }
      }
      
      public function get fireFromLeft() : String
      {
         return this.fireFromLeft_;
      }
      
      public function FireFromLeft(param1:String) : SideSpread
      {
         this.fireFromLeft = param1;
         return this;
      }
      
      public function Range(param1:Number) : SideSpread
      {
         range = param1;
         return this;
      }
      
      public function ReloadTime(param1:Number) : SideSpread
      {
         reloadTime = param1;
         return this;
      }
      
      public function Power(param1:Number) : SideSpread
      {
         power = param1;
         return this;
      }
      
      public function Projectile(param1:ProjectileDef) : SideSpread
      {
         projectile = param1;
         return this;
      }
      
      public function Proxied(param1:Boolean) : SideSpread
      {
         proxied = param1;
         return this;
      }
      
      override public function execute(param1:Tower, param2:§"L§, param3:§"L§, param4:§52§ = null) : void
      {
         var _loc7_:Number = NaN;
         var _loc8_:int = 0;
         var _loc9_:Number = NaN;
         var _loc10_:projectiles.Projectile = null;
         var _loc5_:String = null;
         if(param3 != null)
         {
            angleTempVect.x = param3.x - param2.x;
            angleTempVect.y = param3.y - param2.y;
            towerRotationVec.x = 1;
            towerRotationVec.y = 0;
            towerRotationVec.rotation = param1.rotation;
            _loc9_ = towerRotationVec.§^1§(angleTempVect);
            if(_loc9_ < 0)
            {
               if(param1.def.display != AircraftCarrier)
               {
                  param1.rotation = angleTempVect.rotation + Math.PI / 2;
               }
               _loc5_ = this.fireFromLeft;
            }
            else
            {
               if(param1.def.display != AircraftCarrier)
               {
                  param1.rotation = angleTempVect.rotation - Math.PI / 2;
               }
               _loc5_ = this.fireFromRight;
            }
         }
         var _loc6_:Number = angleTempVect.rotation - this.angle / 2;
         _loc7_ = this.angle / (this.count - 1);
         _loc8_ = 0;
         while(_loc8_ < this.count)
         {
            _loc10_ = Pool.get(projectiles.Projectile);
            _loc10_.initialise(projectile,param1.levelSlug);
            _loc10_.owner = param1;
            _loc10_.x = param2.x;
            _loc10_.y = param2.y;
            _loc10_.lifespan = range / power;
            _loc10_.§#J§.x = power;
            _loc10_.§#J§.y = 0;
            _loc10_.§#J§.§ =§(_loc6_ + _loc7_ * _loc8_);
            _loc10_.rotation = _loc10_.§#J§.rotation;
            param1.levelSlug.addProjectile(_loc10_);
            _loc8_++;
         }
         _loc8_ = 0;
         while(_loc8_ < param1.addonClips.length)
         {
            if(param1.def.displayAddons[_loc8_].ref == _loc5_)
            {
               param1.addonClips[_loc8_].gotoAndPlay(0);
            }
            _loc8_++;
         }
      }
   }
}

