package display.ui
{
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public dynamic class ScrollBarVertical extends MovieClip
   {
      
      public static const SCROLL_EVENT:String = "SCROLL_EVENT";
      
      public var up:DisplayObject;
      
      public var down:DisplayObject;
      
      public var thumb:DisplayObject;
      
      public var track:DisplayObject;
      
      private var position:Number;
      
      private var scroll_amount:Number;
      
      private var up_down:Boolean;
      
      private var down_down:Boolean;
      
      private var thumb_down:Boolean;
      
      private var thumb_down_pos:Number;
      
      private var stage_mouse_pos:Number;
      
      private var has_focus:Boolean;
      
      private var container_perc:Number;
      
      private var § 3§:Number;
      
      private var list:DisplayObject;
      
      private var container:DisplayObject;
      
      public function ScrollBarVertical()
      {
         super();
         this.position = 0;
         this.scroll_amount = 0.033;
         this.§ 3§ = 20;
         this.up_down = false;
         this.down_down = false;
         this.thumb_down = false;
         this.thumb_down_pos = 0;
         this.has_focus = false;
         this.addEventListener(Event.ADDED_TO_STAGE,this.AddedToStage);
      }
      
      public function SetScrollableObject(param1:DisplayObject, param2:DisplayObject) : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         this.list = param1;
         this.container = param2;
         if(this.list == null || this.container == null)
         {
            this.list = null;
            this.container = null;
         }
         else if(stage)
         {
            _loc3_ = this.container.getBounds(stage).top;
            _loc4_ = this.container.getBounds(stage).bottom - this.trueHeight(this.list);
            _loc5_ = this.list.getBounds(stage).top;
            if(_loc5_ < _loc4_)
            {
               _loc5_ = _loc4_;
            }
            else if(_loc5_ > _loc3_)
            {
               _loc5_ = _loc3_;
            }
            this.position = (_loc5_ - _loc3_) / (_loc4_ - _loc3_);
            this.CalcThumbSize();
            this.MoveList();
            this.PositionThumb();
         }
      }
      
      public function SetScrollSpeed(param1:Number) : void
      {
         if(stage)
         {
            this.scroll_amount = param1 / stage.frameRate;
         }
         else
         {
            this.scroll_amount = param1 / 30;
         }
      }
      
      public function SetPosition(param1:Number) : void
      {
         this.position = param1;
         if(stage)
         {
            this.MoveList();
            this.PositionThumb();
         }
         dispatchEvent(new Event(SCROLL_EVENT));
      }
      
      public function GetPosition() : Number
      {
         return this.position;
      }
      
      public function §1A§(param1:Number) : void
      {
         this.§ 3§ = param1;
      }
      
      private function AddedToStage(param1:Event) : void
      {
         this.track = this.track_mc;
         this.thumb = this.thumb_mc;
         this.up = this.up_mc;
         this.down = this.down_mc;
         this.container_perc = this.§6U§(this.thumb) / this.§6U§(this.track);
         this.addEventListener(Event.ENTER_FRAME,this.Update);
         this.CalcThumbSize();
         this.MoveList();
         this.PositionThumb();
         this.up.addEventListener(MouseEvent.MOUSE_DOWN,this.UpDown,false,100000);
         this.up.addEventListener(MouseEvent.MOUSE_UP,this.UpUp,false,100000);
         this.up.addEventListener(MouseEvent.MOUSE_OUT,this.UpUp,false,100000);
         this.down.addEventListener(MouseEvent.MOUSE_DOWN,this.DownDown,false,100000);
         this.down.addEventListener(MouseEvent.MOUSE_UP,this.DownUp,false,100000);
         this.down.addEventListener(MouseEvent.MOUSE_OUT,this.DownUp,false,100000);
         this.thumb.addEventListener(MouseEvent.MOUSE_DOWN,this.ThumbDown,false,100000);
         this.track.addEventListener(MouseEvent.CLICK,this.TrackClicked,false,100000);
         stage.addEventListener(MouseEvent.MOUSE_UP,this.MouseUp,false,100000);
         stage.addEventListener(MouseEvent.MOUSE_MOVE,this.MouseMove,false,100000);
         stage.addEventListener(MouseEvent.MOUSE_WHEEL,this.MouseWheel,false,100000);
         this.addEventListener(MouseEvent.MOUSE_DOWN,this.ScrollBarDown,false,100001);
      }
      
      private function Update(param1:Event) : void
      {
         if(!this.list)
         {
            if(this.up_down)
            {
               this.position -= this.scroll_amount;
            }
            if(this.down_down)
            {
               this.position += this.scroll_amount;
            }
         }
         else
         {
            if(this.up_down)
            {
               this.position -= this.container_perc * this.scroll_amount;
               if(this.position < 0)
               {
                  this.position = 0;
               }
               this.MoveList();
               this.PositionThumb();
               dispatchEvent(new Event(SCROLL_EVENT));
            }
            if(this.down_down)
            {
               this.position += this.container_perc * this.scroll_amount;
               if(this.position > 1)
               {
                  this.position = 1;
               }
               this.MoveList();
               this.PositionThumb();
               dispatchEvent(new Event(SCROLL_EVENT));
            }
         }
      }
      
      private function UpDown(param1:MouseEvent) : void
      {
         this.up_down = true;
         this.has_focus = true;
      }
      
      private function UpUp(param1:MouseEvent) : void
      {
         this.up_down = false;
      }
      
      private function DownDown(param1:MouseEvent) : void
      {
         this.down_down = true;
         this.has_focus = true;
      }
      
      private function DownUp(param1:MouseEvent) : void
      {
         this.down_down = false;
      }
      
      private function ThumbDown(param1:MouseEvent) : void
      {
         this.thumb_down = true;
         this.thumb_down_pos = this.thumb.y;
         this.stage_mouse_pos = stage.mouseY;
         this.has_focus = true;
      }
      
      private function TrackClicked(param1:MouseEvent) : void
      {
         if(this.mouseY < this.thumb.getBounds(this).top)
         {
            this.position -= this.container_perc;
            if(this.position < 0)
            {
               this.position = 0;
            }
            this.MoveList();
            this.PositionThumb();
            dispatchEvent(new Event(SCROLL_EVENT));
         }
         else if(this.mouseY > this.thumb.getBounds(this).bottom)
         {
            this.position += this.container_perc;
            if(this.position > 1)
            {
               this.position = 1;
            }
            this.MoveList();
            this.PositionThumb();
            dispatchEvent(new Event(SCROLL_EVENT));
         }
      }
      
      private function MouseUp(param1:MouseEvent) : void
      {
         this.thumb_down = false;
      }
      
      private function MouseMove(param1:MouseEvent) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Rectangle = null;
         var _loc4_:Rectangle = null;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         if(this.thumb_down && this.container_perc < 1)
         {
            _loc2_ = stage.mouseY - this.stage_mouse_pos;
            this.thumb.y = this.thumb_down_pos + _loc2_;
            _loc3_ = this.thumb.getBounds(this);
            _loc4_ = this.track.getBounds(this);
            if(_loc3_.top < _loc4_.top)
            {
               this.thumb.y += _loc4_.top - _loc3_.top;
            }
            if(_loc3_.bottom > _loc4_.bottom)
            {
               this.thumb.y += _loc4_.bottom - _loc3_.bottom;
            }
            _loc5_ = this.§6U§(this.track) - this.§6U§(this.thumb);
            _loc6_ = this.thumb.getBounds(this).top - _loc4_.top;
            this.position = _loc6_ / _loc5_;
            this.MoveList();
            dispatchEvent(new Event(SCROLL_EVENT));
         }
      }
      
      private function MouseWheel(param1:MouseEvent) : void
      {
         if(this.has_focus)
         {
            this.position -= param1.delta * this.container_perc * this.scroll_amount;
            if(this.position > 1)
            {
               this.position = 1;
            }
            else if(this.position < 0)
            {
               this.position = 0;
            }
            this.MoveList();
            this.PositionThumb();
            dispatchEvent(new Event(SCROLL_EVENT));
         }
      }
      
      private function ScrollBarDown(param1:MouseEvent) : void
      {
         this.has_focus = true;
      }
      
      private function MoveList() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         if(this.list)
         {
            _loc1_ = this.container.getBounds(stage).top;
            _loc2_ = this.container.getBounds(stage).bottom - this.trueHeight(this.list);
            _loc3_ = _loc1_ + (_loc2_ - _loc1_) * this.position;
            this.list.y = this.list.parent.globalToLocal(new Point(0,_loc3_)).y - this.list.getBounds(this.list).top;
         }
      }
      
      private function CalcThumbSize() : void
      {
         if(this.list)
         {
            this.container_perc = this.trueHeight(this.container) / this.trueHeight(this.list);
            if(this.container_perc <= 1)
            {
               this.thumb.height = this.§6U§(this.track) * this.container_perc;
               if(this.thumb.height < this.§ 3§)
               {
                  this.thumb.height = this.§ 3§;
               }
            }
            else
            {
               this.thumb.height = this.§6U§(this.track);
            }
         }
      }
      
      private function PositionThumb() : void
      {
         var _loc1_:Number = (this.§6U§(this.track) - this.§6U§(this.thumb)) * this.position;
         var _loc2_:Number = this.thumb.y - this.thumb.getBounds(this).top;
         this.thumb.y = this.track.getBounds(this).top + _loc1_ + _loc2_;
      }
      
      private function §6U§(param1:DisplayObject) : Number
      {
         return param1.getBounds(this).bottom - param1.getBounds(this).top;
      }
      
      private function trueHeight(param1:DisplayObject) : Number
      {
         return param1.getBounds(stage).bottom - param1.getBounds(stage).top;
      }
   }
}

