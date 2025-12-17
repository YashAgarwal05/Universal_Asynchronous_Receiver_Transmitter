module braud_rate(input clk,reset,output reg braud,
output reg sig,output reg [9:0]counter);

always@(posedge clk,posedge reset)begin
   
    if(reset)begin
        counter<=0;
        braud=0;
        sig<=0;
        end
    else if(counter==10'd434 && sig==0)begin
        braud <=1;
        sig <=1;
        counter <=0;
        end
    else if(counter==10'd868)begin
        braud<=1;
        counter<=0;
        end
    else begin
        counter<=counter+1;
        braud<=0;
        end  
    end
endmodule