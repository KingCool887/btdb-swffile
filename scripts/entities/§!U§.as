package entities
{
   import §+C§.§0>§;
   import §;M§.§"L§;
   import assets.effects.Blacken;
   import display.Clip;
   import display.LabelOverCommand;
   import flash.display.BitmapData;
   
   public class §!U§ extends §"L§
   {
      
      internal var §0X§:§6;§ = null;
      
      internal var §=B§:Number = 0;
      
      internal var clip:Clip = new Clip();
      
      public function §!U§()
      {
         super();
      }
      
      public function initialise(param1:Class, param2:Number, param3:§0>§) : void
      {
         this.§=B§ = param2 - 0.001;
         param2 = this.§=B§;
         this.clip.initialiseWithEffect(param1,Blacken,64);
         if(this.clip.hasLabel("Loop"))
         {
            this.clip.labelOver["Loop"] = new LabelOverCommand();
            this.clip.labelOver["Loop"].command = LabelOverCommand.gotoAndPlay;
            this.clip.labelOver["Loop"].frameNoTo = 0;
            this.clip.gotoLabel("Loop");
            this.clip.play();
            this.clip.looping = true;
         }
         this.§0X§ = new §6;§();
         this.§0X§.initialise(param1,param2);
         param3.§?3§(this.§0X§);
      }
      
      override public function destroy() : void
      {
         this.§0X§.destroy();
         super.destroy();
      }
      
      override public function process(param1:Number) : void
      {
         this.§0X§.x = x;
         this.§0X§.y = y;
         this.§0X§.rotation = rotation;
         this.clip.process();
         super.process(param1);
      }
      
      override public function draw(param1:BitmapData) : void
      {
         this.§0X§.x = x;
         this.§0X§.y = y;
         this.§0X§.rotation = rotation;
         this.clip.drawRotated(param1,x,y,rotation);
         super.draw(param1);
      }
   }
}

