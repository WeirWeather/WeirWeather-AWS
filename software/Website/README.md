# Weir Weather Automatic Weather Station Data Display

This is the web files for the website used to store and display all weather data taken from the automatic weather station designed as part of a 5th MEng project at the Universit of Starhclyde

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

MAMP was used as the web hosting and database package for this project.

Visual Studio Code was used for development of all code files.


### Installing

A step by step series of examples that tell you how to get a development env running

1) Install MAMP on your development machine. 

2) Clone all web files from this repository and move them to within the htdocs folder within the MAMP application.

3) Start the MAMP Server

4) On a web browser, enter "localhost/phpmyadmin" into the search bar

5) Create A database called Weather_Data and create two tables - Weather_Data_Table & Ext_API_Table

6) In both tables add the parameters (data type represented in brackets): Date_Time (datetime); Wind_Speed (float); Wind_Direction (float); Solar_Radiation (float); Temperature (float); Humidity (float); Rain_Level (float); Air_Pressure (float)

For the Weather_Data_Table, the additional additional field Boot_Count (int) must be added.

7) By entering "localhost" into the search bar the web page should now display. Not you may need to specify the port number in addition to "localhost" depending on what port MAMP apache is configured to.


To view data on the page, either data can be entered manually into the database or data can be entered using a http post request to the Data_Input.php API contained within the php folder.


## Deployment

The same steps as above can be followed to deploy the system on a dedicated server machine. This will allow for web access to the site on the same Local Area Network that the server is connected to. If entire internet access is required then the LAN router must be configured for port forwarding. It is reccomended that a domain name is purchase from a domain name provider and linked to the IP address of the router.


## Authors

* **Alexander Ulrichsen** - [aulrichsen](https://github.com/aulrichsen)
* **Callum Brooksby** - [CallumBrooksby](https://github.com/CallumBrooksby)


