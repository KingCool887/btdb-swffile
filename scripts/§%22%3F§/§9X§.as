package §"?§
{
   import §8$§.§7;§;
   import §8U§.§52§;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.MovieClip;
   import flash.geom.Matrix;
   import flash.utils.getDefinitionByName;
   import utils.ObjectHelper;
   
   public class §9X§
   {
      
      public var id:String;
      
      public var name:String;
      
      public var description:String;
      
      public var §"§:Vector.<Class>;
      
      public var §`+§:Vector.<Class>;
      
      public var §'T§:Vector.<Vector.<§7;§>>;
      
      public var §[X§:Vector.<Vector.<§7;§>>;
      
      private var §%<§:Bitmap;
      
      public var music:Class;
      
      public var §<9§:Boolean = true;
      
      private var §<F§:§52§ = new §52§(200,125);
      
      private var §4@§:Number = 400;
      
      public function §9X§()
      {
         super();
      }
      
      public function get §[E§() : Bitmap
      {
         var _loc1_:MovieClip = null;
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         var _loc4_:Number = NaN;
         var _loc5_:Matrix = null;
         var _loc6_:BitmapData = null;
         var _loc7_:Bitmap = null;
         if(this.§%<§ == null)
         {
            _loc1_ = new MovieClip();
            _loc2_ = new this.§"§[0]();
            _loc3_ = new this.§"§[1]();
            _loc1_.addChild(_loc2_);
            _loc1_.addChild(_loc3_);
            _loc4_ = this.§<F§.x / §?V§.§-?§.width;
            ObjectHelper.§-O§(_loc1_,_loc4_);
            _loc5_ = new Matrix();
            _loc5_.scale(_loc4_,_loc4_);
            _loc6_ = new BitmapData(this.§<F§.x,this.§<F§.y,false,4294967295);
            _loc6_.draw(_loc1_,_loc5_);
            _loc7_ = new Bitmap(_loc6_);
            _loc7_.smoothing = true;
            this.§%<§ = _loc7_;
         }
         return this.§%<§;
      }
      
      public function set §[E§(param1:Bitmap) : void
      {
         this.§%<§ = param1;
      }
      
      public function §`Y§(param1:Boolean, param2:Boolean) : void
      {
         var _loc4_:§7;§ = null;
         var _loc3_:int = 0;
         while(_loc3_ < this.§'T§[0].length)
         {
            _loc4_ = this.§'T§[0][_loc3_];
            if(param1)
            {
            }
            _loc3_++;
         }
      }
      
      private function §1-§(param1:Number) : Number
      {
         var _loc2_:Number = param1 - this.§4@§ / 2;
         return _loc2_ - _loc2_ * 2 + this.§4@§ / 2;
      }
      
      public function §6D§(param1:Number, param2:Number) : void
      {
         var _loc4_:int = 0;
         var _loc5_:§7;§ = null;
         var _loc3_:int = 0;
         while(_loc3_ < this.§'T§.length)
         {
            _loc4_ = 0;
            while(_loc4_ < this.§'T§[_loc3_].length)
            {
               _loc5_ = this.§'T§[_loc3_][_loc4_];
               _loc4_++;
            }
            _loc3_++;
         }
         _loc3_ = 0;
         while(_loc3_ < this.§[X§.length)
         {
            _loc4_ = 0;
            while(_loc4_ < this.§[X§[_loc3_].length)
            {
               _loc5_ = this.§[X§[_loc3_][_loc4_];
               _loc4_++;
            }
            _loc3_++;
         }
      }
   }
}

