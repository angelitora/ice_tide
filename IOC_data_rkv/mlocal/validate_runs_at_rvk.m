% compare rvk ioc data and the outputs from delft3D, aparently there was a
% phase shift on the results and we are checking that. So far we did that
% for January only. The data from ioc comes every minute while the one from
% delft is every 5 minutes. 
% I used readtable as it generates an structure that has the label headers
% on them, little shell fixing needed to be done for ioc data in rvk. 

!awk '{print $1, "," $2, $3}' reyk_prs_20190101_20200101.txt > gg.txt
%rvk_ioc = readtable('reyk_prs_20190101_20200101.txt');

rvk_ioc = readtable('gg.txt');
dn_ioc = datenum(rvk_ioc.date);

rvk_delft = readtable('ALL_rkv2019.csv');
dn_delft = datenum(rvk_delft.Time_yyyy_MM_ddHH_mm_ss_);



% we need to split for the first month.
d2 = datenum('2019/02/01 00:00:00'); 
iioc_jan = find(dn_ioc>d2,1,'first');
iioc_jan = ioc_jan - 1;
dn_ioc_jan = dn_ioc(1:iioc_jan);

idelft_jan = find(dn_delft>d2,1,'first');
idelft_jan = idelft_jan - 1;
dn_delft_jan = dn_delft(1:idelft_jan);



%rvk station has a correction on the waveheight 2.4 meters

wh_ioc=rvk_ioc.waveheight(1:iioc_jan)-2.4;
wh_delft = rvk_delft.Reykjavik_WaterLevel_waterlevel_AtReykjavik_FlowFM_m_(1:idelft_jan);


ioc_half = find(dn_ioc_jan==datenum('2019/01/15 00:00:00'));
delf_half = find(dn_delft_jan==datenum('2019/01/15 00:00:00'));


figure
subplot(4,1,[1 2])
plot(dn_ioc_jan(1:ioc_half),wh_ioc(1:ioc_half))
hold on
plot( dn_delft_jan(1:delf_half), wh_delft(1:delf_half) )
ylabel('wave height, m')
legend('RVK IOC','Delft3D')
grid on
datetick('x','dd/mm','keepticks','keeplimits')
subplot(4,1,[3 4])
plot(  dn_ioc_jan( ioc_half:end ),wh_ioc( ioc_half:end )  )
hold on
plot(dn_delft_jan( delf_half:end ),wh_delft( delf_half:end) )
ylabel('wave height, m')
legend('RVK IOC','Delft3D')
grid on
xlabel('date')
datetick('x','dd/mm','keepticks','keeplimits')








figure
subplot(4,1,[1 2])
plot(dn_ioc_jan(1:floor(end/2)),wh_ioc(1:floor(end/2)))
hold on
plot( dn_delft_jan(1:floor(end/2)), wh_delft(1:floor(end/2)) )
ylabel('wave height, m')
legend('RVK IOC','Delft3D')
grid on
datetick('x','dd/mm','keepticks','keeplimits')
subplot(4,1,[3 4])
plot(  dn_ioc_jan( floor(end/2):end ),wh_ioc( floor(end/2):end )  )
hold on
plot(dn_delft_jan( floor(end/2):end ),wh_delft( floor(end/2):end) )
ylabel('wave height, m')
legend('RVK IOC','Delft3D')
grid on
xlabel('date')
datetick('x','dd/mm','keepticks','keeplimits')



subplot(4,1,[1 2])
plot(dn_ioc_jan(1:ioc_half),wh_ioc(1:ioc_half)+0.1368)
hold on
plot( dn_delft_jan(1:delf_half), wh_delft(1:delf_half) )
ylabel('wave height, m')
legend('RVK IOC','Delft3D')
grid on


