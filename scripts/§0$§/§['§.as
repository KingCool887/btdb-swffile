package §0$§
{
   import flash.display.MovieClip;
   import flash.events.Event;
   
   public class §['§ extends §`A§
   {
      
      private var yesFunction:Function;
      
      private var noFunction:Function;
      
      public function §['§()
      {
         super();
      }
      
      override public function §,B§(param1:MovieClip) : void
      {
         super.§,B§(param1);
         mc.no_btn.click = this.§]%§;
         mc.yes_btn.click = this.§-V§;
      }
      
      override public function show(param1:* = null) : void
      {
         mc.no_btn.valid = true;
         mc.yes_btn.valid = true;
         this.yesFunction = null;
         this.noFunction = null;
         if(param1.yesFunction is Function)
         {
            this.yesFunction = param1.yesFunction;
         }
         if(param1.noFunction is Function)
         {
            this.noFunction = param1.noFunction;
         }
         if(param1.msg is String)
         {
            mc.msg_txt.text = String(param1.msg);
         }
         super.show(param1);
      }
      
      override public function hide(param1:* = null) : void
      {
         this.yesFunction = null;
         this.noFunction = null;
         super.hide(param1);
      }
      
      public function §-V§(param1:Event) : void
      {
         if(this.yesFunction != null)
         {
            this.yesFunction();
         }
      }
      
      public function §]%§(param1:Event) : void
      {
         if(this.noFunction != null)
         {
            this.noFunction();
         }
         else
         {
            this.hide();
         }
      }
      
      public function §&1§() : void
      {
         mc.no_btn.valid = false;
         mc.yes_btn.valid = false;
      }
   }
}

