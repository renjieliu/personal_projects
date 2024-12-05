-- rollback 
-- go 

-- Below is to generate a bar code following code 128 standard. 

-- v2 to do - to understand function characters in the barcodes

drop table if exists #txt

select txt = 'PUT_TEXT_HERE' into #txt

drop table if exists #start_end 

select 
starting = 104  -- this is for code_128b , starting with 104, ending with 106. 
, ending = 106
into #start_end


-- Table from https://en.wikipedia.org/wiki/Code_128

drop table if exists #code_mapping 

select dec = '0' , hex = '00' , code_128a = 'space' , code_128b = 'space' , code_128c = '00' , font_position_code_common_uncommon_barcodesoft = '32 or 194 or 207 / 212 / 252' , font_position_latin_1_common_uncommon_barcodesoft = '␣ or Â or Ï / Ô / ü' , pattern = '11011001100' , widths = '212222' 
into #code_mapping 
union all
select dec = '1' , hex = '01' , code_128a = '!' , code_128b = '!' , code_128c = '01' , font_position_code_common_uncommon_barcodesoft = '33' , font_position_latin_1_common_uncommon_barcodesoft = '!' , pattern = '11001101100' , widths = '222122' union all select dec = '2' , hex = '02' , code_128a = '"' , code_128b = '"' , code_128c = '02' , font_position_code_common_uncommon_barcodesoft = '34' , font_position_latin_1_common_uncommon_barcodesoft = '"' , pattern = '11001100110' , widths = '222221' union all select dec = '3' , hex = '03' , code_128a = '#' , code_128b = '#' , code_128c = '03' , font_position_code_common_uncommon_barcodesoft = '35' , font_position_latin_1_common_uncommon_barcodesoft = '#' , pattern = '10010011000' , widths = '121223' union all select dec = '4' , hex = '04' , code_128a = '$' , code_128b = '$' , code_128c = '04' , font_position_code_common_uncommon_barcodesoft = '36' , font_position_latin_1_common_uncommon_barcodesoft = '$' , pattern = '10010001100' , widths = '121322' union all select dec = '5' , hex = '05' , code_128a = '%' , code_128b = '%' , code_128c = '05' , font_position_code_common_uncommon_barcodesoft = '37' , font_position_latin_1_common_uncommon_barcodesoft = '%' , pattern = '10001001100' , widths = '131222' union all select dec = '6' , hex = '06' , code_128a = '&' , code_128b = '&' , code_128c = '06' , font_position_code_common_uncommon_barcodesoft = '38' , font_position_latin_1_common_uncommon_barcodesoft = '&' , pattern = '10011001000' , widths = '122213' union all select dec = '7' , hex = '07' , code_128a = '''' , code_128b = '''' , code_128c = '07' , font_position_code_common_uncommon_barcodesoft = '39' , font_position_latin_1_common_uncommon_barcodesoft = '''' , pattern = '10011000100' , widths = '122312' union all select dec = '8' , hex = '08' , code_128a = '(' , code_128b = '(' , code_128c = '08' , font_position_code_common_uncommon_barcodesoft = '40' , font_position_latin_1_common_uncommon_barcodesoft = '(' , pattern = '10001100100' , widths = '132212' union all select dec = '9' , hex = '09' , code_128a = ')' , code_128b = ')' , code_128c = '09' , font_position_code_common_uncommon_barcodesoft = '41' , font_position_latin_1_common_uncommon_barcodesoft = ')' , pattern = '11001001000' , widths = '221213' union all select dec = '10' , hex = '0a' , code_128a = '*' , code_128b = '*' , code_128c = '10' , font_position_code_common_uncommon_barcodesoft = '42' , font_position_latin_1_common_uncommon_barcodesoft = '*' , pattern = '11001000100' , widths = '221312' union all select dec = '11' , hex = '0b' , code_128a = '+' , code_128b = '+' , code_128c = '11' , font_position_code_common_uncommon_barcodesoft = '43' , font_position_latin_1_common_uncommon_barcodesoft = '+' , pattern = '11000100100' , widths = '231212' union all select dec = '12' , hex = '0c' , code_128a = ',' , code_128b = ',' , code_128c = '12' , font_position_code_common_uncommon_barcodesoft = '44' , font_position_latin_1_common_uncommon_barcodesoft = ',' , pattern = '10110011100' , widths = '112232' union all select dec = '13' , hex = '0d' , code_128a = '-' , code_128b = '-' , code_128c = '13' , font_position_code_common_uncommon_barcodesoft = '45' , font_position_latin_1_common_uncommon_barcodesoft = '-' , pattern = '10011011100' , widths = '122132' union all select dec = '14' , hex = '0e' , code_128a = '.' , code_128b = '.' , code_128c = '14' , font_position_code_common_uncommon_barcodesoft = '46' , font_position_latin_1_common_uncommon_barcodesoft = '.' , pattern = '10011001110' , widths = '122231' union all select dec = '15' , hex = '0f' , code_128a = '/' , code_128b = '/' , code_128c = '15' , font_position_code_common_uncommon_barcodesoft = '47' , font_position_latin_1_common_uncommon_barcodesoft = '/' , pattern = '10111001100' , widths = '113222' union all select dec = '16' , hex = '10' , code_128a = '0' , code_128b = '0' , code_128c = '16' , font_position_code_common_uncommon_barcodesoft = '48' , font_position_latin_1_common_uncommon_barcodesoft = '0' , pattern = '10011101100' , widths = '123122' union all select dec = '17' , hex = '11' , code_128a = '1' , code_128b = '1' , code_128c = '17' , font_position_code_common_uncommon_barcodesoft = '49' , font_position_latin_1_common_uncommon_barcodesoft = '1' , pattern = '10011100110' , widths = '123221' union all select dec = '18' , hex = '12' , code_128a = '2' , code_128b = '2' , code_128c = '18' , font_position_code_common_uncommon_barcodesoft = '50' , font_position_latin_1_common_uncommon_barcodesoft = '2' , pattern = '11001110010' , widths = '223211' union all select dec = '19' , hex = '13' , code_128a = '3' , code_128b = '3' , code_128c = '19' , font_position_code_common_uncommon_barcodesoft = '51' , font_position_latin_1_common_uncommon_barcodesoft = '3' , pattern = '11001011100' , widths = '221132' union all select dec = '20' , hex = '14' , code_128a = '4' , code_128b = '4' , code_128c = '20' , font_position_code_common_uncommon_barcodesoft = '52' , font_position_latin_1_common_uncommon_barcodesoft = '4' , pattern = '11001001110' , widths = '221231' union all select dec = '21' , hex = '15' , code_128a = '5' , code_128b = '5' , code_128c = '21' , font_position_code_common_uncommon_barcodesoft = '53' , font_position_latin_1_common_uncommon_barcodesoft = '5' , pattern = '11011100100' , widths = '213212' union all select dec = '22' , hex = '16' , code_128a = '6' , code_128b = '6' , code_128c = '22' , font_position_code_common_uncommon_barcodesoft = '54' , font_position_latin_1_common_uncommon_barcodesoft = '6' , pattern = '11001110100' , widths = '223112' union all select dec = '23' , hex = '17' , code_128a = '7' , code_128b = '7' , code_128c = '23' , font_position_code_common_uncommon_barcodesoft = '55' , font_position_latin_1_common_uncommon_barcodesoft = '7' , pattern = '11101101110' , widths = '312131' union all select dec = '24' , hex = '18' , code_128a = '8' , code_128b = '8' , code_128c = '24' , font_position_code_common_uncommon_barcodesoft = '56' , font_position_latin_1_common_uncommon_barcodesoft = '8' , pattern = '11101001100' , widths = '311222' union all select dec = '25' , hex = '19' , code_128a = '9' , code_128b = '9' , code_128c = '25' , font_position_code_common_uncommon_barcodesoft = '57' , font_position_latin_1_common_uncommon_barcodesoft = '9' , pattern = '11100101100' , widths = '321122' union all select dec = '26' , hex = '1a' , code_128a = ':' , code_128b = ':' , code_128c = '26' , font_position_code_common_uncommon_barcodesoft = '58' , font_position_latin_1_common_uncommon_barcodesoft = ':' , pattern = '11100100110' , widths = '321221' union all select dec = '27' , hex = '1b' , code_128a = ';' , code_128b = ';' , code_128c = '27' , font_position_code_common_uncommon_barcodesoft = '59' , font_position_latin_1_common_uncommon_barcodesoft = ';' , pattern = '11101100100' , widths = '312212' union all select dec = '28' , hex = '1c' , code_128a = '<' , code_128b = '<' , code_128c = '28' , font_position_code_common_uncommon_barcodesoft = '60' , font_position_latin_1_common_uncommon_barcodesoft = '<' , pattern = '11100110100' , widths = '322112' union all select dec = '29' , hex = '1d' , code_128a = '=' , code_128b = '=' , code_128c = '29' , font_position_code_common_uncommon_barcodesoft = '61' , font_position_latin_1_common_uncommon_barcodesoft = '=' , pattern = '11100110010' , widths = '322211' union all select dec = '30' , hex = '1e' , code_128a = '>' , code_128b = '>' , code_128c = '30' , font_position_code_common_uncommon_barcodesoft = '62' , font_position_latin_1_common_uncommon_barcodesoft = '>' , pattern = '11011011000' , widths = '212123' union all select dec = '31' , hex = '1f' , code_128a = '?' , code_128b = '?' , code_128c = '31' , font_position_code_common_uncommon_barcodesoft = '63' , font_position_latin_1_common_uncommon_barcodesoft = '?' , pattern = '11011000110' , widths = '212321' union all select dec = '32' , hex = '20' , code_128a = '@' , code_128b = '@' , code_128c = '32' , font_position_code_common_uncommon_barcodesoft = '64' , font_position_latin_1_common_uncommon_barcodesoft = '@' , pattern = '11000110110' , widths = '232121' union all select dec = '33' , hex = '21' , code_128a = 'A' , code_128b = 'A' , code_128c = '33' , font_position_code_common_uncommon_barcodesoft = '65' , font_position_latin_1_common_uncommon_barcodesoft = 'A' , pattern = '10100011000' , widths = '111323' union all select dec = '34' , hex = '22' , code_128a = 'B' , code_128b = 'B' , code_128c = '34' , font_position_code_common_uncommon_barcodesoft = '66' , font_position_latin_1_common_uncommon_barcodesoft = 'B' , pattern = '10001011000' , widths = '131123' union all select dec = '35' , hex = '23' , code_128a = 'C' , code_128b = 'C' , code_128c = '35' , font_position_code_common_uncommon_barcodesoft = '67' , font_position_latin_1_common_uncommon_barcodesoft = 'C' , pattern = '10001000110' , widths = '131321' union all select dec = '36' , hex = '24' , code_128a = 'D' , code_128b = 'D' , code_128c = '36' , font_position_code_common_uncommon_barcodesoft = '68' , font_position_latin_1_common_uncommon_barcodesoft = 'D' , pattern = '10110001000' , widths = '112313' union all select dec = '37' , hex = '25' , code_128a = 'E' , code_128b = 'E' , code_128c = '37' , font_position_code_common_uncommon_barcodesoft = '69' , font_position_latin_1_common_uncommon_barcodesoft = 'E' , pattern = '10001101000' , widths = '132113' union all select dec = '38' , hex = '26' , code_128a = 'F' , code_128b = 'F' , code_128c = '38' , font_position_code_common_uncommon_barcodesoft = '70' , font_position_latin_1_common_uncommon_barcodesoft = 'F' , pattern = '10001100010' , widths = '132311' union all select dec = '39' , hex = '27' , code_128a = 'G' , code_128b = 'G' , code_128c = '39' , font_position_code_common_uncommon_barcodesoft = '71' , font_position_latin_1_common_uncommon_barcodesoft = 'G' , pattern = '11010001000' , widths = '211313' union all select dec = '40' , hex = '28' , code_128a = 'H' , code_128b = 'H' , code_128c = '40' , font_position_code_common_uncommon_barcodesoft = '72' , font_position_latin_1_common_uncommon_barcodesoft = 'H' , pattern = '11000101000' , widths = '231113' union all select dec = '41' , hex = '29' , code_128a = 'I' , code_128b = 'I' , code_128c = '41' , font_position_code_common_uncommon_barcodesoft = '73' , font_position_latin_1_common_uncommon_barcodesoft = 'I' , pattern = '11000100010' , widths = '231311' union all select dec = '42' , hex = '2a' , code_128a = 'J' , code_128b = 'J' , code_128c = '42' , font_position_code_common_uncommon_barcodesoft = '74' , font_position_latin_1_common_uncommon_barcodesoft = 'J' , pattern = '10110111000' , widths = '112133' union all select dec = '43' , hex = '2b' , code_128a = 'K' , code_128b = 'K' , code_128c = '43' , font_position_code_common_uncommon_barcodesoft = '75' , font_position_latin_1_common_uncommon_barcodesoft = 'K' , pattern = '10110001110' , widths = '112331' union all select dec = '44' , hex = '2c' , code_128a = 'L' , code_128b = 'L' , code_128c = '44' , font_position_code_common_uncommon_barcodesoft = '76' , font_position_latin_1_common_uncommon_barcodesoft = 'L' , pattern = '10001101110' , widths = '132131' union all select dec = '45' , hex = '2d' , code_128a = 'M' , code_128b = 'M' , code_128c = '45' , font_position_code_common_uncommon_barcodesoft = '77' , font_position_latin_1_common_uncommon_barcodesoft = 'M' , pattern = '10111011000' , widths = '113123' union all select dec = '46' , hex = '2e' , code_128a = 'N' , code_128b = 'N' , code_128c = '46' , font_position_code_common_uncommon_barcodesoft = '78' , font_position_latin_1_common_uncommon_barcodesoft = 'N' , pattern = '10111000110' , widths = '113321' union all select dec = '47' , hex = '2f' , code_128a = 'O' , code_128b = 'O' , code_128c = '47' , font_position_code_common_uncommon_barcodesoft = '79' , font_position_latin_1_common_uncommon_barcodesoft = 'O' , pattern = '10001110110' , widths = '133121' union all select dec = '48' , hex = '30' , code_128a = 'P' , code_128b = 'P' , code_128c = '48' , font_position_code_common_uncommon_barcodesoft = '80' , font_position_latin_1_common_uncommon_barcodesoft = 'P' , pattern = '11101110110' , widths = '313121' union all select dec = '49' , hex = '31' , code_128a = 'Q' , code_128b = 'Q' , code_128c = '49' , font_position_code_common_uncommon_barcodesoft = '81' , font_position_latin_1_common_uncommon_barcodesoft = 'Q' , pattern = '11010001110' , widths = '211331' union all select dec = '50' , hex = '32' , code_128a = 'R' , code_128b = 'R' , code_128c = '50' , font_position_code_common_uncommon_barcodesoft = '82' , font_position_latin_1_common_uncommon_barcodesoft = 'R' , pattern = '11000101110' , widths = '231131' union all select dec = '51' , hex = '33' , code_128a = 'S' , code_128b = 'S' , code_128c = '51' , font_position_code_common_uncommon_barcodesoft = '83' , font_position_latin_1_common_uncommon_barcodesoft = 'S' , pattern = '11011101000' , widths = '213113' union all select dec = '52' , hex = '34' , code_128a = 'T' , code_128b = 'T' , code_128c = '52' , font_position_code_common_uncommon_barcodesoft = '84' , font_position_latin_1_common_uncommon_barcodesoft = 'T' , pattern = '11011100010' , widths = '213311' union all select dec = '53' , hex = '35' , code_128a = 'U' , code_128b = 'U' , code_128c = '53' , font_position_code_common_uncommon_barcodesoft = '85' , font_position_latin_1_common_uncommon_barcodesoft = 'U' , pattern = '11011101110' , widths = '213131' union all select dec = '54' , hex = '36' , code_128a = 'V' , code_128b = 'V' , code_128c = '54' , font_position_code_common_uncommon_barcodesoft = '86' , font_position_latin_1_common_uncommon_barcodesoft = 'V' , pattern = '11101011000' , widths = '311123' union all select dec = '55' , hex = '37' , code_128a = 'W' , code_128b = 'W' , code_128c = '55' , font_position_code_common_uncommon_barcodesoft = '87' , font_position_latin_1_common_uncommon_barcodesoft = 'W' , pattern = '11101000110' , widths = '311321' union all select dec = '56' , hex = '38' , code_128a = 'X' , code_128b = 'X' , code_128c = '56' , font_position_code_common_uncommon_barcodesoft = '88' , font_position_latin_1_common_uncommon_barcodesoft = 'X' , pattern = '11100010110' , widths = '331121' union all select dec = '57' , hex = '39' , code_128a = 'Y' , code_128b = 'Y' , code_128c = '57' , font_position_code_common_uncommon_barcodesoft = '89' , font_position_latin_1_common_uncommon_barcodesoft = 'Y' , pattern = '11101101000' , widths = '312113' union all select dec = '58' , hex = '3a' , code_128a = 'Z' , code_128b = 'Z' , code_128c = '58' , font_position_code_common_uncommon_barcodesoft = '90' , font_position_latin_1_common_uncommon_barcodesoft = 'Z' , pattern = '11101100010' , widths = '312311' union all select dec = '59' , hex = '3b' , code_128a = '[' , code_128b = '[' , code_128c = '59' , font_position_code_common_uncommon_barcodesoft = '91' , font_position_latin_1_common_uncommon_barcodesoft = '[' , pattern = '11100011010' , widths = '332111' union all select dec = '60' , hex = '3c' , code_128a = '\' , code_128b = '\' , code_128c = '60' , font_position_code_common_uncommon_barcodesoft = '92' , font_position_latin_1_common_uncommon_barcodesoft = '\' , pattern = '11101111010' , widths = '314111' union all select dec = '61' , hex = '3d' , code_128a = ']' , code_128b = ']' , code_128c = '61' , font_position_code_common_uncommon_barcodesoft = '93' , font_position_latin_1_common_uncommon_barcodesoft = ']' , pattern = '11001000010' , widths = '221411' union all select dec = '62' , hex = '3e' , code_128a = '^' , code_128b = '^' , code_128c = '62' , font_position_code_common_uncommon_barcodesoft = '94' , font_position_latin_1_common_uncommon_barcodesoft = '^' , pattern = '11110001010' , widths = '431111' union all select dec = '63' , hex = '3f' , code_128a = '_' , code_128b = '_' , code_128c = '63' , font_position_code_common_uncommon_barcodesoft = '95' , font_position_latin_1_common_uncommon_barcodesoft = '_' , pattern = '10100110000' , widths = '111224' union all select dec = '64' , hex = '40' , code_128a = 'NUL' , code_128b = '`' , code_128c = '64' , font_position_code_common_uncommon_barcodesoft = '96' , font_position_latin_1_common_uncommon_barcodesoft = '`' , pattern = '10100001100' , widths = '111422' union all select dec = '65' , hex = '41' , code_128a = 'SOH' , code_128b = 'a' , code_128c = '65' , font_position_code_common_uncommon_barcodesoft = '97' , font_position_latin_1_common_uncommon_barcodesoft = 'a' , pattern = '10010110000' , widths = '121124' union all select dec = '66' , hex = '42' , code_128a = 'STX' , code_128b = 'b' , code_128c = '66' , font_position_code_common_uncommon_barcodesoft = '98' , font_position_latin_1_common_uncommon_barcodesoft = 'b' , pattern = '10010000110' , widths = '121421' union all select dec = '67' , hex = '43' , code_128a = 'ETX' , code_128b = 'c' , code_128c = '67' , font_position_code_common_uncommon_barcodesoft = '99' , font_position_latin_1_common_uncommon_barcodesoft = 'c' , pattern = '10000101100' , widths = '141122' union all select dec = '68' , hex = '44' , code_128a = 'EOT' , code_128b = 'd' , code_128c = '68' , font_position_code_common_uncommon_barcodesoft = '100' , font_position_latin_1_common_uncommon_barcodesoft = 'd' , pattern = '10000100110' , widths = '141221' union all select dec = '69' , hex = '45' , code_128a = 'ENQ' , code_128b = 'e' , code_128c = '69' , font_position_code_common_uncommon_barcodesoft = '101' , font_position_latin_1_common_uncommon_barcodesoft = 'e' , pattern = '10110010000' , widths = '112214' union all select dec = '70' , hex = '46' , code_128a = 'ACK' , code_128b = 'f' , code_128c = '70' , font_position_code_common_uncommon_barcodesoft = '102' , font_position_latin_1_common_uncommon_barcodesoft = 'f' , pattern = '10110000100' , widths = '112412' union all select dec = '71' , hex = '47' , code_128a = 'BEL' , code_128b = 'g' , code_128c = '71' , font_position_code_common_uncommon_barcodesoft = '103' , font_position_latin_1_common_uncommon_barcodesoft = 'g' , pattern = '10011010000' , widths = '122114' union all select dec = '72' , hex = '48' , code_128a = 'BS' , code_128b = 'h' , code_128c = '72' , font_position_code_common_uncommon_barcodesoft = '104' , font_position_latin_1_common_uncommon_barcodesoft = 'h' , pattern = '10011000010' , widths = '122411' union all select dec = '73' , hex = '49' , code_128a = 'HT' , code_128b = 'i' , code_128c = '73' , font_position_code_common_uncommon_barcodesoft = '105' , font_position_latin_1_common_uncommon_barcodesoft = 'i' , pattern = '10000110100' , widths = '142112' union all select dec = '74' , hex = '4a' , code_128a = 'LF' , code_128b = 'j' , code_128c = '74' , font_position_code_common_uncommon_barcodesoft = '106' , font_position_latin_1_common_uncommon_barcodesoft = 'j' , pattern = '10000110010' , widths = '142211' union all select dec = '75' , hex = '4b' , code_128a = 'VT' , code_128b = 'k' , code_128c = '75' , font_position_code_common_uncommon_barcodesoft = '107' , font_position_latin_1_common_uncommon_barcodesoft = 'k' , pattern = '11000010010' , widths = '241211' union all select dec = '76' , hex = '4c' , code_128a = 'FF' , code_128b = 'l' , code_128c = '76' , font_position_code_common_uncommon_barcodesoft = '108' , font_position_latin_1_common_uncommon_barcodesoft = 'l' , pattern = '11001010000' , widths = '221114' union all select dec = '77' , hex = '4d' , code_128a = 'CR' , code_128b = 'm' , code_128c = '77' , font_position_code_common_uncommon_barcodesoft = '109' , font_position_latin_1_common_uncommon_barcodesoft = 'm' , pattern = '11110111010' , widths = '413111' union all select dec = '78' , hex = '4e' , code_128a = 'SO' , code_128b = 'n' , code_128c = '78' , font_position_code_common_uncommon_barcodesoft = '110' , font_position_latin_1_common_uncommon_barcodesoft = 'n' , pattern = '11000010100' , widths = '241112' union all select dec = '79' , hex = '4f' , code_128a = 'SI' , code_128b = 'o' , code_128c = '79' , font_position_code_common_uncommon_barcodesoft = '111' , font_position_latin_1_common_uncommon_barcodesoft = 'o' , pattern = '10001111010' , widths = '134111' union all select dec = '80' , hex = '50' , code_128a = 'DLE' , code_128b = 'p' , code_128c = '80' , font_position_code_common_uncommon_barcodesoft = '112' , font_position_latin_1_common_uncommon_barcodesoft = 'p' , pattern = '10100111100' , widths = '111242' union all select dec = '81' , hex = '51' , code_128a = 'DC1' , code_128b = 'q' , code_128c = '81' , font_position_code_common_uncommon_barcodesoft = '113' , font_position_latin_1_common_uncommon_barcodesoft = 'q' , pattern = '10010111100' , widths = '121142' union all select dec = '82' , hex = '52' , code_128a = 'DC2' , code_128b = 'r' , code_128c = '82' , font_position_code_common_uncommon_barcodesoft = '114' , font_position_latin_1_common_uncommon_barcodesoft = 'r' , pattern = '10010011110' , widths = '121241' union all select dec = '83' , hex = '53' , code_128a = 'DC3' , code_128b = 's' , code_128c = '83' , font_position_code_common_uncommon_barcodesoft = '115' , font_position_latin_1_common_uncommon_barcodesoft = 's' , pattern = '10111100100' , widths = '114212' union all select dec = '84' , hex = '54' , code_128a = 'DC4' , code_128b = 't' , code_128c = '84' , font_position_code_common_uncommon_barcodesoft = '116' , font_position_latin_1_common_uncommon_barcodesoft = 't' , pattern = '10011110100' , widths = '124112' union all select dec = '85' , hex = '55' , code_128a = 'NAK' , code_128b = 'u' , code_128c = '85' , font_position_code_common_uncommon_barcodesoft = '117' , font_position_latin_1_common_uncommon_barcodesoft = 'u' , pattern = '10011110010' , widths = '124211' union all select dec = '86' , hex = '56' , code_128a = 'SYN' , code_128b = 'v' , code_128c = '86' , font_position_code_common_uncommon_barcodesoft = '118' , font_position_latin_1_common_uncommon_barcodesoft = 'v' , pattern = '11110100100' , widths = '411212' union all select dec = '87' , hex = '57' , code_128a = 'ETB' , code_128b = 'w' , code_128c = '87' , font_position_code_common_uncommon_barcodesoft = '119' , font_position_latin_1_common_uncommon_barcodesoft = 'w' , pattern = '11110010100' , widths = '421112' union all select dec = '88' , hex = '58' , code_128a = 'CAN' , code_128b = 'x' , code_128c = '88' , font_position_code_common_uncommon_barcodesoft = '120' , font_position_latin_1_common_uncommon_barcodesoft = 'x' , pattern = '11110010010' , widths = '421211' union all select dec = '89' , hex = '59' , code_128a = 'EM' , code_128b = 'y' , code_128c = '89' , font_position_code_common_uncommon_barcodesoft = '121' , font_position_latin_1_common_uncommon_barcodesoft = 'y' , pattern = '11011011110' , widths = '212141' union all select dec = '90' , hex = '5a' , code_128a = 'SUB' , code_128b = 'z' , code_128c = '90' , font_position_code_common_uncommon_barcodesoft = '122' , font_position_latin_1_common_uncommon_barcodesoft = 'z' , pattern = '11011110110' , widths = '214121' union all select dec = '91' , hex = '5b' , code_128a = 'ESC' , code_128b = '{' , code_128c = '91' , font_position_code_common_uncommon_barcodesoft = '123' , font_position_latin_1_common_uncommon_barcodesoft = '{' , pattern = '11110110110' , widths = '412121' union all select dec = '92' , hex = '5c' , code_128a = 'FS' , code_128b = '|' , code_128c = '92' , font_position_code_common_uncommon_barcodesoft = '124' , font_position_latin_1_common_uncommon_barcodesoft = '|' , pattern = '10101111000' , widths = '111143' union all select dec = '93' , hex = '5d' , code_128a = 'GS' , code_128b = '}' , code_128c = '93' , font_position_code_common_uncommon_barcodesoft = '125' , font_position_latin_1_common_uncommon_barcodesoft = '}' , pattern = '10100011110' , widths = '111341' union all select dec = '94' , hex = '5e' , code_128a = 'RS' , code_128b = '~' , code_128c = '94' , font_position_code_common_uncommon_barcodesoft = '126' , font_position_latin_1_common_uncommon_barcodesoft = '~' , pattern = '10001011110' , widths = '131141' union all select dec = '95' , hex = '5f' , code_128a = 'US' , code_128b = 'DEL' , code_128c = '95' , font_position_code_common_uncommon_barcodesoft = '195 / 200 / 240' , font_position_latin_1_common_uncommon_barcodesoft = 'Ã / È / ð' , pattern = '10111101000' , widths = '114113' union all select dec = '96' , hex = '60' , code_128a = 'FNC 3' , code_128b = 'FNC 3' , code_128c = '96' , font_position_code_common_uncommon_barcodesoft = '196 / 201 / 241' , font_position_latin_1_common_uncommon_barcodesoft = 'Ä / É / ñ' , pattern = '10111100010' , widths = '114311' union all select dec = '97' , hex = '61' , code_128a = 'FNC 2' , code_128b = 'FNC 2' , code_128c = '97' , font_position_code_common_uncommon_barcodesoft = '197 / 202 / 242' , font_position_latin_1_common_uncommon_barcodesoft = 'Å / Ê / ò' , pattern = '11110101000' , widths = '411113' union all select dec = '98' , hex = '62' , code_128a = 'Shift B' , code_128b = 'Shift A' , code_128c = '98' , font_position_code_common_uncommon_barcodesoft = '198 / 203 / 243' , font_position_latin_1_common_uncommon_barcodesoft = 'Æ / Ë / ó' , pattern = '11110100010' , widths = '411311' union all select dec = '99' , hex = '63' , code_128a = 'Code C' , code_128b = 'Code C' , code_128c = '99' , font_position_code_common_uncommon_barcodesoft = '199 / 204 / 244' , font_position_latin_1_common_uncommon_barcodesoft = 'Ç / Ì / ô' , pattern = '10111011110' , widths = '113141' union all select dec = '100' , hex = '64' , code_128a = 'Code B' , code_128b = 'FNC 4' , code_128c = 'Code B' , font_position_code_common_uncommon_barcodesoft = '200 / 205 / 200' , font_position_latin_1_common_uncommon_barcodesoft = 'È / Í / È' , pattern = '10111101110' , widths = '114131' union all select dec = '101' , hex = '65' , code_128a = 'FNC 4' , code_128b = 'Code A' , code_128c = 'Code A' , font_position_code_common_uncommon_barcodesoft = '201 / 206 / 246' , font_position_latin_1_common_uncommon_barcodesoft = 'É / Î / ö' , pattern = '11101011110' , widths = '311141' union all select dec = '102' , hex = '66' , code_128a = 'FNC 1' , code_128b = 'FNC 1' , code_128c = 'FNC 1' , font_position_code_common_uncommon_barcodesoft = '202 / 207 / 247' , font_position_latin_1_common_uncommon_barcodesoft = 'Ê / Ï / ÷' , pattern = '11110101110' , widths = '411131' union all select dec = '103' , hex = '67' , code_128a = 'Start Code A' , code_128b = 'Start Code A' , code_128c = 'Start Code A' , font_position_code_common_uncommon_barcodesoft = '203 / 208 / 248' , font_position_latin_1_common_uncommon_barcodesoft = 'Ë / Ð / ø' , pattern = '11010000100' , widths = '211412' union all select dec = '104' , hex = '68' , code_128a = 'Start Code B' , code_128b = 'Start Code B' , code_128c = 'Start Code B' , font_position_code_common_uncommon_barcodesoft = '204 / 209 / 249' , font_position_latin_1_common_uncommon_barcodesoft = 'Ì / Ñ / ù' , pattern = '11010010000' , widths = '211214' union all select dec = '105' , hex = '69' , code_128a = 'Start Code C' , code_128b = 'Start Code C' , code_128c = 'Start Code C' , font_position_code_common_uncommon_barcodesoft = '205 / 210 / 250' , font_position_latin_1_common_uncommon_barcodesoft = 'Í / Ò / ú' , pattern = '11010011100' , widths = '211232' union all select dec = '106' , hex = '6a' , code_128a = 'Stop' , code_128b = 'Stop' , code_128c = 'Stop' , font_position_code_common_uncommon_barcodesoft = '—' , font_position_latin_1_common_uncommon_barcodesoft = '—' , pattern = '11000111010' , widths = '233111' union all select dec = '—' , hex = '—' , code_128a = 'Reverse Stop' , code_128b = 'Reverse Stop' , code_128c = 'Reverse Stop' , font_position_code_common_uncommon_barcodesoft = '—' , font_position_latin_1_common_uncommon_barcodesoft = '—' , pattern = '11010111000' , widths = '211133' union all select dec = '—' , hex = '—' , code_128a = 'Stop pattern (7 bars/spaces)' , code_128b = 'Stop pattern (7 bars/spaces)' , code_128c = 'Stop pattern (7 bars/spaces)' , font_position_code_common_uncommon_barcodesoft = '206 / 211 / 251' , font_position_latin_1_common_uncommon_barcodesoft = 'Î / Ó / û' , pattern = '1100011101011' , widths = '2331112' 

update #code_mapping set code_128a= ' ' where code_128a = 'space'
update #code_mapping set code_128b= ' ' where code_128b = 'space'



-- select * from #code_mapping 


drop table if exists #brk

; with cte as (
select 
weighting = 1
, cm.dec
, curr = left(txt, 1)
, pattern = cm.pattern
, rem = right(txt, len(txt) - 1 ) 
from #txt u 
left outer join #code_mapping cm 
on ASCII(left(txt, 1)) = ASCII(cm.code_128b) and len(cm.code_128b) <= 1 -- current sql server is case insensitive

union all 

select 
weighting + 1 
, cm.dec
, curr = left(rem, 1)
, pattern = cm.pattern
, rem = right(rem, len(rem) - 1 ) 
from cte c
inner join #code_mapping cm 
on ASCII(left(rem, 1)) = ASCII(cm.code_128b) and len(cm.code_128b) <= 1 -- current sql server is case insensitive, ascii('XYZ') = ascii('X')
where len(rem)>0 
) 
select * into #brk from cte
order by 1 
OPTION(maxrecursion 0)

 
-- select * from #brk

-- select * from #code_mapping

-- compute the final number

drop table if exists #final_digit_sum

select
final = (select ( 104 + sum(dec*weighting)) % 103 from #brk )
into #final_digit_sum


-- select * from #final_digit_sum




-- concatenate the final number with the txt
drop table if exists #check_num 

drop table if exists #res 



select 
weighting = -1
, dec = 0
, curr = 'LEADNING QUITE ZONE'
, pattern = cast(REPLICATE('0', 10)  as varchar(max))
into #res

union all 

select 
weighting = 0
, dec
, curr = 'STARTING'
, pattern = pattern
from #code_mapping 
where dec = (select cast(starting as varchar(100)) from #start_end)  -- this is the starting 

union all 

select 
weighting
, dec
, curr
, pattern
from #brk

union all 

select 
weighting = 1 + (select count(*) from #brk)
, dec = 64 
, curr = 'CHECKING DIGIT'
, pattern
from #code_mapping
where dec = (select cast(final as varchar(100)) from #final_digit_sum)

union all 

select 
weighting = 2 + (select count(*) from #brk)
, dec 
, curr = 'ENDING'
, pattern
from #code_mapping
where dec = (select cast(ending as varchar(100)) from #start_end)

union all 

select 
weighting = 3 + (select count(*) from #brk)
, dec = 0
, curr = 'TRAILING QUITE ZONE'
, pattern = cast(REPLICATE('0', 10)  as varchar(max))

-- select * from #res


drop table if exists #final

; with merged as (
select og = STRING_AGG(pattern, '') within group (order by weighting)
from #res
)
, cte as 
(
    select id = 1, curr = left(og, 1), rem = right(og, len(og)- 1) from merged
    union all 
    select id + 1, curr = left(rem, 1), rem = right(rem, len(rem)- 1) from cte
    where len(rem) >= 1
)   
select * into #final from cte 
order by id 
OPTION(maxrecursion 0 )



drop table if exists #display

; with cte as 
(
select 
n = 1 
, txt = ( select txt from #txt) -- + REPLICATE(' ', 100)
, barcode = 
	REPLACE(
		REPLACE(
			STRING_AGG(curr, '') within group(order by id) 
			, '1', nchar(9608) )
			, '0', ' ')
from #final 

union all 

select n + 1
, txt
, barcode from cte 
where n <= 20 -- control how many line to be repeated 
)
select txt, barcode into #display from cte 
option(maxrecursion 0)


select * from #display

-- select * from #final 
--  TODO - Below is to generate code 128 type of barcode 



