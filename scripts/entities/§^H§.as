package entities
{
   import §8U§.§52§;
   import §;M§.§"L§;
   import bloons.Bloon;
   import display.Clip;
   import display.LabelOverCommand;
   import flash.display.BitmapData;
   import flash.geom.Point;
   import towers.Tower;
   import towers.def.TowerDef;
   import utils.§-B§;
   import weapons.HasReloadTime;
   import weapons.Weapon;
   
   public class §^H§ extends §"L§
   {
      
      public static const §1%§:int = 0;
      
      public static const §32§:int = 1;
      
      public static const §8H§:int = 2;
      
      private var clip:Clip = new Clip();
      
      private var owner:Tower = null;
      
      private var §77§:Vector.<§-B§>;
      
      public var scale:Number = 1;
      
      public var def:TowerDef = null;
      
      public var base:Point = new Point();
      
      internal var §?Y§:Number = 150;
      
      internal var §8Y§:Number = 100;
      
      internal var speed:Number = 4;
      
      internal var §,'§:Vector.<§52§>;
      
      internal var §;N§:Vector.<Number>;
      
      public var §6<§:int = 1;
      
      internal var §#U§:Boolean = false;
      
      internal var §5Q§:int = 0;
      
      internal var §34§:Number = 75;
      
      internal var §>G§:Number = this.speed / this.§34§;
      
      public function §^H§()
      {
         super();
      }
      
      public function Initialise(param1:Tower, param2:Class, param3:TowerDef) : *
      {
         var _loc4_:Weapon = null;
         var _loc5_:HasReloadTime = null;
         var _loc6_:§-B§ = null;
         this.owner = param1;
         this.def = param3;
         this.clip.initialise(param2,0);
         this.clip.looping = false;
         this.base.x = param1.x;
         this.base.y = param1.y;
         if(this.clip.hasLabel("Idle"))
         {
            this.clip.labelOver["Idle"] = new LabelOverCommand();
            this.clip.labelOver["Idle"].command = LabelOverCommand.gotoAndPlay;
            this.clip.labelOver["Idle"].frameNoTo = 10;
            this.clip.gotoLabel("Idle");
            this.clip.play();
         }
         this.§77§ = new Vector.<§-B§>();
         for each(_loc4_ in param1.def.weapons)
         {
            _loc5_ = _loc4_ as HasReloadTime;
            if(_loc5_ != null)
            {
               _loc6_ = new §-B§(_loc5_.reloadTime);
               this.§77§.push(_loc6_);
            }
         }
         x = this.base.x;
         y = this.base.y;
         this.§4,§(this.§6<§);
         z = 2000;
      }
      
      override public function process(param1:Number) : void
      {
         var _loc3_:Bloon = null;
         if(this.§#U§)
         {
            this.§9,§();
         }
         else
         {
            this.§&+§();
         }
         this.clip.process();
         var _loc2_:int = 0;
         while(_loc2_ < this.§77§.length)
         {
            if(!this.§77§[_loc2_].running)
            {
               if(this.owner.def.weapons[_loc2_].id == "spectreWeapon")
               {
                  this.owner.§+4§ = Tower.§%$§;
                  this.owner.levelSlug.§%Y§.§["§(this.owner);
                  _loc3_ = this.owner.§+A§.length > 0 ? this.owner.§+A§.pop() : null;
                  if(_loc3_ != null)
                  {
                     this.owner.def.weapons[_loc2_].execute(this.owner,this,_loc3_);
                     this.§77§[_loc2_].reset();
                  }
               }
               else if(this.owner.levelSlug.allBloons.length > 0)
               {
                  this.owner.def.weapons[_loc2_].execute(this.owner,this,_loc3_);
                  this.§77§[_loc2_].reset();
               }
            }
            _loc2_++;
         }
      }
      
      internal function §9,§() : void
      {
         ++this.§5Q§;
         this.§5Q§ = this.§5Q§ < this.§,'§.length ? this.§5Q§ : 0;
         rotation = this.§;N§[this.§5Q§];
         var _loc1_:§52§ = this.§,'§[this.§5Q§];
         x = _loc1_.x;
         y = _loc1_.y;
      }
      
      internal function §&+§() : void
      {
         var _loc7_:§52§ = null;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc1_:Number = this.§;N§[this.§;N§.length - 1];
         var _loc2_:§52§ = this.§,'§[0];
         var _loc3_:Number = Math.pow(_loc2_.x - x,2) + Math.pow(_loc2_.y - y,2);
         var _loc4_:int = 1;
         while(_loc4_ < this.§,'§.length)
         {
            _loc7_ = this.§,'§[_loc4_];
            _loc8_ = Math.pow(_loc7_.x - x,2) + Math.pow(_loc7_.y - y,2);
            if(_loc8_ < _loc3_)
            {
               _loc9_ = this.§;N§[_loc4_];
               while(_loc9_ < rotation - Math.PI)
               {
                  _loc9_ += 2 * Math.PI;
               }
               while(_loc9_ > rotation + Math.PI)
               {
                  _loc9_ -= 2 * Math.PI;
               }
               _loc10_ = _loc9_ - rotation;
               _loc10_ = _loc10_ < 0 ? -_loc10_ : _loc10_;
               if(_loc10_ < Math.PI / 4)
               {
                  _loc3_ = _loc8_;
                  _loc1_ = _loc9_;
                  _loc2_ = _loc7_;
               }
            }
            _loc4_++;
         }
         var _loc5_:Number = Math.atan2(_loc2_.y - y,_loc2_.x - x);
         while(_loc5_ < rotation - Math.PI)
         {
            _loc5_ += Math.PI * 2;
         }
         while(_loc5_ > rotation + Math.PI)
         {
            _loc5_ -= Math.PI * 2;
         }
         while(_loc1_ < _loc5_ - Math.PI)
         {
            _loc1_ += Math.PI * 2;
         }
         while(_loc1_ > _loc5_ + Math.PI)
         {
            _loc1_ -= Math.PI * 2;
         }
         var _loc6_:Number = Math.max(1 - Math.min(1,Math.sqrt(_loc3_) / this.§34§),0.6);
         _loc5_ += _loc6_ * (_loc1_ - _loc5_);
         if(_loc5_ > rotation)
         {
            rotation = Math.min(rotation + this.§>G§,_loc5_);
         }
         else if(_loc5_ < rotation)
         {
            rotation = Math.max(rotation - this.§>G§,_loc5_);
         }
         x += Math.cos(rotation) * this.speed;
         y += Math.sin(rotation) * this.speed;
         _loc10_ = rotation - _loc5_;
         _loc10_ = _loc10_ < 0 ? -_loc10_ : _loc10_;
         if(_loc3_ < 1.5 && _loc10_ < 0.05)
         {
            this.§#U§ = true;
            this.§5Q§ = this.§,'§.indexOf(_loc2_);
         }
      }
      
      public function takeoff() : void
      {
      }
      
      public function land() : void
      {
      }
      
      public function §4,§(param1:int) : void
      {
         this.§6<§ = param1;
         switch(param1)
         {
            case §1%§:
               this.§8R§();
               break;
            case §8H§:
               this.§'?§();
               break;
            case §32§:
               this.§>5§();
         }
      }
      
      internal function §8R§() : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         this.§#U§ = false;
         this.§,'§ = new Vector.<§52§>();
         this.§;N§ = new Vector.<Number>();
         var _loc1_:Number = this.§?Y§;
         var _loc2_:Number = _loc1_ * Math.PI * 2 / this.speed;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = _loc3_ / _loc2_;
            _loc5_ = _loc4_ * Math.PI * 2;
            this.§,'§.push(new §52§(Math.cos(_loc5_) * _loc1_ + this.base.x,Math.sin(_loc5_) * _loc1_ + this.base.y));
            if(_loc3_ != 0)
            {
               this.§;N§.push(Math.atan2(this.§,'§[_loc3_].y - this.§,'§[_loc3_ - 1].y,this.§,'§[_loc3_].x - this.§,'§[_loc3_ - 1].x));
            }
            _loc3_++;
         }
         this.§;N§.unshift(Math.atan2(this.§,'§[0].y - this.§,'§[this.§,'§.length - 1].y,this.§,'§[0].x - this.§,'§[this.§,'§.length - 1].x));
      }
      
      internal function §'?§() : void
      {
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         this.§#U§ = false;
         this.§,'§ = new Vector.<§52§>();
         this.§;N§ = new Vector.<Number>();
         var _loc1_:Number = this.§8Y§;
         var _loc3_:Number = Math.tan(0.5) * _loc1_;
         var _loc4_:Number = Math.sin(0.5) * _loc3_ + Math.cos(0.5) * _loc1_;
         var _loc5_:Number = Math.ceil(_loc1_ * 2 * (Math.PI - 0.5) / this.speed);
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_)
         {
            _loc9_ = _loc6_ / _loc5_;
            _loc10_ = _loc9_ * 2 * (Math.PI - 0.5) + 0.5;
            this.§,'§.push(new §52§(Math.cos(_loc10_) * _loc1_ + this.base.x - _loc4_,Math.sin(_loc10_) * _loc1_ + this.base.y));
            if(_loc6_ != 0)
            {
               this.§;N§.push(Math.atan2(this.§,'§[_loc6_].y - this.§,'§[_loc6_ - 1].y,this.§,'§[_loc6_].x - this.§,'§[_loc6_ - 1].x));
            }
            _loc6_++;
         }
         _loc5_ = Math.ceil(2 * _loc3_ / this.speed);
         var _loc7_:§52§ = new §52§();
         _loc7_.x = Math.cos(-Math.PI / 2 - 0.5) * _loc3_ + this.base.x;
         _loc7_.y = Math.sin(-Math.PI / 2 - 0.5) * _loc3_ + this.base.y;
         var _loc8_:§52§ = new §52§();
         _loc8_.x = Math.cos(Math.PI / 2 - 0.5) * _loc3_ + this.base.x;
         _loc8_.y = Math.sin(Math.PI / 2 - 0.5) * _loc3_ + this.base.y;
         _loc6_ = 0;
         while(_loc6_ < _loc5_)
         {
            _loc9_ = _loc6_ / _loc5_;
            this.§,'§.push(new §52§(_loc7_.x + _loc9_ * (_loc8_.x - _loc7_.x),_loc7_.y + _loc9_ * (_loc8_.y - _loc7_.y)));
            this.§;N§.push(Math.atan2(this.§,'§[this.§,'§.length - 1].y - this.§,'§[this.§,'§.length - 2].y,this.§,'§[this.§,'§.length - 1].x - this.§,'§[this.§,'§.length - 2].x));
            _loc6_++;
         }
         _loc5_ = Math.ceil(_loc1_ * 2 * (Math.PI - 0.5) / this.speed);
         _loc6_ = 0;
         while(_loc6_ < _loc5_)
         {
            _loc9_ = _loc6_ / _loc5_;
            _loc10_ = Math.PI - 0.5 + -_loc9_ * 2 * (Math.PI - 0.5);
            this.§,'§.push(new §52§(Math.cos(_loc10_) * _loc1_ + this.base.x + _loc4_,Math.sin(_loc10_) * _loc1_ + this.base.y));
            this.§;N§.push(Math.atan2(this.§,'§[this.§,'§.length - 1].y - this.§,'§[this.§,'§.length - 2].y,this.§,'§[this.§,'§.length - 1].x - this.§,'§[this.§,'§.length - 2].x));
            _loc6_++;
         }
         _loc5_ = Math.ceil(2 * _loc3_ / this.speed);
         _loc7_.x = Math.cos(-Math.PI / 2 + 0.5) * _loc3_ + this.base.x;
         _loc7_.y = Math.sin(-Math.PI / 2 + 0.5) * _loc3_ + this.base.y;
         _loc8_.x = Math.cos(Math.PI / 2 + 0.5) * _loc3_ + this.base.x;
         _loc8_.y = Math.sin(Math.PI / 2 + 0.5) * _loc3_ + this.base.y;
         _loc6_ = 0;
         while(_loc6_ < _loc5_)
         {
            _loc9_ = _loc6_ / _loc5_;
            this.§,'§.push(new §52§(_loc7_.x + _loc9_ * (_loc8_.x - _loc7_.x),_loc7_.y + _loc9_ * (_loc8_.y - _loc7_.y)));
            this.§;N§.push(Math.atan2(this.§,'§[this.§,'§.length - 1].y - this.§,'§[this.§,'§.length - 2].y,this.§,'§[this.§,'§.length - 1].x - this.§,'§[this.§,'§.length - 2].x));
            _loc6_++;
         }
         this.§;N§.unshift(Math.atan2(this.§,'§[0].y - this.§,'§[this.§,'§.length - 1].y,this.§,'§[0].x - this.§,'§[this.§,'§.length - 1].x));
      }
      
      internal function §>5§() : void
      {
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         this.§#U§ = false;
         this.§,'§ = new Vector.<§52§>();
         this.§;N§ = new Vector.<Number>();
         var _loc1_:Number = this.§8Y§;
         var _loc3_:Number = Math.tan(0.5) * _loc1_;
         var _loc4_:Number = Math.sin(0.5) * _loc3_ + Math.cos(0.5) * _loc1_;
         var _loc5_:Number = Math.ceil(_loc1_ * 2 * (Math.PI - 0.5) / this.speed);
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_)
         {
            _loc9_ = _loc6_ / _loc5_;
            _loc10_ = _loc9_ * 2 * (Math.PI - 0.5) - Math.PI / 2 + 0.5;
            this.§,'§.push(new §52§(Math.cos(_loc10_) * _loc1_ + this.base.x,Math.sin(_loc10_) * _loc1_ + this.base.y + _loc4_));
            if(_loc6_ != 0)
            {
               this.§;N§.push(Math.atan2(this.§,'§[_loc6_].y - this.§,'§[_loc6_ - 1].y,this.§,'§[_loc6_].x - this.§,'§[_loc6_ - 1].x));
            }
            _loc6_++;
         }
         _loc5_ = Math.ceil(2 * _loc3_ / this.speed);
         var _loc7_:§52§ = new §52§();
         _loc7_.x = Math.cos(Math.PI - 0.5) * _loc3_ + this.base.x;
         _loc7_.y = Math.sin(Math.PI - 0.5) * _loc3_ + this.base.y;
         var _loc8_:§52§ = new §52§();
         _loc8_.x = Math.cos(-0.5) * _loc3_ + this.base.x;
         _loc8_.y = Math.sin(-0.5) * _loc3_ + this.base.y;
         _loc6_ = 0;
         while(_loc6_ < _loc5_)
         {
            _loc9_ = _loc6_ / _loc5_;
            this.§,'§.push(new §52§(_loc7_.x + _loc9_ * (_loc8_.x - _loc7_.x),_loc7_.y + _loc9_ * (_loc8_.y - _loc7_.y)));
            this.§;N§.push(Math.atan2(this.§,'§[this.§,'§.length - 1].y - this.§,'§[this.§,'§.length - 2].y,this.§,'§[this.§,'§.length - 1].x - this.§,'§[this.§,'§.length - 2].x));
            _loc6_++;
         }
         _loc5_ = Math.ceil(_loc1_ * 2 * (Math.PI - 0.5) / this.speed);
         _loc6_ = 0;
         while(_loc6_ < _loc5_)
         {
            _loc9_ = _loc6_ / _loc5_;
            _loc10_ = Math.PI / 2 - 0.5 + -_loc9_ * 2 * (Math.PI - 0.5);
            this.§,'§.push(new §52§(Math.cos(_loc10_) * _loc1_ + this.base.x,Math.sin(_loc10_) * _loc1_ + this.base.y - _loc4_));
            this.§;N§.push(Math.atan2(this.§,'§[this.§,'§.length - 1].y - this.§,'§[this.§,'§.length - 2].y,this.§,'§[this.§,'§.length - 1].x - this.§,'§[this.§,'§.length - 2].x));
            _loc6_++;
         }
         _loc5_ = Math.ceil(2 * _loc3_ / this.speed);
         _loc7_.x = Math.cos(Math.PI + 0.5) * _loc3_ + this.base.x;
         _loc7_.y = Math.sin(Math.PI + 0.5) * _loc3_ + this.base.y;
         _loc8_.x = Math.cos(0.5) * _loc3_ + this.base.x;
         _loc8_.y = Math.sin(0.5) * _loc3_ + this.base.y;
         _loc6_ = 0;
         while(_loc6_ < _loc5_)
         {
            _loc9_ = _loc6_ / _loc5_;
            this.§,'§.push(new §52§(_loc7_.x + _loc9_ * (_loc8_.x - _loc7_.x),_loc7_.y + _loc9_ * (_loc8_.y - _loc7_.y)));
            this.§;N§.push(Math.atan2(this.§,'§[this.§,'§.length - 1].y - this.§,'§[this.§,'§.length - 2].y,this.§,'§[this.§,'§.length - 1].x - this.§,'§[this.§,'§.length - 2].x));
            _loc6_++;
         }
         this.§;N§.unshift(Math.atan2(this.§,'§[0].y - this.§,'§[this.§,'§.length - 1].y,this.§,'§[0].x - this.§,'§[this.§,'§.length - 1].x));
      }
      
      override public function draw(param1:BitmapData) : void
      {
         this.clip.drawRotated(param1,x,y,rotation);
      }
      
      public function get §4P§() : Boolean
      {
         return false;
      }
      
      public function copy(param1:§^H§) : void
      {
         this.§;N§ = param1.§;N§;
         this.§,'§ = param1.§,'§;
         this.§5Q§ = param1.§5Q§;
         this.§6<§ = param1.§6<§;
         this.§#U§ = param1.§#U§;
         x = param1.x;
         y = param1.y;
         rotation = param1.rotation;
      }
   }
}

