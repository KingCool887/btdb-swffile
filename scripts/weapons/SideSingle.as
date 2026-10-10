package weapons
{
   import §8U§.§52§;
   import §;M§.§"L§;
   import assets.tower.BuccaneerCannonsLeft;
   import assets.tower.BuccaneerCannonsRight;
   import assets.towers.CannonShipCannonsLeft;
   import assets.towers.CannonShipCannonsRight;
   import assets.towers.LeftBack;
   import assets.towers.LeftFront;
   import assets.towers.LongerCannonsLeft;
   import assets.towers.LongerCannonsRight;
   import assets.towers.PiratesCannonsLeft;
   import assets.towers.PiratesCannonsRight;
   import assets.towers.RightBack;
   import assets.towers.RightFront;
   import events.PropertyModEvent;
   import projectiles.Projectile;
   import projectiles.def.ProjectileDef;
   import towers.Tower;
   import utils.Pool;
   
   public class SideSingle extends Standard
   {
      
      public static var towerRotationVec:§52§ = new §52§();
      
      private var fireFromRight_:String = null;
      
      private var fireFromLeft_:String = null;
      
      public function SideSingle()
      {
         super();
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
      
      public function FireFromRight(param1:String) : SideSingle
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
      
      public function FireFromLeft(param1:String) : SideSingle
      {
         this.fireFromLeft = param1;
         return this;
      }
      
      public function Range(param1:Number) : SideSingle
      {
         range = param1;
         return this;
      }
      
      public function ReloadTime(param1:Number) : SideSingle
      {
         reloadTime = param1;
         return this;
      }
      
      public function Power(param1:Number) : SideSingle
      {
         power = param1;
         return this;
      }
      
      public function Projectile(param1:ProjectileDef) : SideSingle
      {
         projectile = param1;
         return this;
      }
      
      public function Proxied(param1:Boolean) : SideSingle
      {
         proxied = param1;
         return this;
      }
      
      override public function execute(param1:Tower, param2:§"L§, param3:§"L§, param4:§52§ = null) : void
      {
         var _loc8_:Number = NaN;
         var _loc9_:Class = null;
         var _loc5_:projectiles.Projectile = Pool.get(projectiles.Projectile);
         _loc5_.initialise(projectile,param1.levelSlug);
         _loc5_.owner = param1;
         _loc5_.x = param2.x;
         _loc5_.y = param2.y;
         _loc5_.lifespan = range / power;
         var _loc6_:String = null;
         towerRotationVec.x = 0;
         towerRotationVec.y = 0;
         if(param3 != null)
         {
            _loc5_.§#J§.x = param3.x - _loc5_.x;
            _loc5_.§#J§.y = param3.y - _loc5_.y;
            _loc5_.§#J§.§!X§ = power;
            towerRotationVec.x = 1;
            towerRotationVec.y = 0;
            towerRotationVec.rotation = param1.rotation;
            _loc8_ = towerRotationVec.§^1§(_loc5_.§#J§);
            if(_loc8_ < 0)
            {
               param1.rotation = _loc5_.§#J§.rotation + Math.PI / 2;
               _loc6_ = this.fireFromLeft;
            }
            else
            {
               param1.rotation = _loc5_.§#J§.rotation - Math.PI / 2;
               _loc6_ = this.fireFromRight;
            }
            _loc9_ = param1.def.displayAddons[0].clip;
            if(Boolean(_loc9_ == BuccaneerCannonsLeft || BuccaneerCannonsRight) || Boolean(_loc9_ == LongerCannonsLeft) || Boolean(LongerCannonsRight))
            {
               towerRotationVec.x = -7;
               towerRotationVec.y = _loc6_ == this.fireFromLeft ? -60 : 60;
               towerRotationVec.§ =§(param1.rotation);
            }
            else if(_loc9_ == LeftBack || _loc9_ == RightBack || _loc9_ == LeftFront || _loc9_ == RightFront)
            {
               towerRotationVec.x = 0;
               towerRotationVec.y = _loc6_ == this.fireFromLeft ? -70 : 70;
               towerRotationVec.§ =§(param1.rotation);
            }
            else if(_loc9_ == CannonShipCannonsLeft || _loc9_ == CannonShipCannonsRight || _loc9_ == PiratesCannonsLeft || _loc9_ == PiratesCannonsRight)
            {
               towerRotationVec.x = 0;
               towerRotationVec.y = _loc6_ == this.fireFromLeft ? -70 : 70;
               towerRotationVec.§ =§(param1.rotation);
            }
         }
         else
         {
            _loc5_.§#J§.x = power;
            _loc5_.§#J§.y = 0;
            _loc5_.§#J§.rotation = param2.rotation;
         }
         _loc5_.x = param2.x + towerRotationVec.x;
         _loc5_.y = param2.y + towerRotationVec.y;
         _loc5_.rotation = _loc5_.§#J§.rotation;
         param1.levelSlug.addProjectile(_loc5_);
         var _loc7_:int = 0;
         while(_loc7_ < param1.addonClips.length)
         {
            if(param1.def.displayAddons[_loc7_].ref == _loc6_)
            {
               param1.addonClips[_loc7_].gotoAndPlay(0);
            }
            _loc7_++;
         }
      }
   }
}

