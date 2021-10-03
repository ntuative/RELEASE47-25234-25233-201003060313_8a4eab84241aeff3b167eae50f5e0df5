package com.sulake.habbo.messenger.domain
{
   public class Message
   {
      
      public static const const_636:int = 2;
      
      public static const const_918:int = 6;
      
      public static const const_649:int = 1;
      
      public static const const_655:int = 3;
      
      public static const const_814:int = 4;
      
      public static const const_588:int = 5;
       
      
      private var var_1882:String;
      
      private var var_946:int;
      
      private var var_1883:String;
      
      private var _type:int;
      
      public function Message(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         _type = param1;
         var_946 = param2;
         var_1883 = param3;
         var_1882 = param4;
      }
      
      public function get time() : String
      {
         return var_1882;
      }
      
      public function get senderId() : int
      {
         return var_946;
      }
      
      public function get messageText() : String
      {
         return var_1883;
      }
      
      public function get type() : int
      {
         return _type;
      }
   }
}
