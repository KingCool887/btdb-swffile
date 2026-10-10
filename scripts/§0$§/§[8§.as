package §0$§
{
   import flash.display.MovieClip;
   
   public class §[8§ extends §`A§
   {
      
      public function §[8§()
      {
         super();
      }
      
      override public function §,B§(param1:MovieClip) : void
      {
         super.§,B§(param1);
         mc.ok_btn.click = this.hide;
      }
      
      override public function show(param1:* = null) : void
      {
         if(param1.msg is String)
         {
            mc.message_txt.text = String(param1.msg);
         }
         if(param1.showBtn == true)
         {
            mc.ok_btn.visible = true;
         }
         else
         {
            mc.ok_btn.visible = false;
         }
         super.show(param1);
      }
      
      override public function hide(param1:* = null) : void
      {
         super.hide(param1);
      }
   }
}

