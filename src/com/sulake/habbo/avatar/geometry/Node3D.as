package com.sulake.habbo.avatar.geometry
{
   public class Node3D
   {
       
      
      private var var_1123:Vector3D;
      
      private var var_615:Vector3D;
      
      public function Node3D(param1:Number, param2:Number, param3:Number)
      {
         var_1123 = new Vector3D();
         super();
         var_615 = new Vector3D(param1,param2,param3);
      }
      
      public function get transformedLocation() : Vector3D
      {
         return var_1123;
      }
      
      public function get location() : Vector3D
      {
         return var_615;
      }
      
      public function applyTransform(param1:Matrix4x4) : void
      {
         var_1123 = param1.vectorMultiplication(var_615);
      }
   }
}
