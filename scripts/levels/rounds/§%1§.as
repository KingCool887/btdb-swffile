package levels.rounds
{
   import §+C§.§0>§;
   import levels.rounds.def.BloonDef;
   import levels.rounds.def.GroupDef;
   import levels.rounds.def.RoundDef;
   import levels.rounds.def.SpawnerDef;
   
   public class §%1§
   {
      
      internal var §63§:Vector.<§[5§> = new Vector.<§[5§>();
      
      internal var §%X§:Vector.<§[5§> = new Vector.<§[5§>();
      
      public var §[&§:int = 0;
      
      public var §8G§:Number = 0;
      
      public var §[G§:Number = 0;
      
      public var §`O§:RoundDef = null;
      
      protected var levelSlug:§0>§ = null;
      
      public function §%1§(param1:§0>§)
      {
         super();
         this.levelSlug = param1;
      }
      
      public static function §#H§(param1:int) : Number
      {
         if(param1 > 40)
         {
            return 1 - 0.4 - 0.0015 * param1;
         }
         return 1 - 0.01 * param1;
      }
      
      public function §@9§(param1:RoundDef) : *
      {
         var _loc2_:GroupDef = null;
         var _loc3_:SpawnerDef = null;
         var _loc4_:§[5§ = null;
         var _loc5_:Number = NaN;
         for each(_loc2_ in param1.groups)
         {
            for each(_loc3_ in _loc2_.spawners)
            {
               if(_loc3_.count == 1)
               {
                  _loc5_ = 0;
               }
               else
               {
                  _loc5_ = _loc3_.length / (_loc3_.count - 1);
               }
               _loc4_ = new §[5§(this.levelSlug,_loc3_.count,_loc3_.start,_loc5_,_loc2_.bloon.type,_loc2_.bloon.camo,_loc2_.bloon.regen);
               this.§[&§ += _loc4_.§[&§;
               this.§63§.push(_loc4_);
               this.§4Y§(_loc4_);
            }
         }
         this.§8G§ = this.§[&§ / this.§[G§;
      }
      
      public function start() : void
      {
         var _loc1_:§[5§ = null;
         this.§%X§.splice(0,this.§%X§.length);
         for each(_loc1_ in this.§63§)
         {
            this.§%X§.push(_loc1_.§'A§());
         }
      }
      
      public function §6X§() : RoundDef
      {
         var _loc3_:§[5§ = null;
         var _loc4_:GroupDef = null;
         var _loc5_:GroupDef = null;
         var _loc6_:SpawnerDef = null;
         if(this.§`O§ != null)
         {
            return this.§`O§;
         }
         var _loc1_:RoundDef = new RoundDef();
         _loc1_.groups = new Vector.<GroupDef>();
         var _loc2_:int = 0;
         while(_loc2_ < this.§63§.length)
         {
            _loc3_ = this.§63§[_loc2_];
            _loc4_ = null;
            for each(_loc5_ in _loc1_.groups)
            {
               if(_loc5_.bloon.type == _loc3_.§#S§ && _loc5_.bloon.camo == _loc3_.camo)
               {
                  _loc4_ = _loc5_;
               }
            }
            if(_loc4_ == null)
            {
               _loc4_ = new GroupDef();
               _loc4_.spawners = new Vector.<SpawnerDef>();
               _loc4_.bloon = new BloonDef();
               _loc4_.bloon.type = _loc3_.§#S§;
               _loc4_.bloon.camo = _loc3_.camo;
               _loc1_.groups.push(_loc4_);
            }
            _loc6_ = new SpawnerDef();
            _loc6_.start = _loc3_.§<M§[0];
            _loc6_.count = _loc3_.§<M§.length;
            _loc6_.length = _loc3_.§<M§[_loc6_.count - 1] - _loc6_.start;
            _loc4_.spawners.push(_loc6_);
            _loc2_++;
         }
         this.§`O§ = _loc1_;
         return _loc1_;
      }
      
      public function §#W§(param1:int, param2:int, param3:Number, param4:Number, param5:Boolean = false, param6:Boolean = false, param7:Boolean = false) : void
      {
         var _loc8_:§[5§ = null;
         if(!param7)
         {
            _loc8_ = new §[5§(this.levelSlug,param1,param4,param3,param2,param5,param6);
         }
         else
         {
            _loc8_ = new §%I§(this.levelSlug,param1,param4,param3,param2,param5,param6);
         }
         this.§[&§ += _loc8_.§[&§;
         this.§63§.push(_loc8_);
         this.§4Y§(_loc8_);
      }
      
      internal function process(param1:Number) : *
      {
         var _loc2_:§[5§ = null;
         for each(_loc2_ in this.§%X§)
         {
            _loc2_.process(param1);
         }
      }
      
      internal function §4Y§(param1:§[5§) : void
      {
         var _loc2_:Number = NaN;
         for each(_loc2_ in param1.§<M§)
         {
            this.§[G§ = Math.max(this.§[G§,_loc2_);
         }
      }
      
      public function get §,S§() : Boolean
      {
         var _loc1_:§[5§ = null;
         for each(_loc1_ in this.§%X§)
         {
            if(_loc1_.§^E§ != _loc1_.§<M§.length)
            {
               return false;
            }
         }
         return true;
      }
   }
}

