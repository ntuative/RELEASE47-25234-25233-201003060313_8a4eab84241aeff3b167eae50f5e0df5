package com.sulake.habbo.catalog.purse
{
   public class Purse implements IPurse
   {
       
      
      private var var_1956:int = 0;
      
      private var var_2197:int = 0;
      
      private var var_2183:int = 0;
      
      private var var_1960:int = 0;
      
      public function Purse()
      {
         super();
      }
      
      public function get pixels() : int
      {
         return var_2197;
      }
      
      public function set pixels(param1:int) : void
      {
         var_2197 = param1;
      }
      
      public function set clubDays(param1:int) : void
      {
         var_1956 = param1;
      }
      
      public function get credits() : int
      {
         return var_2183;
      }
      
      public function get clubDays() : int
      {
         return var_1956;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         var_1960 = param1;
      }
      
      public function set credits(param1:int) : void
      {
         var_2183 = param1;
      }
      
      public function get clubPeriods() : int
      {
         return var_1960;
      }
   }
}
