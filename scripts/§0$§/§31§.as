package §0$§
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import game.Balance;
   
   public class §31§ extends §`A§
   {
      
      public static const §@$§:int = 0;
      
      public static const §!H§:int = 1;
      
      public static const §%C§:int = 2;
      
      public static const §[B§:int = 3;
      
      public static const §,A§:int = 4;
      
      public static const § L§:int = 5;
      
      public static const §&8§:int = 6;
      
      public static const §?5§:int = 7;
      
      public static const §`W§:int = 8;
      
      public static const §+P§:int = 9;
      
      public static const §@1§:int = 10;
      
      public static const §'F§:int = 11;
      
      public static const §`G§:int = 12;
      
      public static const §9J§:int = 13;
      
      public static const §@+§:int = 14;
      
      public function §31§()
      {
         super();
      }
      
      override public function §,B§(param1:MovieClip) : void
      {
         super.§,B§(param1);
      }
      
      override public function show(param1:* = null) : void
      {
         mc.ok_btn.valid = true;
         if(param1 is int)
         {
            switch(int(param1))
            {
               case §@$§:
                  mc.desc_txt.text = "You have been disconnected from the main server, please retry.";
                  mc.ok_btn.click = this.§[U§;
                  break;
               case §!H§:
                  mc.desc_txt.text = "You have been disconnected from the game server.";
                  mc.ok_btn.click = this.§=@§;
                  break;
               case §%C§:
                  mc.desc_txt.text = "Your opponent disconnected from the game server, your energy for this match will be refunded.";
                  mc.ok_btn.click = this.§+F§;
                  break;
               case §[B§:
                  mc.desc_txt.text = "You have been disconnected from the game server.";
                  mc.ok_btn.click = this.§3T§;
                  break;
               case §,A§:
                  mc.desc_txt.text = "Your opponent disconnected from the game server, you\'ll receive a win by default.";
                  mc.ok_btn.click = this.§'6§;
                  break;
               case § L§:
                  mc.desc_txt.text = "Your opponent has surrendered!";
                  mc.ok_btn.click = this.§?I§;
                  break;
               case §&8§:
                  mc.desc_txt.text = "Connection to server or opponent lost.\nWaiting for a connection...";
                  mc.ok_btn.valid = false;
                  break;
               case §?5§:
                  mc.desc_txt.text = "Unable to get a response from your opponent, you will receive a win by default.";
                  mc.ok_btn.click = this.§4I§;
                  break;
               case §`W§:
                  mc.desc_txt.text = "The game server did not receive any messages from your game. You have been Timed Out.";
                  mc.ok_btn.click = this.§%K§;
                  break;
               case §+P§:
                  mc.desc_txt.text = "Your opponent failed to load or disconnected, your energy for this match will be refunded.";
                  mc.ok_btn.click = this.§]G§;
                  break;
               case §@1§:
                  mc.desc_txt.text = "You have been disconnected from the game server.";
                  mc.ok_btn.click = this.§@;§;
                  break;
               case §'F§:
                  mc.desc_txt.text = "Your opponent disconnected from the game server, your energy for this match will be refunded.";
                  mc.ok_btn.click = this.§?O§;
                  break;
               case §`G§:
                  mc.desc_txt.text = "Your opponent attempted to hack the game, you will receive a win by default. :D";
                  mc.ok_btn.click = this.§&?§;
                  break;
               case §9J§:
                  mc.desc_txt.text = "Your opponent attempted to hack the game, your energy for this match will be refunded. :D";
                  mc.ok_btn.click = this.§9§;
                  break;
               case §@+§:
                  mc.desc_txt.text = "Your opponent attempted to hack the game, as a precaution this game will be terminated.";
                  mc.ok_btn.click = this.§]$§;
            }
         }
         super.show(param1);
      }
      
      override public function hide(param1:* = null) : void
      {
         super.hide(param1);
      }
      
      private function §[U§(param1:Event) : void
      {
         §&K§.instance.§3W§();
         §&K§.instance.§?U§.show();
      }
      
      private function §=@§(param1:Event) : void
      {
         §?V§.instance.profila.disconnects += 1;
         §&K§.instance.§3W§();
         §&K§.instance.§?U§.show();
      }
      
      private function §+F§(param1:Event) : void
      {
         §&K§.instance.§0A§.§>9§();
         §&K§.instance.§3W§();
         §&K§.instance.§?U§.show();
      }
      
      private function §3T§(param1:Event) : void
      {
         §?V§.instance.§"0§.§%R§();
         §&K§.instance.§3W§();
         §&K§.instance.§?U§.show();
      }
      
      private function §'6§(param1:Event) : void
      {
         this.hide();
         §?V§.instance.§"0§.§;1§(false);
      }
      
      private function §]G§(param1:Event) : void
      {
         §?V§.instance.profila.addEnergy(Balance.instance.ENERGY_COST_PER_GAME.value);
         §?V§.instance.§"0§.§<K§();
         §&K§.instance.§3W§();
         §&K§.instance.§?U§.show();
      }
      
      private function §?I§(param1:Event) : void
      {
         this.hide();
         §?V§.instance.§"0§.§;1§(false);
      }
      
      private function §4I§(param1:Event) : void
      {
         this.hide();
         §?V§.instance.§"0§.§;1§(false);
      }
      
      private function §%K§(param1:Event) : void
      {
         §?V§.instance.§"0§.§,,§();
         §&K§.instance.§3W§();
         §&K§.instance.§?U§.show();
      }
      
      private function §@;§(param1:Event) : void
      {
         §&K§.instance.§^F§.§!B§(null);
         this.hide();
      }
      
      private function §?O§(param1:Event) : void
      {
         §&K§.instance.§^F§.§!B§(null);
         this.hide();
      }
      
      private function §&?§(param1:Event) : void
      {
         this.hide();
         §?V§.instance.§"0§.§;1§(false);
      }
      
      private function §9§(param1:Event) : void
      {
         §&K§.instance.§0A§.§>9§();
         §&K§.instance.§3W§();
         §&K§.instance.§?U§.show();
      }
      
      private function §]$§(param1:Event) : void
      {
         §&K§.instance.§^F§.§!B§(null);
         this.hide();
      }
   }
}

