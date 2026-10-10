package weapons
{
   import §8U§.§52§;
   import §;M§.§"L§;
   import assets.towers.Bubbles1;
   import bloons.Bloon;
   import events.PropertyModEvent;
   import flash.utils.Dictionary;
   import projectiles.Projectile;
   import projectiles.def.ProjectileDef;
   import towers.Tower;
   import utils.Pool;
   
   public class SpikeSpread extends Standard
   {
      
      public static var fullTrackPoints:Dictionary = new Dictionary();
      
      public static var pointsInRange:Dictionary = new Dictionary();
      
      public static var spikeTo:Dictionary = new Dictionary();
      
      private var rotate_:Boolean = true;
      
      private var fullScreen_:Boolean = false;
      
      public function SpikeSpread(param1:String = null)
      {
         super(param1);
      }
      
      public function Range(param1:Number) : SpikeSpread
      {
         range = param1;
         return this;
      }
      
      public function ReloadTime(param1:Number) : SpikeSpread
      {
         reloadTime = param1;
         return this;
      }
      
      public function Power(param1:Number) : SpikeSpread
      {
         power = param1;
         return this;
      }
      
      public function Projectile(param1:ProjectileDef) : SpikeSpread
      {
         projectile = param1;
         return this;
      }
      
      public function Proxied(param1:Boolean) : SpikeSpread
      {
         proxied = param1;
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
      
      public function Rotate(param1:Boolean) : SpikeSpread
      {
         this.rotate = param1;
         return this;
      }
      
      public function set fullTrack(param1:Boolean) : void
      {
         if(this.fullScreen_ != param1)
         {
            this.fullScreen_ = param1;
            dispatchEvent(new PropertyModEvent("fullScreen"));
         }
      }
      
      public function get fullTrack() : Boolean
      {
         return this.fullScreen_;
      }
      
      public function FullScreen(param1:Boolean) : SpikeSpread
      {
         this.fullTrack = param1;
         return this;
      }
      
      override public function execute(param1:Tower, param2:§"L§, param3:§"L§, param4:§52§ = null) : void
      {
         var _loc7_:projectiles.Projectile = null;
         var _loc5_:Vector.<§52§> = SpikeSpread.pointsInRange[param1];
         if(_loc5_ == null)
         {
            _loc5_ = param1.levelSlug.§?J§(new §52§(param1.x,param1.y),param1.def.rangeOfVisibility);
            SpikeSpread.pointsInRange[param1] = _loc5_;
         }
         var _loc6_:Vector.<§52§> = fullTrackPoints[param1.levelSlug];
         if(this.fullTrack && _loc6_ == null)
         {
            fullTrackPoints[param1.levelSlug] = param1.levelSlug.§4E§();
            _loc6_ = fullTrackPoints[param1.levelSlug];
         }
         _loc7_ = Pool.get(projectiles.Projectile);
         _loc7_.initialise(projectile,param1.levelSlug);
         _loc7_.effectMask = Bloon.§6%§;
         _loc7_.owner = param1;
         _loc7_.x = param2.x;
         _loc7_.y = param2.y;
         _loc7_.§3H§ = true;
         spikeTo[_loc7_] = new SpikeTo(Pool.get(§52§) as §52§,Pool.get(§52§) as §52§,0,this.fullTrack ? param1.§^O§.random() * 1 : 0);
         spikeTo[_loc7_].from.x = _loc7_.x;
         spikeTo[_loc7_].from.y = _loc7_.y;
         var _loc8_:§52§ = null;
         if(!this.fullTrack)
         {
            _loc7_.lifespan = 20;
            if(projectile.display == Bubbles1)
            {
               _loc7_.lifespan = 7.2;
               _loc7_.z = 0;
               _loc7_.clip.gotoAndPlay(0);
            }
            if(_loc5_.length == 0)
            {
               _loc8_ = new §52§();
               _loc8_.x = 35 + param1.§^O§.random() * (param1.def.rangeOfVisibility - 35);
               _loc8_.§ =§(param1.§^O§.random() * Math.PI * 2);
               _loc8_.x += param1.x;
               _loc8_.y += param1.y;
            }
            else
            {
               _loc8_ = _loc5_[int(_loc5_.length * param1.§^O§.random())];
            }
         }
         else
         {
            _loc7_.lifespan = 5 + param1.§^O§.random() * 3;
            _loc8_ = _loc6_[int(_loc6_.length * param1.§^O§.random())];
         }
         spikeTo[_loc7_].to.x = _loc8_.x;
         spikeTo[_loc7_].to.y = _loc8_.y;
         var _loc9_:int = 0;
         var _loc10_:int = _loc7_.clip.frameCount - 1;
         var _loc11_:int = _loc7_.pierce;
         if(_loc11_ > _loc10_)
         {
            _loc9_ = 0;
         }
         else
         {
            _loc9_ = _loc10_ - _loc11_;
         }
         _loc7_.clip.gotoAndStop(_loc9_);
         param1.levelSlug.addProjectile(_loc7_);
      }
   }
}

