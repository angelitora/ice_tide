
clear all
close all

%n = datenum(d0,'HH:MM dd.mm.yyyy')



%!awk '{print $1, "," $2, $3}' reyk_prs_20190101_20200101.txt > gg.txt
%rvk_ioc = readtable('reyk_prs_20190101_20200101.txt');


tg_fname = 'Grindavik-Measured-Seaheight.csv';
tg_data = readtable(tg_fname,'Delimiter',';');
dn_tg = datenum(tg_data.date,'HH:MM dd.mm.yyyy');
wl_tg_01 = tg_data.wl01;
wl_tg_02 = tg_data.wl02;


delft_fname = 'waterLvlDELFT.csv'
delft_data = readtable(delft_fname);
dn_delft = datenum(delft_data.date);
wl_delft = delft_data.sea_level;

idd_delft = find(dn_delft>max(dn_tg),1,'first')
%the data from the table is backwards in time. 
% 8 february
% 14 february


figure
subplot(4,1,[1 2])
plot(dn_tg,wl_tg_01-2.5736)
hold on
plot(dn_delft(1:idd_delft),wl_delft(1:idd_delft))
grid on
xlim([737820 737850])
datetick('x','dd/mm','keepticks','keeplimits')
ylabel('wave height, m')
legend('tide gauge','Delft3D')
subplot(4,1,[3 4])
plot(dn_tg,tg_data.press)
ylabel('surface pressure, hPa')
xlabel('date')
grid on
xlim([737820 737850])
datetick('x','dd/mm','keepticks','keeplimits')


figure
subplot(4,1,[1 2])
plot(dn_tg,wl_tg_01-2.5736)
hold on
plot(dn_delft(1:idd_delft),wl_delft(1:idd_delft))
grid on
xlim([737820 737850])
datetick('x','dd/mm','keepticks','keeplimits')
ylabel('wave height, m')
legend('tide gauge','Delft3D')
subplot(4,1,[3 4])
plot(dn_tg,tg_data.wind)
hold on
plot(dn_tg,tg_data.maxwind,'linestyle','--')
ylabel('wind speed, m/s')
xlabel('date')
grid on
xlim([737820 737850])
datetick('x','dd/mm','keepticks','keeplimits')


figure
subplot(4,1,[1 2])
plot(dn_tg,wl_tg_01-2.5736)
hold on
plot(dn_delft(1:idd_delft),wl_delft(1:idd_delft))
grid on
xlim([737820 737850])
datetick('x','dd/mm','keepticks','keeplimits')
ylabel('wave height, m')
legend('tide gauge','Delft3D')
subplot(4,1,[3 4])
plot(dn_tg,tg_data.wind_dir,'x')
ylabel('wind direction, deg')
xlabel('date')
grid on
xlim([737820 737850])
datetick('x','dd/mm','keepticks','keeplimits')


%ooooooo comparing the data 
%% generating the data for Kevin and Delft3D
%% we need hourly pressure data, use the same data as the tide gauge    
%% station. 


ntt = tt(1):0.041666666666667:tt(end);
npp = interp1(tt,pp,ntt);
mm.date = datestr(ntt, 'yyyy/mm/dd HH:MM:SS');
pressure =(P*100)-101325
mm.press = (npp*100)' - 101325;
tmm = struct2table(mm);
writetable(tmm,'test.txt')



ABOTI

AKRANES Akranesh?fn  -22.0652854975, 64.3217880938

Borgarnes

B??ardalur  -21.775382155, 65.1097305121

Dalv?k -18.5063644767, 65.9525205172

EYJARG

Grindavik -22.4212387984, 63.8408025949

GRUNDART Grundartangi -21.7716654454, 64.3663886081

Husavikurhofn H?sav?k -17.3061078228, 66.0066925627

Hornafj?r?ur-H?fn -15.203738848, 64.2500620072

Hvanney Hornafj?r?ur-Hvanney -15.2123825985, 64.2589146001

?safj?r?ur -23.1251447725, 66.0875161835

Landeyjahofn Landeyjah?fn -20.0973848292, 63.532241072

MIDBAKKI Rvk. Mi?bakki -21.9314839548, 64.1433860369


Olafsvikurhofn ?lafsv?k -23.6651274376, 64.9111253775

Patreksfj?r?ur -24.0122591509, 65.5957462564

Rey?arfj?r?ur-Mj?eyri -14.0972343571, 65.0273846318

Sandgerdi -22.691230131, 64.0336535467

Skagastrond Skagastr?nd -20.3046996024, 65.8223461248

Skarfagar?ur -21.8534330549, 64.1508194559

Stykkish?lmur -22.7490854165, 65.0750486865

Hafnarfjar?arh?fn -21.9537842119, 64.0653351369

Straumsvik -22.0318351118, 64.0430348798

Thorlakshofn -21.3702608173, 63.8609161133

Vestman-Basasker Vestmannaeyjar -20.2613081382, 63.4454581437



wkt_geom	Nafn	Rekstur	Umsj?n	Eigandi
POINT(444500.22635385626927018 336704.75423619925277308)	Landeyjah?fn	J?	mogt	Vegager?in
POINT(383373.86116215941729024 375129.21876622550189495)	?orl?ksh?fn	J?	mogt	?orl?ksh?fn
POINT(357078.68621356593212113 408838.13520516612334177)	Rvk. Mi?bakki	J?	mogt	Faxafl?ahafnir
POINT(366008.77391211042413488 431474.54214335093274713)	Grundartangi	J?	mogt	Faxafl?ahafnirL
POINT(331632.33952305087586865 375195.82255282317055389)	Grindav?k	J?	mogt	Grindav?k
POINT(318499.55289022019132972 398208.17086424556327984)	Sandger?i	J?	mogt	Sandger?i
POINT(277563.38556340482318774 496846.89873062307015061)	?lafsv?k	J?	mogt	Sn?fellsb?r
POINT(269406.64183146198047325 575833.80934044544119388)	Patreksfj?r?ur	Nei	?	?
POINT(313043.96272583247628063 625128.01184314221609384)	?safj?r?ur	J?	vista	?safj?r?ur
POINT(439816.13005088799400255 592643.12499344511888921)	Skagastr?nd	J?	mogt	Skagastr?nd
POINT(574733.20043471246026456 617581.80282167554832995)	H?sav?k	J?	mogt	H?sav?k
POINT(729928.90371117938775569 511911.93521684932056814)	Rey?arfj?r?ur-Mj?eyri	J?	mogt	Fjar?abygg?
POINT(684838.88022691570222378 419828.5000357874087058)	Hornafj?r?ur-Hvanney	J?	mogt	Hornafj?r?ur
POINT(683986.35175847064238042 421879.15662090928526595)	Hornafj?r?ur-H?fn	J?	mogt	Hornafj?r?ur
POINT(436364.57382100343238562 327332.12137782282661647)	Vestmannaeyjar	J?	mogt	Vestmannaeyjab?r
POINT(355477.28089080459903926 399387.0480124520836398)	Hafnarfjar?arh?fn	J?	vista	Hafnarfj?r?ur
POINT(351443.81585249042836949 397186.97617337160045281)	Straumsv?k	?	vista	Hafnarfj?r?ur
POINT(351044.13613505748799071 427126.28711685806047171)	Akranesh?fn	J?	mogt	Faxafl?ahafnir
POINT(361164.4665948276524432 408495.34542624501045793)	Skarfagar?ur	J?	mogt	Faxafl?ahafnir
POINT(369735.57980124501045793 515276.7488326151506044)	B??ardalur	Nei	vista	?
POINT(324905.44929358235094696 513981.4565373562509194)	Stykkish?lmur	Nei	?	
POINT(521704.62538912828313187 608607.46303280629217625)	Dalv?k	Nei	?	Dalv?k

Nafn,C,80	Rekstur,C,80	Umsj?n,C,80	Eigandi,C,80
Landeyjah?fn	J?	mogt	Vegager?in
?orl?ksh?fn	J?	mogt	?orl?ksh?fn
Rvk. Mi?bakki	J?	mogt	Faxafl?ahafnir
Grundartangi	J?	mogt	Faxafl?ahafnirL
Grindav?k	J?	mogt	Grindav?k
Sandger?i	J?	mogt	Sandger?i
?lafsv?k	J?	mogt	Sn?fellsb?r
Patreksfj?r?ur	Nei	?	?
?safj?r?ur	J?	vista	?safj?r?ur
Skagastr?nd	J?	mogt	Skagastr?nd
H?sav?k	J?	mogt	H?sav?k
Rey?arfj?r?ur-Mj?eyri	J?	mogt	Fjar?abygg?
Hornafj?r?ur-Hvanney	J?	mogt	Hornafj?r?ur
Hornafj?r?ur-H?fn	J?	mogt	Hornafj?r?ur
Vestmannaeyjar	J?	mogt	Vestmannaeyjab?r
Hafnarfjar?arh?fn	J?	vista	Hafnarfj?r?ur
Straumsv?k	?	vista	Hafnarfj?r?ur
Akranesh?fn	J?	mogt	Faxafl?ahafnir
Skarfagar?ur	J?	mogt	Faxafl?ahafnir
B??ardalur	Nei	vista	?
Stykkish?lmur	Nei	?	
Dalv?k	Nei	?	Dalv?k




