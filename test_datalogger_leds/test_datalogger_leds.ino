/****
 The Adafruit data logger shield has a green and red LED
 I used jumpers to connect 
    - green led to digital pin 3
    - red LED to digital pin 2
 This sketch is just to test that they work
****/

const int greenLED = 3, redLED = 2;
const int delayTime = 2000;

void setup() {
  Serial.begin(9600);
  pinMode(greenLED, OUTPUT);
  pinMode(redLED, OUTPUT);
}

void loop() {
  Serial.println("Red");
  digitalWrite(redLED, HIGH);
  digitalWrite(greenLED, LOW);
  delay(delayTime);
  
  Serial.println("Green");
  digitalWrite(redLED, LOW);
  digitalWrite(greenLED, HIGH);
  delay(delayTime);
}
