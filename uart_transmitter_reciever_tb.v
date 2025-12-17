module uart_transmitter_reciever_tb();
    reg clk;
    reg reset;
    reg rx;
    wire braud;
    wire [7:0]out_tx,out_rx;
    wire tx, recieved_signal,transmitted_signal;
    wire [3:0]counter_rx,counter_tx;
    wire [9:0]counter_braud;
    wire sig;
    wire start_processing_rx;
    wire [7:0] stored_data;
    wire start_processing_tx;
    wire flag;
    uart_transmitter_reciever dut(.clk(clk),.reset(reset),.rx(rx),.braud(braud),.out_tx(out_tx),.out_rx(out_rx),.tx(tx),
    .recieved_signal(recieved_signal),.transmitted_signal(transmitted_signal),.counter_rx(counter_rx),.counter_tx(counter_tx),.counter_braud(counter_braud)
    ,.sig(sig),.start_processing_rx(start_processing_rx),.stored_data(stored_data),.start_processing_tx(start_processing_tx),.flag(flag));
    initial clk=0;
    always #5clk=~clk;
    initial begin
        reset =1;
        #10 reset=0;
        rx = 0;         // Start bit
        #8767;
        rx = 1;         // Bit 0 (LSB)
        #8767;
        rx = 0;         // Bit 1
        #8767;
        rx = 0;         // Bit 2
        #8767;
        rx = 0;         // Bit 3
        #8767;
        rx = 0;         // Bit 4
        #8767;
        rx = 0;         // Bit 5
        #8767;
        rx = 1;         // Bit 6
        #8767;
        rx = 0;         // Bit 7 (MSB)
        #8767;
        rx = 1;         // Stop bit
        #8767;
        #500000;
        rx = 0;         // Start bit
        #8767;
        rx = 0;         // Bit 0 (LSB)
        #8767;
        rx = 1;         // Bit 1
        #8767;
        rx = 0;         // Bit 2
        #8767;
        rx = 0;         // Bit 3
        #8767;
        rx = 0;         // Bit 4
        #8767;
        rx = 0;         // Bit 5
        #8767;
        rx = 1;         // Bit 6
        #8767;
        rx = 0;         // Bit 7 (MSB)
        #8767;
        rx = 1;         // Stop bit
        #8767;
        #1000000000;
        $finish;
        end
endmodule