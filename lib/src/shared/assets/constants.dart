class Constants {
  static const JSON_FORM_RESPONSE = {
    "data": {
      "fields": [
        {
          "name": "Name For placeholder field",
          "type": "input",
          "defaultValue": "test",
          "validations":[
            "empty"
          ]
        },
        {
          "name": "Name For placeholder field2",
          "type": "input",
          "defaultValue": "test",
          "optional":true
        },
        {
          "name": "Name For placeholder field",
          "type": "select",
          "defaultValue": "test"
        }
      ]
    }
  };

  static const JSON_SCOND_PAGE_RESPONSE = {
    "data": {
      "fields": [
        {
          "type": "container", //Mandatory // It can be text,row, column, image or any widget and we can define handlers for them in util file
          "priorityOnPage":2, //It Signifies at which place or after which widget this container should come // Optional
          "typeOfWidgetsInside":["text","row"], // Optional
          "position":"left",// Mandatory and It can be left, center, bottom, top, bottom-center, top-center,random
          "numberOfWidgetsInside":1, //Optional
          "properties":[ // Optional- It defines different key value pair based props of widget which states it can contain decoration properties for container and style properties for text and so on that kind of relevant content
            {
              "key":"textColor",
              "value":"30"
            }
          ],
          "data": { //Optional If type is form
            "fields": [
              {
                "name": "Name For placeholder field",
                "type": "input",
                "defaultValue": "test",
                "validations":[
                  "empty"
                ]
              },
              {
                "name": "Name For placeholder field2",
                "type": "input",
                "defaultValue": "test",
                "optional":true
              },
              {
                "name": "Name For placeholder field",
                "type": "select",
                "defaultValue": "test"
              }
            ]
          },
          "align": { //Mandatory if position is random
            "top": 50,
            "right": 10,
            "alignUnit":"px",
          },
          "widgetsConf":[ //Optional
            {
              "type":"row",
              "position":"left",// It can be left, center, bottom, top, bottom-center, top-center,random,
              "align": {
                "top": 50,
                "right": 10
              },
              "alignUnit":"px", //or em
              "numberOfWidgetsInside":1,
              "widgetsConf":[
                {
                  "type":"text", //value can be text or image or any other type which can be defined
                  "position":"left",// It can be left, center, bottom, top, bottom-center, top-center,random,
                  "align": {
                    "top": 50,
                    "right": 10
                  },
                  "properties":[
                    {
                      "key":"color",
                      "value":"30"
                    }
                  ],
                  "alignUnit":"px", //or em
                  "label":"text"
                },
              ]
            }
          ]
        }
      ]
    }
  };
}
