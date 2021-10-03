package com.sulake.habbo.help.help.data
{
   public class FaqItem
   {
       
      
      private var var_1220:int;
      
      private var var_1221:String;
      
      private var var_1724:String;
      
      private var _index:int;
      
      private var var_1725:Boolean = false;
      
      private var _category:FaqCategory;
      
      public function FaqItem(param1:int, param2:String, param3:int, param4:FaqCategory)
      {
         super();
         var_1220 = param1;
         var_1724 = param2;
         _index = param3;
         _category = param4;
      }
      
      public function get answerText() : String
      {
         return var_1221;
      }
      
      public function get questionId() : int
      {
         return var_1220;
      }
      
      public function get questionText() : String
      {
         return var_1724;
      }
      
      public function set answerText(param1:String) : void
      {
         var_1221 = param1;
         var_1725 = true;
      }
      
      public function get hasAnswer() : Boolean
      {
         return var_1725;
      }
      
      public function get category() : FaqCategory
      {
         return _category;
      }
      
      public function get index() : int
      {
         return _index;
      }
   }
}
