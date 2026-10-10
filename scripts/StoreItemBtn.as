package
{
   import display.ui.Button;
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol3127")]
   public dynamic class StoreItemBtn extends Button
   {
      
      public var name_txt:TextField;
      
      public var coinChoose:MovieClip;
      
      public var holder_mc:MovieClip;
      
      public var buyCost_txt:TextField;
      
      public var free_label:MovieClip;
      
      public function StoreItemBtn()
      {
         super();
         addFrameScript(0,this.frame1,5,this.frame6,10,this.frame11);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame6() : *
      {
         stop();
      }
      
      internal function frame11() : *
      {
         stop();
      }
   }
}

