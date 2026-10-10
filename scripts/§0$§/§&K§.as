package §0$§
{
   import flash.display.MovieClip;
   import menuassets.AllMenus;
   
   public class §&K§
   {
      
      public static var instance:§&K§ = new §&K§();
      
      public var §[D§:MovieClip;
      
      public var §[H§:Vector.<§`A§> = new Vector.<§`A§>();
      
      public var §#<§:§6H§;
      
      public var §?U§:§<'§;
      
      public var §'I§:§2S§;
      
      public var §3E§:§=C§;
      
      public var §0A§:§@%§;
      
      public var §^F§:§#7§;
      
      public var §?H§:§1;§;
      
      public var §;S§:§1C§;
      
      public var §0?§:§5§;
      
      public var § <§:§`D§;
      
      public var §'2§:§-D§;
      
      public var §+Y§:§<L§;
      
      public var §26§:§[8§;
      
      public var §^<§:§31§;
      
      public var §>1§:§['§;
      
      public var §^G§:§%?§;
      
      public var § Q§:§'O§;
      
      public function §&K§()
      {
         super();
      }
      
      public function §03§() : void
      {
         this.§[D§ = new AllMenus();
         §?V§.instance.addChild(this.§[D§);
         this.§#<§ = new §6H§();
         this.§#<§.§,B§(this.§[D§.info_overlay);
         this.§?U§ = new §<'§();
         this.§?U§.§,B§(this.§[D§.main_menu);
         this.§'I§ = new §2S§();
         this.§'I§.§,B§(this.§[D§.finding_match_screen);
         this.§3E§ = new §=C§();
         this.§3E§.§,B§(this.§[D§.private_screen);
         this.§0A§ = new §@%§();
         this.§0A§.§,B§(this.§[D§.prebattle_screen);
         this.§^F§ = new §#7§();
         this.§^F§.§,B§(this.§[D§.private_prebattle_screen);
         this.§?H§ = new §1;§();
         this.§?H§.§,B§(this.§[D§.endgame_screen);
         this.§;S§ = new §1C§();
         this.§;S§.§,B§(this.§[D§.loading_screen);
         this.§0?§ = new §5§();
         this.§0?§.§,B§(this.§[D§.towers_screen);
         this.§ <§ = new §`D§();
         this.§ <§.§,B§(this.§[D§.decals_screen);
         this.§'2§ = new §-D§();
         this.§'2§.§,B§(this.§[D§.store_screen);
         this.§+Y§ = new §<L§();
         this.§+Y§.§,B§(this.§[D§.login_screen);
         this.§26§ = new §[8§();
         this.§26§.§,B§(this.§[D§.fail_screen);
         this.§^<§ = new §31§();
         this.§^<§.§,B§(this.§[D§.disconnect_screen);
         this.§>1§ = new §['§();
         this.§>1§.§,B§(this.§[D§.confirm_screen);
         this.§^G§ = new §%?§();
         this.§^G§.§,B§(this.§[D§.gameMode_screen);
         this.§ Q§ = new §'O§();
         this.§ Q§.§,B§(this.§[D§.hacker_screen);
      }
      
      public function §;G§(param1:§`A§) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.§[H§.length)
         {
            if(this.§[H§[_loc2_] == param1)
            {
               return;
            }
            _loc2_++;
         }
         this.§[H§.push(param1);
      }
      
      public function §@L§(param1:§`A§) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.§[H§.length)
         {
            if(this.§[H§[_loc2_] == param1)
            {
               this.§[H§.splice(_loc2_,1);
            }
            _loc2_++;
         }
      }
      
      public function §3W§() : void
      {
         while(this.§[H§.length > 0)
         {
            this.§[H§[this.§[H§.length - 1].hide();
         }
      }
      
      public function process(param1:Number) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.§[H§.length)
         {
            this.§[H§[_loc2_].process(param1);
            _loc2_++;
         }
      }
      
      public function §+&§(param1:§`A§) : Boolean
      {
         return this.§[H§.indexOf(param1) != -1;
      }
   }
}

