package display.ui
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.text.TextFieldAutoSize;
   import flash.utils.Timer;
   
   public class Tooltip
   {
      
      public var mc:MovieClip = null;
      
      public var vis:Boolean = false;
      
      public var waiting:Boolean = true;
      
      public var displayTimer:Timer = new Timer(0.05,1);
      
      public var toTooltip:String = "";
      
      public function Tooltip(param1:MovieClip)
      {
         super();
         this.mc = param1;
         param1.mouseEnabled = false;
         param1.mouseChildren = false;
         param1.addEventListener(Event.ENTER_FRAME,this.process);
         §?V§.instance.addEventListener(MouseEvent.MOUSE_MOVE,this.move);
         this.displayTimer.addEventListener(TimerEvent.TIMER,this.waitOver);
         param1.label.autoSize = TextFieldAutoSize.LEFT;
         param1.alpha = 0;
      }
      
      public function waitOver(param1:Event) : void
      {
         this.mc.parent.setChildIndex(this.mc,this.mc.parent.numChildren - 1);
         this.waiting = false;
         this.mc.label.htmlText = "<b>" + this.toTooltip + "</b>";
         this.mc.bg.width = this.mc.label.textWidth + 5 + this.mc.label.x * 2;
         this.mc.bg.height = this.mc.label.textHeight + 5 + this.mc.label.y * 2;
         this.mc.x = §?V§.instance.mouseX - this.mc.bg.width / 2;
         this.mc.y = §?V§.instance.mouseY - this.mc.bg.height / 2;
         if(this.mc.y + this.mc.bg.height > §?V§.§0U§.bottom - 5)
         {
            this.mc.y = §?V§.§0U§.bottom - 5 - this.mc.bg.height;
         }
         if(this.mc.x + this.mc.bg.width > §?V§.§0U§.right - 5)
         {
            this.mc.x = §?V§.§0U§.right - 5 - this.mc.bg.width;
         }
         if(this.mc.x + this.mc.bg.width > §?V§.instance.mouseX && this.mc.y + this.mc.bg.height > §?V§.instance.mouseY)
         {
            this.mc.x = §?V§.instance.mouseX - this.mc.bg.width;
            this.mc.y = §?V§.instance.mouseY - this.mc.bg.height;
         }
         if(this.mc.x < 5)
         {
            this.mc.x = 5;
         }
         if(this.mc.y < 25)
         {
            this.mc.y = 25;
         }
      }
      
      public function set tooltip(param1:String) : void
      {
         this.toTooltip = param1;
      }
      
      public function show() : void
      {
         this.waiting = true;
         this.displayTimer.reset();
         this.displayTimer.start();
         this.vis = true;
      }
      
      public function hide() : void
      {
         this.vis = false;
      }
      
      public function process(param1:Event) : void
      {
         if(this.vis && !this.waiting)
         {
            this.mc.alpha += 0.15;
            if(this.mc.alpha > 1)
            {
               this.mc.alpha = 1;
            }
         }
         else
         {
            this.mc.alpha -= 0.15;
            if(this.mc.alpha < 0)
            {
               this.mc.alpha = 0;
            }
         }
      }
      
      protected function move(param1:MouseEvent) : void
      {
         if(this.vis && !this.waiting)
         {
            this.mc.x = §?V§.instance.mouseX - this.mc.bg.width / 2;
            this.mc.y = §?V§.instance.mouseY - this.mc.bg.height / 2;
            if(this.mc.y + this.mc.bg.height > §?V§.§0U§.bottom - 5)
            {
               this.mc.y = §?V§.§0U§.bottom - 5 - this.mc.bg.height;
            }
            if(this.mc.x + this.mc.bg.width > §?V§.§0U§.right - 5)
            {
               this.mc.x = §?V§.§0U§.right - 5 - this.mc.bg.width;
            }
            if(this.mc.x + this.mc.bg.width > §?V§.instance.mouseX && this.mc.y + this.mc.bg.height > §?V§.instance.mouseY)
            {
               this.mc.x = §?V§.instance.mouseX - this.mc.bg.width;
               this.mc.y = §?V§.instance.mouseY - this.mc.bg.height;
            }
            if(this.mc.x < 5)
            {
               this.mc.x = 5;
            }
            if(this.mc.y < 25)
            {
               this.mc.y = 25;
            }
         }
      }
   }
}

