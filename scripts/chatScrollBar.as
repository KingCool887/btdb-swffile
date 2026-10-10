package
{
   import display.ui.ScrollBarVertical;
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol3607")]
   public dynamic class chatScrollBar extends ScrollBarVertical
   {
      
      public var track_mc:MovieClip;
      
      public var up_mc:ScrollChatArrowDown;
      
      public var down_mc:ScrollChatArrowUp;
      
      public var thumb_mc:scrollThumbChat;
      
      public function chatScrollBar()
      {
         super();
      }
   }
}

