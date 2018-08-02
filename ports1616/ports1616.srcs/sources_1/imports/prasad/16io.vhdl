library ieee;
Use ieee.std_logic_1164.all;
Use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;
entity port16 is
port(start,rst,clk:in std_logic;p1,p2,p3,p4:in std_logic_vector(15 downto 0);out1,out2,out3,out4:out std_logic_vector(15 downto 0);dataready,datareq:out std_logic);
end port16;
architecture m1 of port16 is
signal temp:std_logic_vector(2 downto 0):="000";
signal busy:std_logic:='0';
signal check0:std_logic_vector(1 downto 0):="00";
signal check1:std_logic_vector(1 downto 0):="00";
signal check2:std_logic_vector(1 downto 0):="00";
signal check3:std_logic_vector(1 downto 0):="00";
signal check4:std_logic_vector(1 downto 0):="00";
signal check5:std_logic_vector(1 downto 0):="00";
signal check6:std_logic_vector(1 downto 0):="00";
signal check7:std_logic_vector(1 downto 0):="00";
signal check8:std_logic_vector(1 downto 0):="00";
signal check9:std_logic_vector(1 downto 0):="00";
signal check10:std_logic_vector(1 downto 0):="00";
signal check11:std_logic_vector(1 downto 0):="00";
signal check12:std_logic_vector(1 downto 0):="00";
signal check13:std_logic_vector(1 downto 0):="00";
signal check14:std_logic_vector(1 downto 0):="00";
signal check15:std_logic_vector(1 downto 0):="00";
signal checkport0:std_logic_vector(1 downto 0):="00";
signal checkport1:std_logic_vector(1 downto 0):="00";
signal checkport2:std_logic_vector(1 downto 0):="00";
signal checkport3:std_logic_vector(1 downto 0):="00";
signal checkport4:std_logic_vector(1 downto 0):="00";
signal checkport5:std_logic_vector(1 downto 0):="00";
signal checkport6:std_logic_vector(1 downto 0):="00";
signal checkport7:std_logic_vector(1 downto 0):="00";
signal checkport8:std_logic_vector(1 downto 0):="00";
signal checkport9:std_logic_vector(1 downto 0):="00";
signal checkport10:std_logic_vector(1 downto 0):="00";
signal checkport11:std_logic_vector(1 downto 0):="00";
signal checkport12:std_logic_vector(1 downto 0):="00";
signal checkport13:std_logic_vector(1 downto 0):="00";
signal checkport14:std_logic_vector(1 downto 0):="00";
signal checkport15:std_logic_vector(1 downto 0):="00";



begin
process(clk,rst,start,temp,busy)
type fifo_memory is  array(0 to 3) of std_logic_vector(15 downto 0);
variable memory0,memory1,memory2,memory3:fifo_memory;
variable i:natural range 0 to 3:=0;
begin
if(rising_edge(clk))then
if (rst='0') then
i:=0;
datareq<='1';
dataready<='0';
temp<="000";
busy<='0';

else if(start='1') and (busy='0')then
       datareq<='0';
       memory0(i):=p1;
       memory1(i):=p2;
       memory2(i):=p3;
       memory3(i):=p4;
       
       if(i=3)then
       busy<='1';
       i:=0; 
        checkport0<=memory0(0)(12)&memory0(0)(11);
    checkport1<=memory1(0)(12)&memory1(0)(11);
    checkport2<=memory2(0)(12)&memory2(0)(11);
    checkport3<=memory3(0)(12)&memory3(0)(11);
    checkport4<=memory0(1)(12)&memory0(1)(11);
    checkport5<=memory1(1)(12)&memory1(1)(11);
    checkport6<=memory2(1)(12)&memory2(1)(11);
    checkport7<=memory3(1)(12)&memory3(1)(11);
    checkport8<=memory0(2)(12)&memory0(2)(11);
    checkport9<=memory1(2)(12)&memory1(2)(11);
    checkport10<=memory2(2)(12)&memory2(2)(11);
    checkport11<=memory3(2)(12)&memory3(2)(11);
    checkport12<=memory0(3)(12)&memory0(3)(11);
    checkport13<=memory1(3)(12)&memory1(3)(11);
    checkport14<=memory2(3)(12)&memory2(3)(11);
    checkport15<=memory3(3)(12)&memory3(3)(11);
    
    check0<=memory0(0)(9)&memory0(0)(8);
    check1<=memory1(0)(9)&memory1(0)(8);
    check2<=memory2(0)(9)&memory2(0)(8);
    check3<=memory3(0)(9)&memory3(0)(8);
    check4<=memory0(1)(9)&memory0(1)(8);
    check5<=memory1(1)(9)&memory1(1)(8);
    check6<=memory2(1)(9)&memory2(1)(8);
    check7<=memory3(1)(9)&memory3(1)(8);
    check8<=memory0(2)(9)&memory0(2)(8);
    check9<=memory1(2)(9)&memory1(2)(8);
    check10<=memory2(2)(9)&memory2(2)(8);
    check11<=memory3(2)(9)&memory3(2)(8);
    check12<=memory0(3)(9)&memory0(3)(8);
    check13<=memory1(3)(9)&memory1(3)(8);
    check14<=memory2(3)(9)&memory2(3)(8);
    check15<=memory3(3)(9)&memory3(3)(8); 
       else
       i:=i+1;
       end if;
 

end if;

 if(busy='1')  then
   
     dataready<='1';
   
   
    if(temp/="100")then
     
     if check0=temp then
           if checkport0<="00"  then
              out1<=memory0(0);
              out1(9 downto 8)<="00";
              out1(12 downto 11)<="00";
              
            else if checkport0<="01"  then
              out2<=memory0(0);
              out2(9 downto 8)<="00";
              out2(12 downto 11)<="00";
            else if checkport0<="10"  then
              out3<=memory0(0);
              out3(9 downto 8)<="00";  
out3(12 downto 11)<="00"; 
            else if checkport0<="11"  then
              out4<=memory0(0);
              out4(9 downto 8)<="00";
out4(12 downto 11)<="00"; 
            end if;
            end if;
            end if;
            end if;
            end if;
       if check1=temp then
           if checkport1<="00"  then
              out1<=memory1(0);
              out1(9 downto 8)<="00";
              out1(12 downto 11)<="01";
            else if checkport1<="01"  then
              out2<=memory1(0);
              out2(9 downto 8)<="00";
out2(12 downto 11)<="01";
            else if checkport1<="10"  then
              out3<=memory1(0);
              out3(9 downto 8)<="00"; 
out3(12 downto 11)<="01"; 
            else if checkport1<="11"  then
              out4<=memory1(0);
              out4(9 downto 8)<="00";
out4(12 downto 11)<="01";
            end if;
            end if;
            end if;
            end if;
            end if;
       if check2=temp then
           if checkport2<="00"  then
              out1<=memory2(0);
              out1(9 downto 8)<="00";
		out1(12 downto 11)<="10";
            else if checkport2<="01"  then
              out2<=memory2(0);
              out2(9 downto 8)<="00";
out2(12 downto 11)<="10";
            else if checkport2<="10"  then
              out3<=memory2(0);
              out3(9 downto 8)<="00";
out3(12 downto 11)<="10"; 
            else if checkport2<="11"  then
              out4<=memory2(0);
              out4(9 downto 8)<="00";
out4(12 downto 11)<="10";
            end if;
            end if;
            end if;
            end if;
            end if;
       if check3=temp then
           if checkport3<="00"  then
              out1<=memory3(0);
              out1(9 downto 8)<="00";
        out1(12 downto 11)<="11";
            else if checkport3<="01"  then
              out2<=memory3(0);
              out2(9 downto 8)<="00";
out2(12 downto 11)<="11";
            else if checkport3<="10"  then
              out3<=memory3(0);
              out3(9 downto 8)<="00";
out3(12 downto 11)<="11"; 
            else if checkport3<="11"  then
              out4<=memory3(0);
              out4(9 downto 8)<="00";
out4(12 downto 11)<="11";
            end if;
            end if;
            end if;
            end if;
            end if;
      if check4=temp then
           if checkport4<="00"  then
              out1<=memory0(1);
              out1(9 downto 8)<="01";
out1(12 downto 11)<="00";
            else if checkport4<="01"  then
              out2<=memory0(1);
              out2(9 downto 8)<="01";
out2(12 downto 11)<="00";
            else if checkport4<="10"  then
              out3<=memory0(1);
               out3(9 downto 8)<="01";
out3(12 downto 11)<="00"; 
            else if checkport4<="11"  then
              out4<=memory0(1);
                out4(9 downto 8)<="01";
out4(12 downto 11)<="00";
            end if;
            end if;
            end if;
            end if;
            end if;
       if check5=temp then
           if checkport5<="00"  then
              out1<=memory1(1);
               out1(9 downto 8)<="01";
out1(12 downto 11)<="01";
            else if checkport5<="01"  then
              out2<=memory1(1);
               out2(9 downto 8)<="01";
out2(12 downto 11)<="01";
            else if checkport5<="10"  then
              out3<=memory1(1);
               out3(9 downto 8)<="01";
out3(12 downto 11)<="01"; 
            else if checkport5<="11"  then
              out4<=memory1(1);
               out4(9 downto 8)<="01";
out4(12 downto 11)<="01";
            end if;
            end if;
            end if;
            end if;
            end if;
       if check6=temp then
           if checkport6<="00"  then
              out1<=memory2(1);
               out1(9 downto 8)<="01";
out1(12 downto 11)<="10";
            else if checkport6<="01"  then
              out2<=memory2(1);
               out2(9 downto 8)<="01";
out2(12 downto 11)<="10";
            else if checkport6<="10"  then
              out3<=memory2(1);
              out3(9 downto 8)<="01";
out3(12 downto 11)<="10"; 
            else if checkport6<="11"  then
              out4<=memory2(1);
               out4(9 downto 8)<="01";
out4(12 downto 11)<="10";
            end if;
            end if;
            end if;
            end if;
            end if;
       if check7=temp then
           if checkport7<="00"  then
              out1<=memory3(1);
               out1(9 downto 8)<="01";
out1(12 downto 11)<="11";     
            else if checkport7<="01"  then
              out2<=memory3(1);
               out2(9 downto 8)<="01";
out2(12 downto 11)<="11";
            else if checkport7<="10"  then
              out3<=memory3(1);
               out3(9 downto 8)<="01";
out3(12 downto 11)<="11"; 
            else if checkport7<="11"  then
              out4<=memory3(1);
              out4(9 downto 8)<="01";
out4(12 downto 11)<="11";
            end if;
            end if;
            end if;
            end if;
            end if;
         if check8=temp then
           if checkport8<="00"  then
              out1<=memory0(2);
               out1(9 downto 8)<="10";
out1(12 downto 11)<="00";
            else if checkport8<="01"  then
              out2<=memory0(2);
              out2(9 downto 8)<="10";
out2(12 downto 11)<="00";
            else if checkport8<="10"  then
              out3<=memory0(2);
              out3(9 downto 8)<="10";
out3(12 downto 11)<="00"; 
            else if checkport8<="11"  then
              out4<=memory0(2);
              out4(9 downto 8)<="10";
out4(12 downto 11)<="00";
            end if;
            end if;
            end if;
            end if;
            end if;
       if check9=temp then
           if checkport9<="00"  then
              out1<=memory1(2);
              out1(9 downto 8)<="10";
out1(12 downto 11)<="01";
            else if checkport9<="01"  then
              out2<=memory1(2);
	    out2(9 downto 8)<="10";
out2(12 downto 11)<="01";
            else if checkport9<="10"  then
              out3<=memory1(2);
	out3(9 downto 8)<="10";
out3(12 downto 11)<="01"; 
            else if checkport9<="11"  then
              out4<=memory1(2);
	out4(9 downto 8)<="10";
out4(12 downto 11)<="01";
            end if;
            end if;
            end if;
            end if;
            end if;
       if check10=temp then
           if checkport10<="00"  then
              out1<=memory2(2);
	   out1(9 downto 8)<="10";
out1(12 downto 11)<="10";
            else if checkport10<="01"  then
              out2<=memory2(2);
	out2(9 downto 8)<="10";
out2(12 downto 11)<="10";
            else if checkport10<="10"  then
              out3<=memory2(2);
	out3(9 downto 8)<="10";
out3(12 downto 11)<="10"; 
            else if checkport10<="11"  then
              out4<=memory2(2);
	out4(9 downto 8)<="10";
out4(12 downto 11)<="10";
            end if;
            end if;
            end if;
            end if;
            end if;
       if check11=temp then
           if checkport11<="00"  then
              out1<=memory3(2);
	out1(9 downto 8)<="10";
out1(12 downto 11)<="11";
            else if checkport11<="01"  then
              out2<=memory3(2);
	out2(9 downto 8)<="10";
out2(12 downto 11)<="11";
            else if checkport11<="10"  then
              out3<=memory3(2);
	out3(9 downto 8)<="10";
out3(12 downto 11)<="11"; 
            else if checkport11<="11"  then
              out4<=memory3(2);
	out4(9 downto 8)<="10";
out4(12 downto 11)<="11";
            end if;
            end if;
            end if;
            end if;
            end if;
      if check12=temp then
           if checkport12<="00"  then
              out1<=memory0(3);
              out1(9 downto 8)<="11";
out1(12 downto 11)<="00";
            else if checkport12<="01"  then
              out2<=memory0(3);
	out2(9 downto 8)<="11";
out2(12 downto 11)<="00";
            else if checkport12<="10"  then
              out3<=memory0(3);
	out3(9 downto 8)<="11";
out3(12 downto 11)<="00"; 
            else if checkport12<="11"  then
              out4<=memory0(3);
	out4(9 downto 8)<="11";
out4(12 downto 11)<="00";
            end if;
            end if;
            end if;
            end if;
            end if;
       if check13=temp then
           if checkport13<="00"  then
              out1<=memory1(3);
	out1(9 downto 8)<="11";
out1(12 downto 11)<="01";
            else if checkport13<="01"  then
              out2<=memory1(3);
	out2(9 downto 8)<="11";
out2(12 downto 11)<="01";
            else if checkport13<="10"  then
              out3<=memory1(3);
	out3(9 downto 8)<="11";
out3(12 downto 11)<="01"; 
            else if checkport13<="11"  then
              out4<=memory1(3);	
	out4(9 downto 8)<="11";
out4(12 downto 11)<="01";
            end if;
            end if;
            end if;
            end if;
            end if;
       if check14=temp then
           if checkport14<="00"  then
              out1<=memory2(3);
	out1(9 downto 8)<="11";
out1(12 downto 11)<="10";
            else if checkport14<="01"  then
              out2<=memory2(3);
	out2(9 downto 8)<="11";
out2(12 downto 11)<="10";
            else if checkport14<="10"  then
              out3<=memory2(3);
	out3(9 downto 8)<="11";
out3(12 downto 11)<="10"; 
            else if checkport14<="11"  then
              out4<=memory2(3);
	out4(9 downto 8)<="11";
out4(12 downto 11)<="10";
            end if;
            end if;
            end if;
            end if;
            end if;
       if check15=temp then
           if checkport15<="00"  then
              out1<=memory3(3);
	out1(9 downto 8)<="11";
        out1(12 downto 11)<="11";
            else if checkport15<="01"  then
              out2<=memory3(3);
	out2(9 downto 8)<="11";
        out2(12 downto 11)<="11";
            else if checkport15<="10"  then
              out3<=memory3(3);
	out3(9 downto 8)<="11";
        out3(12 downto 11)<="11"; 
            else if checkport15<="11"  then
              out4<=memory3(3);
	out4(9 downto 8)<="11";
        out4(12 downto 11)<="11";
            end if;
            end if;
            end if;
            end if;
            end if;

     end if;
    if(temp="100")then
      dataready<='0';
     datareq<='1';
     temp<="000";
     busy<='0';
    else
    temp<=temp+'1';
    end if;


end if;
end if;
end if;
end process;
end m1;