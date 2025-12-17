module uart_transmitter_reciever(
    input clk,
    input reset,
    input rx,
    output braud,
    output [7:0]out_tx,out_rx,
    output tx, recieved_signal,transmitted_signal,
    output [3:0]counter_tx,counter_rx
    ,output  [9:0]counter_braud
    ,output sig
    ,output start_processing_rx
    ,output [7:0]stored_data
    ,output start_processing_tx
    ,output flag);
    
    
    braud_rate uut(clk,reset,braud,sig,counter_braud);
    uart_reciever dut (clk,braud,reset,rx,out_rx, recieved_signal,counter_rx,start_processing_rx);
    uart_transmitter inst(clk,braud,reset,out_rx,recieved_signal,out_tx, tx,transmitted_signal,counter_tx,stored_data,start_processing_tx,flag);

    endmodule 