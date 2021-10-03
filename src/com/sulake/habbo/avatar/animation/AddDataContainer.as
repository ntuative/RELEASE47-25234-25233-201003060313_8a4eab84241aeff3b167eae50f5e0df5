package com.sulake.habbo.avatar.animation
{
   public class AddDataContainer
   {
       
      
      private var var_1384:String;
      
      private var var_1425:String;
      
      private var var_1091:String;
      
      private var var_388:Number = 1;
      
      private var _id:String;
      
      public function AddDataContainer(param1:XML)
      {
         super();
         _id = String(param1.@id);
         var_1384 = String(param1.@align);
         var_1091 = String(param1.@base);
         var_1425 = String(param1.@ink);
         var _loc2_:String = String(param1.@blend);
         if(_loc2_.length > 0)
         {
            var_388 = Number(_loc2_);
            if(var_388 > 1)
            {
               var_388 /= 100;
            }
         }
      }
      
      public function get align() : String
      {
         return var_1384;
      }
      
      public function get ink() : String
      {
         return var_1425;
      }
      
      public function get base() : String
      {
         return var_1091;
      }
      
      public function get isBlended() : Boolean
      {
         return var_388 != 1;
      }
      
      public function get blend() : Number
      {
         return var_388;
      }
      
      public function get id() : String
      {
         return _id;
      }
   }
}
