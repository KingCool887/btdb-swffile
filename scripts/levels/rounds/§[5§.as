package levels.rounds
{
   import §+C§.§0>§;
   import bloons.Bloon;
   import utils.Pool;
   
   public class §[5§
   {
      
      public static var §]U§:Vector.<int> = null;
      
      public static var §`?§:Vector.<Boolean> = null;
      
      public static var §=&§:Vector.<Boolean> = null;
      
      public var §#S§:int = -1;
      
      public var §!5§:int = -1;
      
      public var camo:Boolean = false;
      
      public var regen:Boolean = false;
      
      public var §^E§:int = 0;
      
      public var §<M§:Vector.<Number>;
      
      protected var levelSlug:§0>§ = null;
      
      public function §[5§(param1:§0>§, param2:int, param3:Number, param4:Number, param5:int, param6:Boolean, param7:Boolean)
      {
         super();
         this.levelSlug = param1;
         this.§#S§ = param5;
         this.§!5§ = param5;
         this.camo = param6;
         this.regen = param7;
         if(§]U§ != null)
         {
            this.§#S§ += §]U§[this.§#S§];
            this.§#S§ = this.§#S§ < 0 ? 0 : this.§#S§;
            this.§#S§ = this.§#S§ > §]U§.length - 1 ? int(§]U§.length - 1) : this.§#S§;
         }
         if(§`?§ != null && this.§#S§ < §`?§.length && §`?§[this.§#S§] == true)
         {
            this.camo = true;
         }
         if(§=&§ != null && this.§#S§ < §=&§.length && §=&§[this.§#S§] == true)
         {
            this.regen = true;
         }
         this.§<M§ = new Vector.<Number>();
         var _loc8_:int = 0;
         while(_loc8_ < param2)
         {
            this.§<M§.push(param3 + _loc8_ * param4);
            _loc8_++;
         }
      }
      
      public function §'A§() : §[5§
      {
         var _loc1_:Number = 0;
         if(this.§<M§.length > 1)
         {
            _loc1_ = this.§<M§[1] - this.§<M§[0];
         }
         return new §[5§(this.levelSlug,this.§<M§.length,this.§<M§[0],_loc1_,this.§!5§,this.camo,this.regen);
      }
      
      public function process(param1:Number) : *
      {
         while(this.§^E§ < this.§<M§.length && param1 > this.§<M§[this.§^E§])
         {
            this.§[+§(param1 - this.§<M§[this.§^E§]);
            ++this.§^E§;
         }
      }
      
      public function §[+§(param1:Number) : void
      {
         var _loc2_:Bloon = Pool.get(Bloon);
         var _loc3_:Number = param1 * Bloon.§]9§[this.§#S§] * Bloon.§9E§;
         _loc2_.initialise(this.levelSlug,this.§#S§,this.levelSlug.§28§,_loc3_,this.regen,this.camo,false,§?V§.instance.§"0§.§3G§);
         this.levelSlug.addBloon(_loc2_);
      }
      
      public function get §[&§() : int
      {
         return Bloon.§-M§[this.§#S§] * this.§<M§.length;
      }
   }
}

