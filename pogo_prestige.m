
clc;
clear;
close all;

numDefeated = input('Please input number of pokemon defeated\n');
aHCP = input('Please input highest attacker''s CP\n');
disp('Please input each defeated pokemon''s CP');

for i = 1:numDefeated
    defCP(i) = input('\n');
    defAttRatio(i) = defCP(i)/aHCP;
end



%%
for i = 1:numDefeated

    if 2 <= defAttRatio(i)
        %disp('2 <= def att ratio');
        prestGain(i) = 1000;
    elseif (1 <= defAttRatio(i)) & (defAttRatio(i) < 2)
        %disp('1 <= def att ratio <= 2');
        prestGain(i) = 500 * defAttRatio(i);
    elseif (0 < defAttRatio(i)) & (defAttRatio(i) < 1)
        %disp('0 < def att ratio < 1');
        prestGain(i) = 100*(2 - defAttRatio(i));
    else
        disp('def/att ratio outside allowed range');
    end
end

totPrestGain = sum(prestGain, 'native');
totPrestGainInt = int32(totPrestGain);
dispText = sprintf('\nTotal prestige gain = %d', totPrestGainInt);
disp(dispText);

%%