package com.sulake.habbo.avatar
{
   import com.sulake.habbo.avatar.actions.IActionDefinition;
   import com.sulake.habbo.avatar.structure.figure.IPartColor;
   import flash.geom.ColorTransform;
   
   public class AvatarImagePartContainer
   {
       
      
      private var _frames:Array;
      
      private var var_2083:int;
      
      private var var_2087:String;
      
      private var var_1575:IActionDefinition;
      
      private var var_2084:Boolean;
      
      private var _color:IPartColor;
      
      private var var_2081:String;
      
      private var var_2086:String;
      
      private var var_2082:Boolean;
      
      private var var_2085:ColorTransform;
      
      private var var_2080:int;
      
      public function AvatarImagePartContainer(param1:String, param2:String, param3:int, param4:IPartColor, param5:Array, param6:IActionDefinition, param7:Boolean, param8:int, param9:String = "", param10:Boolean = false, param11:Number = 1)
      {
         super();
         var_2087 = param1;
         var_2081 = param2;
         var_2083 = param3;
         _color = param4;
         _frames = param5;
         var_1575 = param6;
         var_2082 = param7;
         var_2080 = param8;
         var_2086 = param9;
         var_2084 = param10;
         var_2085 = new ColorTransform(1,1,1,param11);
      }
      
      public function get isColorable() : Boolean
      {
         return var_2082;
      }
      
      public function get partType() : String
      {
         return var_2081;
      }
      
      public function getFrameIndex(param1:int) : int
      {
         return 0;
      }
      
      public function get paletteMapId() : int
      {
         return var_2080;
      }
      
      public function get isBlendable() : Boolean
      {
         return var_2084;
      }
      
      public function get color() : IPartColor
      {
         return _color;
      }
      
      public function get partId() : int
      {
         return var_2083;
      }
      
      public function get flippedPartType() : String
      {
         return var_2086;
      }
      
      public function get bodyPartId() : String
      {
         return var_2087;
      }
      
      public function get action() : IActionDefinition
      {
         return var_1575;
      }
      
      public function get blendTransform() : ColorTransform
      {
         return var_2085;
      }
   }
}
