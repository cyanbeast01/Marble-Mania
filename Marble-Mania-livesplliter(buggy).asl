state("Marble Mania"){
    float SpeedCircult : "mono.dll", 0x001F5684, 0x70, 0x5F0;
    float StarlightSpeedway : "mono.dll", 0x001F5684, 0x70, 0xF90;
    float FrozenLabyrinth : "mono.dll", 0x001F5684, 0x70, 0xC80;
    float SkywayHighway : "mono.dll", 0x001F5684, 0x70, 0x6D0;
    float FactoryFrenzy : "mono.dll", 0x001F5684, 0x70, 0x970;
    float AbandonedBay : "mono.dll", 0x001F5684, 0x70, 0x580;
    float ChaosCavern : "mono.dll", 0x001F5684, 0x70, 0xC10;
}

startup {
    settings.Add("69420funny", false, "Hover over me to see how levelID works :))");
    settings.SetToolTip("69420funny", "LEVELID: 0 = Tutorial, 1 = Speed Circult, 2 = Starlight Speedway, 3 = Frozen Labyrinth, 4 = Skyway Highway, 5 = Factory Frenzy, 6 = Abandoned Bay, 7 = Chaos Cavern.");
    settings.Add("42069alsofunny", false, "Hover over me to see how to select a level");
    settings.SetToolTip("42069alsofunny", "If you want to select level ID 6 then toggle on the +2 and +4 and toggle off the +1 because 2 + 4 = 6.");
    settings.Add("plus1", true, "Add 1 to level ID");
    settings.Add("plus2", false, "Add 2 to level ID");
    settings.Add("plus4", false, "Add 4 to level ID");
}

init {
    vars.time = 0f;
}

update {
    if(current.SpeedCircult > 0) {
         vars.time = current.SpeedCircult;
    }
    if(settings["plus4"]) {
        if(settings["plus2"]) {
            if(settings["plus1"]) {
                vars.time = current.ChaosCavern; //7
            } else {
                vars.time = current.AbandonedBay; //6
            }
        } else {
            if(settings["plus1"]) {
                vars.time = current.FactoryFrenzy; //5
            } else {
                vars.time = current.SkywayHighway; //4
            }
        }
    } else {
        if(settings["plus2"]) {
            if(settings["plus1"]) {
                vars.time = current.FrozenLabyrinth; //3
            } else {
                vars.time = current.StarlightSpeedway; //2
            }
        } else {
            if(settings["plus1"]) {
                vars.time = current.SpeedCircult; //1
            } else {
                vars.time = current.StarlightSpeedway; //0 (StarlightSpeedway = Tutorial)
            }
        }
    }
}

start {
    if(current.SpeedCircult > 0 || current.StarlightSpeedway > 0 || current.FrozenLabyrinth > 0 || current.SkywayHighway > 0 || current.FactoryFrenzy > 0 || current.AbandonedBay > 0 || current.ChaosCavern > 0) {
         return true;
    }
}

isLoading {
     return true;
}

gameTime {
        return(TimeSpan.FromSeconds(Math.Round((float)vars.time, 2)));
}