/*
Train Encoder version 1.0 - just get basic hardware connections in place...
- Attempt to display basic encoder data on touch screen..
- Figure out how to take actions on touch screen..
- Attach encoder physically...

Version 1.00 January 28th, 2019 -ewt

version 1.01 - 
- figure out encoder more firmly - get formulas for MPH and KPH figured out..
- build a basic display or "home" screen with room for buttons at the bottom..

Version 1.01 January 31st, 2019 -ewt

Version 1.02 - 
- get conversions figured out and updated display
- figure out miles feet display 
- start adding in trip meter 
- looks like basic speedo is working at this point
- commented OUT lots of not well thought out code in setup..
- next up MOVE ALL ACREEN SETUP out of void(setup) so we can call it over and over..!!

Version 1.02 February 2nd, 2019  -ewt

Version 1.03 -
 - add 8kB FRAM hardware and basic sw and test - example sketch find FRAM
   and functions below seem to compiler okay..   Need to integrate..
 - added beeper to HW pin 23!!  (beepPin)
 Next we need to re-address how we trigger display update and 
 start listening for and doing things from the touch screen..

 version 1.03 February5th, 2019 -ewt

 Version 1.04 - 
  - get permanent odometer is working..
  - display only updated if data is changed, still doesn't look super good, but for $5 display?  Good enough..
  - beeper doesn't want to work?  Hmn...  FIXED!  Missing VCC connection..  (3.3v)
  Next it's time to start working on touch buttons!!

  version 1.04 February 10th, 2019 -ewt

Version 1.05 - 
  - simple non-debounced trip reset switch implemented..
  - set up touch coordinates to print in upper right in blue..
Next we need to create a "pick a scale" screen and tie that to a button as well..

Version 1.06 -
  - select scale and units screens and buttons created..
    - this was several HOURS in the making, but is SORT of re-usable for future projects.  Sort of..
  - added code to figure out touch zones and display in bottom right.
  - then got the basic select units menu working..
  - refined do this then that based on which screen we're in currently.
NEXT - create touch actions for scale buttons and then INTEGRATE scale and units so we
      are displaying the correct data - OH, and SAVE current setting through power cycle?
  version 1.6, February 13th, 2019 -ewt

Version 1.07 -
  - all scales in both units work, as well as resetable trip meter in all scales and units.
  - Code is "eric goofy" but seems to work..  Metric is probably more accurate than imperial..
  - imperial derived from miles, so feet number is approximation..
NEXT - store scale and units in FRAM so they are persistent!!

  version 1.07, February 18th, 2019 -ewt

Version 1.08 - REALEASE CONDIDATE - at least as far as a hobby project goes!!

 - install small version print out in config screen...

Version 1.09 - okay, saving scale is broken - we should shift to making
               scale an integer vs. a float - that helps a lot of things, I think..
               Later..

Version 1.10 - FIXED - I think the LAST thing is an occasional display update bug when
               moving between scales and units.  You have to move the car to get the 
               display to update..  Perhaps decriment the "pre_" variables to trigger
               an update?

Version 1.11 - add credits and serial number in outof the way space...

Version 1.12 - LAST fix? :-) - when you switch scale, need to move to update display - fixed, I think.
               Looks to have worked.. Thought of solution in middle of swimming pool..  ;-)



Color definitions
#define ILI9341_BLACK       0x0000         0,   0,   0 
#define ILI9341_NAVY        0x000F         0,   0, 128 
#define ILI9341_DARKGREEN   0x03E0         0, 128,   0 
#define ILI9341_DARKCYAN    0x03EF         0, 128, 128 
#define ILI9341_MAROON      0x7800       128,   0,   0 
#define ILI9341_PURPLE      0x780F       128,   0, 128 
#define ILI9341_OLIVE       0x7BE0       128, 128,   0 
#define ILI9341_LIGHTGREY   0xC618       192, 192, 192 
#define ILI9341_DARKGREY    0x7BEF       128, 128, 128 
#define ILI9341_BLUE        0x001F         0,   0, 255 
#define ILI9341_GREEN       0x07E0         0, 255,   0 
#define ILI9341_CYAN        0x07FF         0, 255, 255 
#define ILI9341_RED         0xF800       255,   0,   0 
#define ILI9341_MAGENTA     0xF81F       255,   0, 255 
#define ILI9341_YELLOW      0xFFE0       255, 255,   0 
#define ILI9341_WHITE       0xFFFF       255, 255, 255 
#define ILI9341_ORANGE      0xFD20       255, 165,   0 
#define ILI9341_GREENYELLOW 0xAFE5       173, 255,  47 
#define ILI9341_PINK        0xF81F

*/

#include <ILI9341_t3.h>                       // Easily create ACSII and graphics displays on TFT screen.
#include <font_Arial.h>                       // from ILI9341_t3, font
#include <font_CourierNew.h>                  // from ILI9341_t3, font
#include <font_CourierNewBold.h>              // from ILI9341_t3, font
#include <font_AwesomeF100.h>                 // from ILI9341_t3 library - symbols font..
#include <XPT2046_Touchscreen.h>              // library to support touchsceen input..
#include <SPI.h>                              // library to drive hardware based S.erial P.eriferal I.nterface based devices..
#include <Encoder.h>                          // optimized encoder library to track motion easily!!
#include <Adafruit_FRAM_SPI.h>                // access tools for FRAM storage where we store "stuff"..


#define CS_PIN  8
#define TFT_DC  9
#define TFT_CS 10
// MOSI=11, MISO=12, SCK=13
ILI9341_t3 tft = ILI9341_t3(TFT_CS, TFT_DC);  // set up TFT screen library hardware connections..

XPT2046_Touchscreen ts(CS_PIN);               // set up touch screen library hardware connections..
#define TIRQ_PIN  2

#define ENCODER_OPTIMIZE_INTERRUPTS           // configure pins to accept interupts for better response
Encoder myEnc(20, 21);                        // use pins 20 and 21 for our quadrature encoder

uint8_t FRAM_CS = 22;                         // use CS pin 22 for chip select / SS
Adafruit_FRAM_SPI fram = Adafruit_FRAM_SPI(); // use hardware SPI 

//#define bmainfont = "Arial_18";
//#define bsubfont = "Arial_10";


/*
 * Just by luck of the draw, the wheel (LGB standard plastic) and encoder combination I'm using
 * equates to a pulse/count event represents .05mm in 1:1 scale..
 * 2000 pulses per meter..
 */
float version = 1.12;                         // version to print out..
long scale = 240;                             // a thing to save and calculate with..  save scales as *10 values to avoid floats till we need them..
const long scalearray[] = {320, 290, 240, 225, 203};
uint8_t scalearraypointer = 2;
long count;                                   // A thing to print out
long prev_count;                              // help decide when to update display!!
long previouscount = 1;                       // a thing to help decide to print out..
long distcount;
long prevdistcount;
long distanceinterval = 0;                    // an ABSOLUTE count of distance traveled
int countSum;                                 // Sum of 10 element aray...
unsigned long ODO;                            // the main tracker of TOTAL PULSES EVER..
unsigned long pre_ODO;
unsigned long cycle_count = 0;                // take place of print ODO - just want pulses for THIS POWER CYCLE..
unsigned long pre_cycle_count = 0;
long TRIP = 0;
long previousTRIP;
unsigned long odometer = 0;
unsigned long metricodometer = 0;
unsigned long metricodoKM = 0;
unsigned long metricodoKMremain = 0;
unsigned long prev_metricodoKMremain = 0;
//unsigned long prev_metricodometerremain = 0;
int metricodometerremain = 0;
unsigned long tripmeter = 0;
unsigned long metrictripmeter = 0;
unsigned long metricTripKM =0;
unsigned long metricTripKMremain = 0;
unsigned long prev_metricTripKMremain = 0;
unsigned long prev_metricTripKM = 0;
unsigned long pre_tripmeter = 1;
int tripfeet;
int prev_tripfeet = 1;
int feetremain;
int prev_feetremain = 1;
int pulseremain;
float foom;
float prev_foom = 1;
float fook;
float prev_fook = 1;
int screen =0;                                // a way to track which screen - to date, 0 == main 1 == scale selection

unsigned long currentMillis;

//some arrays to help figure out current speed, speed being distance over time..
int ONETENTH[] = {0,0,0,0,0,0,0,0,0,0};       // every 50 milliseconds, stash a pulse count that we can average..
unsigned long previousMillis = 0;             // timer variable so we populate above array in timely fashion
unsigned long previousMillis1 = 0;            // timer variable to use to trigger reset button checks..
unsigned long previousMillis2 = 0;            // timer variable to use to trigger configuration button checks..
unsigned long previousMillis3 = 0;            // timer variable to use for test screen touch data values
unsigned long previousMillis4 = 0;            // another timer - for units buttons...

int onetenthindex = 0;                        // a way to itterate through the ONETENTH array

char SPEEDunit[] = "MPH";                     // set SPEEDunit[0] to "K" or "M", display feature ONLY!
//char SCALE[] = "1:29";                      // a thing to print out
//float scale = 29.0;                         // a thing to convert units to the actual scale version of measurements..
int foo = 0;                                  // it was a test program that became the real thing, soo....
boolean wastouched = true;                    // help us manage the touch screen touch functions.
int beepPin = 23;                             // we have a 4KHz buzzer attached here - drive low for tone!
//uint8_t imperial = 0;                       // if zero them imperial > 0 equates to metric.
int units = 0;                                // units in terms of imperial or metric, if zero them imperial > 0 equates to metric.

// a little FRAM address tracking...
uint16_t SAVEDODO = 0x00;                     //FRAM address for long odometer 0x00, 01 02 and 03
uint16_t SAVEDUNITS = 0x04;                   //FRAM addres for byte units     0x04
uint16_t SAVEDTRIP = 0x05;                    //FRAM address for long trip     0x05. 06 07 and 08
uint16_t SAVEDSCALE = 0x10;                   //FRAM address for long scale    0x10, 11 12 and 13
uint16_t ALTSCALE = 0x20;                     //FRAM address for byte scale array pointer 0x20

boolean changescale = false;                  // true false to help uddate display after scale selection..

void setup() {
  fram.begin(FRAM_CS, 2);                     // intialize fram instance to save various data to..  Testing reveils 2 byte addressing.
  fram.setAddressSize(2);                     // double check that...
  tft.begin();
  tft.setRotation(1);                         // landscape view vs. poitrait  320 X x 240 Y
  ts.begin();                                 // intiate touch screen library so we can create some buttons..
  ts.setRotation(1);
  scalearraypointer = framReadByte(ALTSCALE); // read in index pointer
  scale = scalearray[scalearraypointer];      // look up current scale..
  units = framReadByte(SAVEDUNITS);           // look up current units..
  if (units == 0) {
    SPEEDunit[0] = 'M';                       // M for MILES PER HOUR
  }
  else {
    SPEEDunit[0] = 'K';                       // K for KILOMETERS PER HOUR
  }
  drawmainscreen();                           // draw the labels for the main screen..o  
  resetbutton();
  configurebutton();
  pinMode(beepPin, OUTPUT);                   // setup beeper driving pin
  digitalWrite(beepPin, HIGH);                // make sure we're not beeping!  ;-)
  beep(30);

  pre_ODO = framReadlong(SAVEDODO); // should just be an ever growing unsigned long..  BIllions..
  //tft.setFont(Arial_8);
  //tft.setCursor(150, 10);
  //tft.setTextColor(ILI9341_BLUE);
  //tft.print(pre_ODO);
  ODO = pre_ODO;
  previousTRIP = framReadlong(SAVEDTRIP);     // make trip meter persistent too?

} // end of void setup()


void loop() {
// count update loop...
  count = myEnc.read();                       // Grab input from the encoder in real time for display...
//  if ((previouscount != count) || (changescale = true)) {  // if we've moved OR changed the scale, update..)
  if ((previouscount != count) || (changescale == true)) {  // if we've moved OR changed the scale, update..)
    changescale = false;
    if (count > previouscount) {
      distanceinterval = count - previouscount;  
    }
    else {
      distanceinterval = previouscount - count;
    }
    previouscount = count;

    // do a little output of odometer data - CRUDE, just pulse count at this point
    // finer would be something like miles and feet?
    // 
    // 1609344 per mile or in my case:
    // 3,218,688 pulses per REAL MILE, then divide by scale:
    // 110,989.. Use this figure 1:29th or...
    // then we need FEET, too...
    // 304.8 mm per foot..
    // 609.6 pulses per foot..

    unsigned long convmult = 3218688 / (scale/10.0);  // a scale mile is 3218688 encoder account divded by scale.
    float convfeet = 609.6 / (scale/10.0);            // a scale foot is 609.6 encoder counts divided by scale.
    ODO = abs(distanceinterval) + ODO;              // ODO is just the raw cumulative pulse count since last power on.
    framWritelong(0x0, ODO);                        // just keep counting - billions is a BIG NUMBER..
    cycle_count = abs(distanceinterval) + pre_cycle_count;
    pre_cycle_count = cycle_count; 


    odometer = ODO / convmult;                      // a thing in scale units, in this case miles.
    pulseremain = ODO % convmult;
    feetremain = pulseremain / convfeet;

    //metricodometer = ODO / convkilometer;         // this should be scale kilometers
    // we need to try resolving to something we can count effectively..
    // at 1:29th, 2000 / 29 = 68.9655 pulses to a scale meter..
    unsigned long convmeter = 2000 / (scale/10.0);              // 2000 pulses to one real world meter..
    metricodometer = ODO / convmeter;                    // this should be total scale meters?
    metricodoKM = metricodometer / 1000;                 // scale kilometers, then...
    metricodoKMremain = metricodometer % 1000;           // ...remaining meters for easy display

        
    // calculate trip meter
    TRIP = abs(distanceinterval) + previousTRIP;
    framWritelong(SAVEDTRIP, TRIP);
    previousTRIP = TRIP;
    tripmeter = TRIP / convmult;
    pulseremain = TRIP % convmult;    
    tripfeet = pulseremain / convfeet;

    metrictripmeter = TRIP / convmeter;
    metricTripKM = metrictripmeter / 1000;
    metricTripKMremain = metrictripmeter % 1000;  


    // okay, we're done updating distance variables...   
  } // end countupdate loop

// figure out current SPEED..   
  currentMillis = millis();
  if (currentMillis - previousMillis >= 50) {
    previousMillis = currentMillis;
    distcount = myEnc.read();
    ONETENTH[onetenthindex] = distcount - prevdistcount;
    onetenthindex++;
    if (onetenthindex >= 9){
      onetenthindex = 0;
    // upsate average array for display....
    countSum = 0;
    int i;
    for(i = 0; i < 10; i++){
      countSum += ONETENTH[i];                 // use countSum/10 to figure pulses per 50millisends....
      }
    }
    prevdistcount = distcount;
       
    /* 
     *  according to http://convert-to.com/conversion/speed/convert-mm-per-second-to-mi-per-hour.html
     *  1mm per second is .0022 miles per hour..
     *  
     *  10 pulsed * 10 * .0022 = miles perhour in REAL LIFE, then times 29 for 1:29th scale.
     *  50ms = 1/20 to go .5mm, so 1/10 == 1mm, so pulses counted in 50ms * 10 * conversion factor
     *  then * scale for accurate to scale reading...
     */

    // CALCULATE the current speed in both metric and imperial..
    float mphconstant = 0.0022;
    float kphconstant = 0.0036;
    int foo = abs(countSum/10);
    foom = foo * 10 * mphconstant * (scale/10.0);    // see above for math thoughts...
    fook = foo * 10 * kphconstant * (scale/10.0);  
  }

// print out, but not too often...
  if (screen == 0) {                                        // If we're in the main screen, print data...
    if (units == 0) {
      if (feetremain != prev_feetremain) {
        printodo(odometer, feetremain);                     // print out the imperial results...
        printtrip(tripmeter, tripfeet);                     // print out the imperial trip meter..
        prev_feetremain = feetremain;
      }
    }
    else {                                                  // print out the metric results...
      //if (metricodoKMremain != prev_metricodoKMremain) {
      if ((feetremain != prev_feetremain) || (metricodoKMremain != prev_metricodoKMremain)) {
        printmetricodo(metricodoKM, metricodoKMremain);
        printmetrictrip(metricTripKM, metricTripKMremain);   // print out the metric trip meter
        prev_metricodoKMremain = metricodoKMremain;
        prev_feetremain = feetremain;
        }
    }
    if (count != prev_count){
        printpulse(count);                                  // print out the current encoder position
        printtotal(cycle_count);                                    // print out the total number of pulses
        prev_count = count;
    }

    if (units == 0){
      if (foom != prev_foom){
        printspeedm(foom);                                  // print out the current speed...
        prev_foom = foom;
      }
    }
    else {
      if (fook != prev_fook) {
        printspeedk(fook);
        prev_fook = fook;
      }
    }
  }



// check to see if a the reset button is being pressed..
  if (screen == 0) {
    currentMillis = millis();
    if (currentMillis - previousMillis1 >= 200) {
      previousMillis1 = currentMillis;
      if ((TRIP > 0) && (screen == 0)) {
        boolean istouched = ts.touched();
        if (istouched) {
          TS_Point p = ts.getPoint();
          /*
          tft.setTextColor(ILI9341_BLUE);
          tft.setFont(Arial_8);
          tft.fillRect(220,10,100,20,ILI9341_BLACK);
          tft.setCursor(220, 10);
          tft.print(p.x);
          tft.setCursor(250, 10);
          tft.print(p.y);
          */
          if ((p.x >= 2400) && (p.x <= 3700) && (p.y >= 370) && (p.y <= 850)) {
            beep(30);
            TRIP = 0;
            previousTRIP = 0;
            metricTripKM = 0;
            metricTripKMremain = 0;

            if (units == 0) {
              printtrip(0, 0);                     // print out the RESET (ie; ZERO!) imperial trip meter..
            }
            else {
              printmetrictrip(0, 0);               // print out the RESET (ie; ZERO!) metric trip meter
            }
          }
        }
      }
    }
  }

// check the CONFIGURE button once and a while, and that should disable 
// main screen and take us to a scale selection menu..
  if (screen == 0 ) {
    currentMillis = millis();
    if (currentMillis - previousMillis2 >= 200) {
      previousMillis2 = currentMillis;
      boolean istouched = ts.touched();
      if (istouched) {
        TS_Point p = ts.getPoint();
        if ((p.x >= 580) && (p.x <= 1800) && (p.y >= 370) && (p.y <= 850)) {
          beep(30);
          screen = 1;                           // set which screen we should be displaying
          tft.fillScreen(ILI9341_BLUE);        // erase the screen
          ScaleSelectButtons();
          UnitSelectButtons();
          DisplayCurUnits();
          // now we're stuck with no data showing and now way to get back...
          //asdf//
        }
      }
    }
  }  // end configure button check...
  
  if (screen == 1) {                            // if we're in screen one, we should be watching screen 1 buttons..
    currentMillis = millis();
    if (currentMillis - previousMillis3 >= 200) {
      previousMillis3 = currentMillis;
      ispickingunit();                          // have we picked something?
      // help me figure out button touch zones, this code dies after that..
      /*
      boolean istouched = ts.touched();
      if (istouched) {
        TS_Point p = ts.getPoint();
        tft.setTextColor(ILI9341_BLUE);
        tft.setFont(Arial_10);
        tft.fillRect(210,220,100,19,ILI9341_BLACK);
        tft.setCursor(220, 224);
        tft.print(p.x);
        tft.setCursor(260, 224);
        tft.print(p.y);
      }
      */
    }
  }
}   // END void loop....

void ispickingunit(void) {
  boolean istouched = ts.touched();
  if (istouched) {
    TS_Point p = ts.getPoint();
    if (units !=1){
      if ((p.x >= 540 ) && (p.x <= 1650) && (p.y >= 1520) && (p.y <= 1950)) {
        beep(50);
        units = 1;
        framWriteByte(SAVEDUNITS, units);
        SPEEDunit[0] = 'K';
        DisplayCurUnits();
      }
    }

    if (units != 0) {
      if ((p.x >= 540) && (p.x <= 1650) && (p.y >= 800) && (p.y <= 1230)) {
        beep(50);
        units = 0;
        framWriteByte(SAVEDUNITS, units);
        SPEEDunit[0] = 'M';
        DisplayCurUnits();
      } 
    }
    if ((p.x >= 2100) && (p.x <= 3750) && (p.y >= 3300) && (p.y <= 3650)) {   // 1:32 scale button
      beep(30);
      scale = 320;
      //framWritelong(SAVEDSCALE, scale);
      framWriteByte(ALTSCALE, 0);
      tft.fillScreen(ILI9341_BLACK);
      drawmainscreen();
      resetbutton();
      configurebutton();
      scaleselectupdatedisplay();
    }
        if ((p.x >= 2100) && (p.x <= 3750) && (p.y >= 2600) && (p.y <= 3000)) {
      beep(30);
      scale = 290;
      //framWritelong(SAVEDSCALE, scale);
      framWriteByte(ALTSCALE, 0x01);
      tft.fillScreen(ILI9341_BLACK);
      drawmainscreen();
      resetbutton();
      configurebutton();
      scaleselectupdatedisplay();
    }
        if ((p.x >= 2100) && (p.x <= 3750) && (p.y >= 1850) && (p.y <= 2250)) {
      beep(30);
      scale = 240;
      //framWritelong(SAVEDSCALE, scale);
      framWriteByte(ALTSCALE, 0x02);
      tft.fillScreen(ILI9341_BLACK);
      drawmainscreen();
      resetbutton();
      configurebutton();
      scaleselectupdatedisplay();
    }
    if ((p.x >= 2100) && (p.x <= 3750) && (p.y >= 1150) && (p.y <= 1500)) {
      beep(30);
      scale = 225;
      //framWritelong(SAVEDSCALE, scale);
      framWriteByte(ALTSCALE, 0x03);
      tft.fillScreen(ILI9341_BLACK);
      drawmainscreen();
      resetbutton();
      configurebutton();
      scaleselectupdatedisplay();
    }
    if ((p.x >= 2100) && (p.x <= 3750) && (p.y >= 400) && (p.y <= 800)) {
      beep(30);
      scale = 203;
      //framWritelong(SAVEDSCALE, scale);
      framWriteByte(ALTSCALE, 0x04);
      tft.fillScreen(ILI9341_BLACK);
      drawmainscreen();
      resetbutton();
      configurebutton();
      scaleselectupdatedisplay();
    }
  }
}

void scaleselectupdatedisplay(void){
      changescale = true;
      if (units == 0) {
        printodo(odometer, feetremain);
      }
      else {
        printmetricodo(metricodoKM, metricodoKMremain);
      }
      if (units == 0){
        printtrip(tripmeter, tripfeet);
      }
      else {
        printmetrictrip(metricTripKM, metricTripKMremain);
      }
      printtotal(cycle_count);
      //printtotal();
      if (units == 0) {
        printspeedm(foom);
      }
      else {
        printspeedk(fook);
      }
      screen = 0;
}

void drawmainscreen(void) {                   // draw the main data screen with space for some touch buttons..

  tft.fillScreen(ILI9341_BLACK);              // erase the entire screen!
  tft.setFont(Arial_16);
  tft.setCursor(115, 32);
  tft.setTextColor(ILI9341_YELLOW);
  tft.print(SPEEDunit);
  tft.setCursor(173, 32);
  tft.print("@ ");
  tft.setCursor(200, 32);
  float foo = scale/10.0;
  tft.printf("1:%2.1f", foo);
  //tft.print(foo);
  tft.setCursor(265, 32);
  tft.print("scale");
  // now create a defining line between speed and other data...
  tft.fillRect(0, 57, 340, 4, ILI9341_CYAN);
  tft.fillRect(0, 90, 340, 1, ILI9341_CYAN);
  tft.fillRect(0, 120, 340, 1, ILI9341_CYAN);
  tft.fillRect(0, 150, 340, 1, ILI9341_CYAN);
  tft.fillRect(0, 180, 340, 1, ILI9341_CYAN);

  // now some data LABELS...
  // Start with the odometer reading..
  tft.setTextColor(ILI9341_YELLOW);
  tft.setFont(Arial_12);
  tft.setCursor(5, 70);
  tft.print("Odometer:");
  // Then a trip meeter..
  tft.setFont(Arial_12);
  tft.setCursor(5, 100);
  tft.print("Tripmeter:");
  // The raw data from the encoder..
  tft.setFont(Arial_12);
  tft.setCursor(5, 130);
  tft.print("Raw Encoder Data:");
  // The total number of pulses..
  tft.setFont(Arial_12);
  tft.setCursor(5, 160);
  tft.print("Total Encoder Count:");
}

void printodo(unsigned long odometer, int feetremain){                // print out the total odometer in miles and feet
  tft.setTextColor(ILI9341_GREEN);
  tft.setFont(Arial_12);
  tft.fillRect(94, 70, 320, 16, ILI9341_BLACK);
  tft.setCursor(95, 71);
  tft.printf("%05d Miles %d Feet", odometer, feetremain);
}

void printmetricodo(unsigned long metricodometer, int metricodometerremain){ // print metric odemeter..
  tft.setTextColor(ILI9341_GREEN);
  tft.setFont(Arial_12);
  tft.fillRect(94, 70, 320, 16, ILI9341_BLACK);
  tft.setCursor(95, 71);
  tft.printf("%d Kilometers %03.2d Meters", metricodometer, metricodometerremain);
  //tft.print(metricodometer); // print metric odometer
}

void printmetrictrip(unsigned long metricodometer, int metricodometerremain){ // print metric trip meter..
  tft.setTextColor(ILI9341_GREEN);
  tft.setFont(Arial_12);
  tft.fillRect(94, 100, 320, 16, ILI9341_BLACK);
  tft.setCursor(95, 101);
  tft.printf("%d Kilometers %03.2d Meters", metricodometer, metricodometerremain);
  //tft.print(metricodometer);
}

void printtrip(int tripmeter, int tripfeet){                  // Print out the trip meter details in miles and feet
  tft.setTextColor(ILI9341_GREEN);
  tft.setFont(Arial_12);
  tft.fillRect(94, 100, 320, 16, ILI9341_BLACK);
  tft.setCursor(95, 101);
  tft.printf("%d Miles %d Feet", tripmeter, tripfeet);
}

void printtotal(unsigned long ODO){                           // Print out the total number of pulses..
    tft.setTextColor(ILI9341_GREEN);
    tft.setFont(Arial_12);
    tft.fillRect(160, 160, 320, 16, ILI9341_BLACK);
    tft.setCursor(200, 161);
    tft.printf("%12d", ODO);
}

void printspeedm(int foom){                                   // mile or imperial or whatever...
  int foomi = (int)foom;
  tft.setTextColor(ILI9341_GREEN);
  tft.fillRect(10, 10, 100, 40, ILI9341_BLACK);
  tft.setFont(CourierNew_40_Bold);
  tft.setCursor(10, 15);
  tft.printf("%3d", foomi);
}

void printspeedk(int fook){                                   // metric
  int fooki = (int)fook;
  tft.setTextColor(ILI9341_GREEN);
  tft.fillRect(10, 10, 100, 40, ILI9341_BLACK);
  tft.setFont(CourierNew_40_Bold);
  tft.setCursor(10, 15);
  tft.printf("%3d", fooki);
}

void printpulse(long count){                                  // total pulse count since power on..
  tft.fillRect(149, 130, 170, 16, ILI9341_BLACK);
  tft.setTextColor(ILI9341_GREEN);
  tft.setFont(Arial_12);
  tft.setCursor(150, 132);
  tft.printf("%16d", count);
}

void resetbutton(void){                                       // a reset button for the trip meter
  tft.fillRoundRect(8, 193, 125, 40, 4, ILI9341_LIGHTGREY);
  tft.fillRoundRect(10, 195, 121, 36, 4, ILI9341_GREEN);
  tft.setTextColor(ILI9341_BLACK);
  tft.setFont(CourierNew_12_Bold);
  tft.setCursor(20, 200);
  tft.print("Reset Trip");
  tft.setCursor(43, 216);
  tft.print("Meter");
}

void configurebutton(void){                                   // a configure button
  tft.fillRoundRect(178, 193, 125, 40, 4, ILI9341_LIGHTGREY);
  tft.fillRoundRect(180, 195, 121, 36, 4, ILI9341_GREEN);
  tft.setTextColor(ILI9341_BLACK);
  tft.setFont(CourierNew_12_Bold);
  tft.setCursor(196, 200);
  tft.print("Configure");
  tft.setCursor(215, 216);
  tft.print("Scale");
}

void framWritelong(uint16_t address, unsigned long value) {   // write a long to four consecutive bytes.
  byte four = (value & 0xFF);
  byte three = ((value >> 8) & 0xFF);
  byte two = ((value >> 16) & 0xFF);
  byte one = ((value >> 24) & 0xFF);
  fram.writeEnable(true);                              //Write the 4 bytes into the eeprom memory.
  fram.write8(address, four);
  fram.writeEnable(false);
  fram.writeEnable(true);
  fram.write8(address + 1, three);
  fram.writeEnable(false);
  fram.writeEnable(true);
  fram.write8(address + 2, two);
  fram.writeEnable(false);
  fram.writeEnable(true);
  fram.write8(address + 3, one);
  fram.writeEnable(false);
}

void framWriteByte(uint16_t address, uint8_t value) {         // write a single byte..
  fram.writeEnable(true);
  fram.write8(address, value);
  fram.writeEnable(false);
}

unsigned long framReadlong(uint16_t address) {                 //Read the 4 bytes from the eeprom memory.
  long four = fram.read8(address);
  long three = fram.read8(address + 1);
  long two = fram.read8(address + 2);
  long one = fram.read8(address + 3);
  //Return the recomposed long by using bitshift.
  return ((four << 0) & 0xFF) + ((three << 8) & 0xFFFF) + ((two << 16) & 0xFFFFFF) + ((one << 24) & 0xFFFFFFFF);
}

uint8_t framReadByte(uint16_t address) {                       // read single byte
  return fram.read8(address);
}

void beep(int beeptime) {                                      // Elemental Beep function - not much going on here anyway...
  digitalWrite(beepPin, LOW);
  delay(beeptime);                                // cause we just don't care, just make it beep the old fashioned way...
  digitalWrite(beepPin, HIGH);
}

void ScaleSelectButtons(void){                    // draw a bunch of buttons for picking the scale..
  unsigned long border = ILI9341_BLACK;
  unsigned long fill = ILI9341_GREEN;
  int button1ulx = 10;
  int button1uly = 5;
  int buttonlength = 160;
  int buttondepth = 34;
  int buttoncornerradius = 4;
  int buttonpad = 48;
  int bmainxoff = 8;
  int bmainyoff = 8;
  int bsubxoff = 68;
  int bsubyoff = 15;
  unsigned long bmaincolor = ILI9341_BLACK;
  #define bmainfont Arial_18
  unsigned long bsubcolor = ILI9341_BLACK;
  #define bsubfont Arial_10

  tft.fillRoundRect(button1ulx, button1uly, buttonlength, buttondepth, buttoncornerradius, border);
  tft.fillRoundRect(button1ulx+2, button1uly+2, buttonlength-4, buttondepth-4, buttoncornerradius, fill);  
  // label in way I can copy and paste...
  tft.setTextColor(bmaincolor);
  tft.setFont(bmainfont);
  tft.setCursor(button1ulx+bmainxoff, button1uly+bmainyoff);
  tft.print("1:32");
  tft.setFont(bsubfont);
  tft.setCursor(button1ulx+bsubxoff, button1uly+bsubyoff);
  tft.print("Gauge One");


  button1uly = button1uly + buttonpad;
  tft.fillRoundRect(button1ulx, button1uly, buttonlength, buttondepth, buttoncornerradius, border);
  tft.fillRoundRect(button1ulx+2, button1uly+2, buttonlength-4, buttondepth-4, buttoncornerradius, fill);  
  // label in way I can copy and paste...
  tft.setTextColor(bmaincolor);
  tft.setFont(bmainfont);
  tft.setCursor(button1ulx+bmainxoff, button1uly+bmainyoff);
  tft.print("1:29");
  tft.setFont(bsubfont);
  tft.setCursor(button1ulx+bsubxoff, button1uly+bsubyoff);
  tft.print("\'A\' Scale");

  button1uly = button1uly + buttonpad;
  tft.fillRoundRect(button1ulx, button1uly, buttonlength, buttondepth, buttoncornerradius, border);
  tft.fillRoundRect(button1ulx+2, button1uly+2, buttonlength-4, buttondepth-4, buttoncornerradius, fill);  
  // label in way I can copy and paste...
  tft.setTextColor(bmaincolor);
  tft.setFont(bmainfont);
  tft.setCursor(button1ulx+bmainxoff, button1uly+bmainyoff);
  tft.print("1:24");
  tft.setFont(bsubfont);
  tft.setCursor(button1ulx+bsubxoff, button1uly+bsubyoff);
  tft.print("\'H\' Scale");

  button1uly = button1uly + buttonpad;
  tft.fillRoundRect(button1ulx, button1uly, buttonlength, buttondepth, buttoncornerradius, border);
  tft.fillRoundRect(button1ulx+2, button1uly+2, buttonlength-4, buttondepth-4, buttoncornerradius, fill);  
  // label in way I can copy and paste...
  tft.setTextColor(bmaincolor);
  tft.setFont(bmainfont);
  tft.setCursor(button1ulx+bmainxoff, button1uly+bmainyoff);
  tft.print("1:22.5");
  tft.setFont(bsubfont);
  tft.setCursor(button1ulx+bsubxoff+20, button1uly+bsubyoff);   // special case
  tft.print("\'G\' Scale");

  button1uly = button1uly + buttonpad;
  tft.fillRoundRect(button1ulx, button1uly, buttonlength, buttondepth, buttoncornerradius, border);
  tft.fillRoundRect(button1ulx+2, button1uly+2, buttonlength-4, buttondepth-4, buttoncornerradius, fill);  
  // label in way I can copy and paste...
  tft.setTextColor(bmaincolor);
  tft.setFont(bmainfont);
  tft.setCursor(button1ulx+bmainxoff, button1uly+bmainyoff);
  tft.print("1:20.3");
  tft.setFont(bsubfont);
  tft.setCursor(button1ulx+bsubxoff+20, button1uly+bsubyoff);    // special case
  tft.print("\'F\' Scale");
  
}

void UnitSelectButtons(void){                     // Draw unit select buttons on config screen...
  unsigned long border = ILI9341_BLACK;
  unsigned long fill = ILI9341_GREEN;
  int button1ulx = 200;
  int button1uly = 120;
  int buttonlength = 110;
  int buttondepth = 38;
  int buttoncornerradius = 3;
  int buttonpad = 48;
  int bmainxoff = 10;
  int bmainyoff = 10;
  int bsubxoff = 68;
  int bsubyoff = 15;
  unsigned long bmaincolor = ILI9341_BLACK;
  #define bmainfont Arial_18
  unsigned long bsubcolor = ILI9341_BLACK;
  #define bsubfont Arial_10

  tft.fillRoundRect(button1ulx, button1uly, buttonlength, buttondepth, buttoncornerradius, border);
  tft.fillRoundRect(button1ulx+2, button1uly+2, buttonlength-4, buttondepth-4, buttoncornerradius, fill);  
  // label in way I can copy and paste...
  tft.setTextColor(bmaincolor);
  tft.setFont(bmainfont);
  tft.setCursor(button1ulx+bmainxoff+8, button1uly+bmainyoff);
  tft.print("Metric");

  button1uly = button1uly + buttonpad;
  tft.fillRoundRect(button1ulx, button1uly, buttonlength, buttondepth, buttoncornerradius, border);
  tft.fillRoundRect(button1ulx+2, button1uly+2, buttonlength-4, buttondepth-4, buttoncornerradius, fill);  
  // label in way I can copy and paste...
  tft.setTextColor(bmaincolor);
  tft.setFont(bmainfont);
  tft.setCursor(button1ulx+bmainxoff, button1uly+bmainyoff);
  tft.print("Imperial");

}

void DisplayCurUnits(void){
  int messl1xoff = 200;
  int messl1yoff = 10;
  int messl2xoff = 195;
  int messl2yoff = 70;
  int messl3xoff = 195;
  int messl3yoff = 90;
  int messl4xoff = 195;
  int messl4yoff = 208;

  #define messfont Arial_12
  #define versfont Arial_8
  unsigned long messagecolor = ILI9341_GREENYELLOW;
  unsigned long verscolot = ILI9341_BLACK;
  //tft.fillRect(messl1xoff, messl1yoff, 100, 40, ILI9341_BLUE);

  tft.setTextColor(messagecolor);
  tft.setFont(messfont);
  tft.setCursor(messl1xoff,messl1yoff);
  tft.print("Current Units:");
  if (units == 0) {
    tft.fillRect(messl1xoff,messl1yoff+20,100,30, ILI9341_BLUE);
    tft.setCursor(messl1xoff,messl1yoff+20);
    tft.setFont(Arial_20);
    tft.setTextColor(ILI9341_YELLOW);
    tft.print("Imperial");
  }
  else {
    tft.fillRect(messl1xoff,messl1yoff+20,100,30, ILI9341_BLUE);
    tft.setCursor(messl1xoff,messl1yoff+20);
    tft.setFont(Arial_20);
    tft.setTextColor(ILI9341_YELLOW);
    tft.print("Metric");
  }
  tft.setTextColor(messagecolor);
  tft.setFont(messfont);
  tft.setCursor(messl2xoff+8,messl2yoff);
  tft.print("Select Units");
  tft.setFont(AwesomeF100_18);
  tft.setCursor(messl2xoff+100,messl2yoff+3);
  tft.print((char)73);
  tft.setFont(AwesomeF100_20);
  tft.setCursor(messl3xoff-20,messl3yoff-1);
  tft.print((char)119);
  tft.setCursor(messl3xoff+10,messl3yoff+4);
  tft.setFont(messfont);
  tft.print("..then Scale");
  tft.setFont(versfont);
  tft.setTextColor(verscolot);
  tft.setCursor(messl4xoff,messl4yoff);
  tft.print("FW Version: ");
  tft.setCursor(messl4xoff+70,messl4yoff);
  tft.print(version);
  tft.setCursor(messl4xoff,messl4yoff+11);
  tft.print("Designer: Eric Timberlake");
  tft.setCursor(messl4xoff,messl4yoff+22);
  tft.print("Serial Number: TDC0001");                     // In config screen, display currently selected units and version data..
}



