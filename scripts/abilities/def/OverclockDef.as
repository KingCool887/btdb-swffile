package abilities.def
{
   import towers.def.TowerDef;
   
   public class OverclockDef extends AbilityDef
   {
      
      public var input:Vector.<TowerDef> = null;
      
      public function OverclockDef(param1:String = null)
      {
         super(param1);
      }
      
      public function Cooldown(param1:Number) : OverclockDef
      {
         cooldown = param1;
         return this;
      }
      
      public function Sound(param1:Class) : OverclockDef
      {
         sound = param1;
         return this;
      }
      
      public function Effect(param1:Class) : OverclockDef
      {
         effect = param1;
         return this;
      }
      
      public function Thumb(param1:Class) : OverclockDef
      {
         thumb = param1;
         return this;
      }
      
      public function AbilityClass(param1:Class) : OverclockDef
      {
         ability = param1;
         return this;
      }
      
      public function Label(param1:String) : OverclockDef
      {
         label = param1;
         return this;
      }
      
      public function Description(param1:String) : OverclockDef
      {
         description = param1;
         return this;
      }
      
      public function Input(param1:Vector.<TowerDef>) : OverclockDef
      {
         input = param1;
         return this;
      }
   }
}

