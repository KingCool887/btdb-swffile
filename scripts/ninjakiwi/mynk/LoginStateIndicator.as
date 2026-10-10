package ninjakiwi.mynk
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import ninjakiwi.mynk.net.LoginState;
   import ninjakiwi.state.State;
   
   public class LoginStateIndicator extends MovieClip
   {
      
      private var clip:MovieClip;
      
      private var connectButton:MovieClip;
      
      private var closeButton:MovieClip;
      
      public function LoginStateIndicator()
      {
         super();
         this.clip = new Indicator_Img();
         addChild(this.clip);
         this.connectButton = this.clip.connectFail_mc.inner_mc.connectButton_mc;
         this.closeButton = this.clip.connectFail_mc.inner_mc.closeButton_mc;
         this.connectButton.buttonMode = true;
         this.closeButton.buttonMode = true;
         this.closeButton.addEventListener(MouseEvent.CLICK,this.hide);
      }
      
      public function watchState(param1:LoginState) : void
      {
         param1.CONNECTING.addEventListener(State.ENTER,this.connecting);
         param1.CONNECTED.addEventListener(State.ENTER,this.connected);
         param1.FAILED.addEventListener(State.ENTER,this.connectError);
      }
      
      public function get retryButton() : MovieClip
      {
         return this.connectButton;
      }
      
      private function hide(param1:MouseEvent) : void
      {
         visible = false;
      }
      
      private function indicate(param1:String) : void
      {
         var _loc3_:MovieClip = null;
         visible = true;
         var _loc2_:* = int(this.clip.numChildren - 1);
         while(_loc2_ >= 0)
         {
            _loc3_ = this.clip.getChildAt(_loc2_) as MovieClip;
            if(_loc3_ != null)
            {
               if(_loc3_.name == param1)
               {
                  _loc3_.visible = true;
                  _loc3_.gotoAndPlay(1);
               }
               else
               {
                  _loc3_.visible = false;
                  _loc3_.gotoAndStop(1);
               }
            }
            _loc2_--;
         }
      }
      
      private function connecting(param1:Event) : void
      {
         this.indicate("connecting_mc");
      }
      
      private function connected(param1:Event) : void
      {
         this.indicate(null);
      }
      
      private function connectError(param1:Event) : void
      {
         this.indicate("connectFail_mc");
      }
   }
}

