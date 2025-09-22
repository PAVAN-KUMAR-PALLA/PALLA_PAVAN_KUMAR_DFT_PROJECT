module DFT_TESTBENCH;
  reg REFCLK,CLK2,RESET,TESTMODE;
  reg SI1,SI2,SE;
  reg [4:0] DATA_IN;
  wire [4:0] DATAOUT;
  wire SO1,SO2;
  
  UPDATED_DFT dut(.REFCLK(REFCLK),.RESET(RESET),.TESTMODE(TESTMODE),.SI1(SI1),.SI2(SI2),.SE(SE),.SO1(SO1),.SO2(SO2),.CLK2(CLK2),.DATA_IN(DATA_IN),.DATAOUT(DATAOUT));
  initial begin
    $dumpfile("test.vcd");
    
    $dumpvars(0,DFT_TESTBENCH);
    
  end
  
  initial begin
    REFCLK=1;
  forever #5 REFCLK = ~REFCLK;    
  end
  initial begin
    CLK2=1;
      forever #5 CLK2 = ~CLK2;

  end
  
  initial begin
  RESET=1'b1; TESTMODE=1'b0; SE=1'b0; SI1=1'b1; SI2=1'b1; DATA_IN=5'b01111;
  
  //Shiftin -> capture->shiftout
  
  //shiftin
  #10 RESET=1'b0;
  DATA_IN = 5'b00001;
      TESTMODE=1'b1; SE=1'b1; SI1=1'b0; SI2=1'b0;
  #10 TESTMODE=1'b1; SE=1'b1; SI1=1'b0; SI2=1'b0;
  #10 TESTMODE=1'b1; SE=1'b1; SI1=1'b0; SI2=1'b0;
  #10 TESTMODE=1'b1; SE=1'b1; SI1=1'b0; SI2=1'b0;
  #10 TESTMODE=1'b1; SE=1'b1; SI1=1'b0; SI2=1'b0;
  #10 TESTMODE=1'b1; SE=1'b1; SI1=1'b0; SI2=1'b0;
  #10 TESTMODE=1'b1; SE=1'b1; SI1=1'b0; SI2=1'b0;
  #10 TESTMODE=1'b1; SE=1'b1; SI1=1'b0; SI2=1'b0;
  #10 TESTMODE=1'b1; SE=1'b1; SI1=1'b0; SI2=1'b0;
  #10 TESTMODE=1'b1; SE=1'b1; SI1=1'b0; SI2=1'b0;
  #10 TESTMODE=1'b1; SE=1'b1; SI1=1'b0; SI2=1'b0;
  #10 TESTMODE=1'b1; SE=1'b1; SI1=1'b0; SI2=1'b0;
  #10 TESTMODE=1'b1; SE=1'b1; SI1=1'b0; SI2=1'b0;
  #10 TESTMODE=1'b1; SE=1'b1; SI1=1'b0; SI2=1'b0;
  #10 TESTMODE=1'b1; SE=1'b1; SI1=1'b0; SI2=1'b0;
    
  //capture
 // #10 SE=1'b0; 
  
  //shiftout
  #10 SE=1;
  #10 SE=1;
  #10 SE=1;
  #10 SE=1;
  #10 SE=1;
  #10 SE=1;
  #10 SE=1;
  #10 SE=1;
  #10 SE=1;
  #10 SE=1;
  #10 SE=1;
  #10 SE=1;
  #10 SE=1;
  #10 SE=1;
  #10 SE=1;
  
//shiftin
  #10 DATA_IN = 5'b01111; TESTMODE=1'b1; SE=1'b1; SI1=1'b1; SI2=1'b1;
  #10 TESTMODE=1'b1; SE=1'b1; SI1=1'b1; SI2=1'b1;
  #10 TESTMODE=1'b1; SE=1'b1; SI1=1'b1;SI2=1'b1;
  #10 TESTMODE=1'b1; SE=1'b1; SI1=0'b0;SI2=1'b1;
  #10 TESTMODE=1'b1; SE=1'b1; SI1=1'b1;SI2=1'b0;
  #10 TESTMODE=1'b1; SE=1'b1; SI1=1'b0;SI2=1'b1;
  #10 TESTMODE=1'b1; SE=1'b1; SI1=0'b1;SI2=1'b1;
  #10 TESTMODE=1'b1; SE=1'b1; SI1=0'b1;SI2=1'b1;
  #10 TESTMODE=1'b1; SE=1'b1; SI1=1'b0;SI2=1'b0;
  #10 TESTMODE=1'b1; SE=1'b1; SI1=1'b1;SI2=1'b1;
  #10 TESTMODE=1'b1; SE=1'b1; SI1=1'b0;SI2=1'b0;
  #10 TESTMODE=1'b1; SE=1'b1; SI1=1'b1;SI2=1'b1;
  #10 TESTMODE=1'b1; SE=1'b1; SI1=1'b1;SI2=1'b1;
  #10 TESTMODE=1'b1; SE=1'b1; SI1=1'b0;SI2=1'b0;
  #10 TESTMODE=1'b1; SE=1'b1; SI1=1'b1;SI2=1'b1;
  
  //capture
 // #10 SE=1'b0; 
 
 //shiftout 
  #10 SE=1;
  #10 SE=1;
  #10 SE=1;
  #10 SE=1;
  #10 SE=1;
  #10 SE=1;
  #10 SE=1;
  #10 SE=1;
  #10 SE=1;
  #10 SE=1;
  #10 SE=1;
  #10 SE=1;
  #10 SE=1;
  #10 SE=1;
  #10 SE=1;
   #10; DATA_IN= 5'b00100;
    #10; DATA_IN = 5'b00011;
    #10; DATA_IN = 5'b00111;
    #10; DATA_IN = 5'b11111;
    #40;
  #300;
  #10 TESTMODE=1'b1; SE=1'b1; SI1=1'b0; SI2=1'b0;
    $finish;
  end
  initial
    $monitor("Time= %t DATA_IN = %b and DATAOUT = %b and SE=%b  SI1=%b and SI2=%b and SO1=%b and SO2=%b  ", $time,DATA_IN,DATAOUT,SE,SI1,SI2,SO1,SO2);
