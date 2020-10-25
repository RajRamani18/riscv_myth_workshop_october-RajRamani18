\m4_TLV_version 1d: tl-x.org
\SV

   // =========================================
   // Welcome!  Try the tutorials via the menu.
   // =========================================

   // Default Makerchip TL-Verilog Code Template
   
   // Macro providing required top-level module definition, random
   // stimulus support, and Verilator config.
   m4_makerchip_module   // (Expanded in Nav-TLV pane.)
\TLV
   |calc
      @0
         $reset = *reset;
      @1
         $valid = $reset ? 0 : >>1$valid + 1;
         $valid_or_reset = $valid || $reset;
      ?$valid_or_reset
         @1
            $val1[31:0] = >>2$out[31:0];
            $val2[31:0] = $rand2[3:0];
            $sum[31:0] = $val1[31:0] + $val2[31:0];
            $diff[31:0] = $val1[31:0] - $val2[31:0];
            $prod[31:0] = $val1[31:0] * $val2[31:0];
            $quot[31:0] = $val1[31:0] / $val2[31:0];

         @2
            $out[31:0] = $reset ? 32'b0 :
                         ($op[2:0] == 3'b000) ? $sum[31:0] :
                         ($op[2:0] == 3'b001) ? $diff[31:0] :
                         ($op[2:0] == 3'b010) ? $prod[31:0] :
                         ($op[2:0] == 3'b011) ? $quot[31:0] :
                         ($op[2:0] == 3'b100) ? >>2$mem[31:0] : $out[31:0];
            
            $mem[31:0] = $reset ? 32'b0 :
                         ($op[2:0] == 3'b101) ? >>2$mem[31:0] :
                         ($op[2:0] == 3'b110) ? >>2$out[31:0] : $mem[31:0];
            
   //

   // Assert these to end simulation (before Makerchip cycle limit).
   *passed = *cyc_cnt > 40;
   *failed = 1'b0;
\SV
   endmodule
