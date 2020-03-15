/// @description // frame

if (ai == zomb_ai.walk)
    if (arms==arm.walk1 || arms==arm.walk2)
        arms++;
    else if (arms == arm.idle)
        arms = arm.walk1;
    
alarm[zomb_alarm.frame] = 10;