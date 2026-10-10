package §0$§
{
   import §"?§.§2D§;
   import §8K§.§ E§;
   import §>$§.§10§;
   import assets.sound.MusicMain;
   import flash.display.Loader;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.MouseEvent;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   import flash.system.LoaderContext;
   import game.§6$§;
   import game.Balance;
   import ninjakiwi.mynk.MyNK;
   import ninjakiwi.utils.StandardStuff;
   import sound.§%'§;
   
   public class §<'§ extends §`A§
   {
      
      private var §6N§:§%'§;
      
      private var §"8§:URLLoader = null;
      
      private var §`>§:Loader;
      
      public function §<'§()
      {
         super();
      }
      
      override public function §,B§(param1:MovieClip) : void
      {
         super.§,B§(param1);
         trace("MENU_MC: " + param1.name);
         var _i:int = 0;
         while(_i < param1.numChildren)
         {
            var _c:* = param1.getChildAt(_i);
            trace("MENU_CHILD[" + _i + "]: " + _c.name + " (" + _c + ")");
            _i++;
         }
         §%'§.§27§ = false;
         this.§6N§ = new §%'§(MusicMain);
         this.§"1§();
      }
      
      override public function show(param1:* = null) : void
      {
         §&K§.instance.§#<§.show();
         StandardStuff.setClick(mc.quick_match,this.§#,§);
         StandardStuff.setClick(mc.private_match,this.§"Q§);
         StandardStuff.setClick(mc.high_scores,this.§@V§);
         StandardStuff.setClick(mc.towers,this.§7Q§);
         StandardStuff.setClick(mc.store,this.§+$§);
         this.§6N§.play();
         mc.monkey1.hitbox.addEventListener(MouseEvent.ROLL_OVER,this.monkey1Over);
         mc.monkey1.hitbox.addEventListener(MouseEvent.ROLL_OUT,this.monkey1Out);
         mc.monkey2.hitbox.addEventListener(MouseEvent.ROLL_OVER,this.monkey2Over);
         mc.monkey2.hitbox.addEventListener(MouseEvent.ROLL_OUT,this.monkey2Out);
         mc.monkey3.hitbox.addEventListener(MouseEvent.ROLL_OVER,this.monkey3Over);
         mc.monkey3.hitbox.addEventListener(MouseEvent.ROLL_OUT,this.monkey3Out);
         mc.mc_btn.addEventListener(MouseEvent.CLICK,this.§2B§);
         mc.mc_btn.visible = false;
         super.show(param1);
      }
      
      override public function hide(param1:* = null) : void
      {
         mc.monkey1.hitbox.removeEventListener(MouseEvent.ROLL_OVER,this.monkey1Over);
         mc.monkey1.hitbox.removeEventListener(MouseEvent.ROLL_OUT,this.monkey1Out);
         mc.monkey2.hitbox.removeEventListener(MouseEvent.ROLL_OVER,this.monkey2Over);
         mc.monkey2.hitbox.removeEventListener(MouseEvent.ROLL_OUT,this.monkey2Out);
         mc.monkey3.hitbox.removeEventListener(MouseEvent.ROLL_OVER,this.monkey3Over);
         mc.monkey3.hitbox.removeEventListener(MouseEvent.ROLL_OUT,this.monkey3Out);
         mc.mc_btn.removeEventListener(MouseEvent.CLICK,this.§2B§);
         super.hide(param1);
      }
      
      private function §#,§(param1:Event) : void
      {
         if(§?V§.instance.profila.currentEnergy < Balance.instance.ENERGY_COST_PER_GAME.value)
         {
            §&K§.instance.§>1§.show({
               "yesFunction":this.§!J§,
               "msg":"NOT ENOUGH BATTLE ENERGY!\nYou need " + Balance.instance.ENERGY_COST_PER_GAME.value + " Battle Energy to play.\nPurchase more Battle Energy at the Shop?"
            });
         }
         else
         {
            §&K§.instance.§^G§.show();
         }
      }
      
      private function §"Q§(param1:Event) : void
      {
         §&K§.instance.§3E§.show();
      }
      
      private function §@V§(param1:Event) : void
      {
         MyNK.ey.user.showLeaderboard(305);
      }
      
      private function §7Q§(param1:Event) : void
      {
         §&K§.instance.§0?§.show();
      }
      
      private function §+$§(param1:Event) : void
      {
         §&K§.instance.§'2§.show();
      }
      
      private function §!J§() : void
      {
         §&K§.instance.§>1§.hide();
         §&K§.instance.§'2§.show();
      }
      
      private function monkey1Over(param1:Event) : void
      {
         mc.monkey1.gotoAndPlay("on");
      }
      
      private function monkey1Out(param1:Event) : void
      {
         mc.monkey1.gotoAndPlay("off");
      }
      
      private function monkey2Over(param1:Event) : void
      {
         mc.monkey2.gotoAndPlay("on");
      }
      
      private function monkey2Out(param1:Event) : void
      {
         mc.monkey2.gotoAndPlay("off");
      }
      
      private function monkey3Over(param1:Event) : void
      {
         mc.monkey3.gotoAndPlay("on");
      }
      
      private function monkey3Out(param1:Event) : void
      {
         mc.monkey3.gotoAndPlay("off");
      }
      
      public function §5<§(param1:int, param2:int, param3:Boolean) : void
      {
         this.hide();
         §10§.instance.§'Y§(param3);
         §?V§.§00§ = true;
         var _loc4_:Vector.<§ E§> = §?V§.instance.§+>§.towersInMenu;
         §?V§.instance.§"0§.§`E§ = §6$§.§8!§;
         §?V§.instance.§"0§.§3J§(§6$§.§&§,50,_loc4_,§2D§.§<6§[param1],-2 + param2);
         §?V§.instance.§"0§.§-W§.§4>§(1000000);
      }
      
      private function §"1§() : void
      {
         mc.ad_btn.visible = false;
      }
      
      private function §23§(param1:Event) : void
      {
      }
      
      private function §;3§(param1:Event) : void
      {
         var dat:String;
         var siteValues:Array;
         var imageLoc:String;
         var loaderContext:LoaderContext;
         var signLink:String;
         var i:int;
         var values:Array;
         var e:Event;
         trace("AD_LOADER_RAN");
         signLink = null;
         i = 0;
         values = null;
         e = param1;
         this.§"8§.removeEventListener(Event.COMPLETE,this.§;3§);
         this.§"8§.removeEventListener(IOErrorEvent.IO_ERROR,this.§23§);
         dat = e.target.data;
         if(dat == null)
         {
            return;
         }
         dat = dat.split("\r").join("");
         dat = dat.split("\n").join("");
         dat = dat.split("\t").join("");
         dat = dat.split(" ").join("");
         siteValues = dat.split(",");
         imageLoc = null;
         signLink = null;
         if(siteValues.length > 1)
         {
            i = 1;
            while(i < siteValues.length)
            {
               values = siteValues[i].split("*");
               if(§?V§.instance.§-U§(values[0]) == true)
               {
                  imageLoc = values[1];
                  signLink = values[2];
                  break;
               }
               i++;
            }
         }
         if(imageLoc == null)
         {
            return;
         }
         mc.ad_btn.click = function(param1:Event):void
         {
            navigateToURL(new URLRequest(signLink));
         };
         this.§`>§ = new Loader();
         this.§`>§.contentLoaderInfo.addEventListener(Event.COMPLETE,this.§"A§);
         this.§`>§.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,this.§23§);
         loaderContext = new LoaderContext();
         loaderContext.checkPolicyFile = true;
         this.§`>§.load(new URLRequest(imageLoc),loaderContext);
         trace("AD_LOADER_DONE imageLoc=" + imageLoc + " signLink=" + signLink);
      }
      
      private function §"A§(param1:Event) : void
      {
         mc.ad_btn.visible = true;
         this.§`>§.contentLoaderInfo.removeEventListener(Event.COMPLETE,this.§"A§);
         this.§`>§.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR,this.§23§);
         mc.ad_btn.img_cont.addChild(this.§`>§);
      }
      
      private function §2B§(param1:Event) : void
      {
         navigateToURL(new URLRequest("https://newgam.es/merchbtls"));
      }
   }
}

