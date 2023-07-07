
/*
 *  Publish sensor readings.
 */

#include <SPI.h>
#include <ESP8266WiFi.h>
#include <PubSubClient.h>

const char ssid[] = "YOUR_SSID";
const char password[] = "YOUR_PASSWORD";

WiFiClient client;

bool configureNetwork()
{
  WiFi.mode(WIFI_STA);
  WiFi.begin(ssid, password);
  while (WiFi.status() != WL_CONNECTED) // Wait for connection
  {
    delay(1000);
    Serial.print("Waiting for connection to "); Serial.println(ssid);
  }
  return true;
}

const char* broker = "mqtt.eclipseprojects.io"; // the address of the MQTT broker

const int interval = 5000;   // milliseconds between events
unsigned int timePublished;  // millis time of most recent publish

PubSubClient psclient(client);

void setup()
{
  Serial.begin(9600);
  if (!configureNetwork()) // Start the network
  {
    Serial.println("Failed to configure the network");
    while(1)
      delay(0); // halt
  }
  psclient.setServer(broker, 1883);
}

void loop(void)
{
  if (millis() - timePublished > interval) 
  {
    if (!psclient.connected())
      psclient.connect("introduction_to_sqlite");
    if (psclient.connected()) 
    {
      int val = analogRead(A0);
      psclient.publish("introduction_to_sqlite/alog", String(val).c_str());
      timePublished = millis();
      Serial.print("Published "); Serial.println(val);
    }
  }
  if (psclient.connected())
    psclient.loop();
}