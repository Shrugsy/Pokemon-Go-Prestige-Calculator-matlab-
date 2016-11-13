
%clc;
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

    if aHCP > defCP(i)
        prestGain(i) = 155 * defAttRatio(i) - 27;
        if prestGain(i) < 50;
            prestGain(i) = 50;
        end
                
    elseif defCP(i) >= aHCP
        prestGain(i) = 250 * defAttRatio(i);
        if prestGain(i) > 500;
            prestGain(i) = 500;
        end
        
    else
        disp('def/att ratio outside allowed range');
    end
    end

totPrestGain = sum(prestGain, 'native');
totPrestGainInt = int32(totPrestGain);
dispText = sprintf('\nTotal prestige gain = %d', totPrestGainInt);
disp(dispText);

%%