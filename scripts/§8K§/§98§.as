package §8K§
{
   import display.ui.Button;
   import events.LevelEvent;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   
   public class §98§
   {
      
      private var §@@§:Vector.<Button>;
      
      private var container:MovieClip = null;
      
      private var §`4§:MovieClip = null;
      
      private var §#5§:MovieClip = null;
      
      public function §98§()
      {
         super();
      }
      
      public function §,B§(param1:MovieClip) : void
      {
         this.§#5§ = param1;
         this.container = new MovieClip();
         this.§#5§.addChild(this.container);
         this.§`4§ = this.§#5§.bloonMask;
         this.container.mask = this.§`4§;
         this.container.x = this.§`4§.x;
         this.container.y = this.§`4§.y;
         this.§#5§.upBtn.click = this.§3Y§;
         this.§#5§.downBtn.click = this.§+!§;
      }
      
      public function §3I§(param1:Vector.<§ E§>) : void
      {
         §?V§.instance.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.§;§);
         §?V§.instance.§"0§.§-W§.addEventListener(LevelEvent.CASH_CHANGE,this.§13§);
         this.§"P§(param1);
         this.§13§(null);
      }
      
      public function §<E§() : void
      {
         §?V§.instance.stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.§;§);
         §?V§.instance.§"0§.§-W§.removeEventListener(LevelEvent.CASH_CHANGE,this.§13§);
      }
      
      private function §"P§(param1:Vector.<§ E§>) : void
      {
         var towerPicker:§ E§ = null;
         var index:int = 0;
         var button:Button = null;
         var hotKey:String = null;
         var towersInMenu:Vector.<§ E§> = param1;
         while(this.container.numChildren > 0)
         {
            this.container.removeChildAt(0);
         }
         this.§@@§ = new Vector.<Button>();
         for each(towerPicker in towersInMenu)
         {
            index = towersInMenu.indexOf(towerPicker);
            button = new (Class(towerPicker.button))() as Button;
            (button as MovieClip).lock_mc.visible = false;
            this.§@@§.push(button);
            button.y = 0;
            button.x = 49 * index;
            button.extra = {
               "towerPicker":towerPicker,
               "description":towerPicker.tower.description
            };
            hotKey = String.fromCharCode(towerPicker.hotKey).toUpperCase();
            button.tooltip = "<font color=\'#E0CDB6\' face=\'Oetztype\'>" + towerPicker.tower.label + "\n$" + towerPicker.cost + "</font>\n" + towerPicker.tower.description + "\nHotkey: " + hotKey;
            button.click = function(param1:MouseEvent):*
            {
               §?V§.instance.§"0§.§ 2§.§+R§((param1.target as Button).extra.towerPicker);
            };
            this.container.addChild(button);
         }
         if(this.container.width > this.§`4§.width)
         {
            this.§#5§.upBtn.valid = true;
            this.§#5§.downBtn.valid = true;
         }
         else
         {
            this.§#5§.upBtn.valid = false;
            this.§#5§.downBtn.valid = false;
         }
      }
      
      private function §3Y§(param1:Event) : void
      {
         if(this.container.x < this.§`4§.x)
         {
            this.container.x += 49;
            if(this.container.x > this.§`4§.x)
            {
               this.container.x = this.§`4§.x;
            }
         }
      }
      
      private function §+!§(param1:Event) : void
      {
         if(this.container.x + this.container.width > this.§`4§.x + this.§`4§.width)
         {
            this.container.x -= 49;
            if(this.container.x + this.container.width < this.§`4§.x + this.§`4§.width)
            {
               this.container.x = this.§`4§.x + this.§`4§.width - this.container.width;
            }
         }
      }
      
      public function §13§(param1:Event) : void
      {
         var _loc2_:Button = null;
         var _loc3_:§ E§ = null;
         for each(_loc2_ in this.§@@§)
         {
            _loc3_ = _loc2_.extra.towerPicker as § E§;
            if(§?V§.instance.§"0§.§-W§.cash.value < _loc3_.cost)
            {
               _loc2_.valid = false;
            }
            else
            {
               _loc2_.valid = true;
            }
         }
      }
      
      private function §;§(param1:KeyboardEvent) : void
      {
         var _loc2_:Button = null;
         var _loc3_:§ E§ = null;
         if(§?V§.instance.§"0§.§ 2§.§7>§.§>F§)
         {
            return;
         }
         for each(_loc2_ in this.§@@§)
         {
            _loc3_ = _loc2_.extra.towerPicker as § E§;
            if(_loc2_.valid == true && param1.keyCode == _loc3_.hotKey)
            {
               §?V§.instance.§"0§.§ 2§.§+R§(_loc3_);
               break;
            }
         }
      }
      
      public function set x(param1:Number) : void
      {
         this.§#5§.x = param1;
      }
   }
}

