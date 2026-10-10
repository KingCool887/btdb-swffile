package display.ui
{
   import assets.sounds.NonSelect;
   import assets.sounds.Select;
   import flash.events.MouseEvent;
   import sound.§^5§;
   
   public class CheckButton extends Button
   {
      
      protected var checked_:Boolean = false;
      
      public function CheckButton()
      {
         super();
      }
      
      override public function set valid(param1:Boolean) : void
      {
         valid_ = param1;
         over_ = false;
         this.checkState();
      }
      
      public function set checked(param1:Boolean) : void
      {
         this.checked_ = param1;
         this.checkState();
      }
      
      public function get checked() : Boolean
      {
         return this.checked_;
      }
      
      override protected function handleClick(param1:MouseEvent) : void
      {
         if(valid)
         {
            new §^5§(Select).play();
         }
         else
         {
            new §^5§(NonSelect).play();
         }
         if(valid)
         {
            this.checked_ = !this.checked_;
            this.checkState();
         }
         if(valid && click != null)
         {
            click(param1);
         }
      }
      
      override public function handleMouseOver(param1:MouseEvent) : void
      {
         over_ = true;
         this.checkState();
         if(over != null)
         {
            over(param1);
         }
         if(tooltipText)
         {
            §?V§.instance.tooltip.tooltip = tooltipText;
            §?V§.instance.tooltip.show();
         }
      }
      
      override public function handleMouseOut(param1:MouseEvent) : void
      {
         over_ = false;
         this.checkState();
         if(out != null)
         {
            out(param1);
         }
         if(tooltipText)
         {
            §?V§.instance.tooltip.hide();
         }
      }
      
      protected function checkState() : void
      {
         if(!valid)
         {
            if(this.checked_)
            {
               if(currentLabel != "InvalidChecked")
               {
                  gotoAndPlay("InvalidChecked");
               }
            }
            else if(currentLabel != "Invalid")
            {
               gotoAndPlay("Invalid");
            }
            useHandCursor = false;
            buttonMode = false;
         }
         else
         {
            if(over_)
            {
               if(this.checked_)
               {
                  if(currentLabel != "OverChecked")
                  {
                     gotoAndPlay("OverChecked");
                  }
               }
               else if(currentLabel != "Over")
               {
                  gotoAndPlay("Over");
               }
            }
            else if(this.checked_)
            {
               if(currentLabel != "OutChecked")
               {
                  gotoAndPlay("OutChecked");
               }
            }
            else if(currentLabel != "Out")
            {
               gotoAndPlay("Out");
            }
            useHandCursor = true;
            buttonMode = true;
         }
      }
   }
}

