package levels.rounds
{
   import §+C§.§0>§;
   import bloons.Bloon;
   
   public class §%I§ extends §[5§
   {
      
      internal var interval:Number = 0.6;
      
      public function §%I§(param1:§0>§, param2:int, param3:Number, param4:Number, param5:int, param6:Boolean, param7:Boolean)
      {
         super(param1,param2,param3,param4,param5,param6,param7);
      }
      
      override public function §[+§(param1:Number) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:int = 0;
         super.§[+§(param1);
         if(§^E§ == §<M§.length)
         {
            _loc2_ = §<M§[§<M§.length - 1];
            _loc3_ = 0;
            while(_loc3_ < 10)
            {
               §<M§.push(this.interval * _loc3_ + _loc2_);
               _loc3_++;
            }
            §#S§ = Bloon.§9?§;
            regen = false;
            camo = false;
         }
      }
      
      override public function §'A§() : §[5§
      {
         var _loc1_:Number = 0;
         if(§<M§.length > 1)
         {
            _loc1_ = §<M§[1] - §<M§[0];
         }
         return new §%I§(levelSlug,§<M§.length,§<M§[0],_loc1_,§#S§,camo,regen);
      }
   }
}

