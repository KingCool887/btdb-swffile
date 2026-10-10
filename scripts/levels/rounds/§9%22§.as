package levels.rounds
{
   import §+C§.§0>§;
   import §;M§.§&F§;
   import bloons.Bloon;
   import levels.rounds.def.RoundsDef;
   import utils.Rndm;
   
   public class §9"§ implements §&F§
   {
      
      public var §3,§:RoundsDef;
      
      public var §<P§:§%1§ = null;
      
      public var time:Number = 0;
      
      private var levelSlug:§0>§ = null;
      
      public var §^O§:Rndm = new Rndm(137);
      
      public function §9"§(param1:§0>§)
      {
         super();
         this.levelSlug = param1;
      }
      
      public function get §"3§() : int
      {
         if(!this.§<P§)
         {
            return 0;
         }
         return this.§<P§.§[&§;
      }
      
      public function get §9A§() : Number
      {
         var _loc2_:§[5§ = null;
         if(this.§<P§ == null)
         {
            return 0;
         }
         var _loc1_:Number = 0;
         for each(_loc2_ in this.§<P§.§63§)
         {
            _loc1_ = Math.max(_loc2_.§<M§[_loc2_.§<M§.length - 1],_loc1_);
         }
         return _loc1_;
      }
      
      public function process(param1:Number) : void
      {
         if(this.§<P§ == null)
         {
            return;
         }
         this.time += param1;
         this.§<P§.process(this.time);
      }
      
      public function §=W§(param1:int, param2:uint) : void
      {
         this.time = 0;
         this.§^O§.seed = param2;
         if(this.§3,§.rounds.length == 0)
         {
            return;
         }
         if(param1 < this.§3,§.rounds.length)
         {
            this.§<P§ = new §%1§(this.levelSlug);
            this.§<P§.§@9§(this.§3,§.rounds[param1]);
         }
         else
         {
            this.§<P§ = this.§8P§(param1);
         }
         this.§<P§.start();
      }
      
      public function get running() : Boolean
      {
         return this.§<P§ != null && !this.§<P§.§,S§;
      }
      
      public function get §'$§() : int
      {
         return this.§3,§.rounds.length;
      }
      
      private function §8P§(param1:int) : §%1§
      {
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:Number = NaN;
         var _loc2_:§%1§ = new §%1§(this.levelSlug);
         var _loc4_:int = param1 - 43;
         var _loc5_:int = 3 + param1 * 0.2;
         var _loc6_:Number = 0;
         var _loc7_:int = 0;
         while(_loc7_ < _loc5_)
         {
            _loc8_ = this.§?6§(_loc4_);
            _loc9_ = this.§ &§(_loc4_,_loc8_);
            _loc10_ = this.§;L§(_loc4_,_loc8_);
            _loc2_.§#W§(_loc9_,_loc8_,_loc10_,_loc6_,this.§^O§.boolean(),this.§^O§.boolean(),false);
            _loc6_ += _loc9_ * _loc10_ * 0.73;
            _loc7_++;
         }
         return _loc2_;
      }
      
      private function §?6§(param1:int) : int
      {
         var _loc2_:Number = (11 - param1) * 2.27272;
         if(_loc2_ < 0)
         {
            _loc2_ = 0;
         }
         var _loc3_:Number = (15 - param1) * 1.66666;
         if(_loc3_ < 0)
         {
            _loc3_ = 0;
         }
         var _loc4_:Number = (30 - param1) * 0.83333;
         if(_loc4_ < 0)
         {
            _loc4_ = 0;
         }
         var _loc5_:Number = (45 - param1) * 0.55555;
         if(_loc5_ < 0)
         {
            _loc5_ = 0;
         }
         var _loc6_:Number = this.§^O§.random() * 100;
         switch(true)
         {
            case _loc6_ < _loc2_:
               return Bloon.§!@§;
            case _loc6_ < _loc2_ + _loc3_:
               return Bloon.§0T§;
            case _loc6_ < _loc2_ + _loc3_ + _loc4_:
               return Bloon.MOAB;
            case _loc6_ < _loc2_ + _loc3_ + _loc4_ + _loc5_:
               return Bloon.BFB;
            default:
               return Bloon.§9?§;
         }
      }
      
      private function § &§(param1:int, param2:int) : int
      {
         switch(param2)
         {
            case Bloon.§!@§:
               return 40 + param1 * 4;
            case Bloon.§0T§:
               return 20 + param1 * 3;
            case Bloon.MOAB:
               return this.§^O§.integer(3,7);
            case Bloon.BFB:
               return this.§^O§.integer(1,3);
            default:
               return 1;
         }
      }
      
      private function §;L§(param1:int, param2:int) : Number
      {
         switch(param2)
         {
            case Bloon.§!@§:
               return 0.15 - 0.02 * param1;
            case Bloon.§0T§:
               return 0.3 - 0.02 * param1;
            case Bloon.MOAB:
               return 1.3 - 0.01 * param1;
            case Bloon.BFB:
               return 5 - 0.02 * param1;
            default:
               return 8;
         }
      }
      
      public function §7J§() : Number
      {
         if(this.§<P§ != null)
         {
            return this.§<P§.§[G§;
         }
         return 0;
      }
   }
}

