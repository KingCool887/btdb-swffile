package
{
   import display.ui.ScrollBarVertical;
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol3186")]
   public dynamic class scrollBar extends ScrollBarVertical
   {
      
      public var track_mc:MovieClip;
      
      public var up_mc:nextArrow;
      
      public var down_mc:prevArrow;
      
      public var thumb_mc:scrollY;
      
      public function scrollBar()
      {
         super();
      }
   }
}

