
function val_hex=signed_hex_val_16bits(c_hex)

tama = length(c_hex);

val_hex=c_hex;

for i =1:tama
   j = c_hex(i);
    if j>32767
       val_hex(i) = val_hex(i) - 65538;
    end   
end  