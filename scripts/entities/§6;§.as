package entities
{
   import §;M§.§"L§;
   import display.Clip;
   import display.LabelOverCommand;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   
   public class §6;§ extends §"L§
   {
      
      public var clip:Clip = new Clip();
      
      public var §=B§:Number = 0;
      
      public function §6;§()
      {
         super();
      }
      
      public function initialise(param1:Class, param2:Number) : void
      {
         this.§=B§ = param2;
         this.clip.initialise(param1,64);
         this.clip.looping = true;
         if(this.clip.hasLabel("Loop"))
         {
            this.clip.labelOver["Loop"] = new LabelOverCommand();
            this.clip.labelOver["Loop"].command = LabelOverCommand.gotoAndPlay;
            this.clip.labelOver["Loop"].frameNoTo = 0;
            this.clip.gotoLabel("Loop");
            this.clip.play();
            this.clip.looping = true;
         }
         z = param2;
      }
      
      override public function process(param1:Number) : void
      {
         this.clip.process();
      }
      
      override public function draw(param1:BitmapData) : void
      {
         this.clip.drawWithBlendMode(param1,x,y,rotation,BlendMode.ADD);
      }
   }
}

