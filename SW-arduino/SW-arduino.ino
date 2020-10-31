#include <NeoSWSerial.h>
#include <WiFiEspAT.h>
#include <EEPROM.h>

#define RPIN    PD6
#define GPIN    PD5
#define BPIN    PB1
#define STATPIN PC0

#define RXPIN   PD2
#define TXPIN   PD3

#define COL_WARM_WHITE_R 255
#define COL_WARM_WHITE_G 75
#define COL_WARM_WHITE_B 15

#define EE_R_ADDR           11
#define EE_G_ADDR           12
#define EE_B_ADDR           13
#define EE_BR_ADDR          15
#define EE_MODE_ADDR        21
#define EE_FIRSTBOOT_ADDR   31

const char ssid[] = "308 (Formerly Bobby T's)";
const char pass[] = "BrothersisBetter";

#define HOSTNAME    "espRGB_kitchen"

NeoSWSerial esp(RXPIN,TXPIN);
WiFiServer server(80);

// ESP variables
int espStatus;
int srvReqCnt = 0;

// Serial Comm Variables
const byte recvSize = 32;
char recvBuf[recvSize];
bool recvMsg = false;

/**
 * @brief clears the terminal window
 */
void clearTerm() {
    Serial.write(27); // ESC
    Serial.print("[2J"); // clear screen
    Serial.write(27); // ESC
    Serial.print("[H"); // cursor to home
}

/** 
 * @brief initializes OSC1 for PWM on pin PB1
 */
void pwmInitOSC1A() {
    // Init pin PB1 as output
    DDRB |= B00000010;
    // OSC1 PWM Init
    TCCR1A |= (1<<COM1A1)|(1<<WGM10);    // OCR1A in normal mode, phase-corrected PWM
    TCCR1B |= (1<<CS11);                 // CLK/8 prescaler
}

/**
 * @brief sets output to an RGB value
 * @param R red value (0-255)
 * @param G green value (0-255)
 * @param B blue value (0-255)
 * @param save whether to save settings to EEPROM
 */
void setRGB(char R, char G, char B, bool save) {
    Serial.print("Setting RGB:");
    Serial.print(R);
    Serial.print(" ");
    Serial.print(G);
    Serial.print(" ");
    Serial.println(B);
    // set our PWM outputs
    analogWrite(RPIN,R);
    analogWrite(GPIN,G);
    OCR1A = B;
    // save our values to EEPROM if desired
    if (save) {
        EEPROM.write(EE_MODE_ADDR, 0);  // mode 0, RGB
        EEPROM.write(EE_R_ADDR, R);     // R byte
        EEPROM.write(EE_G_ADDR, G);     // G byte
        EEPROM.write(EE_B_ADDR, B);     // B byte
    }
}

/**
 * @brief sets output color to a warm white
 * @param brightness scale factor (0-1) for brightness of output
 * @param save whether to save settings to EEPROM
 */
void setWarm(char brightness, bool save) {
    float bFloat = (float)brightness / 255.0;
    setRGB( COL_WARM_WHITE_R * bFloat,
            COL_WARM_WHITE_G * bFloat,
            COL_WARM_WHITE_B * bFloat,
            false);
    // save values to EEPROM
    if (save) {
        EEPROM.write(EE_MODE_ADDR, 1);          // mode 1, warm white
        EEPROM.write(EE_B_ADDR, brightness);    // brightness byte
    }
}

void startupColor() {
    // read what mode we're in
    char mode = EEPROM.read(EE_MODE_ADDR);
    switch (mode) {
        case 0: { // RGB mode
            Serial.println("starting in RGB mode");
            char EE_R = EEPROM.read(EE_R_ADDR);
            char EE_G = EEPROM.read(EE_G_ADDR);
            char EE_B = EEPROM.read(EE_B_ADDR);
            setRGB(EE_R, EE_G, EE_B, false);
            break;
        }
        case 1: { // warm white mode
            Serial.println("starting in warm white mode");
            char bright = EEPROM.read(EE_BR_ADDR);
            setWarm(bright, false);
            break;
        }
    }
}

/**
 * @brief processes serial commands from the PC
 */
void recvSerialCmd() {
    // wait a second for any more data
    delay(5);
    statLed(true);
    const char eol = '\n';
    char rc;
    int idx = 0;
    while (Serial.available() > 0 && !recvMsg) {
        rc = Serial.read();
        if (rc != eol) {
            recvBuf[idx] = rc;
            idx++;
            if (idx >= recvSize) {
                idx = recvSize - 1;
            }
        } else {
            recvBuf[idx] = '\0';
            idx = 0;
            recvMsg = true;
        }
    }
}

/**
 * @brief processes recieved serial data from PC
 */
void procSerialCmd() {
    if (recvMsg) {
        Serial.print(" PC>>MCU: ");
        Serial.println(recvBuf);
        statLed(false);
        recvMsg = false;
        // actual command processing
    }
}

/**
 * @brief turns the status LED on or off
 * @param state LED state
 */
void statLed(bool state) {
    if (state) {
        PORTC = PORTC & ~(1 << PINC0);
    }
    else {
        PORTC = PORTC | (1 << PINC0);
    }
}

/**
 * @brief error LED loop function for fatal errors
 * @param flashes number of LED flashes
 * @param period delay between flashes
 */
void errorLoop(int flashes, int period) {
    while(1) {
        for (int i=0;i<flashes;i++) {
            delay(period);
            statLed(true);
            delay(period);
            statLed(false);
        }
        delay(1000);
    }
}

/**
 * @brief processes a GET string
 * @param getStr string that contains the GET request line
 * @cite https://stackoverflow.com/questions/24696113/how-to-find-text-between-two-strings-in-c
 */
void recvGET(String getStr) {
    // valid characters for terminating get parameters
    const char *endPattern1 = " ";  // end of request
    const char *endPattern2 = "&";  // next parameter
    // convert our String to a c character array
    char lineBuf[64];
    getStr.toCharArray(lineBuf,64);
    Serial.print("Processing GET request: ");
    Serial.println(lineBuf);

    // check if we have an RGB command in the string
    if (strstr(lineBuf, "rgb=") != NULL) {
        Serial.print("found RGB command: ");
        // isolate the RGB command (this is from the stackexchange article)
        const char *startPattern = "rgb=";
        char *target = NULL;
        char *start, *end;
        // find the beginning
        if (start = strstr(lineBuf,startPattern)) {
            start += strlen(startPattern);
            // testing end pattern 1
            if (end = strstr( start, endPattern1)) {
                target = (char*)malloc(end-start+1);
                memcpy(target, start, end-start);
                target[end-start] = '\0';
            // testing end pattern 2
            } else if (end = strstr (start, endPattern2)) {
                target = (char*)malloc(end-start+1);
                memcpy(target, start, end-start);
                target[end-start] = '\0';
            }
        }
        // if we found a valid rgb string, process it
        if (target) {
            // extract the three RGB values
            char *delim;
            // extract R
            delim = strtok(target,",");
            int getR = atoi(delim);
            Serial.print("R:");
            Serial.print(getR);
            // extract G
            delim = strtok(NULL,",");
            int getG = atoi(delim);
            Serial.print(" G:");
            Serial.print(getG);
            // extract B
            delim = strtok(NULL,",");
            int getB = atoi(delim);
            Serial.print(" B:");
            Serial.println(getB);
            // cleanup
            free(target);
            // set the new RGB values
            setRGB(getR,getG,getB,true);
        }
    } 
    // if we don't have an RGB string, see if we have a warm white string (RGB takes precedence)
    else if (strstr(lineBuf, "warm=") != NULL) {
        Serial.print("found warm white command: ");
        // isolate the RGB command (this is from the stackexchange article)
        const char *startPattern = "warm=";
        char *target = NULL;
        char *start, *end;
        // find the beginning
        if (start = strstr(lineBuf,startPattern)) {
            start += strlen(startPattern);
            // testing end pattern 1
            if (end = strstr( start, endPattern1)) {
                target = (char*)malloc(end-start+1);
                memcpy(target, start, end-start);
                target[end-start] = '\0';
            // testing end pattern 2
            } else if (end = strstr (start, endPattern2)) {
                target = (char*)malloc(end-start+1);
                memcpy(target, start, end-start);
                target[end-start] = '\0';
            }
        }
        // if we found a valid warm white string, process it
        if (target) {
            // extract the brightness
            char getBright = atoi(target);
            Serial.print("Brightness: ");
            Serial.print(getBright);
            // cleanup
            free(target);
            // set the new RGB values
            setWarm(getBright,true);
        }
    }
}

void setup() { 
    // Start serial
    Serial.begin(19200);
    //clearTerm();
    Serial.println("");
    Serial.println("");
    Serial.println("");
    Serial.println("Starting up");
    // initialize PD5&6
    pinMode(RPIN,OUTPUT);
    pinMode(GPIN,OUTPUT);
    // initialize PC0
    DDRC |= B00000001;
    statLed(false);
    // initialize PB1
    pwmInitOSC1A();
    // start ESP serial
    esp.begin(9600);
    // set output from EEPROM if this isn't the first boot (default EEPROM values are 0xFF)
    char firstBoot = EEPROM.read(EE_FIRSTBOOT_ADDR);
    if (!firstBoot) {
        startupColor();
    } else {
        Serial.println("first boot, initializing EEPROM");
        EEPROM.write(EE_FIRSTBOOT_ADDR,0);  // write a zero
        setRGB(0,0,0,true);
    }
    // initialization done
    Serial.println("Powerup complete");
    delay(1000);
    // connect to esp
    Serial.println("Initiazling ESP");
    WiFi.init(esp);
    if (WiFi.status() == WL_NO_MODULE) {
        Serial.println("can't connect to ESP8266");
        errorLoop(1,250);
    }
    // Set hostname
    WiFi.hostname(HOSTNAME);
    // Connect to WiFI network
    Serial.println("Connecting to WIFI network: " + String(ssid));
    while (espStatus != WL_CONNECTED) {
        espStatus = WiFi.begin(ssid, pass);
    }
    IPAddress ip = WiFi.localIP();
    Serial.print("IP: ");
    Serial.println(ip);
    // Start server
    Serial.println("Starting ESP webserver");
    server.begin();
    // Done with setup
    Serial.println("Entering loop");
}

void loop() {
    // Process serial command first
    if (Serial.available()) {
        recvSerialCmd();
        procSerialCmd();
    }
    // now process server request
    WiFiClient client = server.available();
    if (client) {
        IPAddress ip = client.remoteIP();
        Serial.print("new client ");
        Serial.println(ip);

        while (client.connected()) {
            if (client.available()) {
                String line = client.readStringUntil('\n');
                line.trim();
                //Serial.println(line);
            
                // Process the GET header
                if(line.startsWith("GET")) {
                    // send the request to the GET processor
                    recvGET(line);
                }

                // if you've gotten to the end of the HTTP header (the line is blank),
                // the http request has ended, so you can send a reply
                if (line.length() == 0) {
                    // send a standard http response header
                    client.println("HTTP/1.1 200 OK");
                    client.println("Content-Type: text/html");
                    client.println("Connection: close");  // the connection will be closed after completion of the response
                    //client.println("Refresh: 20");  // refresh the page automatically every 5 sec
                    client.println();
                    client.println("<!DOCTYPE HTML>");
                    client.println("<html>");
                    // get current settings
                    char curMode = EEPROM.read(EE_MODE_ADDR);
                    // mode
                    client.print("Mode: ");
                    client.print(curMode);
                    client.print(" ");
                    switch (curMode) {
                        case 0: {
                            client.print("RGB (");
                            int curR = EEPROM.read(EE_R_ADDR);
                            int curG = EEPROM.read(EE_G_ADDR);
                            int curB = EEPROM.read(EE_B_ADDR);
                            client.print(curR);
                            client.print(",");
                            client.print(curG);
                            client.print(",");
                            client.print(curB);
                            client.print(")");
                            break;
                        }
                        case 1: {
                            client.print("Warm White (");
                            char curBr = EEPROM.read(EE_BR_ADDR);
                            client.print(curBr);
                            client.print(")");
                            break;
                        }
                    }
                    client.print("<br/>");
                    client.println("</html>");
                    client.flush();
                    break;
                }
            }
        }
        // close the connection:
        client.stop();
        Serial.println("client disconnected");
    }
}