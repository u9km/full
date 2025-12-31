#import "ESP/mahoa.h"
//#import "Bsphp/WX_NongShiFu123.mm"
#include "sys/mman.h"
//#import "菜单.mm"
#include "ESP/Tools.h"
//#include "imgui/UI.h"
#import <AVFoundation/AVFoundation.h>
//#include "菜单.h"
#include "JRMemory.framework/Headers/MemScan.h"
#include <stdio.h>
#include <stdint.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import "authcheatbot/FTNotificationIndicator.h"
#import "authcheatbot/FCUUID.h"
#import "authcheatbot/menuButtonConfigLQ.h"
#import "authcheatbot/MBProgressHUD.h"
#import "authcheatbot/Reachability.h"
#include <string>
#include <stdio.h>
#include <string.h>
#include "ESP/Vector3.hpp"
#include "ESP/Vector2.hpp"
#import <Foundation/Foundation.h>
#import "ESP/UE4.h"
#import "API/APIClient.h"
#include "ESP/tahoma.h"
#import "View/OverlayView.h"
#import "Engine.h"
#include <mach/vm_map.h> //vm_protect 的正式声明
#include <mach/vm_prot.h> //VM_PROT_READ | VM_PROT_WRITE
#import "Image/Icon.h"
#define timer(sec) dispatch_after(dispatch_time(DISPATCH_TIME_NOW, sec * NSEC_PER_SEC), kkdispatch_get_main_queue(), ^
NSString *xrpb = NSSENCRYPT("Paste Key...");
#define iPhone8P ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)
#define kWidth  [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height
#define E(str) _xor_(str).c_str()
NSString *bundle;
uint64_t GUObjectArray;
uint64_t GNameFun;

#define Actors_Offset 0xA0
bool isAimKnocked = true;
static uintptr_t Get_module_base() {
    uint32_t count = _dyld_image_count();
    for (int i = 0; i < count; i++) {
  std::string path = (const char *)_dyld_get_image_name(i);
        if (path.find("ShadowTrackerExtra.app/ShadowTrackerExtra") != path.npos) {
            return (uintptr_t)_dyld_get_image_vmaddr_slide(i);
        }
    }
    return 0;
}
bool IsValidAddress(kaddr addr) {
    return addr > 0x100000000 && addr < 0x2000000000;
}

//hook no jb
float tocdolon=10.0f;
bool anti1 =false;
bool anti2 =false;
int SX = 0;
int UI = 0;
bool 开火据点;
bool IsLogin = true;
bool 放置奖杯;
float 巨人;
bool 瞄准线;
bool 人物变大;
bool agha3;
bool 高跳;
bool SDKF;
bool 大厅;
bool Tp;
int CL=1;
int Al=0;
bool 方框;
bool BigQ;
bool OI;
int Gun_Size = 2.5;
bool 手雷自瞄;
bool 路飞;
bool 自动开火;
int 血条=0;
bool anti3 =false;
bool anti4 =false;
bool 吸人;
bool CarSize = false;
float A4 = 1.0f;//默认size值
bool CarWideView;
bool CarTp;
float 大小 = 0.95;
bool giamgiat = false;
bool tiaosan= false;
bool Fixshoot;
bool init1 = false;
bool 敌人大小;
bool init2 = false;
bool init3 = false;
bool init4 = false;
float Qo;
bool SHxs;
bool 被瞄预警;
bool init5 = false;
bool WideView = false;
bool 引擎绘制1 = false;
bool ZERO = false;
bool TS;
bool v加速;
bool isSpinning;
bool FlyCar;
float ZAxisSpeed;
bool FlyFuck;
bool 测试;
bool WHY;
bool 加速;
bool 疯狗模式;
bool HighCar;
bool 退出对局;
bool 僵尸来了;
bool TY;
bool 打饮料加速;
bool 观战视角;
bool 退出观战;
bool Ss;
bool 快速换弹;
bool 高伤;
bool KH;
bool SHXS;
bool 无限子弹;
float 巨人2;
bool 开火加速;
bool 信息;
int 打击圈 = 0;
bool feiche = false;
int WideValue = 120;
int CarView =120; 
int 追踪概率 =60;

bool initialized = false;
void InitializeMemoryProtection() {
    if (!initialized) {
        // 这里执行一次性的内存保护更改
        initialized = true;
    }
}
#include <iostream>
#include <chrono>
#include <thread>
#include <cmath>


void renderHUD() {
    
    std::cout << "Rendering dynamic HUD..." << std::endl;
    
    static bool staticContentRendered = false;
    if (!staticContentRendered) {
        std::cout << "Rendering static HUD elements..." << std::endl;
        staticContentRendered = true;
    }
}


float smoothTransition(float currentValue, float targetValue, float speed) {
    return currentValue + (targetValue - currentValue) * speed;
}


void updateHUDAnimation(float &currentPosition, float targetPosition) {
    currentPosition = smoothTransition(currentPosition, targetPosition, 0.1f);
    std::cout << "Updating HUD animation position: " << currentPosition << std::endl;
}


void runHUD(int targetFPS) {
    using namespace std::chrono;
    milliseconds frameDuration(1000 / targetFPS);

    float hudPosition = 0.0f;  
    float targetPosition = 100.0f;  
    while (true) {
        auto frameStart = steady_clock::now();

        
        renderHUD();
        
        
        updateHUDAnimation(hudPosition, targetPosition);

        
        auto frameEnd = steady_clock::now();
        auto renderTime = duration_cast<milliseconds>(frameEnd - frameStart);

        
        if (renderTime < frameDuration) {
            std::this_thread::sleep_for(frameDuration - renderTime);
        }
    }
}


void loadResourcesAsync() {
    std::thread resourceLoader([]() {
        std::cout << "Loading resources in background..." << std::endl;
       
        std::this_thread::sleep_for(std::chrono::seconds(2));
        std::cout << "Resources loaded." << std::endl;
    });
    resourceLoader.detach();  
}

int main() {
    
    loadResourcesAsync();

    int targetFPS = 120;  // 保持高帧率以提高流畅度
    std::cout << "Running HUD at " << targetFPS << " FPS" << std::endl;

    
    runHUD(targetFPS);

    return 0;
}
uintptr_t UE4;
kaddr module= (unsigned long)_dyld_get_image_vmaddr_slide(1);
namespace Options
{
int boxtype = 1;
int healthbartype = 0;
int Nationtype = 2;
int DirectionLineSize = 70;
int VehicleDirectionLineSize = 100;
int offscreen_range = 40;
int max_distance_offscreen = 400;
int playersdistancessize = 600;
bool esp_Outline = true;
int distance_Radar = 150;
}
int Radar = 0;
enum EAimTarget {
    Head = 0,
    Chest = 1
};

long l1 = 0xFF544;
long l2 = 0xFFFFF;
//const char * stack230 = 0;//index of class array 75
int stack_20;
int AimF = 3;//瞄准方式
int HHP=5;
bool PHP;
int Aim = 3;
NSString * val_1;
NSString * val_x2 ;
int sort = 1,sort_1 = 3;
long RAMADDRESS = 0x4332443;//0x4332443 + F = 0x4332452
bool stack_193 = NO;
using namespace std;
using namespace SDK;

static int Styleesp = 2;

bool ConfigSilentAimEnable = false;
    struct sConfig {
        struct sESPMenu {
            bool Line;
            bool Box;
            bool Skeleton;
            bool Health;
            bool 血条;
            bool Name;
            bool Distance;
            bool TeamID;
            bool Weapon;
            bool Alert;
		      bool Radar;
		      float RadarX;
		      float RadarY;
            bool GRWAR;
            bool ESPON;
            bool IgnoreBot;
            bool LootBox;
            bool Throwables;
        };
        sESPMenu ESPMenu{false};

        
    };
    sConfig Config{false};
//折叠控件
//sConfig Config{false};//false
//


struct JsonPreferences {
enum EAimTarget {
        Head = 0,
        Chest = 1
    };

        struct sConfig {
         struct sAimMenu {
            bool EnableAllHack;
            bool Enable;
            bool AimBot;
            bool Autofire;
            bool CameraCache;
            EAimTarget Target;
            //EAimPriority Priority;
//            EAimTrigger Trigger;
            bool IgnoreKnocked;
            bool IgnoreBot;
            bool Prediction;
            bool VisCheck;
            bool Fov;
            bool LessRecoil;
            bool Norecoil;
            bool InstantHit;
            bool FastShoot;
            bool HeadShoot;
            bool ReCo;
            float Recc = 1.0f;
            bool HitX;
            int Cross = 200;
            bool test5;
            bool SpeedHack;
        };
        sAimMenu SilentAim{false};
        struct sModSkin {
  bool Enable = 1;

};

        
    };
    sConfig Config{false};

} preferences;
static int helmett3 = 0;
static int bag3 = 0;
bool ModSkinn = false;
bool KillMessage = false;
bool DeadBox = false;
int sEmote1 = 2200101;
int sEmote2 = 2200201;
int sEmote3 = 2200301;
int ModEmote1 = 1;
namespace Active {
  inline int SkinCarDefault = 0;
  inline int SkinCarMod = 0;
  inline int SkinCarNew = 0;
}
UISlider * Auto1;//autofire
UISlider * Auto1Interval;//autofire interval
UISlider * sliderrr;//aimpos
extern float TurnRate; //No scope turn rate - aim speed
extern float NoScopeAimDisSliderVal;
extern float HiddenFOVSliderVal;// with scope Filed of view slider value /NOT ACTIVE/
extern float NoScopeFOVSliderVal;//No scope FOV size slider value
//Slider_Sniper * Aimbot1;//fov
extern float FovRadousVal;
UISlider * aimspeed;//aimbot speed
CGSize AutoFireCircelSize;// CGSizeMake(w, h);
bool IsLootBox = false;
bool IsAirDrop = false;
int Interval = 1;
int counter;
float iAwareTexSiz = 20;
bool iAwareText = true;
float EspTextSiz = 3;
float IteTextSiz = 4;
float EspBoxThik = 2.0f;
float EspSktonThik = 2.1f;
float IsfovSlider = 150.0f;
float AimSmooth = 5.0f;
bool AimTouch = false;
bool antibypass = false;
//UISlider * Aimbot2;
//aimbot bool
float g_disstance = 150.f;
float FuckValue;
//物资
bool IsFastKnock = false;
bool IsFastswim = false;
bool IsVehcle = false;
bool IsboxVechle =false;
bool IsCarHP = false;
bool IsCarFuel =false;
bool IsPostil =false;
bool IsSniper = false;
bool IsWeapon =false;
bool IsAmmo =false;
bool IsFov =false;
bool IsHitXPL =false;
bool IsPlayerSP= false;
bool isAimvisual =false;
bool IsCrossHair = false;
bool IsSMG =false;
bool IsAR =false;
bool IsITM =false;
bool IsShotgun = false;
bool TeleportCar = false;
bool IsSilentAIM= false;
bool GODVIEWUUP= false;
bool GODVIEWFRONT= false;
bool GODVIEWLEFT= false;
bool AUOTJUMPAN= false;

int boxtype = 1;
int healthbartype = 0;
int Nationtype = 2;
int DirectionLineSize = 70;
int VehicleDirectionLineSize = 100;
int offscreen_range = 40;
int max_distance_offscreen = 400;
int playersdistancessize = 600;
bool esp_Outline = true;
int distance_Radar = 150;

uintptr_t ProcessEvent_Offset,AimBullet_Offset,AimBullet_Offset2,SetControlRotation_Offset;
#define SLEEP_TIME 1000LL / 60LL
#define TORAD(x) ((x) * (M_PI / 180.f))
int g_screenWidth ;
int g_screenHeight ;
int screenWidth ;
int screenHeight ;
int screenDensity = 0;
int getEspFramerate;
int SCOLOR;
int scc;
float xunz = 1;

char extra[30];
float density = -1;
float gDistance;
int localFiring{0};
BOOL kaiguan1 = NO;
BOOL kaiguan2 = NO;
BOOL kaiguan3 = NO;
BOOL kaiguan4 = NO;
#define PI 3.14159265358979323846
#define __fastcall
bool ARWP = false;
bool SMGWP =false;
bool SNPWP = false;
bool otherWP =false;
bool AmmoWP =false;
bool LIGHTMW = false;
bool SHOTGUNWP = false;
bool scopewp = false;
bool POSTOLWP = false;
bool ARMORWP =false;
//extern float FovRadousVal;
float IsAimBotRecc = 1.183f;
bool IsRecoilComparison = false;
static int Istargets = 2;
bool thongtin =false;
static int loaixe = 0;
static int xedacia = 0;
bool modxe = false;
bool tamnho = false;
bool FPS = false;;
//hiệu ứng bắn
bool effectm44 = false;
float FOVsize =180.0f;
float dorong = 88.0f;
float Aimsmooth = 1.2f;
float Xs=2.4,Ys=2.4;
float IsDistance = 68;

class FPSCounter {
protected:
    unsigned int m_fps;
    unsigned int m_fpscount;
    long m_fpsinterval;
public:
    FPSCounter() : m_fps(0), m_fpscount(0), m_fpsinterval(0) {
    }
    void update() {
        m_fpscount++;
        if (m_fpsinterval < time(0)) {
            m_fps = m_fpscount;
            m_fpscount = 0;
            m_fpsinterval = time(0) + 1;
        }
    }
    unsigned int get() const {
        return m_fps;
    }
};
FPSCounter fps;

namespace allColors
{
    FLinearColor AliceBlue = { 0.941176534f, 0.972549081f, 1.000000000f, 1.000000000f };
    FLinearColor AntiqueWhite = { 0.980392218f, 0.921568692f, 0.843137324f, 1.000000000f };
    FLinearColor Aqua = { 0.000000000f, 1.000000000f, 1.000000000f, 1.000000000f };
    FLinearColor Aquamarine = { 0.498039246f, 1.000000000f, 0.831372619f, 1.000000000f };
    FLinearColor Azure = { 0.941176534f, 1.000000000f, 1.000000000f, 1.000000000f };
    FLinearColor Beige = { 0.960784376f, 0.960784376f, 0.862745166f, 1.000000000f };
    FLinearColor Bisque = { 1.000000000f, 0.894117713f, 0.768627524f, 1.000000000f };
    FLinearColor Black = { 0.000000000f, 0.000000000f, 0.000000000f, 1.000000000f };
    FLinearColor BlanchedAlmond = { 1.000000000f, 0.921568692f, 0.803921640f, 1.000000000f };
    FLinearColor Blue = { 0.000000000f, 0.000000000f, 1.000000000f, 1.000000000f };
    FLinearColor BlueViolet = { 0.541176498f, 0.168627456f, 0.886274576f, 1.000000000f };
    FLinearColor Brown = { 0.647058845f, 0.164705887f, 0.164705887f, 1.000000000f };
    FLinearColor BurlyWood = { 0.870588303f, 0.721568644f, 0.529411793f, 1.000000000f };
    FLinearColor CadetBlue = { 0.372549027f, 0.619607866f, 0.627451003f, 1.000000000f };
    FLinearColor Chartreuse = { 0.498039246f, 1.000000000f, 0.000000000f, 1.000000000f };
    FLinearColor Chocolate = { 0.823529482f, 0.411764741f, 0.117647067f, 1.000000000f };
    FLinearColor Coral = { 1.000000000f, 0.498039246f, 0.313725501f, 1.000000000f };
    FLinearColor CornflowerBlue = { 0.392156899f, 0.584313750f, 0.929411829f, 1.000000000f };
    FLinearColor Cornsilk = { 1.000000000f, 0.972549081f, 0.862745166f, 1.000000000f };
    FLinearColor Crimson = { 0.862745166f, 0.078431375f, 0.235294133f, 1.000000000f };
    FLinearColor Cyan = { 0.000000000f, 1.000000000f, 1.000000000f, 1.000000000f };
    FLinearColor DarkBlue = { 0.000000000f, 0.000000000f, 0.545098066f, 1.000000000f };
    FLinearColor DarkCyan = { 0.000000000f, 0.545098066f, 0.545098066f, 1.000000000f };
    FLinearColor DarkGoldenrod = { 0.721568644f, 0.525490224f, 0.043137256f, 1.000000000f };
    FLinearColor DarkGray = { 0.662745118f, 0.662745118f, 0.662745118f, 1.000000000f };
    FLinearColor DarkGreen = { 0.000000000f, 0.392156899f, 0.000000000f, 1.000000000f };
    FLinearColor DarkKhaki = { 0.741176486f, 0.717647076f, 0.419607878f, 1.000000000f };
    FLinearColor DarkMagenta = { 0.545098066f, 0.000000000f, 0.545098066f, 1.000000000f };
    FLinearColor DarkOliveGreen = { 0.333333343f, 0.419607878f, 0.184313729f, 1.000000000f };
    FLinearColor DarkOrange = { 1.000000000f, 0.549019635f, 0.000000000f, 1.000000000f };
    FLinearColor DarkOrchid = { 0.600000024f, 0.196078449f, 0.800000072f, 1.000000000f };
    FLinearColor DarkRed = { 0.545098066f, 0.000000000f, 0.000000000f, 1.000000000f };
    FLinearColor DarkSalmon = { 0.913725555f, 0.588235319f, 0.478431404f, 1.000000000f };
    FLinearColor DarkSeaGreen = { 0.560784340f, 0.737254918f, 0.545098066f, 1.000000000f };
    FLinearColor DarkSlateBlue = { 0.282352954f, 0.239215702f, 0.545098066f, 1.000000000f };
    FLinearColor DarkSlateGray = { 0.184313729f, 0.309803933f, 0.309803933f, 1.000000000f };
    FLinearColor DarkTurquoise = { 0.000000000f, 0.807843208f, 0.819607913f, 1.000000000f };
    FLinearColor DarkViolet = { 0.580392182f, 0.000000000f, 0.827451050f, 1.000000000f };
    FLinearColor DeepPink = { 1.000000000f, 0.078431375f, 0.576470613f, 1.000000000f };
    FLinearColor DeepSkyBlue = { 0.000000000f, 0.749019623f, 1.000000000f, 1.000000000f };
    FLinearColor DimGray = { 0.411764741f, 0.411764741f, 0.411764741f, 1.000000000f };
    FLinearColor DodgerBlue = { 0.117647067f, 0.564705908f, 1.000000000f, 1.000000000f };
    FLinearColor Firebrick = { 0.698039234f, 0.133333340f, 0.133333340f, 1.000000000f };
    FLinearColor FloralWhite = { 1.000000000f, 0.980392218f, 0.941176534f, 1.000000000f };
    FLinearColor ForestGreen = { 0.133333340f, 0.545098066f, 0.133333340f, 1.000000000f };
    FLinearColor Fuchsia = { 1.000000000f, 0.000000000f, 1.000000000f, 1.000000000f };
    FLinearColor Gainsboro = { 0.862745166f, 0.862745166f, 0.862745166f, 1.000000000f };
    FLinearColor GhostWhite = { 0.972549081f, 0.972549081f, 1.000000000f, 1.000000000f };
    FLinearColor Gold = { 1.000000000f, 0.843137324f, 0.000000000f, 1.000000000f };
    FLinearColor Goldenrod = { 0.854902029f, 0.647058845f, 0.125490203f, 1.000000000f };
    FLinearColor Gray = { 0.501960814f, 0.501960814f, 0.501960814f, 1.000000000f };
    FLinearColor Green = { 0.000000000f, 0.501960814f, 0.000000000f, 1.000000000f };
    FLinearColor GreenYellow = { 0.678431392f, 1.000000000f, 0.184313729f, 1.000000000f };
    FLinearColor Honeydew = { 0.941176534f, 1.000000000f, 0.941176534f, 1.000000000f };
    FLinearColor HotPink = { 1.000000000f, 0.411764741f, 0.705882370f, 1.000000000f };
    FLinearColor IndianRed = { 0.803921640f, 0.360784322f, 0.360784322f, 1.000000000f };
    FLinearColor Indigo = { 0.294117659f, 0.000000000f, 0.509803951f, 1.000000000f };
    FLinearColor Ivory = { 1.000000000f, 1.000000000f, 0.941176534f, 1.000000000f };
    FLinearColor Khaki = { 0.941176534f, 0.901960850f, 0.549019635f, 1.000000000f };
    FLinearColor Lavender = { 0.901960850f, 0.901960850f, 0.980392218f, 1.000000000f };
    FLinearColor LavenderBlush = { 1.000000000f, 0.941176534f, 0.960784376f, 1.000000000f };
    FLinearColor LawnGreen = { 0.486274540f, 0.988235354f, 0.000000000f, 1.000000000f };
    FLinearColor LemonChiffon = { 1.000000000f, 0.980392218f, 0.803921640f, 1.000000000f };
    FLinearColor LightBlue = { 0.678431392f, 0.847058892f, 0.901960850f, 1.000000000f };
    FLinearColor LightCoral = { 0.941176534f, 0.501960814f, 0.501960814f, 1.000000000f };
    FLinearColor LightCyan = { 0.878431439f, 1.000000000f, 1.000000000f, 1.000000000f };
    FLinearColor LightGoldenrodYellow = { 0.980392218f, 0.980392218f, 0.823529482f, 1.000000000f };
    FLinearColor LightGreen = { 0.564705908f, 0.933333397f, 0.564705908f, 1.000000000f };
    FLinearColor LightGray = { 0.827451050f, 0.827451050f, 0.827451050f, 1.000000000f };
    FLinearColor LightPink = { 1.000000000f, 0.713725507f, 0.756862819f, 1.000000000f };
    FLinearColor LightSalmon = { 1.000000000f, 0.627451003f, 0.478431404f, 1.000000000f };
    FLinearColor LightSeaGreen = { 0.125490203f, 0.698039234f, 0.666666687f, 1.000000000f };
    FLinearColor LightSkyBlue = { 0.529411793f, 0.807843208f, 0.980392218f, 1.000000000f };
    FLinearColor LightSlateGray = { 0.466666698f, 0.533333361f, 0.600000024f, 1.000000000f };
    FLinearColor LightSteelBlue = { 0.690196097f, 0.768627524f, 0.870588303f, 1.000000000f };
    FLinearColor LightYellow = { 1.000000000f, 1.000000000f, 0.878431439f, 1.000000000f };
    FLinearColor Lime = { 0.000000000f, 1.000000000f, 0.000000000f, 1.000000000f };
    FLinearColor LimeGreen = { 0.196078449f, 0.803921640f, 0.196078449f, 1.000000000f };
    FLinearColor Linen = { 0.980392218f, 0.941176534f, 0.901960850f, 1.000000000f };
    FLinearColor Magenta = { 1.000000000f, 0.000000000f, 1.000000000f, 1.000000000f };
    FLinearColor Maroon = { 0.501960814f, 0.000000000f, 0.000000000f, 1.000000000f };
    FLinearColor MediumAquamarine = { 0.400000036f, 0.803921640f, 0.666666687f, 1.000000000f };
    FLinearColor MediumBlue = { 0.000000000f, 0.000000000f, 0.803921640f, 1.000000000f };
    FLinearColor MediumOrchid = { 0.729411781f, 0.333333343f, 0.827451050f, 1.000000000f };
    FLinearColor MediumPurple = { 0.576470613f, 0.439215720f, 0.858823597f, 1.000000000f };
    FLinearColor MediumSeaGreen = { 0.235294133f, 0.701960802f, 0.443137288f, 1.000000000f };
    FLinearColor MediumSlateBlue = { 0.482352972f, 0.407843173f, 0.933333397f, 1.000000000f };
    FLinearColor MediumSpringGreen = { 0.000000000f, 0.980392218f, 0.603921592f, 1.000000000f };
    FLinearColor MediumTurquoise = { 0.282352954f, 0.819607913f, 0.800000072f, 1.000000000f };
    FLinearColor MediumVioletRed = { 0.780392230f, 0.082352944f, 0.521568656f, 1.000000000f };
    FLinearColor MidnightBlue = { 0.098039225f, 0.098039225f, 0.439215720f, 1.000000000f };
    FLinearColor MintCream = { 0.960784376f, 1.000000000f, 0.980392218f, 1.000000000f };
    FLinearColor MistyRose = { 1.000000000f, 0.894117713f, 0.882353008f, 1.000000000f };
    FLinearColor Moccasin = { 1.000000000f, 0.894117713f, 0.709803939f, 1.000000000f };
    FLinearColor NavajoWhite = { 1.000000000f, 0.870588303f, 0.678431392f, 1.000000000f };
    FLinearColor Navy = { 0.000000000f, 0.000000000f, 0.501960814f, 1.000000000f };
    FLinearColor OldLace = { 0.992156923f, 0.960784376f, 0.901960850f, 1.000000000f };
    FLinearColor Olive = { 0.501960814f, 0.501960814f, 0.000000000f, 1.000000000f };
    FLinearColor OliveDrab = { 0.419607878f, 0.556862772f, 0.137254909f, 1.000000000f };
    FLinearColor Orange = { 1.000000000f, 0.647058845f, 0.000000000f, 1.000000000f };
    FLinearColor OrangeRed = { 1.000000000f, 0.270588249f, 0.000000000f, 1.000000000f };
    FLinearColor Orchid = { 0.854902029f, 0.439215720f, 0.839215755f, 1.000000000f };
    FLinearColor PaleGoldenrod = { 0.933333397f, 0.909803987f, 0.666666687f, 1.000000000f };
    FLinearColor PaleGreen = { 0.596078455f, 0.984313786f, 0.596078455f, 1.000000000f };
    FLinearColor PaleTurquoise = { 0.686274529f, 0.933333397f, 0.933333397f, 1.000000000f };
    FLinearColor PaleVioletRed = { 0.858823597f, 0.439215720f, 0.576470613f, 1.000000000f };
    FLinearColor PapayaWhip = { 1.000000000f, 0.937254965f, 0.835294187f, 1.000000000f };
    FLinearColor PeachPuff = { 1.000000000f, 0.854902029f, 0.725490212f, 1.000000000f };
    FLinearColor Peru = { 0.803921640f, 0.521568656f, 0.247058839f, 1.000000000f };
    FLinearColor Pink = { 1.000000000f, 0.752941251f, 0.796078503f, 1.000000000f };
    FLinearColor Plum = { 0.866666734f, 0.627451003f, 0.866666734f, 1.000000000f };
    FLinearColor PowderBlue = { 0.690196097f, 0.878431439f, 0.901960850f, 1.000000000f };
    FLinearColor Purple = { 0.501960814f, 0.000000000f, 0.501960814f, 1.000000000f };
    FLinearColor Red = { 1.000000000f, 0.000000000f, 0.000000000f, 1.000000000f };
    FLinearColor RosyBrown = { 0.737254918f, 0.560784340f, 0.560784340f, 1.000000000f };
    FLinearColor RoyalBlue = { 0.254901975f, 0.411764741f, 0.882353008f, 1.000000000f };
    FLinearColor SaddleBrown = { 0.545098066f, 0.270588249f, 0.074509807f, 1.000000000f };
    FLinearColor Salmon = { 0.980392218f, 0.501960814f, 0.447058856f, 1.000000000f };
    FLinearColor SandyBrown = { 0.956862807f, 0.643137276f, 0.376470625f, 1.000000000f };
    FLinearColor SeaGreen = { 0.180392161f, 0.545098066f, 0.341176480f, 1.000000000f };
    FLinearColor SeaShell = { 1.000000000f, 0.960784376f, 0.933333397f, 1.000000000f };
    FLinearColor Sienna = { 0.627451003f, 0.321568638f, 0.176470593f, 1.000000000f };
    FLinearColor Silver = { 0.752941251f, 0.752941251f, 0.752941251f, 1.000000000f };
    FLinearColor SkyBlue = { 0.529411793f, 0.807843208f, 0.921568692f, 1.000000000f };
    FLinearColor SlateBlue = { 0.415686309f, 0.352941185f, 0.803921640f, 1.000000000f };
    FLinearColor SlateGray = { 0.439215720f, 0.501960814f, 0.564705908f, 1.000000000f };
    FLinearColor Snow = { 1.000000000f, 0.980392218f, 0.980392218f, 1.000000000f };
    FLinearColor SpringGreen = { 0.000000000f, 1.000000000f, 0.498039246f, 1.000000000f };
    FLinearColor SteelBlue = { 0.274509817f, 0.509803951f, 0.705882370f, 1.000000000f };
    FLinearColor Tan = { 0.823529482f, 0.705882370f, 0.549019635f, 1.000000000f };
    FLinearColor Teal = { 0.000000000f, 0.501960814f, 0.501960814f, 1.000000000f };
    FLinearColor Thistle = { 0.847058892f, 0.749019623f, 0.847058892f, 1.000000000f };
    FLinearColor Tomato = { 1.000000000f, 0.388235331f, 0.278431386f, 1.000000000f };
    FLinearColor Transparent = { 0.000000000f, 0.000000000f, 0.000000000f, 0.000000000f };
    FLinearColor Turquoise = { 0.250980407f, 0.878431439f, 0.815686345f, 1.000000000f };
    FLinearColor Violet = { 0.933333397f, 0.509803951f, 0.933333397f, 1.000000000f };
    FLinearColor Wheat = { 0.960784376f, 0.870588303f, 0.701960802f, 1.000000000f };
    FLinearColor White = { 1.000000000f, 1.000000000f, 1.0f, 1.000000000f };
    FLinearColor WhiteSmoke = { 0.960784376f, 0.960784376f, 0.960784376f, 1.000000000f };
    FLinearColor Yellow = { 1.000000000f, 1.000000000f, 0.000000000f, 1.000000000f };
    FLinearColor YellowGreen = { 0.603921592f, 0.803921640f, 0.196078449f, 1.000000000f };
};

float aimspeedsl()
{
    // return aimspeed.value;
    float val1 = 20;//50
    //return TurnRate;// aim speed from slider
    return val1;
}
int aimpos()
{
    float speedVal = 25;//100
    //return sliderrr.value;//maybe speed
    return speedVal;
}
int autodiss()
{
    return Auto1.value;
}

NSString *resultx;

@implementation mi
INI* config;
bool MenDeal;

ImVec4 to_vec4(float r, float g, float b, float a)
{
    return ImVec4(r / 255.0, g / 255.0, b / 255.0, a / 255.0);
    
}
        static ImVec4 active = to_vec4(0.729f, 0.098f, 0.031f, 1.0f);
        static ImVec4 inactive = to_vec4(0.729f, 0.098f, 0.031f, 1.0f);

static auto start = std::chrono::steady_clock::now();
static auto noww = std::chrono::high_resolution_clock::now();
auto elapsedd = std::chrono::duration_cast<std::chrono::milliseconds>(noww - start).count();
namespace Settings
{
    static int Tab = 0;
    static int Tabmod = 0;
}



static bool callFunction = false;
#pragma mark - MTKViewDelegate
namespace Variables {
    int ActiveTab = 1;
}
bool callNotify = false;

OverlayView *overlayView;

- (instancetype)initWithFrame:
(ModuleControl*)control {

    self.moduleControl = control;

    //获取Documents目录路径
    NSString *documentsDirectory = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    //初始化文件管理器
    NSFileManager *fileManager = [NSFileManager defaultManager];
    //拼接文件路径
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"dolphins.ini"];
    //文件不存在
    if(![fileManager fileExistsAtPath:filePath]){
        //创建文件
        [fileManager createFileAtPath:filePath contents:[NSData data] attributes:nil];
    }
    //获取ini文件数据
    config = ini_load((char*)filePath.UTF8String);
    return [super init];
    }

-(void)setOverlayView:(OverlayView*)ov{
    overlayView = ov;
    //读配置项
    [self readIniConfig];
}

-(void)drawMenuWindow {
//ImGuiIO& io = ImGui::GetIO();
    

if(UI == 0){

  ImGui::CreateContext();
ImGuiStyle *style = &ImGui::GetStyle();



        // 设置背景颜色（模拟图片中的深色背景）
        ImGui::PushStyleColor(ImGuiCol_WindowBg, ImVec4(1.0f, 1.0f, 1.0f, 0.8f));

        // 设置背景颜色（模拟图片中的深色背景）
        ImGui::PushStyleColor(ImGuiCol_WindowBg, ImVec4(1.0f, 1.0f, 1.0f, 0.8f));

        // 设置标题栏背景颜色（模拟图片中的标题栏颜色）
        ImGui::PushStyleColor(ImGuiCol_TitleBg, ImVec4(1.0f, 1.0f, 1.0f, 0.8f));
        ImGui::PushStyleColor(ImGuiCol_TitleBgActive, ImVec4(1.0f, 1.0f, 1.0f, 0.8f));
        ImGui::PushStyleColor(ImGuiCol_TitleBgCollapsed, ImVec4(1.0f, 1.0f, 1.0f, 0.8f));

        // 设置其他颜色（例如按钮等，可根据需要调整）
        ImGui::PushStyleColor(ImGuiCol_Button, ImVec4(1.0f, 1.0f, 1.0f, 1.0f));
        ImGui::PushStyleColor(ImGuiCol_ButtonHovered, ImVec4(1.0f, 1.0f, 1.0f, 1.0f));
        ImGui::PushStyleColor(ImGuiCol_ButtonActive, ImVec4(1.0f, 1.0f, 1.0f, 1.0f));

ImGui::PushStyleColor(ImGuiCol_TitleBg, IM_COL32(30, 30, 30, 255));
        ImGui::PushStyleColor(ImGuiCol_TitleBgActive, IM_COL32(50, 50, 50, 255));
        ImGui::PushStyleColor(ImGuiCol_TitleBgCollapsed, IM_COL32(30, 30, 30, 255));
        ImGui::PushStyleVar(ImGuiStyleVar_WindowPadding, ImVec2(10, 5));



style->WindowRounding = 5.0f; // 设置窗口的圆角半径为5.0f
style->Colors[ImGuiCol_Text] = ImVec4(0.0f, 0.0f, 0.0f, 1.0f); // 设置文本颜色为白色
style->Colors[ImGuiCol_WindowBg] = ImVec4(1.0f, 1.0f, 1.0f, 0.8f); // 设置窗口背景颜色为深色（接近图片中的深色背景）
style->Colors[ImGuiCol_Button] = ImVec4(0.4f, 0.4f, 0.4f, 1.0f); // 设置按钮颜色为灰色
style->Colors[ImGuiCol_ButtonHovered] = ImVec4(0.5f, 0.5f, 0.5f, 1.0f); // 设置鼠标悬停在按钮上时的颜色为浅灰色
style->Colors[ImGuiCol_ButtonActive] = ImVec4(0.3f, 0.3f, 0.3f, 1.0f); // 设置按钮被按下时的颜色为深灰色
style->WindowPadding = ImVec2(10.0f, 10.0f); // 设置窗口的内边距为(10.0f, 10.0f)
style->ItemSpacing = ImVec2(8.0f, 4.0f); // 设置控件之间的间距为(8.0f, 4.0f)
style->ScrollbarSize = 15.0f; // 设置滚动条的宽度为15.0f
style->FrameRounding = 3.0f; // 设置控件的边框圆角半径为3.0f
style->GrabMinSize = 20.0f; // 设置可拖拽控件的最小尺寸为20.0f
style->WindowBorderSize = 1.0f; // 设置窗口的边框大小为1.0f
style->WindowTitleAlign = ImVec2(0.5f, 0.5f); // 设置窗口标题的对齐方式为居中对齐
style->WindowMenuButtonPosition = ImGuiDir_Left; // 设置窗口菜单按钮的位置为左侧
style->FramePadding = ImVec2(4.0f, 4.0f); // 设置控件的内边距为(4.0f, 4.0f)
style->FrameBorderSize = 1.0f; // 设置控件的边框大小为1.0f
style->ItemInnerSpacing = ImVec2(4.0f, 4.0f); // 设置控件内部元素之间的间距为(4.0f, 4.0f)
style->IndentSpacing = 20.0f; // 设置缩进的宽度为20.0f
style->ScrollbarRounding = 9.0f; // 设置滚动条的圆角半径为9.0f
style->GrabRounding = 3.0f; // 设置可拖拽控件的圆角半径为3.0f
style->TabBorderSize = 1.0f; // 设置选项卡的边框大小为1.0f
style->TabRounding = 4.0f; // 设置选项卡的圆角半径为4.0f
style->TabMinWidthForCloseButton = 0.0f; // 设置未选中选项卡上关闭按钮的最小宽度为0.0f
style->ButtonTextAlign = ImVec2(0.5f, 0.5f); // 设置按钮文本的对齐方式为居中对齐
style->ChildRounding = 5.0f; // 设置子窗口的圆角半径为5.0f
style->ChildBorderSize = 1.0f; // 设置子窗口的边框大小为1.0f
style->PopupRounding = 5.0f; // 设置弹出窗口的圆角半径为5.0f
style->PopupBorderSize = 1.0f; // 设置弹出窗口的边框大小为1.0f
style->ColumnsMinSpacing = 50.0f; // 设置列之间的最小间距为50.0f
style->SelectableTextAlign = ImVec2(0.0f, 0.0f); // 设置可选控件文本的对齐方式为左上



      // 绘制标题栏背景
        ImGui::PushStyleColor(ImGuiCol_TitleBg, IM_COL32(200, 191, 231, 255)); // 浅紫色
        ImGui::PushStyleColor(ImGuiCol_TitleBgActive, IM_COL32(160, 140, 200, 255)); // 稍深的浅紫色（激活状态）
        ImGui::PushStyleColor(ImGuiCol_TitleBgCollapsed, IM_COL32(200, 191, 231, 255)); // 浅紫色（折叠状态）
        ImGui::PushStyleVar(ImGuiStyleVar_WindowPadding, ImVec2(10, 5));
    
style->WindowRounding = 9.0f;//窗口圆角

style->TabRounding = 1.0f; // 选项卡圆角，可按需进一步调整此值来优化形状呈现效果


// 控件设置
style->ItemSpacing = ImVec2(6, 4); // 控件间距
style->ItemInnerSpacing = ImVec2(4, 4); // 控件内部元素间距
style->IndentSpacing = 20.0f; // 缩进宽度
style->ScrollbarSize = 15.0f; // 滚动条宽度
style->ScrollbarRounding = 9.0f; // 滚动条圆角半径
style->GrabMinSize = 20.0f; // 可拖拽控件最小尺寸
style->GrabRounding = 3.0f; // 可拖拽控件圆角半径
style->TabBorderSize = 1.0f; // 选项卡边框大小
style->TabRounding = 4.0f; // 选项卡圆角半径

style->ButtonTextAlign = ImVec2(0.5f, 0.5f); // 按钮文本对齐方式
style->SelectableTextAlign = ImVec2(0.0f, 0.0f); // 可选控件文本对齐方式

// 边框设置
style->FramePadding = ImVec2(8, 6); // 控件内边距
style->FrameRounding = 4.0f; // 控件边框圆角半径
style->FrameBorderSize = 1.0f; // 控件边框大小

// 列设置
style->ColumnsMinSpacing = 50.0f; // 列最小间距






style->FrameBorderSize = 0; // 开启内线框
style->WindowBorderSize = 0; // 关闭外线框
style->ItemSpacing = ImVec2(25.0f, 5.0f); // 间距

//开关check
style->Colors[ImGuiCol_CheckMark] = ImColor(135, 206, 250, 255); //控件Check浅蓝色
//style->Colors[ImGuiCol_CheckMark] = ImVec4(0.39f, 1.72f, 0.57f, 1.00f);


// 将滑动条和选择框改为椭圆形（通过设置圆角半径实现类似效果）
style->FrameRounding = 25.0f; 





// 设置下一个窗口的大小
ImGui::SetNextWindowSize(ImVec2(800, 780), ImGuiCond_FirstUseEver); // 仅在窗口第一次创建时设置大小

ImGuiIO& io = ImGui::GetIO();
    //设置下一个窗口的大小
ImVec2 centerPosition(ImGui::GetIO().DisplaySize.x * 0.5f, ImGui::GetIO().DisplaySize.y * 0.5f);

// 设置窗口位置和大小
    ImGui::SetNextWindowPos({300, 100}, ImGuiCond_FirstUseEver); // 居中

//    ImGui::SetNextWindowSize({750, 700}, ImGuiCond_FirstUseEver);

//ImGui::SetNextWindowPos(ImVec2(io.DisplaySize.x * 0.5f, io.DisplaySize.y * 0.5f), 0, ImVec2(0.5f, 0.5f));






//    ImGui::SetNextWindowSize({750, 700}, ImGuiCond_FirstUseEver);

//ImGui::SetNextWindowPos(ImVec2(io.DisplaySize.x * 0.5f, io.DisplaySize.y * 0.5f), 0, ImVec2(0.5f, 0.5f));

        ImGui::PushStyleColor(ImGuiCol_TitleBg, ImVec4(1.0f, 1.0f, 1.0f, 0.8f));
        ImGui::PushStyleColor(ImGuiCol_TitleBgActive, ImVec4(1.0f, 1.0f, 1.0f, 0.8f));
        ImGui::PushStyleColor(ImGuiCol_TitleBgCollapsed, ImVec4(1.0f, 1.0f, 1.0f, 0.8f));
style->WindowBorderSize = 1;
// 子窗口边框大小
style->ChildBorderSize = 1;
// 弹出窗口边框大小
style->PopupBorderSize = 1;

// 窗口圆角半径
style->WindowRounding = 9;
// 子窗口圆角半径
style->ChildRounding = 12;
// 弹出窗口圆角半径
style->PopupRounding = 15;

// 框架（如按钮等）圆角半径
style->FrameRounding = 7;
// 滚动条圆角半径
style->ScrollbarRounding = 12;
// 可拖动元素（如滑块等）圆角半径
style->GrabRounding = 2;

// 框架内边距（按钮等内部的填充）
style->FramePadding = ImVec2(20.0f, 5.0f);
// 元素之间的内间距
style->ItemInnerSpacing = ImVec2(4.0f, 4.0f);
// 缩进间距
style->IndentSpacing = 20;

// 滚动条宽度
style->ScrollbarSize = 28;
// 可拖动元素的最小尺寸
style->GrabMinSize = 10;
// 元素之间的间距
style->ItemSpacing = ImVec2(50.0f, 5.0f);

}else if(UI == 1){
// 初始化 ImGui 上下文（需在程序开始时调用一次）
ImGui::CreateContext();

// 获取全局样式对象
ImGuiStyle* style = &ImGui::GetStyle();

// ---------------------------
// 基础颜色配置
// ---------------------------
// 设置窗口标题栏颜色（黑色系）
ImVec4 dark_black = ImVec4(0.05f, 0.05f, 0.05f, 1.0f);  // 深黑
ImVec4 medium_black = ImVec4(0.12f, 0.12f, 0.12f, 1.0f); // 中黑
ImVec4 light_black = ImVec4(0.20f, 0.20f, 0.20f, 1.0f);  // 浅黑

// 设置文本颜色（纯白）
ImVec4 pure_white = ImVec4(0.65f, 0.65f, 0.65f, 1.0f);

// ---------------------------
// 核心样式配置
// ---------------------------
// 标题栏样式（菜单栏区域）
style->Colors[ImGuiCol_TitleBg] = medium_black;        // 未激活标题栏
style->Colors[ImGuiCol_TitleBgActive] = light_black;   // 激活状态标题栏
style->Colors[ImGuiCol_TitleBgCollapsed] = dark_black; // 折叠状态标题栏

// 文本颜色设置
style->Colors[ImGuiCol_Text] = pure_white;             // 普通文本
style->Colors[ImGuiCol_TextDisabled] = ImVec4(0.5f, 0.5f, 0.5f, 1.0f); // 禁用文本

// 窗口背景（深灰提升对比度）
style->Colors[ImGuiCol_WindowBg] = ImVec4(0.08f, 0.08f, 0.08f, 1.0f);

// 菜单栏背景
style->Colors[ImGuiCol_MenuBarBg] = medium_black;

// 按钮样式
style->Colors[ImGuiCol_Button] = light_black;
style->Colors[ImGuiCol_ButtonHovered] = ImVec4(0.3f, 0.3f, 0.3f, 1.0f);
style->Colors[ImGuiCol_ButtonActive] = ImVec4(0.4f, 0.4f, 0.4f, 1.0f);

// 边框样式
style->Colors[ImGuiCol_Border] = ImVec4(0.3f, 0.3f, 0.3f, 1.0f);
style->Colors[ImGuiCol_FrameBg] = ImVec4(0.15f, 0.15f, 0.15f, 1.0f);
style->Colors[ImGuiCol_FrameBgHovered] = ImVec4(0.25f, 0.25f, 0.25f, 1.0f);

// 滚动条
style->Colors[ImGuiCol_ScrollbarBg] = dark_black;
style->Colors[ImGuiCol_ScrollbarGrab] = light_black;
style->Colors[ImGuiCol_ScrollbarGrabHovered] = ImVec4(0.35f, 0.35f, 0.35f, 1.0f);

// ---------------------------
// 高级视觉参数
// ---------------------------
// 圆角设置（数值越大越圆润）
style->WindowRounding = 8.0f;    // 窗口圆角
style->FrameRounding = 5.0f;     // 控件圆角
style->GrabRounding = 5.0f;      // 滑块圆角
style->TabRounding = 6.0f;       // 选项卡圆角

// 间距与尺寸
style->WindowPadding = ImVec2(10.0f, 10.0f);     // 窗口内边距
style->FramePadding = ImVec2(5.0f, 4.0f);        // 控件内边距
style->ItemSpacing = ImVec2(10.0f, 8.0f);        // 控件间距
style->ScrollbarSize = 12.0f;                    // 滚动条尺寸

// 边框尺寸
style->WindowBorderSize = 1.0f;    // 窗口边框
style->FrameBorderSize = 1.0f;     // 控件边框

// 对齐方式
style->WindowTitleAlign = ImVec2(0.5f, 0.5f);  // 标题居中

// ---------------------------
// 额外增强效果
// ---------------------------
// 添加阴影效果（通过边框实现）
style->Colors[ImGuiCol_BorderShadow] = ImVec4(0.0f, 0.0f, 0.0f, 0.4f);

// 禁用默认的外边框
style->WindowBorderSize = 0.0f;

// 启用抗锯齿（需ImGui版本支持）
style->AntiAliasedLines = true;
style->AntiAliasedFill = true;

// ---------------------------
// 窗口初始化设置
// ---------------------------
// 设置初始窗口位置和大小
ImGuiIO& io = ImGui::GetIO();
ImVec2 center = ImVec2(io.DisplaySize.x * 0.5f, io.DisplaySize.y * 0.5f);
ImGui::SetNextWindowPos(center, ImGuiCond_FirstUseEver, ImVec2(0.5f, 0.5f));
ImGui::SetNextWindowSize(ImVec2(800, 600), ImGuiCond_FirstUseEver);

// 注意：需要另外加载中文字体（示例）：
// ImGui::GetIO().Fonts->AddFontFromFileTTF("NotoSansSC-Regular.ttf", 16.0f, NULL, io.Fonts->GetGlyphRangesChineseFull());
style->WindowBorderSize = 1;
// 子窗口边框大小
style->ChildBorderSize = 1;
// 弹出窗口边框大小
style->PopupBorderSize = 1;

// 窗口圆角半径
style->WindowRounding = 9;
// 子窗口圆角半径
style->ChildRounding = 12;
// 弹出窗口圆角半径
style->PopupRounding = 15;

// 框架（如按钮等）圆角半径
style->FrameRounding = 7;
// 滚动条圆角半径
style->ScrollbarRounding = 12;
// 可拖动元素（如滑块等）圆角半径
style->GrabRounding = 2;

// 框架内边距（按钮等内部的填充）
style->FramePadding = ImVec2(20.0f, 5.0f);
// 元素之间的内间距
style->ItemInnerSpacing = ImVec2(4.0f, 4.0f);
// 缩进间距
style->IndentSpacing = 20;

// 滚动条宽度
style->ScrollbarSize = 28;
// 可拖动元素的最小尺寸
style->GrabMinSize = 10;
// 元素之间的间距
style->ItemSpacing = ImVec2(50.0f, 5.0f);
}


// 窗口边框大小

// 设置右下角为深色并且拉动可以设置下一个窗口的大小
ImGui::SetNextWindowSize(ImVec2(1100, 750), ImGuiCond_FirstUseEver); 
//ImGui::SetNextWindowSize(ImVec2(1100, 750), ImGuiCond_SecondUseEver);
// 仅在窗口第一次创建时设置大小￼
if(Al == 0){
    if (ImGui::Begin("IOS Mini Max ENGINE V.4.0.0", &self.moduleControl->menuStatus, ImGuiWindowFlags_NoCollapse )) {

ImGui::Separator();
ImGui::PushStyleColor(ImGuiCol_Button, Settings::Tab == 0 ? active : inactive);
            if (ImGui::Button(ICON_FA_HOME" 公告", ImVec2(150, 40)))
                Settings::Tab = 0;
            
            ImGui::SameLine();
            ImGui::PushStyleColor(ImGuiCol_Button, Settings::Tab == 1 ? active : inactive);
            
if (ImGui::Button(ICON_FA_EYE" 绘制", ImVec2(150, 40)))
                Settings::Tab = 1;
            
ImGui::SameLine();
            ImGui::PushStyleColor(ImGuiCol_Button, Settings::Tab == 2 ? active : inactive);
            if (ImGui::Button(ICON_FA_TV"瞄准设置", ImVec2(150, 40)))
                Settings::Tab = 2;
            
            ImGui::SameLine();
            ImGui::PushStyleColor(ImGuiCol_Button, Settings::Tab == 3 ? active : inactive);
            if (ImGui::Button(ICON_FA_CROSSHAIRS"娱乐功能", ImVec2(150, 40)))
                Settings::Tab = 3;
            
            /*ImGui::SameLine();
            ImGui::PushStyleColor(ImGuiCol_Button, Settings::Tab == 4 ? active : inactive);
            if (ImGui::Button(ICON_FA_GAMEPAD" 美化", ImVec2(150, 40)))
                Settings::Tab = 4;*/
            
{
            if (Settings::Tab == 0) {


    ImGui::Separator();
    ImGui::Text("FPS: %.1f", ImGui::GetIO().Framerate);
    ImGui::Text("Frame Time: %.3f ms", 1000.0f / ImGui::GetIO().Framerate);
    ImGui::Text("Render Time: %.3f ms", ImGui::GetIO().DeltaTime * 1000.0f);
ImGui::Separator(); 
ImGui::Text("感谢小宁对MiniMax的技术支持");     
ImGui::Text("本插件为公益插件，封号自理\n下面有SDK防进入对局后开启，一把一退\n已注入防封");
    ImGui::Separator();
ImGui::Text("UI选择:");
if (ImGui::RadioButton("白色主题", &UI, 0));
 ImGui::SameLine();
			   if (ImGui::RadioButton("黑色主题", &UI, 1));
ImGui::Separator();
ImGui::Text("语言选择:");
if (ImGui::RadioButton("中文", &Al, 0));
 ImGui::SameLine();
			   if (ImGui::RadioButton("English", &Al, 1));
ImGui::Separator();
ImGui::Checkbox("SDK防封",&SDKF);
ImGui::SameLine();
ImGui::Checkbox(("对局信息"), &thongtin);
      ImGui::SameLine();
ImGui::Checkbox(("修复图层"), &Config.ESPMenu.ESPON);
ImGui::Separator();
 if(ImGui::Button("点击加入IOS交流群")){
            NSString *urlString = @"https://qm.qq.com/q/awWutWcWkM";
            NSURL *url = [NSURL URLWithString:urlString];
            [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
        }
ImGui::Separator();
if(ImGui::Button("点击我加入MiniMax官方频道")){
            NSString *urlString = @"https://t.me/MiniMAXNB";
            NSURL *url = [NSURL URLWithString:urlString];
            [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];

        }
ImGui::Separator();

if(ImGui::Button("点击我加入UCTOOL频道")){
            NSString *urlString = @"https://t.me/XNUcTools";
            NSURL *url = [NSURL URLWithString:urlString];
            [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];

        }

ImGui::Separator();
        ImGui::SameLine();
        ImGui::SameLine();
    ImGui::Separator();           
if (ImGui::CollapsingHeader("绘制大小"))
{
    

ImGui::SliderFloat("信息字体大小", &EspTextSiz, 1, 15);

ImGui::SliderFloat("物资字体大小", &IteTextSiz, 1, 15);

ImGui::SliderFloat("方框线条粗细", &EspBoxThik, 1.0f, 4.0f);

ImGui::SliderFloat("骨骼线条粗细", &EspSktonThik, 1.0f, 3.0f);

ImGui::SliderFloat("警报信息大小", &iAwareTexSiz, 10, 40);
}
if (ImGui::CollapsingHeader("打击圈颜色调整"))
{
		if (ImGui::RadioButton("白色(默认)", &CL, 1));
 ImGui::SameLine();
			   if (ImGui::RadioButton("红色", &CL, 2));
		 ImGui::SameLine();
			   if (ImGui::RadioButton("黄色", &CL, 3));
			   ImGui::SameLine();
			   if (ImGui::RadioButton("绿色", &CL, 4));
if (ImGui::RadioButton("黑色", &CL, 5));
 ImGui::SameLine();
			   //if (ImGui::RadioButton("红色", &CL, ));
		 //ImGui::SameLine();
			   if (ImGui::RadioButton("蓝色", &CL, 6));
			   ImGui::SameLine();
			   if (ImGui::RadioButton("橙色", &CL, 7));
}
}
else if (Settings::Tab == 1) {
ImGui::Separator();
ImGui::Checkbox(("人物射线"), &Config.ESPMenu.Line);
      ImGui::SameLine();
ImGui::Checkbox(("人物信息"), &Config.ESPMenu.Name);
     ImGui::SameLine();
ImGui::Checkbox(("3D方框"), &Config.ESPMenu.Box);
ImGui::SameLine();
ImGui::Checkbox(("背后预警"), &Config.ESPMenu.Alert);
ImGui::SameLine();
ImGui::Checkbox(("雷达预警"), &Config.ESPMenu.Radar);
ImGui::Checkbox(("手雷预警"), &Config.ESPMenu.GRWAR);
ImGui:: SameLine();
ImGui::Checkbox(("忽略人机"), &Config.ESPMenu.IgnoreBot);
      ImGui::SameLine();
ImGui::Checkbox(("人物骨骼"), &Config.ESPMenu.Skeleton);
      ImGui::SameLine();
ImGui::Checkbox(("人物手持"), &Config.ESPMenu.Weapon);
   
const char* xsuuity[] = { "血条选择", "血条1", "血条2", "血条3","血条4","血条5"};
ImGui::Combo("##xs", &血条, xsuuity, IM_ARRAYSIZE(xsuuity));
ImGui::Separator();
if (ImGui::Combo("##linesetting", &SX, "天线(默认)\0十字线\0地线\0")){
                    
                }
    ImGui::Separator();

ImGui::SliderFloat("雷达X", &Config.ESPMenu.RadarX, 1, 125);

ImGui::SliderFloat("雷达Y", &Config.ESPMenu.RadarY, 1, 60);
ImGui::SameLine();
ImGui::Checkbox(("绘制自身"),&TS);
//ImGui::SameLine();
//ImGui::Checkbox("人物脚下六芒星",&方框);
if (ImGui::CollapsingHeader("物资绘制"))
{    
ImGui::Checkbox("物资绘制", &IsITM);
      ImGui::SameLine();
ImGui::Checkbox("现代枪", &IsShotgun);
      ImGui::SameLine();
ImGui::Checkbox("步枪", &IsAR);
      ImGui::SameLine();
ImGui::Checkbox("冲锋枪", &IsSMG);
      ImGui::SameLine();
ImGui::Checkbox("子弹", &IsAmmo);
      ImGui::SameLine();
ImGui::Checkbox("狙击枪", &IsSniper);

ImGui::Checkbox("盒子显示", &IsLootBox);
      ImGui::SameLine();
ImGui::Checkbox("车辆显示", &IsVehcle);
      ImGui::SameLine();
ImGui::Checkbox("车辆耐久", &IsCarFuel);
      ImGui::SameLine();
ImGui::Checkbox("车辆血条", &IsCarHP);
      ImGui::SameLine();
ImGui::Checkbox("车辆方框", &IsboxVechle);
}
}
 //ImGui::PushStyleColor(ImGuiCol_Header, ImVec4(0.7f, 0.8f, 1.5f, 1.0f)); 

else if (Settings::Tab == 2) { 
ImGui::Separator();
if (ImGui::Checkbox(("函数自瞄"),                                            &preferences.Config.SilentAim.AimBot)) {
                        }
      ImGui::SameLine();
if (ImGui::Checkbox(("函数追踪"),                                            &preferences.Config.SilentAim.Enable)) {
                        }
      ImGui::SameLine();                        
if (ImGui::Checkbox(("掩体漏打"),                                            &preferences.Config.SilentAim.VisCheck)) {                            
                        }
ImGui::SameLine();                        
if (ImGui::Checkbox(("瞄准线"),                                            &瞄准线)) {                            
                        }
ImGui::SameLine();
if (ImGui::Checkbox(("修穿"),&Fixshoot)) {                            
                        }
/*if(ImGui::Checkbox(("跳跃时不追"),&TY)){
}
ImGui::SameLine();*/
if (ImGui::Checkbox(("过滤倒地"),                                            &preferences.Config.SilentAim.IgnoreKnocked)) {                            
                        } 
      ImGui::SameLine();                       
if (ImGui::Checkbox(("过滤人机"),                                            &preferences.Config.SilentAim.IgnoreBot)) {                            
                        }
ImGui::SameLine();
ImGui::Checkbox("自动开火",&自动开火);
ImGui::SameLine();
ImGui::Checkbox("看到人自动跳跃",&KH);
//ImGui::SameLine();
//ImGui::Checkbox("手雷自瞄",&手雷自瞄);
ImGui::Separator();
const char* xsuuity[] = { "普通打击圈", "动态圈","人物圈"};
ImGui::Combo("##xs", &打击圈, xsuuity, IM_ARRAYSIZE(xsuuity));
    ImGui::Separator();
ImGui::Text("追踪打击部位:");
		if (ImGui::RadioButton("头部", &Aim, 1));
 ImGui::SameLine();
			   if (ImGui::RadioButton("颈部", &Aim, 4));
		 ImGui::SameLine();
			   if (ImGui::RadioButton("腹部", &Aim, 2));
			   ImGui::SameLine();
			   if (ImGui::RadioButton("随机(追踪)", &Aim, 3));
ImGui::Text(("打击方式 :"));                                                
if (ImGui::RadioButton("开火", &AimF, 1)){                            
                        }
ImGui::SameLine();
if (ImGui::RadioButton("开镜", &AimF, 2)){                            
                        }
ImGui::SameLine();
if (ImGui::RadioButton("镜火", &AimF, 3)){                            
                        }
if (ImGui::SliderInt("追踪概率", &追踪概率, 1, 100)){
								
						}
ImGui::Text("打击设置:"); 
ImGui::SliderFloat("压强系数", &Aimsmooth, 1.0f, 1.5f);
ImGui::SliderFloat("X轴速度", &Xs, 1.0f, 6.0f);
ImGui::SliderFloat("Y轴速度", &Ys, 1.0f, 6.0f);
    ImGui::Separator();

ImGui::Text(("范围圈 : "));                                                                  ImGui::SliderInt("##fov", &preferences.Config.SilentAim.Cross, 1.0f, 1000.0f);

ImGui::Text(("打击距离 : "));                        
ImGui::SliderFloat("##distance", &g_disstance, 1.0f, 500.f);

/*ImGui::Text(("打击部位 : "));                        
static const char *targets[] = {("头部"),("身体")};
if (ImGui::Combo(("##Target"),                                         (int *) &preferences.Config.SilentAim.Target, targets, 2,                                         -1)) {                            
                        }*/


}
  
 else if (Settings::Tab == 3) {  
ImGui::Separator();
if (ImGui::Button("胜利")) {      
    g_LocalPlayer->STPlayerController->RPC_GiveUpGame();//        


                        }
ImGui::SameLine();
if (ImGui::Button("退出对局")) {
g_LocalPlayer->STPlayerController->ClientInterruptGame();
}
ImGui::SameLine();
if (ImGui::Button("僵尸来了")) {
g_LocalPlayer->STPlayerController->ClientShowInfectAreaWarning();// 0x6045e58  //  客户端显示感染区域警告
}
//ImGui::SameLine();
ImGui::Checkbox("地铁飞天（大厅）",&大厅);
ImGui::Checkbox("地铁飞天（局内）",&Tp); 
if (ImGui::Checkbox(("打击特效"),                                            &preferences.Config.SilentAim.HitX)) {                            
                        }
ImGui::Checkbox("人物大小",&人物变大);
ImGui::Separator();
ImGui::Checkbox("敌人大小",&敌人大小);
if(敌人大小){
ImGui::SliderFloat("调节大小", &巨人2, 0.0f, 10.0f);
}
if(人物变大){
ImGui::SliderFloat("调节大小", &巨人, 0.0f, 2.0f);
}
ImGui::Separator();


 

if(ImGui::Checkbox("打饮料加速",&打饮料加速)){
}
ImGui::Separator();
if(ImGui::Checkbox("快速换弹",&快速换弹)){
}
ImGui::Separator();
if(ImGui::Checkbox("高伤（解决打人有时没伤害）",&高伤)){
}
ImGui::Separator();
//ImGui:: Checkbox ("踏空",&疯狗模式);
//ImGui::Checkbox("无限子弹",&无限子弹);
//ImGui::Separator();
ImGui::Checkbox("无限子弹",&SHXS);
ImGui::Separator();
ImGui::Checkbox("伤害显示",&SHxs);
//ImGui::Separator();
//ImGui::Checkbox("加速",&加速);
if (ImGui::Checkbox("微加速", &v加速)) {
}

if(v加速){
ImGui::SliderFloat("微加速速度", &Qo,1.f, 15.f);
} 

ImGui::Separator();
ImGui::Checkbox("高跳",&高跳);
if(ImGui::Checkbox("趴下无后摇",&WHY)){
if(WHY){

g_LocalPlayer->MoveableSwitchPoseTime = 0;
    *(float *) ((uintptr_t) &g_LocalPlayer->SwitchPoseTime) = 0.f;
    *(float *) ((uintptr_t) &g_LocalPlayer->SwitchPoseTime+0x4) = 0.f;
    *(float *) ((uintptr_t) &g_LocalPlayer->SwitchPoseTime+0x8) = 0.f;
    *(float *) ((uintptr_t) &g_LocalPlayer->SwitchPoseTime+0xc) = 0.f;
}
}
ImGui::Separator();
if(ImGui::Checkbox("吸人",&吸人)){
}
ImGui::Separator();
ImGui::Checkbox("路飞",&路飞);
ImGui::Separator();
//ImGui::Checkbox("自动路飞",&agha3);
//ImGui::Separator();
ImGui::Checkbox("枪械变大",&BigQ);
if(BigQ){
ImGui::SliderInt("枪械大小", &Gun_Size, 0, 15);

}
ImGui::Separator();
if(ImGui::Checkbox("开火加速",&开火加速)){
}
ImGui::Separator();
if(ImGui::Checkbox("开火据点",&开火据点)){
}
ImGui::Separator();
ImGui::Checkbox("无后坐力", &preferences.Config.SilentAim.ReCo);
ImGui::Separator();      
ImGui::Checkbox("人物广角", &WideView);
           if (WideView){
ImGui::SliderInt("广角范围", &WideValue, 90, 140);
     }
ImGui::Separator();

      
      

      
if (ImGui::Checkbox(("子弹瞬击"),                                            &preferences.Config.SilentAim.FastShoot)) {                            
                        }
  ImGui::Separator();                      
      
      
if (ImGui::Checkbox(("跳伞加速"),                                            &tiaosan)) {                            
                        }
ImGui::Separator();                             
if (ImGui::Checkbox(("暴力载具/开关"),                                            &feiche)) {                            
                        }
      if (feiche){
ImGui::SliderFloat("载具速度", &FuckValue, 0.0f, 1000.f);
     }
ImGui::Separator();
//ImGui::Checkbox("载具大小", &CarSize);
if(CarSize){
ImGui::SliderFloat("大小调节", &A4, 0.1f, 5.0f);//0.1f 5.0f是size调节
//Pubg自定义载具大小
}
ImGui::Separator();
//ImGui::Checkbox("载具漂移", &isSpinning);
if(isSpinning){
ImGui::SliderFloat("旋转速度", &tocdolon, 1.0f, 400.f);  
}
ImGui::Separator();
//ImGui::Checkbox("载具广角",&CarWideView);
if(CarWideView){
ImGui::SliderInt("广角范围", &CarView, 90, 140);
}
ImGui::Separator();
//ImGui::Checkbox("载具传送",&CarTp);
//ImGui::Separator();
ImGui::Checkbox("载具飞行", &FlyCar);
if(FlyCar){
ImGui::SliderFloat("飞行高度",&ZAxisSpeed, 0.0f, 400.f);  
}
ImGui::Separator();
/*ImGui::Checkbox("载具自瞄", &FlyFuck);
ImGui::Separator();
ImGui::Checkbox("载具高跳",&HighCar);
ImGui::Separator();*/


ImGui::Separator();    






// 菜单2对应-梅花
} /*else if (Settings::Tab == 4) {
    
           
                        
                        
                    }*/
                    ImGui::EndTabBar();//
                
}

                 

ImVec2 screenSize = ImGui::GetIO().DisplaySize;
ImVec2 windowSize = ImVec2(400, 110); // 窗口大小
ImVec2 windowPos = ImVec2(screenSize.x - windowSize.x - 10, 10);

ImGui::SetNextWindowPos(windowPos, ImGuiCond_Always);
ImGui::SetNextWindowSize(windowSize, ImGuiCond_Always);


ImGui::End();
}
}
/*ImGui::SetNextWindowSize(ImVec2(800, 780), ImGuiCond_FirstUseEver); // 仅在窗口第一次创建时设置大小

ImGuiIO& io = ImGui::GetIO();
    //设置下一个窗口的大小
ImVec2 centerPosition(ImGui::GetIO().DisplaySize.x * 0.5f, ImGui::GetIO().DisplaySize.y * 0.5f);*/

// 设置窗口位置和大小
    ImGui::SetNextWindowPos({300, 100}, ImGuiCond_FirstUseEver);
ImGui::SetNextWindowSize(ImVec2(1100, 750), ImGuiCond_FirstUseEver); 
if (Al == 1){
if (ImGui::Begin("IOS Mini Max ENGINE V.4.0.0", &self.moduleControl->menuStatus, ImGuiWindowFlags_NoCollapse )) {
ImGui::Separator();
ImGui::PushStyleColor(ImGuiCol_Button, Settings::Tabmod == 0 ? active : inactive);
            if (ImGui::Button(ICON_FA_HOME"Home", ImVec2(150, 40)))
                Settings::Tabmod = 0;
            
            ImGui::SameLine();
            ImGui::PushStyleColor(ImGuiCol_Button, Settings::Tabmod == 1 ? active : inactive);
            
if (ImGui::Button(ICON_FA_EYE"Draw ", ImVec2(150, 40)))
                Settings::Tabmod = 1;
            
ImGui::SameLine();
            ImGui::PushStyleColor(ImGuiCol_Button, Settings::Tabmod == 2 ? active : inactive);
            if (ImGui::Button(ICON_FA_TV"Aim", ImVec2(150, 40)))
                Settings::Tabmod = 2;
            
            ImGui::SameLine();
            ImGui::PushStyleColor(ImGuiCol_Button, Settings::Tabmod == 3 ? active : inactive);
            if (ImGui::Button(ICON_FA_CROSSHAIRS"Fun", ImVec2(150, 40)))
                Settings::Tabmod = 3;
            
            /*ImGui::SameLine();
            ImGui::PushStyleColor(ImGuiCol_Button, Settings::Tab == 4 ? active : inactive);
            if (ImGui::Button(ICON_FA_GAMEPAD" 美化", ImVec2(150, 40)))
                Settings::Tab = 4;*/
            
{
            if (Settings::Tabmod == 0) {


    ImGui::Separator();
    ImGui::Text("FPS: %.1f", ImGui::GetIO().Framerate);
    ImGui::Text("Frame Time: %.3f ms", 1000.0f / ImGui::GetIO().Framerate);
    ImGui::Text("Render Time: %.3f ms", ImGui::GetIO().DeltaTime * 1000.0f);
ImGui::Text("Thanks to Xiao Ning for the technical support of MiniMax.");
ImGui::Separator();      
ImGui::Text("This plug-in is free, and the account is blocked by yourself\nThere is an SDK anti-ban below. After entering the game, it will be opened one by one.\nAnti-blocking has been injected.");
    ImGui::Separator();
ImGui::Text("语言选择:");
if (ImGui::RadioButton("中文", &Al, 0));
 ImGui::SameLine();
			   if (ImGui::RadioButton("English", &Al, 1));
ImGui::Separator();
ImGui::Checkbox("SDK anti-ban",&SDKF);
ImGui::SameLine();
ImGui::Checkbox(("thongtin"), &thongtin);
      ImGui::SameLine();
ImGui::Checkbox(("ESPON"), &Config.ESPMenu.ESPON);
ImGui::Separator();
/* if(ImGui::Button("点击加入IOS交流群")){
            NSString *urlString = @"https://qm.qq.com/q/awWutWcWkM";
            NSURL *url = [NSURL URLWithString:urlString];
            [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
        }*/


ImGui::Separator();
if(ImGui::Button("Click me to join the official channel of MiniMax")){
            NSString *urlString = @"https://t.me/MiniMAXNB";
            NSURL *url = [NSURL URLWithString:urlString];
            [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];

        }
ImGui::Separator();

if(ImGui::Button("Click me to join the UCTOOL channel")){
            NSString *urlString = @"https://t.me/XNUcTools";
            NSURL *url = [NSURL URLWithString:urlString];
            [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];

        }

ImGui::Separator();
//ImGui::Separator();
/*if(ImGui::Button("点击我购买8级号")){
            NSString *urlString = @"https://fk.zmfaka.com/links/6182AB64";
            NSURL *url = [NSURL URLWithString:urlString];
            [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];

        }*/
ImGui::Separator();
        ImGui::SameLine();
        ImGui::SameLine();
    ImGui::Separator();           
if (ImGui::CollapsingHeader("Draw the size"))
{
    

ImGui::SliderFloat("Information font size", &EspTextSiz, 1, 15);

ImGui::SliderFloat("Font size of materials", &IteTextSiz, 1, 15);

ImGui::SliderFloat("The box line is thick and thin.", &EspBoxThik, 1.0f, 4.0f);

ImGui::SliderFloat("The thickness of the bone line", &EspSktonThik, 1.0f, 3.0f);

ImGui::SliderFloat("The size of the alarm information", &iAwareTexSiz, 10, 40);
}
if (ImGui::CollapsingHeader("Color adjustment of the strike circle"))
{
		if (ImGui::RadioButton("White (default)", &CL, 1));
 ImGui::SameLine();
			   if (ImGui::RadioButton("Red", &CL, 2));
		 ImGui::SameLine();
			   if (ImGui::RadioButton("Yellow", &CL, 3));
			   ImGui::SameLine();
			   if (ImGui::RadioButton("Green", &CL, 4));
if (ImGui::RadioButton("black", &CL, 5));
 ImGui::SameLine();
			   //if (ImGui::RadioButton("红色", &CL, ));
		 //ImGui::SameLine();
			   if (ImGui::RadioButton("blue", &CL, 6));
			   ImGui::SameLine();
			   if (ImGui::RadioButton("Orange", &CL, 7));
}
}
else if (Settings::Tabmod == 1) {
ImGui::Separator();
ImGui::Checkbox(("Line"), &Config.ESPMenu.Line);
      ImGui::SameLine();
ImGui::Checkbox(("Information"), &Config.ESPMenu.Name);
     ImGui::SameLine();
ImGui::Checkbox(("3DBox"), &Config.ESPMenu.Box);
ImGui::SameLine();
ImGui::Checkbox(("Alert"), &Config.ESPMenu.Alert);
ImGui::SameLine();
ImGui::Checkbox(("Radar"), &Config.ESPMenu.Radar);
ImGui::Checkbox(("Grwar"), &Config.ESPMenu.GRWAR);
ImGui:: SameLine();
ImGui::Checkbox(("IgnoreBot"), &Config.ESPMenu.IgnoreBot);
      ImGui::SameLine();
ImGui::Checkbox(("Skeleton"), &Config.ESPMenu.Skeleton);
      ImGui::SameLine();
ImGui::Checkbox(("Weapon"), &Config.ESPMenu.Weapon);
   
const char* xsuuity[] = { "HP chose", "HP1", "HP2", "HP3","HP4","HP5"};
ImGui::Combo("##xs", &血条, xsuuity, IM_ARRAYSIZE(xsuuity));
ImGui::Separator();
if (ImGui::Combo("##linesetting", &SX, "Aerial(default)\0Crosshair\0Earth wire\0")){
                    
                }
    ImGui::Separator();

ImGui::SliderFloat("Radar.X", &Config.ESPMenu.RadarX, 1, 125);

ImGui::SliderFloat("Radar.Y", &Config.ESPMenu.RadarY, 1, 60);
ImGui::SameLine();
ImGui::Checkbox(("Draw Oneself"),&TS);
//ImGui::SameLine();
//ImGui::Checkbox("人物脚下六芒星",&方框);
if (ImGui::CollapsingHeader("Goods and materials"))
{    
ImGui::Checkbox("Goods and materials", &IsITM);
      ImGui::SameLine();
ImGui::Checkbox("IsShotgun", &IsShotgun);
      ImGui::SameLine();
ImGui::Checkbox("IsAR", &IsAR);
      ImGui::SameLine();
ImGui::Checkbox("IsSMG", &IsSMG);
      ImGui::SameLine();
ImGui::Checkbox("IsAmmo", &IsAmmo);
      ImGui::SameLine();
ImGui::Checkbox("IsSniper", &IsSniper);

ImGui::Checkbox("IsLootBox", &IsLootBox);
      ImGui::SameLine();
ImGui::Checkbox("IsVehcle", &IsVehcle);
      ImGui::SameLine();
ImGui::Checkbox("IsCarFuel", &IsCarFuel);
      ImGui::SameLine();
ImGui::Checkbox("IsCarHP", &IsCarHP);
      ImGui::SameLine();
ImGui::Checkbox("IsboxVechle", &IsboxVechle);
}
}
 //ImGui::PushStyleColor(ImGuiCol_Header, ImVec4(0.7f, 0.8f, 1.5f, 1.0f)); 

else if (Settings::Tabmod == 2) { 
ImGui::Separator();
if (ImGui::Checkbox(("AimBot"),                                            &preferences.Config.SilentAim.AimBot)) {
                        }
      ImGui::SameLine();
if (ImGui::Checkbox(("Enable"),                                            &preferences.Config.SilentAim.Enable)) {
                        }
      ImGui::SameLine();                        
if (ImGui::Checkbox(("VisCheck"),                                            &preferences.Config.SilentAim.VisCheck)) {                            
                        }
ImGui::SameLine();                        
if (ImGui::Checkbox(("Aim Line"),                                            &瞄准线)) {                            
                        }
ImGui::SameLine();
if (ImGui::Checkbox(("Fixshoot"),&Fixshoot)) {                            
                        }
/*if(ImGui::Checkbox(("跳跃时不追"),&TY)){
}
ImGui::SameLine();*/
if (ImGui::Checkbox(("IgnoreKnocked"),                                            &preferences.Config.SilentAim.IgnoreKnocked)) {                            
                        } 
      ImGui::SameLine();                       
if (ImGui::Checkbox(("IgnoreBot"),                                            &preferences.Config.SilentAim.IgnoreBot)) {                            
                        }
ImGui::SameLine();
ImGui::Checkbox("Auto Fire",&自动开火);
ImGui::SameLine();
ImGui::Checkbox("Auto Jump",&KH);
//ImGui::SameLine();
//ImGui::Checkbox("手雷自瞄",&手雷自瞄);
ImGui::Separator();
const char* xsuuity[] = { "Ordinary Fov", "Trends Fov","Figure Fov"};
ImGui::Combo("##xs", &打击圈, xsuuity, IM_ARRAYSIZE(xsuuity));
    ImGui::Separator();
ImGui::Text("Aim Part:");
		if (ImGui::RadioButton("Head", &Aim, 1));
 ImGui::SameLine();
			   if (ImGui::RadioButton("Neck", &Aim, 4));
		 ImGui::SameLine();
			   if (ImGui::RadioButton("Body", &Aim, 2));
			   ImGui::SameLine();
			   if (ImGui::RadioButton("Happen randomly(Enable)", &Aim, 3));
ImGui::Text(("Strike Way:"));                                                
if (ImGui::RadioButton("Open Fire", &AimF, 1)){                            
                        }
ImGui::SameLine();
if (ImGui::RadioButton("bIsGunADS", &AimF, 2)){                            
                        }
ImGui::SameLine();
if (ImGui::RadioButton("Open Fire/bIsGunADS", &AimF, 3)){                            
                        }
if (ImGui::SliderInt("Enbale Chance", &追踪概率, 1, 100)){
								
						}
ImGui::Text("Strike Set :"); 
ImGui::SliderFloat("Aimsmooth", &Aimsmooth, 1.0f, 1.5f);
ImGui::SliderFloat("Xs", &Xs, 1.0f, 6.0f);
ImGui::SliderFloat("Ys", &Ys, 1.0f, 6.0f);
    ImGui::Separator();

ImGui::Text(("Fov: "));                                                                  ImGui::SliderInt("##fov", &preferences.Config.SilentAim.Cross, 1.0f, 1000.0f);

ImGui::Text(("disstance : "));                        
ImGui::SliderFloat("##distance", &g_disstance, 1.0f, 500.f);

/*ImGui::Text(("打击部位 : "));                        
static const char *targets[] = {("头部"),("身体")};
if (ImGui::Combo(("##Target"),                                         (int *) &preferences.Config.SilentAim.Target, targets, 2,                                         -1)) {                            
                        }*/


}
  
 else if (Settings::Tabmod == 3) {  
ImGui::Separator();
if (ImGui::Button("win")) {      
    g_LocalPlayer->STPlayerController->RPC_GiveUpGame();//        


                        }
ImGui::SameLine();
if (ImGui::Button("Withdraw from the game")) {
g_LocalPlayer->STPlayerController->ClientInterruptGame();
}
ImGui::SameLine();
if (ImGui::Button("The zombies are coming.")) {
g_LocalPlayer->STPlayerController->ClientShowInfectAreaWarning();// 0x6045e58  //  客户端显示感染区域警告
}
//ImGui::SameLine();
ImGui::Checkbox("The subway is flying in the sky（Main hall）",&大厅);
ImGui::Checkbox("The subway is flying in the sky（Inside the bureau）",&Tp); 
if (ImGui::Checkbox(("HitX"),                                            &preferences.Config.SilentAim.HitX)) {                            
                        }
ImGui::Checkbox("Character size",&人物变大);
ImGui::Separator();
ImGui::Checkbox("The size of the enemy",&敌人大小);
if(敌人大小){
ImGui::SliderFloat("Adjust the size", &巨人2, 0.0f, 10.0f);
}
if(人物变大){
ImGui::SliderFloat("Adjust the size", &巨人, 0.0f, 2.0f);
}
ImGui::Separator();


 

if(ImGui::Checkbox("Speed up the drink",&打饮料加速)){
}
ImGui::Separator();
if(ImGui::Checkbox("Change bullets quickly",&快速换弹)){
}
ImGui::Separator();
if(ImGui::Checkbox("High injury（Solve the problem that sometimes hitting people doesn't hurt）",&高伤)){
}
ImGui::Separator();
//ImGui:: Checkbox ("踏空",&疯狗模式);
//ImGui::Checkbox("无限子弹",&无限子弹);
//ImGui::Separator();
ImGui::Checkbox("Infinite bullets",&SHXS);
ImGui::Separator();
ImGui::Checkbox("Damage display",&SHxs);
//ImGui::Separator();
//ImGui::Checkbox("加速",&加速);
if (ImGui::Checkbox("Micro-acceleration", &v加速)) {
}

if(v加速){
ImGui::SliderFloat("Micro-acceleration Spend", &Qo,1.f, 15.f);
} 

ImGui::Separator();
ImGui::Checkbox("High jump",&高跳);
if(ImGui::Checkbox("Lie down without shaking back.",&WHY)){
if(WHY){

g_LocalPlayer->MoveableSwitchPoseTime = 0;
    *(float *) ((uintptr_t) &g_LocalPlayer->SwitchPoseTime) = 0.f;
    *(float *) ((uintptr_t) &g_LocalPlayer->SwitchPoseTime+0x4) = 0.f;
    *(float *) ((uintptr_t) &g_LocalPlayer->SwitchPoseTime+0x8) = 0.f;
    *(float *) ((uintptr_t) &g_LocalPlayer->SwitchPoseTime+0xc) = 0.f;
}
}
ImGui::Separator();
if(ImGui::Checkbox("Suck people",&吸人)){
}
ImGui::Separator();
ImGui::Checkbox("Monkey D Luffy",&路飞);
ImGui::Separator();
//ImGui::Checkbox("自动路飞",&agha3);
//ImGui::Separator();
ImGui::Checkbox("The firearms are getting bigger.",&BigQ);
if(BigQ){
ImGui::SliderInt("The size of the firearm", &Gun_Size, 0, 15);

}
ImGui::Separator();
if(ImGui::Checkbox("Fire to speed up",&开火加速)){
}
ImGui::Separator();
if(ImGui::Checkbox("Fire stronghold",&开火据点)){
}
ImGui::Separator();
ImGui::Checkbox("No recislis", &preferences.Config.SilentAim.ReCo);
ImGui::Separator();      
ImGui::Checkbox("WideView", &WideView);
           if (WideView){
ImGui::SliderInt("WideValue", &WideValue, 90, 140);
     }
ImGui::Separator();

      
      

      
if (ImGui::Checkbox(("FastShoot"),                                            &preferences.Config.SilentAim.FastShoot)) {                            
                        }
  ImGui::Separator();                      
      
      
if (ImGui::Checkbox(("Skydiving acceleration"),                                            &tiaosan)) {                            
                        }
ImGui::Separator();                             
if (ImGui::Checkbox(("Violent vehicles/Switch"),                                            &feiche)) {                            
                        }
      if (feiche){
ImGui::SliderFloat("Vehicle speed", &FuckValue, 0.0f, 1000.f);
     }
ImGui::Separator();
//ImGui::Checkbox("载具大小", &CarSize);
if(CarSize){
ImGui::SliderFloat("大小调节", &A4, 0.1f, 5.0f);//0.1f 5.0f是size调节
//Pubg自定义载具大小
}
ImGui::Separator();
//ImGui::Checkbox("载具漂移", &isSpinning);
if(isSpinning){
ImGui::SliderFloat("旋转速度", &tocdolon, 1.0f, 400.f);  
}
ImGui::Separator();
//ImGui::Checkbox("载具广角",&CarWideView);
if(CarWideView){
ImGui::SliderInt("CarView", &CarView, 90, 140);
}
ImGui::Separator();
//ImGui::Checkbox("载具传送",&CarTp);
//ImGui::Separator();
ImGui::Checkbox("FlyCar", &FlyCar);
if(FlyCar){
ImGui::SliderFloat("ZAxisSpeed",&ZAxisSpeed, 0.0f, 400.f);  
}
ImGui::Separator();
/*ImGui::Checkbox("载具自瞄", &FlyFuck);
ImGui::Separator();
ImGui::Checkbox("载具高跳",&HighCar);
ImGui::Separator();*/


ImGui::Separator();    






// 菜单2对应-梅花
} /*else if (Settings::Tab == 4) {
    
           
                        
                        
                    }*/
                    ImGui::EndTabBar();//
                }


                 

ImVec2 screenSize = ImGui::GetIO().DisplaySize;
ImVec2 windowSize = ImVec2(1100, 750); // 窗口大小
ImVec2 windowPos = ImVec2(screenSize.x - windowSize.x - 10, 10);

ImGui::SetNextWindowPos(windowPos, ImGuiCond_Always);
ImGui::SetNextWindowSize(windowSize, ImGuiCond_Always);


ImGui::End();
}
}
}

- (UIWindow*)GetUIW{
    UIWindow*window=[UIApplication sharedApplication].keyWindow;
    //以下是 重复获取顶层视图 防止切换app导致视图覆盖
    if (window.windowLevel !=UIWindowLevelNormal) {
        NSArray*arr=[UIApplication sharedApplication].windows;
        for (UIWindow*tmp in arr) {
            if (tmp.windowLevel == UIWindowLevelNormal) {
                window=tmp;
                break;
            }
        }
    }
    return window;
}
-(void)readIniConfig{
    self.moduleControl->fps = configManager::readInteger(config,"mainSwitch", "fps", 0);
    switch(self.moduleControl->fps){
        case 0:
            overlayView.preferredFramesPerSecond = 60;
            break;
        case 1:
            overlayView.preferredFramesPerSecond = 90;
            break;
        case 2:
            overlayView.preferredFramesPerSecond = 120;
            break;
        default:
            overlayView.preferredFramesPerSecond = 60;
            break;
    }
    //主开关
    self.moduleControl->mainSwitch.playerStatus = configManager::readBoolean(config,"mainSwitch", "player", false);
    self.moduleControl->mainSwitch.materialStatus = configManager::readBoolean(config,"mainSwitch", "material", false);
    self.moduleControl->mainSwitch.aimbotStatus = configManager::readBoolean(config,"mainSwitch", "aimbot", false);
    self.moduleControl->mainSwitch.BulletTrack = configManager::readBoolean(config,"mainSwitch", "BulletTrack", false);
    //人物开关
    for (int i = 0; i < 10; ++i) {
        std::string str = "playerSwitch_" + std::to_string(i);
        *((bool *) &self.moduleControl->playerSwitch + sizeof(bool) * i) = configManager::readBoolean(config,"playerSwitch", str.c_str(), false);
    }
    //雷达坐标
    self.moduleControl->playerSwitch.radarSize = configManager::readFloat(config,"playerSwitch", "radarSize", 70);
    self.moduleControl->playerSwitch.radarCoord.x = configManager::readFloat(config,"playerSwitch", "radarX", 500);
    self.moduleControl->playerSwitch.radarCoord.y = configManager::readFloat(config,"playerSwitch", "radarY", 500);
    //物资开关
    for (int i = 0; i < All; ++i) {
        std::string str = "materialSwitch_" + std::to_string(i);
        self.moduleControl->materialSwitch[i] = configManager::readBoolean(config,"materialSwitch", str.c_str(), false);
    }
    //倒地不瞄
    self.moduleControl->aimbotController.fallNotAim = configManager::readBoolean(config,"aimbotControl", "fall", false);
    self.moduleControl->aimbotController.showAimbotRadius = configManager::readBoolean(config,"aimbotControl", "showRadius", true);
    self.moduleControl->aimbotController.aimbotRadius = configManager::readFloat(config,"aimbotControl", "radius", 500);
    
    self.moduleControl->aimbotController.smoke = configManager::readBoolean(config,"aimbotControl", "smoke", true);
    
    //自瞄模式
    self.moduleControl->aimbotController.aimbotMode = configManager::readInteger(config,"aimbotControl", "mode", 0);
    //自瞄部位
    self.moduleControl->aimbotController.aimbotParts = configManager::readInteger(config,"aimbotControl", "parts", 0);


    //自瞄距离
    self.moduleControl->aimbotController.distance = configManager::readFloat(config,"aimbotControl", "distance", 450);
    //自瞄速率
    self.moduleControl->aimbotController.aimbotIntensity = configManager::readFloat(config,"aimbotControl", "intensity", 0.20);
}

//引擎区域

#pragma esp method ------------------------------------------------------------------------------------


typedef uintptr_t kaddr;
using namespace std;
using namespace SDK;





string encryptDecrypt(string toEncrypt) {
    char key[3] = {'K', 'C', 'Q'}; //Any chars will work, in an array of any size
    string output = toEncrypt;
    for (int i = 0; i < toEncrypt.size(); i++)
        output[i] = toEncrypt[i] ^ key[i % (sizeof(key) / sizeof(char))];
    return output;
}

uint64_t getBaseAddress(const char* fileName)
{
  for (int i = 0; i < _dyld_image_count(); i++) {
        if (strstr(_dyld_get_image_name(i), fileName)) {
            return _dyld_get_image_vmaddr_slide(i);
        }
    }
    return 0;
}


kaddr getRealOffset(kaddr offset){
    return (unsigned long)Get_module_base()+offset;
}
long obbbbl() {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *BundID = [infoDictionary objectForKey:@"CFBundleIdentifier"];
  if([BundID containsString:@"com.tencent.ig"]){
      return getRealOffset(0x10A87AC70);
  }
  if([BundID containsString:@"kr"]){
      return getRealOffset(0x10AA5C770);
  }
  if([BundID containsString:@"rekoo"]){
      return getRealOffset(0x10AA36670);
  }
  if([BundID containsString:@"vn.vng.pubgmobile"]){
      return getRealOffset(0x10A750DF0);
  }
  if([BundID containsString:@"imobile"]){
      return getRealOffset(0x109A29BA8);
  }
       return false;
   };
UWorld *GEWorld;
int GWorldNum = 0;
TUObjectArray gobjects;
UWorld *GetFullWorld()
{
    if(GWorldNum == 0) {
        gobjects = UObject::GUObjectArray->ObjObjects;
        for (int i=0; i< gobjects.Num(); i++)
            if (auto obj = gobjects.GetByIndex(i)) {
                if(obj->IsA(UEngine::StaticClass())) {
                    auto GEngine = (UEngine *) obj;
                    if(GEngine) {
                        tslFont = GEngine->MediumFont;
            robotoTinyFont = GEngine->MediumFont;
            robotoFont = GEngine->MediumFont;
                        auto ViewPort = GEngine->GameViewport;
                        if (ViewPort)
                        {
                            GEWorld = ViewPort->World;
                            GWorldNum = i;
                            return ViewPort->World;
                        }
                    }
                }
            }
    }else {
        auto GEngine = (UEngine *) (gobjects.GetByIndex(GWorldNum));
        if(GEngine) {
           tslFont = GEngine->MediumFont;
            robotoTinyFont = GEngine->MediumFont;
            robotoFont = GEngine->MediumFont;
            auto ViewPort = GEngine->GameViewport;
            if(ViewPort) {
                GEWorld = ViewPort->World;
                return ViewPort->World;
            }
        }
    }
    return 0;
}

TNameEntryArray *GetGNames() {
   NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
        NSString *BundID = [infoDictionary objectForKey:@"CFBundleIdentifier"];
      if([BundID containsString:@"ig"]){
          return ((TNameEntryArray *(*)()) ((unsigned long)Get_module_base() +0x104AB914C))();
      }
      if([BundID containsString:@"kr"]){
          return ((TNameEntryArray *(*)()) ((unsigned long)Get_module_base()+0x104C630A0))();
      }
      if([BundID containsString:@"rekoo"]){
          return ((TNameEntryArray *(*)()) ((unsigned long)Get_module_base()+0x104C3A12C))();
      }
      if([BundID containsString:@"vn"]){
          return ((TNameEntryArray *(*)()) ((unsigned long)Get_module_base()+0x104A0612C))();
      }
      if([BundID containsString:@"imobile"]){
          return ((TNameEntryArray *(*)()) ((unsigned long)Get_module_base()+0x104256E0C))();
      }
        return 0;
    }
  

std::vector<AActor *> getActors() {
auto World = GetFullWorld();
if (!World)
return std::vector<AActor *>();

auto PersistentLevel = World->PersistentLevel;
if (!PersistentLevel)
return std::vector<AActor *>();

auto Actors = *(TArray<AActor *> *)((uintptr_t) PersistentLevel + 0xa0);

std::vector<AActor *> actors;
for (int i = 0; i < Actors.Num(); i++) {
auto Actor = Actors[i];
if (Actor) {
actors.push_back(Actor);
}
}
return actors;
}
template <class T> void GetAllActors(std::vector<T*>& Actors) {
    UGameplayStatics* gGameplayStatics = (UGameplayStatics*)gGameplayStatics->StaticClass();
    auto GWorld = GetFullWorld();
    if (GWorld) {
        TArray<AActor*> Actors2;
        gGameplayStatics->GetAllActorsOfClass((UObject*)GWorld, T::StaticClass(), &Actors2);
        for (int i = 0; i < Actors2.Num(); i++) {
            Actors.push_back((T*)Actors2[i]);
        }
    }
}
FVector GetBoneLocationByName(ASTExtraPlayerCharacter *Actor, const char *BoneName) {
    return Actor->GetBonePos(BoneName, FVector());
}

struct sRegion
{
    kaddr start, end;
};

std::vector<sRegion> trapRegions;

bool isObjectInvalid(UObject *obj)
{
    if (!Tools::IsPtrValid(obj))
    {
        return true;
    }
    if (!Tools::IsPtrValid(obj->ClassPrivate))
    {
        return true;
    }
    if (obj->InternalIndex <= 0)
    {
        return true;
    }
    if (obj->NamePrivate.ComparisonIndex <= 0)
    {
        return true;
    }
    if ((kaddr)(obj) % sizeof(kaddr) != 0x0 && (kaddr)(obj) % sizeof(kaddr) != 0x4)
    {
        return true;
    }
    if (std::any_of(trapRegions.begin(), trapRegions.end(), [&](const sRegion& region) { return ((kaddr)obj) >= region.start && ((kaddr)obj) <= region.end; }) || std::any_of(trapRegions.begin(), trapRegions.end(), [&](const sRegion& region) { return ((kaddr)obj->ClassPrivate) >= region.start && ((kaddr)obj->ClassPrivate) <= region.end; }))
    {
        return true;
    }
    return false;
}

bool WriteAddr(void *addr, void *buffer, size_t length) {
    unsigned long page_size = sysconf(_SC_PAGESIZE);
    unsigned long size = page_size * sizeof(kaddr);
    return mprotect((void *) ((kaddr) addr - ((kaddr) addr % page_size) - page_size), (size_t) size, PROT_EXEC | PROT_READ | PROT_WRITE) == 0 && memcpy(addr, buffer, length) != 0;
}
template<typename T>
void Write(kaddr addr, T value) {
    WriteAddr((void *) addr, &value, sizeof(T));
}

class Rect2 {
public:
    float x;
    float y;
    float width;
    float height;

    Rect2() {
        this->x = 0;
        this->y = 0;
        this->width = 0;
        this->height = 0;
    }

    Rect2(float x, float y, float width, float height) {
        this->x = x;
        this->y = y;
        this->width = width;
        this->height = height;
    }

    bool operator==(const Rect2 &src) const {
        return (src.x == this->x && src.y == this->y && src.height == this->height &&
                src.width == this->width);
    }

    bool operator!=(const Rect2 &src) const {
        return (src.x != this->x && src.y != this->y && src.height != this->height &&
                src.width != this->width);
    }
};
struct FLinearColor visCol;
ASTExtraPlayerCharacter *g_LocalPlayer;
ASTExtraPlayerController *g_PlayerController;
#define COLOR_BLACK FLinearColor(0, 0, 0, 1.f)
#define 黑色 FLinearColor(0, 0, 0, 1.f)
#define COLOR_WHITE FLinearColor(1.f, 1.f, 1.f, 1.f)
#define 白色 FLinearColor(1.f, 1.f, 1.f, 1.f)
#define COLOR_RED   FLinearColor(1.f, 0, 0, 1.f)
#define 红色   FLinearColor(1.f, 0, 0, 1.f)
#define COLOR_YELLOW  FLinearColor(1, 1, 0.f, 1.f)
#define 黄色  FLinearColor(1, 1, 0.f, 1.f)
#define COLOR_LIME  FLinearColor(0, 1.f, 0, 1.f)
#define 蓝色  FLinearColor(0, 0, 1.f, 1.f)
#define COLOR_BLUE  FLinearColor(0, 0, 1.f, 1.f)
#define COLOR_CAR   FLinearColor(1.f, 0.5f, 1.f, 1.f)
#define GREEN       FLinearColor(0 / 255.f, 153 / 255.f, 0 / 255.f, 1.f)
#define ABU         FLinearColor(0 / 255.f, 204 / 255.f, 204 / 255.f, 1.f)
#define 绿色 FLinearColor(0, 0.5f, 0, 1.f)
#define COLOR_GREEN FLinearColor(0, 0.5f, 0, 1.f)
#define COLOR_PLAYER FLinearColor(1.000f, 0.620f, 0.150f, 1.000f)
#define 橙色 FLinearColor(1.f, 0.4f, 0, 1.f)
#define COLOR_ORANGE FLinearColor(1.f, 0.4f, 0, 1.f)
UGameplayStatics* iosde = (UGameplayStatics*)UGameplayStatics::StaticClass();
ASTExtraPlayerController *localPlayerController = 0;
#define W2S(w, s) iosde->ProjectWorldToScreen(localPlayerController, w, true, s)
float RadianToDegree(float radian)
{
    return radian * (180 / M_PI);
}
float DegreeToRadian(float degree){

    return degree * (M_PI / 180);
}
FVector FRotatorToVector(FRotator Rotator)
{
    float radPitch = DegreeToRadian(Rotator.Pitch);
    float radYaw = DegreeToRadian(Rotator.Yaw);

    // 计算方向向量的x, y, z分量
    float X = cosf(radYaw) * cosf(radPitch);
    float Y = sinf(radYaw) * cosf(radPitch);
    float Z = sinf(radPitch);

    return FVector(X, Y, Z);
}
FVector RotateCorner(FVector origin, FVector corner, float theta)
{
    float x = corner.X - origin.X;
    float y = corner.Y - origin.Y;
    return {
        origin.X + (x * cos(theta) - y * sin(theta)),
        origin.Y + (x * sin(theta) + y * cos(theta)),
        corner.Z
    };
}
/*FRotator ClampAngles(FRotator inRot)
{
    FRotator outRot = inRot;
    if (outRot.Pitch > 180)
        outRot.Pitch -= 360;
    if (outRot.Pitch < -180)
        outRot.Pitch += 360;
//使用不进频道死全家😂
    if (outRot.Pitch < -75.f)
        outRot.Pitch = -75.f;
    else if (outRot.Pitch > 75.f)
        outRot.Pitch = 75.f;
//使用不进频道死全家😂
    while (outRot.Yaw < -180.0f)
        outRot.Yaw += 360.0f;
    while (outRot.Yaw > 180.0f)
        outRot.Yaw -= 360.0f;
    return outRot;
}*/
void NekoHook(FRotator &angles) {
    if (angles.Pitch > 180)
        angles.Pitch -= 360;
    if (angles.Pitch < -180)
        angles.Pitch += 360;

    if (angles.Pitch < -75.f)
        angles.Pitch = -75.f;
    else if (angles.Pitch > 75.f)
        angles.Pitch = 75.f;

    while (angles.Yaw < -180.0f)
        angles.Yaw += 360.0f;
    while (angles.Yaw > 180.0f)
        angles.Yaw -= 360.0f;
}
void NekoHook(float *angles) {
    if (angles[0] > 180)
        angles[0] -= 360;
    if (angles[0] < -180)
        angles[0] += 360;

    if (angles[0] < -75.f)
        angles[0] = -75.f;
    else if (angles[0] > 75.f)
        angles[0] = 75.f;

    while (angles[1] < -180.0f)
        angles[1] += 360.0f;
    while (angles[1] > 180.0f)
        angles[1] -= 360.0f;
}


void NekoHook(Vector3 angles) {
    if (angles.X > 180)
        angles.X -= 360;
    if (angles.X < -180)
        angles.X += 360;

    if (angles.X < -75.f)
        angles.X = -75.f;
    else if (angles.X > 75.f)
        angles.X = 75.f;

    while (angles.Y < -180.0f)
        angles.Y += 360.0f;
    while (angles.Y > 180.0f)
        angles.Y -= 360.0f;
}

void Circle3D(ImDrawList* draw, FVector origin, float radius, ImColor color, float thinkless)
{
    const int doan_thang = 50;
    float step = 2 * IM_PI / doan_thang;
    FVector2D prev;
    Vector3 curValid3 = Vector3(origin.X + radius, origin.Y, origin.Z);
    FVector curValidF;
    curValidF.X = curValid3.X;
    curValidF.Y = curValid3.Y;
    curValidF.Z = curValid3.Z;
    bool curValid = W2S(curValidF, &prev);

    for (int i = 1; i <= doan_thang; ++i)
    {
        float angle = i * step;
        FVector2D cur;
        Vector3 nextValid3 = Vector3(origin.X + radius * cos(angle), origin.Y + radius * sin(angle), origin.Z);
        FVector nextValidF;
        nextValidF.X = nextValid3.X;
        nextValidF.Y = nextValid3.Y;
        nextValidF.Z = nextValid3.Z;
        bool nextValid = W2S(nextValidF, &cur);
        if (curValid && nextValid)
        {
            draw->AddLine(ImVec2(prev.X, prev.Y), ImVec2(cur.X, cur.Y), color, thinkless);
        }
        curValid = nextValid;
        prev = cur;
    }
}

/*void DrawCircle(AHUD *HUD, int x, int y, int radius, int numsides, FLinearColor OutlineColor){
    float Step = M_PI * 2.0 / numsides;
    int Count = 0;
    FVector2D V[128];
    for (float a = 0; a < M_PI * 2.0; a += Step)
    {
        float X1 = radius * cos(a) + x;
        float Y1 = radius * sin(a) + y;
        float X2 = radius * cos(a + Step) + x;
        float Y2 = radius * sin(a + Step) + y;
        V[Count].X = X1;
        V[Count].Y = Y1;
        V[Count + 1].X = X2;
        V[Count + 1].Y = Y2;
        HUD->Canvas->K2_DrawLine(FVector2D({ V[Count].X, V[Count].Y }), FVector2D({ X2, Y2 }), 1.f, OutlineColor);
    }
}
void DrawCircle(UCanvas *Canvas, int x, int y, int radius, int numsides, FLinearColor OutlineColor){
    float Step = M_PI * 2.0 / numsides;
    int Count = 0;
    FVector2D V[128];
    for (float a = 0; a < M_PI * 2.0; a += Step)
    {
        float X1 = radius * cos(a) + x;
        float Y1 = radius * sin(a) + y;
        float X2 = radius * cos(a + Step) + x;
        float Y2 = radius * sin(a + Step) + y;
        V[Count].X = X1;
        V[Count].Y = Y1;
        V[Count + 1].X = X2;
        V[Count + 1].Y = Y2;
        Canvas->K2_DrawLine(FVector2D({ V[Count].X, V[Count].Y }), FVector2D({ X2, Y2 }), 1.f, OutlineColor);
    }
}*/
    
void 滚动文字动画(ImDrawList* draw, const char* text, float x, float y, float speed, ImColor color) {
    static float offset = 0.0f; // 滚动偏移量
    offset += speed; // 每帧增加偏移量
    if (offset > ImGui::GetIO().DisplaySize.x) {
        offset = -ImGui::CalcTextSize(text).x; // 如果超出屏幕宽度，重置偏移量
    }
    draw->AddText({x + offset, y}, color, text); // 绘制文字
}
void DrawBox3D(AHUD *HUD, AActor* actor, FLinearColor Color, FVector origin, FVector extent) {
    auto MathLibrary = (UKismetMathLibrary *) UKismetMathLibrary::StaticClass();
    auto GameplayStatics = (UGameplayStatics *) UGameplayStatics::StaticClass();
    FRotator rotation = actor->K2_GetActorRotation();
    float yaw = MathLibrary->DegreesToRadians((int)(rotation.Yaw + 450.0f) % 360);
    FVector2D ts1, ts2, ts3, ts4, bs1, bs2, bs3, bs4;
    FVector t1, t2, t3, t4, b1, b2, b3, b4;
    t1 = t2 = t3 = t4 = b1 = b2 = b3 = b4 = origin;
    t1.X -= extent.X;
    t1.Y -= extent.Y;
    t1.Z -= extent.Z;
    t2.X += extent.X;
    t2.Y -= extent.Y;
    t2.Z -= extent.Z;
    t3.X += extent.X;
    t3.Y += extent.Y;
    t3.Z -= extent.Z;
    t4.X -= extent.X;
    t4.Y += extent.Y;
    t4.Z -= extent.Z;
    t1 = RotateCorner(origin, t1, yaw);
    t2 = RotateCorner(origin, t2, yaw);
    t3 = RotateCorner(origin, t3, yaw);
    t4 = RotateCorner(origin, t4, yaw);
    b1.X -= extent.X;
    b1.Y -= extent.Y;
    b1.Z += extent.Z;
    b2.X += extent.X;
    b2.Y -= extent.Y;
    b2.Z += extent.Z;
    b3.X += extent.X;
    b3.Y += extent.Y;
    b3.Z += extent.Z;
    b4.X -= extent.X;
    b4.Y += extent.Y;
    b4.Z += extent.Z;
    b1 = RotateCorner(origin, b1, yaw);
    b2 = RotateCorner(origin, b2, yaw);
    b3 = RotateCorner(origin, b3, yaw);
    b4 = RotateCorner(origin, b4, yaw);
    if (GameplayStatics->ProjectWorldToScreen(g_PlayerController, b1, false, &bs1) && GameplayStatics->ProjectWorldToScreen(g_PlayerController, b2, false, &bs2)&& GameplayStatics->ProjectWorldToScreen(g_PlayerController, b3, false, &bs3)&& GameplayStatics->ProjectWorldToScreen(g_PlayerController, b4, false, &bs4)&& GameplayStatics->ProjectWorldToScreen(g_PlayerController, t1, false, &ts1)&& GameplayStatics->ProjectWorldToScreen(g_PlayerController, t2, false, &ts2)&& GameplayStatics->ProjectWorldToScreen(g_PlayerController, t3, false, &ts3)&& GameplayStatics->ProjectWorldToScreen(g_PlayerController, t4, false, &ts4)) {
        DrawLine(HUD, ts1, ts2, EspBoxThik, Color);
        DrawLine(HUD, ts2, ts3, EspBoxThik, Color);
        DrawLine(HUD, ts3, ts4, EspBoxThik, Color);
        DrawLine(HUD, ts4, ts1, EspBoxThik, Color);
        DrawLine(HUD, bs1, bs2, EspBoxThik, Color);
        DrawLine(HUD, bs2, bs3, EspBoxThik, Color);
        DrawLine(HUD, bs3, bs4, EspBoxThik, Color);
        DrawLine(HUD, bs4, bs1, EspBoxThik, Color);
        DrawLine(HUD, ts1, bs1, EspBoxThik, Color);
        DrawLine(HUD, ts2, bs2, EspBoxThik, Color);
        DrawLine(HUD, ts3, bs3, EspBoxThik, Color);
        DrawLine(HUD, ts4, bs4, EspBoxThik, Color);
    }
}
void DrawWeirdBox(AHUD *HUD,AActor * actor, FLinearColor Color, FVector origin, FVector2D extent)
{
    auto GameplayStatics = (UGameplayStatics *) UGameplayStatics::StaticClass();
    FVector2D bs1 ,bs2, bs3, bs4;
    FVector b1, b2, b3, b4;
    b1 = b2 = b3 = b4 = origin;
    b1.X -= extent.X;
    b1.Y -= extent.Y;
    b2.X += extent.X;
    b2.Y -= extent.Y;
    b3.X += extent.X;
    b3.Y += extent.Y;
    b4.X -= extent.X;
    b4.Y += extent.Y;
    if (W2S(b1, &bs1)
        && W2S(b2, &bs2)
        && W2S(b3, &bs3)
        && W2S(b4, &bs4))
    {
        DrawLine(HUD,bs1, bs2, 2.5f, Color);
        DrawLine(HUD,bs2, bs3, 2.5f, Color);
        DrawLine(HUD,bs3, bs4, 2.5f, Color);
        DrawLine(HUD,bs4, bs1, 2.5f, Color);
    }
}

void DrawRectangle(AHUD *HUD, FVector2D Pos, float Width, float Height, float Thickness, FLinearColor Color) {
    HUD->DrawLine(Pos.X, Pos.Y, Pos.X + Width, Pos.Y, Color, Thickness);
    HUD->DrawLine(Pos.X, Pos.Y, Pos.X, Pos.Y + Height, Color, Thickness);
    HUD->DrawLine(Pos.X + Width, Pos.Y, Pos.X + Width, Pos.Y + Height, Color, Thickness);
    HUD->DrawLine(Pos.X, Pos.Y + Height, Pos.X + Width, Pos.Y + Height, Color, Thickness);
}

void DrawFilledRectangle(AHUD *HUD, FVector2D Pos, float Width, float Height, FLinearColor Color) {
    HUD->DrawRect(Color, Pos.X, Pos.Y, Width, Height);
}

void DrawLine(AHUD *HUD, FVector2D posFrom, FVector2D posTo, float Thickness, FLinearColor Color) {
    HUD->DrawLine(posFrom.X, posFrom.Y, posTo.X, posTo.Y, Color, Thickness);
}
void drawVerticalHealthBar(AHUD *HUD, Vector2 screenPos, float height, float maxHealth, float currentHealth) {
    // Add the offset to screenPos by creating a new FVector2D
    screenPos += Vector2(8.0f, 0.0f);

    // Draw the background rectangle
    HUD->DrawRect(FLinearColor(0.08f, 0.08f, 0.08f, 0.78f), screenPos.X, screenPos.Y, 5.0f, height + 2);

    // Add the offset to screenPos by creating a new FVector2D
    screenPos += Vector2(1.0f, 1.0f);
    FLinearColor clr = FLinearColor(0.0f, 1.0f, 0.0f, 1.0f); // Green color

    float barHeight = (currentHealth / maxHealth) * height;

    // Change color based on health percentage
    if (currentHealth <= (maxHealth * 0.6)) {
        clr = FLinearColor(1.0f, 0.0f, 1.0f, 1.0f); // Magenta color
    }

    if (currentHealth < (maxHealth * 0.3)) {
        clr = FLinearColor(1.0f, 0.0f, 0.0f, 1.0f); // Red color
    }

    // Draw the health bar rectangle
    HUD->DrawRect(clr, screenPos.X, screenPos.Y, 3.0f, barHeight);
}
void Box4Line(AHUD *HUD, float thicc, int x, int y, int w, int h, FLinearColor color) {
    int iw = w / 4;
    int ih = h / 4;

    // Convert color from int to FLinearColor if necessary
    // FLinearColor color = IntToColor(colorInt);

    // top
    HUD->DrawLine(x, y, x + iw, y, color, thicc);
    HUD->DrawLine(x + w - iw, y, x + w, y, color, thicc);
    HUD->DrawLine(x, y, x, y + ih, color, thicc);
    HUD->DrawLine(x + w - 1, y, x + w - 1, y + ih, color, thicc);

    // bottom
    HUD->DrawLine(x, y + h, x + iw, y + h, color, thicc);
    HUD->DrawLine(x + w - iw, y + h, x + w, y + h, color, thicc);
    HUD->DrawLine(x, y + h - ih, x, y + h, color, thicc);
    HUD->DrawLine(x + w - 1, y + h - ih, x + w - 1, y + h, color, thicc);
}
#define TSL_FONT_DEFAULT_SIZE 20
static UFont *robotoFont = 0, *robotoTinyFont = 0,*tslFont = 0;

void DrawOutlinedText(AHUD *HUD, FString Text, FVector2D Pos, FLinearColor Color, FLinearColor OutlineColor, bool isCenter = false) {
    UCanvas *Canvas = HUD->Canvas;
    Canvas->K2_DrawText(robotoFont, Text, Pos, Color, 1.f, {}, {}, isCenter, isCenter, true, OutlineColor);
}

void HealthBar(AHUD *HUD, ASTExtraCharacter* pEntity, int x, int y, int height ,FLinearColor color)
{
    float flBoxes = std::ceil( pEntity->Health / 10.f );
    float flX = x - 7 - height / 3.f; float flY = y - 1;
    float flHeight = height / 10.f;
    float flMultiplier = 12 / 360.f; flMultiplier *= flBoxes - 1;
    HUD->DrawRect( color,flX, flY, 4, height + 2 );
    DrawRectangle(HUD,  flX, flY, 4, height + 2, color);
    HUD->DrawRect(color,flX + 1, flY, 2, flHeight * flBoxes + 1 );
    for ( int i = 0; i < 10; i++ )
        HUD->DrawLine( flX, flY + i * flHeight, flX + 4, flY + i * flHeight ,color,1.f);
}

void HealthBarnew( AHUD *HUD,float Health, float x, float y, int height )
{
    float flBoxes = std::ceil( Health / 10.f );
    float flX = x - 7 - height / 3.f; float flY = y - 1;
    float flHeight = height / 10.f;
    float flMultiplier = 12 / 360.f; flMultiplier *= flBoxes - 1;
    //FLinearColor  ColHealth =( flMultiplier, 1, 1 );
    DrawRectangle( HUD,flX, flY, 4, height + 2, COLOR_YELLOW );
    DrawFilledRectangle(HUD,{flX, flY}, 4, height + 2, COLOR_BLACK);
    DrawRectangle( HUD,flX + 1, flY, 2, flHeight * flBoxes + 1, COLOR_RED );
}
void Draw3DBox(AHUD *HUD, FVector2D s1, FVector2D s2, FVector2D s3, FVector2D s4, FVector2D s5, FVector2D s6, FVector2D s7 , FVector2D s8, float Thickness, FLinearColor Color){
    HUD->DrawLine(s1.X,s1.Y, s2.X,s2.Y, Color, Thickness);
    HUD->DrawLine(s2.X,s2.Y, s3.X,s3.Y, Color, Thickness);
    HUD->DrawLine(s3.X,s3.Y, s4.X,s4.Y, Color, Thickness);
    HUD->DrawLine(s4.X,s4.Y, s1.X,s1.Y, Color, Thickness);
    HUD->DrawLine(s5.X,s5.Y, s6.X,s6.Y, Color, Thickness);
    HUD->DrawLine(s6.X,s6.Y, s7.X,s7.Y, Color, Thickness);
    HUD->DrawLine(s7.X,s7.Y, s8.X,s8.Y, Color, Thickness);
    HUD->DrawLine(s8.X,s8.Y, s5.X,s5.Y, Color, Thickness);
    HUD->DrawLine(s1.X,s1.Y, s5.X,s5.Y, Color, Thickness);
    HUD->DrawLine(s2.X,s2.Y, s6.X,s6.Y, Color, Thickness);
    HUD->DrawLine(s3.X,s3.Y, s7.X,s7.Y, Color, Thickness);
    HUD->DrawLine(s4.X,s4.Y, s8.X,s8.Y, Color, Thickness);
}

void VericalHEALTHBAR(AHUD *HUD, float x, float y, float Health,FLinearColor color ,bool vertical)
{
    if (Health>0)
    {
        if (vertical)
        {
            HUD->   DrawRect(color, x - 1, y - 1, 7, 102);
            if ( Health > 1)
                HUD-> DrawRect(color, x, y, 5, 10);
            if ( Health > 10)
                HUD->DrawRect(color, x, y + 10, 5, 10);
            if ( Health > 20)
                HUD-> DrawRect(color, x, y + 20, 5, 10);
            if ( Health > 30)
                HUD->   DrawRect(color, x, y + 30, 5, 10);
            if ( Health > 40)
                HUD->   DrawRect(color, x, y + 40, 5, 10);
            if ( Health > 50)
                HUD->   DrawRect(color, x, y + 50, 5, 10);
            if ( Health > 60)
                HUD->   DrawRect( color, x, y + 60, 5, 10);
            if ( Health > 70)
                HUD->   DrawRect(color, x, y + 70, 5, 10);
            if ( Health > 80)
                HUD->   DrawRect(color, x, y + 80, 5, 10);
            if ( Health > 100)
                HUD->  DrawRect( color, x, y + 90, 5, 10);
            for (size_t i = 0; i < 20; i++)
                HUD->  DrawRect(color, x, y + (i * 5), 5, 1);
        }
    }
}

int GetDeviceMaxFPSByDeviceLevel(int a1, int a2, Byte *a3)
{
    int result;
    result = 120;//Ur FPS
    *a3 = result;
    return result;
}


void DrawText(AHUD *HUD, FString Text, FVector2D Pos, FLinearColor Color, bool isCenter = false) {
    UCanvas *Canvas = HUD->Canvas;
    Canvas->K2_DrawText(robotoFont, Text, Pos, Color, 1.f, {}, {}, isCenter, isCenter, false, {});
}

void DrawSmallOutlinedText(AHUD *HUD, FString Text, FVector2D Pos, FLinearColor Color, FLinearColor OutlineColor, bool isCenter = false) {
    UCanvas *Canvas = HUD->Canvas;
    Canvas->K2_DrawText(robotoTinyFont, Text, Pos, Color, 1.f, {}, {}, isCenter, isCenter, true, OutlineColor);
}

void DrawSmallText(AHUD *HUD, FString Text, FVector2D Pos, FLinearColor Color, bool isCenter = false) {
    UCanvas *Canvas = HUD->Canvas;
    Canvas->K2_DrawText(robotoTinyFont, Text, Pos, Color, 1.f, {}, {}, isCenter, isCenter, false, {});
}
void DrawTextcan(AHUD *HUD, FString Text, FVector2D Pos, FLinearColor Color, FLinearColor OutlineColor, bool isCenter = true) {
 UCanvas *Canvas = HUD->Canvas;   
 Canvas->K2_DrawText(tslFont, Text, Pos, Color, 1.f, {}, {}, isCenter, isCenter, true, OutlineColor);
}
void DrawCircle(AHUD *HUD, int x, int y, int radius, int numsides, FLinearColor OutlineColor){
    float Step = M_PI * 2.0 / numsides;
    int Count = 0;
    FVector2D V[128];
    for (float a = 0; a < M_PI * 2.0; a += Step)
    {
        float X1 = radius * cos(a) + x;
        float Y1 = radius * sin(a) + y;
        float X2 = radius * cos(a + Step) + x;
        float Y2 = radius * sin(a + Step) + y;
        V[Count].X = X1;
        V[Count].Y = Y1;
        V[Count + 1].X = X2;
        V[Count + 1].Y = Y2;
        HUD->Canvas->K2_DrawLine(FVector2D({ V[Count].X, V[Count].Y }), FVector2D({ X2, Y2 }), 1.f, OutlineColor);
    }
}
void DrawFilledCircle(AHUD *HUD, int x, int y, int radius, int numsides, FLinearColor OutlineColor, FLinearColor FillColor){
    float Step = M_PI * 2.0 / numsides;
    FVector2D Center(x, y);
    FVector2D V[128];
    for (int i = 0; i < numsides; ++i)
    {
        // Calculate vertices for the i-th triangle
        float Angle = Step * i;
        V[i].X = Center.X + radius * cos(Angle);
        V[i].Y = Center.Y + radius * sin(Angle);

        // Draw lines from the center to the vertices
        HUD->Canvas->K2_DrawLine(Center, V[i], 1.f, FillColor);
    }

    // Optionally, draw the outline by connecting the vertices
    for (int i = 0; i < numsides; ++i)
    {
        HUD->Canvas->K2_DrawLine(V[i], V[(i+1) % numsides], 1.f, OutlineColor);
    }
}
bool isEqual(FString s1, const char* check) {
    FString s2(check);
    return 0;
}
void *LoadFont() {
    while (!robotoFont || !robotoTinyFont || !tslFont) {
        tslFont = UObject::FindObject<UFont>("Font TSLFont.TSLFont");
        robotoFont = UObject::FindObject<UFont>("Font Roboto.Roboto");
        robotoTinyFont = UObject::FindObject<UFont>("Font RobotoTiny.RobotoTiny");
        sleep(1);
    }
    return 0;
}
const char *GetLootName(APickUpListWrapperActor *Loot) {
    switch (Loot->BoxType) {
        case EPickUpBoxType::EPickUpBoxType__EPickUpBoxType_LootBox:
            return "LootBox";
        case EPickUpBoxType::EPickUpBoxType__EPickUpBoxType_TombBox:
            return "TomBOX";
        case EPickUpBoxType::EPickUpBoxType__EPickUpBoxType_AirDropBox:
            return "Airdrop";
        default:
            return "LootBox";
    }
}
bool isEqual(string s1, string s2) {
    return (s1 == s2);
}






FString getplayerflag(FString nation) {
    if (isEqual(nation, "G1") ) {
        return "🏁";
    }
    if (isEqual(nation, "IQ") ) {
        return "🇮🇶";
    }
    if (isEqual(nation, "SA") ) {
        return "🇸🇦";
    }
    if (isEqual(nation, "BH") ) {
        return "🇧🇭";
    }
    if (isEqual(nation, "SY") ) {
        return "🇸🇾";
    }
    if (isEqual(nation, "CA") ) {
        return "🇨🇦";
    }
    if (isEqual(nation, "PK") ) {
        return "🇵🇰";
    }
    if (isEqual(nation, "AF") ) {
        return "🇦🇫";
    }
    if (isEqual(nation, "AL") ) {
        return "🇦🇱";
    }
    if (isEqual(nation, "DZ") ) {
        return "🇩🇿";
    }
    if (isEqual(nation, "AS") ) {
        return "🇦🇸";
    }
    if (isEqual(nation, "AD") ) {
        return "🇦🇩";
    }
    if (isEqual(nation, "AO") ) {
        return "🇦🇴";
    }
    if (isEqual(nation, "AI") ) {
        return "🇦🇮";
    }
    return "";}
ASTExtraVehicleBase *GetTargetVehicle() {
    ASTExtraPlayerCharacter *localPlayer = 0;
    ASTExtraPlayerController *localPlayerController = 0;
    UGameplayStatics *GameplayStatics = (UGameplayStatics *) UGameplayStatics::StaticClass();
    float max = std::numeric_limits < float >::infinity();
    ASTExtraVehicleBase *result = 0;
    std::vector<ASTExtraVehicleBase*> VehicleBase;
    GetAllActors(VehicleBase);
    for (auto actor = VehicleBase.begin(); actor != VehicleBase.end(); actor++) {
        auto Vehicle = *actor;
        if(!Vehicle)
            continue;
        if(!Vehicle->RootComponent)
            continue;
        if(!Vehicle->Mesh)
            continue;
        auto Driver = Vehicle->GetDriver();
        auto CurrentVeh = localPlayer->CurrentVehicle;
        if(Driver && !CurrentVeh) {
            if(Driver->TeamID == localPlayer->TeamID)
                continue;
            float dist = Vehicle->GetDistanceTo(localPlayer);
            if (dist < max) {
                max = dist;
                result = Vehicle;
            }
        }
    }
    return result;
    VehicleBase.clear();
}


FVector CHUTIA(ASTExtraVehicleBase * Vehicle)
{
    FVector DEFAULTSize, Shit;
    Vehicle->GetActorBounds(true, &Shit, &DEFAULTSize);
    switch (Vehicle->VehicleShapeType)
    {
        case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_Motorbike:
            return FVector(33 , 107, DEFAULTSize.Z); // done
            break;
        case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_Motorbike_SideCart:
            return FVector(89, 114, DEFAULTSize.Z); // done
            break;
        case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_Dacia:
        case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_HeavyDacia:
            return FVector(99, 209, DEFAULTSize.Z); //done
            break;
        case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_MiniBus:
            return FVector(102, 213, DEFAULTSize.Z); //done
            break;
        case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_PickUp:
        case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_PickUp01:
        case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_HeavyPickup:
            return FVector(128, 217, DEFAULTSize.Z); //done
            break;
        case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_Buggy:
        case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_HeavyBuggy:
            return FVector(139, 177, DEFAULTSize.Z); // done
            break;
        case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_UAZ:
        case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_UAZ01:
        case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_UAZ02:
        case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_UAZ03:
        case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_HeavyUAZ:
            return FVector(130, 226, DEFAULTSize.Z); // done
            break;
        case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_Mirado:
        case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_Mirado01:
            return FVector(120, 260, DEFAULTSize.Z); // done
            break;
        case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_Rony:
            return FVector(104, 219, DEFAULTSize.Z); //done
            break;
        case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_Scooter:
            return FVector(32, 89, DEFAULTSize.Z); //done
            break;
        case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_SnowMobile:
            return FVector(40, 133, DEFAULTSize.Z); //done
            break;
        case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_TukTukTuk:
            return FVector(84, 136, DEFAULTSize.Z); //done
            break;
        case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_SnowBike:
            return FVector(42, 137, DEFAULTSize.Z); // dome
            break;
        case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_GoldMirado:
            return FVector(120, 260, DEFAULTSize.Z); // done
            break;
        case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_Amphibious:
            return FVector(160, 284, DEFAULTSize.Z);
            break;
        default:
            return DEFAULTSize;
            break;
    }
    return DEFAULTSize;
}

//wstring playerstatus(int GetEnemyState)
//{
//    switch (GetEnemyState)
//    {
//        case 0:
//            return L"AFK";
//            break;
//        case 1032:
//            return L"TILT HEAD";
//            break;
//        case 268435464:
//            return L"PLAY EMOTION";
//            break;
//        case 1552:
//            return L"AIMING";

//            break;
//        case 8388616:
//            return L"PARACHUTE";
//            break;
//        case 131072:
//            return L"KNOCKED";
//            break;
//        case 33554440:
//            return L"PLANE";
//            break;
//        case 8205:
//            return L"SHOT";
//            break;
//        case 32:
//            return L"SIT";
//            break;
//        case 4194303:
//            return L"SWIMMING";
//            break;
//        case 72:
//            return L"JUMPING";
//            break;
//        case 8388608:
//            return L"PARACHUTE";
//            break;
//        case 16392:
//            return L"THROW SOMETHING";
//            break;
//        case 262:
//            return L"RELOADING";
//            break;
//        case 1048584:
//            return L"RIDE";
//            break;
//        case 8200:
//            return L"FIST";
//            break;
//        case 2056:
//            return L"CUT GUN";
//            break;
//        case 4194302:
//            return L"SWIMMING";
//            break;
//        case 269:
//            return L"RELOADING";
//            break;
//        case 16777224:
//            return L"CLIMBING";
//            break;
//        case 10:
//            return L"RUN";
//            break;
//        case 263:
//            return L"RELOADING";
//            break;
//        case 65568 || 65544:
//            return L"FIGHT MEDICINE";
//            break;
//        case 4194308:
//            return L"SWIMMING";
//            break;
//        case 268:
//            return L"RELOADING";
//            break;
//        case 35:
//            return L"GET SIT";
//            break;
//        case 8388617:
//            return L"PARACHUTE";
//            break;
//        case 33:
//            return L"AIMING";
//            break;
//        case 75:
//            return L"JUMPING";
//            break;
//        case 8201:
//            return L"FIST";
//            break;
//        case 266:
//            return L"RELOADING";
//            break;
//        case 32776:
//            return L"KNOCKED";
//            break;
//        case 270:
//            return L"RELOADING";
//            break;
//        case 4194301:
//            return L"SWIMMING";
//            break;
//        case 1033:
//            return L"RUN";
//            break;
//        case 131073:
//            return L"KNOCKED";
//            break;
//        case 524296:
//            return L"DRIVING";
//            break;
//        case 1114120:
//            return L"FIGHT MEDICINE";
//            break;
//        case 265:
//            return L"RELOADING";
//            break;
//        case 9:
//            return L"RUN";
//            break;
//        case 262144:
//            return L"SMOKE";
//            break;
//        case 8203:
//            return L"FIST";
//            break;
//        case 8202:
//            return L"SHOT";
//            break;
//        case 262152:
//            return L"DEATH";
//            break;
//        case 17416:
//            return L"THROW SOMETHING";
//            break;
//        case 17:
//            return L"SIT";
//            break;
//        case 11:
//            return L"RUN";
//            break;
//        case 65545:
//            return L"FIGHT MEDICINE";
//            break;
//        case 33554432:
//            return L"PLANE";
//            break;
//        case 19:
//            return L"SQUAT";
//            break;
//        case 8208:
//            return L"SHOT";
//            break;
//        case 520:
//            return L"AIMING";
//            break;
//        case 8206:
//            return L"SHOT";
//            break;
//        case 8:
//            return L"STAND";
//            break;
//        case 16:
//            return L"SIT";
//            break;
//        case 13180:
//            return L"KNOCKED";
//            break;
//        case 4194310:
//            return L"SWIMMING";
//            break;
//        case 16393:
//            return L"THROW SOMETHING";
//            break;
//        case 4194309:
//            return L"SWIMMING";
//            break;
//        case 264:
//            return L"RELOADING";
//            break;
//        case 4194305:
//            return L"SWIMMING";
//            break;
//        case 8207:
//            return L"SHOT";
//            break;
//        case 4194307:
//            return L"SWIMMING";
//            break;
//            return L"";
//    }
//
//}
wstring GetBoxItems(long code)
{
    if (code == 101008)
        return L"M762";
    else if (code == 101003)
        return L"SCAR-L";
    else if (code == 101004)
        return L"M416";
    else if (code == 101002)
        return L"M16A-4";
    else if (code == 103003)
        return L"AWM";
    else if (code == 103010)
        return L"QBU";
    else if (code == 103009)
        return L"SLR";
    else if (code == 103004)
        return L"SKS";
    else if (code == 103006)
        return L"Mini14";
    else if (code == 103002)
        return L"M24";
    else if (code == 103001)
        return L"Kar98k";
    else if (code == 103005)
        return L"VSS";
    else if (code == 103008)
        return L"Win94";
    else if (code == 101009)
        return L"Mk47";
    else if (code == 101010)
        return L"G36C";
    else if (code == 101007)
        return L"QBZ";
    else if (code == 101001)
        return L"AKM";
    else if (code == 101005)
        return L"Groza";
    else if (code == 101006)
        return L"AUG_A3";
    else if (code == 104003)
        return L"S12K";
    else if (code == 104004)
        return L"DBS";
    else if (code == 104001)
        return L"S686";
    else if (code == 104002)
        return L"S1897";
    else if (code == 106006)
        return L"SawedOff";
    else if (code == 102005)
        return L"PP19 Bizon";
    else if (code == 102004)
        return L"TommyGun";
    else if (code == 102007)
        return L"MP5K";
    else if (code == 102002)
        return L"UMP9";
    else if (code == 102003)
        return L"Vector";
    else if (code == 102001)
        return L"Uzi";
    else if (code == 106003)
        return L"R1895";
    else if (code == 106008)
        return L"Vz61";
    else if (code == 106001)
        return L"P92";
    else if (code == 106004)
        return L"P18C";
    else if (code == 106005)
        return L"R45";
    else if (code == 106002)
        return L"P1911";
    else if (code == 106010)
        return L"DesertEagle";
    else if (code == 108003)
        return L"Sickle";
    else if (code == 108001)
        return L"Machete";
    else if (code == 107001)
        return L"Cross Bow";
    else if (code == 108004)
        return L"Pan";
    else if (code == 103007)
        return L"Mk14";
    else if (code == 302001)
        return L"7.62";
    else if (code == 305001)
        return L"45ACP";
    else if (code == 303001)
        return L"5.56";
    else if (code == 301001)
        return L"9mm";
    else if (code == 306001)
        return L"300Magnum";
    else if (code == 304001)
        return L"12Guage";
    else if (code == 307001)
        return L"Arrows";
    else if (code == 201010)
        return L"Rifle-FlashHider";
    else if (code == 201009)
        return L"Rifle-Compensator";
    else if (code == 201004)
        return L"Mid Compensator";
    else if (code == 205002)
        return L"Tactical_Rifle";
    else if (code == 201012)
        return L"Duckbill";
    else if (code == 201005)
        return L"Sniper_FlashHider";
    else if (code == 201006)
        return L"Mid_Suppressor";
    else if (code == 205003)
        return L"Chekpad Sniper";
    else if (code == 201001)
        return L"Choke";
    else if (code == 205001)
        return L"UZI_Pickup";
    else if (code == 201003)
        return L"Sniper-Compensator";
    else if (code == 201007)
        return L"Sniper-Suppressor";
    else if (code == 201011)
        return L"Suppressor-AR";
    else if (code == 204009)
        return L"Sniper-Extended";
    else if (code == 204004)
        return L"Mid_E";
    else if (code == 204005)
        return L"Mid_Q";
    else if (code == 204007)
        return L"Sniper_Mag";
    else if (code == 204008)
        return L"Sniper_QuickMag";
    else if (code == 204012)
        return L"Rifle_Mag";
    else if (code == 204013)
        return L"Exteded AR";
    else if (code == 204011)
        return L"Mag-AR";
    else if (code == 204006)
        return L"Mid_EQ";
    else if (code == 205004)
        return L"Crossbow";
    else if (code == 204014)
        return L"ZDD_Sniper";
    else if (code == 203005)
        return L"8x";
    else if (code == 203003)
        return L"2x";
    else if (code == 203001)
        return L"Lazer";
    else if (code == 203014)
        return L"3X";
    else if (code == 203002)
        return L"Holo";
    else if (code == 203015)
        return L"6x";
    else if (code == 203004)
        return L"4x";
    else if (code == 105002)
        return L"DP28";
    else if (code == 107001)
        return L"CrossBow";
    else if (code == 105001)
        return L"M249";
    else if (code == 501006)
        return L"Bag Lv.3";
    else if (code == 501004)
        return L"Bag Lv.1";
    else if (code == 501005)
        return L"Bag Lv.2";
    else if (code == 503002)
        return L"Armour Lv.2";
    else if (code == 503001)
        return L"Armour Lv.1";
    else if (code == 503003)
        return L"Armour Lv.3";
    else if (code == 502002)
        return L"Helmet Lv.2";
    else if (code == 502001)
        return L"Helmet Lv.1";
    else if (code == 502003)
        return L"Helmet Lv.3";
    else if (code == 602004)
        return L"Grenade";
    else if (code == 602002)
        return L"Smoke";
    else if (code == 602003)
        return L"Molotof";
    else if (code == 602005)
        return L"Apple";
    else if (code == 601003)
        return L"Painkiller";
    else if (code == 601002)
        return L"Adrenaline";
    else if (code == 601001)
        return L"Energy Drink";
    else if (code == 601005)
        return L"FirstaidKit";
    else if (code == 601004)
        return L"Bandage";
    else if (code == 202006)
        return L"ThumbGrip";
    else if (code == 202007)
        return L"Lasersight";
    else if (code == 202001)
        return L"Angled";
    else if (code == 202004)
        return L"LightGrip";
    else if (code == 106007)
        return L"Flaregun";
    else if (code == 3000312)
        return L"GameCoin";
    else if (code == 601006)
        return L"Medkit";
    else if (code == 308001)
        return L"Flaregun";
    else if (code == 501003)
        return L"Bag Lv.3";
    else if (code == 501002)
        return L"Bag Lv.2";
    else if (code == 501001)
        return L"Bag Lv.1";
    else if (code == 201002)
        return L"Mid_Compensator";
    else if (code == 502005)
        return L"Helmet Lv.2";
    else if (code == 403989)
        return L"Arctic-Suit";
    else if (code == 403045)
        return L"Woodland-Suit";
    else if (code == 403187)
        return L"Desert-Suit";
    else if (code == 403188)
        return L"Desert-Suit";
    else
        return L"";
    
}
bool _read(kaddr addr, void *buffer, int len)
{
    if (!IsValidAddress(addr)) return false;
    vm_size_t size = 0;
    kern_return_t error = vm_read_overwrite(mach_task_self(), (vm_address_t)addr, len, (vm_address_t)buffer, &size);
    if(error != KERN_SUCCESS || size != len)
    {
        return false;
    }
    return true;
}

bool _write(kaddr addr, void *buffer, int len)
{
    if (!IsValidAddress(addr)) return false;
    kern_return_t error = vm_write(mach_task_self(), (vm_address_t)addr, (vm_offset_t)buffer, (mach_msg_type_number_t)len);
    if(error != KERN_SUCCESS)
    {
        return false;
    }
    return true;
}
kaddr GetRealOffset(kaddr offset) {
    if (module == 0) {
        return 0;
    }
    return (module + offset);
}
template<typename T> T Read(kaddr addr) {
    T data;
    _read(addr, reinterpret_cast<void *>(&data), sizeof(T));
    return data;
}


#define W2S(w, s) UGameplayStatics::ProjectWorldToScreen(g_PlayerController, w, false, s)

FVector WorldToRadar(float Yaw, FVector Origin, FVector LocalOrigin, float PosX, float PosY, Vector3 Size, bool & outbuff) {
 bool flag = false;
 double num = (double)Yaw;
 double num2 = num * 0.017453292519943295;
 float num3 = (float)std::cos(num2);
 float num4 = (float)std::sin(num2);
 float num5 = Origin.X - LocalOrigin.X;
 float num6 = Origin.Y - LocalOrigin.Y;
 struct FVector Xector;
 Xector.X = (num6 * num3 - num5 * num4) / 150.f;
 Xector.Y = (num5 * num3 + num6 * num4) / 150.f;
 struct FVector Xector2;
 Xector2.X = Xector.X + PosX + Size.X / 2.f;
 Xector2.Y = -Xector.Y + PosY + Size.Y / 2.f;
 bool flag2 = Xector2.X > PosX + Size.X;
 if (flag2) {
  Xector2.X = PosX + Size.X;
 } else {
  bool flag3 = Xector2.X < PosX;
  if (flag3) {
   Xector2.X = PosX;
  }
 }
 bool flag4 = Xector2.Y > PosY + Size.Y;
 if (flag4) {
  Xector2.Y = PosY + Size.Y;
 } else {
  bool flag5 = Xector2.Y < PosY;
  if (flag5) {
   Xector2.Y = PosY;
  }
 }
 bool flag6 = Xector2.Y == PosY || Xector2.X == PosX;
 if (flag6) {
  flag = true;
 }
 outbuff = flag;
 return Xector2;
}

 
FVector2D WorldToRadar(float Yaw, FVector Origin, FVector LocalOrigin, float PosX, float PosY,
                       FVector Size, bool & outbuff)
{
    bool flag = false;
    double num = (double)Yaw;
    double num2 = num * 0.017453292519943295;
    float num3 = (float)std::cos(num2);
    float num4 = (float)std::sin(num2);
    float num5 = Origin.X - LocalOrigin.X;
    float num6 = Origin.Y - LocalOrigin.Y;
    FVector2D vector;
    vector.X = (num6 * num3 - num5 * num4) / 150.f;
    vector.Y = (num5 * num3 + num6 * num4) / 150.f;
    FVector2D vector2;
    vector2.X = vector.X + PosX + Size.X / 2.f;
    vector2.Y = -vector.Y + PosY + Size.Y / 2.f;
    bool flag2 = vector2.X > PosX + Size.X;
    if (flag2)
    {
        vector2.X = PosX + Size.X;
    }
    else
    {
        bool flag3 = vector2.X < PosX;
        if (flag3)
        {
            vector2.X = PosX;
        }
    }
    bool flag4 = vector2.Y > PosY + Size.Y;
    if (flag4)
    {
        vector2.Y = PosY + Size.Y;
    }
    else
    {
        bool flag5 = vector2.Y < PosY;
        if (flag5)
        {
            vector2.Y = PosY;
        }
    }
    bool flag6 = vector2.Y == PosY || vector2.X == PosX;
    if (flag6)
    {
        flag = true;
    }
    outbuff = flag;
    return vector2;
}

auto GetTargetForBT()
{
    ASTExtraPlayerCharacter *result = 0;
    float max = std::numeric_limits<float>::infinity();
    auto GWorlld = GetFullWorld();
    if (GWorlld)
    {
        ULevel *PersistentLevel = GWorlld->PersistentLevel;
        if (PersistentLevel)
        {
            TArray<AActor *> Actors = *(TArray<AActor *> *)((uintptr_t)PersistentLevel + Actors_Offset);
            auto localPlayer = g_LocalPlayer;
            auto localController = g_PlayerController;
            if (localPlayer)
            {
                for (int i = 0; i < Actors.Num(); i++)
                {
                    auto Actor = Actors[i];
                    if (isObjectInvalid(Actor))
                        continue;

                    if (Actor->IsA(ASTExtraPlayerCharacter::StaticClass()))
                    {
                        auto Player = (ASTExtraPlayerCharacter *)Actor;

            if (Player->PlayerKey == localPlayer->PlayerKey)
                continue;

            if (Player->TeamID == localPlayer->TeamID)
                continue;

            if (Player->bDead)
                continue;

            if (Player->bHidden) //
                continue;

            //if (!Player->Mesh) //
            //    continue;

            if (!Player->RootComponent) //
                continue;

            if (preferences.Config.SilentAim.IgnoreKnocked) {
                if (Player->Health == 0.0f)
                    continue;
            }

            if (preferences.Config.SilentAim.IgnoreBot) {
                if (Player->bEnsure)
                    continue;
            }

                        auto Root = Player->GetBonePos("Root", {});
                        auto Head = Player->GetBonePos("Head", {});

                        FVector2D RootSc, HeadSc;
                        if (W2S(Root, &RootSc) && W2S(Head, &HeadSc))
                        {
                            float height = abs(HeadSc.Y - RootSc.Y);
                            float width = height * 1.00;

                            FVector middlePoint = {HeadSc.X + (width / 2), HeadSc.Y + (height / 2),
                                                   0};
                            if ((middlePoint.X >= 0 && middlePoint.X <= screenWidth) && (middlePoint.Y >= 0 && middlePoint.Y <= screenHeight))
                            {
                                FVector2D v2Middle = FVector2D((float)(screenWidth / 2), (float)(screenHeight / 2));
                                FVector2D v2Loc = FVector2D(middlePoint.X, middlePoint.Y);
                                float dist = FVector2D::Distance(v2Middle, v2Loc);
                                
                                // 添加判断在圆圈内的条件
                                float radius = FOVsize;
                                
                                if (dist < radius) {
                                if (dist < max) {
                                    max = dist;
                                    result = Player;
                                    }
                                }
                            }
                        }
                    }
                }
            }

            return result;
        }
    }
}


void VectorAnglesRadar(FVector& forward, FVector& angles)
{
    if (forward.X == 0.f && forward.Y == 0.f)
    {
        angles.X = forward.Z > 0.f ? -90.f : 90.f;
        angles.Y = 0.f;
    }
    else
    {
        angles.X = RAD2DEG(atan2(-forward.Z, forward.Size()));
        angles.Y = RAD2DEG(atan2(forward.Y, forward.X));
    }
    angles.Z = 0.f;
}
FRotator ToRotator(FVector local, FVector target) {
    FVector rotation;
    rotation.X = local.X - target.X;
    rotation.Y = local.Y - target.Y;
    rotation.Z = local.Z - target.Z;

    FRotator newViewAngle = {0};

    float hyp = sqrt(rotation.X * rotation.X + rotation.Y * rotation.Y);

    newViewAngle.Pitch = -atan(rotation.Z / hyp) * (180.f / (float) 3.14159265358979323846);
    newViewAngle.Yaw = atan(rotation.Y / rotation.X) * (180.f / (float) 3.14159265358979323846);
    newViewAngle.Roll = (float) 0.f;

    if (rotation.X >= 0.f)
        newViewAngle.Yaw += 180.0f;

    return newViewAngle;
}
void RotateTriangle(std::array < FVector2D, 39 > &points, float rotation)
{
    const auto points_center = (points.at(0) + points.at(1) + points.at(2) + points.at(3) + points.at(4) + points.at(5) + points.at(6)
                                + points.at(7) + points.at(8) + points.at(9) + points.at(10) + points.at(11) + points.at(12) + points.at(13)
                                + points.at(14) + points.at(15) + points.at(16) + points.at(17) + points.at(18) + points.at(19) + points.at(20)
                                + points.at(21) + points.at(22) + points.at(23) + points.at(24) + points.at(25) + points.at(26) + points.at(27)
                                + points.at(28) + points.at(29) + points.at(30) + points.at(31) + points.at(32) + points.at(33) + points.at(34)
                                + points.at(35) + points.at(36) + points.at(37) + points.at(38)) / 39;
    for (auto & point:points) {
        point = point - points_center;
        const auto temp_x = point.X;
        const auto temp_y = point.Y;
        const auto theta = DEG2RAD(rotation);
        const auto c = cosf(theta);
        const auto s = sinf(theta);
        point.X = temp_x * c - temp_y * s;
        point.Y = temp_x * s + temp_y * c;
        point = point + points_center;
    }
}
void FixTriangle(float& XPos, float& YPos, int screenDist){
    //
    // —————————Triangle X Pos—————————————
    if(XPos > (screenWidth - 16)) {
        XPos = screenWidth;
        XPos -= screenDist;
    }
    // ——————————————————————
    if(XPos < 16) {
        XPos = 16;
        XPos += screenDist;
    }
    // ————————— Triangle Y Pos —————————————
    if(YPos > (screenHeight - 16)) {
        YPos = screenHeight;
        YPos -= screenDist;
    }
    if(YPos < 16) {
        YPos = 16;
        YPos += screenDist;
    }
}
void DrawArrows(AHUD * hud,std::array < FVector2D, 39 > Loc, float thickness, FLinearColor color) {
    for (int i = 10; i < 25; i++) {
        DrawLine(hud,Loc.at(i), Loc.at(7), thickness, color);
    }
    for (int i = 26; i < 38; i++) {
        DrawLine(hud,Loc.at(i), Loc.at(7), thickness + 1.5, color);
        DrawLine(hud,Loc.at(i), Loc.at(8), thickness+ 1.5f, color);
        DrawLine(hud,Loc.at(i), Loc.at(9), thickness + 1.5f, color);
    }
    DrawLine(hud,Loc.at(0), Loc.at(1), thickness * 1.f, COLOR_BLACK);
    DrawLine(hud,Loc.at(1), Loc.at(2), thickness * 1.f, COLOR_BLACK);
    DrawLine(hud,Loc.at(2), Loc.at(6), thickness * 1.f, COLOR_BLACK);
    DrawLine(hud,Loc.at(6), Loc.at(5), thickness * 1.f, COLOR_BLACK);
    DrawLine(hud,Loc.at(5), Loc.at(4), thickness * 1.f, COLOR_BLACK);
    DrawLine(hud,Loc.at(4), Loc.at(3), thickness * 1.f, COLOR_BLACK);
    DrawLine(hud,Loc.at(3), Loc.at(0), thickness * 1.f, COLOR_BLACK);
}

static std::unordered_set<uint32_t> AlreadyChangedSet;
uintptr_t GetVirtualFunctionAddress(uintptr_t clazz, uintptr_t index)
{
    if (!clazz)
    {
        return 0;
    }
    uintptr_t vtablePtr = *(uintptr_t*)clazz;
    if (!vtablePtr)
    {
        return 0;
    }
    // Ensure index is within bounds of the vtable
    if (index < 0)
    {
        return 0;
    }
    return *((uintptr_t*)vtablePtr + index);
}
void ChangeItemAVc(uintptr_t thiz, int InItemID)
{
    if (thiz)
    {
        auto PrechangeitemAvatar_addr = GetVirtualFunctionAddress(thiz, 182); //vtable idx
        if (PrechangeitemAvatar_addr)
        {
            return ((void(*)(uintptr_t, int, bool))PrechangeitemAvatar_addr)(thiz, InItemID, true);
        }
    }
}

int glWidth, glHeight;
bool isInsideFOV(int x, int y) {
    if (!preferences.Config.SilentAim.Cross)
        return true;
    int circle_x = screenWidth / 2;
    int circle_y = screenHeight / 2;
    int rad = (int) preferences.Config.SilentAim.Cross * 2.0f;
    return (x - circle_x) * (x - circle_x) + (y - circle_y) * (y - circle_y) <= rad * rad;
}
auto GetTargetForAimBotByDistance() {
    ASTExtraPlayerCharacter *result = 0;
    float max = std::numeric_limits<float>::infinity();
    ASTExtraPlayerCharacter *localPlayer = 0;
    ASTExtraPlayerController *localPlayerController = 0;
    auto GWorld = GetFullWorld();
    if (GWorld) {
        UNetDriver *NetDriver = GWorld->NetDriver;
        if (NetDriver) {
            UNetConnection *ServerConnection = NetDriver->ServerConnection;
            if (ServerConnection) {
                localPlayerController = (ASTExtraPlayerController *) ServerConnection->PlayerController;

            }
        }
        if (localPlayerController) {
            std::vector<ASTExtraPlayerCharacter*> PlayerCharacter;
            GetAllActors(PlayerCharacter);
            for (auto actor = PlayerCharacter.begin(); actor != PlayerCharacter.end(); actor++) {
                auto Actor = *actor;
                if (Actor->PlayerKey == ((ASTExtraPlayerController *) localPlayerController)->PlayerKey) {
                    localPlayer = Actor;
                    break;
                }
            }
            std::vector<ASTExtraPlayerCharacter*> PlayerCharacter2;
            GetAllActors(PlayerCharacter2);
            for (auto actor = PlayerCharacter2.begin(); actor != PlayerCharacter2.end();
                 actor++)
            {
                auto Player = *actor;



                if (Player->PlayerKey == localPlayer->PlayerKey)
                    continue;
                if (Player->TeamID == localPlayer->TeamID)
                    continue;
                if (Player->bDead)
                    continue;
                if (Player->bHidden )
                    continue;
                if (!Player->Mesh)
                    continue;
                if (!Player->RootComponent)
                    continue;
                if (preferences.Config.SilentAim.IgnoreKnocked) {
                    if (Player->Health == 0.0f)
                        continue;
                }
                if(!preferences.Config.SilentAim.VisCheck){
                    if (!localPlayerController->LineOfSightTo(Player, {0, 0, 0}, true))
                        continue;
                }
                if (preferences.Config.SilentAim.IgnoreBot) {
                    if (Player->bEnsure)
                        continue;
                }
                float dist = Player->GetDistanceTo(localPlayer);
                if (dist < max) {
                    max = dist;
                    result = Player;
                }
            } PlayerCharacter2.clear();
        }
    }
    return result;
}
auto GetTargetByCrossDist() {
    ASTExtraPlayerCharacter *result = 0;
    float max = std::numeric_limits<float>::infinity();

    auto localPlayer = g_LocalPlayer;
    auto localController = g_PlayerController;

    if (localPlayer && localController) {
        std::vector<ASTExtraPlayerCharacter *> PlayerCharacter;
        GetAllActors(PlayerCharacter);
        for (auto actor = PlayerCharacter.begin(); actor != PlayerCharacter.end(); actor++) {
            auto Player = *actor;

            if (Player->PlayerKey == localPlayer->PlayerKey)
                continue;

            if (Player->TeamID == localPlayer->TeamID)
                continue;

            if (Player->bDead)
                continue;

            if (Player->bHidden) //
                continue;

            //if (!Player->Mesh) //
            //    continue;

            if (!Player->RootComponent) //
                continue;

            if (preferences.Config.SilentAim.IgnoreKnocked) {
                if (Player->Health == 0.0f)
                    continue;
            }

            if (preferences.Config.SilentAim.IgnoreBot) {
                if (Player->bEnsure)
                    continue;
            }
            
            float dist = localPlayer->GetDistanceTo(Player) / 100.0f;           
				if (dist > g_disstance)
				continue;
            
            if (preferences.Config.SilentAim.VisCheck) {
                if (!localController->LineOfSightTo(Player, {0, 0, 0}, true))
                    continue;
            }
            auto Root = Player->GetBonePos("Root", {});
            auto Head = Player->GetBonePos("Head", {});

            FVector2D RootSc, HeadSc;
            if (W2S(Root, &RootSc) && W2S(Head, &HeadSc)) {
                float height = abs(HeadSc.Y - RootSc.Y);
                float width = height * 1.00;

                FVector middlePoint = {HeadSc.X + (width / 2), HeadSc.Y + (height / 2), 0};
                if ((middlePoint.X >= 0 && middlePoint.X <= (float) glWidth) &&
                    (middlePoint.Y >= 0 && middlePoint.Y <= (float) glHeight)) {
                    FVector2D v2Middle = FVector2D((float) (glWidth / 2), (float) (glHeight / 2));
                    FVector2D v2Loc = FVector2D(middlePoint.X, middlePoint.Y);
                    if(isInsideFOV((int)middlePoint.X, (int)middlePoint.Y )) {
                    float distance = FVector2D::Distance(v2Middle, v2Loc);
                    if (distance < max) {
                        max = distance;
                        result = Player;
                    }
                  }
                }
            }
        }
    }
    return result;
}
auto GetCurrentWeaponReplicated(ASTExtraPlayerCharacter * mode) {
    auto WeaponManagerComponent = mode->WeaponManagerComponent;
    if (WeaponManagerComponent) {
        auto propSlot = WeaponManagerComponent->GetCurrentUsingPropSlot();
        if ((int)propSlot.GetValue() >= 1 && (int)propSlot.GetValue() <= 3) {
            return (ASTExtraShootWeapon *)WeaponManagerComponent->CurrentWeaponReplicated;
        }
    }
}
void (*orig_shoot_event)(USTExtraShootWeaponComponent *thiz, FVector start, FRotator rot, void *unk1, int unk2) = 0; 
void shoot_event(USTExtraShootWeaponComponent *thiz, FVector start, FRotator rot, ASTExtraShootWeapon *weapon, int unk1) { 
if(吸人){
	   if (g_LocalPlayer->IsClientPeeking) {
	   ASTExtraPlayerCharacter *Target = GetTargetByCrossDist();
	   if (Target) {
	       bool bSweep = false;
	       bool bTeleport = false;
	       FHitResult SweepHitResult;
	       
	       // 获取玩家的根节点位置
	       FVector PlayerPos = g_LocalPlayer->STPlayerController->AcknowledgedPawn->K2_GetActorLocation();
	       
	       // 将目标玩家传送到玩家位置
	       Target->K2_SetActorLocation(PlayerPos, bSweep, bTeleport, &SweepHitResult);
	   } else {
	       ASTExtraPlayerCharacter *Target = GetTargetForAimBotByDistance();
	       if (Target) {
	           bool bSweep = false;
	           bool bTeleport = false;
	           FHitResult SweepHitResult;
	           
	           // 获取玩家的根节点位置
	           FVector PlayerPos = g_LocalPlayer->STPlayerController->AcknowledgedPawn->K2_GetActorLocation();
	           
	           // 将目标玩家传送到玩家位置
	           Target->K2_SetActorLocation(PlayerPos, bSweep, bTeleport, &SweepHitResult);
	       }
	   }
	   
	   }
	   
	   }

if (preferences.Config.SilentAim.Enable) { 
 
             if(Fixshoot){ 
		 if (g_LocalPlayer->PartHitComponent) {
         auto ConfigCollisionDistSqAngles = g_LocalPlayer->PartHitComponent->ConfigCollisionDistSqAngles;
         for (int j = 0; j < ConfigCollisionDistSqAngles.Num(); j++) {
             ConfigCollisionDistSqAngles[j].Angle = 90.0f;
         }
         g_LocalPlayer->PartHitComponent->ConfigCollisionDistSqAngles = ConfigCollisionDistSqAngles;
     }
	 
     }
     ASTExtraPlayerCharacter *Target = GetTargetByCrossDist();
int randomNumber = arc4random_uniform(100);
 	 int 随机部位 = arc4random_uniform(100);
     if (randomNumber < (int)追踪概率) {
         NSLog(@"满足条件");
             if (Target) { 
                bool triggerOk = false; 
                triggerOk = g_LocalPlayer->bIsWeaponFiring || g_LocalPlayer->bIsGunADS; 
            if (triggerOk) { 
          
   if(Aim == 1){
			 FVector targetAimPos = Target->GetBonePos("Head", {0, 0, 0});//头部骨骼 
 targetAimPos.Z += 8.0f;               
FRotator sex = ToRotator(start, targetAimPos); 
 
return orig_shoot_event(thiz, targetAimPos, sex, weapon, unk1); 
         
		}else if(Aim == 2){
			    FVector targetAimPos = Target->GetBonePos("pelvis", {0, 0, 0});//头部骨骼 
   targetAimPos.Z += 8.0f;               
FRotator sex = ToRotator(start, targetAimPos); 
 
return orig_shoot_event(thiz, targetAimPos, sex, weapon, unk1); 
         
		}else if (Aim == 3){
			if (随机部位 > 0 && 随机部位 <= 5) {
			    // 部位 1
			    FVector targetAimPos = Target->GetBonePos("spine_03", {0, 0, 0});
			targetAimPos.Z += 8.0f;               
FRotator sex = ToRotator(start, targetAimPos);  
 
return orig_shoot_event(thiz, targetAimPos, sex, weapon, unk1); } else if (随机部位 > 5 && 随机部位 <= 10) {
			    // 部位 2
			    FVector targetAimPos = Target->GetBonePos("clavicle_r", {0, 0, 0});
			targetAimPos.Z += 8.0f;               
FRotator sex = ToRotator(start, targetAimPos); 
 
return orig_shoot_event(thiz, targetAimPos, sex, weapon, unk1); } else if (随机部位 > 10 && 随机部位 <= 15) {
			    // 部位 3
			    FVector targetAimPos = Target->GetBonePos("upperarm_r", {0, 0, 0});
targetAimPos.Z += 8.0f;               
FRotator sex = ToRotator(start, targetAimPos); 
 
return orig_shoot_event(thiz, targetAimPos, sex, weapon, unk1); 
			} else if (随机部位 > 15 && 随机部位 <= 20) {
			    // 部位 4
			    FVector targetAimPos = Target->GetBonePos("lowerarm_r", {0, 0, 0});
			targetAimPos.Z += 8.0f;               
FRotator sex = ToRotator(start, targetAimPos); 
 
return orig_shoot_event(thiz, targetAimPos, sex, weapon, unk1); } else if (随机部位 > 20 && 随机部位 <= 25) {
			    // 部位 5
			    FVector targetAimPos = Target->GetBonePos("hand_r", {0, 0, 0});
			targetAimPos.Z += 8.0f;               
FRotator sex = ToRotator(start, targetAimPos); 
 
return orig_shoot_event(thiz, targetAimPos, sex, weapon, unk1); } else if (随机部位 > 25 && 随机部位 <= 30) {
			    // 部位 6
			    FVector targetAimPos = Target->GetBonePos("item_r", {0, 0, 0});
			targetAimPos.Z += 8.0f;               
FRotator sex = ToRotator(start, targetAimPos); 
 
return orig_shoot_event(thiz, targetAimPos, sex, weapon, unk1); } else if (随机部位 > 30 && 随机部位 <= 35) {
			    // 部位 7
			   FVector targetAimPos = Target->GetBonePos("neck_01", {0, 0, 0});
			targetAimPos.Z += 8.0f;               
FRotator sex = ToRotator(start, targetAimPos);  
 
return orig_shoot_event(thiz, targetAimPos, sex, weapon, unk1); } else if (随机部位 > 35 && 随机部位 <= 40) {
			    // 部位 8
			    FVector targetAimPos = Target->GetBonePos("upperarm_l", {0, 0, 0});
			targetAimPos.Z += 8.0f;               
FRotator sex = ToRotator(start, targetAimPos); 
return orig_shoot_event(thiz, targetAimPos, sex, weapon, unk1); } else if (随机部位 > 40 && 随机部位 <= 45) {
			    // 部位 9
			    FVector targetAimPos = Target->GetBonePos("lowerarm_l", {0, 0, 0});
			targetAimPos.Z += 8.0f;               
FRotator sex = ToRotator(start, targetAimPos); 
 
return orig_shoot_event(thiz, targetAimPos, sex, weapon, unk1); } else if (随机部位 > 45 && 随机部位 <= 50) {
			    // 部位 10
			    FVector targetAimPos = Target->GetBonePos("hand_l", {0, 0, 0});
			targetAimPos.Z += 8.0f;               
FRotator sex = ToRotator(start, targetAimPos);  
 
return orig_shoot_event(thiz, targetAimPos, sex, weapon, unk1); } else if (随机部位 > 50 && 随机部位 <= 55) {
			    // 部位 11
			    FVector targetAimPos = Target->GetBonePos("item_l", {0, 0, 0});
			targetAimPos.Z += 8.0f;               
FRotator sex = ToRotator(start, targetAimPos); 
 
return orig_shoot_event(thiz, targetAimPos, sex, weapon, unk1); } else if (随机部位 > 55 && 随机部位 <= 60) {
			    // 部位 12
			    FVector targetAimPos = Target->GetBonePos("Head", {0, 0, 0});
			targetAimPos.Z += 8.0f;               
FRotator sex = ToRotator(start, targetAimPos); 
 
return orig_shoot_event(thiz, targetAimPos, sex, weapon, unk1); } else if (随机部位 > 60 && 随机部位 <= 65) {
			    // 部位 13
			    FVector targetAimPos = Target->GetBonePos("spine_02", {0, 0, 0});
			targetAimPos.Z += 8.0f;               
FRotator sex = ToRotator(start, targetAimPos); 
 
return orig_shoot_event(thiz, targetAimPos, sex, weapon, unk1); } else if (随机部位 > 65 && 随机部位 <= 70) {
			    // 部位 14
			     FVector targetAimPos = Target->GetBonePos("Head", {0, 0, 0});
			targetAimPos.Z += 8.0f;               
FRotator sex = ToRotator(start, targetAimPos); 
 
return orig_shoot_event(thiz, targetAimPos, sex, weapon, unk1); } else if (随机部位 > 70 && 随机部位 <= 75) {
			    // 部位 15
			    FVector targetAimPos = Target->GetBonePos("spine_01", {0, 0, 0});
			targetAimPos.Z += 8.0f;               
FRotator sex = ToRotator(start, targetAimPos); 
 
return orig_shoot_event(thiz, targetAimPos, sex, weapon, unk1); } else if (随机部位 > 75 && 随机部位 <= 80) {
			    // 部位 16
			    FVector targetAimPos = Target->GetBonePos("pelvis", {0, 0, 0});
			targetAimPos.Z += 8.0f;               
FRotator sex = ToRotator(start, targetAimPos); 
 
return orig_shoot_event(thiz, targetAimPos, sex, weapon, unk1); } else if (随机部位 > 80 && 随机部位 <= 85) {
			    // 部位 17
			    FVector targetAimPos = Target->GetBonePos("thigh_r", {0, 0, 0});
			targetAimPos.Z += 8.0f;               
FRotator sex = ToRotator(start, targetAimPos); 
 
return orig_shoot_event(thiz, targetAimPos, sex, weapon, unk1); } else if (随机部位 > 85 && 随机部位 <= 90) {
			    // 部位 18
			    FVector targetAimPos = Target->GetBonePos("calf_r", {0, 0, 0});
			targetAimPos.Z += 8.0f;               
FRotator sex = ToRotator(start, targetAimPos);  
 
return orig_shoot_event(thiz, targetAimPos, sex, weapon, unk1); } else if (随机部位 > 90 && 随机部位 <= 95) {
			    // 部位 19
			    FVector targetAimPos = Target->GetBonePos("foot_r", {0, 0, 0});
			targetAimPos.Z += 8.0f;               
FRotator sex = ToRotator(start, targetAimPos);  
 
return orig_shoot_event(thiz, targetAimPos, sex, weapon, unk1); } else if (随机部位 > 95 && 随机部位 <= 100) {
			    // 部位 20
			    FVector targetAimPos = Target->GetBonePos("thigh_l", {0, 0, 0});
	targetAimPos.Z += 8.0f;               
FRotator sex = ToRotator(start, targetAimPos); 
 
return orig_shoot_event(thiz, targetAimPos, sex, weapon, unk1); 		}else{
				 FVector targetAimPos = Target->GetBonePos("Head", {0, 0, 0});
				
			targetAimPos.Z += 8.0f;               
FRotator sex = ToRotator(start, targetAimPos); 
 
return orig_shoot_event(thiz, targetAimPos, sex, weapon, unk1); } if(Aim == 4){
			 FVector targetAimPos = Target->GetBonePos("neck_01", {0, 0, 0});//头部骨骼 
 targetAimPos.Z += 8.0f;               
FRotator sex = ToRotator(start, targetAimPos); 
 
return orig_shoot_event(thiz, targetAimPos, sex, weapon, unk1); 
         
		}
         
        } 
    } 
    } 
    return orig_shoot_event(thiz, start, rot, weapon, unk1); 
     
 }
}
return orig_shoot_event(thiz, start, rot, weapon, unk1); 
     
}
//载具读取//

const char *GetVehicleName(ASTExtraVehicleBase *Vehicle) {
    switch (Vehicle->VehicleShapeType) {
        case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_Unknown:
            return "Unknown";
            break;
        case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_Motorbike:
        case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_Motorbike_SideCart:
            return "Motorbike";
            break;
        case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_Dacia:
        case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_HeavyDacia:
            return "Dacia";
            break;
        case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_MiniBus:
            return "Mini Bus";
            break;
        case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_PickUp:
        case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_PickUp01:
        case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_HeavyPickup:
            return "Pick Up";
            break;
        case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_Buggy:
        case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_HeavyBuggy:
            return "Buggy";
            break;
        case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_UAZ:
        case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_UAZ01:
        case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_UAZ02:
        case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_UAZ03:
        case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_HeavyUAZ:
            return "UAZ";
            break;
        case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_PG117:
            return "PG117";
            break;
        case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_Aquarail:
            return "Aquarail";
            break;
        case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_Mirado:
        case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_Mirado01:
            return "Mirado";
            break;
        case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_Rony:
            return "Rony";
            break;
        case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_Scooter:
            return "Scooter";
            break;
        case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_SnowMobile:
            return "Snow Mobile";
            break;
        case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_TukTukTuk:
            return "Tuk Tuk";
            break;
        case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_SnowBike:
            return "Snow Bike";
            break;
        case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_Surfboard:
            return "Surf Board";
            break;
        case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_Snowboard:
            return "Snow Board";
            break;
        case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_UH60:
            return "UH60";
            break;
        case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_Amphibious:
            return "Amphibious";
            break;
        case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_LadaNiva:
            return "Lada Niva";
            break;
        case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_UAV:
            return "UAV";
            break;
        case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_LootTruck:
            return "Loot Truck";
            break;
        case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_ATGMotorCycle:
            return "ATG Motor Cycle";
            break;
        case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_ModelY:
            return "Model Y";
            break;
        case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_ATV:
            return "ATV";
            break;
        case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_SciFi:
            return "SciFi";
            break;
        case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_LionDance:
            return "Lion Dance";
            break;
        case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_MegaDrop:
            return "Mega Drop";
            break;
        case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_Lamborghini:
        case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_Lamborghini01:
            return "Lamborghini";
            break;
        case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_GoldMirado:
            return "Gold Mirado";
            break;
        case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_BigFoot:
            return "Big Foot";
            break;
        case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_HeavyUH60:
            return "Heavy UH60";
            break;
        case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_TrackVehicle:
            return "Track Vehicle";
            break;
        case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_Motorglider:
            return "Motor glider";
            break;
        case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_CoupeRB:
            return "Coupe RB";
            break;
        case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_CatapultMachine:
            return "Catapult Machine";
            break;
        case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_MediumTank:
            return "Medium Tank";
            break;
        case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_WingMan:
            return "Wing Man";
            break;
        case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_Bike:
            return "Bike";
            break;
        case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_UTV:
            return "UTV";
            break;
        case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_Bike_WithRack:
            return "Bike with Rack";
            break;
        case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_LightTank:
            return "Light Tank";
            break;
        case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_HeavyTank:
            return "Heavy Tank";
            break;
        case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_RaptorDinosaur:
            return "Raptor Dinosaur";
            break;
        case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_Pterosaur:
            return "Pterosaur";
            break;
        case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_TyrannosaurusRex:
            return "Tyrannosaurus Rex";
            break;
        case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_RubberDuck:
            return "Rubber Duck";
            break;
        case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_CapsuleVehicle:
            return "Capsule Vehicle";
            break;
        case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_PreparedVeh1:
            return "Prepared Vehicle 1";
            break;
        case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_PreparedVeh2:
            return "Prepared Vehicle 2";
            break;
        default:
            return "Vehicle";
            break;
    }
    return "Vehicle";
}


/*void (*orig_Broadcast)(ASTExtraPlayerController* thiz, struct FFatalDamageParameter* FatalDamageParameter);
void hk_Broadcast(ASTExtraPlayerController* thiz, struct FFatalDamageParameter* FatalDamageParameter){

auto localController = g_PlayerController;

//自己定义这个条件
if (g_Skins.枪械美化){
if (localController->PlayerKey == FatalDamageParameter->CauserKey){

if(preferences.Outfit){
FatalDamageParameter->CauserClothAvatarID = new_Skin.XSuits;
}

auto CurrentWeaponReplicated = g_LocalPlayer->WeaponManagerComponent->CurrentWeaponReplicated;
if (CurrentWeaponReplicated){
auto g_WeaponID = g_LocalPlayer->WeaponManagerComponent->CurrentWeaponReplicated->GetWeaponID();

//以此类推添加你的枪械
if (g_WeaponID == 1011022) {//手持判断
FatalDamageParameter -> CauserWeaponAvatarID = new_Skin.M416_1;
}



}}}

  return orig_Broadcast(thiz, FatalDamageParameter);
}
*/
void RenderESP(AHUD *HUD, int ScreenWidth, int ScreenHeight) {
/*ASTExtraPlayerCharacter *localPlayer = 0;
        ASTExtraPlayerController *localPlayerController = 0;*/
/*if(SDKF){
    USceneComponent *SceneComponent = 0;//SDK封号检测
        ASTExtraShootWeapon *STExtraShootWeapon = 0;//SDK封号检测
        UPlayerAntiCheatManager *PlayerAntiCheatManager = 0;
        UCheatManager *CheatManager = 0;
        AGameNetworkManager *GameNetworkManager = 0;
        FVerifySwitch *VerifySwitch = 0;
        FAntiCheatDetailData *AntiCheatDetailData = 0;
        UWeaponAntiCheatComp *WeaponAntiCheatComp = 0;
        FDistanceContinueHitCheck *DistanceContinueHitCheck = 0;
        FClientTimeSpeedCheck *ClientTimeSpeedCheck = 0;
        FRealtimeMoveSpeedCheck *RealtimeMoveSpeedCheck = 0;
        FShovelAntiCheat *ShovelAntiCheat = 0;
        UAntiCheatUtils *AntiCheatUtils = 0;
        UDefaultAntiCheatComponent *DefaultAntiCheatComponent = 0;
        UGMCheatManager *GMCheatManager = 0;
        USTBuildSystemComponent *STBuildSystemComponent = 0;
        UVACTask_FlyingVehicle *VACTask_FlyingVehicle = 0;
        UVACTask_FlyingVehicleVelocity *VACTask_FlyingVehicleVelocity = 0;
        UVACTask_FlyingVehicleVelocityChange *VACTask_FlyingVehicleVelocityChange = 0;
        UVACTask_SuperSpeed *VACTask_SuperSpeed = 0;
        UVACTask_SuperSpeedAllDir *VACTask_SuperSpeedAllDir = 0;
        UVACTask_AccelerationControl *VACTask_AccelerationControl = 0;
        UVACTask_ClientAbsSpeed *VACTask_ClientAbsSpeed = 0;
        UActorComponent *ActorComponent = 0;
        UAssetUserData *AssetUserData = 0;
}*/
    //updateSkin();
        ASTExtraPlayerCharacter *localPlayer = 0;
        ASTExtraPlayerController *localPlayerController = 0;
        glWidth = ScreenWidth;
        glHeight = ScreenHeight;

	//加载画布
        UCanvas *Canvas = HUD->Canvas;
        if (Canvas) {

            static bool loadFont = false;
        if (!loadFont) {
            LoadFont();
            loadFont = true;
        }
        
            if (!robotoFont || !tslFont || !robotoTinyFont)
                return;
            tslFont->LegacyFontSize = 35;
std::wstring name = L"IOS Mini Max";
            DrawTextcan(HUD, FString(name), {(float) screenWidth/2, 80}, COLOR_WHITE, COLOR_BLACK);
/*滚动文字动画(ImDrawList, "IOS FIRST[注意游戏-禁止乱杀]", 0, 20, 3.0f, ImColor(255, 0, 0)); // 滚动文字，速度为2.0f，颜色为红色*/
            UGameplayStatics *gGameplayStatics = (UGameplayStatics *) UGameplayStatics::StaticClass();
auto Actors = getActors();

    auto GWorlld = GetFullWorld();
           // UGameplayStatics *gGameplayStatics = (UGameplayStatics *) UGameplayStatics::StaticClass();
    if (GWorlld)
    {

for (int i = 0; i < Actors.size(); i++)
                {
                    auto Actor = Actors[i];
                    if (isObjectInvalid(Actor))
                        continue;
std::wstring name = L"BOT";
            DrawTextcan(HUD, FString(name), {(float) screenWidth/2, 180}, COLOR_WHITE, COLOR_BLACK);
     std::string classname = Actor->GetName();
               if (classname.find("AirAttackBomb_C") != std::string::npos || classname.find("AirAttackBomb_Livik_C") != std::string::npos) {
                FVector2D LootPos;
       FVector PosV = Actor->K2_GetActorLocation();
       float Distance = Actor->GetDistanceTo(localPlayer) / 100.f;
       std::wstring tmp = L"!! [警报]空袭 !!";
      DrawText(HUD, FString(tmp), {(float) screenWidth / 2, 150},
                                         COLOR_RED, true);
                                    if (gGameplayStatics->ProjectWorldToScreen(
                                            localPlayerController,
                                            Actor->RootComponent->RelativeLocation,
                                            false, &LootPos)) {
                                        std::string s = "炸弹";
                                       s += " (";
                                       s += std::to_string((int) Distance);
                                       s += "m)";
   //    DrawBorderString(font3, 20, s.c_str(), LootPos.X, LootPos.Y, ImColor(255, 255, 0), true);
     //     RenderCircle3D(FVector(PosV.X, PosV.Y, PosV.Z - 100), 50.f, 600.f, ImColor(255, 255, 255));
       ///draw->AddImage(Rocket.textureID, ImVec2(LootPos.X - 20, LootPos.Y - 25), ImVec2(LootPos.X + 20, LootPos.Y - 5));
        }
    }
}
}
            auto GWorld = GetFullWorld();
            if (GWorld) {
                UNetDriver *NetDriver = GWorld->NetDriver;
                if (NetDriver) {
                    UNetConnection *ServerConnection = NetDriver->ServerConnection;
                    if (ServerConnection) {
                        localPlayerController = (ASTExtraPlayerController *) ServerConnection->PlayerController;
                    }
                }
            
    if (thongtin)
    {
       
        std::vector < ASTExtraGameStateBase * >ingame;
        std::vector < UGameLevelManagerComponent * >cheat;
        GetAllActors(ingame);
        for (auto actor = ingame.begin();
             actor != ingame.end(); actor++)
        {
            

            auto ingame = *actor;
            auto game = *actor;
            auto cheat = *actor;
            std::string s;
            std::wstring p;

            s += "\n Triangle ";
            s += "\n 对局信息 ";
            s += "\n 当前队伍: ";
            s += std::to_string((int) ingame->PlayerNumPerTeam);
            s += "\n 剩余队伍: ";
            s += std::to_string(ingame->AliveTeamNum);
            s += "\n 剩余玩家: ";
            s += std::to_string(game->AlivePlayerNum);
            s += "\n 真人数量: ";
            s += std::to_string(game->PlayerNum);
            s += "\n 队伍总数: ";
s += std::to_string(game->PlayerNumPerTeam);
s += "\n 时间  : ";
//            s += std::to_string((int) game->ElapsedTime);
//            s += "s | ";
            s += std::to_string((int) game->ElapsedTime / 60);
            s += " 分钟";
            tslFont->LegacyFontSize = 15;
            DrawText(HUD, FString(s),
                             FVector2D(screenWidth / 2 - 650,
                                       screenHeight / 2),
                             COLOR_WHITE, true);
            tslFont->LegacyFontSize = 15;
            
        } ingame.clear();
        
    }
    
                if (localPlayerController) {
                    localPlayerController->AntiCheatManagerComp = 0;
                    localPlayerController->bShouldReportAntiCheat = false;
                    localPlayerController->CheatClass =0;
                    localPlayerController->CheatManager =0;

                    
                    std::vector<ASTExtraPlayerCharacter *> PlayerCharacter;
                    GetAllActors(PlayerCharacter);
                    for (auto actor = PlayerCharacter.begin();
                         actor != PlayerCharacter.end(); actor++) {
                        auto Actor = *actor;

                        if (Actor->PlayerKey ==
                            ((ASTExtraPlayerController *) localPlayerController)->PlayerKey) {
                            localPlayer = Actor;
                            break;
                        }
                    }

                    {
                        if (localPlayer) {
                         if (WideView) {
                auto ThirdPersonCameraComponent = localPlayer->ThirdPersonCameraComponent;
                if (ThirdPersonCameraComponent) {
                    *(float *) ((uintptr_t) &ThirdPersonCameraComponent->OrthoWidth - sizeof(float)) = WideValue;
                }
            }
                         auto WeaponManagerComponent = localPlayer->WeaponManagerComponent;
                        if (preferences.Config.SilentAim.AimBot) {
                                ASTExtraPlayerCharacter *Target = GetTargetByCrossDist();
                                
                                                                  
    if (Target) {
        bool triggerOk = false;
            if (AimF == 1) {
                triggerOk = g_LocalPlayer->bIsWeaponFiring;
            } else if (AimF == 2) {
                triggerOk = g_LocalPlayer->bIsGunADS;
            } else if (AimF == 3) {
                triggerOk = g_LocalPlayer->bIsWeaponFiring || g_LocalPlayer->bIsGunADS;
            }
	       if (triggerOk)
						{
     FVector targetAimPos;                                        if (Aim == 1) {
                                            targetAimPos = Target->GetBonePos("Head", {});
}else if (Aim == 2) {
                                            targetAimPos = Target->GetBonePos("pelvis", {});
                                        }else if (Aim == 4){
			 targetAimPos = Target->GetBonePos("neck_01", {});
         
		}
							targetAimPos.Z -= 1.0f;
							auto WeaponManagerComponent = localPlayer->WeaponManagerComponent;
							if (WeaponManagerComponent)
							{
								auto propSlot = WeaponManagerComponent->GetCurrentUsingPropSlot();
								if ((int)propSlot.GetValue() >= 1 && (int)propSlot.GetValue() <= 3)
								{
									auto CurrentWeaponReplicated = (ASTExtraShootWeapon *)WeaponManagerComponent->CurrentWeaponReplicated;
									if (CurrentWeaponReplicated)
									{
										auto ShootWeaponComponent = CurrentWeaponReplicated->ShootWeaponComponent;
										if (ShootWeaponComponent)
										{
											UShootWeaponEntity *ShootWeaponEntityComponent = ShootWeaponComponent->ShootWeaponEntityComponent;
											if (ShootWeaponEntityComponent)
											{
												ASTExtraVehicleBase *CurrentVehicle = Target->CurrentVehicle;
												if (CurrentVehicle)
												{
													FVector LinearVelocity = CurrentVehicle->ReplicatedMovement.LinearVelocity;
													float dist = localPlayer->GetDistanceTo(Target);
													auto timeToTravel = dist / ShootWeaponEntityComponent->BulletFireSpeed;
													targetAimPos = UKismetMathLibrary::Add_VectorVector(targetAimPos, UKismetMathLibrary::Multiply_VectorFloat(LinearVelocity, timeToTravel));
												}
												else
												{
													FVector Velocity = Target->GetVelocity();
													float dist = localPlayer->GetDistanceTo(Target);
													auto timeToTravel = dist / ShootWeaponEntityComponent->BulletFireSpeed;
													targetAimPos = UKismetMathLibrary::Add_VectorVector(targetAimPos, UKismetMathLibrary::Multiply_VectorFloat(Velocity, timeToTravel));
												}
												                                                if (localPlayer->bIsWeaponFiring) {
                            float dist = localPlayer->GetDistanceTo(Target) / 100.f;  
                            targetAimPos.Z -= dist * Aimsmooth;        
                            }
                                                FVector fDir = UKismetMathLibrary::Subtract_VectorVector(targetAimPos, g_PlayerController->PlayerCameraManager->CameraCache.POV.Location);
                FRotator Yaptr = UKismetMathLibrary::Conv_VectorToRotator(fDir);
   
                FRotator CpYaT = g_PlayerController->PlayerCameraManager->CameraCache.POV.Rotation;
         
                                           
           
                                            Yaptr.Pitch -= CpYaT.Pitch;
                                            Yaptr.Yaw -= CpYaT.Yaw;
                                            Yaptr.Roll = 0.f;
                                            NekoHook(Yaptr);

                                            CpYaT.Pitch += Yaptr.Pitch / Xs; // Aim X Speed Make Float : Xs
                                            CpYaT.Yaw += Yaptr.Yaw / Ys; // Aim Y Speed Make Float : Ys
                                            CpYaT.Roll = 0.f;

            g_PlayerController->SetControlRotation(CpYaT,"");
												//g_PlayerController->SetControlRotation(ToRotator(g_PlayerController->PlayerCameraManager->CameraCache.POV.Location, targetAimPos),""); 											
										      }
                                 }                                            
                             }
                         }           }
                                
}}}
                            

if (preferences.Config.SilentAim.Enable) {
                    auto WeaponManagerComponent = localPlayer->WeaponManagerComponent;
                    if (WeaponManagerComponent) {
                        auto propSlot = WeaponManagerComponent->GetCurrentUsingPropSlot();
                        if ((int) propSlot.GetValue() >= 1 && (int) propSlot.GetValue() <= 3) {
                            auto CurrentWeaponReplicated = (ASTExtraShootWeapon *) WeaponManagerComponent->CurrentWeaponReplicated;
                            if (CurrentWeaponReplicated) {
                                auto ShootWeaponComponent = CurrentWeaponReplicated->ShootWeaponComponent;
                                if (ShootWeaponComponent) {
                                    int shoot_event_idx = 168;
                                    auto VTable = (void **) ShootWeaponComponent->VTable;
                                    if (VTable && (VTable[shoot_event_idx] != shoot_event)) {
                                        orig_shoot_event = decltype(orig_shoot_event)(
                                                VTable[shoot_event_idx]);
                                        VTable[shoot_event_idx] = (void *) shoot_event;
                                    }
                                }
                            }
                        }
                    }
                }

if(打击圈 == 2){
if (preferences.Config.SilentAim.Enable || preferences.Config.SilentAim.AimBot){
ASTExtraPlayerCharacter *Target = GetTargetByCrossDist();
if (Target){
FVector targetAimPos;
FVector HeadPos = GetBoneLocationByName(Target,"Head");
FVector2D HeadPosSC;
ASTExtraPlayerCharacter *Target = GetTargetByCrossDist();
float Distance=localPlayer->GetDistanceTo(Target)/100.f;
if (gGameplayStatics->ProjectWorldToScreen(g_PlayerController,HeadPos,false, &HeadPosSC)) {
if(CL == 1){
DrawCircle(HUD,HeadPosSC.X, HeadPosSC.Y,preferences.Config.SilentAim.Cross,100,COLOR_WHITE);
}
if(CL == 2){
DrawCircle(HUD,HeadPosSC.X, HeadPosSC.Y,preferences.Config.SilentAim.Cross,100,红色);
}                                    
if(CL == 3){
DrawCircle(HUD,HeadPosSC.X, HeadPosSC.Y,preferences.Config.SilentAim.Cross,100,黄色);
}
if(CL == 4){
DrawCircle(HUD,HeadPosSC.X, HeadPosSC.Y,preferences.Config.SilentAim.Cross,100,绿色);
}    
if(CL == 5){
DrawCircle(HUD,HeadPosSC.X, HeadPosSC.Y,preferences.Config.SilentAim.Cross,100,黑色);
}
if(CL == 6){
DrawCircle(HUD,HeadPosSC.X, HeadPosSC.Y,preferences.Config.SilentAim.Cross,100,蓝色);
}                                    
if(CL == 7){
DrawCircle(HUD,HeadPosSC.X, HeadPosSC.Y,preferences.Config.SilentAim.Cross,100,橙色);
}
  


}

}
}
} 
if(打击圈 == 1){
if (preferences.Config.SilentAim.Enable || preferences.Config.SilentAim.AimBot){

            //打击部位
ASTExtraPlayerCharacter *Target = GetTargetByCrossDist();
     if (Target)
     {

         //   DrawCircle(HUD, points.at(0).X, points.at(0).Y, 6, 100, COLOR_LIME);
  long PlayerAimLineColor = (1.f, 1.f, 0, 1.f);
         FVector Head = Target->GetBonePos("Head", {});
                        FVector2D HeadPosSC;
                        if (W2S(Head, (FVector2D *)&HeadPosSC)) {
                     
          FVector2D ScreenCenter = FVector2D(screenWidth / 2, screenHeight / 2);
          FVector2D HeadPos = FVector2D(HeadPosSC.X, HeadPosSC.Y);
          
          // 计算两点之间的欧几里得距离
          float radius = FVector2D::Distance(ScreenCenter, HeadPos);
if(CL == 1){
DrawCircle(HUD, ScreenWidth / 2, ScreenHeight / 2, radius, 300, 白色);
}
if(CL == 2){
DrawCircle(HUD, ScreenWidth / 2, ScreenHeight / 2, radius, 300, 红色);
}                                    
if(CL == 3){
DrawCircle(HUD, ScreenWidth / 2, ScreenHeight / 2, radius, 300, 黄色);
}
if(CL == 4){
DrawCircle(HUD, ScreenWidth / 2, ScreenHeight / 2, radius, 300, 绿色);
}    
if(CL == 5){
DrawCircle(HUD, ScreenWidth / 2, ScreenHeight / 2, radius, 300, 黑色);
}
if(CL == 6){
DrawCircle(HUD, ScreenWidth / 2, ScreenHeight / 2, radius, 300, 蓝色);
}                                    
if(CL == 7){
DrawCircle(HUD, ScreenWidth / 2, ScreenHeight / 2, radius, 300, 橙色);
}
      
      
      
      }
      
      
      
      
      


}

}
}                    
if(打击圈 == 0){               
if (preferences.Config.SilentAim.Enable || preferences.Config.SilentAim.AimBot){
if(CL == 1){
DrawCircle(HUD, ScreenWidth/2, ScreenHeight/2, preferences.Config.SilentAim.Cross, 100, COLOR_WHITE);
}
if(CL == 2){
DrawCircle(HUD, ScreenWidth/2, ScreenHeight/2, preferences.Config.SilentAim.Cross, 100, 红色);
}                                    
if(CL == 3){
DrawCircle(HUD, ScreenWidth/2, ScreenHeight/2, preferences.Config.SilentAim.Cross, 100, 黄色);
}
if(CL == 4){
DrawCircle(HUD, ScreenWidth/2, ScreenHeight/2, preferences.Config.SilentAim.Cross, 100, 绿色);
}    
if(CL == 5){
DrawCircle(HUD, ScreenWidth/2, ScreenHeight/2, preferences.Config.SilentAim.Cross, 100, 黑色);
}
if(CL == 6){
DrawCircle(HUD, ScreenWidth/2, ScreenHeight/2, preferences.Config.SilentAim.Cross, 100, 蓝色);
}                                    
if(CL == 7){
DrawCircle(HUD, ScreenWidth/2, ScreenHeight/2, preferences.Config.SilentAim.Cross, 100, 橙色);
}
                
                    }}
//动态自瞄圈
               /*if (打击圈 == 1) {
               if (preferences.Config.SilentAim.AimBot) {
        if (g_LocalPlayer->bIsWeaponFiring) {
        preferences.Config.SilentAim.Cross -= 17.8f;  //--FOV decreasing speed
        if (preferences.Config.SilentAim.Cross < 199.0f){
        preferences.Config.SilentAim.Cross = 200.0f;  //--Minimum FOV size
        }}else{
        preferences.Config.SilentAim.Cross += 18.5f;  //--FOV Regain Speed
        if (preferences.Config.SilentAim.Cross > 401.0f){
        preferences.Config.SilentAim.Cross = 400.0f;  //--Maximum FOV size
        }}}
//动态追踪圈
  if (preferences.Config.SilentAim.Enable) {
        if (g_LocalPlayer->bIsWeaponFiring) { 
        preferences.Config.SilentAim.Cross -= 17.8f;   //--FOV decreasing speed
        if (preferences.Config.SilentAim.Cross < 199.0f){
        preferences.Config.SilentAim.Cross = 200.0f;   //--Minimum FOV size
        }}else{
        preferences.Config.SilentAim.Cross += 18.5f;   //--FOV Regain Speed
        if (preferences.Config.SilentAim.Cross > 401.0f){
        preferences.Config.SilentAim.Cross = 400.0f;   //--Maximum FOV size
        }}}
}
*/








                      
if (自动开火) {
if ((g_LocalPlayer && g_LocalPlayer->RootComponent) &&
localPlayerController) {
ASTExtraPlayerCharacter *Target;
Target = GetTargetByCrossDist();
auto WeaponManagerComponent = g_LocalPlayer->WeaponManagerComponent;
if (WeaponManagerComponent) {
auto propSlot = WeaponManagerComponent->GetCurrentUsingPropSlot();
if ((int) propSlot.GetValue() >= 1 &&
(int) propSlot.GetValue() <= 3) {
auto CurrentWeaponReplicated = (ASTExtraShootWeapon *) WeaponManagerComponent->CurrentWeaponReplicated;
if (CurrentWeaponReplicated) {
auto ShootWeaponComponent = CurrentWeaponReplicated->ShootWeaponComponent;
if (ShootWeaponComponent) {
if (Target && Target->RootComponent) {
g_PlayerController->OnPressFire();
} else {
g_PlayerController->OnReleaseFire();
}
}
}
}
}
}
}
if(feiche){
    if (localPlayer->CurrentVehicle) {
                            auto CurrentVehicle = localPlayer->CurrentVehicle;
                            
                            if (FuckValue < 1) {
                                FuckValue = 1;
                            }
                            
                            float coeff = 1;
                            coeff *= FuckValue;
                            
                            auto CurrentVehicle2 = static_cast<ASTExtraWheeledVehicle*>(CurrentVehicle);
                            //FReplicatedVehicleState ReplicatedVehicleState = CurrentVehicle2->STReplicatedState;
                            
                         
                            
                            auto RootComponent = static_cast<UPrimitiveComponent*>(CurrentVehicle->K2_GetRootComponent());
                            
                            
                            if (RootComponent) {
        
                                if (localPlayer->CurrentVehicle->GetMoveForwardRate() > 0) {
                                    FVector vel;
                                    auto yaw = g_PlayerController->PlayerCameraManager->CameraCache.POV.Rotation.Yaw;
                                    float theta = 2.f * M_PI * (yaw / 360.f);
                                    
                                    vel.X = (coeff * cosf(theta));
                                    vel.Y = (coeff * sinf(theta));
                                    
                                    RootComponent->SetAllPhysicsLinearVelocity(vel, true);
                                }else if (localPlayer->CurrentVehicle->GetMoveForwardRate() < 0) {
                                    FVector vel;
                                    auto yaw = g_PlayerController->PlayerCameraManager->CameraCache.POV.Rotation.Yaw;
                                    float theta = 2.f * M_PI * ((yaw + 180) / 360.f);
                                    
                                    vel.X = (coeff * cosf(theta));
                                    vel.Y = (coeff * sinf(theta));
                                    
                                    RootComponent->SetAllPhysicsLinearVelocity(vel, true);
                                }
                                if (localPlayer->CurrentVehicle->GetMoveRightRate() > 0) {
                                    FVector vel;
                                    auto yaw = g_PlayerController->PlayerCameraManager->CameraCache.POV.Rotation.Yaw;
                                    float theta = 2.f * M_PI * ((yaw + 90) / 360.f);
                                    
                                    vel.X = (coeff * cosf(theta));
                                    vel.Y = (coeff * sinf(theta));
                                    
                                    RootComponent->SetAllPhysicsLinearVelocity(vel, true);
                                } else if (localPlayer->CurrentVehicle->GetMoveRightRate() < 0) {
                                    FVector vel;
                                    auto yaw = g_PlayerController->PlayerCameraManager->CameraCache.POV.Rotation.Yaw;
                                    float theta = 2.f * M_PI * ((yaw - 90) / 360.f);
                                    
                                    vel.X = (coeff * cosf(theta));
                                    vel.Y = (coeff * sinf(theta));
                                    
                                    RootComponent->SetAllPhysicsLinearVelocity(vel, true);
                                }else if(localPlayer->CurrentVehicle->GetMoveRightRate() == 0 && localPlayer->CurrentVehicle->GetMoveForwardRate() == 0){
                                    FVector vel =  {0,0,0};
                                   
                                ;

                                    RootComponent->SetAllPhysicsLinearVelocity(vel, false);
                                }
                                
                                //这里实现载具穿墙无视掩体
                                
                                UPrimitiveComponent* VehicleMeshComponent = localPlayer->CurrentVehicle->GetMesh(); // 获取载具的网格组件
                                   if (VehicleMeshComponent)
                                   {
                                       VehicleMeshComponent->SetCollisionObjectType(ECollisionChannel::ECC_WorldDynamic); // 设置为动态世界对象
                                       VehicleMeshComponent->SetCollisionResponseToAllChannels(ECollisionResponse::ECR_Ignore); // 忽略所有通道的碰撞
                                   }
                                
                                if (FlyFuck) {
                                    ASTExtraPlayerCharacter *Target = GetTargetByCrossDist();
                                    if (Target) {
                                        FVector targetAimPos = Target->GetBonePos("Head", {});
                                        auto aimRotation = ToRotator(g_PlayerController->PlayerCameraManager->CameraCache.POV.Location, targetAimPos);
                                        FVector vel;

                                        auto yaw = aimRotation.Yaw;
                                        float theta = 2.f * M_PI * (yaw / 360.f);

                                        vel.X = (coeff * cosf(theta));
                                        vel.Y = (coeff * sinf(theta));

                                        RootComponent->SetAllPhysicsLinearVelocity(vel, YES);
                                    }
                                }
                           }
                                
                                if(HighCar){
                                    FVector NewLocation = RootComponent->K2_GetComponentLocation();
                                    //NewLocation.Z += DeltaHeight;
                                    RootComponent->K2_SetWorldLocation(NewLocation, 0, true, nullptr);
                                    RootComponent->K2_SetRelativeLocation(RootComponent->RelativeLocation + FVector(0.f, 0.f, NewLocation.Z), 0, true, nullptr);
                                    
                                }
                                
                                if(FlyCar){
                                    
                                    UCharacterMovementComponent* CharacterMovement = g_LocalPlayer->CharacterMovement;
                                    UPrimitiveComponent* VehicleMeshComponent = localPlayer->CurrentVehicle->GetMesh();
                                    
                                    localPlayer->CurrentVehicle->SetActorEnableCollision(false);
                                    
                                    // 禁用载具的重力
                                    RootComponent->SetEnableGravity(false);
                                    
                                    
                                    RootComponent->SetLinearDamping(0.0f); // 线性阻尼设置为0，表示没有阻力
                                    RootComponent->SetAngularDamping(0.0f); // 角阻尼设置为0，表示没有旋转阻力
                                    
                                    
                                    // 获取玩家的视角方向
                                    //struct FVector* ViewLocation;
                                    //这里从玩家控制器进入
                                     FRotator ViewRotation = localPlayerController->GetControlRotation();
                                    //FVector VelocityToSet;
                                    
                                    //这里修正载具朝向
                                    RootComponent->K2_SetRelativeRotation(ViewRotation,false,true,NULL);
                                    localPlayer->CurrentVehicle->K2_SetActorRotation(ViewRotation,true);
                                    //USTExtraBlueprintFunctionLibrary::GetPlayerViewPoint(localPlayerController, ViewLocation, ViewRotation);
                                    
                                        // 将视角方向转换为方向向量
                                        FVector ViewDirection = FRotatorToVector(ViewRotation);
                                        // 将视角方向向量转换为单位向量
                                        float Length = ViewDirection.Size(); // 获取向量的大小
                                        if (Length > 0)
                                        {
                                            ViewDirection /= Length; // 归一化向量
                                        }
                                        
                                        // 根据玩家视角方向设置载具的物理线性速度
                                        // 其中 BoostSpeed 是你希望载具加速时的速度
                                        FVector VelocityToSet = ViewDirection * ZAxisSpeed;
                                    
                                    //这里调用游戏内加速开关
                                    if(localPlayer->CurrentVehicle->bIsBoosting){
                                        
                                        RootComponent->SetEnableGravity(false);
                                        // 设置线性阻尼和角阻尼，减少载具因碰撞或其他外力影响而减速
                                        RootComponent->SetLinearDamping(0.0f); // 线性阻尼设置为0，表示没有阻力
                                        RootComponent->SetAngularDamping(0.0f); // 角阻尼设置为0，表示没有旋转阻力
                                       
                                        CharacterMovement->bCheatFlying = true;
                                        // 设置载具沿Z轴的移动速度
                                        // 其中 ZAxisSpeed 是你希望载具沿Z轴移动的速度
                                        //FVector vel(0.0f, 0.0f, ZAxisSpeed);
                                        // 设置载具的物理线性速度，bPreserveSign 为 true 表示保留速度的方向
                                        RootComponent->SetAllPhysicsLinearVelocity(VelocityToSet, true);
                                        
                                    
   
                                    }else{
                                        CharacterMovement->bCheatFlying = false;
                                    }
                                }
                           }
                           }
if(OI){

g_LocalPlayer->ProneHalfHeight=35;
}
if (agha3) {
USceneComponent * MeshContainer = localPlayer->MeshContainer;
UCustomSpringArmComponent * SpringArmComp = localPlayer->SpringArmComp;
MeshContainer->RelativeLocation.X = 113;
SpringArmComp->RelativeLocation.X = 133;
} else {
USceneComponent * MeshContainer = localPlayer->MeshContainer;
UCustomSpringArmComponent * SpringArmComp = localPlayer->SpringArmComp;
MeshContainer->RelativeLocation.X = 0;
SpringArmComp->RelativeLocation.X = 0;
}
if (路飞) {
							if (localPlayer->IsClientPeeking){
							USceneComponent * MeshContainer = localPlayer->MeshContainer;
							UCustomSpringArmComponent * SpringArmComp = localPlayer->SpringArmComp;
							MeshContainer->RelativeLocation.X = 113;
							SpringArmComp->RelativeLocation.X = 133;
							} else {
							USceneComponent * MeshContainer = localPlayer->MeshContainer;
							UCustomSpringArmComponent * SpringArmComp = localPlayer->SpringArmComp;
							MeshContainer->RelativeLocation.X = 0;
							SpringArmComp->RelativeLocation.X = 0;
							}
							}  
if(v加速){
							g_LocalPlayer->EnergySpeedScale = Qo;
							
							                        
}
if(大厅){
localPlayer->CharacterMovement->MovementMode = EMovementMode::MOVE_None;
                        }



   if (Tp) {

   localPlayer->CharacterMovement->MinTimeBetweenTimeStampResets = 0.f;

        USceneComponent *MeshContainer = localPlayer->MeshContainer;

       
            // 右探头逻辑
            FVector CurrentLocation = g_LocalPlayer->STPlayerController->AcknowledgedPawn->K2_GetActorLocation();

            // 判断是否处于探头状态
            if (g_LocalPlayer->MoveForwardInputValue>0) {
                // 获取玩家相机的旋转角度
                FRotator CameraRotation = g_LocalPlayer->STPlayerController->GetControlRotation();
                
                // 计算相机的前方向向量
                float CameraForwardX = cosf(CameraRotation.Yaw * (M_PI / 180.0f)) * cosf(CameraRotation.Pitch * (M_PI / 180.0f));
                float CameraForwardY = sinf(CameraRotation.Yaw * (M_PI / 180.0f)) * cosf(CameraRotation.Pitch * (M_PI / 180.0f));
                float CameraForwardZ = sinf(CameraRotation.Pitch * (M_PI / 180.0f));
                FVector CameraForward(CameraForwardX, CameraForwardY, CameraForwardZ);
                
                // 计算相机的右方向向量
                float CameraRightX = sinf((CameraRotation.Yaw + 90.0f) * (M_PI / 180.0f)) * cosf(CameraRotation.Pitch * (M_PI / 180.0f));
                float CameraRightY = cosf((CameraRotation.Yaw + 90.0f) * (M_PI / 180.0f)) * cosf(CameraRotation.Pitch * (M_PI / 180.0f));
                FVector CameraRight(CameraRightX, CameraRightY, 0.0f);
                
                // 计算相机的上方向向量
                float CameraUpZ = cosf(CameraRotation.Pitch * (M_PI / 180.0f));
                FVector CameraUp(0.0f, 0.0f, CameraUpZ);
                
                // 根据相机视角方向调整坐标
                // 向上调整
                CurrentLocation += CameraUp * 8;
                // 向下调整
                CurrentLocation -= CameraUp * 8;
                // 向前调整
                CurrentLocation += CameraForward * 8;
                
                // 设置新的位置
                bool bSweep = false;
                bool bTeleport = false;
                FHitResult SweepHitResult;
                g_LocalPlayer->STPlayerController->AcknowledgedPawn->K2_SetActorLocation(CurrentLocation, bSweep, bTeleport, &SweepHitResult);
            }

if (MeshContainer)
{
    // 获取当前Pawn的
    FVector CurrentLocation = g_LocalPlayer->STPlayerController->AcknowledgedPawn->K2_GetActorLocation();

    if (localPlayer->IsClientPeeking) // 判断是否处于探头状态
    {
        if (!localPlayer->IsPeekLeft) // 右探头：Z轴上升
        {
            CurrentLocation.Z += 16; // Z轴上升30单位
        }
        else // 左探头：Z轴下降
        {
            CurrentLocation.Z -= 16; // Z轴下降30单位
        }

        // 设置新的位置
        bool bSweep = false;
        bool bTeleport = false;
        FHitResult SweepHitResult;
        g_LocalPlayer->STPlayerController->AcknowledgedPawn->K2_SetActorLocation(CurrentLocation, bSweep, bTeleport, &SweepHitResult);
    }

    }

        }

if (人物变大) {
USceneComponent* MeshContainer = g_LocalPlayer->MeshContainer;
MeshContainer->SetWorldScale3D({巨人, 巨人, 巨人});
}
if (加速) {   g_LocalPlayer->STPlayerController->AcknowledgedPawn->CustomTimeDilation = 5.0f;
        }

                                if(!localPlayer->IsUsingGrenade()) {
                                    auto WeaponManagerComponent = localPlayer->WeaponManagerComponent;
                                    if (WeaponManagerComponent) {
                                        auto propSlot = WeaponManagerComponent->GetCurrentUsingPropSlot();
                                        if ((int) propSlot.GetValue() >= 1 &&
                                            (int) propSlot.GetValue() <= 3) {
                                            auto CurrentWeaponReplicated = (ASTExtraShootWeapon *) WeaponManagerComponent->CurrentWeaponReplicated;
                                            if (CurrentWeaponReplicated) {
                                                auto ShootWeaponEntityComp = CurrentWeaponReplicated->ShootWeaponEntityComp;
                                                auto ShootWeaponEffectComp = CurrentWeaponReplicated->ShootWeaponEffectComp;
                                                
                                                
                                                auto ID = CurrentWeaponReplicated->GetWeaponID();
                                                if(ID != 108004 && ID != 108003 && ID != 108002 && ID != 108001 && ID != 108000 && ID != 108005 && ID != 108006 && ID != 108007)
                                                    if (ShootWeaponEntityComp && ShootWeaponEffectComp)
                                                    {
                                                        if(IsCrossHair){
                                                            static float cnt = 0.0f;
                                                            float r = cos(cnt) * .5f + .5f;
                                                            float g = cos(cnt - 2.f * 3.14 / 3.f) * .5f + .5f;
                                                            float b = cos(cnt - 4.f * 3.14 / 3.f) * .5f + .5f;
                                                            if (cnt >= FLT_MAX) {
                                                                cnt = 0.0f;
                                                            } else {
                                                                cnt += 0.01f;
                                                            }
                                                            
                                                            memset(&ShootWeaponEntityComp->DeviationInfo, 0, sizeof(FSDeviation));
                                                            memset(&ShootWeaponEntityComp->RecoilInfo, 0, sizeof(FSRecoilInfo));
                                                            
                                                            ShootWeaponEntityComp->ShotGunCenterPerc = 0.0f;
                                                            ShootWeaponEntityComp->ShotGunVerticalSpread = 0.0f;
                                                            ShootWeaponEntityComp->ShotGunHorizontalSpread = 0.0f;
                                                            ShootWeaponEntityComp->GameDeviationFactor = 0.0f;
                                                            ShootWeaponEntityComp->GameDeviationAccuracy = 0.0f;
                                                            ShootWeaponEntityComp->CrossHairInitialSize = 0.0f;
                                                            ShootWeaponEntityComp->CrossHairBurstSpeed = 0.0f;
                                                            ShootWeaponEntityComp->CrossHairBurstIncreaseSpeed = 0.0f;
                                                            ShootWeaponEntityComp->VehicleWeaponDeviationAngle = 0.0f;
                                                        
                                                        }
if(preferences.Config.SilentAim.HitX){
                                                            ShootWeaponEntityComp->ExtraHitPerformScale = 100;
                                                            ShootWeaponEntityComp->HUDAlphaDecreaseSpeedScale = 1.f;
                                                        }
                                                        if(preferences.Config.SilentAim.ReCo){
                                                            {
                                                                ShootWeaponEntityComp->AccessoriesVRecoilFactor = 0.0f;
                                                                ShootWeaponEntityComp->AccessoriesHRecoilFactor = 0.0f;
                                                                ShootWeaponEntityComp->AccessoriesRecoveryFactor = 0.0f;
                                                            }

                                                        }
                                                        if(preferences.Config.SilentAim.FastShoot){
                                                            ShootWeaponEntityComp->ShootInterval =0.060606f;
                                                        }
if(快速换弹){
ShootWeaponEntityComp->ReloadRate = 0.0f;
}
if(退出观战){
ShootWeaponEntityComp->WeaponAimFOV = 10000000.0f;
ShootWeaponEntityComp->WeaponAimInTime = 10000000.0f;

}
 
if(BigQ){
    auto WeaponManagerComponent = localPlayer->WeaponManagerComponent;
    if (WeaponManagerComponent) {
        auto Slot = WeaponManagerComponent->GetCurrentUsingPropSlot();
        if ((int) Slot.GetValue() >= 1 && (int) Slot.GetValue() <= 3) {
            auto CurrentWeaponReplicated = (ASTExtraShootWeapon *) WeaponManagerComponent->CurrentWeaponReplicated;
            if (CurrentWeaponReplicated) {
                auto ShootWeaponEntityComp = CurrentWeaponReplicated->ShootWeaponEntityComp;
                auto ShootWeaponEffectComp = CurrentWeaponReplicated->ShootWeaponEffectComp;
                if (ShootWeaponEntityComp && ShootWeaponEffectComp) {
if (BigQ) {
    CurrentWeaponReplicated->RootComponent->RelativeScale3D.Y = Gun_Size;
    CurrentWeaponReplicated->RootComponent->RelativeScale3D.Z = Gun_Size;
    CurrentWeaponReplicated->RootComponent->RelativeScale3D.X = Gun_Size;
                      }
                 }
             }
         }
     }
 }
if (疯狗模式)
{
    UCharacterMovementComponent *CharacterMovement = localPlayer->CharacterMovement;
    if (CharacterMovement)
    {
    
        // 速度相关
        CharacterMovement->MaxWalkSpeed = 99999; // 持枪加速
        CharacterMovement->MaxFlySpeed = 999;  // 跳远
        CharacterMovement->MaxAcceleration = 99999; // 最大加速
        CharacterMovement->MaxWalkSpeedCrouched = 99999; // 蹲伏时的最大速度
        CharacterMovement->MaxSwimSpeed = 999; // 游泳速度
g_LocalPlayer->JumpMaxCount = 999999.0f;
localPlayer->CharacterMovement->bMaintainHorizontalGroundVelocity = true;
    }
}
if(高跳){ 
                                    g_LocalPlayer->CharacterMovement->GravityScale = (int) 5.6; 
                                    g_LocalPlayer->CharacterMovement->JumpZVelocity = 3700.f;
}else{
                                    g_LocalPlayer->CharacterMovement->GravityScale = (int) 1.0; 
                                    g_LocalPlayer->CharacterMovement->JumpZVelocity = 443.f; 
                                }
if(无限子弹){

CurrentWeaponReplicated->CurBulletInClip.CurBulletNumInClip
= 9999;
}
if(SHXS){
if (g_LocalPlayer->bIsWeaponFiring) {
CurrentWeaponReplicated->CurBulletInClip.CurBulletNumInClip += 1;
}
}
if(SHxs){
g_PlayerController->GameReplayType=2;
}
if(高伤){
ShootWeaponEntityComp->BulletMomentum = 10000000.0f;
ShootWeaponEntityComp->BulletRange = 10000000.0f;
ShootWeaponEntityComp->BaseImpactDamage = 100000000.0f;
ShootWeaponEntityComp->MaxDamageRate = 100000000.0f;
ShootWeaponEntityComp->BulletTrackDistanceFix = 100000000.0f;

}


if(开火加速){
if (g_LocalPlayer->bIsWeaponFiring) {
//原创频道 @CYMOD8
g_LocalPlayer->STPlayerController->AcknowledgedPawn->CustomTimeDilation = 3.0f;
}else{//@CYMOD8
g_LocalPlayer->STPlayerController->AcknowledgedPawn->CustomTimeDilation = 1.0f;//恢复数值 默认 1.0
//@CYMOD8
}
}
if(开火据点){
if (g_LocalPlayer->bIsWeaponFiring) {
static float cnt = 0.0f;
                                                            float r = cos(cnt) * .5f + .5f;
                                                            float g = cos(cnt - 2.f * 3.14 / 3.f) * .5f + .5f;
                                                            float b = cos(cnt - 4.f * 3.14 / 3.f) * .5f + .5f;
                                                            if (cnt >= FLT_MAX) {
                                                                cnt = 0.0f;
                                                            } else {
                                                                cnt += 0.01f;
                                                            }
                                                            
                                                            memset(&ShootWeaponEntityComp->DeviationInfo, 0, sizeof(FSDeviation));
                                                            memset(&ShootWeaponEntityComp->RecoilInfo, 0, sizeof(FSRecoilInfo));
                                                            
                                                            ShootWeaponEntityComp->ShotGunCenterPerc = 0.0f;
                                                            ShootWeaponEntityComp->ShotGunVerticalSpread = 0.0f;
                                                            ShootWeaponEntityComp->ShotGunHorizontalSpread = 0.0f;
                                                            ShootWeaponEntityComp->GameDeviationFactor = 0.0f;
                                                            ShootWeaponEntityComp->GameDeviationAccuracy = 0.0f;
                                                            ShootWeaponEntityComp->CrossHairInitialSize = 0.0f;
                                                            ShootWeaponEntityComp->CrossHairBurstSpeed = 0.0f;
                                                            ShootWeaponEntityComp->CrossHairBurstIncreaseSpeed = 0.0f;
                                                            ShootWeaponEntityComp->VehicleWeaponDeviationAngle = 0.0f;
 }else{
static float cnt = 0.0f;
                                                            float r = cos(cnt) * .5f + .5f;
                                                            float g = cos(cnt - 2.f * 3.14 / 3.f) * .5f + .5f;
                                                            float b = cos(cnt - 4.f * 3.14 / 3.f) * .5f + .5f;
                                                            if (cnt >= FLT_MAX) {
                                                                cnt = 0.0f;
                                                            } else {
                                                                cnt += 0.01f;
                                                            }
                                                            
                                                            memset(&ShootWeaponEntityComp->DeviationInfo, 0, sizeof(FSDeviation));
                                                            memset(&ShootWeaponEntityComp->RecoilInfo, 0, sizeof(FSRecoilInfo));
                                                            
                                                            ShootWeaponEntityComp->ShotGunCenterPerc = 2.0f;
                                                            ShootWeaponEntityComp->ShotGunVerticalSpread = 2.0f;
                                                            ShootWeaponEntityComp->ShotGunHorizontalSpread = 2.0f;
                                                            ShootWeaponEntityComp->GameDeviationFactor = 2.0f;
                                                            ShootWeaponEntityComp->GameDeviationAccuracy = 2.0f;
                                                            ShootWeaponEntityComp->CrossHairInitialSize = 2.0f;
                                                            ShootWeaponEntityComp->CrossHairBurstSpeed = 2.0f;
                                                            ShootWeaponEntityComp->CrossHairBurstIncreaseSpeed = 2.0f;
                                                            ShootWeaponEntityComp->VehicleWeaponDeviationAngle = 2.0f;
}                                    
}
if(打饮料加速){
auto GWorld = GetFullWorld();
if (localPlayer->Energy.EnergyCurrent >= 65) {
GWorld->PersistentLevel->WorldSettings->MinUndilatedFrameTime = 0.110f;
}else{
GWorld->PersistentLevel->WorldSettings->MinUndilatedFrameTime = 0.000f;
}
}
}
                                            }
                                        }
                                    }
                                }
   
                            int totalEnemies = 0, totalBots = 0;
                            std::vector<ASTExtraPlayerCharacter *> PlayerCharacter;
                            GetAllActors(PlayerCharacter);
                            for (auto actor = PlayerCharacter.begin();
                                 actor != PlayerCharacter.end(); actor++) {
                                auto Player = *actor;

                                if (Player->PlayerKey == localPlayer->PlayerKey)
                                    continue;

                                if (Player->TeamID == localPlayer->TeamID)
                                    continue;

                                if (Player->bDead)
                                    continue;

                                if (Player->bHidden)
                                    continue;

                                //if (!Player->Mesh)
                                //    continue;

                                if (!Player->RootComponent)
                                    continue;

//                                if (Player->Health < 0.0f || Player->Health > 100.0f) { continue; }

                                if (Config.ESPMenu.IgnoreBot) {
                                    if (Player->bEnsure)
                                        continue;
                                }


                                if (Player->bEnsure)
                                    totalBots++;
                                else totalEnemies++;

                                FVector Head = GetBoneLocationByName(Player, "Head");
                                Head.Z += 12.5f;
                                FVector Root = GetBoneLocationByName(Player, "Root");
                                FVector upper_r = GetBoneLocationByName(Player, "upperarm_r");
                                FVector lowerarm_r = GetBoneLocationByName(Player, "lowerarm_r");
                                FVector hand_r = GetBoneLocationByName(Player, "hand_r");
                                FVector upper_l = GetBoneLocationByName(Player, "upperarm_l");
                                FVector lowerarm_l = GetBoneLocationByName(Player, "lowerarm_l");
                                FVector hand_l = GetBoneLocationByName(Player, "hand_l");
                                FVector thigh_l = GetBoneLocationByName(Player, "thigh_l");
                                FVector calf_l = GetBoneLocationByName(Player, "calf_l");
                                FVector foot_l = GetBoneLocationByName(Player, "foot_l");
                                FVector thigh_r = GetBoneLocationByName(Player, "thigh_r");
                                FVector calf_r = GetBoneLocationByName(Player, "calf_r");
                                FVector foot_r = GetBoneLocationByName(Player, "foot_r");
                                FVector neck_01 = GetBoneLocationByName(Player, "neck_01");
                                FVector pelvis = GetBoneLocationByName(Player, "pelvis");

                            //colors
                            bool IsVisible = localPlayerController->LineOfSightTo(Player, {0,0,0}, true);
                            if(IsVisible) {
                                if(Player->bIsAI){
                                    //white color
                                    visCol.R = 1.f;
                                    visCol.G = 1.f;
                                    visCol.B = 1.f;
                                    visCol.A = 1.f;
                                }else if(Player->Health == 0.0f){
                                    //drak green if knock down and visible
                                    visCol.R = 0.0f;
                                    visCol.G = 0.3f;
                                    visCol.B = 0.0f;
                                    visCol.A = 1.0f;
                                }else{
                                    //green
                                    visCol.R = 0.f;
                                    visCol.G = 1.f;
                                    visCol.B = 0.f;
                                    visCol.A = 1.f;
                                }
                            }else if (Player->bIsAI){
                                //gray R G B A
                                //    FLinearColor Gray = { 0.501960814f, 0.501960814f, 0.501960814f, 1.000000000f };
                                visCol.R = 0.435294117f;
                                visCol.G = 0.501960814f;
                                visCol.B = 0.501960814f;
                                visCol.A = 1.000000000f;
                                // if knocked down player color
                            }else if(Player->Health == 0.0f){
                                //drak++ red if knocked down and not visible
                                visCol.R = 0.549019607f;
                                visCol.G = 0.039215686f;
                                visCol.B = 0.050980392f;
                                visCol.A = 1.0f;
                            }else{
                                //red
                                visCol.R = 1.f;
                                visCol.G = 0.f;
                                visCol.B = 0.f;
                                visCol.A = 1.f;
                            }
                            if (Player->IsInvincible)
                            {
                                //yallow
                                visCol.R = 1.f;
                                visCol.G = 1.f;
                                visCol.B = 0.f;
                                visCol.A = 1.f;
                            }

                                float Distance = Player->GetDistanceTo(localPlayer) / 100.f;
                                if (Distance < 500.f) {
//背敌                                

 if(Config.ESPMenu.Alert){
                                bool Useless = false;
                                FVector2D EntityPos = WorldToRadar(localPlayer->K2_GetActorRotation().Yaw, Head, localPlayer->GetHeadLocation(true), NULL, NULL, FVector((float)screenWidth, (float)screenHeight, 0.f), Useless);
                                float radar_range = 270.f;
                                FVector angle;
                                FVector MiddlePoint(((float)screenWidth / 2.f) - EntityPos.X, ((float)screenHeight / 2.f) - EntityPos.Y, 0.f);
                                VectorAnglesRadar(MiddlePoint, angle);
                                const auto AngleYawRadian = DEG2RAD(angle.Y + 180.f);
                                float Point_X = ((float)screenWidth / 2.f) + (radar_range) / 2.f * 8.f * cosf(AngleYawRadian);
                                float Point_Y = ((float)screenHeight / 2.f) + (radar_range) / 2.f * 8.f * sinf(AngleYawRadian);
                                FixTriangle(Point_X, Point_Y, 100);
                                std::array < FVector2D, 39 > points
                                {
                                    FVector2D((float)Point_X - (5.6f * (float)3.f), Point_Y - (7.3f *3.f)),
                                    FVector2D((float)Point_X + (11.6f *3.f), Point_Y),
                                    FVector2D((float)Point_X - (5.6f *3.f), Point_Y + (7.3f *3.f)),
                                    FVector2D((float)Point_X - (5.6f *3.f), Point_Y - (4.3f *3.f)),
                                    FVector2D((float)Point_X - (19.5f *3.f), Point_Y - (4.3f *3.f)),
                                    FVector2D((float)Point_X - (19.5f *3.f), Point_Y + (4.3f *3.f)),
                                    FVector2D((float)Point_X - (5.6f *3.f), Point_Y + (4.3f *3.f)),
                                    FVector2D((float)Point_X + (10.3f *3.f), Point_Y),
                                    FVector2D((float)Point_X - (5.f *3.f), Point_Y - (3.f *3.f)),
                                    FVector2D((float)Point_X - (5.f *3.f), Point_Y + (3.f *3.f)),
                                    FVector2D((float)Point_X - (5.f * (float)3.f), Point_Y - (6.5f *3.f)),
                                    FVector2D((float)Point_X - (5.f * (float)3.f), Point_Y - (5.5f *3.f)),
                                    FVector2D((float)Point_X - (5.f * (float)3.f), Point_Y - (3.f *3.f)),
                                    FVector2D((float)Point_X - (5.f * (float)3.f), Point_Y - (3.f *3.f)),
                                    FVector2D((float)Point_X - (5.f * (float)3.f), Point_Y - (2.5f *3.f)),
                                    FVector2D((float)Point_X - (5.f * (float)3.f), Point_Y - (1.5f *3.f)),
                                    FVector2D((float)Point_X - (5.f * (float)3.f), Point_Y - (0.5f *3.f)),
                                    FVector2D((float)Point_X - (5.f * (float)3.f), Point_Y + (6.5f *3.f)),
                                    FVector2D((float)Point_X - (5.f * (float)3.f), Point_Y + (5.5f *3.f)),
                                    FVector2D((float)Point_X - (5.f * (float)3.f), Point_Y + (3.f *3.f)),
                                    FVector2D((float)Point_X - (5.f * (float)3.f), Point_Y + (3.f *3.f)),
                                    FVector2D((float)Point_X - (5.f * (float)3.f), Point_Y + (2.5f *3.f)),
                                    FVector2D((float)Point_X - (5.f * (float)3.f), Point_Y + (1.5f *3.f)),
                                    FVector2D((float)Point_X - (5.f * (float)3.f), Point_Y),
                                    FVector2D((float)Point_X - (5.f * (float)3.f), Point_Y + (0.2f *3.f)),
                                    FVector2D((float)Point_X - (5.f * (float)3.f), Point_Y - (0.2f *3.f)),
                                    FVector2D((float)Point_X - (18.5f *3.f), Point_Y - (3.75f *3.f)),
                                    FVector2D((float)Point_X - (18.5f *3.f), Point_Y - (3.f *3.f)),
                                    FVector2D((float)Point_X - (18.5f *3.f), Point_Y - (2.f *3.f)),
                                    FVector2D((float)Point_X - (18.5f *3.f), Point_Y - (1.f *3.f)),
                                    FVector2D((float)Point_X - (18.5f *3.f), Point_Y - (0.5f *3.f)),
                                    FVector2D((float)Point_X - (18.5f *3.f), Point_Y - (0.2f *3.f)),
                                    FVector2D((float)Point_X - (18.5f *3.f), Point_Y),
                                    FVector2D((float)Point_X - (18.5f *3.f), Point_Y + (3.75f *3.f)),
                                    FVector2D((float)Point_X - (18.5f *3.f), Point_Y + (3.f *3.f)),
                                    FVector2D((float)Point_X - (18.5f *3.f), Point_Y + (2.f *3.f)),
                                    FVector2D((float)Point_X - (18.5f *3.f), Point_Y + (1.f *3.f)),
                                    FVector2D((float)Point_X - (18.5f *3.f), Point_Y + (0.5f *3.f)),
                                    FVector2D((float)Point_X - (18.5f *3.f), Point_Y + (0.2f *3.f)),
                                };
                                // bool IsVisible = localPlayerController->LineOfSightTo(Player, {0,0,0}, true);
                                /*  if(IsVisible) {
                                 visCol.R = 0.f;
                                 visCol.G = 1.f;
                                 visCol.B = 0.f;
                                 visCol.A = 1.f;
                                 }else {
                                 visCol.R = 1.f;
                                 visCol.G = 0.f;
                                 visCol.B = 0.f;
                                 visCol.A = 1.f;
                                 }*/
                                FVector2D BelowRoowwtSc;
                                if (gGameplayStatics->ProjectWorldToScreen(localPlayerController, Head, false, &BelowRoowwtSc)) {
                                }else{
                                    RotateTriangle(points, angle.Y + 180.0f);
                                    float Thickness = 3.f;
                                    if(Player->bIsAI){
                                        // DrawArrows(pHUD,points, Thickness, COLOR_WHITE); //No arrows if it Bots
                                    } else{
                                        DrawArrows(HUD,points, Thickness, visCol);
                                    }
                                }
                            }
                                    FVector2D HeadSc, RootSc, upper_rPoSC, lowerarm_rPoSC, hand_rPoSC, upper_lPoSC, hand_lPoSC, thigh_lPoSC, calf_lPoSC, foot_lPoSC, thigh_rPoSC, calf_rPoSC, foot_rPoSC, neck_01PoSC, pelvisPoSC, lowerarm_lSC;
                                    if (gGameplayStatics->ProjectWorldToScreen(
                                            localPlayerController,
                                            Head, false, &HeadSc) &&
                                        gGameplayStatics->ProjectWorldToScreen(
                                                localPlayerController,
                                                upper_r, false,
                                                &upper_rPoSC) &&
                                        gGameplayStatics->ProjectWorldToScreen(
                                                localPlayerController,
                                                upper_l, false,
                                                &upper_lPoSC) &&
                                        gGameplayStatics->ProjectWorldToScreen(
                                                localPlayerController,
                                                lowerarm_r, false,
                                                &lowerarm_rPoSC) &&
                                        gGameplayStatics->ProjectWorldToScreen(
                                                localPlayerController,
                                                hand_r, false,
                                                &hand_rPoSC) &&
                                        gGameplayStatics->ProjectWorldToScreen(
                                                localPlayerController,
                                                lowerarm_l, false,
                                                &lowerarm_lSC) &&
                                        gGameplayStatics->ProjectWorldToScreen(
                                                localPlayerController,
                                                hand_l, false,
                                                &hand_lPoSC) &&
                                        gGameplayStatics->ProjectWorldToScreen(
                                                localPlayerController,
                                                thigh_l, false,
                                                &thigh_lPoSC) &&
                                        gGameplayStatics->ProjectWorldToScreen(
                                                localPlayerController,
                                                calf_l, false,
                                                &calf_lPoSC) &&
                                        gGameplayStatics->ProjectWorldToScreen(
                                                localPlayerController,
                                                foot_l, false,
                                                &foot_lPoSC) &&
                                        gGameplayStatics->ProjectWorldToScreen(
                                                localPlayerController,
                                                thigh_r, false,
                                                &thigh_rPoSC) &&
                                        gGameplayStatics->ProjectWorldToScreen(
                                                localPlayerController,
                                                calf_r, false,
                                                &calf_rPoSC) &&
                                        gGameplayStatics->ProjectWorldToScreen(
                                                localPlayerController,
                                                foot_r, false,
                                                &foot_rPoSC) &&
                                        gGameplayStatics->ProjectWorldToScreen(
                                                localPlayerController,
                                                neck_01, false,
                                                &neck_01PoSC) &&
                                        gGameplayStatics->ProjectWorldToScreen(
                                                localPlayerController,
                                                pelvis, false,
                                                &pelvisPoSC) &&
                                        gGameplayStatics->ProjectWorldToScreen(
                                                localPlayerController,
                                                Root, false, &RootSc)) {

                                        bool IsVisible = localPlayerController->LineOfSightTo(
                                                Player,
                                                {0, 0, 0},
                                                true);
                                        FLinearColor Color = {1.0f, 0, 0, 1.0f};
                                        if (IsVisible)
                                            Color = {0, 1.0f, 0, 1.0f};









					               

                                        // ESP 射线
                                        if (Config.ESPMenu.Line) {

                                            FVector screenPos = localPlayerController->PlayerCameraManager->GetCameraLocation();
                                            screenPos.Z += 350.0f;
                                            screenPos.Y += 350.0f;
                                            screenPos.X += 350.0f;
if(SX == 0){                                            if (!localPlayerController->LineOfSightTo(Player, screenPos, true)) {

                                                DrawLine(HUD, {static_cast<float>(screenWidth / 2), 0}, HeadSc, 1.0f, COLOR_WHITE);
                                            } else {
                                                DrawLine(HUD, {static_cast<float>(screenWidth / 2), 0}, HeadSc, 1.0f, COLOR_LIME);
                                            }

} 

                                       if(SX == 1){                                            if (!localPlayerController->LineOfSightTo(Player, screenPos, true)) {

                                                DrawLine(HUD,{(float) screenWidth / 2,  (float) (screenHeight / 2)}, HeadSc, 1.0f, COLOR_WHITE);
                                            } else {
                                                DrawLine(HUD,{(float) screenWidth / 2,  (float) (screenHeight / 2)}, HeadSc, 1.0f, COLOR_LIME);
}
} 
if(SX == 2){                                            if (!localPlayerController->LineOfSightTo(Player, screenPos, true)) {

                                                DrawLine(HUD, {(float)ScreenWidth / 2, 900}, HeadSc, 1.0f, 白色);
                                            } else {
                                                DrawLine(HUD, {(float)ScreenWidth / 2, 900}, HeadSc, 1.0f, COLOR_LIME);
}
} 
}                                       // ESP 骨骼
                                        if (Config.ESPMenu.Skeleton) {
                                            static vector<string> right_arm{"spine_03", "clavicle_r", "upperarm_r", "lowerarm_r", "hand_r", "item_r"};
                                        static vector<string> left_arm{"spine_03", "clavicle_l", "upperarm_l", "lowerarm_l", "hand_l", "item_l"};
                                        static vector<string> spine{"Head", "neck_01", "spine_03", "spine_02", "spine_01", "pelvis"};
                                        static vector<string> lower_right{"pelvis", "thigh_r", "calf_r", "foot_r"};
                                        static vector<string> lower_left{"pelvis", "thigh_l", "calf_l", "foot_l"};
                                        static vector<vector<string>> skeleton{right_arm, left_arm, spine, lower_right, lower_left};
                                        for (auto &boneStructure : skeleton) {
                                            string lastBone;
                                            for (string &currentBone : boneStructure) {
                                                if (!lastBone.empty()) {
                                                    FVector wBoneFrom = GetBoneLocationByName(Player, lastBone.c_str());
                                                    FVector wBoneTo = GetBoneLocationByName(Player, currentBone.c_str());
                                                    FVector2D boneFrom, boneTo;
                                                    if (gGameplayStatics->ProjectWorldToScreen(localPlayerController, wBoneFrom, false, &boneFrom) && gGameplayStatics->ProjectWorldToScreen(localPlayerController, wBoneTo, false, &boneTo)) {
                                                        bool IsVisibles = g_PlayerController->LineOfSightTo(g_PlayerController->PlayerCameraManager, Player->GetBonePos(currentBone.c_str(), {}), true);
                                                        if (IsVisibles){
                                                            if(Player->bEnsure){
                                                                DrawLine(HUD, boneFrom, boneTo, EspSktonThik, COLOR_LIME);
                                                   //            pHUD->Canvas->K2_DrawLine(boneFrom, boneTo, EspSktonThik, COLOR_LIME);
                                                            }else{
                                                                DrawLine(HUD, boneFrom, boneTo, EspSktonThik, COLOR_LIME);
                                                         //       pHUD->Canvas->K2_DrawLine(boneFrom, boneTo, EspSktonThik, COLOR_GREEN);
                                                            }
                                                        }else{
                                                            if(Player->bEnsure){
                                                                DrawLine(HUD, boneFrom, boneTo, EspSktonThik, COLOR_WHITE);
                                                        //        pHUD->Canvas->K2_DrawLine(boneFrom, boneTo, EspSktonThik, COLOR_WHITE);
                                                            }else{
                                                                DrawLine(HUD, boneFrom, boneTo, EspSktonThik, COLOR_RED);
                                                        //        pHUD->Canvas->K2_DrawLine(boneFrom, boneTo, EspSktonThik, COLOR_RED);
                                                            }
                                                        }
                                                           //EspSktonThik
                                                    }
                                                }
                                                lastBone = currentBone;
                                            }
                                        }
                                    }











//方框                                        
                                    if (Config.ESPMenu.Box) {

auto BoxBounds = Player->Mesh->CachedLocalBounds;
                                    FVector Chest = Player->K2_GetActorLocation();
                                           DrawBox3D(HUD,Player, visCol, Chest, BoxBounds.BoxExtent);
                                        }
if (瞄准线){
bool IsVisible = localPlayerController->LineOfSightTo(Player, {0,0,0}, true);
			        long PlayerAimLineColor = (1.f, 1.f, 1.f, 1.f);
            //打击部位
ASTExtraPlayerCharacter *Target = GetTargetByCrossDist();
					if (Target)
					{
if(IsVisible){

					    FVector Head = Target->GetBonePos("neck_01", {});
                        FVector2D HeadPosSC;
                        if (W2S(Head, (FVector2D *)&HeadPosSC)) {
                       DrawLine(HUD, {(float) screenWidth / 2,  (float) (screenHeight / 2)}, FVector2D(HeadPosSC.X, HeadPosSC.Y + PlayerAimLineColor),2.f, COLOR_RED);
                        }
}else{
FVector Head = Target->GetBonePos("neck_01", {});
                        FVector2D HeadPosSC;
                        if (W2S(Head, (FVector2D *)&HeadPosSC)) {
                       DrawLine(HUD, {(float) screenWidth / 2,  (float) (screenHeight / 2)}, FVector2D(HeadPosSC.X, HeadPosSC.Y + PlayerAimLineColor),2.f, 红色);
                        }
}
}
}
if(血条 == 5){
		float CurHP = std::max(0.f, std::min(Player->Health, Player->HealthMax));
		float MaxHP = Player->HealthMax;
		
		constexpr int segments = 80;
		constexpr float ring_radius = 30.0f;
		constexpr float twist_factor = 0.8f;
		constexpr float thickness = 4.0f;
		
		auto AboveHead = Player->GetHeadLocation(true);
		AboveHead.Z += 35.f;
		FVector2D center;
		if (UGameplayStatics::ProjectWorldToScreen(g_PlayerController, AboveHead, false, &center)) {
		    
		    float hp_ratio = CurHP / MaxHP;
		    float dynamic_radius = ring_radius * (0.8f + 0.2f * hp_ratio);
		    float dynamic_twist = twist_factor * (1.0f - hp_ratio);
		
		    static float GameTime = 0.0f;
		    GameTime += 0.0167f;
		    if (GameTime > 6.28319f) GameTime -= 6.28319f;
		
		    FVector2D points[segments];
		    for (int i = 0; i < segments; ++i) {
		        float t = (float)i / segments * 2 * PI;
		        float x = dynamic_radius * cos(t);
		        float y = dynamic_radius * sin(t);
		        
		        float z = dynamic_radius * dynamic_twist * t / (2 * PI);
		        FVector world_point = AboveHead + FVector(x, y, z);
		        
		        FVector2D screen_point;
		        if (UGameplayStatics::ProjectWorldToScreen(g_PlayerController, world_point, false, &screen_point)) {
		            points[i] = screen_point;
		        }
		    }
		
		    FLinearColor base_color(
		        (1.0f - hp_ratio) * 0.8f,
		        hp_ratio * 0.9f,
		        0.2f,
		        0.7f
		    );
		    for (int i = 0; i < segments; ++i) {
		        int next_i = (i + 1) % segments;
		        DrawLine(HUD, points[i], points[next_i], 
		                thickness * (0.8f + 0.2f * hp_ratio),
		                base_color);
		    }
		
		    constexpr int flow_segments = 20;
		    for (int i = 0; i < flow_segments; ++i) {
		        float t = (float)i / flow_segments * 2 * PI;
		        float flow_radius = dynamic_radius * 0.6f;
		        
		        FVector flow_point = AboveHead + FVector(
		            flow_radius * cos(t + GameTime),
		            flow_radius * sin(t + GameTime),
		            dynamic_radius * dynamic_twist * t / (2 * PI)
		        );
		        
		        FVector2D screen_flow;
		        if (UGameplayStatics::ProjectWorldToScreen(g_PlayerController, flow_point, false, &screen_flow)) {
		            DrawCircle(HUD, 
		                     screen_flow.X,
		                     screen_flow.Y,
		                     3.0f,
		                     12,
		                     FLinearColor(1.0f, 0.8f, 0.2f, 0.9f));
		        }
		    }
		}
		
	}
	
if(血条 == 4){
                                    float CurHP = std::max(0.f, std::min(Player->Health, Player->HealthMax));
                                    float MaxHP = Player->HealthMax;
                                    float magic_number = (Distance);
                                                           float mx = (kWidth / 4) / magic_number;

                                                           float healthLength = kWidth / 20;
                                                           if (healthLength < mx)
                                                               healthLength = mx;
                                    
//                                    int CurHP = (int) std::max(0, std::min((int) Player->Health, (int)  Player->HealthMax));
//                                                                        int MaxHP = (int) Player->HealthMax;
                                    FLinearColor ColorHP = {
                                        std::min(((510.f * (MaxHP - CurHP)) / MaxHP) / 255.f, 1.f),
                                        std::min(((510.f * CurHP) / MaxHP) / 255.f, 1.f),
                                        0.f,
                                        0.5f
                                    };
                                    if (CurHP == 0 && !Player->bDead) {
                                        ColorHP = {0.63f, 0.82f, 0.42f, 0.75f};
                                        CurHP = Player->NearDeathBreath;
                                        USTCharacterNearDeathComp *NearDeatchComponent = Player->NearDeatchComponent;
                                        if (NearDeatchComponent) {
                                            MaxHP = NearDeatchComponent->BreathMax;
                                        }
                                    }
                                    auto AboveHead =  Player->GetHeadLocation(true);
                                    AboveHead.Z+=35.f;
                                    FVector2D AboveHeadSc;
                                    FVector2D ROT3;
                                    
                                    
                                    if (gGameplayStatics->ProjectWorldToScreen(localPlayerController, AboveHead, false, &AboveHeadSc)) {
                                        auto mWidthScale = std::min(0.1f * Distance, 35.f);
                                        auto mWidth = 80.f - mWidthScale;
                                        auto mHeight = mWidth * 0.07f;
                                        AboveHeadSc.X -= (mWidth / 2);
                                        AboveHeadSc.Y -= (mHeight * 1.55f);
                                        if(Player->bEnsure){
                                            DrawFilledRectangle(HUD, {AboveHeadSc.X, AboveHeadSc.Y}, (CurHP * mWidth / MaxHP), mHeight, allColors::Green);
                                            DrawRectangle(HUD, {AboveHeadSc.X, AboveHeadSc.Y}, mWidth, mHeight, 1.3f, {0, 0, 0, 1.f});
                                            DrawRectangle(HUD, {AboveHeadSc.X, AboveHeadSc.Y}, mWidth-16, mHeight, 1.3f, {0, 0, 0, 1.f});
                                            DrawRectangle(HUD, {AboveHeadSc.X, AboveHeadSc.Y}, mWidth-32, mHeight, 1.3f, {0, 0, 0, 1.f});
                                            DrawRectangle(HUD, {AboveHeadSc.X, AboveHeadSc.Y}, mWidth-48, mHeight, 1.3f, {0, 0, 0, 1.f});
                                            DrawRectangle(HUD, {AboveHeadSc.X, AboveHeadSc.Y}, mWidth-64, mHeight, 1.3f, {0, 0, 0, 1.f});
                                  
                }else{
                                            DrawFilledRectangle(HUD, {AboveHeadSc.X, AboveHeadSc.Y}, (CurHP * mWidth / MaxHP), mHeight, COLOR_RED);
                                            DrawRectangle(HUD, {AboveHeadSc.X, AboveHeadSc.Y}, mWidth, mHeight, 1.3f, {0, 0, 0, 1.f});
                                            DrawRectangle(HUD, {AboveHeadSc.X, AboveHeadSc.Y}, mWidth-16, mHeight, 1.3f, {0, 0, 0, 1.f});
                                            DrawRectangle(HUD, {AboveHeadSc.X, AboveHeadSc.Y}, mWidth-32, mHeight, 1.3f, {0, 0, 0, 1.f});
                                            DrawRectangle(HUD, {AboveHeadSc.X, AboveHeadSc.Y}, mWidth-48, mHeight, 1.3f, {0, 0, 0, 1.f});
                                            DrawRectangle(HUD, {AboveHeadSc.X, AboveHeadSc.Y}, mWidth-64, mHeight, 1.3f, {0, 0, 0, 1.f});
   }
     }
        }

if(血条 == 1){
    int CurHP = (int)std::max(0, std::min((int)Player->Health, (int)Player->HealthMax));
    int MaxHP = (int)Player->HealthMax;

    if (Player->Health == 0.0f && !Player->bDead) {
        CurHP = Player->NearDeathBreath;
        if (Player->NearDeatchComponent) {
            MaxHP = Player->NearDeatchComponent->BreathMax;
        }
    }

//auto mWidthScale = std::min(0.1f * Distance, 35.f);
                                    auto mWidth = 158.0f;
                                    auto mHeight = 3.0f;
                                    HeadSc.X -= (mWidth / 2);
                                    HeadSc.Y -= (mHeight * 1.5f);
 
DrawFilledRectangle(HUD, {HeadSc.X, HeadSc.Y - 10}, (CurHP * mWidth / MaxHP), mHeight,{1.0f, 1.0f, 1.0f, 0.8f});                                       

                                        
if (Player->TeamID == 1 || Player->TeamID == 21 || Player->TeamID == 31 || Player->TeamID == 41 || Player->TeamID == 51 || Player->TeamID == 61 || Player->TeamID == 71 || Player->TeamID == 81 || Player->TeamID == 91 || Player->TeamID == 101 || Player->TeamID == 111 || Player->TeamID == 121 || Player->TeamID == 131 || Player->TeamID == 141 || Player->TeamID == 151 || Player->TeamID == 161 || Player->TeamID == 171 || Player->TeamID == 181 || Player->TeamID == 191 || Player->TeamID == 201 || Player->TeamID == 211){

DrawFilledRectangle(HUD, {HeadSc.X, HeadSc.Y - 32}, mWidth, 22.0f, {0.85f, 0.33f, 0.84f, 0.4f});

} else if (Player->TeamID == 2 || Player->TeamID == 22 || Player->TeamID == 32 || Player->TeamID == 42 || Player->TeamID == 52 || Player->TeamID == 62 || Player->TeamID == 72 || Player->TeamID == 82 || Player->TeamID == 92 || Player->TeamID == 102 || Player->TeamID == 112 || Player->TeamID == 122 || Player->TeamID == 132 || Player->TeamID == 142 || Player->TeamID == 152 || Player->TeamID == 162 || Player->TeamID == 172 || Player->TeamID == 182 || Player->TeamID == 192 || Player->TeamID == 202 || Player->TeamID == 212){

DrawFilledRectangle(HUD, {HeadSc.X, HeadSc.Y - 32}, mWidth, 22.0f, {0.62f, 0.12f, 0.94f, 0.4f});

} else if (Player->TeamID == 3 || Player->TeamID == 23 || Player->TeamID == 33 || Player->TeamID == 43 || Player->TeamID == 53 || Player->TeamID == 63 || Player->TeamID == 73 || Player->TeamID == 83 || Player->TeamID == 93 || Player->TeamID == 103 || Player->TeamID == 113 || Player->TeamID == 123 || Player->TeamID == 133 || Player->TeamID == 143 || Player->TeamID == 153 || Player->TeamID == 163 || Player->TeamID == 173 || Player->TeamID == 183 || Player->TeamID == 193 || Player->TeamID == 203 || Player->TeamID == 213){

DrawFilledRectangle(HUD, {HeadSc.X, HeadSc.Y - 32}, mWidth, 22.0f, {0.0f, 1.0f, 0.5f, 0.4f});

} else if (Player->TeamID == 4 || Player->TeamID == 24 || Player->TeamID == 34 || Player->TeamID == 44 || Player->TeamID == 54 || Player->TeamID == 64 || Player->TeamID == 74 || Player->TeamID == 84 || Player->TeamID == 94 || Player->TeamID == 104 || Player->TeamID == 114 || Player->TeamID == 124 || Player->TeamID == 134 || Player->TeamID == 144 || Player->TeamID == 154 || Player->TeamID == 164 || Player->TeamID == 174 || Player->TeamID == 184 || Player->TeamID == 194 || Player->TeamID == 204 || Player->TeamID == 214){

DrawFilledRectangle(HUD, {HeadSc.X, HeadSc.Y - 32}, mWidth, 22.0f, {0.53f, 0.8f, 0.92f, 0.4f});

} else if (Player->TeamID == 5 || Player->TeamID == 25 || Player->TeamID == 35 || Player->TeamID == 45 || Player->TeamID == 55 || Player->TeamID == 65 || Player->TeamID == 75 || Player->TeamID == 85 || Player->TeamID == 95 || Player->TeamID == 105 || Player->TeamID == 115 || Player->TeamID == 125 || Player->TeamID == 135 || Player->TeamID == 145 || Player->TeamID == 155 || Player->TeamID == 165 || Player->TeamID == 175 || Player->TeamID == 185 || Player->TeamID == 195 || Player->TeamID == 205 || Player->TeamID == 215){

DrawFilledRectangle(HUD, {HeadSc.X, HeadSc.Y - 32}, mWidth, 22.0f, {0.0f, 1.0f, 1.0f, 0.4f});

} else if (Player->TeamID == 6 || Player->TeamID == 26 || Player->TeamID == 36 || Player->TeamID == 46 || Player->TeamID == 56 || Player->TeamID == 66 || Player->TeamID == 76 || Player->TeamID == 86 || Player->TeamID == 96 || Player->TeamID == 106 || Player->TeamID == 116 || Player->TeamID == 126 || Player->TeamID == 136 || Player->TeamID == 146 || Player->TeamID == 156 || Player->TeamID == 166 || Player->TeamID == 176 || Player->TeamID == 186 || Player->TeamID == 196 || Player->TeamID == 206 || Player->TeamID == 216){

DrawFilledRectangle(HUD, {HeadSc.X, HeadSc.Y - 32}, mWidth, 22.0f, {0.12f, 0.56f, 1.0f, 0.4f});

} else if (Player->TeamID == 7 || Player->TeamID == 27 || Player->TeamID == 37 || Player->TeamID == 47 || Player->TeamID == 57 || Player->TeamID == 67 || Player->TeamID == 77 || Player->TeamID == 87 || Player->TeamID == 97 || Player->TeamID == 107 || Player->TeamID == 117 || Player->TeamID == 127 || Player->TeamID == 137 || Player->TeamID == 147 || Player->TeamID == 157 || Player->TeamID == 167 || Player->TeamID == 177 || Player->TeamID == 187 || Player->TeamID == 197 || Player->TeamID == 207 || Player->TeamID == 217){

DrawFilledRectangle(HUD, {HeadSc.X, HeadSc.Y - 32}, mWidth, 22.0f, {1.0f, 0.0f, 1.0f, 0.4f});

} else if (Player->TeamID == 8 || Player->TeamID == 18 || Player->TeamID == 28 || Player->TeamID == 38 || Player->TeamID == 48 || Player->TeamID == 58 || Player->TeamID == 68 || Player->TeamID == 78 || Player->TeamID == 88 || Player->TeamID == 98 || Player->TeamID == 108 || Player->TeamID == 118 || Player->TeamID == 128 || Player->TeamID == 138 || Player->TeamID == 148 || Player->TeamID == 158 || Player->TeamID == 168 || Player->TeamID == 178 || Player->TeamID == 188 || Player->TeamID == 198 || Player->TeamID == 208 || Player->TeamID == 218){

DrawFilledRectangle(HUD, {HeadSc.X, HeadSc.Y - 32}, mWidth, 22.0f, {0.16f, 0.14f, 0.13f, 0.4f});

} else if (Player->TeamID == 9 || Player->TeamID == 19 || Player->TeamID == 29 || Player->TeamID == 39 || Player->TeamID == 49 || Player->TeamID == 59 || Player->TeamID == 69 || Player->TeamID == 79 || Player->TeamID == 89 || Player->TeamID == 99 || Player->TeamID == 109 || Player->TeamID == 119 || Player->TeamID == 129 || Player->TeamID == 139 || Player->TeamID == 149 || Player->TeamID == 159 || Player->TeamID == 169 || Player->TeamID == 179 || Player->TeamID == 189 || Player->TeamID == 199 || Player->TeamID == 209 || Player->TeamID == 219){

DrawFilledRectangle(HUD, {HeadSc.X, HeadSc.Y - 32}, mWidth, 22.0f, {1.0f, 0.5f, 0.31f, 0.4f});

} else if (Player->TeamID == 10){

DrawFilledRectangle(HUD, {HeadSc.X, HeadSc.Y - 32}, mWidth, 22.0f, {0.42f, 0.35f, 0.8f, 0.4f});

} else if (Player->TeamID == 11){

DrawFilledRectangle(HUD, {HeadSc.X, HeadSc.Y - 32}, mWidth, 22.0f, {0.5f, 1.0f, 0.8f, 0.4f});

} else if (Player->TeamID == 12){

DrawFilledRectangle(HUD, {HeadSc.X, HeadSc.Y - 32}, mWidth, 22.0f, {0.25f, 0.41f, 0.88f, 0.4f});

} else if (Player->TeamID == 13){

DrawFilledRectangle(HUD, {HeadSc.X, HeadSc.Y - 32}, mWidth, 22.0f, {1.0f, 0.5f, 0.0f, 0.4f});

} else if (Player->TeamID == 14){

DrawFilledRectangle(HUD, {HeadSc.X, HeadSc.Y - 32}, mWidth, 22.0f, {0.94f, 0.9f, 0.5f, 0.4f});

} else if (Player->TeamID == 15){

DrawFilledRectangle(HUD, {HeadSc.X, HeadSc.Y - 32}, mWidth, 22.0f, {0.75f, 0.75f, 0.75f, 0.4f});

} else if (Player->TeamID == 16){

DrawFilledRectangle(HUD, {HeadSc.X, HeadSc.Y - 32}, mWidth, 22.0f, {1.0f, 0.92f, 0.8f, 0.4f});

} else if (Player->TeamID == 17){

DrawFilledRectangle(HUD, {HeadSc.X, HeadSc.Y - 32}, mWidth, 22.0f, {0.89f, 0.09f, 0.05f, 0.4f});

}else {

DrawFilledRectangle(HUD, {HeadSc.X, HeadSc.Y - 32}, mWidth, 22.0f, {0.89f, 0.09f, 0.05f, 0.4f});

}

}





//引擎绘制1
if(血条 == 2){
float CurHP = std::max(0.f, std::min(Player->Health, Player->HealthMax));
                                            float MaxHP = Player->HealthMax;

                                            FLinearColor ColorHP = {
                                                    std::min(((510.f * (MaxHP - CurHP)) / MaxHP) / 255.f, 1.f),
                                                    std::min(((510.f * CurHP) / MaxHP) / 255.f, 1.f),
                                                    0.f,
                                                    0.5f
                                            };

                                            if (CurHP == 0 && !Player->bDead) {
                                                ColorHP = {1.f, 0, 0, 1.f};

                                                CurHP = Player->NearDeathBreath;
                                                USTCharacterNearDeathComp *NearDeatchComponent = Player->NearDeatchComponent;
                                                if (NearDeatchComponent) {
                                                    MaxHP = NearDeatchComponent->BreathMax;
                                                }
                                            }

                                            auto AboveHead = Player->GetHeadLocation(true);
                                            AboveHead.Z += 35.f;
                                            FVector2D AboveHeadSc;
										if (UGameplayStatics::ProjectWorldToScreen(g_PlayerController, AboveHead, false, &AboveHeadSc)) {
											
                                                auto mWidthScale = std::min(0.1f * Distance, 35.f);
                                                                                

                                                auto mWidth = 75.f - mWidthScale;
                                                auto mHeight = mWidth * 0.175f;

                                                AboveHeadSc.X -= (mWidth / 2);
                                                AboveHeadSc.Y -= (mHeight * 1.5f);
                                     //        auto vStart = {AboveHeadSc.X - (mWidth / TextX),
                                          //     AboveHeadSc.Y - (mHeight * TextY)};
                                         //      auto vEndRect = {vStart.x + mWidth, vStart.y + mHeight};
                                           //     DrawFilledRectangle(HUD, {vStart, vEndRect}, (CurHP * mWidth / MaxHP), mHeight, {0, 0, 0, 1.f});
										        DrawFilledRectangle(HUD, {AboveHeadSc.X, AboveHeadSc.Y},mWidth, mHeight, {0, 0, 0, 1.f});                                                
                                                DrawFilledRectangle(HUD, {AboveHeadSc.X, AboveHeadSc.Y}, (CurHP * mWidth / MaxHP), mHeight, GetRandomColorByIndex(Player->TeamID));                                                
                                                DrawRectangle(HUD, {AboveHeadSc.X, AboveHeadSc.Y}, mWidth, mHeight, 3.0f, {GREEN});
                                            }



}
if(测试){
Player->STPlayerController->RPC_GiveUpGame();//
}
if(TS){
float CurHP = 100.0f;
float MaxHP = 100.0f;
		
		constexpr int segments = 80;
		constexpr float ring_radius = 30.0f;
		constexpr float twist_factor = 0.8f;
		constexpr float thickness = 4.0f;
		
		auto AboveHead = g_LocalPlayer->GetHeadLocation(true);
		AboveHead.Z += 35.f;
		FVector2D center;
		if (UGameplayStatics::ProjectWorldToScreen(g_PlayerController, AboveHead, false, &center)) {
		    
		    float hp_ratio = CurHP / MaxHP;
		    float dynamic_radius = ring_radius * (0.8f + 0.2f * hp_ratio);
		    float dynamic_twist = twist_factor * (1.0f - hp_ratio);
		
		    static float GameTime = 0.0f;
		    GameTime += 0.0167f;
		    if (GameTime > 6.28319f) GameTime -= 6.28319f;
		
		    FVector2D points[segments];
		    for (int i = 0; i < segments; ++i) {
		        float t = (float)i / segments * 2 * PI;
		        float x = dynamic_radius * cos(t);
		        float y = dynamic_radius * sin(t);
		        
		        float z = dynamic_radius * dynamic_twist * t / (2 * PI);
		        FVector world_point = AboveHead + FVector(x, y, z);
		        
		        FVector2D screen_point;
		        if (UGameplayStatics::ProjectWorldToScreen(g_PlayerController, world_point, false, &screen_point)) {
		            points[i] = screen_point;
		        }
		    }
		
		    FLinearColor base_color(
    (1.0f - hp_ratio) * 0.8f + hp_ratio * 1.0f,  // 红色分量
    hp_ratio * 0.8f,                            // 绿色分量
    0.2f * (1.0f - hp_ratio),                   // 蓝色分量
    0.7f                                        // 透明度
);
		    for (int i = 0; i < segments; ++i) {
		        int next_i = (i + 1) % segments;
		        DrawLine(HUD, points[i], points[next_i], 
		                thickness * (0.8f + 0.2f * hp_ratio),
		                base_color);
		    }
		
		    constexpr int flow_segments = 20;
		    for (int i = 0; i < flow_segments; ++i) {
		        float t = (float)i / flow_segments * 2 * PI;
		        float flow_radius = dynamic_radius * 0.6f;
		        
		        FVector flow_point = AboveHead + FVector(
		            flow_radius * cos(t + GameTime),
		            flow_radius * sin(t + GameTime),
		            dynamic_radius * dynamic_twist * t / (2 * PI)
		        );
		        
		        FVector2D screen_flow;
		        if (UGameplayStatics::ProjectWorldToScreen(g_PlayerController, flow_point, false, &screen_flow)) {
		            DrawCircle(HUD, 
		                     screen_flow.X,
		                     screen_flow.Y,
		                     3.0f,
		                     12,
		                     FLinearColor(1.0f, 0.8f, 0.2f, 0.9f));
		        }
		    }
		}

}
/*if (手雷紫喵 && localPlayer->IsUsingGrenade()) {
//by贤少 2025 07 15
ASTExtraPlayerCharacter *Target = GetTargetByCrossDist();
if (Target && Target->RootComponent) {//by贤少 2025 07 15
                                    FVector targetAimPos = Target->GetBonePos("Root", {});
//by贤少 2025 07 15

float 手雷到目标的时间 = 5.0f;
                                    FVector 预算 = targetAimPos + (Target->GetVelocity() * 手雷到目标的时间);

FVector 获取敌人移动速度 = Target->GetVelocity();//by贤少 2025 07 15

 targetAimPos = CustomAdd_VectorVector(targetAimPos, CustomMultiply_VectorFloat(获取敌人移动速度, 手雷到目标的时间));

//by贤少 2025 07 15

localController->SetControlRotation(ToRotator(localController->PlayerCameraManager->CameraCache.POV.Location, 预算), "");}
}*/
if (敌人大小) {
USceneComponent* MeshContainer = Player->MeshContainer;
MeshContainer->SetWorldScale3D({巨人2, 巨人2, 巨人2});
}
if(血条 == 3){
 int CurHP = (int)std::max(0, std::min((int)Player->Health, (int)Player->HealthMax));
    int MaxHP = (int)Player->HealthMax;
    float HealthPercentage = CurHP / MaxHP;
    FLinearColor HPColor = FLinearColor(1.0f - HealthPercentage, HealthPercentage, 0.0f, HealthPercentage); // Added alpha
    FVector HeadLocation = Player->GetHeadLocation(true);
    HeadLocation.Z += 35.f;
    FVector2D HeadScreenPos;
    if (UGameplayStatics::ProjectWorldToScreen(localPlayerController, HeadLocation, false, &HeadScreenPos)) {
    float BarWidth = 135;
    float BarHeight = 22.5;
    HeadScreenPos.X -= BarWidth / 2;
    HeadScreenPos.Y -= BarHeight * 1.5f;
    if(!Player->bEnsure) {
    if (Player->Health <= 0) {
    DrawFilledRectangle(HUD, {HeadScreenPos.X, HeadScreenPos.Y}, BarWidth, BarHeight, {0.f, 0.f, 0.f, 0.25f});
    DrawRectangle(HUD, {HeadScreenPos.X, HeadScreenPos.Y}, BarWidth, BarHeight, 1.5f, {0.f, 0.f, 0.f, 1.f});
    } else {
    DrawFilledRectangle(HUD, {HeadScreenPos.X, HeadScreenPos.Y}, (CurHP * BarWidth / MaxHP), BarHeight, {1.f, 0.f, 0.f, 0.5f});
    DrawRectangle(HUD, {HeadScreenPos.X, HeadScreenPos.Y}, BarWidth, BarHeight, 1.5f, {0.f, 0.f, 0.f, 1.f});
    }
    } else {
    if (Player->Health <= 0) {
    DrawFilledRectangle(HUD, {HeadScreenPos.X, HeadScreenPos.Y}, BarWidth, BarHeight, {0.f, 0.f, 0.f, 0.25f});
    DrawRectangle(HUD, {HeadScreenPos.X, HeadScreenPos.Y}, BarWidth, BarHeight, 1.5f, {0.f, 0.f, 0.f, 1.f});
    } else {
    DrawFilledRectangle(HUD, {HeadScreenPos.X, HeadScreenPos.Y}, (CurHP * BarWidth / MaxHP), BarHeight, {0.f, 1.f, 0.f, 0.5f});
    DrawRectangle(HUD, {HeadScreenPos.X, HeadScreenPos.Y}, BarWidth, BarHeight, 1.5f, {0.f, 0.f, 0.f, 1.f});
    }
    }
  }
}

                                       // ESP 手持
						if (Config.ESPMenu.Weapon){
                                    FVector BelowRoot = Player->GetBonePos("spine_03", {});
                                    FVector2D BelowRootSc;

                                    if (gGameplayStatics->ProjectWorldToScreen(localPlayerController, BelowRoot, false, &BelowRootSc)) {
					auto WeaponManagerComponent = Player->WeaponManagerComponent;
        if (WeaponManagerComponent) {
            {
          auto CurrentWeaponReplicated = (ASTExtraShootWeapon *)WeaponManagerComponent->CurrentWeaponReplicated;
          if (CurrentWeaponReplicated) {
           auto WeaponId = (int)CurrentWeaponReplicated->GetWeaponID();
           if (WeaponId) {
            

            std::wstring s; 
			s += CurrentWeaponReplicated->GetWeaponName().ToWString();
		robotoFont->LegacyFontSize = 9.2f;
		 DrawOutlinedText(HUD, FString(s), FVector2D(RootSc.X - 1, (RootSc.Y + 1)), COLOR_WHITE, COLOR_BLACK, true);
				}			
           }
          }
         }
        }
		
       }
if(KH){
//auto Player = (ASTExtraPlayerCharacter *)Actor;
bool IsVisible = localPlayerController->LineOfSightTo(Player, {0,0,0}, true);
ASTExtraPlayerCharacter *Target = GetTargetByCrossDist();
if(IsVisible){
g_LocalPlayer->Jump();
}else{
//g_LocalPlayer->bIsWeaponFiring();
}                            
}

	if(Config.ESPMenu.Radar){
                                        bool out = false;
                                        struct Vector3 Pos;
                                        Pos.X = (Config.ESPMenu.RadarX * 10);
Pos.Y = (Config.ESPMenu.RadarY * 10);
                                        struct Vector3 Size;
                                        Size.X = 200;
                                        Size.Y = 210;    
                                        float RadarCenterX = Pos.X + (Size.X / 2);
                                        float RadarCenterY = Pos.Y + (Size.Y / 2);
                                        
                                        FVector MyPosition, EnemyPosition;
                                        ASTExtraVehicleBase * CurrentVehiclea = Player->CurrentVehicle;
                                            if (CurrentVehiclea) {
                                        MyPosition = CurrentVehiclea->RootComponent->RelativeLocation;
                                        } else {
                                        MyPosition = Player->RootComponent->RelativeLocation;
                                        }
                                        ASTExtraVehicleBase * CurrentVehicle = localPlayer->CurrentVehicle;
                                           if (CurrentVehicle) {
                                                EnemyPosition = CurrentVehicle->RootComponent->RelativeLocation;
                                        } else {
                                                EnemyPosition = localPlayer->RootComponent->RelativeLocation;
                                        }
                                        
                                        FVector RadarSketch = WorldToRadar(g_PlayerController->PlayerCameraManager->CameraCache.POV.Rotation.Yaw, MyPosition, EnemyPosition, Pos.X, Pos.Y, Vector3(Size.X, Size.Y, 0), out);
                                        //DrawRectangle(HUD, {Pos.X, Pos.Y}, 200, 200, 1, {1, 0, 0, 1});        
                                        DrawCircle(HUD, RadarCenterX + 0.5f,RadarCenterY + 0.5f, 100.0f, 100.0f, COLOR_WHITE);      
                                        //DrawCircle(HUD, Pos.X Pos.Y, 200.0f, 100.0f, COLOR_BLACK);
                                        DrawFilledRectangle(HUD, FVector2D{RadarCenterX + 0.5f,RadarCenterY + 0.5f}, 5, 5, COLOR_YELLOW);
                                        if (!g_PlayerController->LineOfSightTo(g_PlayerController->PlayerCameraManager,Head, true))
                                            {
                                            DrawFilledRectangle(HUD, FVector2D{RadarSketch.X,RadarSketch.Y}, 5, 5,COLOR_BLUE);
                                           }else{
                                            DrawFilledRectangle(HUD, FVector2D{RadarSketch.X,RadarSketch.Y}, 5, 5,COLOR_RED);
                                            }    
                                        }




						if (Config.ESPMenu.Name)
					{
                                    auto AboveHead = Player->GetHeadLocation(true);
                                    AboveHead.Z += 35.f;
                                    FVector2D AboveHeadSc;

                                    if (gGameplayStatics->ProjectWorldToScreen(localPlayerController, AboveHead, false,&AboveHeadSc)) {
			std::wstring ws;
			ws = L"[";
			if (Player->bEnsure)
				{
			ws += L"BOT";
			    }else{
			ws += Player->PlayerName.ToWString();
				 }
			ws += L"]";
			
         ws += L"";
         ws += std::to_wstring(Player->TeamID);
         ws += L"  ";

			/*if (Player->bEnsure)
				{
			ws += L"BOT";
			    }else{
			ws += Player->PlayerName.ToWString();
				}*/

float txtWidth, txtHeight;
                                        HUD->GetTextSize(FString(ws), robotoTinyFont, 1.f, &txtWidth, &txtHeight);
                                        robotoTinyFont->LegacyFontSize = 8 + EspTextSiz;
                                        DrawSmallOutlinedText(HUD, ws, FVector2D(AboveHeadSc.X, AboveHeadSc.Y - txtHeight), visCol, COLOR_BLACK, true);
                                        DrawSmallOutlinedText(HUD, std::to_wstring((int)Distance) + L"m", FVector2D(AboveHeadSc.X, AboveHeadSc.Y), visCol, COLOR_BLACK, true);
						}
					}
//载具信息


                                    }
                                }
                            }



    UGameplayStatics* gGameplayStatics = (UGameplayStatics*)UGameplayStatics::StaticClass();
    if (Config.ESPMenu.GRWAR)
    {
        std::vector < ASTExtraGrenadeBase * >GrenadeBase;
        GetAllActors(GrenadeBase);
        for (auto actor = GrenadeBase.begin();
             actor != GrenadeBase.end(); actor++)
        {

            auto Grenade = *actor;
            if(Grenade) {
                if(Grenade->ItemDefineID.TypeSpecificID ==602002)
                    continue;
                if(Grenade->ItemDefineID.TypeSpecificID == 602004);
                auto RootComponent = Grenade->RootComponent;
                if (RootComponent) {
                    float gDistance =
                    Grenade->GetDistanceTo(localPlayer) /100.f;
                    if (gDistance <= 200.f)
                    {
                        tslFont->LegacyFontSize =
                        max(6, 15 - (int)(gDistance / 100.f));
                        float txtWidth, txtHeight;
                        std::wstring grenadetext = (L"危险");

                        HUD->GetTextSize(grenadetext,
                                          tslFont, 1.f, &txtWidth,
                                          &txtHeight);
                        FVector2D Location;
                        if (W2S
                            (RootComponent->RelativeLocation, &Location))
                        {
                            DrawOutlinedText(HUD,
                                             FString(
                                                     grenadetext),
                                             FVector2D(Location.X,
                                                       Location.Y + 34),COLOR_RED, COLOR_BLACK, true);
                        }
;
//                                                        }
                        tslFont->LegacyFontSize = TSL_FONT_DEFAULT_SIZE;
                        if (gDistance < 13)
                        {
                           
                            std::wstring gwarn;
                            gwarn = std::wstring(L"危险! 附近有投掷物!");//iAwareTexSiz
                       
                            tslFont->LegacyFontSize = 4 + iAwareTexSiz;
                            DrawOutlinedText(HUD, FString(gwarn),
                                             FVector2D(screenWidth / 2,
                                                       screenHeight / 2),
                                             COLOR_RED, COLOR_BLACK, true);
                            tslFont->LegacyFontSize =
                            TSL_FONT_DEFAULT_SIZE;
                           
                            
                            
                        }//
                        {
                            

                            ImDrawList* draw;
               
                            FVector2D Cross;
                            
                            Cross.X = 890.0f;
                            Cross.Y = 840.0f; // Front
//                            Cross.Z = 3.0f; // Height
                            FVector bbOrigin =
                            RootComponent->RelativeLocation;
                            FVector bbExtends(700, 700, 3);
                            FVector bbExtends2(10, 10, 3);
                            FVector bbOrigin2 =
                            RootComponent->RelativeLocation;
                            bbOrigin -= bbExtends / 2;
                            bbOrigin2 -= bbExtends2 / 2;
                            // bottom plane
//                            FVector grenadePos = bbOrigin;
                            FVector one = bbOrigin;
                            FVector two = bbOrigin;
                            FVector giua = bbOrigin2;
                            two.X += bbExtends.X;
                            giua.X += bbExtends2.X;
                            FVector three = bbOrigin;
                            three.X += bbExtends.X;
                            three.Y += bbExtends.Y;
                            FVector four = bbOrigin;
                            four.Y += bbExtends.Y;
                            FVector five = one;
                            five.Z += bbExtends.Z;
                            FVector six = two;
                            FVector six2 = giua;
                            six.Z += bbExtends.Z;
                            six2.Z += bbExtends2.Z;
                            FVector seven = three;
                            seven.Z += bbExtends.Z;
                            FVector eight = four;
                            eight.Z += bbExtends.Z;
                            FVector2D s1, s2, s3, s4, s5, s6, s7, s8, sgiua;
                            FVector2D grenadePos;
                            if (W2S(one, &s1) && W2S(two, &s2)
                                && W2S(three, &s3) && W2S(four, &s4)
                                && W2S(five, &s5) && W2S(six, &s6)
                                && W2S(seven, &s7) && W2S(eight, &s8) && W2S(giua, &sgiua) && W2S(Grenade->K2_GetActorLocation(), &grenadePos))
                            {
                                HUD->Canvas->K2_DrawLine(Cross, sgiua, 2.3f, COLOR_YELLOW);
                                DrawLine(HUD, s1, s2, 1.3f, COLOR_RED);
                                                                DrawLine(HUD, s2, s3,1.3f, COLOR_RED);
                                                            DrawLine(HUD, s3, s4, 1.3f, COLOR_RED);
                                                                DrawLine(HUD, s4, s1, 1.3f, COLOR_RED);
                                DrawLine(HUD, s5, s6, 1.3f, COLOR_RED);
                                DrawLine(HUD, s6, s7, 1.3f, COLOR_RED);
                                DrawLine(HUD, s7, s8,1.3f, COLOR_RED);
                                DrawLine(HUD, s8, s5, 1.3f, COLOR_RED);
                                DrawLine(HUD, s1, s5, 1.3f, COLOR_RED);
DrawLine(HUD, s2, s6, 1.3f, COLOR_RED);
                                DrawLine(HUD, s3, s7, 1.3f, COLOR_RED);
                                DrawLine(HUD, s4, s8, 1.3f, COLOR_RED);
                             

                                Circle3D(draw, Grenade->K2_GetActorLocation(), 720, ImColor(0, 255, 255, 255), 60);
                            
                            }
                            
                            
                            
                        }
                    }
                }
            }
        }
        GrenadeBase.clear();
    }
     // 绘制人生

                            if (totalEnemies > 0 || totalBots > 0) {
    std::wstring numi = L"真人 [ " + std::to_wstring(totalEnemies) +
                        L" ]  人机 [ " + std::to_wstring(totalBots) + L" ]";
    tslFont->LegacyFontSize = 25;
    DrawTextcan(HUD, FString(numi), {(float) screenWidth / 2, 120},
                COLOR_RED, COLOR_BLACK);

} else if(totalEnemies + totalBots < 1){
std::wstring numb = L"[ SAFE ]";
tslFont->LegacyFontSize = 35;
    DrawTextcan(HUD, FString(numb), {(float) screenWidth / 2, 120},
                COLOR_GREEN, COLOR_BLACK);

}
// 确保已包含正确的头文件


                        }
                    }
                }

        // islootbox
        if(IsLootBox) {
            // std::vector<Airdropbox*>ddd;
            
            std::vector < APickUpListWrapperActor * >ItemBase;
         
            GetAllActors(ItemBase);
            
            for (auto actor = ItemBase.begin(); actor != ItemBase.end(); actor++)
            {
                auto PickUpList = *actor;
                auto RootComponent = PickUpList->RootComponent;
                if (!RootComponent)
                    continue;
                //--
                std::wstring lootBoxType;
                switch (PickUpList->BoxType) {
                    case EPickUpBoxType::EPickUpBoxType__EPickUpBoxType_LootBox:
                        lootBoxType = L"LootBox";
                    case EPickUpBoxType::EPickUpBoxType__EPickUpBoxType_TombBox:
                        lootBoxType = L"TomBOX";
                    case EPickUpBoxType::EPickUpBoxType__EPickUpBoxType_AirDropBox:
                        lootBoxType = L"Airdrop";
                    default:
                        lootBoxType = L"LootBox";
                }
               
                
                //--
                float Distance = PickUpList->GetDistanceTo(localPlayer) / 100.f;
                auto Location = PickUpList->RootComponent->RelativeLocation;
                FVector2D itemPos;
                DrawBox3D(HUD,PickUpList, COLOR_LIME, Location, FVector(26, 42, 15));//draw TomBOX 3d
                if( W2S(Location, &itemPos)){
                    auto Items = PickUpList->GetDataList();
                    for (int i = 0; i < Items.Num(); i++) {
                        auto iditeam = Items[i].ID.TypeSpecificID;
                        std::wstring AR;
                        std::wstring SM;
                        std::wstring SN;
                        std::wstring SH;
                        std::wstring OTH;
                        std::wstring AMMO;
                        std::wstring SCO;
                        std::wstring ARM;
                        std::wstring item;
                        std::wstring airdrop_x;
                        switch (iditeam) {
                            case 101001:
                                AR = std::wstring(L" AKM ");
                                break;
                            case 101002:
                                AR = std::wstring(L" M16A4 ");
                                break;
                            case 101003:
                                AR = std::wstring(L" SCAR-L ");
                                break;
                            case 101004:
                                AR = std::wstring(L" M416 ");
                                break;
                            case 101005:
                                AR= std::wstring(L" Groza ");
                                break;
                            case 101006:
                                AR = std::wstring(L" AUG ");
                                break;
                            case 602002:

                                    AR = std::wstring(L" Smoke ");

                                break;
                            case 602003:

                                    AR = std::wstring(L" Molitove ");

                                break;
                            case 602004:
                                
                                    SM = std::wstring(L" Grenade ");
                                
                                
                                break;
                            case 101007:
                                SM = std::wstring(L" QBZ ");
                                break;
                            case 101008:
                                SM = std::wstring(L" M762 ");
                                break;
                            case 101009:
                                SM = std::wstring(L" Mk47 ");
                                break;
                            case 101010:
                                SM = std::wstring(L" G36C ");
                                break;
                            case 101100:
                                SM = std::wstring(L" FAMAS ");
                                break;
                            case 102001:
                                SM = std::wstring(L" UZI ");
                                break;
                            case 102002:
                                SM = std::wstring(L" UMP45 ");
                                break;
                            case 102003:
                                SM = std::wstring(L" Vector ");
                                break;
                            case 102004:
                                SN = std::wstring(L" TommyGun ");
                                break;
                            case 102005:
                                SN = std::wstring(L" PP-19 Bizon ");
                                break;
                            case 102007:
                                SN = std::wstring(L" Skorpion ");
                                break;
                            case 103001:
                                SN = std::wstring(L" Kar98K ");
                                break;
                            case 103002:
                                SN = std::wstring(L" M24 ");
                                break;
                            case 103003:
                                SN = std::wstring(L" AWM ");
                                break;
                            case 103004:
                                SN = std::wstring(L" SKS ");
                                break;
                            case 103005:
                                SN = std::wstring(L" VSS ");
                                break;
                            case 103006:
                                SN = std::wstring(L" Mini14 ");
                                break;
                            case 103007:
                                SN = std::wstring(L" Mk14 ");
                                break;
                            case 103008:
                                SN = std::wstring(L" Win94 ");
                                break;
                            case 103009:
                                SH = std::wstring(L" SLR ");
                                break;
                            case 103010:
                                SH = std::wstring(L" QBU ");
                                break;
                            case 103011:
                                SH = std::wstring(L" Mosin ");
                                break;
                            case 103012:
                                SH =std::wstring(L"AMR Sniper");
                                break;
                            case 103100:
                                SH = std::wstring(L" Mk12 ");
                                break;
                            case 104001:
                                SH = std::wstring(L" S686 ");
                                break;
                            case 104002:
                                SH = std::wstring(L" S1897 ");
                                break;
                            case 104003:
                                SH = std::wstring(L" S12K ");
                                break;
                            case 104004:
                                SH = std::wstring(L" M1014 ");
                                break;
                            case 106006:
                                SH = std::wstring(L" Sawed-off ");
                                break;
                            case 203001:

                                    OTH = std::wstring(L"Red Dot");
                                
                                break;
                            case 203002:

                                    OTH = std::wstring(L"Holographic");
                                break;
                            case 203003:

                                    OTH = std::wstring(L"2x Scope");
                                    
                                break;
                            case 203004:
                                    OTH = std::wstring(L"4x Scope");

                                break;
                            case 203005:
                                    OTH = std::wstring(L"8x Scope");

                                break;
                            case 203014:

                                    OTH = std::wstring(L"3x Scope");

                                break;
                            case 203015:

                                    OTH = std::wstring(L"6x Scope");
                                break;
                            case 301001:
                                OTH = std::wstring(L" 9mm ");
                                break;
                            case 302001:
                                OTH = std::wstring(L" 7.62mm");
                                break;
                            case 303001:
                                OTH = std::wstring(L" 5.56mm ");
                                break;
                            case 304001:

                                    OTH = std::wstring(L"12 Gauge");

                                break;
                            case 305001:

                                    OTH = std::wstring(L".45 ACP");
                                break;
                            case 306001:

                                    OTH = std::wstring(L".300 Magnum");

                                break;
                            case 307001:

                                    OTH = std::wstring(L"Crossbow");

                                break;
                            case 105001:
                                OTH = std::wstring(L" M249 ");
                                break;
                            case 105002:
                                OTH = std::wstring(L" DP-28 ");
                                break;
                            case 601001:

                                    SCO = std::wstring(L"Soda");

                                break;
                            case 601002:

                                    SCO = std::wstring(L"Pills");

                                break;
                            case 601003:

                                    SCO = std::wstring(L"Adrenaline");

                                break;
                            case 601004:

                                    SCO = std::wstring(L"Bandage");

                                break;
                            case 601005:

                                    SCO = std::wstring(L"First Aid");

                                break;
                            case 601006:

                                    SCO = std::wstring(L"Med kit");

                                break;
                            case 501001:

                                    SCO = std::wstring(L"Bag Lv1");

                                break;
                            case 501002:

                                    SCO = std::wstring(L"Bag Lv2");

                                break;
                            case 501006:
AMMO = std::wstring(L"Bag Lv3");

                                break;
                            case 502001:
AMMO = std::wstring(L"Helmet Lv1");
                                
                                break;
                            case 502002:
                                    AMMO = std::wstring(L"Helmet Lv2");

                                break;
                            case 502003:
                                    AMMO = std::wstring(L"Helmet Lv3");

                                break;
                            case 503001:
                                    AMMO = std::wstring(L"Police Vest(Lv1)");

                                break;
                            case 503002:
                                    AMMO = std::wstring(L"Police Vest(Lv2)");

                                break;
                            case 503003:
                                    AMMO = std::wstring(L"Police Vest(Lv3)");

                                break;
                            default:
                                break;
                        }
                        
                        
                        robotoTinyFont->LegacyFontSize = IteTextSiz, 13 - (int) (Distance / 100);//5
                        float txtWidth, txtHeight;
                        HUD->GetTextSize(FString(AR), robotoTinyFont, 1.f, &txtWidth,
                                          &txtHeight);
                        HUD->GetTextSize(FString(SN), robotoTinyFont, 1.f, &txtWidth,
                                          &txtHeight);
                        HUD->GetTextSize(FString(SH), robotoTinyFont, 1.f, &txtWidth,
                                          &txtHeight);
                        HUD->GetTextSize(FString(SM), robotoTinyFont, 1.f, &txtWidth,
                                          &txtHeight);
                        HUD->GetTextSize(FString(AMMO), robotoTinyFont, 1.f, &txtWidth,
                                          &txtHeight);
                        HUD->GetTextSize(FString(OTH), robotoTinyFont, 1.f, &txtWidth,
                                          &txtHeight);
                        HUD->GetTextSize(FString(SCO), robotoTinyFont, 1.f, &txtWidth,
                                          &txtHeight);
                        itemPos.Y += txtHeight *1.3;
                        visCol.R = 1;
                        visCol.G = 0.3;
                        visCol.B = 0.2;
                        visCol.A = 1.f;
                        DrawSmallOutlinedText(HUD, AR, { itemPos.X,itemPos.Y}, visCol, COLOR_BLACK);
                        visCol.R = 0.3;
                        visCol.G = 1;
                        visCol.B = 0.2;
                        visCol.A = 1.f;
                        DrawSmallOutlinedText(HUD, OTH, { itemPos.X,itemPos.Y}, visCol, COLOR_BLACK);
                        visCol.R = 0.2;
                        visCol.G = 0.3;
                        visCol.B = 1;
                        visCol.A = 1.f;
                        DrawSmallOutlinedText(HUD, SM, { itemPos.X,itemPos.Y}, visCol, COLOR_BLACK);
                        visCol.R = 1.2;
                        visCol.G = 1.5;
                        visCol.B = 0.5;
                        visCol.A = 1.f;
                        DrawSmallOutlinedText(HUD, SN, { itemPos.X,itemPos.Y}, visCol, COLOR_BLACK);
                        visCol.R = 0.2;
                        visCol.G = 0.3;
                        visCol.B = 0.2;
                        visCol.A = 1.f;
                        DrawSmallOutlinedText(HUD, SH, { itemPos.X,itemPos.Y}, visCol, COLOR_BLACK);
                        visCol.R = 1;
                        visCol.G = 1;
                        visCol.B = 1.4;
                        visCol.A = 1.f;
                        DrawSmallOutlinedText(HUD, SCO, { itemPos.X,itemPos.Y}, visCol, COLOR_BLACK);
                        visCol.R = 1.2;
                        visCol.G = 3.3;
                        visCol.B = 3.2;
                        visCol.A = 1.f;
                        DrawSmallOutlinedText(HUD, AMMO, { itemPos.X,itemPos.Y}, visCol, COLOR_BLACK);
                        // next line for text not approved yet - to draw lootbox name
                        DrawSmallOutlinedText(HUD, lootBoxType, { 100.f,100.f}, visCol, COLOR_BLACK);
                    }
                }
            }ItemBase.clear();
        }
        //Airdrop esp
        if(IsAirDrop){
            //(actor->IsA(Classes::ACarePackageItem::StaticClass()))
            //APickUpListWrapperActor->AAirDropListWrapperActor
            std::vector < AAirDropListWrapperActor * >ItemBase;
            GetAllActors(ItemBase);
            for (auto actor = ItemBase.begin(); actor != ItemBase.end(); actor++)
            {
                auto PickUpList = *actor;
                //std::wstring lootType = GetLootName(PickUpList);
                auto RootComponent = PickUpList->RootComponent;
                if (!RootComponent)
                    continue;
                //float Distance = PickUpList->GetDistanceTo(localPlayer) / 100.f;
                auto Location = PickUpList->RootComponent->RelativeLocation;
                FVector2D itemPos;
                //auto LotTypeSTR = "";
                //LotTypeSTR =  GetLootName(PickUpList);
                DrawBox3D(HUD,PickUpList, COLOR_RED, Location, FVector(50, 50, 50));
                
                /*if(PickUpList->BoxType == EPickUpBoxType::EPickUpBoxType__EPickUpBoxType_AirDropBox){
                 DrawBox3D(pHUD,PickUpList, COLOR_LIME, Location, FVector(26, 42, 15));
                 }*/
            }
        }
        {
            std::vector<APickUpWrapperActor*> ITEMM;
            GetAllActors(ITEMM);
            for (auto actor = ITEMM.begin(); actor != ITEMM.end(); actor++) {
                auto PickUp = *actor;
                //if(PickUp->IsA(FAirDropBoxData)){};
                if(PickUp->bIsInAirDropBox){
                    auto Location = PickUp->RootComponent->RelativeLocation;
                    DrawBox3D(HUD,PickUp, COLOR_BLUE, Location, FVector(60, 60, 60));
                };
                auto pp =(PickUp->DefineID.TypeSpecificID);
                if(pp){
                    auto RootComponent = PickUp->RootComponent;
                    if (!RootComponent ||PickUp->bHidden)
                        continue;
                    float Distance = PickUp->GetDistanceTo(localPlayer) / 100.f;
                    FVector2D itemPos;
                    if (Distance > 2 && Distance <= 50) {
                        if(gGameplayStatics->ProjectWorldToScreen(localPlayerController, PickUp->K2_GetActorLocation(), true, &itemPos)){
                            std::wstring AR;
                            std::wstring SM;
                            std::wstring SN;
                            std::wstring SH;
                            std::wstring OTH;
                            std::wstring AMMO;
                            std::wstring SCO;
                            std::wstring ARM;
                            std::wstring item;
                            if(IsITM){
                            if(IsAR){
                                switch (pp) {
                                    case 101001://need to be translate
                                        AR = std::wstring(L" AKM ");
                                        break;
                                    case 101002:
                                        AR = std::wstring(L" M16A4 ");
                                        break;
                                    case 101003:
                                        AR = std::wstring(L" SCAR-L ");
                                        break;
                                    case 101004:
                                        AR = std::wstring(L" M416 ");
                                        break;
                                    case 101005:
                                        AR= std::wstring(L" Groza ");
                                        break;
                                    case 101006:
                                        AR = std::wstring(L" AUG ");
                                        break;
                                    case 602002:
                                        
                                            AR = std::wstring(L" Smoke ");

                                        
                                        break;
                                    case 602003:
                                        
                                            AR = std::wstring(L" Molitove ");

                                        break;
                                    case 602004:
                                        
                                            AR = std::wstring(L" Grenade ");

                                        
                                        break;
                                    case 101007:
                                        AR = std::wstring(L" QBZ ");
                                        break;
                                    case 101008:
                                        AR = std::wstring(L" M762 ");
                                        break;
                                    case 101009:
                                        AR = std::wstring(L" Mk47 ");
                                        break;
                                    case 101010:
                                        AR = std::wstring(L" G36C ");
                                        break;
                                    case 101100:
                                        AR = std::wstring(L" FAMAS ");
                                        break;
                                    default:
                                        break;
                                }
                                visCol.R = 1.f;
                                visCol.G = 1.4f;
                                visCol.B = 0.5f;
                                visCol.A = 1.f;
                                robotoTinyFont->LegacyFontSize = IteTextSiz, 13 - (int) (Distance / 100);//5
                                DrawSmallOutlinedText(HUD, AR, { itemPos.X,itemPos.Y}, visCol, COLOR_BLACK);
                            }
                        }
                            if(IsSMG){
                                switch (pp) {
                                    case 102001:
                                        SM = std::wstring(L" UZI ");
                                        break;
                                    case 102002:
                                        SM = std::wstring(L" UMP45 ");
                                        break;
                                    case 102003:
                                        SM = std::wstring(L" Vector ");
                                        break;
                                    case 102004:
                                        SM = std::wstring(L" TommyGun ");
                                        break;
                                    case 102005:
                                        SM = std::wstring(L" PP-19 Bizon ");
                                        break;
                                    case 102007:
                                        SM = std::wstring(L" Skorpion ");
                                        break;
                                    default:
                                        break;
                                }
                                robotoTinyFont->LegacyFontSize = IteTextSiz, 13 - (int) (Distance / 100);//5
                                visCol.R = 1;
                                visCol.G = 0.3;
                                visCol.B = 0.2;
                                visCol.A = 1.f;
                                DrawSmallOutlinedText(HUD, SM, { itemPos.X,itemPos.Y}, visCol, COLOR_BLACK);
                            }
                            if(IsSniper){
                                switch (pp) {
                                    case 103001:
                                        SN = std::wstring(L" Kar98K ");
                                        break;
                                    case 103002:
                                        SN = std::wstring(L" M24 ");
                                        break;
                                    case 103003:
                                        SN = std::wstring(L" AWM ");
                                        break;
                                    case 103004:
                                        SN = std::wstring(L" SKS ");
                                        break;
                                    case 103005:
                                        SN = std::wstring(L" VSS ");
                                        break;
                                    case 103006:
                                        SN = std::wstring(L" Mini14 ");
                                        break;
                                    case 103007:
                                        SN = std::wstring(L" Mk14 ");
                                        break;
                                    case 103008:
                                        SN = std::wstring(L" Win94 ");
                                        break;
                                    case 103009:
                                        SN = std::wstring(L" SLR ");
                                        break;
                                    case 103010:
                                        SN = std::wstring(L" QBU ");
                                        break;
                                    case 103011:
                                        SN = std::wstring(L" Mosin ");
                                        break;
                                    case 103012:
                                        SN =std::wstring(L"AMR Sniper");
                                        break;
                                    default:
                                        break;
                                }
                                robotoTinyFont->LegacyFontSize = IteTextSiz, 13 - (int) (Distance / 100);//5
                                visCol.R = 0.9f;
                                visCol.G = 2.8f;
                                visCol.B = 0.7f;
                                visCol.A = 1;
                                DrawSmallOutlinedText(HUD, SN, { itemPos.X,itemPos.Y}, visCol, COLOR_BLACK);
                            }
                            if(IsShotgun){
                                switch (pp) {
                                    case 103100:
                                        SH = std::wstring(L" Mk12 ");
                                        break;
                                    case 104001:
                                        SH = std::wstring(L" S686 ");
                                        break;
                                    case 104002:
                                        SH = std::wstring(L" S1897 ");
                                        break;
                                    case 104003:
                                        SH = std::wstring(L" S12K ");
                                        break;
                                    case 104004:
                                        SH = std::wstring(L" M1014 ");
                                        break;
                                    case 106006:
                                        SH = std::wstring(L" Sawed-off ");
                                        break;
                                    default:
                                        break;
                                }
                                robotoTinyFont->LegacyFontSize = IteTextSiz, 13 - (int) (Distance / 100);//5
                                visCol.R = 1;
                                visCol.G = 1.3;
                                visCol.B = 0.4;
                                visCol.A = 1;
                                DrawSmallOutlinedText(HUD, SH, { itemPos.X,itemPos.Y}, visCol, COLOR_BLACK);
                            }
                            if(IsShotgun){
                                switch (pp) {
                                    case 106001:
                                        item = std::wstring(L" P1911 ");
                                        break;
                                    case 106003:
                                        item = std::wstring(L" R1895 ");
                                        break;
                                    case 106004:
                                        item = std::wstring(L" P18C ");
                                        break;
                                    case 106005:
                                        item = std::wstring(L" R45 ");
                                        break;
                                    case 106008:
                                        item = std::wstring(L" Vz61 ");
                                        break;
                                    case 106010:
                                        item = std::wstring(L" Desert Eagle ");
                                        break;
                                    default:
                                        break;
                                }
                                robotoTinyFont->LegacyFontSize = IteTextSiz, 13 - (int) (Distance / 100);//5
                                visCol.R = 0.98f;
                                visCol.G = 1;
                                visCol.B = 1;
                                visCol.A = 1;
                                DrawSmallOutlinedText(HUD, item, { itemPos.X,itemPos.Y}, visCol, COLOR_BLACK);
                            }
                            if(IsShotgun){
                                switch (pp) {
                                    case 203001:

                                            SCO = std::wstring(L"Red Dot");

                                        break;
                                    case 203002:
                                        
                                            SCO = std::wstring(L"Holographic");
                                        break;
                                    case 203003:
                                            SCO = std::wstring(L"2x Scope");

                                        break;
                                    case 203004:

                                            SCO = std::wstring(L"4x Scope");

                                        break;
                                    case 203005:

                                            SCO = std::wstring(L"8x Scope");

                                        break;
                                    case 203014:
                                            SCO = std::wstring(L"3x Scope");

                                        break;
                                    case 203015:
                                            SCO = std::wstring(L"6x Scope");
                                        break;
                                    default:
                                        break;
                                }
                                robotoTinyFont->LegacyFontSize = IteTextSiz, 13 - (int) (Distance / 100);//5
                                visCol.R = 1;
                                visCol.G = 0.2;
                                visCol.B = 0.4;
                                visCol.A = 1;
                                DrawSmallOutlinedText(HUD, SCO, { itemPos.X,itemPos.Y}, visCol, COLOR_BLACK);
                            }
                            if(IsAmmo){
                                switch (pp) {
                                    case 301001:
                                        AMMO = std::wstring(L" 9mm ");
                                        break;
                                    case 302001:
                                        AMMO = std::wstring(L" 7.62mm");
                                        break;
                                    case 303001:
                                        AMMO = std::wstring(L" 5.56mm ");
                                        break;
                                    case 304001:

                                            AMMO = std::wstring(L"12 Gauge");

                                        break;
                                    case 305001:
                                            AMMO = std::wstring(L".45 ACP");
                                        break;
                                    case 306001:

                                            AMMO = std::wstring(L".300 Magnum");

                                        break;
                                    case 307001:

                                            AMMO = std::wstring(L"Crossbow");

                                        break;
                                    default:
                                        break;
                                }
                                robotoTinyFont->LegacyFontSize = IteTextSiz, 13 - (int) (Distance / 100);//5
                                visCol.R = 1.63;
                                visCol.G = 1.43;
                                visCol.B = 2;
                                visCol.A = 1;
                                DrawSmallOutlinedText(HUD, AMMO, { itemPos.X,itemPos.Y}, visCol, COLOR_BLACK);
                            }
                            if(IsShotgun){
                                switch (pp) {
                                    case 105001:
                                        
                                            OTH = std::wstring(L"M249");

                                        break;
                                    case 105002:

                                            OTH = std::wstring(L"DP-28");
                                        
                                        
                                        break;
                                    case 107001:

                                            OTH = std::wstring(L"Crossbow");

                                        
                                        break;
                                    case 108001:

                                            OTH = std::wstring(L"Machete");

                                        
                                        break;
                                    case 108002:
                                        
                                            OTH = std::wstring(L"Crowbar");

                                        
                                        break;
                                    case 108003:

                                            OTH = std::wstring(L"Sickle");

                                        break;
                                    case 108004:
                                            OTH = std::wstring(L"Pan");

                                        break;
                                    case 201001:

                                            OTH = std::wstring(L"Choke");

                                        break;
                                        //         ATTCHMENT
                                    case 201002:
                                            OTH = std::wstring(L"Compensator (AR)");

                                        break;
                                    case 201003:

                                            OTH = std::wstring(L"Muzzle Brake (DMR)");

                                        break;
                                    case 201004:

                                            OTH = std::wstring(L"Flash Hider (Pistol)");

                                        break;
                                    case 201005:
                                        
                                            OTH = std::wstring(L"Flash Hider (DMR)");

                                        // ---
                                        break;
                                    case 201006:

                                            OTH = std::wstring(L"Suppressor (SMG)");
                                        
                                        
                                        break;
                                    case 201007:

                                            OTH = std::wstring(L"Suppressor (Snipers)");

                                        break;
                                    case 201009:
                                        
                                            OTH = std::wstring(L"Compensator (AR) ");

                                        break;
                                    case 201010:

                                            OTH = std::wstring(L"Flash Hider (AR)");

                                        break;
                                    case 201011:

                                            OTH = std::wstring(L"Suppressor (AR) ");

                                        break;
                                    case 201012:

                                            OTH = std::wstring(L"Duckbill");//

                                        break;
                                    case 202001:
                                            OTH = std::wstring(L"Angled Foregrip (AR)");

                                        break;
                                    case 202002:

                                            OTH = std::wstring(L"Vertical Foregrip");

                                        break;
                                    case 202004:

                                            OTH = std::wstring(L"Light Grip");

                                        break;
                                    case 202005:
                                        
                                            OTH = std::wstring(L"Half Grip");

                                        break;
                                    case 202006:

                                            OTH = std::wstring(L"Thumb Grip");

                                        break;
                                    case 202007:
                                            OTH = std::wstring(L"Laser Sight");

                                        break;
                                        //         SCOPE
                                        //         ATTCHMENT
                                    case 203018:

                                            OTH = std::wstring(L"Canted Sight");

                                        break;
                                    case 204014:
                                        
                                            OTH = std::wstring(L"Bullet Loop");
                                        
                                        break;
                                    case 205001:

                                            OTH = std::wstring(L"Stock (Micro UZI)");

                                        break;
                                    case 205002:
                                            OTH = std::wstring(L"Tactical Stock (Rifles, SMG)");

                                        break;
                                    case 205003:
                                            OTH = std::wstring(L"Cheek Pad (Snipers)");

                                        break;
                                    case 205004:
                                            OTH = std::wstring(L"Quiver (Crossbow)");

                                        break;
                                    case 204004:
                                       
                                            OTH = std::wstring(L"Extended Mag (SMG, Pistols)");

                                        break;
                                    case 204005:
                                            OTH = std::wstring(L"Quickdraw Mag (SMG, Pistols)");

                                        break;
                                    case 204006:
                                            OTH = std::wstring(L"Extended Quickdraw Mag (SMG, Pistols)");

                                        break;
                                    case 204007:
                                            OTH = std::wstring(L"Extended Mag (Snipers)");

                                        break;
                                    case 204008:

                                            OTH = std::wstring(L"Quickdraw Mag (Snipers)");

                                        break;
                                    case 204009:
                                        
                                            OTH = std::wstring(L"Extended Quickdraw Mag (Snipers)");
                                        
                                        break;
                                    case 204011:

                                            OTH = std::wstring(L"Extended Quickdraw Mag (AR) ");

                                        break;
                                    case 204012:

                                            OTH = std::wstring(L"Quickdraw Mag (AR)");

                                        break;
                                    case 204013:
                                            OTH = std::wstring(L"Extended Quickdraw Mag (AR)");

                                        break;
                                        //         AMMO
                                    case 601001:

                                            OTH = std::wstring(L"Energy Drink");

                                        break;
                                    case 601002:
                                            OTH = std::wstring(L"Syringe");
                                        
                                        break;
                                    case 601003:
                                            OTH = std::wstring(L"Painkiller");

                                        break;
                                    case 601004:
                                            OTH = std::wstring(L"Bandage");

                                        break;
                                    case 601005:
                                            OTH = std::wstring(L"First Aid Kit");
                                        
                                        break;
                                    case 601006:
                                            OTH = std::wstring(L"Med Kit");

                                        break;
                                    default:
                                        break;
                                }
                                robotoTinyFont->LegacyFontSize = IteTextSiz, 13 - (int) (Distance / 100);//5
                                visCol.R = 0.2;
                                visCol.G = 1;
                                visCol.B = 0.7;
                                visCol.A = 1;
                                DrawSmallOutlinedText(HUD, OTH, { itemPos.X,itemPos.Y}, visCol, COLOR_BLACK);
                            }
                            if(IsShotgun){                                
                                    switch (pp) {
                                        case 501001:
                                            ARM = std::wstring(L" Backpack (Lv. 1) ");
                                            break;
                                        case 501002:
                                            ARM = std::wstring(L" Backpack (Lv. 2) ");
                                            break;
                                        case 501006:
                                            ARM = std::wstring(L" Backpack (Lv. 3) ");
                                            break;
                                        case 502001:
                                            ARM = std::wstring(L" Helmet LV1 ");
                                            break;
                                        case 502002:
                                            ARM = std::wstring(L" Helmet LV2");
                                            break;
                                        case 502003:
                                            ARM = std::wstring(L" Helmet LV3 ");
                                            
                                            break;
                                        case 503001:
                                            ARM = std::wstring(L"Armor LV1 ");
                                            break;
                                        case 503002:
                                            ARM = std::wstring(L"Armor LV2 ");
                                            break;
                                        case 503003:
                                            ARM = std::wstring(L"Armor LV3 ");
                                            break;
                                        default:
                                            break;
                                    }

                               
                                robotoTinyFont->LegacyFontSize = IteTextSiz, 13 - (int) (Distance / 100);//5
                                DrawSmallOutlinedText(HUD, ARM, { itemPos.X,itemPos.Y}, COLOR_LIME, COLOR_BLACK);
                            }
                        }
                    }
                }
            }ITEMM.clear();
        }
        {
            std::vector<ASTExtraVehicleBase*> ITS;
            GetAllActors(ITS);
            for (auto actor = ITS.begin(); actor != ITS.end(); actor++) {
                auto Vehicle = *actor;
                if (!Vehicle->Mesh)
                    continue;
                auto vv = Vehicle->VehicleShapeType;
                float Distance = Vehicle->GetDistanceTo(localPlayer) / 100.f;
                FVector2D vehiclePos;
                auto ROOT  =Vehicle->K2_GetActorLocation();
                ROOT.Z -=50;
                if (Distance > 10 && Distance <= 600) {
                    if (gGameplayStatics->ProjectWorldToScreen(localPlayerController,ROOT, true, &vehiclePos)) {
                        std::wstring veh;
                        switch (vv) {
                            case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_Motorbike:
                            case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_Motorbike_SideCart:
                                
                                    veh = std::wstring(L"Motorbike");

                                break;
                            case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_Dacia:
                            case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_HeavyDacia:

                                    veh = std::wstring(L"Dacia");

                                break;
                            case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_MiniBus:

                                    veh = std::wstring(L"MiniBus");

                                break;
                            case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_PickUp:
                            case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_PickUp01:
                            case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_HeavyPickup:
                                
                                    veh = std::wstring(L"PickUp");

                                break;
                            case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_Buggy:
                            case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_HeavyBuggy:
                                
                                    veh = std::wstring(L"Buggy");

                                break;
                            case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_UAZ:
                            case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_UAZ01:
                            case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_UAZ02:
                            case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_UAZ03:
                            case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_HeavyUAZ:

                                    veh = std::wstring(L"UAZ");

                                break;
                            case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_PG117:

                                    veh = std::wstring(L"Watercraft PG117");
                                
                                break;
                            case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_Aquarail:

                                    veh = std::wstring(L"Aquarail");

                                
                                break;
                            case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_Mirado:

                                    veh = std::wstring(L"Mirado");

                                
                            case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_Mirado01:

                                    veh = std::wstring(L"Mirado");
                                
                                break;
                            case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_Rony:
                                
                                    veh = std::wstring(L"Rony pickup");

                                break;
                            case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_Scooter:
                                
                                    veh = std::wstring(L"Scooter");

                                
                                break;
                            case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_SnowMobile:

                                    veh = std::wstring(L"SnowMobile");

                                break;
                            case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_TukTukTuk:

                                    veh = std::wstring(L"TukTuk");

                                break;
                            case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_SnowBike:

                                    veh = std::wstring(L"SnowBike");

                                
                                break;
                            case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_Surfboard:

                                    veh = std::wstring(L"Surfboard");

                                
                                break;
                            case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_Snowboard:
                                
                                    veh = std::wstring(L"Snowboard");
                                
                                break;
                            case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_Amphibious:

                                    veh = std::wstring(L"Amphibious");
                                
                                break;
                            case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_LadaNiva:

                                    veh = std::wstring(L"Lada Niva");
                                
                                break;
                            case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_UAV:

                                    veh = std::wstring(L"Drone");
                                
                                break;
                            case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_MegaDrop:
                                
                                    veh = std::wstring(L"MegaDrop");
                                
                                break;
                            case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_Lamborghini:

                                    veh = std::wstring(L"Lamborghini");
                                
                            case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_Lamborghini01:
                                
                                    veh = std::wstring(L"Lamborghini 01");
                                
                                break;
                            case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_GoldMirado:

                                    veh = std::wstring(L"GoldMirado");

                                
                                break;
                            case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_BigFoot:

                                    veh = std::wstring(L"BigFoot");
                                
                                break;
                            case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_UH60:

                                    veh = std::wstring(L"Helicopter UH60");
                                
                            case ESTExtraVehicleShapeType::ESTExtraVehicleShapeType__VST_HeavyUH60:
                                
                                    veh = std::wstring(L"Helicopter Heavy-UH60");
                                break;
                            default:

                                    veh = std::wstring(L"");
                                break;
                        }
                        veh += std::wstring(L" [");
                        veh += std::to_wstring((int) Distance);
                        veh += std::wstring(L"m]");
                        if(IsVehcle){
                            visCol.A =1.f;
                            visCol.B =0.6f;
                            visCol.G =0.8f;
                            visCol.R =1.f;
                            tslFont->LegacyFontSize = max(3, 14 - (int) (Distance / 100));
                            DrawSmallOutlinedText(HUD, veh, { vehiclePos.X,vehiclePos.Y}, visCol, COLOR_BLACK);
                        }
                        if(IsboxVechle){
                            FVector Bounds, b2;
                            Bounds = CHUTIA(Vehicle);
                            Vehicle->GetActorBounds(true, &Bounds, &b2);
                            DrawBox3D(HUD, Vehicle, allColors::LightGoldenrodYellow, Bounds, b2);
                        }
                        auto vhebase = Vehicle->VehicleCommon;
                        float CurHP = std::max(0.f, std::min(vhebase->HP, vhebase->HPMax));
                        float CurFEL = std::max(0.f, std::min(vhebase->Fuel, vhebase->FuelMax));
                        float MAXHEL = vhebase->HPMax;
                        float MaxFEL = vhebase->FuelMax;
                        FLinearColor ColorFEL = {
                            std::min(((310.f * (MaxFEL - CurFEL)) / MaxFEL) / 155.f, 3.f),
                            std::min(((310.f * CurFEL) / MaxFEL) / 155.f, 3.f),
                            0.f,
                            0.5f
                        };
                        FLinearColor ColorHP = {
                            std::min(((510.f * (MAXHEL - CurHP)) / MAXHEL) / 255.f, 1.f),
                            std::min(((510.f * CurHP) / MAXHEL) / 255.f, 1.f),
                            0.f,
                            0.5f
                        };
                        auto AboveHead = Vehicle->K2_GetActorLocation();
                        AboveHead.Z += 60;
                        FVector2D AboveHeadSc;
                        if (gGameplayStatics->ProjectWorldToScreen(localPlayerController,AboveHead, true, &AboveHeadSc))  {
                            auto mWidthScale = std::min(0.1f * Distance, 12.f);
                            auto mWidth = 75.f - mWidthScale;
                            auto mHeight = mWidth * 0.175f;
                            AboveHeadSc.X -= (mWidth / 2);
                            AboveHeadSc.Y -= (mHeight * 1.5f);
                            visCol.A=1.0f;
                            visCol.B=0.5f;
                            visCol.G=1.2f;
                            visCol.R =1.f;
                            if(IsCarHP){
                                tslFont->LegacyFontSize = max(2, 12 - (int) (Distance / 100));
                                DrawFilledRectangle(HUD, {AboveHeadSc.X, AboveHeadSc.Y}, (CurHP * mWidth / MAXHEL ), 6, ColorHP);
                                DrawRectangle(HUD, {AboveHeadSc.X, AboveHeadSc.Y}, mWidth, 6, 1.0f, {0, 0, 0, 1.f});
                            }
                            if(IsCarFuel){
                                AboveHeadSc.Y -=20;
                                tslFont->LegacyFontSize = max(2, 12 - (int) (Distance / 100));
                                DrawFilledRectangle(HUD, {AboveHeadSc.X, AboveHeadSc.Y}, (CurFEL * mWidth / MaxFEL), 6, visCol);
                                DrawRectangle(HUD, {AboveHeadSc.X, AboveHeadSc.Y}, mWidth, 6, 1.0f, {0, 0, 0, 1.f});
                            }
                        }
                    }
                }
            }ITS.clear();
        }
                g_LocalPlayer = localPlayer;
                g_PlayerController = localPlayerController;
            }
        }
    }



    //from NSString to wstring
    std::wstring NStoWS ( NSString* Str )
    {
        NSStringEncoding pEncode    =   CFStringConvertEncodingToNSStringEncoding ( kCFStringEncodingUTF32LE );
        NSData* pSData              =   [ Str dataUsingEncoding : pEncode ];
        return std::wstring ( (wchar_t*) [ pSData bytes ], [ pSData length] / sizeof ( wchar_t ) );
    }
    //from wstring to NSString
    NSString* WStoNS ( const std::wstring& Str )
    {
        NSString* pString = [ [ NSString alloc ]
                              initWithBytes : (char*)Str.data()
                              length : Str.size() * sizeof(wchar_t)
                              encoding : CFStringConvertEncodingToNSStringEncoding ( kCFStringEncodingUTF32LE ) ];
        return pString;
    }
void fixesp(AHUD *pHUD, void *pArgs){
    auto Params = (AHUD_ReceiveDrawHUD_Params *) pArgs;
    g_screenWidth = Params->SizeX;
    g_screenHeight = Params->SizeY;
    if(Config.ESPMenu.ESPON){
        RenderESP(pHUD, Params->SizeX, Params->SizeY);
       
    }
}    
    void *(*oProcessEvent)(UObject *pObj, UFunction *pFunc, void *pArgs);
    void *hkProcessEvent(UObject *pObj, UFunction *pFunc, void *pArgs) {
        if (pFunc) {
            if (pFunc->GetFullName() == ("Function Engine.HUD.ReceiveDrawHUD") ){
                AHUD *pHUD = (AHUD *) pObj;
                if (pHUD) {
                    auto Params = (AHUD_ReceiveDrawHUD_Params *) pArgs;
                    if (Params) {
                        RenderESP(pHUD, Params->SizeX, Params->SizeY);
                      screenWidth = Params->SizeX;
                     screenHeight = Params->SizeY;
                    }
                }
            }
        }

        return oProcessEvent(pObj, pFunc, pArgs);
    }


    void  *RTL_language(){
        
        auto MAIN =(FUObjectArray *) (obbbbl());
        auto gobjects = MAIN->ObjObjects;
        for (int i=0;i< gobjects.Num(); i++)
            if (auto obj = gobjects.GetByIndex(i)) {
                
                if(obj->IsA(AHUD::StaticClass())) {
                    auto HUD = (AHUD *) obj;
                    int its = 76;
                    auto VTable = (void**)HUD->VTable;
                    if (VTable && ( VTable[its] != hkProcessEvent)) {
                        oProcessEvent = decltype(oProcessEvent)(VTable[its]);
                        VTable[its] = (void *) hkProcessEvent;
                    }
                }
              if(obj->IsA(ASTExtraPlayerController::StaticClass())) {
                    auto HUD = (ASTExtraPlayerController *) obj;
                    int its = 76;
                    auto VTable = (void**)HUD->VTable;
                    if (VTable && ( VTable[its] != hkProcessEvent)) {
                        oProcessEvent = decltype(oProcessEvent)(VTable[its]);
                        VTable[its] = (void *) hkProcessEvent;
                    }
                }
            }
        return 0;
    }

#define hook GaYSSS9aAL


#define hook GaYSSS9aAL



+ (void)load
{
        FName::GNames = GetGNames();
    while (!FName::GNames) {
        FName::GNames = GetGNames();
          sleep(1);
    }
    
    
    UObject::GUObjectArray = (FUObjectArray *) (obbbbl());
    
    while (!UObject::GUObjectArray) {
    UObject::GUObjectArray = (FUObjectArray *) (obbbbl());
          sleep(1);
    }

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5* NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

    
        //start load but not means language
          [self load1];
        
    });
}
+ (void)load1
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        RTL_language();
    });
}
__attribute__((constructor)) void _init() {
    pthread_t t;
    
  //  pthread_create(&t, 0, bypass_thread, 0);
  //  pthread_create(&t, 0, box_thread, 0);
}


@end

