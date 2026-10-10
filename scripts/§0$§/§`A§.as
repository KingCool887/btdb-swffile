package §0$§
{
   import flash.display.MovieClip;
   
   public class §`A§
   {
      
      public var mc:MovieClip = null;
      
      public var §^@§:Boolean = false;
      
      public function §`A§()
      {
         super();
      }
      
      public function §,B§(param1:MovieClip) : void
      {
         this.mc = param1;
         this.mc.visible = false;
         var _temp_3:* = this.mc;
         var _temp_2:* = this.mc;
         _temp_2.y = 0;
         _temp_3.x = 0;
      }
      
      public function show(param1:* = null) : void
      {
         trace("SHOWING_SCREEN: " + this);
         this.§^@§ = true;
         this.mc.visible = true;
         §&K§.instance.§;G§(this);
      }
      
      public function hide(param1:* = null) : void
      {
         this.§^@§ = false;
         this.mc.visible = false;
         §&K§.instance.§@L§(this);
      }
      
      public function process(param1:Number) : void
      {
      }
   }
}

