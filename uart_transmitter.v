module uart_transmitter(
    input clk,
    input braud,
    input reset,
    input [7:0]out_rx,
    input recived_signal,
    output reg [7:0]out_tx,
    output reg tx,
    output reg transmitted_signal,
    output reg [3:0]counter_tx
    ,output reg [7:0]stored_data
    ,output reg start_processing_tx
    ,output reg flag);
    

   
    
always@(posedge clk,posedge reset)begin
    if(recived_signal)begin
     flag<=1;
     transmitted_signal<=0;
     stored_data<=out_rx;
     end
    if(reset)begin
    tx<=1;
    out_tx<=0;
    start_processing_tx<=0;
    counter_tx<=0;
    transmitted_signal<=0;
    flag<=0;
    stored_data<=0;
    end
    else if(braud==1 && flag)begin
        
        if(tx && !start_processing_tx && !transmitted_signal)begin
            
            start_processing_tx<=1;
            tx<=0;//start bit
            transmitted_signal<=0;
            counter_tx<=0;
            
            end
        else if(start_processing_tx && counter_tx<9)begin
            tx<=stored_data[0];//lsb
            out_tx<={tx,out_tx[7:1]};
            stored_data<=stored_data>>1;
            counter_tx<=counter_tx+1;
            end
       else  begin
            tx<=1;
            counter_tx<=0;
            transmitted_signal<=1;
            flag<=0;
            start_processing_tx<=0;
        end
        
    end
    end
endmodule