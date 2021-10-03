package com.sulake.core.communication.handshake
{
   import com.hurlant.math.BigInteger;
   import com.sulake.core.utils.ErrorReportStorage;
   
   public class DiffieHellman implements IKeyExchange
   {
       
      
      private var var_1362:BigInteger;
      
      private var var_677:BigInteger;
      
      private var var_1587:BigInteger;
      
      private var var_1588:BigInteger;
      
      private var var_2255:BigInteger;
      
      private var var_1839:BigInteger;
      
      public function DiffieHellman(param1:BigInteger, param2:BigInteger)
      {
         super();
         var_1362 = param1;
         var_1587 = param2;
      }
      
      public function getSharedKey(param1:uint = 16) : String
      {
         return var_2255.toRadix(param1);
      }
      
      public function generateSharedKey(param1:String, param2:uint = 16) : String
      {
         var_1588 = new BigInteger();
         var_1588.fromRadix(param1,param2);
         var_2255 = var_1588.modPow(var_677,var_1362);
         return getSharedKey(param2);
      }
      
      public function getPublicKey(param1:uint = 16) : String
      {
         return var_1839.toRadix(param1);
      }
      
      public function init(param1:String, param2:uint = 16) : Boolean
      {
         ErrorReportStorage.addDebugData("DiffieHellman","Prime: " + var_1362.toString() + ",generator: " + var_1587.toString() + ",secret: " + param1);
         var_677 = new BigInteger();
         var_677.fromRadix(param1,param2);
         var_1839 = var_1587.modPow(var_677,var_1362);
         return true;
      }
   }
}
