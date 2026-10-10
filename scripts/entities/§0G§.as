package entities
{
   import §8U§.§52§;
   import §;M§.§"L§;
   import bloons.§2X§;
   import bloons.Bloon;
   import flash.events.Event;
   import towers.Tower;
   import utils.§-B§;
   import utils.Rndm;
   
   public class §0G§ extends §"L§
   {
      
      public static var store:Vector.<§2X§> = new Vector.<§2X§>();
      
      internal var vec:§52§ = new §52§();
      
      public function §0G§()
      {
         super();
      }
      
      public static function §?§(param1:Bloon) : §2X§
      {
         var _loc2_:§2X§ = null;
         for each(_loc2_ in store)
         {
            if(_loc2_.bloon == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function initialise(param1:Tower) : void
      {
         var tile:Vector.<Bloon> = null;
         var t:§-B§ = null;
         var bloon:Bloon = null;
         var distance2:Number = NaN;
         var tower:Tower = param1;
         var tiles:Vector.<Vector.<Bloon>> = tower.levelSlug.§%Y§.§`5§(tower.x,tower.y,tower.def.rangeOfVisibility);
         var range2:Number = Math.pow(tower.def.rangeOfVisibility,2);
         for each(tile in tiles)
         {
            for each(bloon in tile)
            {
               if(!(bloon.§ !§ || bloon.§1<§ == Bloon.§6%§))
               {
                  distance2 = (bloon.x - tower.x) * (bloon.x - tower.x) + (bloon.y - tower.y) * (bloon.y - tower.y);
                  if(distance2 <= range2)
                  {
                     this.addBloon(tower,bloon);
                  }
               }
            }
         }
         t = new §-B§(5);
         t.addEventListener(§-B§.COMPLETE,function(param1:Event):void
         {
            var _loc3_:§2X§ = null;
            for each(_loc3_ in §0G§.store)
            {
               _loc3_.§"T§ = 0.01;
            }
            t.removeEventListener(§-B§.COMPLETE,arguments.callee);
         });
      }
      
      public function addBloon(param1:Tower, param2:Bloon) : §2X§
      {
         var _loc3_:§2X§ = null;
         _loc3_ = new §2X§();
         _loc3_.bloon = param2;
         _loc3_.§1<§ = param2.§1<§;
         _loc3_.§=F§ = param2.x;
         _loc3_.§!A§ = param2.y;
         this.vec.x = 50 + (param1.def.rangeOfVisibility - 50) * Rndm.random();
         this.vec.y = 0;
         this.vec.§ =§(Rndm.random() * Math.PI * 2);
         _loc3_.§09§ = param1.x + this.vec.x;
         _loc3_.§8-§ = param1.y + this.vec.y;
         param2.§'>§ = false;
         §0G§.store.push(_loc3_);
         return _loc3_;
      }
      
      override public function process(param1:Number) : void
      {
         var _loc4_:§2X§ = null;
         var _loc5_:§2X§ = null;
         var _loc2_:Vector.<§2X§> = §0G§.store;
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:Vector.<§2X§> = new Vector.<§2X§>();
         for each(_loc4_ in _loc2_)
         {
            if(_loc4_.bloon.type == -1)
            {
               _loc3_.push(_loc4_);
            }
            else
            {
               if(_loc4_.§5M§ <= 0.8 && _loc4_.§"T§ <= 0)
               {
                  _loc4_.§5M§ += param1;
                  _loc4_.bloon.x = _loc4_.§=F§ + (_loc4_.§09§ - _loc4_.§=F§) * (_loc4_.§5M§ / 0.8);
                  _loc4_.bloon.y = _loc4_.§!A§ + (_loc4_.§8-§ - _loc4_.§!A§) * (_loc4_.§5M§ / 0.8);
               }
               else
               {
                  _loc4_.bloon.x = _loc4_.§09§;
                  _loc4_.bloon.y = _loc4_.§8-§;
                  if(Rndm.random() < 0.03)
                  {
                     _loc4_.dir.x = Rndm.random() * 2 - 1;
                     _loc4_.dir.y = Rndm.random() * 2 - 1;
                  }
                  _loc4_.§09§ += _loc4_.dir.x;
                  _loc4_.§8-§ += _loc4_.dir.y;
               }
               if(_loc4_.§"T§ <= 0.8 && _loc4_.§"T§ > 0)
               {
                  _loc4_.§"T§ += param1;
                  _loc4_.bloon.x = _loc4_.§09§ + (_loc4_.§=F§ - _loc4_.§09§) * (_loc4_.§"T§ / 0.8);
                  _loc4_.bloon.y = _loc4_.§8-§ + (_loc4_.§!A§ - _loc4_.§8-§) * (_loc4_.§"T§ / 0.8);
               }
               else if(_loc4_.§"T§ > 0)
               {
                  _loc3_.push(_loc4_);
               }
            }
         }
         for each(_loc5_ in _loc3_)
         {
            _loc5_.bloon.§'>§ = true;
            _loc5_.bloon.§1<§ = _loc5_.§1<§;
            _loc2_.splice(_loc2_.indexOf(_loc5_),1);
         }
      }
   }
}

