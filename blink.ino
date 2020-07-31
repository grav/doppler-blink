#include <ICEClass.h>
  // supplies demo_bin
  #include "/home/grav/repo/openteclab/doppler-blink/demo.h" // set up the path to doppler_simple_io or custom firmware
  ICEClass ice40;   // subclass ICEClass to implement custom spi protocol
   
  void setup() {
    ice40.upload(demo_bin,sizeof(demo_bin)); // Upload BitStream Firmware to FPGA -> see variant.h
    ice40.upload(); // Upload BitStream Firmware to FPGA -> see variant.h
    ice40.initSPI();  // start SPI runtime Link to FPGA
  }
  
  void loop() {
//     
//    static uint16_t x = 0;
//    ice40.sendSPI16(x++);   delay(1000);
  }
  
