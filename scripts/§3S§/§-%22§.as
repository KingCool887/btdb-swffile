package §3S§
{
   import §8K§.§!<§;
   import assets.effects.Select;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import game.§6$§;
   import state.§01§;
   import state.§9M§;
   import state.State;
   import towers.Tower;
   
   public class §-"§ extends §"I§
   {
      
      private var §`T§:Tower = null;
      
      private var §=!§:MovieClip = new Select();
      
      public var §54§:§01§ = new §01§();
      
      private var §"0§:§6$§;
      
      public function §-"§(param1:§!<§)
      {
         this.§"0§ = §?V§.instance.§"0§;
         this.§54§.§^W§(param1.§@!§,null);
         super(param1);
      }
      
      override public function enter(param1:§9M§) : void
      {
         § 2§.mc.bottomPannel.towerSelected.visible = false;
         §?V§.instance.stage.addEventListener(MouseEvent.MOUSE_MOVE,this.§-%§);
         §?V§.instance.stage.addEventListener(MouseEvent.MOUSE_DOWN,this.click);
         §?V§.instance.stage.addEventListener(MouseEvent.MOUSE_UP,this.up);
      }
      
      override public function message(param1:§9M§) : State
      {
         if(§<Y§(param1).type == §<Y§.§`J§)
         {
            return § 2§.§-I§;
         }
         this.§54§.message(param1);
         return null;
      }
      
      override public function exit() : void
      {
         §?V§.instance.stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.§-%§);
         §?V§.instance.stage.removeEventListener(MouseEvent.MOUSE_DOWN,this.click);
         §?V§.instance.stage.removeEventListener(MouseEvent.MOUSE_UP,this.up);
         if(this.§`T§ != null)
         {
            § 2§.§]1§.§%&§(null);
         }
      }
      
      public function up(param1:MouseEvent) : void
      {
      }
      
      public function click(param1:MouseEvent) : void
      {
         var _loc2_:§<Y§ = null;
         if(§ 2§.§"=§() == true)
         {
            if(§ 2§.§;O§)
            {
               § 2§.§&$§();
            }
            else if(this.§`T§ != null)
            {
               _loc2_ = new §<Y§(§<Y§.§ 9§);
               _loc2_.tower = this.§`T§;
               this.§54§.message(_loc2_);
            }
            else
            {
               this.§54§.message(new §<Y§(§<Y§.§3F§));
            }
         }
         else if(§ 2§.§6=§() != true)
         {
            this.§54§.message(new §<Y§(§<Y§.§3F§));
         }
      }
      
      public function §-%§(param1:MouseEvent) : void
      {
         var _loc4_:Tower = null;
         var _loc5_:Number = NaN;
         if(§ 2§.§"=§() == false)
         {
            return;
         }
         if(this.§`T§)
         {
            § 2§.§]1§.§%&§(null);
         }
         var _loc2_:MovieClip = §?V§.instance;
         var _loc3_:Number = 9999999;
         for each(_loc4_ in this.§"0§.§-W§.§?0§)
         {
            if(!(Boolean(§ 2§.§@J§.tower == _loc4_) && Boolean(§ 2§.§@J§.tower.def) && § 2§.§@J§.tower.def.isPlatform))
            {
               _loc5_ = Math.sqrt((_loc2_.mouseX - _loc4_.x) * (_loc2_.mouseX - _loc4_.x) + (_loc2_.mouseY - _loc4_.y) * (_loc2_.mouseY - _loc4_.y));
               if(_loc5_ < _loc3_)
               {
                  _loc3_ = _loc5_;
                  this.§`T§ = _loc4_;
               }
            }
         }
         if(_loc3_ < 50)
         {
            § 2§.§]1§.§%&§(this.§`T§);
         }
         else
         {
            this.§`T§ = null;
         }
      }
   }
}

