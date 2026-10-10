package
{
   import §"?§.§2D§;
   import §0$§.§&K§;
   import §>$§.§10§;
   import assets.gui.Tooltip;
   import assets.music.Jazz;
   import decals.§'4§;
   import display.FrameFactory;
   import display.ui.Tooltip;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.ThrottleEvent;
   import flash.events.ThrottleType;
   import flash.geom.Rectangle;
   import flash.system.ApplicationDomain;
   import flash.system.Security;
   import game.§5>§;
   import game.§6$§;
   import game.§9;§;
   import levels.rounds.§!M§;
   import menuassets.IntroHold;
   import ninjakiwi.mynk.MyNK;
   import ninjakiwi.mynk.NKEvent;
   import ninjakiwi.mynk.kongregate.Kong_Gateway;
   import ninjakiwi.mynk.nk.NK_Gateway;
   import ninjakiwi.mynk.sharedDefinitions.ArgumentPlaceholder;
   import ninjakiwi.mynk.sharedDefinitions.Msg;
   import ninjakiwi.state.State;
   import ninjakiwi.utils.StandardStuff;
   import premium.§[7§;
   import profile.Profile;
   import sound.§%'§;
   import towers.§,X§;
   import towers.§7I§;
   
   [SWF(width="800", height="620", backgroundColor="#ffffff", frameRate="30")]
   [SWF(frameRate="30",backgroundColor="#ffffff",width="800",height="620")]
   [SWF(frameRate="30",backgroundColor="#ffffff",width="800",height="620")]
   [SWF(frameRate="30",backgroundColor="#ffffff",width="800",height="620")]
   [SWF(frameRate="30",backgroundColor="#ffffff",width="800",height="620")]
   [SWF(frameRate="30",backgroundColor="#ffffff",width="800",height="620")]
   [SWF(frameRate="30",backgroundColor="#ffffff",width="800",height="620")]
   [SWF(frameRate="30",backgroundColor="#ffffff",width="800",height="620")]
   public class §?V§ extends MovieClip
   {
      
      public static var instance:§?V§;
      
      public static const SITE_DETECTED:String = "SITE_DETECTED";
      
      public static const §!§:uint = 0;
      
      public static const §-Q§:uint = 1;
      
      public static var §0U§:Rectangle = new Rectangle(0,25,800,475);
      
      public static var §-?§:Rectangle = new Rectangle(0,0,800,500);
      
      public static var §;#§:uint = §!§;
      
      public static var §00§:Boolean = false;
      
      public var §1=§:FrameFactory = new FrameFactory();
      
      public var §=K§:§7I§ = new §7I§();
      
      public var §%-§:§!M§ = new §!M§();
      
      public var §0J§:§[7§ = new §[7§();
      
      public var §+>§:§,X§ = null;
      
      public var §7?§:§9;§ = new §9;§();
      
      public var §+J§:§5>§ = new §5>§();
      
      public var §%5§:§'4§ = new §'4§();
      
      public var §%6§:int = 800;
      
      public var §<H§:int = 500;
      
      public var scale:Number = 1;
      
      public var §68§:Number = 1;
      
      public var §"X§:Number = 1;
      
      public var container:MovieClip = null;
      
      public var §@X§:BitmapData = null;
      
      private var §2J§:Bitmap = null;
      
      public var §>7§:BitmapData = null;
      
      private var §%M§:Bitmap = null;
      
      public var §7G§:MovieClip = null;
      
      public var §"0§:§6$§;
      
      public var profila:Profile = new Profile();
      
      public var tooltip:display.ui.Tooltip = null;
      
      public var §8#§:IntroHold;
      
      private var §4T§:§%'§ = new §%'§(Jazz);
      
      public var §@A§:ApplicationDomain = new ApplicationDomain();
      
      public var §=L§:int;
      
      private var §]+§:String = null;
      
      public var §1?§:String = "6688f61dd98324b70f57de3ca3387050c8472939659b2c8554e45dc19bdf02783ea83d6ce20bf4b531cc34e7c4b05f3bf3b4d8996cea1c2ae876d68ce2a58546";
      
      private var §=I§:Number = 30;
      
      private var §14§:String = "";
      
      public function §?V§()
      {
         super();
         instance = this;
         this.§+>§ = new §,X§();
         addEventListener(Event.ADDED_TO_STAGE,this.initialise);
      }
      
      private function initialise(param1:Event) : void
      {
         var isDebug:Boolean;
         var tooltip_mc:assets.gui.Tooltip;
         var key:String = null;
         var event:Event = param1;
         tabChildren = false;
         try
         {
            Security.allowDomain("*");
         }
         catch(e:Error)
         {
         }
         this.§@X§ = new BitmapData(this.§%6§ / 2 * this.scale,this.§<H§ * this.scale);
         this.§2J§ = new Bitmap(this.§@X§);
         this.§>7§ = new BitmapData(this.§%6§ * this.scale,this.§<H§ * this.scale);
         this.§%M§ = new Bitmap(this.§>7§);
         y = 20;
         StandardStuff.showSplash(this);
         StandardStuff.addEventListener(Event.COMPLETE,this.§"!§);
         StandardStuff.setContextMenu(this);
         isDebug = false;
         switch(true)
         {
            case false:
               §;#§ = §-Q§;
               for(key in root.loaderInfo.parameters)
               {
               }
               MyNK.makeMyNKey(new Kong_Gateway(stage.loaderInfo,§1>§.GAME_NAME,false));
               break;
            case false:
               §;#§ = §!§;
               MyNK.makeMyNKey(new NK_Gateway(§1>§.GAME_NAME,isDebug));
               break;
            default:
               §;#§ = §!§;
               MyNK.makeMyNKey(new NK_Gateway(§1>§.GAME_NAME,isDebug));
         }
         §10§.instance.§,B§(StandardStuff.§-&§);
         stage.addChild(MyNK.ey.displayObject);
         MyNK.ey.uiHelper.waitForGame();
         §?V§.instance.dispatchEvent(new Event(SITE_DETECTED));
         MyNK.ey.addEventListener(Msg.DATA_INVALIDATED,this.§`R§);
         MyNK.ey.addEventListener(Msg.NEW_ITEM,this.itemBoughtNow);
         MyNK.ey.addEventListener(Msg.OLD_ITEM,this.§@6§);
         MyNK.ey.addEventListener(Msg.CURR_BALANCE_UPDATE,function(param1:*):void
         {
            if(MyNK.ey.user.isLoggedIn())
            {
               profila.medallions = param1.payload;
            }
         });
         MyNK.ey.uiHelper.addEventListener(MyNK.ey.uiHelper.SHOW_LOGIN_OPTIONS,this.§;T§);
         MyNK.ey.uiHelper.addEventListener(MyNK.ey.uiHelper.SHOW_MAIN_MENU,this.§,?§);
         MyNK.ey.uiHelper.addEventListener(MyNK.ey.uiHelper.SHOW_FAIL_OPTIONS,this.showFailOptions);
         this.container = new MovieClip();
         addChild(this.container);
         this.container.addChild(this.§%M§);
         this.container.addChild(this.§2J§);
         this.§7G§ = new MovieClip();
         addChild(this.§7G§);
         §&K§.instance.§03§();
         this.§"0§ = new §6$§();
         this.§"0§.§,B§();
         tooltip_mc = new assets.gui.Tooltip();
         addChild(tooltip_mc);
         this.tooltip = new display.ui.Tooltip(tooltip_mc);
         this.§=L§ = -1;
         this.addEventListener(Event.ENTER_FRAME,this.frame);
         §10§.instance.§5"§.add(this.§5L§);
         stage.addEventListener(ThrottleEvent.THROTTLE,this.§&O§);
         stage.addEventListener(KeyboardEvent.KEY_DOWN,this.§&=§);
      }
      
      private function §"!§(param1:Event) : void
      {
         this.§8#§ = new IntroHold();
         addChild(this.§8#§);
         this.§8#§.play();
         if(MyNK.ey.state.isCurrently(MyNK.ey.state.CONNECTED))
         {
            this.§;E§(null);
         }
         else if(MyNK.ey.state.isCurrently(MyNK.ey.state.FAILED))
         {
            this.§;E§(null);
         }
         else
         {
            MyNK.ey.state.CONNECTED.addEventListener(State.ENTER,this.§;E§);
            MyNK.ey.state.FAILED.addEventListener(State.ENTER,this.§;E§);
         }
      }
      
      private function §;E§(param1:Event) : void
      {
         §2D§.§`@§.add(this.§1S§);
         §2D§.§<4§();
      }
      
      private function §1S§() : void
      {
         §2D§.§`@§.remove(this.§1S§);
         this.showMainMenu();
      }
      
      private function showMainMenu() : void
      {
         if(this.§8#§ != null)
         {
            removeChild(this.§8#§);
            this.§8#§ = null;
         }
         §&K§.instance.§?U§.show();
         MyNK.ey.uiHelper.gameIsReady();
      }
      
      private function §;T§(param1:Event) : void
      {
         var _loc2_:String = null;
         if(this.§]+§ == null)
         {
            _loc2_ = "To play BTD Battles you must have a NinjaKiwi account, please login with your account or register a new one below.";
         }
         else if(this.§"0§.§^@§ == false)
         {
            _loc2_ = "Please Log back in to your NinjaKiwi account to continue playing.";
         }
         else
         {
            _loc2_ = "Please Log back in to your NinjaKiwi account. If you don\'t your wins and losses will still be recorded but you will lose any Medallions you may earn during this match.";
         }
         §&K§.instance.§+Y§.show(_loc2_);
      }
      
      private function §,?§(param1:Event) : void
      {
         var _loc2_:String = null;
         §&K§.instance.§+Y§.hide();
         if(this.§]+§ == null)
         {
            this.§]+§ = MyNK.ey.user.id;
         }
         if(this.§]+§ != MyNK.ey.user.id)
         {
            _loc2_ = "Please login to the same account you were using before, to use this account please refresh the game page in your browser.";
            §&K§.instance.§+Y§.show(_loc2_);
            instance.profila.allowSave(false);
         }
         else
         {
            if(§10§.instance.isConnected() == false)
            {
               §&K§.instance.§#<§.§=+§(null);
            }
            instance.profila.allowSave(true);
         }
      }
      
      private function showFailOptions(param1:Event) : void
      {
         §&K§.instance.§26§.show({
            "msg":"Could not connect to NinjaKiwi\'s profile server please refresh your game and try again.",
            "showBtn":false
         });
      }
      
      private function §`R§(param1:Event) : void
      {
         if(MyNK.ey.user.data.stuff is String)
         {
            instance.profila.load(String(MyNK.ey.user.data.stuff));
         }
         else
         {
            instance.profila.resetDefault();
         }
         if(MyNK.ey.user.isLoggedIn())
         {
            instance.profila.medallions = MyNK.ey.user.currencyBalance;
         }
      }
      
      private function §&O§(param1:ThrottleEvent) : void
      {
         switch(param1.state)
         {
            case ThrottleType.THROTTLE:
               this.§=I§ = param1.targetFrameRate;
               if(this.§=I§ < 1)
               {
                  this.§=I§ = 1;
               }
               if(this.§=I§ > 30)
               {
                  this.§=I§ = 30;
               }
               break;
            case ThrottleType.RESUME:
               this.§=I§ = 30;
               break;
            case ThrottleType.PAUSE:
               this.§=I§ = 4;
         }
      }
      
      public function frame(param1:Event) : void
      {
         var _loc2_:Number = 1 / this.§=I§;
         if(this.§"0§.§^@§)
         {
            this.§@X§.fillRect(this.§@X§.rect,0);
            this.§>7§.fillRect(this.§>7§.rect,0);
            this.§"0§.process(_loc2_);
            this.§"0§.§78§(this.§@X§,this.§>7§);
         }
         §&K§.instance.process(_loc2_);
         instance.profila.process(_loc2_);
      }
      
      public function §-U§(param1:String) : Boolean
      {
         return true;
      }
      
      private function itemBoughtNow(param1:*) : void
      {
         var _loc4_:int = 0;
         if(param1 == null)
         {
            return;
         }
         var _loc2_:Object = param1.payload;
         var _loc3_:int = 0;
         while(_loc3_ < this.§0J§.§'K§.length)
         {
            if(this.§0J§.§'K§[_loc3_].§7H§ == _loc2_.id || this.§0J§.§'K§[_loc3_].§^>§ == _loc2_.id)
            {
               _loc4_ = 0;
               while(_loc4_ < _loc2_.quantity)
               {
                  this.profila.applyPurchasedItem(this.§0J§.§'K§[_loc3_].id);
                  _loc4_++;
               }
               return;
            }
            _loc3_++;
         }
      }
      
      private function §@6§(param1:*) : void
      {
         var _loc4_:int = 0;
         if(param1 == null)
         {
            return;
         }
         var _loc2_:Object = param1.payload;
         var _loc3_:int = 0;
         while(_loc3_ < this.§0J§.§'K§.length)
         {
            if(this.§0J§.§'K§[_loc3_].§7H§ == _loc2_.id || this.§0J§.§'K§[_loc3_].§^>§ == _loc2_.id)
            {
               _loc4_ = 0;
               while(_loc4_ < _loc2_.quantity)
               {
                  this.profila.applyAPrevPurchasedItem(this.§0J§.§'K§[_loc3_].id);
                  _loc4_++;
               }
               return;
            }
            _loc3_++;
         }
      }
      
      public function §8'§(param1:int) : void
      {
         var itemID:int = param1;
         NK_Gateway(MyNK.ey).callServer("user.buy_items",function(param1:Object):void
         {
            var _loc2_:Object = null;
            if(param1 is Array)
            {
               for each(_loc2_ in param1)
               {
                  itemBoughtNow(new NKEvent(Msg.NEW_ITEM,{
                     "id":_loc2_.id,
                     "quantity":_loc2_.quantity
                  }));
               }
            }
         },MyNK.ey.user.name,ArgumentPlaceholder.USER_TOKEN,[[itemID,1]],ArgumentPlaceholder.USER_ID);
      }
      
      public function §&G§(param1:Function) : void
      {
         var callBack:Function = param1;
         NK_Gateway(MyNK.ey).callServer("user.get_avatar",function(param1:Object):void
         {
            var _loc2_:String = null;
            if(param1 != null && "avatar" in param1)
            {
               _loc2_ = "https://avatars.ninjakiwi.com/mega/" + param1["avatar"];
               callBack(_loc2_);
            }
         },ArgumentPlaceholder.USER_ID,ArgumentPlaceholder.USER_TOKEN);
      }
      
      private function §5L§(param1:String) : void
      {
         §&K§.instance.§26§.show({
            "msg":param1,
            "showBtn":true
         });
      }
      
      private function §&=§(param1:KeyboardEvent) : void
      {
      }
   }
}

