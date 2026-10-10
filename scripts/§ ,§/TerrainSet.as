package § ,§
{
   import §8U§.§52§;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   import flash.display.MovieClip;
   import flash.geom.Rectangle;
   import flash.utils.Dictionary;
   import towers.Tower;
   import towers.def.TowerDef;
   import utils.Rndm;
   
   public class TerrainSet
   {
      
      public static const TRACK:String = "track";
      
      public static const DEAD_ZONE:String = "deadZone";
      
      public static const WATER:String = "water";
      
      public static const LAND:String = "land";
      
      public static const TOWERS:String = "towers";
      
      public static const UNPLACEABLE_AREA:String = "unplaceableArea";
      
      public static const MANMADE_WATER:String = "manMadeWater";
      
      public static const MANMADE_LAND:String = "manMadeLand";
      
      public var terrainTypes:Dictionary = null;
      
      private var towerTestMapSource:MovieClip;
      
      public var towerMadeWater:Dictionary = new Dictionary();
      
      public var towerMadeLand:Dictionary = new Dictionary();
      
      public var platforms:Dictionary = new Dictionary();
      
      public function TerrainSet(param1:Class = null)
      {
         var _loc6_:MovieClip = null;
         var _loc7_:§#%§ = null;
         var _loc8_:Bitmap = null;
         super();
         if(param1 == null)
         {
            return;
         }
         var _loc2_:MovieClip = new param1();
         this.terrainTypes = new Dictionary();
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.numChildren)
         {
            _loc6_ = MovieClip(_loc2_.getChildAt(_loc3_));
            _loc7_ = new §#%§(_loc6_);
            this.terrainTypes[_loc6_.name] = _loc7_;
            _loc3_++;
         }
         if(this.terrainTypes[WATER] != null)
         {
            _loc8_ = new Bitmap(this.terrainTypes[WATER].inverseTestMap);
            _loc8_.scaleX = _loc8_.scaleY = 1 / §#%§.§2>§;
         }
         else
         {
            _loc8_ = new Bitmap(new BitmapData(§?V§.§-?§.width,§?V§.§-?§.height,false,16764108));
         }
         var _loc4_:MovieClip = new MovieClip();
         _loc4_.addChild(_loc8_);
         var _loc5_:§#%§ = new §#%§(_loc4_);
         this.terrainTypes[LAND] = _loc5_;
         this.generateTestMaps();
      }
      
      public function generateTestMaps() : *
      {
         var _loc2_:Bitmap = null;
         var _loc3_:Bitmap = null;
         var _loc1_:MovieClip = new MovieClip();
         if(this.terrainTypes[TRACK] != null)
         {
            _loc2_ = new Bitmap(this.terrainTypes[TRACK].testMap);
            _loc2_.scaleX = _loc2_.scaleY = 1 / §#%§.§2>§;
            _loc1_.addChild(_loc2_);
         }
         if(this.terrainTypes[DEAD_ZONE] != null)
         {
            _loc3_ = new Bitmap(this.terrainTypes[DEAD_ZONE].testMap);
            _loc3_.scaleX = _loc3_.scaleY = 1 / §#%§.§2>§;
            _loc1_.addChild(_loc3_);
         }
         if(this.towerTestMapSource != null)
         {
            _loc1_.addChild(this.towerTestMapSource);
         }
         this.terrainTypes[UNPLACEABLE_AREA] = new §#%§(_loc1_);
      }
      
      public function addTower(param1:Tower, param2:Vector.<Tower>) : void
      {
         if(param1.def.changesTerrain != 0)
         {
            this.addTerrainChangingTower(param1);
         }
         if(param1.def.isPlatform)
         {
            this.platforms[param1] = new §&C§(param1,new §#%§(param1.occupiedSpace));
         }
         else
         {
            this.checkAndAddToPlatform(param1);
         }
         this.updateTowerMap(param2);
      }
      
      public function removeTower(param1:Tower, param2:Vector.<Tower>) : void
      {
         if(param1.def.changesTerrain != 0)
         {
            this.removeTerrainChangingTower(param1);
         }
         if(param1.def.isPlatform)
         {
            delete this.platforms[param1];
         }
         else
         {
            this.checkAndRemoveFromPlatform(param1);
         }
         this.updateTowerMap(param2);
      }
      
      public function updateTowerMap(param1:Vector.<Tower>) : void
      {
         var _loc2_:Tower = null;
         this.towerTestMapSource = null;
         for each(_loc2_ in param1)
         {
            if(!_loc2_.def.isPlatform)
            {
               if(this.towerTestMapSource == null)
               {
                  this.towerTestMapSource = new MovieClip();
               }
               this.towerTestMapSource.addChild(_loc2_.occupiedSpace);
            }
         }
         this.generateTestMaps();
      }
      
      private function addTerrainChangingTower(param1:Tower) : void
      {
         switch(param1.def.changesTerrain)
         {
            case TowerDef.CHANGE_TERRAIN_TO_WATER:
               this.towerMadeWater[param1] = new §&C§(param1,new §#%§(param1.occupiedSpace));
               break;
            case TowerDef.CHANGE_TERRAIN_TO_LAND:
               this.towerMadeLand[param1] = new §&C§(param1,new §#%§(param1.occupiedSpace));
         }
      }
      
      private function removeTerrainChangingTower(param1:Tower) : void
      {
         switch(param1.def.changesTerrain)
         {
            case TowerDef.CHANGE_TERRAIN_TO_WATER:
               delete this.towerMadeWater[param1];
               break;
            case TowerDef.CHANGE_TERRAIN_TO_LAND:
               delete this.towerMadeLand[param1];
         }
      }
      
      private function checkAndAddToPlatform(param1:Tower) : void
      {
         var _loc3_:§&C§ = null;
         var _loc4_:Boolean = false;
         var _loc2_:MovieClip = param1.occupiedSpace;
         for each(_loc3_ in this.platforms)
         {
            _loc4_ = _loc3_.§@Y§.isWithin(_loc2_);
            if(_loc4_)
            {
               _loc3_.tower.§#N§(param1);
               return;
            }
         }
      }
      
      private function checkAndRemoveFromPlatform(param1:Tower) : void
      {
         var _loc2_:§&C§ = null;
         for each(_loc2_ in this.platforms)
         {
            if(_loc2_.tower.§<B§(param1))
            {
               return;
            }
         }
      }
      
      public function modifyDeadZone(param1:Class, param2:Vector.<MovieClip>, param3:Vector.<MovieClip>) : void
      {
         var _loc6_:MovieClip = null;
         var _loc4_:MovieClip = new param1();
         var _loc5_:MovieClip = _loc4_.deadZone;
         if(param3 != null)
         {
            for each(_loc6_ in param3)
            {
               _loc6_.blendMode = BlendMode.ERASE;
               _loc5_.addChild(_loc6_);
            }
         }
         if(param2 != null)
         {
            for each(_loc6_ in param2)
            {
               _loc5_.addChild(_loc6_);
            }
         }
         this.terrainTypes[DEAD_ZONE] = new §#%§(_loc5_);
         this.generateTestMaps();
      }
      
      public function canPlace(param1:MovieClip, param2:Boolean = false, param3:Boolean = false) : *
      {
         var _loc4_:Rectangle = param1.getBounds(null);
         if(param1.x + _loc4_.x < §?V§.§0U§.x || param1.y + _loc4_.y < §?V§.§0U§.y || param1.x + _loc4_.right > §?V§.§0U§.right || param1.y + _loc4_.bottom > §?V§.§0U§.bottom)
         {
            return false;
         }
         if(param3)
         {
            return this.terrainTypes[UNPLACEABLE_AREA].isOutside(param1);
         }
         if(param2)
         {
            return this.terrainTypes[UNPLACEABLE_AREA].isOutside(param1) && this.onWater(param1);
         }
         return this.terrainTypes[UNPLACEABLE_AREA].isOutside(param1) && this.onLand(param1);
      }
      
      public function isOnTrack(param1:MovieClip) : Boolean
      {
         var _loc2_:Rectangle = param1.getBounds(null);
         if(param1.x + _loc2_.x < 0 || param1.y + _loc2_.y < 0 || param1.x + _loc2_.x + _loc2_.width > §?V§.§0U§.width || param1.y + _loc2_.y + _loc2_.height > §?V§.§0U§.height)
         {
            return false;
         }
         return !this.terrainTypes[TRACK].isOutside(param1);
      }
      
      public function onWater(param1:MovieClip) : Boolean
      {
         return (this.terrainTypes[WATER] != null && this.terrainTypes[WATER].isWithin(param1) || this.completelyOnTowerMadeWater(param1)) && !this.touchingTowerMadeLand(param1);
      }
      
      public function onLand(param1:MovieClip) : Boolean
      {
         return (Boolean(this.terrainTypes[LAND].isWithin(param1)) || this.completelyOnTowerMadeLand(param1)) && !this.touchingTowerMadeWater(param1);
      }
      
      private function completelyOnTowerMadeWater(param1:MovieClip) : Boolean
      {
         var _loc2_:§&C§ = null;
         var _loc3_:Boolean = false;
         for each(_loc2_ in this.towerMadeWater)
         {
            _loc3_ = _loc2_.§@Y§.isWithin(param1);
            if(_loc3_)
            {
               return true;
            }
         }
         return false;
      }
      
      private function completelyOnTowerMadeLand(param1:MovieClip) : Boolean
      {
         var _loc2_:§&C§ = null;
         var _loc3_:Boolean = false;
         for each(_loc2_ in this.towerMadeLand)
         {
            _loc3_ = _loc2_.§@Y§.isWithin(param1);
            if(_loc3_)
            {
               return true;
            }
         }
         return false;
      }
      
      private function touchingTowerMadeWater(param1:MovieClip) : Boolean
      {
         var _loc2_:§&C§ = null;
         var _loc3_:Boolean = false;
         for each(_loc2_ in this.towerMadeWater)
         {
            _loc3_ = _loc2_.§@Y§.isOutside(param1);
            if(!_loc3_)
            {
               return true;
            }
         }
         return false;
      }
      
      private function touchingTowerMadeLand(param1:MovieClip) : Boolean
      {
         var _loc2_:§&C§ = null;
         var _loc3_:Boolean = false;
         for each(_loc2_ in this.towerMadeLand)
         {
            _loc3_ = _loc2_.§@Y§.isOutside(param1);
            if(!_loc3_)
            {
               return true;
            }
         }
         return false;
      }
      
      public function getValidPlacePositionInRadius(param1:MovieClip, param2:§52§, param3:Number, param4:Boolean = false, param5:Boolean = false) : §52§
      {
         var _loc7_:§52§ = null;
         var _loc6_:int = 0;
         while(_loc6_ < 30)
         {
            _loc7_ = new §52§();
            _loc7_.§`1§(2 * Math.PI * Rndm.random(),param3 * Rndm.random());
            param1.x = param2.x + _loc7_.x;
            param1.y = param2.y + _loc7_.y;
            if(this.canPlace(param1,param4,param5))
            {
               return new §52§(param1.x,param1.y);
            }
            _loc6_++;
         }
         return null;
      }
   }
}

