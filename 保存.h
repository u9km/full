// 保存

/*void SavePreferences() {
    #ifdef __APPLE__
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:TS forKey:@"SelectedTab"];
    [defaults setBool:thongtin forKey:@"ShowMatchInfo"];
    [defaults setInteger:血条 
forKey:@"ShowPlayerHP"];
    [defaults setInteger:Aim
forKey:@"Aim"];
    [defaults setInteger:CL
forKey:@"CL"];
   [defaults setInteger:Al
forKey:@"Al"];
    [defaults setInteger:打击圈
forKey:@"KillQ"];
    [defaults setInteger:AimF
forKey:@"AimF"];
    [defaults setBool:Config.ESPMenu.Skeleton forKey:@"Skeleton"];
    [defaults setBool:Config.ESPMenu.Box forKey:@"Box"];
    [defaults setBool:Config.ESPMenu.Weapon forKey:@"Weapon"];
    [defaults setBool:Config.ESPMenu.死亡盒子 forKey:@"DeadBoxw"];
    [defaults setBool:瞄准线 forKey:@"miaozhunxian"];
    [defaults setBool:Config.ESPMenu.背敌 forKey:@"Dibei"];
    [defaults setBool:GRWAR forKey:@"GRWAR"];
    [defaults setInteger:Radar
forKey:@"Radar"];
    [defaults setBool:Config.ESPMenu.Name forKey:@"ShowPlayerNames"];
    [defaults setBool:射线 forKey:@"ShowPlayerLines"];
   [defaults setFloat:追踪概率 forKey:@"SnowSpeed"];
    [defaults setFloat:Cross forKey:@"RainSpeed"];
    [defaults setFloat:g_disstance forKey:@"TextScrollSpeed"];
 [defaults setFloat:Aimsmooth forKey:@"Aimsmooth"];
    [defaults setFloat:Xs forKey:@"Xs"];
    [defaults setFloat:Ys forKey:@"Ys"];
    [defaults synchronize];
    #elif _WIN32
    #endif
}
void LoadPreferences() {
    #ifdef __APPLE__
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
      TS = [defaults boolForKey:@"SelectedTab"];
      thongtin = [defaults boolForKey:@"ShowMatchInfo"];
      CL = [defaults integerForKey:@"CL"];
      Radar = [defaults integerForKey:@"Radar"];
      Al = [defaults integerForKey:@"Al"];
      打击圈 = [defaults integerForKey:@"KillQ"];
      Aimsmooth = [defaults floatForKey:@"Aimsmooth"];
      Xs = [defaults floatForKey:@"Xs"];
      Ys = [defaults floatForKey:@"Ys"];
    瞄准线 = [defaults boolForKey:@"miaozhunxian"];
     GRWAR = [defaults boolForKey:@"GRWAR"];
    Config.ESPMenu.背敌 = [defaults boolForKey:@"Dibei"];
    Config.ESPMenu.死亡盒子 = [defaults boolForKey:@"DeadBoxw"];
    Config.ESPMenu.Weapon = [defaults boolForKey:@"Weapon"];
    Config.ESPMenu.Box = [defaults boolForKey:@"Box"];
    Config.ESPMenu.Skeleton = [defaults boolForKey:@"Skeleton"];
      
      血条 = [defaults integerForKey:@"ShowPlayerNames"];
      Aim = [defaults integerForKey:@"Aim"];
      AimF = [defaults integerForKey:@"AimF"];
    Config.ESPMenu.Name = [defaults boolForKey:@"ShowPlayerNames"];
    射线 = [defaults boolForKey:@"ShowPlayerLines"];
    追踪概率 = [defaults floatForKey:@"SnowSpeed"];
    Cross = [defaults floatForKey:@"RainSpeed"];
    g_disstance = [defaults floatForKey:@"TextScrollSpeed"];
    
    

    #elif _WIN32
    #endif
}*/
  // 加载保存的设置