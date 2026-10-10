package weapons
{
   import §8U§.§52§;
   import §;M§.§"L§;
   import assets.projectile.RoboDart;
   import assets.projectile.RoboLaser;
   import bloons.Bloon;
   import events.PropertyModEvent;
   import projectiles.Projectile;
   import towers.Tower;
   
   public class Independent extends Weapon implements HasReloadTime, HasChildWeapons, HasRange
   {
      
      private var reloadTime_:Number;
      
      private var childWeapons_:Vector.<Weapon>;
      
      private var range_:Number;
      
      private var angleTemp:§52§ = new §52§();
      
      private var angleTemp2:§52§ = new §52§();
      
      private var offsets_:Vector.<§52§> = null;
      
      public function Independent()
      {
         super();
      }
      
      public function set range(param1:Number) : void
      {
         if(this.range_ != param1)
         {
            this.range_ = param1;
            dispatchEvent(new PropertyModEvent("range"));
         }
      }
      
      public function get range() : Number
      {
         return this.range_;
      }
      
      public function Range(param1:Number) : Independent
      {
         this.range = param1;
         return this;
      }
      
      public function set offsets(param1:Vector.<§52§>) : void
      {
         if(this.offsets_ != param1)
         {
            this.offsets_ = param1;
            dispatchEvent(new PropertyModEvent("offsets"));
         }
      }
      
      public function get offsets() : Vector.<§52§>
      {
         return this.offsets_;
      }
      
      public function Offsets(param1:Vector.<§52§>) : Independent
      {
         this.offsets = param1;
         return this;
      }
      
      public function set reloadTime(param1:Number) : void
      {
         if(this.reloadTime_ != param1)
         {
            this.reloadTime_ = param1;
            dispatchEvent(new PropertyModEvent("reloadTime"));
         }
      }
      
      public function get reloadTime() : Number
      {
         return this.reloadTime_;
      }
      
      public function ReloadTime(param1:Number) : Independent
      {
         this.reloadTime = param1;
         return this;
      }
      
      public function set childWeapons(param1:Vector.<Weapon>) : void
      {
         if(this.childWeapons_ != param1)
         {
            this.childWeapons_ = param1;
            dispatchEvent(new PropertyModEvent("childWeapons"));
         }
      }
      
      public function get childWeapons() : Vector.<Weapon>
      {
         return this.childWeapons_;
      }
      
      public function ChildWeapons(param1:Vector.<Weapon>) : Independent
      {
         this.childWeapons = param1;
         return this;
      }
      
      public function Proxied(param1:Boolean) : Independent
      {
         proxied = param1;
         return this;
      }
      
      override public function execute(param1:Tower, param2:§"L§, param3:§"L§, param4:§52§ = null) : void
      {
         var _loc6_:Vector.<Bloon> = null;
         var _loc9_:Projectile = null;
         var _loc5_:Vector.<Bloon> = param1.§+A§;
         _loc6_ = new Vector.<Bloon>();
         _loc6_.push(_loc5_[_loc5_.length - 1]);
         _loc6_.push(null);
         var _loc7_:int = 1;
         while(_loc7_ < _loc5_.length)
         {
            if(_loc6_[0] != _loc5_[_loc7_])
            {
               _loc6_[1] = _loc5_[_loc7_];
            }
            _loc7_++;
         }
         if(_loc6_[1] == null)
         {
            _loc6_[1] = _loc6_[0];
         }
         this.angleTemp.x = _loc6_[0].x - param1.x;
         this.angleTemp.y = _loc6_[0].y - param1.y;
         this.angleTemp2.x = _loc6_[1].x - param1.x;
         this.angleTemp2.y = _loc6_[1].y - param1.y;
         if(!isNaN(this.angleTemp.§^1§(this.angleTemp2)))
         {
            param1.rotation = this.angleTemp.rotation + this.angleTemp.§^1§(this.angleTemp2) / 2;
         }
         var _loc8_:int = 0;
         while(_loc8_ < this.childWeapons.length)
         {
            this.childWeapons[_loc8_].execute(param1,param2,_loc6_[_loc8_],this.offsets[_loc8_]);
            _loc9_ = param1.levelSlug.§,>§[param1.levelSlug.§,>§.length - 1];
            this.angleTemp.x = _loc9_.§#J§.x;
            this.angleTemp.y = _loc9_.§#J§.y;
            this.angleTemp.§!X§ = 1;
            if(_loc9_.def.display == RoboDart || _loc9_.def.display == RoboLaser)
            {
               _loc9_.x += this.angleTemp.x * 40;
               _loc9_.y += this.angleTemp.y * 40;
            }
            else
            {
               _loc9_.x += this.angleTemp.x * 20;
               _loc9_.y += this.angleTemp.y * 20;
            }
            this.angleTemp.x = this.offsets[_loc8_].x;
            this.angleTemp.y = this.offsets[_loc8_].y;
            this.angleTemp.§ =§(param1.rotation);
            this.angleTemp2.x = param1.x + this.angleTemp.x;
            this.angleTemp2.y = param1.y + this.angleTemp.y;
            this.angleTemp.x = _loc6_[_loc8_].x - this.angleTemp2.x;
            this.angleTemp.y = _loc6_[_loc8_].y - this.angleTemp2.y;
            param1.addonClips[_loc8_].looping = false;
            param1.addonClips[_loc8_].play();
            if(param1.addonClips[_loc8_].frameIndex == param1.addonClips[_loc8_].frameCount - 1)
            {
               param1.addonClips[_loc8_].gotoAndPlay(1);
            }
            param1.addonRotation[param1.addonClips[_loc8_]] = this.angleTemp.rotation;
            _loc8_++;
         }
      }
   }
}

