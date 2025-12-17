module uart_reciever(
    input clk,
    input braud,
    input reset,
    input rx,
    output reg [7:0]out_rx,
    output reg recieved_signal,
    output reg [3:0]counter,
    output reg start_processing_rx
);
 
always@(posedge clk or posedge reset)begin
    recieved_signal<=0;
    if(reset)begin
        out_rx<=0;
        start_processing_rx<=0;
        counter<=0;
        recieved_signal<=0;
        end
    else if(braud==1) begin
        if(rx==1'b0 && !start_processing_rx) begin//start(start==1 && start_processing==0)se bhi 
            start_processing_rx<=1;
             out_rx<=0;
             counter<=0;
        end
        else if(start_processing_rx && counter<8) begin//rx out_rx
            out_rx[7:0]<={rx,out_rx[7:1]};//lsb first
            counter<=counter+1;
            end
        else if (counter==8)begin //stop
                start_processing_rx<=0;
                counter<=0;
                recieved_signal<=1;//recieve the signal
                //for the next //stop bit is 0 so it will not go again ok 
             end
         
     end
end
endmodule