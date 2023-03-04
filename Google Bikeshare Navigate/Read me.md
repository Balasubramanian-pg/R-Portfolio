

Scenario:

You are a junior data analyst working in a bike-share company in Chicago. your team wants to understand how casual riders and annual members use Cyclistic bikes differently.

The marketing analyst team needs to better understand

    how annual members and casual riders differ,
    why casual riders would buy a membership, and
    how digital media could affect their marketing tactics.

The director of marketing has assigned you the first question to answer:

    How do annual members and casual riders use Cyclistic bikes differently?

# Case Study Roadmap - Ask

Guiding questions

    What is the problem you are trying to solve?

To find how casual riders and anual members use the services differently.

    How can your insights drive business decisions?

Insights will show how each rider type use the services differently, if there will be a benefit converting the casual riders to annual members.

Key tasks

Identify the business task:
Find how casual riders use the service differently from the annual members. (Initial thoughts on what may be different: patterns, reasons, duration, distance, time of the day, day of the week, month of the year, locations.)

Consider key stakeholders:
Analytics team, marketing team, director of marketing.

Deliverable:

A clear statement of the business task:

    Report showing how a casual rider uses the bikes differently than an annual member.

# Case Study Roadmap - Prepare

Guiding questions

    Where is your data located?

Cyclistic’s historical trip data. Download 12 months of Cyclistic trip data here.

    How is the data organized?
    Data is organized in monthly trip data based on start date. Each month's data is in different csv file. I used 12 months of data from 2022 January to 2022 December.

    Are there issues with bias or credibility in this data? Does your data ROCCC?

Data is provided free with a limited license. It doesn't have any personal information. ROCCC assumed (Reliable, Original, Comprehensive, Current, Cited)

    How are you addressing licensing, privacy, security, and accessibility?

(The data has been made available by Motivate International Inc. under this licence

    How did you verify the data’s integrity?
    Assumed.
    How does it help you answer your question?
    Analyze phase.
    Are there any problems with the data?
        September data name is different from others.

# Case Study Roadmap - Process

Guiding questions

    What tools are you choosing and why?
    Initially I chose google sheets. I started using a single month. Even then the operations were slow. But it helped me to see some issues visually. Such as: missing values in start station, end station. Very long ride lengths, sometimes over a week. Then I switched to R.
    Have you ensured your data’s integrity?
    What steps have you taken to ensure that your data is clean? Assumed
    How can you verify that your data is clean and ready to analyze? Documented below
    Have you documented your cleaning process so you can review and share those results? Documented below

Key tasks

# Deliverable Documentation of any cleaning or manipulation of data:

    Downloaded last 12 months data from the link. 2022 February till 2023 January. Uploaded this to my google drive to use with google sheets. It takes 40 seconds to upload.
    Take 2023 January File to work on initially. To open a file initially takes 60 seconds as it is converted from cvs to google sheets format.<
    There are 13 columns:
    ride_id: 16 digit hex unique ride id (65DBD2F447EC51C2)
    rideable_type: 3 choices (classic_bike, docked_bike, electric_bike)
    started_at: date and time (12/5/2022 10:47:18)
    ended_at: date and time (12/5/2022 10:56:34)
    start_station_name: intersection of 2 streets (Clifton Ave & Armitage Ave)
    start_station_id: unique? station id, 2 different formats (TA1307000163) or (13277)
    end_station_name: intersection of 2 streets (Clifton Ave & Armitage Ave)
    end_station_id: unique? station id, 2 different formats (TA1307000163) or (13277)
    start_lat: (41.9182435)
    start_lng: (-87.65711467)
    end_lat: (41.922167)
    end_lng: (-87.638888)
    member_casual: 2 choices (member, casual)

-Select columns started_at & ended_at. Change the format to DateTime (Format->Number->Date Time)
-Add a new column (ride_length) change the format to duration (Format->Number->Duration)
-Enter a formula and paste to the whole column, =(D2-C2)
-Added a new column (day_of_week), used formula =Weekday(c2) and pasted the whole column.
-Changed the format of day_of_week to number (initially it looked like dateTime) (Format->Number->0)
-Added 2 more columns start_month, end_month, put formula = Month(c2), and change the format to number.
-Final 16 columns:
ride_id, rideable_type, day_of_week, started_at, start_month, ended_at, end_month, ride_length, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng,member_casual
Case Study Roadmap - Process -2

Guiding questions

    What tools are you choosing and why?
    I switched to R Studio as google sheets can not handle 12 files, around 6 million records.

Before going into analysis by R, I want to thank and acknowledge the study on the same subject by JHELISON GABRIEL LIMA UCHOA. I copied and studied his R scripts to learn. I also used some of his scripts in this study. Here is a link to his case study
# Data Quality:

    There are 833064 missing start_station_name and start_station_id.
    There are 892742 missing end_station_name and end_station_id.
    There are only 5858 missing end_lat and end_lng. If stations have unique lat and lng, then missing station_name and station_id values may be mostly recovered from lat and lng. Should be checked.
    ride_length has negative values and very big values. These are clearly not right.
    ride_length < 0 : clearly an IT issue, started_at is later than ended_at. These data should be removed
    ride_length < 60 sec : people may just canceled the ride because of any reason. 60 second is picked, but it could be 30 seconds or 90 seconds. Probably start_station is same as the end_station for these records. Should be checked.
    ride_length > 10,800 sec (3 hours) : people may have not returned the bike to the bike station. In a hurry they may just left the bike where ever was convenient. Maybe they were trying to catch a taxi for an appointment, for a plane ride. Whatever the reason they probably did not return the bike. Should be checked.

    