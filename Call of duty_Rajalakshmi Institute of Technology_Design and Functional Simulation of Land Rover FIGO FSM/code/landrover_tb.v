module figo_fsm_tb;

reg clk, inbit, reset;
wire [2:0] detect;

// Instantiate the figo_fsm module
figo_fsm uut (
  .clk(clk),
  .inbit(inbit),
  .reset(reset),
  .detect(detect)
);

// Clock generation
always
begin
  #5 clk = ~clk;
end

// Stimulus generation
initial
begin
  clk = 0;
  reset = 1;
  inbit = 0;
  
  #10 reset = 0;
  
  // Test Case 1
  #5 inbit = 1;
  #10 inbit = 1;
  #10 inbit = 0;
  
  // Test Case 2
  #5 inbit = 1;
  #10 inbit = 0;
  #10 inbit = 1;
  
  // Test Case 3
  #5 inbit = 0;
  #10 inbit = 1;
  #10 inbit = 1;
  #10 inbit = 0;
  
  // Test Case 4
  #5 inbit = 0;
  #10 inbit = 1;
  #10 inbit = 0;
  
  // Add more test cases as needed
  
  #10 $finish;
end

endmodule