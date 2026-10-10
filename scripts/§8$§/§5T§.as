package §8$§
{
   import §8U§.§52§;
   
   public class §5T§ extends §7;§
   {
      
      private var §;"§:§52§;
      
      private var §&9§:§52§;
      
      public function §5T§()
      {
         super();
      }
      
      public function §5'§(param1:§52§) : §5T§
      {
         this.§;"§ = param1;
         return this;
      }
      
      public function §6I§(param1:§52§) : §5T§
      {
         this.§&9§ = param1;
         return this;
      }
      
      override public function initialise(param1:Vector.<§7;§>) : void
      {
         super.initialise(param1);
         var _loc2_:Number = this.§&9§.x - this.§;"§.x;
         var _loc3_:Number = this.§&9§.y - this.§;"§.y;
         §<+§ = §-N§ = Math.sqrt(_loc2_ * _loc2_ + _loc3_ * _loc3_);
         §'D§ = Vector.<§52§>([this.§;"§,this.§&9§]);
      }
      
      override public function get endAngle() : Number
      {
         return Math.atan2(this.§&9§.y - this.§;"§.y,this.§&9§.x - this.§;"§.x);
      }
      
      override public function get startAngle() : Number
      {
         return Math.atan2(this.§;"§.y - this.§&9§.y,this.§;"§.x - this.§&9§.x);
      }
      
      override public function get startX() : Number
      {
         return this.§;"§.x;
      }
      
      override public function get startY() : Number
      {
         return this.§;"§.y;
      }
      
      override public function get endX() : Number
      {
         return this.§&9§.x;
      }
      
      override public function get endY() : Number
      {
         return this.§&9§.y;
      }
   }
}

