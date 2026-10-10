package towers.behavior.process
{
   import §8U§.§52§;
   import bloons.§2X§;
   import bloons.Bloon;
   import entities.§0G§;
   import events.PropertyModEvent;
   import fl.motion.BezierSegment;
   import flash.geom.Point;
   import flash.utils.Dictionary;
   import towers.Tower;
   
   public class BloonchipperStore extends BehaviorProcess
   {
      
      public static var store:Dictionary = new Dictionary();
      
      public static var hasSuckedStore:Dictionary = new Dictionary();
      
      private var maxBloons_:int = 10;
      
      private var damage_:int = 1;
      
      private var chipTime_:Number = 1;
      
      internal var vec:§52§ = new §52§();
      
      public function BloonchipperStore()
      {
         super();
      }
      
      public static function returnAll(param1:Tower) : void
      {
         var _loc2_:§2X§ = null;
         while(store[param1] != null && store[param1].length > 0)
         {
            _loc2_ = store[param1][0];
            _loc2_.bloon.§'>§ = true;
            _loc2_.bloon.§1<§ = _loc2_.§1<§;
            store[param1].splice(store[param1].indexOf(_loc2_),1);
         }
      }
      
      public function set maxBloons(param1:int) : void
      {
         if(this.maxBloons_ != param1)
         {
            this.maxBloons_ = param1;
            dispatchEvent(new PropertyModEvent("maxBloons"));
         }
      }
      
      public function get maxBloons() : int
      {
         return this.maxBloons_;
      }
      
      public function MaxBloons(param1:int) : BloonchipperStore
      {
         this.maxBloons = param1;
         return this;
      }
      
      public function set damage(param1:int) : void
      {
         if(this.damage_ != param1)
         {
            this.damage_ = param1;
            dispatchEvent(new PropertyModEvent("damage"));
         }
      }
      
      public function get damage() : int
      {
         return this.damage_;
      }
      
      public function Damage(param1:int) : BloonchipperStore
      {
         this.damage = param1;
         return this;
      }
      
      public function set chipTime(param1:Number) : void
      {
         if(this.chipTime_ != param1)
         {
            this.chipTime_ = param1;
            dispatchEvent(new PropertyModEvent("chipTime"));
         }
      }
      
      public function get chipTime() : Number
      {
         return this.chipTime_;
      }
      
      public function ChipTime(param1:Number) : BloonchipperStore
      {
         this.chipTime = param1;
         return this;
      }
      
      public function addBloon(param1:Tower, param2:Bloon) : §2X§
      {
         if(store[param1] == null)
         {
            store[param1] = new Vector.<§2X§>();
         }
         if(hasSuckedStore[param1] == null)
         {
            hasSuckedStore[param1] = new Vector.<uint>();
         }
         var _loc3_:§2X§ = §0G§.§?§(param2);
         if(_loc3_ == null)
         {
            _loc3_ = new §2X§();
            _loc3_.bloon = param2;
            _loc3_.§=F§ = param2.x;
            _loc3_.§!A§ = param2.y;
         }
         else
         {
            §0G§.store.splice(§0G§.store.indexOf(_loc3_),1);
         }
         _loc3_.§"T§ = 0;
         _loc3_.§5M§ = 0;
         _loc3_.§<!§ = param2.x;
         _loc3_.§>O§ = param2.y;
         _loc3_.§3%§ = this.chipTime;
         if(param2.type >= Bloon.MOAB)
         {
            _loc3_.damage = 200;
            _loc3_.popCount = 3;
            if(this.chipTime < 1)
            {
               _loc3_.§3%§ = 0.8;
            }
         }
         _loc3_.§1<§ = param2.§1<§;
         param2.§'>§ = false;
         param2.§1<§ = Bloon.§6%§;
         store[param1].push(_loc3_);
         hasSuckedStore[param1].push(param2.§<G§);
         return _loc3_;
      }
      
      public function canSuck(param1:Tower, param2:Bloon) : *
      {
         if(hasSuckedStore[param1] == null)
         {
            return true;
         }
         if(param2.§1<§ == Bloon.§6%§)
         {
            return false;
         }
         if(store[param1] == null)
         {
            if(store[param1].length >= this.maxBloons)
            {
               return false;
            }
         }
         var _loc3_:Vector.<uint> = hasSuckedStore[param1];
         if(_loc3_.indexOf(param2.§<G§) != -1)
         {
            return false;
         }
         return true;
      }
      
      override public function process(param1:Tower, param2:Number) : void
      {
         var _loc5_:§2X§ = null;
         var _loc6_:§2X§ = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:Bloon = null;
         var _loc10_:§2X§ = null;
         var _loc11_:int = 0;
         var _loc3_:Vector.<§2X§> = BloonchipperStore.store[param1];
         if(_loc3_ == null)
         {
            return;
         }
         var _loc4_:Vector.<§2X§> = new Vector.<§2X§>();
         for each(_loc5_ in _loc3_)
         {
            if(_loc5_.bloon.type == -1)
            {
               _loc4_.push(_loc5_);
            }
            else
            {
               if(_loc5_.§5M§ <= 0.8 && _loc5_.§"T§ <= 0)
               {
                  _loc5_.§5M§ += param2;
                  _loc5_.bloon.x = _loc5_.§<!§ + (param1.x - _loc5_.§<!§) * (_loc5_.§5M§ / 0.8);
                  _loc5_.bloon.y = _loc5_.§>O§ + (param1.y - _loc5_.§>O§) * (_loc5_.§5M§ / 0.8);
               }
               else
               {
                  _loc5_.bloon.x = param1.x;
                  _loc5_.bloon.y = param1.y;
               }
               if(_loc5_.§"T§ <= 0.8 && _loc5_.§"T§ > 0)
               {
                  _loc5_.§"T§ += param2;
                  _loc5_.bloon.x = _loc5_.§#$§.getValue(_loc5_.§"T§ / 0.8).x;
                  _loc5_.bloon.y = _loc5_.§#$§.getValue(_loc5_.§"T§ / 0.8).y;
               }
               else if(_loc5_.§"T§ > 0)
               {
                  _loc4_.push(_loc5_);
               }
               else
               {
                  _loc5_.chipTime += param2;
                  if(_loc5_.chipTime >= _loc5_.§3%§)
                  {
                     _loc7_ = int(param1.levelSlug.allBloons.length);
                     _loc5_.bloon.damage(_loc5_.damage,1,param1,false);
                     _loc8_ = _loc7_;
                     while(_loc8_ < param1.levelSlug.allBloons.length)
                     {
                        _loc9_ = param1.levelSlug.allBloons[_loc8_];
                        _loc10_ = this.addBloon(param1,_loc9_);
                        _loc10_.§=F§ = _loc5_.§=F§;
                        _loc10_.§!A§ = _loc5_.§!A§;
                        _loc10_.§"T§ += param2 * 5;
                        this.vec.x = 250;
                        this.vec.y = 0;
                        this.vec.§ =§(param1.rotation);
                        _loc10_.§#$§ = new BezierSegment(new Point(param1.x,param1.y),new Point(param1.x - this.vec.x,param1.y - this.vec.y),new Point(_loc5_.§=F§,_loc5_.§!A§),new Point(_loc5_.§=F§,_loc5_.§!A§));
                        _loc8_++;
                     }
                     _loc5_.chipTime = 0;
                     if(_loc5_.bloon.type == -1)
                     {
                        _loc4_.push(_loc5_);
                     }
                     else
                     {
                        --_loc5_.popCount;
                        if(_loc5_.popCount <= 0)
                        {
                           _loc5_.§"T§ += param2;
                           this.vec.x = 250;
                           this.vec.y = 0;
                           this.vec.§ =§(param1.rotation);
                           _loc5_.§#$§ = new BezierSegment(new Point(param1.x,param1.y),new Point(param1.x - this.vec.x,param1.y - this.vec.y),new Point(_loc5_.§=F§,_loc5_.§!A§),new Point(_loc5_.§=F§,_loc5_.§!A§));
                        }
                     }
                  }
               }
            }
         }
         for each(_loc6_ in _loc4_)
         {
            _loc6_.bloon.§'>§ = true;
            _loc6_.bloon.§1<§ = _loc6_.§1<§;
            if(hasSuckedStore[param1] != null)
            {
               _loc11_ = int(hasSuckedStore[param1].indexOf(_loc6_.bloon.§<G§));
               if(_loc11_ != -1)
               {
                  hasSuckedStore[param1].splice(_loc11_,1);
               }
            }
            _loc3_.splice(_loc3_.indexOf(_loc6_),1);
         }
      }
   }
}

