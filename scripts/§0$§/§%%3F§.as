package §0$§
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import game.§6$§;
   
   public class §%?§ extends §`A§
   {
      
      public function §%?§()
      {
         super();
      }
      
      override public function §,B§(param1:MovieClip) : void
      {
         super.§,B§(param1);
         mc.close_btn.click = this.hide;
         mc.assaultMode.click = this.§1U§;
         mc.defendMode.click = this.§]@§;
      }
      
      override public function show(param1:* = null) : void
      {
         super.show(param1);
      }
      
      override public function hide(param1:* = null) : void
      {
         super.hide(param1);
      }
      
      public function §1U§(param1:Event) : void
      {
         §?V§.instance.§"0§.§`E§ = §6$§.§8!§;
         §&K§.instance.§'I§.show();
         this.hide();
         §&K§.instance.§?U§.hide();
      }
      
      public function §]@§(param1:Event) : void
      {
         §?V§.instance.§"0§.§`E§ = §6$§.§5B§;
         §&K§.instance.§'I§.show();
         this.hide();
         §&K§.instance.§?U§.hide();
      }
   }
}

