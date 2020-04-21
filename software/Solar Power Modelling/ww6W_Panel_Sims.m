%%%% WeirWeather Renewable Power Supply Simulation %%%%
%%%% Created by: Zack North         Date: 20/01/20 %%%%
%%%% Determines AWS Battery Capacity Requirements  %%%%

% Importing Power Data from Solar Calculations Spreadsheet
%% Setup the Import Options and import the data
clear;
opts = spreadsheetImportOptions("NumVariables", 3);

% Specify sheet and range
opts.Sheet = "Sheet1";
opts.DataRange = "A2:C745";

% Specify column names and types
opts.VariableNames = ["Dec80","Summer80","Winter80"];
opts.VariableTypes = ["double","double","double"];

% Import the data
tbl = readtable("/Users/zacknorth/Desktop/OneDrive - University of Strathclyde/19520 5th Year Group Project/4 - System Design/PowerData6W.xlsx", opts, "UseExcel", false);

%% Convert to output type
%Hour = tbl.Hour;
Dec80 = transpose(tbl.Dec80);
Summer80 = transpose(tbl.Summer80(1:168));
Winter80 = transpose(tbl.Winter80(1:168));


%% Clear temporary variables
clear opts tbl
%% Input Data - System Currents and Voltages
Isleep = 10e-3;                     % ESP Sleep current [Amps]
Itx = 200e-3;                       % ESP transmitting current [Amps]
Isens = 200e-3;                     % Net sensor current draw [Amps]
Vload = 5;                          % Load voltage [Volts]

%%  Input Data - Sleeping / Transmitting Duty Cycle
TX_period = 15;                      % Sample time in minutes
TX_time = 10/(TX_period*60);         % % of time trasmitting
sleep_time = 1-TX_time;              % % of time sleeping

%% Input Data - Battery Pack and Solar Panel
Vbat = 4.2;                         % Battery Voltage [Volts]
Pmax = 3.5;                         % Rated Panel Power [W]
Peff = 0.8;                           % Basic panel efficiency
Qnet(1) = 5.2;                      % Initial battery charge [Ah]
Enet(1) = Qnet(1)*Vbat;                % Initial battery energy [Wh]

days = 7;

%% Calculating average output power given duty cycle
Pout = Vload*(Isleep*sleep_time+((Itx+Isens)*TX_time));
% Creating daily power curves for the solar panel
t=[0:1:(24*days)-1];
Pin = Winter80;

%% Calculating net power/current consumption
Pbat = Pin-Pout;
Ibat = Pbat/Vbat;

% Loop through 1 week calculating net charge
% and net energy remaining in the battery pack
for(i=2:1:((24*days)))
Qnet(i) = Qnet(i-1) + Ibat(i-1);
if(Qnet(i)>5.2)Qnet(i) = 5.2;end
if(Qnet(i)<0)Qnet(i) = 0;end
end

%% Create plot of battery capacity and input power vs time
figure(1);
title("Solar Power Input & Battery Charge vs Time, 6W Panel, 80° Tilt");
x = [0:days/167:days];
colororder({'b', 'r'})
yyaxis right
plot(x,Pin,'r');
ylim([0 5]);
ylabel("Input Power (W)");
yyaxis left
plot(x,Qnet,'b');
ylim([0 6]);
ylabel("Battery Capacity (Ah)");
xlabel("Time (days)");
hold on;

Pin = Summer80;

%% Calculating net power/current consumption
Pbat = Pin-Pout;
Ibat = Pbat/Vbat;

% Loop through 1 week calculating net charge
% and net energy remaining in the battery pack
for(i=2:1:((24*days)))
Qnet(i) = Qnet(i-1) + Ibat(i-1);
if(Qnet(i)>5.2)Qnet(i) = 5.2;end
if(Qnet(i)<0)Qnet(i) = 0;end
end

%% Create plot of battery capacity and input power vs time
yyaxis right;
plot(x,Pin,'r:');
yyaxis left;
plot(x,Qnet,'b:');
legend("Winter","Summer");

days = 31;

%% Calculating average output power given duty cycle
Pout = Vload*(Isleep*sleep_time+((Itx+Isens)*TX_time));
% Creating daily power curves for the solar panel
t=[0:1:(24*days)-1];
Pin = Dec80;

%% Calculating net power/current consumption
Pbat = Pin-Pout;
Ibat = Pbat/Vbat;

% Loop through 1 week calculating net charge
% and net energy remaining in the battery pack
for(i=2:1:((24*days)))
Qnet(i) = Qnet(i-1) + Ibat(i-1);
if(Qnet(i)>5.2)Qnet(i) = 5.2;end
if(Qnet(i)<0)Qnet(i) = 0;end
end

%% Create plot of battery capacity and input power vs time
figure(2);
title("Solar Power Input & Battery Charge vs Time, 6W Panel, 80° Tilt");
x = [0:days/743:days];
colororder({'b', 'r'})
yyaxis right
plot(x,Pin,'r');
ylim([0 2]);
ylabel("Input Power (W)");
yyaxis left
plot(x,Qnet,'b');
ylim([0 6]);
ylabel("Battery Capacity (Ah)");
xlabel("Day of December");
xlim([0 31]);
hold on;