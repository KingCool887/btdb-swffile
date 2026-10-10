package §0$§
{
   import flash.display.MovieClip;
   import flash.events.Event;
   
   public class §1;§ extends §`A§
   {
      
      public function §1;§()
      {
         super();
      }
      
      override public function §,B§(param1:MovieClip) : void
      {
         super.§,B§(param1);
         mc.ok_btn.click = this.§&'§;
      }
      
      override public function show(param1:* = null) : void
      {
         if(Boolean(param1.playerLose) == false)
         {
            mc.gotoAndStop("Win");
         }
         else
         {
            mc.gotoAndStop("Lose");
         }
         mc.battlescore_txt.text = String(§?V§.instance.profila.battleScore);
         mc.medallion_txt.text = String(int(param1.medsEarnt));
         super.show(param1);
      }
      
      override public function hide(param1:* = null) : void
      {
         super.hide(param1);
      }
      
      private function §&'§(param1:Event) : void
      {
         §?V§.instance.§"0§.§&6§();
         this.hide();
         §&K§.instance.§?U§.show();
      }
   }
}

