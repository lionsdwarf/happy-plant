# Happy Plant.r

General Overview

Reminder tool that sends plant owners MMS notifications to water their house plants. Plants are given profiles with pre-defined watering schedules. MMS is delevered per-plant according to it's "stamina" property defining it's thirst frequency. Multiple MMS recipients can be added in case a firend or housekeeper requires notification.

Techincal Overview

A custom rake task examines a postgres database to determine whether any notifications are due. To send notifications, the server makes a post request to the Twilio API which then distributes the MMS. Frontend rendered via rilas forms. 

NOTE: Due to expiration of my free Twilio account, this mms service is no longer active.
