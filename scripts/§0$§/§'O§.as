package §0$§
{
   import §>@§.§-A§;
   import §>@§.§<<§;
   import flash.display.MovieClip;
   
   public class §'O§ extends §`A§
   {
      
      private var §5Y§:§<<§ = §-A§.§]H§();
      
      public function §'O§()
      {
         super();
      }
      
      override public function §,B§(param1:MovieClip) : void
      {
         super.§,B§(param1);
         §-A§.§;!§.addEventListener(§-A§.§ H§,this.§^V§);
      }
      
      override public function show(param1:* = null) : void
      {
         this.§^V§();
         super.show(param1);
      }
      
      public function §^V§(... rest) : void
      {
         if(this.§5Y§.value != 0)
         {
            return;
         }
         this.§5Y§.value = int(Math.random() * 37813 + 1);
         §?V§.instance.profila.orc.value = int(Math.random() * 37813 + 1);
      }
      
      public function §&3§() : void
      {
      }
      
      override public function hide(param1:* = null) : void
      {
         super.hide(param1);
      }
      
      public function get orc() : int
      {
         return this.§5Y§.value;
      }
      
      public function set orc(param1:int) : void
      {
         this.§5Y§.value = param1;
      }
   }
}

