package entities
{
   import §;M§.§"L§;
   import display.Clip;
   import flash.display.BitmapData;
   import flash.utils.getQualifiedClassName;
   
   public class §^X§ extends §"L§
   {
      
      public var clip:Clip = new Clip();
      
      public var §=B§:Number = 0;
      
      public var id:String = null;
      
      public function §^X§(param1:String = null)
      {
         super();
         this.id = param1;
      }
      
      public function initialise(param1:Class, param2:Number, param3:int = 1) : void
      {
         this.§=B§ = param2;
         this.clip.initialise(param1,param3);
         if(getQualifiedClassName(param1) == "assets.maps::YinyangSparkle" || getQualifiedClassName(param1) == "assets.maps::ZenWateranimation" || getQualifiedClassName(param1) == "assets.maps::ZenSparkle" || getQualifiedClassName(param1) == "assets.maps.volcano::lavabubble" || getQualifiedClassName(param1) == "assets.maps.volcano::smoke" || getQualifiedClassName(param1) == "assets.maps::SnowyCastleSnowflake_anim")
         {
            this.clip.frameIndex = int(this.clip.frameCount * Math.random());
         }
         this.clip.play();
         this.clip.looping = true;
         z = param2;
      }
      
      override public function process(param1:Number) : void
      {
         this.clip.process();
      }
      
      override public function draw(param1:BitmapData) : void
      {
         if(rotation == 0)
         {
            this.clip.quickDraw(param1,x,y);
         }
         else
         {
            this.clip.drawRotated(param1,x,y,rotation);
         }
      }
   }
}

