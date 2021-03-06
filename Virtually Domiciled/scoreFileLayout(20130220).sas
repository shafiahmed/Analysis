  
        data _null_;
          set &dsn.;
            file "\\pmasas02\data\mt_clv\scoreDevelopment\rerun_201212\scoreFile_20130220.txt" lrecl=495;
            
            put @1   hhidentifier      1-15 
                @16  mmaScore          16-25                /*  MMA Score Value */
                @26  securityScore     26-35                /* Securities Score Value */
                @36  instLoanScore     36-45                /* Installment Loan Score Value */
               
                @46  mmDeltaCondEv_Branch    f10.2          /* Channel Adjusted CLV - MMA/Branch */
                @61  mmDeltaCondEv_online    f10.2          /* Channel Adjusted CLV - MMA/Online */
                @76  mmDeltaCondEv_phone     f10.2          /* Channel Adjusted CLV - MMA/Phone */
                @91  mmDeltaCondEv_atm       f10.2          /* Channel Adjusted CLV - MMA/ATM */
                @106 mmDeltaCondEv_mobile    f10.2          /* Channel Adjusted CLV - MMA/Mobile */
                
                @121 secDeltaCondEv_Branch   f10.2          /* Channel Adjusted CLV - Securities/Branch */
                @136 secDeltaCondEv_online   f10.2          /* Channel Adjusted CLV - Securities/Online */
                @151 secDeltaCondEv_phone    f10.2          /* Channel Adjusted CLV - Securities/Phone */
                @166 secDeltaCondEv_atm      f10.2          /* Channel Adjusted CLV - Securities/ATM */
                @181 secDeltaCondEv_mobile   f10.2          /* Channel Adjusted CLV - Securities/Mobile */
                
                @196 ilnDeltaCondEv_Branch   f10.2          /* Channel Adjusted CLV - Installment Loan/Branch */
                @211 ilnDeltaCondEv_online   f10.2          /* Channel Adjusted CLV - Installment Loan/Online */
                @226 ilnDeltaCondEv_phone    f10.2          /* Channel Adjusted CLV - Installment Loan/Phone */
                @241 ilnDeltaCondEv_atm      f10.2          /* Channel Adjusted CLV - Installment Loan/ATM */
                @256 ilnDeltaCondEv_mobile   f10.2          /* Channel Adjusted CLV - Installment Loan/Mobile */
                
                @271 mmCondResp_Branch       f8.5           /* Channel Adjusted Response Rate - MMA/Branch */
                @286 mmCondResp_online       f8.5           /* Channel Adjusted Response Rate - MMA/Online */
                @301 mmCondResp_phone        f8.5           /* Channel Adjusted Response Rate - MMA/Phone */
                @316 mmCondResp_atm          f8.5           /* Channel Adjusted Response Rate - MMA/ATM */
                @331 mmCondResp_mobile       f8.5           /* Channel Adjusted Response Rate - MMA/Mobile */
                                        
                @346 secCondResp_Branch      f8.5           /* Channel Adjusted Response Rate - Securities/Branch */
                @361 secCondResp_online      f8.5           /* Channel Adjusted Response Rate - Securities/Online */
                @376 secCondResp_phone       f8.5           /* Channel Adjusted Response Rate - Securities/Phone */
                @391 secCondResp_atm         f8.5           /* Channel Adjusted Response Rate - Securities/ATM */
                @406 secCondResp_mobile      f8.5           /* Channel Adjusted Response Rate - Securities/Mobile */
                                        
                @421 ilnCondResp_Branch      f8.5           /* Channel Adjusted Response Rate - Installment Loan/Branch */
                @436 ilnCondResp_online      f8.5           /* Channel Adjusted Response Rate - Installment Loan/Online */
                @451 ilnCondResp_phone       f8.5           /* Channel Adjusted Response Rate - Installment Loan/Phone */
                @466 ilnCondResp_atm         f8.5           /* Channel Adjusted Response Rate - Installment Loan/ATM */
                @481 ilnCondResp_mobile      f8.5           /* Channel Adjusted Response Rate - Installment Loan/Mobile */
                ;
                
            
       
        
        
        
    