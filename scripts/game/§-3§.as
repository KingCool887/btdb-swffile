package game
{
   import §+C§.§0>§;
   import bloons.Bloon;
   import utils.Pool;
   
   public class §-3§
   {
      
      public static var §20§:int = 0;
      
      private var §'=§:int = -1;
      
      public var camo:Boolean = false;
      
      public var regen:Boolean = false;
      
      private var §^E§:int = 0;
      
      private var §<M§:Vector.<Number> = new Vector.<Number>();
      
      private var timer:Number = 0;
      
      private var levelSlug:§0>§ = null;
      
      public var §1T§:BloonSendDef;
      
      public var §-0§:int;
      
      public function §-3§(param1:§0>§, param2:int, param3:BloonSendDef, param4:Boolean, param5:Boolean)
      {
         super();
         this.levelSlug = param1;
         this.§-0§ = param2;
         this.§1T§ = param3;
         this.§'=§ = param3.type;
         this.camo = param4;
         this.regen = param5;
         var _loc6_:int = 0;
         while(_loc6_ < param3.quantity)
         {
            this.§<M§.push((_loc6_ + 1) * param3.interval);
            _loc6_++;
         }
      }
      
      public function process(param1:Number) : void
      {
         this.timer += param1;
         while(this.§^E§ < this.§<M§.length && this.§<M§[this.§^E§] <= this.timer)
         {
            this.§[+§(this.timer - this.§<M§[this.§^E§]);
            ++this.§^E§;
         }
      }
      
      private function §[+§(param1:Number) : void
      {
         var _loc2_:Bloon = Pool.get(Bloon);
         var _loc3_:Number = param1 * Bloon.§]9§[this.§'=§] * Bloon.§9E§;
         _loc2_.initialise(this.levelSlug,this.§'=§,this.levelSlug.§&B§,_loc3_,this.regen,this.camo,true,§?V§.instance.§"0§.§3G§);
         this.levelSlug.addBloon(_loc2_);
      }
      
      public function §,S§() : Boolean
      {
         return this.§^E§ >= this.§<M§.length;
      }
   }
}

