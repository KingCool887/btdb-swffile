package §8U§
{
   import flash.geom.Matrix;
   import utils.Pool;
   
   public class §!=§
   {
      
      private var §0E§:Vector.<§%L§>;
      
      private var § R§:Vector.<Number> = new Vector.<Number>();
      
      public var § X§:Number = 0;
      
      public function §!=§()
      {
         super();
      }
      
      public function initialise(param1:Vector.<§%L§>) : void
      {
         var _loc2_:§%L§ = null;
         var _loc3_:Number = NaN;
         this.§0E§ = param1;
         this.§ R§.splice(0,this.§ R§.length);
         this.§ X§ = 0;
         for each(_loc2_ in param1)
         {
            _loc3_ = _loc2_.length;
            this.§ R§.push(_loc3_);
            this.§ X§ += _loc3_;
         }
      }
      
      public function §4;§(param1:Number, param2:§52§, param3:Number, param4:Number, param5:Number) : §52§
      {
         var _loc7_:Matrix = null;
         param1 *= this.§ X§;
         var _loc6_:int = 0;
         while(_loc6_ < this.§ R§.length)
         {
            if(param1 - this.§ R§[_loc6_] <= 0)
            {
               this.§0E§[_loc6_].getValue(param1 = param1 / this.§ R§[_loc6_],param2);
               _loc7_ = Pool.get(Matrix);
               _loc7_.identity();
               _loc7_.rotate(param3);
               _loc7_.translate(param4,param5);
               param2.§9F§(_loc7_);
               Pool.release(_loc7_);
               return param2;
            }
            param1 -= this.§ R§[_loc6_];
            _loc6_++;
         }
         return null;
      }
   }
}

