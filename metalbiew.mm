#import "metalbiew.h"
#import "mahoa.h"
#import "PUBG/模块/UserInfoManager.h"
#import "PUBG/模块/音乐.h"
#include "sys/mman.h"
#include "Tools.h"
#import <AVFoundation/AVFoundation.h>
#include "JRMemory.framework/Headers/MemScan.h"
#include <stdio.h>
#import "PUBG/Image/Icon.h"
#include <stdint.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#include "Icon.h"
#include "Iconcpp.h"
#include "ico_font.h"
#include <string>
#include <stdio.h>
#include <string.h>
#include "Vector3.hpp"
#include "Vector2.hpp"
//#include "PUBG/过残页/过缺页.h"
//#include "PUBG/过残页/dobby.h"
#import <Foundation/Foundation.h>
#import "UE4.h"
//#import "../API/APIClient.h"
#import "PUBG/呼出菜单/PubgLoad.h"
#include "imgui_notify.h"
#import "jijia.h"
//#import "../PatchNonJB/PatchNonJB.h"
#define PATCH_LIB
#define HOOK_LIB


#define kWidth  [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height
#define timer(sec) dispatch_after(dispatch_time(DISPATCH_TIME_NOW, sec * NSEC _PER_SEC), dispatch_get_main_queue(), ^
NSString *xrpb = NSSENCRYPT("Paste Key...");

#define E(str) _xor_(str).c_str()


#define iPhone8P ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)


@interface metalbiew () <MTKViewDelegate>
@property (nonatomic, strong) IBOutlet MTKView *mtkView;
@property (nonatomic, strong) id <MTLDevice> device;
@property (nonatomic, strong) id <MTLCommandQueue> commandQueue;

@end

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
bool anti1 =false;
bool anti2 =false;
bool 人数显示 =false;
bool 小黑点 =false;
bool MAD血条 =false;
bool 无后 =false;
bool 微加速 =false;
bool msdmax = false;
int msdmaxValue = 300;
int judianvalue = 0;
bool 辅助准心 =false;

bool giamgiat = false;

bool init1 = false;
bool init2 = false;
bool init3 = false;
bool init4 = false;
bool init5 = false;
bool WideView = false;
int WideValue = 120;
bool 人物旋转 = false;
bool 射线2 = false;
bool DrawGuns = false;
bool 枪械变大 = false;
bool 路飞 = false;
bool 快速跳伞 = false;
bool 暴力载具 = false;
bool 加速 = false;
bool 聚点 = false;
bool 过移速异常 = false;
bool 下雪 = false;
bool 下雨 = false;
bool X特效 = false;
bool 子弹信息 = false;
bool IsAutofire = false;
float RecoilCP = 0.8f;
static float RadarX =[[NSUserDefaults standardUserDefaults] floatForKey:@"RadarX"];
static float BackSize =[[NSUserDefaults standardUserDefaults] floatForKey:@"BackSize"];
static float RadarY =[[NSUserDefaults standardUserDefaults] floatForKey:@"RadarY"];
static float RadarSize =[[NSUserDefaults standardUserDefaults] floatForKey:@"RadarSize"];
static float Aimsmooth =[[NSUserDefaults standardUserDefaults] floatForKey:@"Aimsmooth"];
static float AimRecc =[[NSUserDefaults standardUserDefaults] floatForKey:@"AimRecc"];
static bool 雷达预警1 = [[NSUserDefaults standardUserDefaults] boolForKey:@"雷达预警1"];
static bool 动态圈 = [[NSUserDefaults standardUserDefaults] boolForKey:@"动态圈"];
static bool 自描圈 = [[NSUserDefaults standardUserDefaults] boolForKey:@"自描圈"];
static bool 瞄准线 = [[NSUserDefaults standardUserDefaults] boolForKey:@"瞄准线"];
static bool Enable = [[NSUserDefaults standardUserDefaults] boolForKey:@"Enable"];
static bool 坐标追 = [[NSUserDefaults standardUserDefaults] boolForKey:@"坐标追"];
static bool AimBot = [[NSUserDefaults standardUserDefaults] boolForKey:@"AimBot"];
static bool VisCheck = [[NSUserDefaults standardUserDefaults] boolForKey:@"VisCheck"];
static bool IgnoreBot = [[NSUserDefaults standardUserDefaults] boolForKey:@"IgnoreBot"];
static bool IgnoreKnocked = [[NSUserDefaults standardUserDefaults] boolForKey:@"IgnoreKnocked"];
static bool 忽略人机 = [[NSUserDefaults standardUserDefaults] boolForKey:@"忽略人机"];
static bool thongtin = [[NSUserDefaults standardUserDefaults] boolForKey:@"thongtin"];
static bool Alert = [[NSUserDefaults standardUserDefaults] boolForKey:@"Alert"];
static bool Weapon = [[NSUserDefaults standardUserDefaults] boolForKey:@"Weapon"];
static bool Skeleton = [[NSUserDefaults standardUserDefaults] boolForKey:@"Skeleton"];
static bool Name = [[NSUserDefaults standardUserDefaults] boolForKey:@"Name"];
static bool Box = [[NSUserDefaults standardUserDefaults] boolForKey:@"Box"];
static bool Line = [[NSUserDefaults standardUserDefaults] boolForKey:@"Line"];
static bool Health = [[NSUserDefaults standardUserDefaults] boolForKey:@"Health"];
static bool Distance = [[NSUserDefaults standardUserDefaults] boolForKey:@"Distance"];
static bool 血条1 = [[NSUserDefaults standardUserDefaults] boolForKey:@"血条1"];
static bool 血条2 = [[NSUserDefaults standardUserDefaults] boolForKey:@"血条2"];
static bool 手雷预警 = [[NSUserDefaults standardUserDefaults] boolForKey:@"手雷预警"];
static bool 箱子 = [[NSUserDefaults standardUserDefaults] boolForKey:@"箱子"];
bool 流畅;
//bool ESPON = true;
bool 快速射击 = false;
bool kqzm =false;


bool spView = false;
static float 追踪状态 = 1.0f;
static int ZdMax; //弹匣子弹最大数
static int ZdDq;//弹匣当前子弹剩余数量
float 物资距离 = 50;
//float BackSize = 120;
//float RadarX = 275;
//float RadarY = 355;
//float RadarSize = 282;
int 旋转速度 = 120;
int skill = 1;
int Gun_Size = 2.5;
float DanceValue = 0; 
float DancerValue = 20;

uintptr_t UE4;
kaddr module= (unsigned long)Get_module_base();
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
int 瞄准部位;
          int AimF = 3;//瞄准方式
          int AimL = 1;//瞄准部位
}

enum EAimTarget {
    Head = 0,
    Chest = 1
};

enum EAimTrigger {
    None = 0,
    Shooting = 1,
    Scoping = 2,
    Both = 3,
    Any = 4
};


long l1 = 0xFF544;
long l2 = 0xFFFFF;
//const char * stack230 = 0;//index of class array 75
int stack_20;
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
            bool 车辆显示;
            bool TeamID;
            bool Vehicle;
            bool IgnoreBot;
            bool xiayu;
            bool xiax;
            bool LootBox;
            bool Throwables;
        };
        sESPMenu ESPMenu{false};

        
    };
    sConfig Config{false};
//
struct JsonPreferences {
enum EAimTarget {
        Head = 0,
        Chest = 1
    };

    enum EAimTrigger {
        None = 0,
        Shooting = 1,
        Scoping = 2,
        Both = 3,
        Any = 4
    };

    enum EAimPriority {
        DistancePriority = 0,
        FOVPriority = 1
    };
    
    
int xsuit = 0;
int skinm4 = 0;
int skinakm = 0;
int para = 0;
int bag = 0;
int helmet = 0;
bool CoupeRB = false;
bool Dacia = false;
bool UAZ = false;
bool MiniBus = false;
bool BigFoot = false;
bool Boat = false;
bool Mirado = false;
bool Buggy = false;
bool OMirado = false;
bool Moto = false;
bool Emote = false;
bool Helmett = false;
bool Bagg = false;
bool Face = false;
bool Outfit = false;
bool Parachute = false;
bool M416 = false;
bool M4168 = true;
bool M4169 = true;
bool M4161 = true;
bool M4162 = true;
bool M4163 = true;
bool M4164 = true;
bool AKM = false;
bool AKM1 = true;
bool AKM2 = true;
bool AKM3 = true;
bool AKM4 = true;
bool AKM5 = true;
bool AKM6 = true;
bool MK14 = false;
bool MK145 = true;
bool MK146 = true;
bool MK147 = true;
bool MK148 = true;
bool MK149 = true;
bool MK140 = true;
bool mg31 = true;
bool mg32 = true;
bool mg33 = true;
bool mg34 = true;
bool mg35 = true;
bool mg36 = true;
bool P90 = false;
bool P901 = true;
bool P902 = true;
bool P903 = true;
bool P904 = true;
bool P905 = true;
bool P906 = true;
bool SCARL = false;
bool SCARL1 = true;
bool SCARL2 = true;
bool SCARL3 = true;
bool SCARL4 = true;
bool SCARL5 = true;
bool SCARL6 = true;
bool M762 = false;
bool M7621 = true;
bool M7622 = true;
bool M7623 = true;
bool M7624 = true;
bool M7625 = true;
bool M7626 = true;
bool AWM = false;
bool AWM1 = true;
bool AWM2 = true;
bool AWM3 = true;
bool AWM4 = true;
bool AWM5 = true;
bool AWM6 = true;
bool KAR98 = false;
bool KAR981 = true;
bool KAR982 = true;
bool KAR983 = true;
bool KAR984 = true;
bool KAR985 = true;
bool KAR986 = true;
bool M24 = false;
bool M241 = true;
bool M242 = true;
bool M243 = true;
bool M244 = true;
bool M245 = true;
bool M246 = true;
bool M16 = false;
bool M161 = true;
bool M162 = true;
bool M163 = true;
bool M164 = true;
bool M165 = true;
bool M166 = true;
bool M249 = false;
bool M2491 = true;
bool M2492 = true;
bool M2493 = true;
bool M2494 = true;
bool M2495 = true;
bool M2496 = true;
bool MG3 = false;
bool DP28 = false;
bool DP281 = true;
bool DP282 = true;
bool DP283 = true;
bool DP284 = true;
bool DP285 = true;
bool DP286 = true;
bool GROZA = false;
bool GROZA1 = true;
bool GROZA2 = true;
bool GROZA3 = true;
bool GROZA4 = true;
bool GROZA5 = true;
bool GROZA6 = true;
bool AUG = false;
bool AUG1 = true;
bool AUG2 = true;
bool AUG3 = true;
bool AUG4 = true;
bool AUG5 = true;
bool AUG6 = true;
bool PAN = false;
bool UZI = false;
bool UZI1 = true;
bool UZI2 = true;
bool UZI3 = true;
bool UZI4 = true;
bool UZI5 = true;
bool UZI6 = true;
bool UMP = false;
bool UMP1 = true;
bool UMP2 = true;
bool UMP3 = true;
bool UMP4 = true;
bool UMP5 = true;
bool UMP6 = true;
bool TOMMY = false;
bool BIZON = false;
bool ACE32 = false;
bool ACE321 = true;
bool ACE322 = true;
bool ACE323 = true;
bool ACE324 = true;
bool ACE325 = true;
bool ACE326 = true;
bool VECTOR = false;

    struct sConfig {
         struct sAimMenu {
            bool EnableAllHack;
            //bool Enable;
            bool 坐标追;

            bool 瞄准部位;
            bool kqzm;
            bool FOV;
            //bool Fov;
            bool Autofire;
            //bool AimBot;
            //bool AimBot1;
            bool AimL;
            bool AimF;
            bool CameraCache;
            EAimTarget Target;
            EAimTrigger Trigger;
            EAimPriority Priority;
            bool xiayu;
            bool xiax;
            bool Prediction;
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
  bool HitEffect = 0;
  bool KillMessage = 0;
  bool DeadBox = 0;
  int XSuits = 1;
  int AKM = 1;
  int AKM1 = 1;
  int AKM2 = 1;
  int AKM3 = 1;
  int AKM4 = 1;
  int AKM5 = 1;
  int AKM6 = 1;
  int M16A4 = 1;
  int M16A41 = 1;
  int M16A42 = 1;
  int M16A43 = 1;
  int M16A44 = 1;
  int M16A45 = 1;
  int M16A46 = 1;
  int Scar = 1;
  int Scar1 = 1;
  int Scar2 = 1;
  int Scar3 = 1;
  int Scar4 = 1;
  int Scar5 = 1;
  int Scar6 = 1;
  int M416 = 1;
  int M4168 = 1;
  int M4169 = 1;
  int M4161 = 1;
  int M4162 = 1;
  int M4163 = 1;
  int M4164 = 1;
  int Groza = 1;
  int Groza1 = 1;
  int Groza2 = 1;
  int Groza3 = 1;
  int Groza4 = 1;
  int Groza5 = 1;
  int Groza6 = 1;
  int AUG = 1;
  int AUG1 = 1;
  int AUG2 = 1;
  int AUG3 = 1;
  int AUG4 = 1;
  int AUG5 = 1;
  int AUG6 = 1;
  int QBZ = 1;
  int M762 = 1;
  int M7621 = 1;
  int M7622 = 1;
  int M7623 = 1;
  int M7624 = 1;
  int M7625 = 1;
  int M7626 = 1;
  int ACE32 = 1;
  int ACE321 = 1;
  int ACE322 = 1;
  int ACE323 = 1;
  int ACE324 = 1;
  int ACE325 = 1;
  int ACE326 = 1;
  int Parachute = 1;
  int UZI = 1;
  int UZI1 = 1;
  int UZI2 = 1;
  int UZI3 = 1;
  int UZI4 = 1;
  int UZI5 = 1;
  int UZI6 = 1;
  int UMP = 1;
  int UMP1 = 1;
  int UMP2 = 1;
  int UMP3 = 1;
  int UMP4 = 1;
  int UMP5 = 1;
  int UMP6 = 1;
  int Vector = 1;
  int Thompson = 1;
  int Bizon = 1;
  int MK145 = 1;
  int MK14 = 1;
  int MK146 = 1;
  int MK147 = 1;
  int MK148 = 1;
  int MK149 = 1;
  int MK140 = 1;
  int mg31 = 1;
  int mg32 = 1;
  int mg33 = 1;
  int mg34 = 1;
  int mg35 = 1;
  int mg36 = 1;
  int P90 = 1;
  int P901 = 1;
  int P902 = 1;
  int P903 = 1;
  int P904 = 1;
  int P905 = 1;
  int P906 = 1;
  int K98 = 1;
  int K981 = 1;
  int K982 = 1;
  int K983 = 1;
  int K984 = 1;
  int K985 = 1;
  int K986 = 1;
  int M24 = 1;
  int M241 = 1;
  int M242 = 1;
  int M243 = 1;
  int M244 = 1;
  int M245 = 1;
  int M246 = 1;
  int AWM = 1;
  int AWM1 = 1;
  int AWM2 = 1;
  int AWM3 = 1;
  int AWM4 = 1;
  int AWM5 = 1;
  int AWM6 = 1;
  int DP28 = 1;
  int DP281 = 1;
  int DP282 = 1;
  int DP283 = 1;
  int DP284 = 1;
  int DP285 = 1;
  int DP286 = 1;
  int M249 = 1;
  int M2491 = 1;
  int M2492 = 1;
  int M2493 = 1;
  int M2494 = 1;
  int M2495 = 1;
  int M2496 = 1;
  int MG3 = 1;
  int Pan = 1;
  int Moto = 1;
  int CoupeRP = 1;
  int UAZ = 1;
  int Dacia = 1;
  int Bigfoot = 1;
  int Mirado = 1;
  int OMirado = 1;
  int Buggy = 1;
  int MiniBus = 1;
  int Boat = 1;
};
sModSkin Skin{false};
        
    };
    sConfig Config{false};

} preferences;
static int helmett3 = 1;
static int bag3 = 1;
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
//extern float FovRadousVal;
UISlider * aimspeed;//aimbot speed
CGSize AutoFireCircelSize;// CGSizeMake(w, h);
bool IsAirDrop = false;
int Interval = 1;
int counter;
int iAwareTexSiz = 20;
bool iAwareText = true;
int EspTextSiz = 4;
float EspBoxThik = 2.0f;
float EspSktonThik = 1.5f;
float IsfovSlider = 150.0f;
float AimSmooth = 5.0f;
bool AimTouch = false;
bool antibypass = false;
//UISlider * Aimbot2;
//aimbot bool
float g_disstance = 150.f;


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
int COLOR;
int scc;


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

static int loaixe = 0;
static int xedacia = 0;
bool modxe = false;
bool tamnho = false;

//hiệu ứng bắn
bool effectm44 = false;

float dorong = 88.0f;
//float Aimsmooth = 1.2f;
//float AimRecc= 0.4f;
float Xs=2.4,Ys=2.4;
float IsDistance = 68;
/*
float add() // circle radius size
{
   // if(FovRadousVal==0){
    float FovRadousVal = 230;
    
    return FovRadousVal;
}
*/

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
@implementation metalbiew
bool MenDeal;







- (MTKView *)mtkView
{
    return (MTKView *)self.view;
}


- (void)loadView
{
    self.view = [[MTKView alloc] initWithFrame:CGRectMake(0, 0, kWidth, kHeight)];
}

- (void)viewDidLoad {
    
    
    [super viewDidLoad];
    
    self.mtkView.device = self.device;
    self.mtkView.delegate = self;
    self.mtkView.clearColor = MTLClearColorMake(0, 0, 0, 0);
    self.mtkView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
    self.mtkView.clipsToBounds = YES;

    
    
}


- (instancetype)initWithNibName:(nullable NSString *)nibNameOrNil bundle:(nullable NSBundle *)nibBundleOrNil
{
    
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    _device = MTLCreateSystemDefaultDevice();
    _commandQueue = [_device newCommandQueue];
    if (!self.device) abort();
    
    IMGUI_CHECKVERSION();
ImGui::CreateContext();
    ImGuiIO& io = ImGui::GetIO(); (void)io;

ImGuiStyle& style = ImGui::GetStyle();
style.WindowRounding = 7.0f; // 窗口圆角
style.FrameRounding = 2.0f; // 框架圆角
style.ScrollbarRounding = 8;
style.WindowBorderSize = 0.5f; // UI边框厚度
style.FrameBorderSize = 1.0f; // 按键边宽厚度
style.ChildRounding = 7.0f;//内UI线圆角

style.WindowPadding = ImVec2(6, 8);
style.FramePadding = ImVec2(4, 2);

//文本
style.Colors[ImGuiCol_Text] = ImColor(255, 255, 255, 255);
style.Colors[ImGuiCol_TextDisabled] = ImVec4(0.36f, 0.42f, 0.47f, 1.00f);

//背景
style.Colors[ImGuiCol_WindowBg] = ImColor(0, 0, 29.5, 130);
//ImColor(32, 24, 48, 185);

//选项颜色
style.Colors[ImGuiCol_PopupBg] = ImColor(45, 50, 85, 170);

//边框线颜色
style.Colors[ImGuiCol_Border] = ImColor(0, 0, 29.5, 130);

//边框线颜色
style.Colors[ImGuiCol_BorderShadow] = ImColor(0, 0, 29.5, 130);

//绘制框里面的颜色
style.Colors[ImGuiCol_FrameBg] = ImColor(0, 0, 0, 255);
style.Colors[ImGuiCol_FrameBgHovered] = ImColor(0, 0, 0, 255);
style.Colors[ImGuiCol_FrameBgActive] = ImColor(0, 0, 0, 255);

//名字标题
style.Colors[ImGuiCol_TitleBg] = ImColor(0, 0, 29.5, 130);
style.Colors[ImGuiCol_TitleBgCollapsed] = ImColor(0, 0, 29.5, 130);
style.Colors[ImGuiCol_TitleBgActive] = ImColor(0, 0, 29.5, 130);

//不清楚
style.Colors[ImGuiCol_MenuBarBg] = ImColor(0, 0, 29.5, 130);

//拉轮颜色
style.Colors[ImGuiCol_ScrollbarBg] = ImColor(0, 0, 29.5, 130);
style.Colors[ImGuiCol_ScrollbarGrab] = ImColor(75, 75, 75, 150);
style.Colors[ImGuiCol_ScrollbarGrabHovered] = ImColor(75, 75, 75, 150);
style.Colors[ImGuiCol_ScrollbarGrabActive] = ImColor(0, 0, 29.5, 130);

//勾选颜色
style.Colors[ImGuiCol_CheckMark] = ImVec4(0.28f, 0.56f, 1.00f, 1.00f);

//拉条不动颜色
style.Colors[ImGuiCol_SliderGrab] = ImColor(124, 64, 38, 200);
style.Colors[ImGuiCol_SliderGrabActive] = ImColor(124, 64, 38, 200);

//tg上面的线条颜色
style.Colors[ImGuiCol_Separator]             = ImColor(255, 255, 255, 255);
style.Colors[ImGuiCol_SeparatorActive]       = ImColor(255, 255, 255, 255);
style.Colors[ImGuiCol_SeparatorHovered]      = ImColor(255, 255, 255, 255);

//按键
style.Colors[ImGuiCol_Button] = ImColor(26, 26, 26, 255);
style.Colors[ImGuiCol_ButtonHovered] = ImColor(48, 90, 162, 180);
style.Colors[ImGuiCol_ButtonActive] = ImColor(48, 90, 162, 180);

//选项选择后出现的颜色
style.Colors[ImGuiCol_Header] = ImColor(24, 25, 25, 255);
style.Colors[ImGuiCol_HeaderHovered] = ImColor(24, 25, 25, 255);
style.Colors[ImGuiCol_HeaderActive] = ImColor(24, 25, 25, 255);

//右边拉长段UI
style.Colors[ImGuiCol_ResizeGrip] = ImColor(48, 90, 162, 180);
style.Colors[ImGuiCol_ResizeGripHovered] = ImColor(48, 90, 162, 180);
style.Colors[ImGuiCol_ResizeGripActive] = ImColor(48, 90, 162, 180);

//不清楚看不见
style.Colors[ImGuiCol_PlotLines] = ImColor(0, 0, 29.5, 130);
style.Colors[ImGuiCol_PlotLinesHovered] = ImColor(0, 0, 29.5, 130);
style.Colors[ImGuiCol_PlotHistogram] = ImColor(0, 0, 29.5, 130);
style.Colors[ImGuiCol_PlotHistogramHovered] = ImColor(0, 0, 29.5, 130);

//几乎看不见
style.Colors[ImGuiCol_TextSelectedBg] = ImColor(0, 0, 0, 255);
       style.Alpha = 1.0f;
    ImFontConfig font_cfg;
    font_cfg.FontDataOwnedByAtlas = false;

//io.Fonts->AddFontFromMemoryTTF((void *)Fontdata, Fontsize, 14.0f, NULL,
  io.Fonts->AddFontFromMemoryTTF((void *)jijia_data, jijia_size, 15.0f, NULL,
        io.Fonts->GetGlyphRangesChineseFull());

  

    // Initialize notify
    ImGui::MergeIconsWithLatestFont(12.f, false);
    ImGui_ImplMetal_Init(_device);
    
    return self;
}


ImVec4 to_vec4(float r, float g, float b, float a)
    {
        return ImVec4(r / 255.0, g / 255.0, b / 255.0, a / 255.0);
    }
static auto start = std::chrono::steady_clock::now();
static auto noww = std::chrono::high_resolution_clock::now();
auto elapsedd = std::chrono::duration_cast<std::chrono::milliseconds>(noww - start).count();
namespace Settings
{
    static int Tab = 0;
}
int newUAZID = 0;
int lastUAZID = 0;
int newDaciaID = 0;
int lastDaciaID = 0;
int newCoupeID = 0;
int lastCoupeID = 0;
struct snew_Skin {
  int XSuits = 403003;
  int XSuits1 = 40604002;
  int Balo1 = 501001;
  int Balo2 = 501002;
  int Balo3 = 501003;
  int Balo4 = 501004;
  int Balo5 = 501005;
  int Balo6 = 501006;
  int Helmet1 = 502001;
  int Helmet2 = 502002;
  int Helmet3 = 502003;
  int Helmet4 = 502004;
  int Helmet5 = 502005;

  int Helmet6 = 502114;
  int Helmet7 = 502115;
  int Helmet8 = 502116;
  int Parachute = 703001;

  int AKM = 101001;
  int AKM1 = 1010012;
  int AKM2 = 1010013;
  int AKM3 = 1010014;
  int AKM4 = 1010015;
  int AKM5 = 1010016;
  int AKM6 = 1010017;
  int AKM_Mag = 291001;
  int M16A4 = 101002;
  int M16A41 = 1010022;
  int M16A42 = 1010023;
  int M16A43 = 1010024;
  int M16A44 = 1010025;
  int M16A45 = 1010026;
  int M16A46 = 1010027;
  int M16A4_Stock = 205007;
  int M16A4_Mag = 291002;
  int Scar = 101003;
  int Scar1 = 1010032;
  int Scar2 = 1010033;
  int Scar3 = 1010034;
  int Scar4 = 1010035;
  int Scar5 = 1010036;
  int Scar6 = 1010037;
  int Scar_Mag = 291003;
  int Pan = 108004;

  int longyin_x6666 = 203015;
  int longyin_x8888 = 203005;
  int longyin_x1111 = 203001;
  int longyin_x2222 = 203008;
  int longyin_x3333 = 203014;
  int longyin_x4444 = 203004;
  int tuosb = 205003;
  int tuosb1 = 2050032;
  int tuosb2 = 2050033;
  int tuosb3 = 2050034;
  int tuosb4 = 2050035;


  int M4a = 203004;
  int M4b = 202002;
  int M416_1 = 101004;
  int M4168 = 1010042;
  int M4169 = 1010043;
  int M4161 = 1010044;
  int M4162 = 1010045;
  int M4163 = 1010046;
  int M4164 = 1010047;
  int M416_2 = 291004;
  int M416_3 = 203008;
  int M416_4 = 205005;
  int M416_flash = 201010;
  int M416_compe = 201009;
  int M416_silent = 201011;
  int M416_reddot = 203001;
  int M416_holo = 203002;
  int M416_x2 = 203003;
  int M416_x3 = 203014;
  int M416_x4 = 203004;
  int M416_x6 = 203015;
  int M416_quickMag = 204012;
  int M416_extendedMag = 204011;
  int M416_quickNextended = 204013;
  int M416_stock = 205002;
  int M416_stock2 = 2050022;
  int M416_stock3 = 2050023;
  int M416_stock4 = 2050024;
  int M416_stock5 = 2050025;
  int M416_verical = 203015;
  int M416_angle = 202001;
  int M416_lightgrip = 202004;
  int M416_pink = 202005;
  int M416_lazer = 202007;
  int M416_thumb = 202006;

  int Groza = 101005;
  int Groza1 = 1010052;
  int Groza2 = 1010053;
  int Groza3 = 1010054;
  int Groza4 = 1010055;
  int Groza5 = 1010056;
  int Groza6 = 1010057;
  int MK145 = 1030075;
  int MK146 = 1030074;
  int MK147 = 1030072;
  int MK148 = 1030073;
  int MK149 = 1030076;
  int MK140 = 1030077;
  int mg31 = 1050105;
  int mg32 = 1050106;
  int mg33 = 1050107;
  int mg34 = 1050102;
  int mg35 = 1050103;
  int mg36 = 1050104;
  int QBZ = 101007;
  int AUG = 101006;
  int AUG1 = 1010062;
  int AUG2 = 1010063;
  int AUG3 = 1010064;
  int AUG4 = 1010065;
  int AUG5 = 1010066;
  int AUG6 = 1010067;
  int M762 = 101008;
  int M7621 = 1010082;
  int M7622 = 1010083;
  int M7623 = 1010084;
  int M7624 = 1010085;
  int M7625 = 1010086;
  int M7626 = 1010087;
  int M762_Mag = 291008;
  int ACE32 = 101102;
  int ACE321 = 1011022;
  int ACE322 = 1011023;
  int ACE323 = 1011024;
  int ACE324 = 1011025;
  int ACE325 = 1011026;
  int ACE326 = 1011027;
  int Honey = 101012;
  int UZI = 102001;
  int UZI1 = 1020012;
  int UZI2 = 1020013;
  int UZI3 = 1020014;
  int UZI4 = 1020015;
  int UZI5 = 1020016;
  int UZI6 = 1020017;
  int UMP = 102002;
  int UMP1 = 1020022;
  int UMP2 = 1020023;
  int UMP3 = 1020024;
  int UMP4 = 1020025;
  int UMP5 = 1020026;
  int UMP6 = 1020027;
  int Vector = 102003;
  int Thompson = 102004;
  int Bizon = 102005;
  int K98 = 103001;
  int K981 = 1030012;
  int K982 = 1030013;
  int K983 = 1030014;
  int K984 = 1030015;
  int K985 = 1030016;
  int K986 = 1030017;
  int M24 = 103002;
  int M241 = 1030022;
  int M242 = 1030023;
  int M243 = 1030024;
  int M244 = 1030025;
  int M245 = 1030026;
  int M246 = 1030027;
  int AWM = 103003;
  int AWM1 = 1030032;
  int AWM2 = 1030033;
  int AWM3 = 1030034;
  int AWM4 = 1030035;
  int AWM5 = 1030036;
  int AWM6 = 1030037;
  int AMR = 103012;
  int VSS = 103005;
  int SKS = 103004;
  int Mini14 = 103006;
  int MK14 = 103007;
  int SLR = 103009;
  int S1897 = 104002;
  int DP28 = 105002;
  int DP281 = 1050022;
  int DP282 = 1050023;
  int DP283 = 1050024;
  int DP284 = 1050025;
  int DP285 = 1050026;
  int DP286 = 1050027;
  int M249 = 105001;
  int M2491 = 1050012;
  int M2492 = 1050013;
  int M2493 = 1050014;
  int M2494 = 1050015;
  int M2495 = 1050016;
  int M2496 = 1050017;
  int MG3 = 105010;
  int P90 = 102105;
  int P901 = 1021052;
  int P902 = 1021053;
  int P903 = 1021054;
  int P904 = 1021055;
  int P905 = 1021056;
  int P906 = 1021057;
  int Skorpion = 106008;
  int Moto = 1901001;
  int CoupeRP = 1961001;
  int Dacia = 1903001;
  int UAZ = 1908001;
  int Bigfoot = 1953001;
  int Mirado = 1914004;
  int OMirado = 1915001;
  int Buggy = 1907001;
  int MiniBus = 1904001;
  int Boat = 1911001;
  int M249s = 205009;
};

inline snew_Skin new_Skin;



std::chrono::steady_clock::time_point lastChangeTime;
std::chrono::steady_clock::time_point lastWeaponChangeTime;

void updateSkin() {
if (preferences.bag == 1)
                    bag3 = 1501003058; //blood raven x suit
                    if (preferences.bag == 2)
                    bag3 = 1501003554; //Golden Pharaoh X-Suit
                    if (preferences.bag == 3)
                    bag3 = 1501003261; //Avalanche
                    if (preferences.bag == 4)
                    bag3 = 1501003053; //Irresidence
                    if (preferences.bag == 5)
                    bag3 = 1501003276; //Poseidon
                    if (preferences.bag == 6)
                    bag3 = 1501003487; //Arcane Jester X-suit
                    if (preferences.bag == 7)
                    bag3 = 1501003277; //Silvanus X-Suit
                    if (preferences.bag == 8)
                    bag3 = 1501003550;
                    if (preferences.bag == 9)
                    bag3 = 1501003550;
                    if (preferences.xsuit == 10)
                    bag3 = 0;
                    if (preferences.xsuit == 11)
                    bag3 = 0;
                    if (preferences.xsuit == 12)//todo
                    bag3 = 0;
                    //Helmet
                    if (preferences.helmet == 1)
                    helmett3 = 1502003014; //blood raven x suit
                    if (preferences.helmet == 2)
                    helmett3 = 1502003028; //Golden Pharaoh X-Suit
                    if (preferences.helmet == 3)
                    helmett3 = 1502003023; //Avalanche
                    if (preferences.helmet == 4)
                    helmett3 = 1501002443; //Irresidence
                    if (preferences.helmet == 5)
                    helmett3 = 1502003031; //Poseidon
                    if (preferences.helmet == 6)
                    helmett3 = 1502003033; //Arcane Jester X-suit
                    if (preferences.helmet == 7)
                    helmett3 = 1502003069; //Silvanus X-Suit
                    if (preferences.helmet == 8)
                    helmett3 = 1502003069;
                    if (preferences.helmet == 8)
                    helmett3 = 1502003261;
                    if (preferences.xsuit == 10)
                    helmett3 = 0;
                    if (preferences.xsuit == 11)
                    helmett3 = 0;
                    if (preferences.xsuit == 12)//todo
                    helmett3 = 0;
                    
if (ModEmote1 == 0)
sEmote1 = 2200101;
if (ModEmote1 == 1)
sEmote1 = 12220023;
if (ModEmote1 == 2)
sEmote1 = 12219677;
if (ModEmote1 == 3)
sEmote1 = 12219716;
if (ModEmote1 == 4)
sEmote1 = 12209401;
if (ModEmote1 == 5)
sEmote1 = 12209501;
if (ModEmote1 == 6)
sEmote1 = 12209701;
if (ModEmote1 == 7)
sEmote1 = 12209801;
if (ModEmote1 == 8)
sEmote1 = 12209901;


if (ModEmote1 == 0)
sEmote2 = 2200201;
if (ModEmote1 == 1)
sEmote2 = 12210201;
if (ModEmote1 == 2)
sEmote2 = 12210601;
if (ModEmote1 == 3)
sEmote2 = 12220028;
if (ModEmote1 == 4)
sEmote2 = 12219819;
if (ModEmote1 == 5)
sEmote2 = 12211801;
if (ModEmote1 == 6)
sEmote2 = 12212001;
if (ModEmote1 == 7)
sEmote2 = 12212201;
if (ModEmote1 == 8)
sEmote2 = 12212401;


if (ModEmote1 == 0)
sEmote3 = 2200301;
if (ModEmote1 == 1)
sEmote3 = 12212601;
if (ModEmote1 == 2)
sEmote3 = 12213201;
if (ModEmote1 == 3)
sEmote3 = 12219715;
if (ModEmote1 == 4)
sEmote3 = 12219814;
if (ModEmote1 == 5)
sEmote3 = 12213601;
if (ModEmote1 == 6)
sEmote3 = 12213801;
if (ModEmote1 == 7)
sEmote3 = 12214001;
if (ModEmote1 == 8)
sEmote3 = 12214201;



  if (preferences.Config.Skin.Parachute == 0)
    new_Skin.Parachute = 703001;
  if (preferences.Config.Skin.Parachute == 16)
    new_Skin.Parachute = 1401619; //Pharaoh's Scarab Parachute
  if (preferences.Config.Skin.Parachute == 1)
    new_Skin.Parachute = 1401619; //Pharaoh's Scarab Parachute
  if (preferences.Config.Skin.Parachute == 2)
    new_Skin.Parachute = 1401625; // Enigmatic Nomad Parachute
  if (preferences.Config.Skin.Parachute == 3)
    new_Skin.Parachute = 1401624; //parashot Parachute
  if (preferences.Config.Skin.Parachute == 4)
    new_Skin.Parachute = 1401836; //Paperfold Gambit Parachute
  if (preferences.Config.Skin.Parachute == 5)
    new_Skin.Parachute = 1401833; //Labyrinth Beast Parachute
  if (preferences.Config.Skin.Parachute == 6)
    new_Skin.Parachute = 1401287; //Flamewraith Parachute
  if (preferences.Config.Skin.Parachute == 7)
    new_Skin.Parachute = 1401282; //Mega Kitty Parachute
  if (preferences.Config.Skin.Parachute == 8)
    new_Skin.Parachute = 1401385; //Mega Yeti Parachute
  if (preferences.Config.Skin.Parachute == 9)
    new_Skin.Parachute = 1401549; //Endless Glory Parachute
  if (preferences.Config.Skin.Parachute == 10)
    new_Skin.Parachute = 1401336; //Magma Skull Parachute
  if (preferences.Config.Skin.Parachute == 11)
    new_Skin.Parachute = 1401335; //Aquatic Fury Parachute
  if (preferences.Config.Skin.Parachute == 12)
    new_Skin.Parachute = 1401629; //CyberGen: Zero Parachute
  if (preferences.Config.Skin.Parachute == 13)
    new_Skin.Parachute = 1401628; //Radiant Phoenix Adarna Parachute
  if (preferences.Config.Skin.Parachute == 14)
    new_Skin.Parachute = 1401615; //Will of Horus
  if (preferences.Config.Skin.Parachute == 15)
    new_Skin.Parachute = 1401613; //Anubian Magistrate Parachute

  if (preferences.Config.Skin.Pan == 0)
    new_Skin.Pan = 108004; // 108004 - Pan
  if (preferences.Config.Skin.Pan == 1)
    new_Skin.Pan = 1108004125; // Honeypot - Pan
  if (preferences.Config.Skin.Pan == 2)
    new_Skin.Pan = 1108004145; // Night of Rock - Pan
  if (preferences.Config.Skin.Pan == 3)
    new_Skin.Pan = 1108004160; // Crocodile - Pan
  if (preferences.Config.Skin.Pan == 4)
    new_Skin.Pan = 1108004283; // Accolade - Pan
  if (preferences.Config.Skin.Pan == 5)
    new_Skin.Pan = 1108004337; // Break Pad - Pan
  if (preferences.Config.Skin.Pan == 6)
    new_Skin.Pan = 1108004356; // Chicken Hot - Pan
  if (preferences.Config.Skin.Pan == 7)
    new_Skin.Pan = 1108004365; // Faerie Luster - Pan
  if (preferences.Config.Skin.Pan == 8)
    new_Skin.Pan = 1108004054; // Chicken Hot - Pan
  if (preferences.Config.Skin.Pan == 9)
    new_Skin.Pan = 1108004008;
    
    
  if (preferences.Config.Skin.XSuits == 0) {
    new_Skin.XSuits = 403003;
    new_Skin.XSuits1 = 40604002;
  }
  if (preferences.Config.Skin.XSuits == 1) {
    new_Skin.XSuits = 1405628;
    new_Skin.XSuits1 = 1402578;
  }
  if (preferences.Config.Skin.XSuits == 2) {
    new_Skin.XSuits = 1405870;
    new_Skin.XSuits1 = 1403257;
  }
  if (preferences.Config.Skin.XSuits == 3) {
    new_Skin.XSuits = 1405983;
    new_Skin.XSuits1 = 1402874;
  }
  if (preferences.Config.Skin.XSuits == 4) {
    new_Skin.XSuits = 1406152;
    new_Skin.XSuits1 = 1403393;
  }
  if (preferences.Config.Skin.XSuits == 5) {
    new_Skin.XSuits = 1406311;
    new_Skin.XSuits1 = 1410011; //Mặt nạ 1.403.414
  }
  if (preferences.Config.Skin.XSuits == 6) {
    new_Skin.XSuits = 1406475;
    new_Skin.XSuits1 = 1410131;
  }
  if (preferences.Config.Skin.XSuits == 7) {
    new_Skin.XSuits = 1406638;
    new_Skin.XSuits1 = 1410242;
  }
  if (preferences.Config.Skin.XSuits == 8) {
    new_Skin.XSuits = 1406872;
    //new_Skin.XSuits1 = 1410346; // khung
    new_Skin.XSuits1 = 402133;
  }
  if (preferences.Config.Skin.XSuits == 9) {
    new_Skin.XSuits = 1406971;
    new_Skin.XSuits1 = 402147;
  }
  if (preferences.Config.Skin.XSuits == 10) {
    new_Skin.XSuits = 1407103;
    new_Skin.XSuits1 = 40604002;
  }
  if (preferences.Config.Skin.XSuits == 11) {
    new_Skin.XSuits = 1406387;
  }
  if (preferences.Config.Skin.XSuits == 12) {
    new_Skin.XSuits = 1407195;
  }
if (preferences.Config.Skin.XSuits == 13) {
    new_Skin.XSuits = 1406891;
  }
  if (preferences.Config.Skin.XSuits == 14) {
    new_Skin.XSuits = 1400687;
  }
  if (preferences.Config.Skin.XSuits == 15) {
    new_Skin.XSuits = 1405623;
  }
  if (preferences.Config.Skin.XSuits == 16) {
    new_Skin.XSuits = 1406937;
  }
  if (preferences.Config.Skin.XSuits == 17) {
    new_Skin.XSuits = 1406327;
  }
  
  if (preferences.Config.Skin.XSuits == 18) {
    new_Skin.XSuits = 1406244;
  }
  if (preferences.Config.Skin.XSuits == 19) {
    new_Skin.XSuits = 1406140;
  }
  if (preferences.Config.Skin.XSuits == 20) {
    new_Skin.XSuits = 1406439;
  }
  if (preferences.Config.Skin.XSuits == 21) {
    new_Skin.XSuits = 1407277;
  }
  if (preferences.Config.Skin.XSuits == 22) {
    new_Skin.XSuits = 1404049;
  }
  if (preferences.Config.Skin.XSuits == 23) {
    new_Skin.XSuits = 1407160;
  }
  if (preferences.Config.Skin.XSuits == 24) {
    new_Skin.XSuits = 1407049;
  }
  if (preferences.Config.Skin.XSuits == 25) {
    new_Skin.XSuits = 1406388;
  }
  if (preferences.Config.Skin.XSuits == 26) {
    new_Skin.XSuits = 1407225;
  }
  if (preferences.Config.Skin.XSuits == 27) {
    new_Skin.XSuits = 1407079;
  }
  if (preferences.Config.Skin.XSuits == 28) {
    new_Skin.XSuits = 1407188;
  }
  if (preferences.Config.Skin.XSuits == 29) {
    new_Skin.XSuits = 1405163;
  }
  if (preferences.Config.Skin.XSuits == 30) {
    new_Skin.XSuits = 1407276;
  }
  if (preferences.Config.Skin.XSuits == 31) {
    new_Skin.XSuits = 1407275;
  }
  if (preferences.Config.Skin.XSuits == 32) {
    new_Skin.XSuits = 1405436;
  }
  if (preferences.Config.Skin.XSuits == 33) {
    new_Skin.XSuits = 1407366;
  }

  if (preferences.Config.Skin.AKM == 0) {
    new_Skin.AKM = 101001;
    new_Skin.AKM_Mag = 205005;
  }
  if (preferences.Config.Skin.AKM == 1) {
    new_Skin.AKM = 1101001249;
    new_Skin.AKM_Mag = 1010012444;
  }
  if (preferences.Config.Skin.AKM == 2) {
    new_Skin.AKM = 1101001103;
    new_Skin.AKM_Mag = 1010011031;
  }
  if (preferences.Config.Skin.AKM == 3) {
    new_Skin.AKM = 1101001116;
    new_Skin.AKM_Mag = 1010011161;
  }
  if (preferences.Config.Skin.AKM == 4) {
    new_Skin.AKM = 1101001128;
    new_Skin.AKM_Mag = 1010011281;
  }
  if (preferences.Config.Skin.AKM == 5) {
    new_Skin.AKM = 1101001143;
    new_Skin.AKM_Mag = 1010011431;
  }
  if (preferences.Config.Skin.AKM == 6) {
    new_Skin.AKM = 1101001154;
    new_Skin.AKM_Mag = 1010011541;
  }
  if (preferences.Config.Skin.AKM == 7) {
    new_Skin.AKM = 1101001174;
    new_Skin.AKM_Mag = 1010011741;
  }
  if (preferences.Config.Skin.AKM == 8) {
    new_Skin.AKM = 1101001213;
    new_Skin.AKM_Mag = 1010012131;
  }
  if (preferences.Config.Skin.AKM == 9) {
    new_Skin.AKM = 1101001231;
    new_Skin.AKM_Mag = 1010012311;
  }
  if (preferences.Config.Skin.AKM == 10) {
    new_Skin.AKM = 1101001242;
    new_Skin.AKM_Mag = 1010012421;
  }
  ////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.AKM == 0) {
    new_Skin.AKM1 = 1010012;
    new_Skin.AKM_Mag = 205005;
  }
  if (preferences.Config.Skin.AKM == 1) {
    new_Skin.AKM1 = 1101001249;
    new_Skin.AKM_Mag = 1010012444;
  }
  if (preferences.Config.Skin.AKM == 2) {
    new_Skin.AKM1 = 1101001103;
    new_Skin.AKM_Mag = 1010011031;
  }
  if (preferences.Config.Skin.AKM == 3) {
    new_Skin.AKM1 = 1101001116;
    new_Skin.AKM_Mag = 1010011161;
  }
  if (preferences.Config.Skin.AKM == 4) {
    new_Skin.AKM1 = 1101001128;
    new_Skin.AKM_Mag = 1010011281;
  }
  if (preferences.Config.Skin.AKM == 5) {
    new_Skin.AKM1 = 1101001143;
    new_Skin.AKM_Mag = 1010011431;
  }
  if (preferences.Config.Skin.AKM == 6) {
    new_Skin.AKM1 = 1101001154;
    new_Skin.AKM_Mag = 1010011541;
  }
  if (preferences.Config.Skin.AKM == 7) {
    new_Skin.AKM1 = 1101001174;
    new_Skin.AKM_Mag = 1010011741;
  }
  if (preferences.Config.Skin.AKM == 8) {
    new_Skin.AKM1 = 1101001213;
    new_Skin.AKM_Mag = 1010012131;
  }
  if (preferences.Config.Skin.AKM == 9) {
    new_Skin.AKM1 = 1101001231;
    new_Skin.AKM_Mag = 1010012311;
  }
  if (preferences.Config.Skin.AKM == 10) {
    new_Skin.AKM1 = 1101001242;
    new_Skin.AKM_Mag = 1010012421;
  }
  ////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.AKM == 0) {
    new_Skin.AKM2 = 1010013;
    new_Skin.AKM_Mag = 205005;
  }
  if (preferences.Config.Skin.AKM == 1) {
    new_Skin.AKM2 = 1101001249;
    new_Skin.AKM_Mag = 1010012444;
  }
  if (preferences.Config.Skin.AKM == 2) {
    new_Skin.AKM2 = 1101001103;
    new_Skin.AKM_Mag = 1010011031;
  }
  if (preferences.Config.Skin.AKM == 3) {
    new_Skin.AKM2 = 1101001116;
    new_Skin.AKM_Mag = 1010011161;
  }
  if (preferences.Config.Skin.AKM == 4) {
    new_Skin.AKM2 = 1101001128;
    new_Skin.AKM_Mag = 1010011281;
  }
  if (preferences.Config.Skin.AKM == 5) {
    new_Skin.AKM2 = 1101001143;
    new_Skin.AKM_Mag = 1010011431;
  }
  if (preferences.Config.Skin.AKM == 6) {
    new_Skin.AKM2 = 1101001154;
    new_Skin.AKM_Mag = 1010011541;
  }
  if (preferences.Config.Skin.AKM == 7) {
    new_Skin.AKM2 = 1101001174;
    new_Skin.AKM_Mag = 1010011741;
  }
  if (preferences.Config.Skin.AKM == 8) {
    new_Skin.AKM2 = 1101001213;
    new_Skin.AKM_Mag = 1010012131;
  }
  if (preferences.Config.Skin.AKM == 9) {
    new_Skin.AKM2 = 1101001231;
    new_Skin.AKM_Mag = 1010012311;
  }
  if (preferences.Config.Skin.AKM == 10) {
    new_Skin.AKM2 = 1101001242;
    new_Skin.AKM_Mag = 1010012421;
  }
  ////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.AKM == 0) {
    new_Skin.AKM3 = 1010014;
    new_Skin.AKM_Mag = 205005;
  }
  if (preferences.Config.Skin.AKM == 1) {
    new_Skin.AKM3 = 1101001249;
    new_Skin.AKM_Mag = 1010012444;
  }
  if (preferences.Config.Skin.AKM == 2) {
    new_Skin.AKM3 = 1101001103;
    new_Skin.AKM_Mag = 1010011031;
  }
  if (preferences.Config.Skin.AKM == 3) {
    new_Skin.AKM3 = 1101001116;
    new_Skin.AKM_Mag = 1010011161;
  }
  if (preferences.Config.Skin.AKM == 4) {
    new_Skin.AKM3 = 1101001128;
    new_Skin.AKM_Mag = 1010011281;
  }
  if (preferences.Config.Skin.AKM == 5) {
    new_Skin.AKM3 = 1101001143;
    new_Skin.AKM_Mag = 1010011431;
  }
  if (preferences.Config.Skin.AKM == 6) {
    new_Skin.AKM3 = 1101001154;
    new_Skin.AKM_Mag = 1010011541;
  }
  if (preferences.Config.Skin.AKM == 7) {
    new_Skin.AKM3 = 1101001174;
    new_Skin.AKM_Mag = 1010011741;
  }
  if (preferences.Config.Skin.AKM == 8) {
    new_Skin.AKM3 = 1101001213;
    new_Skin.AKM_Mag = 1010012131;
  }
  if (preferences.Config.Skin.AKM == 9) {
    new_Skin.AKM3 = 1101001231;
    new_Skin.AKM_Mag = 1010012311;
  }
  if (preferences.Config.Skin.AKM == 10) {
    new_Skin.AKM3 = 1101001242;
    new_Skin.AKM_Mag = 1010012421;
  }
  ////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.AKM == 0) {
    new_Skin.AKM4 = 1010015;
    new_Skin.AKM_Mag = 205005;
  }
  if (preferences.Config.Skin.AKM == 1) {
    new_Skin.AKM4 = 1101001249;
    new_Skin.AKM_Mag = 1010012444;
  }
  if (preferences.Config.Skin.AKM == 2) {
    new_Skin.AKM4 = 1101001103;
    new_Skin.AKM_Mag = 1010011031;
  }
  if (preferences.Config.Skin.AKM == 3) {
    new_Skin.AKM4 = 1101001116;
    new_Skin.AKM_Mag = 1010011161;
  }
  if (preferences.Config.Skin.AKM == 4) {
    new_Skin.AKM4 = 1101001128;
    new_Skin.AKM_Mag = 1010011281;
  }
  if (preferences.Config.Skin.AKM == 5) {
    new_Skin.AKM4 = 1101001143;
    new_Skin.AKM_Mag = 1010011431;
  }
  if (preferences.Config.Skin.AKM == 6) {
    new_Skin.AKM4 = 1101001154;
    new_Skin.AKM_Mag = 1010011541;
  }
  if (preferences.Config.Skin.AKM == 7) {
    new_Skin.AKM4 = 1101001174;
    new_Skin.AKM_Mag = 1010011741;
  }
  if (preferences.Config.Skin.AKM == 8) {
    new_Skin.AKM4 = 1101001213;
    new_Skin.AKM_Mag = 1010012131;
  }
  if (preferences.Config.Skin.AKM == 9) {
    new_Skin.AKM4 = 1101001231;
    new_Skin.AKM_Mag = 1010012311;
  }
  if (preferences.Config.Skin.AKM == 10) {
    new_Skin.AKM4 = 1101001242;
    new_Skin.AKM_Mag = 1010012421;
  }
  ////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.AKM == 0) {
    new_Skin.AKM5 = 1010016;
    new_Skin.AKM_Mag = 205005;
  }
  if (preferences.Config.Skin.AKM == 1) {
    new_Skin.AKM5 = 1101001249;
    new_Skin.AKM_Mag = 1010012444;
  }
  if (preferences.Config.Skin.AKM == 2) {
    new_Skin.AKM5 = 1101001103;
    new_Skin.AKM_Mag = 1010011031;
  }
  if (preferences.Config.Skin.AKM == 3) {
    new_Skin.AKM5 = 1101001116;
    new_Skin.AKM_Mag = 1010011161;
  }
  if (preferences.Config.Skin.AKM == 4) {
    new_Skin.AKM5 = 1101001128;
    new_Skin.AKM_Mag = 1010011281;
  }
  if (preferences.Config.Skin.AKM == 5) {
    new_Skin.AKM5 = 1101001143;
    new_Skin.AKM_Mag = 1010011431;
  }
  if (preferences.Config.Skin.AKM == 6) {
    new_Skin.AKM5 = 1101001154;
    new_Skin.AKM_Mag = 1010011541;
  }
  if (preferences.Config.Skin.AKM == 7) {
    new_Skin.AKM5 = 1101001174;
    new_Skin.AKM_Mag = 1010011741;
  }
  if (preferences.Config.Skin.AKM == 8) {
    new_Skin.AKM5 = 1101001213;
    new_Skin.AKM_Mag = 1010012131;
  }
  if (preferences.Config.Skin.AKM == 9) {
    new_Skin.AKM5 = 1101001231;
    new_Skin.AKM_Mag = 1010012311;
  }
  if (preferences.Config.Skin.AKM == 10) {
    new_Skin.AKM5 = 1101001242;
    new_Skin.AKM_Mag = 1010012421;
  }
  ////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.AKM == 0) {
    new_Skin.AKM6 = 1010017;
    new_Skin.AKM_Mag = 205005;
  }
  if (preferences.Config.Skin.AKM == 1) {
    new_Skin.AKM6 = 1101001249;
    new_Skin.AKM_Mag = 1010012444;
  }
  if (preferences.Config.Skin.AKM == 2) {
    new_Skin.AKM6 = 1101001103;
    new_Skin.AKM_Mag = 1010011031;
  }
  if (preferences.Config.Skin.AKM == 3) {
    new_Skin.AKM6 = 1101001116;
    new_Skin.AKM_Mag = 1010011161;
  }
  if (preferences.Config.Skin.AKM == 4) {
    new_Skin.AKM6 = 1101001128;
    new_Skin.AKM_Mag = 1010011281;
  }
  if (preferences.Config.Skin.AKM == 5) {
    new_Skin.AKM6 = 1101001143;
    new_Skin.AKM_Mag = 1010011431;
  }
  if (preferences.Config.Skin.AKM == 6) {
    new_Skin.AKM6 = 1101001154;
    new_Skin.AKM_Mag = 1010011541;
  }
  if (preferences.Config.Skin.AKM == 7) {
    new_Skin.AKM6 = 1101001174;
    new_Skin.AKM_Mag = 1010011741;
  }
  if (preferences.Config.Skin.AKM == 8) {
    new_Skin.AKM6 = 1101001213;
    new_Skin.AKM_Mag = 1010012131;
  }
  if (preferences.Config.Skin.AKM == 9) {
    new_Skin.AKM6 = 1101001231;
    new_Skin.AKM_Mag = 1010012311;
  }
  if (preferences.Config.Skin.AKM == 10) {
    new_Skin.AKM6 = 1101001242;
    new_Skin.AKM_Mag = 1010012421;
  }
////////////////////////////////////////////////////////

  if (preferences.Config.Skin.M16A4 == 0) {
    new_Skin.M16A4 = 101002;
    new_Skin.M16A4_Stock = 205007;
    new_Skin.M16A4_Mag = 291002;
  }
  if (preferences.Config.Skin.M16A4 == 1) {
    new_Skin.M16A4 = 1101002029;
    new_Skin.M16A4_Stock = 1010020292;
    new_Skin.M16A4_Mag = 1010020291;
  }
  if (preferences.Config.Skin.M16A4 == 2) {
    new_Skin.M16A4 = 1101002056;
    new_Skin.M16A4_Stock = 1010020562;
    new_Skin.M16A4_Mag = 1010020561;
  }
  if (preferences.Config.Skin.M16A4 == 3) {
    new_Skin.M16A4 = 1101002068;
    new_Skin.M16A4_Stock = 1010020682;
    new_Skin.M16A4_Mag = 1010020681;
  }
  if (preferences.Config.Skin.M16A4 == 4) {
    new_Skin.M16A4 = 1101002081;
    new_Skin.M16A4_Stock = 1010020812;
    new_Skin.M16A4_Mag = 1010020811;
  }
  if (preferences.Config.Skin.M16A4 == 5) {
    new_Skin.M16A4 = 1101002103;
    new_Skin.M16A4_Stock = 1010021032;
    new_Skin.M16A4_Mag = 1010021031;
  }
////////////////////////////////////////////////////////

  if (preferences.Config.Skin.M16A4 == 0) {
    new_Skin.M16A41 = 1010022;
    new_Skin.M16A4_Stock = 205007;
    new_Skin.M16A4_Mag = 291002;
  }
  if (preferences.Config.Skin.M16A4 == 1) {
    new_Skin.M16A41 = 1101002029;
    new_Skin.M16A4_Stock = 1010020292;
    new_Skin.M16A4_Mag = 1010020291;
  }
  if (preferences.Config.Skin.M16A4 == 2) {
    new_Skin.M16A41 = 1101002056;
    new_Skin.M16A4_Stock = 1010020562;
    new_Skin.M16A4_Mag = 1010020561;
  }
  if (preferences.Config.Skin.M16A4 == 3) {
    new_Skin.M16A41 = 1101002068;
    new_Skin.M16A4_Stock = 1010020682;
    new_Skin.M16A4_Mag = 1010020681;
  }
  if (preferences.Config.Skin.M16A4 == 4) {
    new_Skin.M16A41 = 1101002081;
    new_Skin.M16A4_Stock = 1010020812;
    new_Skin.M16A4_Mag = 1010020811;
  }
  if (preferences.Config.Skin.M16A4 == 5) {
    new_Skin.M16A41 = 1101002103;
    new_Skin.M16A4_Stock = 1010021032;
    new_Skin.M16A4_Mag = 1010021031;
  }
////////////////////////////////////////////////////////

  if (preferences.Config.Skin.M16A4 == 0) {
    new_Skin.M16A42 = 1010023;
    new_Skin.M16A4_Stock = 205007;
    new_Skin.M16A4_Mag = 291002;
  }
  if (preferences.Config.Skin.M16A4 == 1) {
    new_Skin.M16A42 = 1101002029;
    new_Skin.M16A4_Stock = 1010020292;
    new_Skin.M16A4_Mag = 1010020291;
  }
  if (preferences.Config.Skin.M16A4 == 2) {
    new_Skin.M16A42 = 1101002056;
    new_Skin.M16A4_Stock = 1010020562;
    new_Skin.M16A4_Mag = 1010020561;
  }
  if (preferences.Config.Skin.M16A4 == 3) {
    new_Skin.M16A42 = 1101002068;
    new_Skin.M16A4_Stock = 1010020682;
    new_Skin.M16A4_Mag = 1010020681;
  }
  if (preferences.Config.Skin.M16A4 == 4) {
    new_Skin.M16A42 = 1101002081;
    new_Skin.M16A4_Stock = 1010020812;
    new_Skin.M16A4_Mag = 1010020811;
  }
  if (preferences.Config.Skin.M16A4 == 5) {
    new_Skin.M16A42 = 1101002103;
    new_Skin.M16A4_Stock = 1010021032;
    new_Skin.M16A4_Mag = 1010021031;
  }
////////////////////////////////////////////////////////

  if (preferences.Config.Skin.M16A4 == 0) {
    new_Skin.M16A43 = 1010024;
    new_Skin.M16A4_Stock = 205007;
    new_Skin.M16A4_Mag = 291002;
  }
  if (preferences.Config.Skin.M16A4 == 1) {
    new_Skin.M16A43 = 1101002029;
    new_Skin.M16A4_Stock = 1010020292;
    new_Skin.M16A4_Mag = 1010020291;
  }
  if (preferences.Config.Skin.M16A4 == 2) {
    new_Skin.M16A43 = 1101002056;
    new_Skin.M16A4_Stock = 1010020562;
    new_Skin.M16A4_Mag = 1010020561;
  }
  if (preferences.Config.Skin.M16A4 == 3) {
    new_Skin.M16A43 = 1101002068;
    new_Skin.M16A4_Stock = 1010020682;
    new_Skin.M16A4_Mag = 1010020681;
  }
  if (preferences.Config.Skin.M16A4 == 4) {
    new_Skin.M16A43 = 1101002081;
    new_Skin.M16A4_Stock = 1010020812;
    new_Skin.M16A4_Mag = 1010020811;
  }
  if (preferences.Config.Skin.M16A4 == 5) {
    new_Skin.M16A43 = 1101002103;
    new_Skin.M16A4_Stock = 1010021032;
    new_Skin.M16A4_Mag = 1010021031;
  }
////////////////////////////////////////////////////////

  if (preferences.Config.Skin.M16A4 == 0) {
    new_Skin.M16A44 = 1010025;
    new_Skin.M16A4_Stock = 205007;
    new_Skin.M16A4_Mag = 291002;
  }
  if (preferences.Config.Skin.M16A4 == 1) {
    new_Skin.M16A44 = 1101002029;
    new_Skin.M16A4_Stock = 1010020292;
    new_Skin.M16A4_Mag = 1010020291;
  }
  if (preferences.Config.Skin.M16A4 == 2) {
    new_Skin.M16A44 = 1101002056;
    new_Skin.M16A4_Stock = 1010020562;
    new_Skin.M16A4_Mag = 1010020561;
  }
  if (preferences.Config.Skin.M16A4 == 3) {
    new_Skin.M16A44 = 1101002068;
    new_Skin.M16A4_Stock = 1010020682;
    new_Skin.M16A4_Mag = 1010020681;
  }
  if (preferences.Config.Skin.M16A4 == 4) {
    new_Skin.M16A44 = 1101002081;
    new_Skin.M16A4_Stock = 1010020812;
    new_Skin.M16A4_Mag = 1010020811;
  }
  if (preferences.Config.Skin.M16A4 == 5) {
    new_Skin.M16A44 = 1101002103;
    new_Skin.M16A4_Stock = 1010021032;
    new_Skin.M16A4_Mag = 1010021031;
  }
////////////////////////////////////////////////////////

  if (preferences.Config.Skin.M16A4 == 0) {
    new_Skin.M16A45 = 1010026;
    new_Skin.M16A4_Stock = 205007;
    new_Skin.M16A4_Mag = 291002;
  }
  if (preferences.Config.Skin.M16A4 == 1) {
    new_Skin.M16A45 = 1101002029;
    new_Skin.M16A4_Stock = 1010020292;
    new_Skin.M16A4_Mag = 1010020291;
  }
  if (preferences.Config.Skin.M16A4 == 2) {
    new_Skin.M16A45 = 1101002056;
    new_Skin.M16A4_Stock = 1010020562;
    new_Skin.M16A4_Mag = 1010020561;
  }
  if (preferences.Config.Skin.M16A4 == 3) {
    new_Skin.M16A45 = 1101002068;
    new_Skin.M16A4_Stock = 1010020682;
    new_Skin.M16A4_Mag = 1010020681;
  }
  if (preferences.Config.Skin.M16A4 == 4) {
    new_Skin.M16A45 = 1101002081;
    new_Skin.M16A4_Stock = 1010020812;
    new_Skin.M16A4_Mag = 1010020811;
  }
  if (preferences.Config.Skin.M16A4 == 5) {
    new_Skin.M16A45 = 1101002103;
    new_Skin.M16A4_Stock = 1010021032;
    new_Skin.M16A4_Mag = 1010021031;
  }
////////////////////////////////////////////////////////

  if (preferences.Config.Skin.M16A4 == 0) {
    new_Skin.M16A46 = 1010027;
    new_Skin.M16A4_Stock = 205007;
    new_Skin.M16A4_Mag = 291002;
  }
  if (preferences.Config.Skin.M16A4 == 1) {
    new_Skin.M16A46 = 1101002029;
    new_Skin.M16A4_Stock = 1010020292;
    new_Skin.M16A4_Mag = 1010020291;
  }
  if (preferences.Config.Skin.M16A4 == 2) {
    new_Skin.M16A46 = 1101002056;
    new_Skin.M16A4_Stock = 1010020562;
    new_Skin.M16A4_Mag = 1010020561;
  }
  if (preferences.Config.Skin.M16A4 == 3) {
    new_Skin.M16A46 = 1101002068;
    new_Skin.M16A4_Stock = 1010020682;
    new_Skin.M16A4_Mag = 1010020681;
  }
  if (preferences.Config.Skin.M16A4 == 4) {
    new_Skin.M16A46 = 1101002081;
    new_Skin.M16A4_Stock = 1010020812;
    new_Skin.M16A4_Mag = 1010020811;
  }
  if (preferences.Config.Skin.M16A4 == 5) {
    new_Skin.M16A46 = 1101002103;
    new_Skin.M16A4_Stock = 1010021032;
    new_Skin.M16A4_Mag = 1010021031;
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  if (preferences.Config.Skin.MK14 == 0) {
    new_Skin.MK145 = 1030075;
    new_Skin.longyin_x6666 = 203015;
    new_Skin.longyin_x8888 = 203005;
    new_Skin.longyin_x1111 = 203001;
    new_Skin.longyin_x2222 = 203003;
    new_Skin.longyin_x3333 = 203014;
    new_Skin.longyin_x4444 = 203004;
    new_Skin.tuosb = 205003;
    new_Skin.tuosb1 = 2050032;
    new_Skin.tuosb2 = 2050033;
    new_Skin.tuosb3 = 2050034;
    new_Skin.tuosb4 = 2050035;
  }
  if (preferences.Config.Skin.MK14 == 1) {
    new_Skin.MK145 = 1103007028;
    new_Skin.longyin_x1111 = 1030070218;
    new_Skin.longyin_x2222 = 1030070216;
    new_Skin.longyin_x3333 = 1030070215;
    new_Skin.longyin_x4444 = 1030070214;
    new_Skin.longyin_x6666 = 1030070213;
    new_Skin.longyin_x8888 = 1030070212;
    new_Skin.tuosb = 1030070236;
    new_Skin.tuosb1 = 1030070236;
    new_Skin.tuosb2 = 1030070236;
    new_Skin.tuosb3 = 1030070236;
    new_Skin.tuosb4 = 1030070236;
  }
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  if (preferences.Config.Skin.MK14 == 0) {
    new_Skin.MK147 = 1030072;
    new_Skin.longyin_x6666 = 203015;
    new_Skin.longyin_x8888 = 203005;
    new_Skin.longyin_x1111 = 203001;
    new_Skin.longyin_x2222 = 203003;
    new_Skin.longyin_x3333 = 203014;
    new_Skin.longyin_x4444 = 203004;
    new_Skin.tuosb = 205003;
    new_Skin.tuosb1 = 2050032;
    new_Skin.tuosb2 = 2050033;
    new_Skin.tuosb3 = 2050034;
    new_Skin.tuosb4 = 2050035;
  }
  if (preferences.Config.Skin.MK14 == 1) {
    new_Skin.MK147 = 1103007028;
    new_Skin.longyin_x1111 = 1030070218;
    new_Skin.longyin_x2222 = 1030070216;
    new_Skin.longyin_x3333 = 1030070215;
    new_Skin.longyin_x4444 = 1030070214;
    new_Skin.longyin_x6666 = 1030070213;
    new_Skin.longyin_x8888 = 1030070212;
    new_Skin.tuosb = 1030070236;
    new_Skin.tuosb1 = 1030070236;
    new_Skin.tuosb2 = 1030070236;
    new_Skin.tuosb3 = 1030070236;
    new_Skin.tuosb4 = 1030070236;
  }
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  if (preferences.Config.Skin.MK14 == 0) {
    new_Skin.MK148 = 1030073;
    new_Skin.longyin_x6666 = 203015;
    new_Skin.longyin_x8888 = 203005;
    new_Skin.longyin_x1111 = 203001;
    new_Skin.longyin_x2222 = 203003;
    new_Skin.longyin_x3333 = 203014;
    new_Skin.longyin_x4444 = 203004;
    new_Skin.tuosb = 205003;
    new_Skin.tuosb1 = 2050032;
    new_Skin.tuosb2 = 2050033;
    new_Skin.tuosb3 = 2050034;
    new_Skin.tuosb4 = 2050035;
  }
  if (preferences.Config.Skin.MK14 == 1) {
    new_Skin.MK148 = 1103007028;
    new_Skin.longyin_x1111 = 1030070218;
    new_Skin.longyin_x2222 = 1030070216;
    new_Skin.longyin_x3333 = 1030070215;
    new_Skin.longyin_x4444 = 1030070214;
    new_Skin.longyin_x6666 = 1030070213;
    new_Skin.longyin_x8888 = 1030070212;
    new_Skin.tuosb = 1030070236;
    new_Skin.tuosb1 = 1030070236;
    new_Skin.tuosb2 = 1030070236;
    new_Skin.tuosb3 = 1030070236;
    new_Skin.tuosb4 = 1030070236;
  }
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  if (preferences.Config.Skin.MK14 == 0) {
    new_Skin.MK149 = 1030076;
    new_Skin.longyin_x6666 = 203015;
    new_Skin.longyin_x8888 = 203005;
    new_Skin.longyin_x1111 = 203001;
    new_Skin.longyin_x2222 = 203003;
    new_Skin.longyin_x3333 = 203014;
    new_Skin.longyin_x4444 = 203004;
    new_Skin.tuosb = 205003;
    new_Skin.tuosb1 = 2050032;
    new_Skin.tuosb2 = 2050033;
    new_Skin.tuosb3 = 2050034;
    new_Skin.tuosb4 = 2050035;
  }
  if (preferences.Config.Skin.MK14 == 1) {
    new_Skin.MK149 = 1103007028;
    new_Skin.longyin_x1111 = 1030070218;
    new_Skin.longyin_x2222 = 1030070216;
    new_Skin.longyin_x3333 = 1030070215;
    new_Skin.longyin_x4444 = 1030070214;
    new_Skin.longyin_x6666 = 1030070213;
    new_Skin.longyin_x8888 = 1030070212;
    new_Skin.tuosb = 1030070236;
    new_Skin.tuosb1 = 1030070236;
    new_Skin.tuosb2 = 1030070236;
    new_Skin.tuosb3 = 1030070236;
    new_Skin.tuosb4 = 1030070236;
  }
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  if (preferences.Config.Skin.MK14 == 0) {
    new_Skin.MK140 = 1030077;
    new_Skin.longyin_x6666 = 203015;
    new_Skin.longyin_x8888 = 203005;
    new_Skin.longyin_x1111 = 203001;
    new_Skin.longyin_x2222 = 203003;
    new_Skin.longyin_x3333 = 203014;
    new_Skin.longyin_x4444 = 203004;
    new_Skin.tuosb = 205003;
    new_Skin.tuosb1 = 2050032;
    new_Skin.tuosb2 = 2050033;
    new_Skin.tuosb3 = 2050034;
    new_Skin.tuosb4 = 2050035;
  }
  if (preferences.Config.Skin.MK14 == 1) {
    new_Skin.MK140 = 1103007028;
    new_Skin.longyin_x1111 = 1030070218;
    new_Skin.longyin_x2222 = 1030070216;
    new_Skin.longyin_x3333 = 1030070215;
    new_Skin.longyin_x4444 = 1030070214;
    new_Skin.longyin_x6666 = 1030070213;
    new_Skin.longyin_x8888 = 1030070212;
    new_Skin.tuosb = 1030070236;
    new_Skin.tuosb1 = 1030070236;
    new_Skin.tuosb2 = 1030070236;
    new_Skin.tuosb3 = 1030070236;
    new_Skin.tuosb4 = 1030070236;
  }
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  if (preferences.Config.Skin.MK14 == 0) {
    new_Skin.MK14 = 103007;
    new_Skin.longyin_x6666 = 203015;
    new_Skin.longyin_x8888 = 203005;
    new_Skin.longyin_x1111 = 203001;
    new_Skin.longyin_x2222 = 203003;
    new_Skin.longyin_x3333 = 203014;
    new_Skin.longyin_x4444 = 203004;
    new_Skin.tuosb = 205003;
    new_Skin.tuosb1 = 2050032;
    new_Skin.tuosb2 = 2050033;
    new_Skin.tuosb3 = 2050034;
    new_Skin.tuosb4 = 2050035;
  }
  if (preferences.Config.Skin.MK14 == 1) {
    new_Skin.MK14 = 1103007028;
    new_Skin.longyin_x1111 = 1030070218;
    new_Skin.longyin_x2222 = 1030070216;
    new_Skin.longyin_x3333 = 1030070215;
    new_Skin.longyin_x4444 = 1030070214;
    new_Skin.longyin_x6666 = 1030070213;
    new_Skin.longyin_x8888 = 1030070212;
    new_Skin.tuosb = 1030070236;
    new_Skin.tuosb1 = 1030070236;
    new_Skin.tuosb2 = 1030070236;
    new_Skin.tuosb3 = 1030070236;
    new_Skin.tuosb4 = 1030070236;
  }
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  if (preferences.Config.Skin.MK14 == 0) {
    new_Skin.MK146 = 1030074;
    new_Skin.longyin_x6666 = 203015;
    new_Skin.longyin_x8888 = 203005;
    new_Skin.longyin_x1111 = 203001;
    new_Skin.longyin_x2222 = 203008;
    new_Skin.longyin_x3333 = 203014;
    new_Skin.longyin_x4444 = 203004;
    new_Skin.tuosb = 205003;
    new_Skin.tuosb1 = 2050032;
    new_Skin.tuosb2 = 2050033;
    new_Skin.tuosb3 = 2050034;
    new_Skin.tuosb4 = 2050035;
  }
  if (preferences.Config.Skin.MK14 == 1) {
    new_Skin.MK146 = 1103007028;
    new_Skin.longyin_x1111 = 1030070218;
    new_Skin.longyin_x2222 = 1030070216;
    new_Skin.longyin_x3333 = 1030070215;
    new_Skin.longyin_x4444 = 1030070214;
    new_Skin.longyin_x6666 = 1030070213;
    new_Skin.longyin_x8888 = 1030070212;
    new_Skin.tuosb = 1030070236;
    new_Skin.tuosb1 = 1030070236;
    new_Skin.tuosb2 = 1030070236;
    new_Skin.tuosb3 = 1030070236;
    new_Skin.tuosb4 = 1030070236;
  }
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  if (preferences.Config.Skin.MG3 == 0) {
    new_Skin.mg31 = 1050105;
  }
  if (preferences.Config.Skin.MG3 == 1) {
    new_Skin.mg31 = 1105010008;
  }
  if (preferences.Config.Skin.MG3 == 2) {
    new_Skin.mg31 = 1105010019;
  }
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  if (preferences.Config.Skin.MG3 == 0) {
    new_Skin.mg32 = 1050106;
  }
  if (preferences.Config.Skin.MG3 == 1) {
    new_Skin.mg32 = 1105010008;
  }
  if (preferences.Config.Skin.MG3 == 2) {
    new_Skin.mg32 = 1105010019;
  }
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  if (preferences.Config.Skin.MG3 == 0) {
    new_Skin.mg33 = 1050107;
  }
  if (preferences.Config.Skin.MG3 == 1) {
    new_Skin.mg33 = 1105010008;
  }
  if (preferences.Config.Skin.MG3 == 2) {
    new_Skin.mg33 = 1105010019;
  }
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  if (preferences.Config.Skin.MG3 == 0) {
    new_Skin.mg34 = 1050102;
  }
  if (preferences.Config.Skin.MG3 == 1) {
    new_Skin.mg34 = 1105010008;
  }
  if (preferences.Config.Skin.MG3 == 2) {
    new_Skin.mg34 = 1105010019;
  }
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  if (preferences.Config.Skin.MG3 == 0) {
    new_Skin.mg35 = 1050103;
  }
  if (preferences.Config.Skin.MG3 == 1) {
    new_Skin.mg35 = 1105010008;
  }
  if (preferences.Config.Skin.MG3 == 2) {
    new_Skin.mg35 = 1105010019;
  }
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  if (preferences.Config.Skin.MG3 == 0) {
    new_Skin.mg36 = 1050104;
  }
  if (preferences.Config.Skin.MG3 == 1) {
    new_Skin.mg36 = 1105010008;
  }
  if (preferences.Config.Skin.MG3 == 2) {
    new_Skin.mg36 = 1105010019;
  }
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (new_Skin.P90 == 0)
    new_Skin.P90 = 102105;
  if (preferences.Config.Skin.P90 == 1)
    new_Skin.P90 = 1102105012;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (new_Skin.P90 == 0)
    new_Skin.P901 = 1021052;
  if (preferences.Config.Skin.P90 == 1)
    new_Skin.P901 = 1102105012;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (new_Skin.P90 == 0)
    new_Skin.P902 = 1021053;
  if (preferences.Config.Skin.P90 == 1)
    new_Skin.P902 = 1102105012;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (new_Skin.P90 == 0)
    new_Skin.P903 = 1021054;
  if (preferences.Config.Skin.P90 == 1)
    new_Skin.P903 = 1102105012;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (new_Skin.P90 == 0)
    new_Skin.P904 = 1021055;
  if (preferences.Config.Skin.P90 == 1)
    new_Skin.P904 = 1102105012;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (new_Skin.P90 == 0)
    new_Skin.P905 = 1021056;
  if (preferences.Config.Skin.P90 == 1)
    new_Skin.P905 = 1102105012;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (new_Skin.P90 == 0)
    new_Skin.P906 = 1021057;
  if (preferences.Config.Skin.P90 == 1)
    new_Skin.P906 = 1102105012;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.MG3 == 0) {
    new_Skin.MG3 = 105010;
  }
  if (preferences.Config.Skin.MG3 == 1) {
    new_Skin.MG3 = 1105010008;
  }
  if (preferences.Config.Skin.MG3 == 2) {
    new_Skin.MG3 = 1105010019;
  }
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  if (preferences.Config.Skin.Scar == 0) {
    new_Skin.Scar = 101003;
    new_Skin.Scar_Mag = 291003;
  }
  if (preferences.Config.Skin.Scar == 1) {
    new_Skin.Scar = 1101003195;
    new_Skin.Scar_Mag = 1010031897;
  }
  if (preferences.Config.Skin.Scar == 2) {
    new_Skin.Scar = 1101003057;
    new_Skin.Scar_Mag = 1010030571;
  }
  if (preferences.Config.Skin.Scar == 3) {
    new_Skin.Scar = 1101003070;
    new_Skin.Scar_Mag = 1010030701;
  }
  if (preferences.Config.Skin.Scar == 4) {
    new_Skin.Scar = 1101003080;
    new_Skin.Scar_Mag = 1010030801;
  }
  if (preferences.Config.Skin.Scar == 5) {
    new_Skin.Scar = 1101003119;
    new_Skin.Scar_Mag = 1010031191;
  }
  if (preferences.Config.Skin.Scar == 6) {
    new_Skin.Scar = 1101003146;
    new_Skin.Scar_Mag = 1010031461;
  }
  if (preferences.Config.Skin.Scar == 7) {
    new_Skin.Scar = 1101003167;
    new_Skin.Scar_Mag = 1010031671;
  }
  if (preferences.Config.Skin.Scar == 8) {
    new_Skin.Scar = 1101003181;
    new_Skin.Scar_Mag = 1010031811;
  }
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  if (preferences.Config.Skin.Scar == 0) {
    new_Skin.Scar1 = 1010032;
    new_Skin.Scar_Mag = 291003;
  }
  if (preferences.Config.Skin.Scar == 1) {
    new_Skin.Scar1 = 1101003195;
    new_Skin.Scar_Mag = 1010031897;
  }
  if (preferences.Config.Skin.Scar == 2) {
    new_Skin.Scar1 = 1101003057;
    new_Skin.Scar_Mag = 1010030571;
  }
  if (preferences.Config.Skin.Scar == 3) {
    new_Skin.Scar1 = 1101003070;
    new_Skin.Scar_Mag = 1010030701;
  }
  if (preferences.Config.Skin.Scar == 4) {
    new_Skin.Scar1 = 1101003080;
    new_Skin.Scar_Mag = 1010030801;
  }
  if (preferences.Config.Skin.Scar == 5) {
    new_Skin.Scar1 = 1101003119;
    new_Skin.Scar_Mag = 1010031191;
  }
  if (preferences.Config.Skin.Scar == 6) {
    new_Skin.Scar1 = 1101003146;
    new_Skin.Scar_Mag = 1010031461;
  }
  if (preferences.Config.Skin.Scar == 7) {
    new_Skin.Scar1 = 1101003167;
    new_Skin.Scar_Mag = 1010031671;
  }
  if (preferences.Config.Skin.Scar == 8) {
    new_Skin.Scar1 = 1101003181;
    new_Skin.Scar_Mag = 1010031811;
  }
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  if (preferences.Config.Skin.Scar == 0) {
    new_Skin.Scar2 = 1010033;
    new_Skin.Scar_Mag = 291003;
  }
  if (preferences.Config.Skin.Scar == 1) {
    new_Skin.Scar2 = 1101003195;
    new_Skin.Scar_Mag = 1010031897;
  }
  if (preferences.Config.Skin.Scar == 2) {
    new_Skin.Scar2 = 1101003057;
    new_Skin.Scar_Mag = 1010030571;
  }
  if (preferences.Config.Skin.Scar == 3) {
    new_Skin.Scar2 = 1101003070;
    new_Skin.Scar_Mag = 1010030701;
  }
  if (preferences.Config.Skin.Scar == 4) {
    new_Skin.Scar2 = 1101003080;
    new_Skin.Scar_Mag = 1010030801;
  }
  if (preferences.Config.Skin.Scar == 5) {
    new_Skin.Scar2 = 1101003119;
    new_Skin.Scar_Mag = 1010031191;
  }
  if (preferences.Config.Skin.Scar == 6) {
    new_Skin.Scar2 = 1101003146;
    new_Skin.Scar_Mag = 1010031461;
  }
  if (preferences.Config.Skin.Scar == 7) {
    new_Skin.Scar2 = 1101003167;
    new_Skin.Scar_Mag = 1010031671;
  }
  if (preferences.Config.Skin.Scar == 8) {
    new_Skin.Scar2 = 1101003181;
    new_Skin.Scar_Mag = 1010031811;
  }
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  if (preferences.Config.Skin.Scar == 0) {
    new_Skin.Scar3 = 1010034;
    new_Skin.Scar_Mag = 291003;
  }
  if (preferences.Config.Skin.Scar == 1) {
    new_Skin.Scar3 = 1101003195;
    new_Skin.Scar_Mag = 1010031897;
  }
  if (preferences.Config.Skin.Scar == 2) {
    new_Skin.Scar3 = 1101003057;
    new_Skin.Scar_Mag = 1010030571;
  }
  if (preferences.Config.Skin.Scar == 3) {
    new_Skin.Scar3 = 1101003070;
    new_Skin.Scar_Mag = 1010030701;
  }
  if (preferences.Config.Skin.Scar == 4) {
    new_Skin.Scar3 = 1101003080;
    new_Skin.Scar_Mag = 1010030801;
  }
  if (preferences.Config.Skin.Scar == 5) {
    new_Skin.Scar3 = 1101003119;
    new_Skin.Scar_Mag = 1010031191;
  }
  if (preferences.Config.Skin.Scar == 6) {
    new_Skin.Scar3 = 1101003146;
    new_Skin.Scar_Mag = 1010031461;
  }
  if (preferences.Config.Skin.Scar == 7) {
    new_Skin.Scar3 = 1101003167;
    new_Skin.Scar_Mag = 1010031671;
  }
  if (preferences.Config.Skin.Scar == 8) {
    new_Skin.Scar3 = 1101003181;
    new_Skin.Scar_Mag = 1010031811;
  }
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  if (preferences.Config.Skin.Scar == 0) {
    new_Skin.Scar4 = 1010035;
    new_Skin.Scar_Mag = 291003;
  }
  if (preferences.Config.Skin.Scar == 1) {
    new_Skin.Scar4 = 1101003195;
    new_Skin.Scar_Mag = 1010031897;
  }
  if (preferences.Config.Skin.Scar == 2) {
    new_Skin.Scar4 = 1101003057;
    new_Skin.Scar_Mag = 1010030571;
  }
  if (preferences.Config.Skin.Scar == 3) {
    new_Skin.Scar4 = 1101003070;
    new_Skin.Scar_Mag = 1010030701;
  }
  if (preferences.Config.Skin.Scar == 4) {
    new_Skin.Scar4 = 1101003080;
    new_Skin.Scar_Mag = 1010030801;
  }
  if (preferences.Config.Skin.Scar == 5) {
    new_Skin.Scar4 = 1101003119;
    new_Skin.Scar_Mag = 1010031191;
  }
  if (preferences.Config.Skin.Scar == 6) {
    new_Skin.Scar4 = 1101003146;
    new_Skin.Scar_Mag = 1010031461;
  }
  if (preferences.Config.Skin.Scar == 7) {
    new_Skin.Scar4 = 1101003167;
    new_Skin.Scar_Mag = 1010031671;
  }
  if (preferences.Config.Skin.Scar == 8) {
    new_Skin.Scar4 = 1101003181;
    new_Skin.Scar_Mag = 1010031811;
  }
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  if (preferences.Config.Skin.Scar == 0) {
    new_Skin.Scar5 = 1010036;
    new_Skin.Scar_Mag = 291003;
  }
  if (preferences.Config.Skin.Scar == 1) {
    new_Skin.Scar5 = 1101003195;
    new_Skin.Scar_Mag = 1010031897;
  }
  if (preferences.Config.Skin.Scar == 2) {
    new_Skin.Scar5 = 1101003057;
    new_Skin.Scar_Mag = 1010030571;
  }
  if (preferences.Config.Skin.Scar == 3) {
    new_Skin.Scar5 = 1101003070;
    new_Skin.Scar_Mag = 1010030701;
  }
  if (preferences.Config.Skin.Scar == 4) {
    new_Skin.Scar5 = 1101003080;
    new_Skin.Scar_Mag = 1010030801;
  }
  if (preferences.Config.Skin.Scar == 5) {
    new_Skin.Scar5 = 1101003119;
    new_Skin.Scar_Mag = 1010031191;
  }
  if (preferences.Config.Skin.Scar == 6) {
    new_Skin.Scar5 = 1101003146;
    new_Skin.Scar_Mag = 1010031461;
  }
  if (preferences.Config.Skin.Scar == 7) {
    new_Skin.Scar5 = 1101003167;
    new_Skin.Scar_Mag = 1010031671;
  }
  if (preferences.Config.Skin.Scar == 8) {
    new_Skin.Scar5 = 1101003181;
    new_Skin.Scar_Mag = 1010031811;
  }
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  if (preferences.Config.Skin.Scar == 0) {
    new_Skin.Scar6 = 1010037;
    new_Skin.Scar_Mag = 291003;
  }
  if (preferences.Config.Skin.Scar == 1) {
    new_Skin.Scar6 = 1101003195;
    new_Skin.Scar_Mag = 1010031897;
  }
  if (preferences.Config.Skin.Scar == 2) {
    new_Skin.Scar6 = 1101003057;
    new_Skin.Scar_Mag = 1010030571;
  }
  if (preferences.Config.Skin.Scar == 3) {
    new_Skin.Scar6 = 1101003070;
    new_Skin.Scar_Mag = 1010030701;
  }
  if (preferences.Config.Skin.Scar == 4) {
    new_Skin.Scar6 = 1101003080;
    new_Skin.Scar_Mag = 1010030801;
  }
  if (preferences.Config.Skin.Scar == 5) {
    new_Skin.Scar6 = 1101003119;
    new_Skin.Scar_Mag = 1010031191;
  }
  if (preferences.Config.Skin.Scar == 6) {
    new_Skin.Scar6 = 1101003146;
    new_Skin.Scar_Mag = 1010031461;
  }
  if (preferences.Config.Skin.Scar == 7) {
    new_Skin.Scar6 = 1101003167;
    new_Skin.Scar_Mag = 1010031671;
  }
  if (preferences.Config.Skin.Scar == 8) {
    new_Skin.Scar6 = 1101003181;
    new_Skin.Scar_Mag = 1010031811;
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  if (preferences.Config.Skin.M416 == 0) {
    new_Skin.M416_1 = 101004;
    new_Skin.M416_2 = 291004;
    new_Skin.M416_3 = 203008;
    new_Skin.M416_4 = 205005;
    new_Skin.M416_flash = 201010;
    new_Skin.M416_compe = 201009;
    new_Skin.M416_silent = 201011;
    new_Skin.M416_reddot = 203001;
    new_Skin.M416_holo = 203002;
    new_Skin.M416_x2 = 203003;
    new_Skin.M416_x3 = 203014;
    new_Skin.M416_x4 = 203004;
    new_Skin.M416_x6 = 203015;
    new_Skin.M416_quickMag = 204012;
    new_Skin.M416_extendedMag = 204011;
    new_Skin.M416_quickNextended = 204013;
    new_Skin.M416_stock = 205002;
    new_Skin.M416_stock2 = 2050022;
    new_Skin.M416_stock3 = 2050023;
    new_Skin.M416_stock4 = 2050024;
    new_Skin.M416_stock5 = 2050025;
    new_Skin.M416_verical = 203015;
    new_Skin.M416_angle = 202001;
    new_Skin.M416_lightgrip = 202004;
    new_Skin.M416_pink = 202005;
    new_Skin.M416_lazer = 203015;
    new_Skin.M416_thumb = 202006;
  }
  if (preferences.Config.Skin.M416 == 1) {
    new_Skin.M416_1 = 1101004046;
    new_Skin.M416_2 = 1010040461;
    new_Skin.M416_3 = 1010040462;
    new_Skin.M416_4 = 1010040463;
    new_Skin.M416_flash = 1010040474;
    new_Skin.M416_compe = 1010040475;
    new_Skin.M416_silent = 1010040476;
    new_Skin.M416_reddot = 1010040470;
    new_Skin.M416_holo = 1010040469;
    new_Skin.M416_x2 = 1010040468;
    new_Skin.M416_x3 = 1010040467;
    new_Skin.M416_x4 = 1010040466;
    new_Skin.M416_x6 = 1010040481;
    new_Skin.M416_quickMag = 1010040471;
    new_Skin.M416_extendedMag = 1010040472;
    new_Skin.M416_quickNextended = 1010040473;
    new_Skin.M416_stock = 1010040480;
    new_Skin.M416_stock2 = 1010040480;
    new_Skin.M416_stock3 = 1010040480;
    new_Skin.M416_stock4 = 1010040480;
    new_Skin.M416_stock5 = 1010040480;
    new_Skin.M416_verical = 1010040479;
    new_Skin.M416_thumb = 1010040478;
    new_Skin.M416_angle = 1010040477;
    new_Skin.M416_lightgrip = 1010040482;
    new_Skin.M416_pink = 1010040483;
    new_Skin.M416_lazer = 1010040484;
  }
  if (preferences.Config.Skin.M416 == 2) {
    new_Skin.M416_1 = 1101004062;
    new_Skin.M416_2 = 1010040611;
    new_Skin.M416_3 = 1010040612;
    new_Skin.M416_4 = 1010040613;
    new_Skin.M416_flash = 201010;
    new_Skin.M416_compe = 201009;
    new_Skin.M416_silent = 201011;
    new_Skin.M416_reddot = 203001;
    new_Skin.M416_holo = 203002;
    new_Skin.M416_x2 = 203003;
    new_Skin.M416_x3 = 203014;
    new_Skin.M416_x4 = 203004;
    new_Skin.M416_x6 = 203015;
    new_Skin.M416_quickMag = 204012;
    new_Skin.M416_extendedMag = 204011;
    new_Skin.M416_quickNextended = 204013;
    new_Skin.M416_stock = 205002;
    new_Skin.M416_stock2 = 205002;
    new_Skin.M416_stock3 = 205002;
    new_Skin.M416_stock4 = 205002;
    new_Skin.M416_stock5 = 205002;
    new_Skin.M416_verical = 203015;
    new_Skin.M416_angle = 202001;
    new_Skin.M416_lightgrip = 202004;
    new_Skin.M416_pink = 202005;
    new_Skin.M416_lazer = 203015;
    new_Skin.M416_thumb = 202006;
  }
  if (preferences.Config.Skin.M416 == 3) {
    new_Skin.M416_1 = 1101004078;
    new_Skin.M416_2 = 1010040781;
    new_Skin.M416_3 = 1010040782;
    new_Skin.M416_4 = 1010040783;
    new_Skin.M416_flash = 201010;
    new_Skin.M416_compe = 201009;
    new_Skin.M416_silent = 201011;
    new_Skin.M416_reddot = 203001;
    new_Skin.M416_holo = 203002;
    new_Skin.M416_x2 = 203003;
    new_Skin.M416_x3 = 203014;
    new_Skin.M416_x4 = 203004;
    new_Skin.M416_x6 = 203015;
    new_Skin.M416_quickMag = 204012;
    new_Skin.M416_extendedMag = 204011;
    new_Skin.M416_quickNextended = 204013;
    new_Skin.M416_stock = 205002;
    new_Skin.M416_stock2 = 205002;
    new_Skin.M416_stock3 = 205002;
    new_Skin.M416_stock4 = 205002;
    new_Skin.M416_stock5 = 205002;
    new_Skin.M416_verical = 203015;
    new_Skin.M416_angle = 202001;
    new_Skin.M416_lightgrip = 202004;
    new_Skin.M416_pink = 202005;
    new_Skin.M416_lazer = 203015;
    new_Skin.M416_thumb = 202006;
  }
  if (preferences.Config.Skin.M416 == 4) {
    new_Skin.M416_1 = 1101004086;
    new_Skin.M416_2 = 1010040861;
    new_Skin.M416_3 = 1010040862;
    new_Skin.M416_4 = 1010040863;
    new_Skin.M416_flash = 201010;
    new_Skin.M416_compe = 201009;
    new_Skin.M416_silent = 201011;
    new_Skin.M416_reddot = 203001;
    new_Skin.M416_holo = 203002;
    new_Skin.M416_x2 = 203003;
    new_Skin.M416_x3 = 203014;
    new_Skin.M416_x4 = 203004;
    new_Skin.M416_x6 = 203015;
    new_Skin.M416_quickMag = 204012;
    new_Skin.M416_extendedMag = 204011;
    new_Skin.M416_quickNextended = 204013;
    new_Skin.M416_stock = 205002;
    new_Skin.M416_stock2 = 205002;
    new_Skin.M416_stock3 = 205002;
    new_Skin.M416_stock4 = 205002;
    new_Skin.M416_stock5 = 205002;
    new_Skin.M416_verical = 203015;
    new_Skin.M416_angle = 202001;
    new_Skin.M416_lightgrip = 202004;
    new_Skin.M416_pink = 202005;
    new_Skin.M416_lazer = 203015;
    new_Skin.M416_thumb = 202006;
  }
  if (preferences.Config.Skin.M416 == 5) {
    new_Skin.M416_1 = 1101004098;
    new_Skin.M416_2 = 1010040981;
    new_Skin.M416_3 = 1010040982;
    new_Skin.M416_4 = 1010040983;
    new_Skin.M416_flash = 201010;
    new_Skin.M416_compe = 201009;
    new_Skin.M416_silent = 201011;
    new_Skin.M416_reddot = 203001;
    new_Skin.M416_holo = 203002;
    new_Skin.M416_x2 = 203003;
    new_Skin.M416_x3 = 203014;
    new_Skin.M416_x4 = 203004;
    new_Skin.M416_x6 = 203015;
    new_Skin.M416_quickMag = 204012;
    new_Skin.M416_extendedMag = 204011;
    new_Skin.M416_quickNextended = 204013;
    new_Skin.M416_stock = 205002;
    new_Skin.M416_stock2 = 205002;
    new_Skin.M416_stock3 = 205002;
    new_Skin.M416_stock4 = 205002;
    new_Skin.M416_stock5 = 205002;
    new_Skin.M416_verical = 203015;
    new_Skin.M416_angle = 202001;
    new_Skin.M416_lightgrip = 202004;
    new_Skin.M416_pink = 202005;
    new_Skin.M416_lazer = 203015;
    new_Skin.M416_thumb = 202006;
  }
  if (preferences.Config.Skin.M416 == 6) {
    new_Skin.M416_1 = 1101004138;
    new_Skin.M416_2 = 1010041381;
    new_Skin.M416_3 = 1010041382;
    new_Skin.M416_4 = 1010041383;
    new_Skin.M416_flash = 1010041136;
    new_Skin.M416_compe = 1010041137;
    new_Skin.M416_silent = 1010041138;
    new_Skin.M416_reddot = 1010041128;
    new_Skin.M416_holo = 1010041127;
    new_Skin.M416_x2 = 1010041126;
    new_Skin.M416_x3 = 1010041125;
    new_Skin.M416_x4 = 1010041124;
    new_Skin.M416_x6 = 203015;
    new_Skin.M416_quickMag = 1010041134;
    new_Skin.M416_extendedMag = 1010041129;
    new_Skin.M416_quickNextended = 1010041135;
    new_Skin.M416_stock = 1010041146;
    new_Skin.M416_stock2 = 1010041146;
    new_Skin.M416_stock3 = 1010041146;
    new_Skin.M416_stock4 = 1010041146;
    new_Skin.M416_stock5 = 1010041146;
    new_Skin.M416_verical = 1010041145;
    new_Skin.M416_angle = 1010041139;
    new_Skin.M416_lightgrip = 202004;
    new_Skin.M416_pink = 202005;
    new_Skin.M416_lazer = 203015;
    new_Skin.M416_thumb = 202006;
  }
  if (preferences.Config.Skin.M416 == 7) {
    new_Skin.M416_1 = 1101004163;
    new_Skin.M416_2 = 1010041631;
    new_Skin.M416_3 = 1010041632;
    new_Skin.M416_4 = 1010041633;
    new_Skin.M416_flash = 201010;
    new_Skin.M416_compe = 1010041574;
    new_Skin.M416_silent = 1010041575;
    new_Skin.M416_reddot = 1010041566;
    new_Skin.M416_holo = 1010041565;
    new_Skin.M416_x2 = 1010041564;
    new_Skin.M416_x3 = 1010041560;
    new_Skin.M416_x4 = 1010041554;
    new_Skin.M416_x6 = 203015;
    new_Skin.M416_quickMag = 1010041568;
    new_Skin.M416_extendedMag = 1010041569;
    new_Skin.M416_quickNextended = 1010041567;
    new_Skin.M416_stock = 1010041579;
    new_Skin.M416_stock2 = 1010041579;
    new_Skin.M416_stock3 = 1010041579;
    new_Skin.M416_stock4 = 1010041579;
    new_Skin.M416_stock5 = 1010041579;
    new_Skin.M416_verical = 1010041578;
    new_Skin.M416_angle = 1010041576;
    new_Skin.M416_lightgrip = 20200400;
    new_Skin.M416_pink = 202005;
    new_Skin.M416_lazer = 203015;
    new_Skin.M416_thumb = 1010041577;
  }
  if (preferences.Config.Skin.M416 == 8) {
    new_Skin.M416_1 = 1101004201;
    new_Skin.M416_2 = 1010042011;
    new_Skin.M416_3 = 1010042012;
    new_Skin.M416_4 = 1010042013;
    new_Skin.M416_flash = 1010041956;
    new_Skin.M416_compe = 1010041957;
    new_Skin.M416_silent = 1010041958;
    new_Skin.M416_reddot = 1010041948;
    new_Skin.M416_holo = 1010041947;
    new_Skin.M416_x2 = 1010041946;
    new_Skin.M416_x3 = 1010041945;
    new_Skin.M416_x4 = 1010041944;
    new_Skin.M416_x6 = 1010041967;
    new_Skin.M416_quickMag = 1010041949;
    new_Skin.M416_extendedMag = 1010041950;
    new_Skin.M416_quickNextended = 1010041955;
    new_Skin.M416_stock = 1010041966;
    new_Skin.M416_stock2 = 1010041966;
    new_Skin.M416_stock3 = 1010041966;
    new_Skin.M416_stock4 = 1010041966;
    new_Skin.M416_stock5 = 1010041966;
    new_Skin.M416_verical = 1010041965;
    new_Skin.M416_angle = 1010041959;
    new_Skin.M416_lightgrip = 202004;
    new_Skin.M416_pink = 202005;
    new_Skin.M416_lazer = 203015;
    new_Skin.M416_thumb = 202006;
  }
  if (preferences.Config.Skin.M416 == 9) {
    new_Skin.M416_1 = 1101004209;
    new_Skin.M416_2 = 1010042073;
    new_Skin.M416_3 = 1010042083;
    new_Skin.M416_4 = 1010042093;
    new_Skin.M416_flash = 20101000;
    new_Skin.M416_compe = 1010042037;
    new_Skin.M416_silent = 1010042039;
    new_Skin.M416_reddot = 1010042029;
    new_Skin.M416_holo = 1010042028;
    new_Skin.M416_x2 = 1010042027;
    new_Skin.M416_x3 = 1010042026;
    new_Skin.M416_x4 = 1010042025;
    new_Skin.M416_x6 = 1010042024;
    new_Skin.M416_quickMag = 1010042034;
    new_Skin.M416_extendedMag = 1010042035;
    new_Skin.M416_quickNextended = 1010042036;
    new_Skin.M416_stock = 1010042047;
    new_Skin.M416_stock2 = 1010042047;
    new_Skin.M416_stock3 = 1010042047;
    new_Skin.M416_stock4 = 1010042047;
    new_Skin.M416_stock5 = 1010042047;
    new_Skin.M416_verical = 1010042046;
    new_Skin.M416_angle = 1010042044;
    new_Skin.M416_lightgrip = 202004;
    new_Skin.M416_pink = 202005;
    new_Skin.M416_lazer = 203015;
    new_Skin.M416_thumb = 202006;
  }
  if (preferences.Config.Skin.M416 == 10) {
    new_Skin.M416_1 = 1101004218;
    new_Skin.M416_2 = 1010042153;
    new_Skin.M416_3 = 1010042163;
    new_Skin.M416_4 = 1010042173;
    new_Skin.M416_flash = 1010042128;
    new_Skin.M416_compe = 1010042127;
    new_Skin.M416_silent = 1010042129;
    new_Skin.M416_reddot = 1010042119;
    new_Skin.M416_holo = 1010042118;
    new_Skin.M416_x2 = 1010042117;
    new_Skin.M416_x3 = 1010042116;
    new_Skin.M416_x4 = 1010042115;
    new_Skin.M416_x6 = 1010042114;
    new_Skin.M416_quickMag = 1010042124;
    new_Skin.M416_extendedMag = 1010042125;
    new_Skin.M416_quickNextended = 1010042126;
    new_Skin.M416_stock = 1010042137;
    new_Skin.M416_stock2 = 1010042137;
    new_Skin.M416_stock3 = 1010042137;
    new_Skin.M416_stock4 = 1010042137;
    new_Skin.M416_stock5 = 1010042137;
    new_Skin.M416_verical = 1010042136;
    new_Skin.M416_angle = 1010042134;
    new_Skin.M416_lightgrip = 1010042138;
    new_Skin.M416_pink = 1010042139;
    new_Skin.M416_lazer = 1010042144;
    new_Skin.M416_thumb = 1010042135;
  }
  if (preferences.Config.Skin.M416 == 11) {
    new_Skin.M416_1 = 1101004226;
    new_Skin.M416_2 = 11010042214;
    new_Skin.M416_3 = 11010042215;
    new_Skin.M416_4 = 11010042216;
    new_Skin.M416_flash = 1010042238;
    new_Skin.M416_compe = 1010042237;
    new_Skin.M416_silent = 1010042239;
    new_Skin.M416_reddot = 1010042233;
    new_Skin.M416_holo = 1010042232;
    new_Skin.M416_x2 = 1010042231;
    new_Skin.M416_x3 = 1010042219;
    new_Skin.M416_x4 = 1010042218;
    new_Skin.M416_x6 = 1010042217;
    new_Skin.M416_quickMag = 1010042234;
    new_Skin.M416_extendedMag = 1010042235;
    new_Skin.M416_quickNextended = 1010042236;
    new_Skin.M416_stock = 1010042244;
    new_Skin.M416_stock2 = 1010042244;
    new_Skin.M416_stock3 = 1010042244;
    new_Skin.M416_stock4 = 1010042244;
    new_Skin.M416_stock5 = 1010042244;
    new_Skin.M416_verical = 1010042243;
    new_Skin.M416_thumb = 1010042242;
    new_Skin.M416_angle = 1010042241;
    new_Skin.M416_lightgrip = 1010042245;
    new_Skin.M416_pink = 1010042246;
    new_Skin.M416_lazer = 1010042247;
  }
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.M416 == 0) {
    new_Skin.M4168 = 1010042;
    new_Skin.M416_2 = 291004;
    new_Skin.M416_3 = 203008;
    new_Skin.M416_4 = 205005;
    new_Skin.M416_flash = 201010;
    new_Skin.M416_compe = 201009;
    new_Skin.M416_silent = 201011;
    new_Skin.M416_reddot = 203001;
    new_Skin.M416_holo = 203002;
    new_Skin.M416_x2 = 203003;
    new_Skin.M416_x3 = 203014;
    new_Skin.M416_x4 = 203004;
    new_Skin.M416_x6 = 203015;
    new_Skin.M416_quickMag = 204012;
    new_Skin.M416_extendedMag = 204011;
    new_Skin.M416_quickNextended = 204013;
    new_Skin.M416_stock = 205002;
    new_Skin.M416_stock2 = 2050022;
    new_Skin.M416_stock3 = 2050023;
    new_Skin.M416_stock4 = 2050024;
    new_Skin.M416_stock5 = 2050025;
    new_Skin.M416_verical = 203015;
    new_Skin.M416_angle = 202001;
    new_Skin.M416_lightgrip = 202004;
    new_Skin.M416_pink = 202005;
    new_Skin.M416_lazer = 203015;
    new_Skin.M416_thumb = 202006;
  }
  if (preferences.Config.Skin.M416 == 1) {
    new_Skin.M4168 = 1101004046;
    new_Skin.M416_2 = 1010040461;
    new_Skin.M416_3 = 1010040462;
    new_Skin.M416_4 = 1010040463;
    new_Skin.M416_flash = 1010040474;
    new_Skin.M416_compe = 1010040475;
    new_Skin.M416_silent = 1010040476;
    new_Skin.M416_reddot = 1010040470;
    new_Skin.M416_holo = 1010040469;
    new_Skin.M416_x2 = 1010040468;
    new_Skin.M416_x3 = 1010040467;
    new_Skin.M416_x4 = 1010040466;
    new_Skin.M416_x6 = 1010040481;
    new_Skin.M416_quickMag = 1010040471;
    new_Skin.M416_extendedMag = 1010040472;
    new_Skin.M416_quickNextended = 1010040473;
    new_Skin.M416_stock = 1010040480;
    new_Skin.M416_stock2 = 1010040480;
    new_Skin.M416_stock3 = 1010040480;
    new_Skin.M416_stock4 = 1010040480;
    new_Skin.M416_stock5 = 1010040480;
    new_Skin.M416_verical = 1010040479;
    new_Skin.M416_thumb = 1010040478;
    new_Skin.M416_angle = 1010040477;
    new_Skin.M416_lightgrip = 1010040482;
    new_Skin.M416_pink = 1010040483;
    new_Skin.M416_lazer = 1010040484;
  }
  if (preferences.Config.Skin.M416 == 2) {
    new_Skin.M4168 = 1101004062;
    new_Skin.M416_2 = 1010040611;
    new_Skin.M416_3 = 1010040612;
    new_Skin.M416_4 = 1010040613;
    new_Skin.M416_flash = 201010;
    new_Skin.M416_compe = 201009;
    new_Skin.M416_silent = 201011;
    new_Skin.M416_reddot = 203001;
    new_Skin.M416_holo = 203002;
    new_Skin.M416_x2 = 203003;
    new_Skin.M416_x3 = 203014;
    new_Skin.M416_x4 = 203004;
    new_Skin.M416_x6 = 203015;
    new_Skin.M416_quickMag = 204012;
    new_Skin.M416_extendedMag = 204011;
    new_Skin.M416_quickNextended = 204013;
    new_Skin.M416_stock = 205002;
    new_Skin.M416_stock2 = 205002;
    new_Skin.M416_stock3 = 205002;
    new_Skin.M416_stock4 = 205002;
    new_Skin.M416_stock5 = 205002;
    new_Skin.M416_verical = 203015;
    new_Skin.M416_angle = 202001;
    new_Skin.M416_lightgrip = 202004;
    new_Skin.M416_pink = 202005;
    new_Skin.M416_lazer = 203015;
    new_Skin.M416_thumb = 202006;
  }
  if (preferences.Config.Skin.M416 == 3) {
    new_Skin.M4168 = 1101004078;
    new_Skin.M416_2 = 1010040781;
    new_Skin.M416_3 = 1010040782;
    new_Skin.M416_4 = 1010040783;
    new_Skin.M416_flash = 201010;
    new_Skin.M416_compe = 201009;
    new_Skin.M416_silent = 201011;
    new_Skin.M416_reddot = 203001;
    new_Skin.M416_holo = 203002;
    new_Skin.M416_x2 = 203003;
    new_Skin.M416_x3 = 203014;
    new_Skin.M416_x4 = 203004;
    new_Skin.M416_x6 = 203015;
    new_Skin.M416_quickMag = 204012;
    new_Skin.M416_extendedMag = 204011;
    new_Skin.M416_quickNextended = 204013;
    new_Skin.M416_stock = 205002;
    new_Skin.M416_stock2 = 205002;
    new_Skin.M416_stock3 = 205002;
    new_Skin.M416_stock4 = 205002;
    new_Skin.M416_stock5 = 205002;
    new_Skin.M416_verical = 203015;
    new_Skin.M416_angle = 202001;
    new_Skin.M416_lightgrip = 202004;
    new_Skin.M416_pink = 202005;
    new_Skin.M416_lazer = 203015;
    new_Skin.M416_thumb = 202006;
  }
  if (preferences.Config.Skin.M416 == 4) {
    new_Skin.M4168 = 1101004086;
    new_Skin.M416_2 = 1010040861;
    new_Skin.M416_3 = 1010040862;
    new_Skin.M416_4 = 1010040863;
    new_Skin.M416_flash = 201010;
    new_Skin.M416_compe = 201009;
    new_Skin.M416_silent = 201011;
    new_Skin.M416_reddot = 203001;
    new_Skin.M416_holo = 203002;
    new_Skin.M416_x2 = 203003;
    new_Skin.M416_x3 = 203014;
    new_Skin.M416_x4 = 203004;
    new_Skin.M416_x6 = 203015;
    new_Skin.M416_quickMag = 204012;
    new_Skin.M416_extendedMag = 204011;
    new_Skin.M416_quickNextended = 204013;
    new_Skin.M416_stock = 205002;
    new_Skin.M416_stock2 = 205002;
    new_Skin.M416_stock3 = 205002;
    new_Skin.M416_stock4 = 205002;
    new_Skin.M416_stock5 = 205002;
    new_Skin.M416_verical = 203015;
    new_Skin.M416_angle = 202001;
    new_Skin.M416_lightgrip = 202004;
    new_Skin.M416_pink = 202005;
    new_Skin.M416_lazer = 203015;
    new_Skin.M416_thumb = 202006;
  }
  if (preferences.Config.Skin.M416 == 5) {
    new_Skin.M4168 = 1101004098;
    new_Skin.M416_2 = 1010040981;
    new_Skin.M416_3 = 1010040982;
    new_Skin.M416_4 = 1010040983;
    new_Skin.M416_flash = 201010;
    new_Skin.M416_compe = 201009;
    new_Skin.M416_silent = 201011;
    new_Skin.M416_reddot = 203001;
    new_Skin.M416_holo = 203002;
    new_Skin.M416_x2 = 203003;
    new_Skin.M416_x3 = 203014;
    new_Skin.M416_x4 = 203004;
    new_Skin.M416_x6 = 203015;
    new_Skin.M416_quickMag = 204012;
    new_Skin.M416_extendedMag = 204011;
    new_Skin.M416_quickNextended = 204013;
    new_Skin.M416_stock = 205002;
    new_Skin.M416_stock2 = 205002;
    new_Skin.M416_stock3 = 205002;
    new_Skin.M416_stock4 = 205002;
    new_Skin.M416_stock5 = 205002;
    new_Skin.M416_verical = 203015;
    new_Skin.M416_angle = 202001;
    new_Skin.M416_lightgrip = 202004;
    new_Skin.M416_pink = 202005;
    new_Skin.M416_lazer = 203015;
    new_Skin.M416_thumb = 202006;
  }
  if (preferences.Config.Skin.M416 == 6) {
    new_Skin.M4168 = 1101004138;
    new_Skin.M416_2 = 1010041381;
    new_Skin.M416_3 = 1010041382;
    new_Skin.M416_4 = 1010041383;
    new_Skin.M416_flash = 1010041136;
    new_Skin.M416_compe = 1010041137;
    new_Skin.M416_silent = 1010041138;
    new_Skin.M416_reddot = 1010041128;
    new_Skin.M416_holo = 1010041127;
    new_Skin.M416_x2 = 1010041126;
    new_Skin.M416_x3 = 1010041125;
    new_Skin.M416_x4 = 1010041124;
    new_Skin.M416_x6 = 203015;
    new_Skin.M416_quickMag = 1010041134;
    new_Skin.M416_extendedMag = 1010041129;
    new_Skin.M416_quickNextended = 1010041135;
    new_Skin.M416_stock = 1010041146;
    new_Skin.M416_stock2 = 1010041146;
    new_Skin.M416_stock3 = 1010041146;
    new_Skin.M416_stock4 = 1010041146;
    new_Skin.M416_stock5 = 1010041146;
    new_Skin.M416_verical = 1010041145;
    new_Skin.M416_angle = 1010041139;
    new_Skin.M416_lightgrip = 202004;
    new_Skin.M416_pink = 202005;
    new_Skin.M416_lazer = 203015;
    new_Skin.M416_thumb = 202006;
  }
  if (preferences.Config.Skin.M416 == 7) {
    new_Skin.M4168 = 1101004163;
    new_Skin.M416_2 = 1010041631;
    new_Skin.M416_3 = 1010041632;
    new_Skin.M416_4 = 1010041633;
    new_Skin.M416_flash = 201010;
    new_Skin.M416_compe = 1010041574;
    new_Skin.M416_silent = 1010041575;
    new_Skin.M416_reddot = 1010041566;
    new_Skin.M416_holo = 1010041565;
    new_Skin.M416_x2 = 1010041564;
    new_Skin.M416_x3 = 1010041560;
    new_Skin.M416_x4 = 1010041554;
    new_Skin.M416_x6 = 203015;
    new_Skin.M416_quickMag = 1010041568;
    new_Skin.M416_extendedMag = 1010041569;
    new_Skin.M416_quickNextended = 1010041567;
    new_Skin.M416_stock = 1010041579;
    new_Skin.M416_stock2 = 1010041579;
    new_Skin.M416_stock3 = 1010041579;
    new_Skin.M416_stock4 = 1010041579;
    new_Skin.M416_stock5 = 1010041579;
    new_Skin.M416_verical = 1010041578;
    new_Skin.M416_angle = 1010041576;
    new_Skin.M416_lightgrip = 20200400;
    new_Skin.M416_pink = 202005;
    new_Skin.M416_lazer = 203015;
    new_Skin.M416_thumb = 1010041577;
  }
  if (preferences.Config.Skin.M416 == 8) {
    new_Skin.M4168 = 1101004201;
    new_Skin.M416_2 = 1010042011;
    new_Skin.M416_3 = 1010042012;
    new_Skin.M416_4 = 1010042013;
    new_Skin.M416_flash = 1010041956;
    new_Skin.M416_compe = 1010041957;
    new_Skin.M416_silent = 1010041958;
    new_Skin.M416_reddot = 1010041948;
    new_Skin.M416_holo = 1010041947;
    new_Skin.M416_x2 = 1010041946;
    new_Skin.M416_x3 = 1010041945;
    new_Skin.M416_x4 = 1010041944;
    new_Skin.M416_x6 = 1010041967;
    new_Skin.M416_quickMag = 1010041949;
    new_Skin.M416_extendedMag = 1010041950;
    new_Skin.M416_quickNextended = 1010041955;
    new_Skin.M416_stock = 1010041966;
    new_Skin.M416_stock2 = 1010041966;
    new_Skin.M416_stock3 = 1010041966;
    new_Skin.M416_stock4 = 1010041966;
    new_Skin.M416_stock5 = 1010041966;
    new_Skin.M416_verical = 1010041965;
    new_Skin.M416_angle = 1010041959;
    new_Skin.M416_lightgrip = 202004;
    new_Skin.M416_pink = 202005;
    new_Skin.M416_lazer = 203015;
    new_Skin.M416_thumb = 202006;
  }
  if (preferences.Config.Skin.M416 == 9) {
    new_Skin.M4168 = 1101004209;
    new_Skin.M416_2 = 1010042073;
    new_Skin.M416_3 = 1010042083;
    new_Skin.M416_4 = 1010042093;
    new_Skin.M416_flash = 20101000;
    new_Skin.M416_compe = 1010042037;
    new_Skin.M416_silent = 1010042039;
    new_Skin.M416_reddot = 1010042029;
    new_Skin.M416_holo = 1010042028;
    new_Skin.M416_x2 = 1010042027;
    new_Skin.M416_x3 = 1010042026;
    new_Skin.M416_x4 = 1010042025;
    new_Skin.M416_x6 = 1010042024;
    new_Skin.M416_quickMag = 1010042034;
    new_Skin.M416_extendedMag = 1010042035;
    new_Skin.M416_quickNextended = 1010042036;
    new_Skin.M416_stock = 1010042047;
    new_Skin.M416_stock2 = 1010042047;
    new_Skin.M416_stock3 = 1010042047;
    new_Skin.M416_stock4 = 1010042047;
    new_Skin.M416_stock5 = 1010042047;
    new_Skin.M416_verical = 1010042046;
    new_Skin.M416_angle = 1010042044;
    new_Skin.M416_lightgrip = 202004;
    new_Skin.M416_pink = 202005;
    new_Skin.M416_lazer = 203015;
    new_Skin.M416_thumb = 202006;
  }
  if (preferences.Config.Skin.M416 == 10) {
    new_Skin.M4168 = 1101004218;
    new_Skin.M416_2 = 1010042153;
    new_Skin.M416_3 = 1010042163;
    new_Skin.M416_4 = 1010042173;
    new_Skin.M416_flash = 1010042128;
    new_Skin.M416_compe = 1010042127;
    new_Skin.M416_silent = 1010042129;
    new_Skin.M416_reddot = 1010042119;
    new_Skin.M416_holo = 1010042118;
    new_Skin.M416_x2 = 1010042117;
    new_Skin.M416_x3 = 1010042116;
    new_Skin.M416_x4 = 1010042115;
    new_Skin.M416_x6 = 1010042114;
    new_Skin.M416_quickMag = 1010042124;
    new_Skin.M416_extendedMag = 1010042125;
    new_Skin.M416_quickNextended = 1010042126;
    new_Skin.M416_stock = 1010042137;
    new_Skin.M416_stock2 = 1010042137;
    new_Skin.M416_stock3 = 1010042137;
    new_Skin.M416_stock4 = 1010042137;
    new_Skin.M416_stock5 = 1010042137;
    new_Skin.M416_verical = 1010042136;
    new_Skin.M416_angle = 1010042134;
    new_Skin.M416_lightgrip = 1010042138;
    new_Skin.M416_pink = 1010042139;
    new_Skin.M416_lazer = 1010042144;
    new_Skin.M416_thumb = 1010042135;
  }
  if (preferences.Config.Skin.M416 == 11) {
    new_Skin.M4168 = 1101004226;
    new_Skin.M416_2 = 11010042214;
    new_Skin.M416_3 = 11010042215;
    new_Skin.M416_4 = 11010042216;
    new_Skin.M416_flash = 1010042238;
    new_Skin.M416_compe = 1010042237;
    new_Skin.M416_silent = 1010042239;
    new_Skin.M416_reddot = 1010042233;
    new_Skin.M416_holo = 1010042232;
    new_Skin.M416_x2 = 1010042231;
    new_Skin.M416_x3 = 1010042219;
    new_Skin.M416_x4 = 1010042218;
    new_Skin.M416_x6 = 1010042217;
    new_Skin.M416_quickMag = 1010042234;
    new_Skin.M416_extendedMag = 1010042235;
    new_Skin.M416_quickNextended = 1010042236;
    new_Skin.M416_stock = 1010042244;
    new_Skin.M416_stock2 = 1010042244;
    new_Skin.M416_stock3 = 1010042244;
    new_Skin.M416_stock4 = 1010042244;
    new_Skin.M416_stock5 = 1010042244;
    new_Skin.M416_verical = 1010042243;
    new_Skin.M416_thumb = 1010042242;
    new_Skin.M416_angle = 1010042241;
    new_Skin.M416_lightgrip = 1010042245;
    new_Skin.M416_pink = 1010042246;
    new_Skin.M416_lazer = 1010042247;
  }
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.M416 == 0) {
    new_Skin.M4169 = 1010043;
    new_Skin.M416_2 = 291004;
    new_Skin.M416_3 = 203008;
    new_Skin.M416_4 = 205005;
    new_Skin.M416_flash = 201010;
    new_Skin.M416_compe = 201009;
    new_Skin.M416_silent = 201011;
    new_Skin.M416_reddot = 203001;
    new_Skin.M416_holo = 203002;
    new_Skin.M416_x2 = 203003;
    new_Skin.M416_x3 = 203014;
    new_Skin.M416_x4 = 203004;
    new_Skin.M416_x6 = 203015;
    new_Skin.M416_quickMag = 204012;
    new_Skin.M416_extendedMag = 204011;
    new_Skin.M416_quickNextended = 204013;
    new_Skin.M416_stock = 205002;
    new_Skin.M416_stock2 = 2050022;
    new_Skin.M416_stock3 = 2050023;
    new_Skin.M416_stock4 = 2050024;
    new_Skin.M416_stock5 = 2050025;
    new_Skin.M416_verical = 203015;
    new_Skin.M416_angle = 202001;
    new_Skin.M416_lightgrip = 202004;
    new_Skin.M416_pink = 202005;
    new_Skin.M416_lazer = 203015;
    new_Skin.M416_thumb = 202006;
  }
  if (preferences.Config.Skin.M416 == 1) {
    new_Skin.M4169 = 1101004046;
    new_Skin.M416_2 = 1010040461;
    new_Skin.M416_3 = 1010040462;
    new_Skin.M416_4 = 1010040463;
    new_Skin.M416_flash = 1010040474;
    new_Skin.M416_compe = 1010040475;
    new_Skin.M416_silent = 1010040476;
    new_Skin.M416_reddot = 1010040470;
    new_Skin.M416_holo = 1010040469;
    new_Skin.M416_x2 = 1010040468;
    new_Skin.M416_x3 = 1010040467;
    new_Skin.M416_x4 = 1010040466;
    new_Skin.M416_x6 = 1010040481;
    new_Skin.M416_quickMag = 1010040471;
    new_Skin.M416_extendedMag = 1010040472;
    new_Skin.M416_quickNextended = 1010040473;
    new_Skin.M416_stock = 1010040480;
    new_Skin.M416_stock2 = 1010040480;
    new_Skin.M416_stock3 = 1010040480;
    new_Skin.M416_stock4 = 1010040480;
    new_Skin.M416_stock5 = 1010040480;
    new_Skin.M416_verical = 1010040479;
    new_Skin.M416_thumb = 1010040478;
    new_Skin.M416_angle = 1010040477;
    new_Skin.M416_lightgrip = 1010040482;
    new_Skin.M416_pink = 1010040483;
    new_Skin.M416_lazer = 1010040484;
  }
  if (preferences.Config.Skin.M416 == 2) {
    new_Skin.M4169 = 1101004062;
    new_Skin.M416_2 = 1010040611;
    new_Skin.M416_3 = 1010040612;
    new_Skin.M416_4 = 1010040613;
    new_Skin.M416_flash = 201010;
    new_Skin.M416_compe = 201009;
    new_Skin.M416_silent = 201011;
    new_Skin.M416_reddot = 203001;
    new_Skin.M416_holo = 203002;
    new_Skin.M416_x2 = 203003;
    new_Skin.M416_x3 = 203014;
    new_Skin.M416_x4 = 203004;
    new_Skin.M416_x6 = 203015;
    new_Skin.M416_quickMag = 204012;
    new_Skin.M416_extendedMag = 204011;
    new_Skin.M416_quickNextended = 204013;
    new_Skin.M416_stock = 205002;
    new_Skin.M416_stock2 = 205002;
    new_Skin.M416_stock3 = 205002;
    new_Skin.M416_stock4 = 205002;
    new_Skin.M416_stock5 = 205002;
    new_Skin.M416_verical = 203015;
    new_Skin.M416_angle = 202001;
    new_Skin.M416_lightgrip = 202004;
    new_Skin.M416_pink = 202005;
    new_Skin.M416_lazer = 203015;
    new_Skin.M416_thumb = 202006;
  }
  if (preferences.Config.Skin.M416 == 3) {
    new_Skin.M4169 = 1101004078;
    new_Skin.M416_2 = 1010040781;
    new_Skin.M416_3 = 1010040782;
    new_Skin.M416_4 = 1010040783;
    new_Skin.M416_flash = 201010;
    new_Skin.M416_compe = 201009;
    new_Skin.M416_silent = 201011;
    new_Skin.M416_reddot = 203001;
    new_Skin.M416_holo = 203002;
    new_Skin.M416_x2 = 203003;
    new_Skin.M416_x3 = 203014;
    new_Skin.M416_x4 = 203004;
    new_Skin.M416_x6 = 203015;
    new_Skin.M416_quickMag = 204012;
    new_Skin.M416_extendedMag = 204011;
    new_Skin.M416_quickNextended = 204013;
    new_Skin.M416_stock = 205002;
    new_Skin.M416_stock2 = 205002;
    new_Skin.M416_stock3 = 205002;
    new_Skin.M416_stock4 = 205002;
    new_Skin.M416_stock5 = 205002;
    new_Skin.M416_verical = 203015;
    new_Skin.M416_angle = 202001;
    new_Skin.M416_lightgrip = 202004;
    new_Skin.M416_pink = 202005;
    new_Skin.M416_lazer = 203015;
    new_Skin.M416_thumb = 202006;
  }
  if (preferences.Config.Skin.M416 == 4) {
    new_Skin.M4169 = 1101004086;
    new_Skin.M416_2 = 1010040861;
    new_Skin.M416_3 = 1010040862;
    new_Skin.M416_4 = 1010040863;
    new_Skin.M416_flash = 201010;
    new_Skin.M416_compe = 201009;
    new_Skin.M416_silent = 201011;
    new_Skin.M416_reddot = 203001;
    new_Skin.M416_holo = 203002;
    new_Skin.M416_x2 = 203003;
    new_Skin.M416_x3 = 203014;
    new_Skin.M416_x4 = 203004;
    new_Skin.M416_x6 = 203015;
    new_Skin.M416_quickMag = 204012;
    new_Skin.M416_extendedMag = 204011;
    new_Skin.M416_quickNextended = 204013;
    new_Skin.M416_stock = 205002;
    new_Skin.M416_stock2 = 205002;
    new_Skin.M416_stock3 = 205002;
    new_Skin.M416_stock4 = 205002;
    new_Skin.M416_stock5 = 205002;
    new_Skin.M416_verical = 203015;
    new_Skin.M416_angle = 202001;
    new_Skin.M416_lightgrip = 202004;
    new_Skin.M416_pink = 202005;
    new_Skin.M416_lazer = 203015;
    new_Skin.M416_thumb = 202006;
  }
  if (preferences.Config.Skin.M416 == 5) {
    new_Skin.M4169 = 1101004098;
    new_Skin.M416_2 = 1010040981;
    new_Skin.M416_3 = 1010040982;
    new_Skin.M416_4 = 1010040983;
    new_Skin.M416_flash = 201010;
    new_Skin.M416_compe = 201009;
    new_Skin.M416_silent = 201011;
    new_Skin.M416_reddot = 203001;
    new_Skin.M416_holo = 203002;
    new_Skin.M416_x2 = 203003;
    new_Skin.M416_x3 = 203014;
    new_Skin.M416_x4 = 203004;
    new_Skin.M416_x6 = 203015;
    new_Skin.M416_quickMag = 204012;
    new_Skin.M416_extendedMag = 204011;
    new_Skin.M416_quickNextended = 204013;
    new_Skin.M416_stock = 205002;
    new_Skin.M416_stock2 = 205002;
    new_Skin.M416_stock3 = 205002;
    new_Skin.M416_stock4 = 205002;
    new_Skin.M416_stock5 = 205002;
    new_Skin.M416_verical = 203015;
    new_Skin.M416_angle = 202001;
    new_Skin.M416_lightgrip = 202004;
    new_Skin.M416_pink = 202005;
    new_Skin.M416_lazer = 203015;
    new_Skin.M416_thumb = 202006;
  }
  if (preferences.Config.Skin.M416 == 6) {
    new_Skin.M4169 = 1101004138;
    new_Skin.M416_2 = 1010041381;
    new_Skin.M416_3 = 1010041382;
    new_Skin.M416_4 = 1010041383;
    new_Skin.M416_flash = 1010041136;
    new_Skin.M416_compe = 1010041137;
    new_Skin.M416_silent = 1010041138;
    new_Skin.M416_reddot = 1010041128;
    new_Skin.M416_holo = 1010041127;
    new_Skin.M416_x2 = 1010041126;
    new_Skin.M416_x3 = 1010041125;
    new_Skin.M416_x4 = 1010041124;
    new_Skin.M416_x6 = 203015;
    new_Skin.M416_quickMag = 1010041134;
    new_Skin.M416_extendedMag = 1010041129;
    new_Skin.M416_quickNextended = 1010041135;
    new_Skin.M416_stock = 1010041146;
    new_Skin.M416_stock2 = 1010041146;
    new_Skin.M416_stock3 = 1010041146;
    new_Skin.M416_stock4 = 1010041146;
    new_Skin.M416_stock5 = 1010041146;
    new_Skin.M416_verical = 1010041145;
    new_Skin.M416_angle = 1010041139;
    new_Skin.M416_lightgrip = 202004;
    new_Skin.M416_pink = 202005;
    new_Skin.M416_lazer = 203015;
    new_Skin.M416_thumb = 202006;
  }
  if (preferences.Config.Skin.M416 == 7) {
    new_Skin.M4169 = 1101004163;
    new_Skin.M416_2 = 1010041631;
    new_Skin.M416_3 = 1010041632;
    new_Skin.M416_4 = 1010041633;
    new_Skin.M416_flash = 201010;
    new_Skin.M416_compe = 1010041574;
    new_Skin.M416_silent = 1010041575;
    new_Skin.M416_reddot = 1010041566;
    new_Skin.M416_holo = 1010041565;
    new_Skin.M416_x2 = 1010041564;
    new_Skin.M416_x3 = 1010041560;
    new_Skin.M416_x4 = 1010041554;
    new_Skin.M416_x6 = 203015;
    new_Skin.M416_quickMag = 1010041568;
    new_Skin.M416_extendedMag = 1010041569;
    new_Skin.M416_quickNextended = 1010041567;
    new_Skin.M416_stock = 1010041579;
    new_Skin.M416_stock2 = 1010041579;
    new_Skin.M416_stock3 = 1010041579;
    new_Skin.M416_stock4 = 1010041579;
    new_Skin.M416_stock5 = 1010041579;
    new_Skin.M416_verical = 1010041578;
    new_Skin.M416_angle = 1010041576;
    new_Skin.M416_lightgrip = 20200400;
    new_Skin.M416_pink = 202005;
    new_Skin.M416_lazer = 203015;
    new_Skin.M416_thumb = 1010041577;
  }
  if (preferences.Config.Skin.M416 == 8) {
    new_Skin.M4169 = 1101004201;
    new_Skin.M416_2 = 1010042011;
    new_Skin.M416_3 = 1010042012;
    new_Skin.M416_4 = 1010042013;
    new_Skin.M416_flash = 1010041956;
    new_Skin.M416_compe = 1010041957;
    new_Skin.M416_silent = 1010041958;
    new_Skin.M416_reddot = 1010041948;
    new_Skin.M416_holo = 1010041947;
    new_Skin.M416_x2 = 1010041946;
    new_Skin.M416_x3 = 1010041945;
    new_Skin.M416_x4 = 1010041944;
    new_Skin.M416_x6 = 1010041967;
    new_Skin.M416_quickMag = 1010041949;
    new_Skin.M416_extendedMag = 1010041950;
    new_Skin.M416_quickNextended = 1010041955;
    new_Skin.M416_stock = 1010041966;
    new_Skin.M416_stock2 = 1010041966;
    new_Skin.M416_stock3 = 1010041966;
    new_Skin.M416_stock4 = 1010041966;
    new_Skin.M416_stock5 = 1010041966;
    new_Skin.M416_verical = 1010041965;
    new_Skin.M416_angle = 1010041959;
    new_Skin.M416_lightgrip = 202004;
    new_Skin.M416_pink = 202005;
    new_Skin.M416_lazer = 203015;
    new_Skin.M416_thumb = 202006;
  }
  if (preferences.Config.Skin.M416 == 9) {
    new_Skin.M4169 = 1101004209;
    new_Skin.M416_2 = 1010042073;
    new_Skin.M416_3 = 1010042083;
    new_Skin.M416_4 = 1010042093;
    new_Skin.M416_flash = 20101000;
    new_Skin.M416_compe = 1010042037;
    new_Skin.M416_silent = 1010042039;
    new_Skin.M416_reddot = 1010042029;
    new_Skin.M416_holo = 1010042028;
    new_Skin.M416_x2 = 1010042027;
    new_Skin.M416_x3 = 1010042026;
    new_Skin.M416_x4 = 1010042025;
    new_Skin.M416_x6 = 1010042024;
    new_Skin.M416_quickMag = 1010042034;
    new_Skin.M416_extendedMag = 1010042035;
    new_Skin.M416_quickNextended = 1010042036;
    new_Skin.M416_stock = 1010042047;
    new_Skin.M416_stock2 = 1010042047;
    new_Skin.M416_stock3 = 1010042047;
    new_Skin.M416_stock4 = 1010042047;
    new_Skin.M416_stock5 = 1010042047;
    new_Skin.M416_verical = 1010042046;
    new_Skin.M416_angle = 1010042044;
    new_Skin.M416_lightgrip = 202004;
    new_Skin.M416_pink = 202005;
    new_Skin.M416_lazer = 203015;
    new_Skin.M416_thumb = 202006;
  }
  if (preferences.Config.Skin.M416 == 10) {
    new_Skin.M4169 = 1101004218;
    new_Skin.M416_2 = 1010042153;
    new_Skin.M416_3 = 1010042163;
    new_Skin.M416_4 = 1010042173;
    new_Skin.M416_flash = 1010042128;
    new_Skin.M416_compe = 1010042127;
    new_Skin.M416_silent = 1010042129;
    new_Skin.M416_reddot = 1010042119;
    new_Skin.M416_holo = 1010042118;
    new_Skin.M416_x2 = 1010042117;
    new_Skin.M416_x3 = 1010042116;
    new_Skin.M416_x4 = 1010042115;
    new_Skin.M416_x6 = 1010042114;
    new_Skin.M416_quickMag = 1010042124;
    new_Skin.M416_extendedMag = 1010042125;
    new_Skin.M416_quickNextended = 1010042126;
    new_Skin.M416_stock = 1010042137;
    new_Skin.M416_stock2 = 1010042137;
    new_Skin.M416_stock3 = 1010042137;
    new_Skin.M416_stock4 = 1010042137;
    new_Skin.M416_stock5 = 1010042137;
    new_Skin.M416_verical = 1010042136;
    new_Skin.M416_angle = 1010042134;
    new_Skin.M416_lightgrip = 1010042138;
    new_Skin.M416_pink = 1010042139;
    new_Skin.M416_lazer = 1010042144;
    new_Skin.M416_thumb = 1010042135;
  }
  if (preferences.Config.Skin.M416 == 11) {
    new_Skin.M4169 = 1101004226;
    new_Skin.M416_2 = 11010042214;
    new_Skin.M416_3 = 11010042215;
    new_Skin.M416_4 = 11010042216;
    new_Skin.M416_flash = 1010042238;
    new_Skin.M416_compe = 1010042237;
    new_Skin.M416_silent = 1010042239;
    new_Skin.M416_reddot = 1010042233;
    new_Skin.M416_holo = 1010042232;
    new_Skin.M416_x2 = 1010042231;
    new_Skin.M416_x3 = 1010042219;
    new_Skin.M416_x4 = 1010042218;
    new_Skin.M416_x6 = 1010042217;
    new_Skin.M416_quickMag = 1010042234;
    new_Skin.M416_extendedMag = 1010042235;
    new_Skin.M416_quickNextended = 1010042236;
    new_Skin.M416_stock = 1010042244;
    new_Skin.M416_stock2 = 1010042244;
    new_Skin.M416_stock3 = 1010042244;
    new_Skin.M416_stock4 = 1010042244;
    new_Skin.M416_stock5 = 1010042244;
    new_Skin.M416_verical = 1010042243;
    new_Skin.M416_thumb = 1010042242;
    new_Skin.M416_angle = 1010042241;
    new_Skin.M416_lightgrip = 1010042245;
    new_Skin.M416_pink = 1010042246;
    new_Skin.M416_lazer = 1010042247;
  }
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.M416 == 0) {
    new_Skin.M4162 = 1010045;
    new_Skin.M416_2 = 291004;
    new_Skin.M416_3 = 203008;
    new_Skin.M416_4 = 205005;
    new_Skin.M416_flash = 201010;
    new_Skin.M416_compe = 201009;
    new_Skin.M416_silent = 201011;
    new_Skin.M416_reddot = 203001;
    new_Skin.M416_holo = 203002;
    new_Skin.M416_x2 = 203003;
    new_Skin.M416_x3 = 203014;
    new_Skin.M416_x4 = 203004;
    new_Skin.M416_x6 = 203015;
    new_Skin.M416_quickMag = 204012;
    new_Skin.M416_extendedMag = 204011;
    new_Skin.M416_quickNextended = 204013;
    new_Skin.M416_stock = 205002;
    new_Skin.M416_stock2 = 2050022;
    new_Skin.M416_stock3 = 2050023;
    new_Skin.M416_stock4 = 2050024;
    new_Skin.M416_stock5 = 2050025;
    new_Skin.M416_verical = 203015;
    new_Skin.M416_angle = 202001;
    new_Skin.M416_lightgrip = 202004;
    new_Skin.M416_pink = 202005;
    new_Skin.M416_lazer = 203015;
    new_Skin.M416_thumb = 202006;
  }
  if (preferences.Config.Skin.M416 == 1) {
    new_Skin.M4162 = 1101004046;
    new_Skin.M416_2 = 1010040461;
    new_Skin.M416_3 = 1010040462;
    new_Skin.M416_4 = 1010040463;
    new_Skin.M416_flash = 1010040474;
    new_Skin.M416_compe = 1010040475;
    new_Skin.M416_silent = 1010040476;
    new_Skin.M416_reddot = 1010040470;
    new_Skin.M416_holo = 1010040469;
    new_Skin.M416_x2 = 1010040468;
    new_Skin.M416_x3 = 1010040467;
    new_Skin.M416_x4 = 1010040466;
    new_Skin.M416_x6 = 1010040481;
    new_Skin.M416_quickMag = 1010040471;
    new_Skin.M416_extendedMag = 1010040472;
    new_Skin.M416_quickNextended = 1010040473;
    new_Skin.M416_stock = 1010040480;
    new_Skin.M416_stock2 = 1010040480;
    new_Skin.M416_stock3 = 1010040480;
    new_Skin.M416_stock4 = 1010040480;
    new_Skin.M416_stock5 = 1010040480;
    new_Skin.M416_verical = 1010040479;
    new_Skin.M416_thumb = 1010040478;
    new_Skin.M416_angle = 1010040477;
    new_Skin.M416_lightgrip = 1010040482;
    new_Skin.M416_pink = 1010040483;
    new_Skin.M416_lazer = 1010040484;
  }
  if (preferences.Config.Skin.M416 == 2) {
    new_Skin.M4162 = 1101004062;
    new_Skin.M416_2 = 1010040611;
    new_Skin.M416_3 = 1010040612;
    new_Skin.M416_4 = 1010040613;
    new_Skin.M416_flash = 201010;
    new_Skin.M416_compe = 201009;
    new_Skin.M416_silent = 201011;
    new_Skin.M416_reddot = 203001;
    new_Skin.M416_holo = 203002;
    new_Skin.M416_x2 = 203003;
    new_Skin.M416_x3 = 203014;
    new_Skin.M416_x4 = 203004;
    new_Skin.M416_x6 = 203015;
    new_Skin.M416_quickMag = 204012;
    new_Skin.M416_extendedMag = 204011;
    new_Skin.M416_quickNextended = 204013;
    new_Skin.M416_stock = 205002;
    new_Skin.M416_stock2 = 205002;
    new_Skin.M416_stock3 = 205002;
    new_Skin.M416_stock4 = 205002;
    new_Skin.M416_stock5 = 205002;
    new_Skin.M416_verical = 203015;
    new_Skin.M416_angle = 202001;
    new_Skin.M416_lightgrip = 202004;
    new_Skin.M416_pink = 202005;
    new_Skin.M416_lazer = 203015;
    new_Skin.M416_thumb = 202006;
  }
  if (preferences.Config.Skin.M416 == 3) {
    new_Skin.M4162 = 1101004078;
    new_Skin.M416_2 = 1010040781;
    new_Skin.M416_3 = 1010040782;
    new_Skin.M416_4 = 1010040783;
    new_Skin.M416_flash = 201010;
    new_Skin.M416_compe = 201009;
    new_Skin.M416_silent = 201011;
    new_Skin.M416_reddot = 203001;
    new_Skin.M416_holo = 203002;
    new_Skin.M416_x2 = 203003;
    new_Skin.M416_x3 = 203014;
    new_Skin.M416_x4 = 203004;
    new_Skin.M416_x6 = 203015;
    new_Skin.M416_quickMag = 204012;
    new_Skin.M416_extendedMag = 204011;
    new_Skin.M416_quickNextended = 204013;
    new_Skin.M416_stock = 205002;
    new_Skin.M416_stock2 = 205002;
    new_Skin.M416_stock3 = 205002;
    new_Skin.M416_stock4 = 205002;
    new_Skin.M416_stock5 = 205002;
    new_Skin.M416_verical = 203015;
    new_Skin.M416_angle = 202001;
    new_Skin.M416_lightgrip = 202004;
    new_Skin.M416_pink = 202005;
    new_Skin.M416_lazer = 203015;
    new_Skin.M416_thumb = 202006;
  }
  if (preferences.Config.Skin.M416 == 4) {
    new_Skin.M4162 = 1101004086;
    new_Skin.M416_2 = 1010040861;
    new_Skin.M416_3 = 1010040862;
    new_Skin.M416_4 = 1010040863;
    new_Skin.M416_flash = 201010;
    new_Skin.M416_compe = 201009;
    new_Skin.M416_silent = 201011;
    new_Skin.M416_reddot = 203001;
    new_Skin.M416_holo = 203002;
    new_Skin.M416_x2 = 203003;
    new_Skin.M416_x3 = 203014;
    new_Skin.M416_x4 = 203004;
    new_Skin.M416_x6 = 203015;
    new_Skin.M416_quickMag = 204012;
    new_Skin.M416_extendedMag = 204011;
    new_Skin.M416_quickNextended = 204013;
    new_Skin.M416_stock = 205002;
    new_Skin.M416_stock2 = 205002;
    new_Skin.M416_stock3 = 205002;
    new_Skin.M416_stock4 = 205002;
    new_Skin.M416_stock5 = 205002;
    new_Skin.M416_verical = 203015;
    new_Skin.M416_angle = 202001;
    new_Skin.M416_lightgrip = 202004;
    new_Skin.M416_pink = 202005;
    new_Skin.M416_lazer = 203015;
    new_Skin.M416_thumb = 202006;
  }
  if (preferences.Config.Skin.M416 == 5) {
    new_Skin.M4162 = 1101004098;
    new_Skin.M416_2 = 1010040981;
    new_Skin.M416_3 = 1010040982;
    new_Skin.M416_4 = 1010040983;
    new_Skin.M416_flash = 201010;
    new_Skin.M416_compe = 201009;
    new_Skin.M416_silent = 201011;
    new_Skin.M416_reddot = 203001;
    new_Skin.M416_holo = 203002;
    new_Skin.M416_x2 = 203003;
    new_Skin.M416_x3 = 203014;
    new_Skin.M416_x4 = 203004;
    new_Skin.M416_x6 = 203015;
    new_Skin.M416_quickMag = 204012;
    new_Skin.M416_extendedMag = 204011;
    new_Skin.M416_quickNextended = 204013;
    new_Skin.M416_stock = 205002;
    new_Skin.M416_stock2 = 205002;
    new_Skin.M416_stock3 = 205002;
    new_Skin.M416_stock4 = 205002;
    new_Skin.M416_stock5 = 205002;
    new_Skin.M416_verical = 203015;
    new_Skin.M416_angle = 202001;
    new_Skin.M416_lightgrip = 202004;
    new_Skin.M416_pink = 202005;
    new_Skin.M416_lazer = 203015;
    new_Skin.M416_thumb = 202006;
  }
  if (preferences.Config.Skin.M416 == 6) {
    new_Skin.M4162 = 1101004138;
    new_Skin.M416_2 = 1010041381;
    new_Skin.M416_3 = 1010041382;
    new_Skin.M416_4 = 1010041383;
    new_Skin.M416_flash = 1010041136;
    new_Skin.M416_compe = 1010041137;
    new_Skin.M416_silent = 1010041138;
    new_Skin.M416_reddot = 1010041128;
    new_Skin.M416_holo = 1010041127;
    new_Skin.M416_x2 = 1010041126;
    new_Skin.M416_x3 = 1010041125;
    new_Skin.M416_x4 = 1010041124;
    new_Skin.M416_x6 = 203015;
    new_Skin.M416_quickMag = 1010041134;
    new_Skin.M416_extendedMag = 1010041129;
    new_Skin.M416_quickNextended = 1010041135;
    new_Skin.M416_stock = 1010041146;
    new_Skin.M416_stock2 = 1010041146;
    new_Skin.M416_stock3 = 1010041146;
    new_Skin.M416_stock4 = 1010041146;
    new_Skin.M416_stock5 = 1010041146;
    new_Skin.M416_verical = 1010041145;
    new_Skin.M416_angle = 1010041139;
    new_Skin.M416_lightgrip = 202004;
    new_Skin.M416_pink = 202005;
    new_Skin.M416_lazer = 203015;
    new_Skin.M416_thumb = 202006;
  }
  if (preferences.Config.Skin.M416 == 7) {
    new_Skin.M4162 = 1101004163;
    new_Skin.M416_2 = 1010041631;
    new_Skin.M416_3 = 1010041632;
    new_Skin.M416_4 = 1010041633;
    new_Skin.M416_flash = 201010;
    new_Skin.M416_compe = 1010041574;
    new_Skin.M416_silent = 1010041575;
    new_Skin.M416_reddot = 1010041566;
    new_Skin.M416_holo = 1010041565;
    new_Skin.M416_x2 = 1010041564;
    new_Skin.M416_x3 = 1010041560;
    new_Skin.M416_x4 = 1010041554;
    new_Skin.M416_x6 = 203015;
    new_Skin.M416_quickMag = 1010041568;
    new_Skin.M416_extendedMag = 1010041569;
    new_Skin.M416_quickNextended = 1010041567;
    new_Skin.M416_stock = 1010041579;
    new_Skin.M416_stock2 = 1010041579;
    new_Skin.M416_stock3 = 1010041579;
    new_Skin.M416_stock4 = 1010041579;
    new_Skin.M416_stock5 = 1010041579;
    new_Skin.M416_verical = 1010041578;
    new_Skin.M416_angle = 1010041576;
    new_Skin.M416_lightgrip = 20200400;
    new_Skin.M416_pink = 202005;
    new_Skin.M416_lazer = 203015;
    new_Skin.M416_thumb = 1010041577;
  }
  if (preferences.Config.Skin.M416 == 8) {
    new_Skin.M4162 = 1101004201;
    new_Skin.M416_2 = 1010042011;
    new_Skin.M416_3 = 1010042012;
    new_Skin.M416_4 = 1010042013;
    new_Skin.M416_flash = 1010041956;
    new_Skin.M416_compe = 1010041957;
    new_Skin.M416_silent = 1010041958;
    new_Skin.M416_reddot = 1010041948;
    new_Skin.M416_holo = 1010041947;
    new_Skin.M416_x2 = 1010041946;
    new_Skin.M416_x3 = 1010041945;
    new_Skin.M416_x4 = 1010041944;
    new_Skin.M416_x6 = 1010041967;
    new_Skin.M416_quickMag = 1010041949;
    new_Skin.M416_extendedMag = 1010041950;
    new_Skin.M416_quickNextended = 1010041955;
    new_Skin.M416_stock = 1010041966;
    new_Skin.M416_stock2 = 1010041966;
    new_Skin.M416_stock3 = 1010041966;
    new_Skin.M416_stock4 = 1010041966;
    new_Skin.M416_stock5 = 1010041966;
    new_Skin.M416_verical = 1010041965;
    new_Skin.M416_angle = 1010041959;
    new_Skin.M416_lightgrip = 202004;
    new_Skin.M416_pink = 202005;
    new_Skin.M416_lazer = 203015;
    new_Skin.M416_thumb = 202006;
  }
  if (preferences.Config.Skin.M416 == 9) {
    new_Skin.M4162 = 1101004209;
    new_Skin.M416_2 = 1010042073;
    new_Skin.M416_3 = 1010042083;
    new_Skin.M416_4 = 1010042093;
    new_Skin.M416_flash = 20101000;
    new_Skin.M416_compe = 1010042037;
    new_Skin.M416_silent = 1010042039;
    new_Skin.M416_reddot = 1010042029;
    new_Skin.M416_holo = 1010042028;
    new_Skin.M416_x2 = 1010042027;
    new_Skin.M416_x3 = 1010042026;
    new_Skin.M416_x4 = 1010042025;
    new_Skin.M416_x6 = 1010042024;
    new_Skin.M416_quickMag = 1010042034;
    new_Skin.M416_extendedMag = 1010042035;
    new_Skin.M416_quickNextended = 1010042036;
    new_Skin.M416_stock = 1010042047;
    new_Skin.M416_stock2 = 1010042047;
    new_Skin.M416_stock3 = 1010042047;
    new_Skin.M416_stock4 = 1010042047;
    new_Skin.M416_stock5 = 1010042047;
    new_Skin.M416_verical = 1010042046;
    new_Skin.M416_angle = 1010042044;
    new_Skin.M416_lightgrip = 202004;
    new_Skin.M416_pink = 202005;
    new_Skin.M416_lazer = 203015;
    new_Skin.M416_thumb = 202006;
  }
  if (preferences.Config.Skin.M416 == 10) {
    new_Skin.M4162 = 1101004218;
    new_Skin.M416_2 = 1010042153;
    new_Skin.M416_3 = 1010042163;
    new_Skin.M416_4 = 1010042173;
    new_Skin.M416_flash = 1010042128;
    new_Skin.M416_compe = 1010042127;
    new_Skin.M416_silent = 1010042129;
    new_Skin.M416_reddot = 1010042119;
    new_Skin.M416_holo = 1010042118;
    new_Skin.M416_x2 = 1010042117;
    new_Skin.M416_x3 = 1010042116;
    new_Skin.M416_x4 = 1010042115;
    new_Skin.M416_x6 = 1010042114;
    new_Skin.M416_quickMag = 1010042124;
    new_Skin.M416_extendedMag = 1010042125;
    new_Skin.M416_quickNextended = 1010042126;
    new_Skin.M416_stock = 1010042137;
    new_Skin.M416_stock2 = 1010042137;
    new_Skin.M416_stock3 = 1010042137;
    new_Skin.M416_stock4 = 1010042137;
    new_Skin.M416_stock5 = 1010042137;
    new_Skin.M416_verical = 1010042136;
    new_Skin.M416_angle = 1010042134;
    new_Skin.M416_lightgrip = 1010042138;
    new_Skin.M416_pink = 1010042139;
    new_Skin.M416_lazer = 1010042144;
    new_Skin.M416_thumb = 1010042135;
  }
  if (preferences.Config.Skin.M416 == 11) {
    new_Skin.M4162 = 1101004226;
    new_Skin.M416_2 = 11010042214;
    new_Skin.M416_3 = 11010042215;
    new_Skin.M416_4 = 11010042216;
    new_Skin.M416_flash = 1010042238;
    new_Skin.M416_compe = 1010042237;
    new_Skin.M416_silent = 1010042239;
    new_Skin.M416_reddot = 1010042233;
    new_Skin.M416_holo = 1010042232;
    new_Skin.M416_x2 = 1010042231;
    new_Skin.M416_x3 = 1010042219;
    new_Skin.M416_x4 = 1010042218;
    new_Skin.M416_x6 = 1010042217;
    new_Skin.M416_quickMag = 1010042234;
    new_Skin.M416_extendedMag = 1010042235;
    new_Skin.M416_quickNextended = 1010042236;
    new_Skin.M416_stock = 1010042244;
    new_Skin.M416_stock2 = 1010042244;
    new_Skin.M416_stock3 = 1010042244;
    new_Skin.M416_stock4 = 1010042244;
    new_Skin.M416_stock5 = 1010042244;
    new_Skin.M416_verical = 1010042243;
    new_Skin.M416_thumb = 1010042242;
    new_Skin.M416_angle = 1010042241;
    new_Skin.M416_lightgrip = 1010042245;
    new_Skin.M416_pink = 1010042246;
    new_Skin.M416_lazer = 1010042247;
  }
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.M416 == 0) {
    new_Skin.M4163 = 1010046;
    new_Skin.M416_2 = 291004;
    new_Skin.M416_3 = 203008;
    new_Skin.M416_4 = 205005;
    new_Skin.M416_flash = 201010;
    new_Skin.M416_compe = 201009;
    new_Skin.M416_silent = 201011;
    new_Skin.M416_reddot = 203001;
    new_Skin.M416_holo = 203002;
    new_Skin.M416_x2 = 203003;
    new_Skin.M416_x3 = 203014;
    new_Skin.M416_x4 = 203004;
    new_Skin.M416_x6 = 203015;
    new_Skin.M416_quickMag = 204012;
    new_Skin.M416_extendedMag = 204011;
    new_Skin.M416_quickNextended = 204013;
    new_Skin.M416_stock = 205002;
    new_Skin.M416_stock2 = 2050022;
    new_Skin.M416_stock3 = 2050023;
    new_Skin.M416_stock4 = 2050024;
    new_Skin.M416_stock5 = 2050025;
    new_Skin.M416_verical = 203015;
    new_Skin.M416_angle = 202001;
    new_Skin.M416_lightgrip = 202004;
    new_Skin.M416_pink = 202005;
    new_Skin.M416_lazer = 203015;
    new_Skin.M416_thumb = 202006;
  }
  if (preferences.Config.Skin.M416 == 1) {
    new_Skin.M4163 = 1101004046;
    new_Skin.M416_2 = 1010040461;
    new_Skin.M416_3 = 1010040462;
    new_Skin.M416_4 = 1010040463;
    new_Skin.M416_flash = 1010040474;
    new_Skin.M416_compe = 1010040475;
    new_Skin.M416_silent = 1010040476;
    new_Skin.M416_reddot = 1010040470;
    new_Skin.M416_holo = 1010040469;
    new_Skin.M416_x2 = 1010040468;
    new_Skin.M416_x3 = 1010040467;
    new_Skin.M416_x4 = 1010040466;
    new_Skin.M416_x6 = 1010040481;
    new_Skin.M416_quickMag = 1010040471;
    new_Skin.M416_extendedMag = 1010040472;
    new_Skin.M416_quickNextended = 1010040473;
    new_Skin.M416_stock = 1010040480;
    new_Skin.M416_stock2 = 1010040480;
    new_Skin.M416_stock3 = 1010040480;
    new_Skin.M416_stock4 = 1010040480;
    new_Skin.M416_stock5 = 1010040480;
    new_Skin.M416_verical = 1010040479;
    new_Skin.M416_thumb = 1010040478;
    new_Skin.M416_angle = 1010040477;
    new_Skin.M416_lightgrip = 1010040482;
    new_Skin.M416_pink = 1010040483;
    new_Skin.M416_lazer = 1010040484;
  }
  if (preferences.Config.Skin.M416 == 2) {
    new_Skin.M4163 = 1101004062;
    new_Skin.M416_2 = 1010040611;
    new_Skin.M416_3 = 1010040612;
    new_Skin.M416_4 = 1010040613;
    new_Skin.M416_flash = 201010;
    new_Skin.M416_compe = 201009;
    new_Skin.M416_silent = 201011;
    new_Skin.M416_reddot = 203001;
    new_Skin.M416_holo = 203002;
    new_Skin.M416_x2 = 203003;
    new_Skin.M416_x3 = 203014;
    new_Skin.M416_x4 = 203004;
    new_Skin.M416_x6 = 203015;
    new_Skin.M416_quickMag = 204012;
    new_Skin.M416_extendedMag = 204011;
    new_Skin.M416_quickNextended = 204013;
    new_Skin.M416_stock = 205002;
    new_Skin.M416_stock2 = 205002;
    new_Skin.M416_stock3 = 205002;
    new_Skin.M416_stock4 = 205002;
    new_Skin.M416_stock5 = 205002;
    new_Skin.M416_verical = 203015;
    new_Skin.M416_angle = 202001;
    new_Skin.M416_lightgrip = 202004;
    new_Skin.M416_pink = 202005;
    new_Skin.M416_lazer = 203015;
    new_Skin.M416_thumb = 202006;
  }
  if (preferences.Config.Skin.M416 == 3) {
    new_Skin.M4163 = 1101004078;
    new_Skin.M416_2 = 1010040781;
    new_Skin.M416_3 = 1010040782;
    new_Skin.M416_4 = 1010040783;
    new_Skin.M416_flash = 201010;
    new_Skin.M416_compe = 201009;
    new_Skin.M416_silent = 201011;
    new_Skin.M416_reddot = 203001;
    new_Skin.M416_holo = 203002;
    new_Skin.M416_x2 = 203003;
    new_Skin.M416_x3 = 203014;
    new_Skin.M416_x4 = 203004;
    new_Skin.M416_x6 = 203015;
    new_Skin.M416_quickMag = 204012;
    new_Skin.M416_extendedMag = 204011;
    new_Skin.M416_quickNextended = 204013;
    new_Skin.M416_stock = 205002;
    new_Skin.M416_stock2 = 205002;
    new_Skin.M416_stock3 = 205002;
    new_Skin.M416_stock4 = 205002;
    new_Skin.M416_stock5 = 205002;
    new_Skin.M416_verical = 203015;
    new_Skin.M416_angle = 202001;
    new_Skin.M416_lightgrip = 202004;
    new_Skin.M416_pink = 202005;
    new_Skin.M416_lazer = 203015;
    new_Skin.M416_thumb = 202006;
  }
  if (preferences.Config.Skin.M416 == 4) {
    new_Skin.M4163 = 1101004086;
    new_Skin.M416_2 = 1010040861;
    new_Skin.M416_3 = 1010040862;
    new_Skin.M416_4 = 1010040863;
    new_Skin.M416_flash = 201010;
    new_Skin.M416_compe = 201009;
    new_Skin.M416_silent = 201011;
    new_Skin.M416_reddot = 203001;
    new_Skin.M416_holo = 203002;
    new_Skin.M416_x2 = 203003;
    new_Skin.M416_x3 = 203014;
    new_Skin.M416_x4 = 203004;
    new_Skin.M416_x6 = 203015;
    new_Skin.M416_quickMag = 204012;
    new_Skin.M416_extendedMag = 204011;
    new_Skin.M416_quickNextended = 204013;
    new_Skin.M416_stock = 205002;
    new_Skin.M416_stock2 = 205002;
    new_Skin.M416_stock3 = 205002;
    new_Skin.M416_stock4 = 205002;
    new_Skin.M416_stock5 = 205002;
    new_Skin.M416_verical = 203015;
    new_Skin.M416_angle = 202001;
    new_Skin.M416_lightgrip = 202004;
    new_Skin.M416_pink = 202005;
    new_Skin.M416_lazer = 203015;
    new_Skin.M416_thumb = 202006;
  }
  if (preferences.Config.Skin.M416 == 5) {
    new_Skin.M4163 = 1101004098;
    new_Skin.M416_2 = 1010040981;
    new_Skin.M416_3 = 1010040982;
    new_Skin.M416_4 = 1010040983;
    new_Skin.M416_flash = 201010;
    new_Skin.M416_compe = 201009;
    new_Skin.M416_silent = 201011;
    new_Skin.M416_reddot = 203001;
    new_Skin.M416_holo = 203002;
    new_Skin.M416_x2 = 203003;
    new_Skin.M416_x3 = 203014;
    new_Skin.M416_x4 = 203004;
    new_Skin.M416_x6 = 203015;
    new_Skin.M416_quickMag = 204012;
    new_Skin.M416_extendedMag = 204011;
    new_Skin.M416_quickNextended = 204013;
    new_Skin.M416_stock = 205002;
    new_Skin.M416_stock2 = 205002;
    new_Skin.M416_stock3 = 205002;
    new_Skin.M416_stock4 = 205002;
    new_Skin.M416_stock5 = 205002;
    new_Skin.M416_verical = 203015;
    new_Skin.M416_angle = 202001;
    new_Skin.M416_lightgrip = 202004;
    new_Skin.M416_pink = 202005;
    new_Skin.M416_lazer = 203015;
    new_Skin.M416_thumb = 202006;
  }
  if (preferences.Config.Skin.M416 == 6) {
    new_Skin.M4163 = 1101004138;
    new_Skin.M416_2 = 1010041381;
    new_Skin.M416_3 = 1010041382;
    new_Skin.M416_4 = 1010041383;
    new_Skin.M416_flash = 1010041136;
    new_Skin.M416_compe = 1010041137;
    new_Skin.M416_silent = 1010041138;
    new_Skin.M416_reddot = 1010041128;
    new_Skin.M416_holo = 1010041127;
    new_Skin.M416_x2 = 1010041126;
    new_Skin.M416_x3 = 1010041125;
    new_Skin.M416_x4 = 1010041124;
    new_Skin.M416_x6 = 203015;
    new_Skin.M416_quickMag = 1010041134;
    new_Skin.M416_extendedMag = 1010041129;
    new_Skin.M416_quickNextended = 1010041135;
    new_Skin.M416_stock = 1010041146;
    new_Skin.M416_stock2 = 1010041146;
    new_Skin.M416_stock3 = 1010041146;
    new_Skin.M416_stock4 = 1010041146;
    new_Skin.M416_stock5 = 1010041146;
    new_Skin.M416_verical = 1010041145;
    new_Skin.M416_angle = 1010041139;
    new_Skin.M416_lightgrip = 202004;
    new_Skin.M416_pink = 202005;
    new_Skin.M416_lazer = 203015;
    new_Skin.M416_thumb = 202006;
  }
  if (preferences.Config.Skin.M416 == 7) {
    new_Skin.M4163 = 1101004163;
    new_Skin.M416_2 = 1010041631;
    new_Skin.M416_3 = 1010041632;
    new_Skin.M416_4 = 1010041633;
    new_Skin.M416_flash = 201010;
    new_Skin.M416_compe = 1010041574;
    new_Skin.M416_silent = 1010041575;
    new_Skin.M416_reddot = 1010041566;
    new_Skin.M416_holo = 1010041565;
    new_Skin.M416_x2 = 1010041564;
    new_Skin.M416_x3 = 1010041560;
    new_Skin.M416_x4 = 1010041554;
    new_Skin.M416_x6 = 203015;
    new_Skin.M416_quickMag = 1010041568;
    new_Skin.M416_extendedMag = 1010041569;
    new_Skin.M416_quickNextended = 1010041567;
    new_Skin.M416_stock = 1010041579;
    new_Skin.M416_stock2 = 1010041579;
    new_Skin.M416_stock3 = 1010041579;
    new_Skin.M416_stock4 = 1010041579;
    new_Skin.M416_stock5 = 1010041579;
    new_Skin.M416_verical = 1010041578;
    new_Skin.M416_angle = 1010041576;
    new_Skin.M416_lightgrip = 20200400;
    new_Skin.M416_pink = 202005;
    new_Skin.M416_lazer = 203015;
    new_Skin.M416_thumb = 1010041577;
  }
  if (preferences.Config.Skin.M416 == 8) {
    new_Skin.M4163 = 1101004201;
    new_Skin.M416_2 = 1010042011;
    new_Skin.M416_3 = 1010042012;
    new_Skin.M416_4 = 1010042013;
    new_Skin.M416_flash = 1010041956;
    new_Skin.M416_compe = 1010041957;
    new_Skin.M416_silent = 1010041958;
    new_Skin.M416_reddot = 1010041948;
    new_Skin.M416_holo = 1010041947;
    new_Skin.M416_x2 = 1010041946;
    new_Skin.M416_x3 = 1010041945;
    new_Skin.M416_x4 = 1010041944;
    new_Skin.M416_x6 = 1010041967;
    new_Skin.M416_quickMag = 1010041949;
    new_Skin.M416_extendedMag = 1010041950;
    new_Skin.M416_quickNextended = 1010041955;
    new_Skin.M416_stock = 1010041966;
    new_Skin.M416_stock2 = 1010041966;
    new_Skin.M416_stock3 = 1010041966;
    new_Skin.M416_stock4 = 1010041966;
    new_Skin.M416_stock5 = 1010041966;
    new_Skin.M416_verical = 1010041965;
    new_Skin.M416_angle = 1010041959;
    new_Skin.M416_lightgrip = 202004;
    new_Skin.M416_pink = 202005;
    new_Skin.M416_lazer = 203015;
    new_Skin.M416_thumb = 202006;
  }
  if (preferences.Config.Skin.M416 == 9) {
    new_Skin.M4163 = 1101004209;
    new_Skin.M416_2 = 1010042073;
    new_Skin.M416_3 = 1010042083;
    new_Skin.M416_4 = 1010042093;
    new_Skin.M416_flash = 20101000;
    new_Skin.M416_compe = 1010042037;
    new_Skin.M416_silent = 1010042039;
    new_Skin.M416_reddot = 1010042029;
    new_Skin.M416_holo = 1010042028;
    new_Skin.M416_x2 = 1010042027;
    new_Skin.M416_x3 = 1010042026;
    new_Skin.M416_x4 = 1010042025;
    new_Skin.M416_x6 = 1010042024;
    new_Skin.M416_quickMag = 1010042034;
    new_Skin.M416_extendedMag = 1010042035;
    new_Skin.M416_quickNextended = 1010042036;
    new_Skin.M416_stock = 1010042047;
    new_Skin.M416_stock2 = 1010042047;
    new_Skin.M416_stock3 = 1010042047;
    new_Skin.M416_stock4 = 1010042047;
    new_Skin.M416_stock5 = 1010042047;
    new_Skin.M416_verical = 1010042046;
    new_Skin.M416_angle = 1010042044;
    new_Skin.M416_lightgrip = 202004;
    new_Skin.M416_pink = 202005;
    new_Skin.M416_lazer = 203015;
    new_Skin.M416_thumb = 202006;
  }
  if (preferences.Config.Skin.M416 == 10) {
    new_Skin.M4163 = 1101004218;
    new_Skin.M416_2 = 1010042153;
    new_Skin.M416_3 = 1010042163;
    new_Skin.M416_4 = 1010042173;
    new_Skin.M416_flash = 1010042128;
    new_Skin.M416_compe = 1010042127;
    new_Skin.M416_silent = 1010042129;
    new_Skin.M416_reddot = 1010042119;
    new_Skin.M416_holo = 1010042118;
    new_Skin.M416_x2 = 1010042117;
    new_Skin.M416_x3 = 1010042116;
    new_Skin.M416_x4 = 1010042115;
    new_Skin.M416_x6 = 1010042114;
    new_Skin.M416_quickMag = 1010042124;
    new_Skin.M416_extendedMag = 1010042125;
    new_Skin.M416_quickNextended = 1010042126;
    new_Skin.M416_stock = 1010042137;
    new_Skin.M416_stock2 = 1010042137;
    new_Skin.M416_stock3 = 1010042137;
    new_Skin.M416_stock4 = 1010042137;
    new_Skin.M416_stock5 = 1010042137;
    new_Skin.M416_verical = 1010042136;
    new_Skin.M416_angle = 1010042134;
    new_Skin.M416_lightgrip = 1010042138;
    new_Skin.M416_pink = 1010042139;
    new_Skin.M416_lazer = 1010042144;
    new_Skin.M416_thumb = 1010042135;
  }
  if (preferences.Config.Skin.M416 == 11) {
    new_Skin.M4163 = 1101004226;
    new_Skin.M416_2 = 11010042214;
    new_Skin.M416_3 = 11010042215;
    new_Skin.M416_4 = 11010042216;
    new_Skin.M416_flash = 1010042238;
    new_Skin.M416_compe = 1010042237;
    new_Skin.M416_silent = 1010042239;
    new_Skin.M416_reddot = 1010042233;
    new_Skin.M416_holo = 1010042232;
    new_Skin.M416_x2 = 1010042231;
    new_Skin.M416_x3 = 1010042219;
    new_Skin.M416_x4 = 1010042218;
    new_Skin.M416_x6 = 1010042217;
    new_Skin.M416_quickMag = 1010042234;
    new_Skin.M416_extendedMag = 1010042235;
    new_Skin.M416_quickNextended = 1010042236;
    new_Skin.M416_stock = 1010042244;
    new_Skin.M416_stock2 = 1010042244;
    new_Skin.M416_stock3 = 1010042244;
    new_Skin.M416_stock4 = 1010042244;
    new_Skin.M416_stock5 = 1010042244;
    new_Skin.M416_verical = 1010042243;
    new_Skin.M416_thumb = 1010042242;
    new_Skin.M416_angle = 1010042241;
    new_Skin.M416_lightgrip = 1010042245;
    new_Skin.M416_pink = 1010042246;
    new_Skin.M416_lazer = 1010042247;
  }
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.M416 == 0) {
    new_Skin.M4164 = 1010047;
    new_Skin.M416_2 = 291004;
    new_Skin.M416_3 = 203008;
    new_Skin.M416_4 = 205005;
    new_Skin.M416_flash = 201010;
    new_Skin.M416_compe = 201009;
    new_Skin.M416_silent = 201011;
    new_Skin.M416_reddot = 203001;
    new_Skin.M416_holo = 203002;
    new_Skin.M416_x2 = 203003;
    new_Skin.M416_x3 = 203014;
    new_Skin.M416_x4 = 203004;
    new_Skin.M416_x6 = 203015;
    new_Skin.M416_quickMag = 204012;
    new_Skin.M416_extendedMag = 204011;
    new_Skin.M416_quickNextended = 204013;
    new_Skin.M416_stock = 205002;
    new_Skin.M416_stock2 = 2050022;
    new_Skin.M416_stock3 = 2050023;
    new_Skin.M416_stock4 = 2050024;
    new_Skin.M416_stock5 = 2050025;
    new_Skin.M416_verical = 203015;
    new_Skin.M416_angle = 202001;
    new_Skin.M416_lightgrip = 202004;
    new_Skin.M416_pink = 202005;
    new_Skin.M416_lazer = 203015;
    new_Skin.M416_thumb = 202006;
  }
  if (preferences.Config.Skin.M416 == 1) {
    new_Skin.M4164 = 1101004046;
    new_Skin.M416_2 = 1010040461;
    new_Skin.M416_3 = 1010040462;
    new_Skin.M416_4 = 1010040463;
    new_Skin.M416_flash = 1010040474;
    new_Skin.M416_compe = 1010040475;
    new_Skin.M416_silent = 1010040476;
    new_Skin.M416_reddot = 1010040470;
    new_Skin.M416_holo = 1010040469;
    new_Skin.M416_x2 = 1010040468;
    new_Skin.M416_x3 = 1010040467;
    new_Skin.M416_x4 = 1010040466;
    new_Skin.M416_x6 = 1010040481;
    new_Skin.M416_quickMag = 1010040471;
    new_Skin.M416_extendedMag = 1010040472;
    new_Skin.M416_quickNextended = 1010040473;
    new_Skin.M416_stock = 1010040480;
    new_Skin.M416_stock2 = 1010040480;
    new_Skin.M416_stock3 = 1010040480;
    new_Skin.M416_stock4 = 1010040480;
    new_Skin.M416_stock5 = 1010040480;
    new_Skin.M416_verical = 1010040479;
    new_Skin.M416_thumb = 1010040478;
    new_Skin.M416_angle = 1010040477;
    new_Skin.M416_lightgrip = 1010040482;
    new_Skin.M416_pink = 1010040483;
    new_Skin.M416_lazer = 1010040484;
  }
  if (preferences.Config.Skin.M416 == 2) {
    new_Skin.M4164 = 1101004062;
    new_Skin.M416_2 = 1010040611;
    new_Skin.M416_3 = 1010040612;
    new_Skin.M416_4 = 1010040613;
    new_Skin.M416_flash = 201010;
    new_Skin.M416_compe = 201009;
    new_Skin.M416_silent = 201011;
    new_Skin.M416_reddot = 203001;
    new_Skin.M416_holo = 203002;
    new_Skin.M416_x2 = 203003;
    new_Skin.M416_x3 = 203014;
    new_Skin.M416_x4 = 203004;
    new_Skin.M416_x6 = 203015;
    new_Skin.M416_quickMag = 204012;
    new_Skin.M416_extendedMag = 204011;
    new_Skin.M416_quickNextended = 204013;
    new_Skin.M416_stock = 205002;
    new_Skin.M416_stock2 = 205002;
    new_Skin.M416_stock3 = 205002;
    new_Skin.M416_stock4 = 205002;
    new_Skin.M416_stock5 = 205002;
    new_Skin.M416_verical = 203015;
    new_Skin.M416_angle = 202001;
    new_Skin.M416_lightgrip = 202004;
    new_Skin.M416_pink = 202005;
    new_Skin.M416_lazer = 203015;
    new_Skin.M416_thumb = 202006;
  }
  if (preferences.Config.Skin.M416 == 3) {
    new_Skin.M4164 = 1101004078;
    new_Skin.M416_2 = 1010040781;
    new_Skin.M416_3 = 1010040782;
    new_Skin.M416_4 = 1010040783;
    new_Skin.M416_flash = 201010;
    new_Skin.M416_compe = 201009;
    new_Skin.M416_silent = 201011;
    new_Skin.M416_reddot = 203001;
    new_Skin.M416_holo = 203002;
    new_Skin.M416_x2 = 203003;
    new_Skin.M416_x3 = 203014;
    new_Skin.M416_x4 = 203004;
    new_Skin.M416_x6 = 203015;
    new_Skin.M416_quickMag = 204012;
    new_Skin.M416_extendedMag = 204011;
    new_Skin.M416_quickNextended = 204013;
    new_Skin.M416_stock = 205002;
    new_Skin.M416_stock2 = 205002;
    new_Skin.M416_stock3 = 205002;
    new_Skin.M416_stock4 = 205002;
    new_Skin.M416_stock5 = 205002;
    new_Skin.M416_verical = 203015;
    new_Skin.M416_angle = 202001;
    new_Skin.M416_lightgrip = 202004;
    new_Skin.M416_pink = 202005;
    new_Skin.M416_lazer = 203015;
    new_Skin.M416_thumb = 202006;
  }
  if (preferences.Config.Skin.M416 == 4) {
    new_Skin.M4164 = 1101004086;
    new_Skin.M416_2 = 1010040861;
    new_Skin.M416_3 = 1010040862;
    new_Skin.M416_4 = 1010040863;
    new_Skin.M416_flash = 201010;
    new_Skin.M416_compe = 201009;
    new_Skin.M416_silent = 201011;
    new_Skin.M416_reddot = 203001;
    new_Skin.M416_holo = 203002;
    new_Skin.M416_x2 = 203003;
    new_Skin.M416_x3 = 203014;
    new_Skin.M416_x4 = 203004;
    new_Skin.M416_x6 = 203015;
    new_Skin.M416_quickMag = 204012;
    new_Skin.M416_extendedMag = 204011;
    new_Skin.M416_quickNextended = 204013;
    new_Skin.M416_stock = 205002;
    new_Skin.M416_stock2 = 205002;
    new_Skin.M416_stock3 = 205002;
    new_Skin.M416_stock4 = 205002;
    new_Skin.M416_stock5 = 205002;
    new_Skin.M416_verical = 203015;
    new_Skin.M416_angle = 202001;
    new_Skin.M416_lightgrip = 202004;
    new_Skin.M416_pink = 202005;
    new_Skin.M416_lazer = 203015;
    new_Skin.M416_thumb = 202006;
  }
  if (preferences.Config.Skin.M416 == 5) {
    new_Skin.M4164 = 1101004098;
    new_Skin.M416_2 = 1010040981;
    new_Skin.M416_3 = 1010040982;
    new_Skin.M416_4 = 1010040983;
    new_Skin.M416_flash = 201010;
    new_Skin.M416_compe = 201009;
    new_Skin.M416_silent = 201011;
    new_Skin.M416_reddot = 203001;
    new_Skin.M416_holo = 203002;
    new_Skin.M416_x2 = 203003;
    new_Skin.M416_x3 = 203014;
    new_Skin.M416_x4 = 203004;
    new_Skin.M416_x6 = 203015;
    new_Skin.M416_quickMag = 204012;
    new_Skin.M416_extendedMag = 204011;
    new_Skin.M416_quickNextended = 204013;
    new_Skin.M416_stock = 205002;
    new_Skin.M416_stock2 = 205002;
    new_Skin.M416_stock3 = 205002;
    new_Skin.M416_stock4 = 205002;
    new_Skin.M416_stock5 = 205002;
    new_Skin.M416_verical = 203015;
    new_Skin.M416_angle = 202001;
    new_Skin.M416_lightgrip = 202004;
    new_Skin.M416_pink = 202005;
    new_Skin.M416_lazer = 203015;
    new_Skin.M416_thumb = 202006;
  }
  if (preferences.Config.Skin.M416 == 6) {
    new_Skin.M4164 = 1101004138;
    new_Skin.M416_2 = 1010041381;
    new_Skin.M416_3 = 1010041382;
    new_Skin.M416_4 = 1010041383;
    new_Skin.M416_flash = 1010041136;
    new_Skin.M416_compe = 1010041137;
    new_Skin.M416_silent = 1010041138;
    new_Skin.M416_reddot = 1010041128;
    new_Skin.M416_holo = 1010041127;
    new_Skin.M416_x2 = 1010041126;
    new_Skin.M416_x3 = 1010041125;
    new_Skin.M416_x4 = 1010041124;
    new_Skin.M416_x6 = 203015;
    new_Skin.M416_quickMag = 1010041134;
    new_Skin.M416_extendedMag = 1010041129;
    new_Skin.M416_quickNextended = 1010041135;
    new_Skin.M416_stock = 1010041146;
    new_Skin.M416_stock2 = 1010041146;
    new_Skin.M416_stock3 = 1010041146;
    new_Skin.M416_stock4 = 1010041146;
    new_Skin.M416_stock5 = 1010041146;
    new_Skin.M416_verical = 1010041145;
    new_Skin.M416_angle = 1010041139;
    new_Skin.M416_lightgrip = 202004;
    new_Skin.M416_pink = 202005;
    new_Skin.M416_lazer = 203015;
    new_Skin.M416_thumb = 202006;
  }
  if (preferences.Config.Skin.M416 == 7) {
    new_Skin.M4164 = 1101004163;
    new_Skin.M416_2 = 1010041631;
    new_Skin.M416_3 = 1010041632;
    new_Skin.M416_4 = 1010041633;
    new_Skin.M416_flash = 201010;
    new_Skin.M416_compe = 1010041574;
    new_Skin.M416_silent = 1010041575;
    new_Skin.M416_reddot = 1010041566;
    new_Skin.M416_holo = 1010041565;
    new_Skin.M416_x2 = 1010041564;
    new_Skin.M416_x3 = 1010041560;
    new_Skin.M416_x4 = 1010041554;
    new_Skin.M416_x6 = 203015;
    new_Skin.M416_quickMag = 1010041568;
    new_Skin.M416_extendedMag = 1010041569;
    new_Skin.M416_quickNextended = 1010041567;
    new_Skin.M416_stock = 1010041579;
    new_Skin.M416_stock2 = 1010041579;
    new_Skin.M416_stock3 = 1010041579;
    new_Skin.M416_stock4 = 1010041579;
    new_Skin.M416_stock5 = 1010041579;
    new_Skin.M416_verical = 1010041578;
    new_Skin.M416_angle = 1010041576;
    new_Skin.M416_lightgrip = 20200400;
    new_Skin.M416_pink = 202005;
    new_Skin.M416_lazer = 203015;
    new_Skin.M416_thumb = 1010041577;
  }
  if (preferences.Config.Skin.M416 == 8) {
    new_Skin.M4164 = 1101004201;
    new_Skin.M416_2 = 1010042011;
    new_Skin.M416_3 = 1010042012;
    new_Skin.M416_4 = 1010042013;
    new_Skin.M416_flash = 1010041956;
    new_Skin.M416_compe = 1010041957;
    new_Skin.M416_silent = 1010041958;
    new_Skin.M416_reddot = 1010041948;
    new_Skin.M416_holo = 1010041947;
    new_Skin.M416_x2 = 1010041946;
    new_Skin.M416_x3 = 1010041945;
    new_Skin.M416_x4 = 1010041944;
    new_Skin.M416_x6 = 1010041967;
    new_Skin.M416_quickMag = 1010041949;
    new_Skin.M416_extendedMag = 1010041950;
    new_Skin.M416_quickNextended = 1010041955;
    new_Skin.M416_stock = 1010041966;
    new_Skin.M416_stock2 = 1010041966;
    new_Skin.M416_stock3 = 1010041966;
    new_Skin.M416_stock4 = 1010041966;
    new_Skin.M416_stock5 = 1010041966;
    new_Skin.M416_verical = 1010041965;
    new_Skin.M416_angle = 1010041959;
    new_Skin.M416_lightgrip = 202004;
    new_Skin.M416_pink = 202005;
    new_Skin.M416_lazer = 203015;
    new_Skin.M416_thumb = 202006;
  }
  if (preferences.Config.Skin.M416 == 9) {
    new_Skin.M4164 = 1101004209;
    new_Skin.M416_2 = 1010042073;
    new_Skin.M416_3 = 1010042083;
    new_Skin.M416_4 = 1010042093;
    new_Skin.M416_flash = 20101000;
    new_Skin.M416_compe = 1010042037;
    new_Skin.M416_silent = 1010042039;
    new_Skin.M416_reddot = 1010042029;
    new_Skin.M416_holo = 1010042028;
    new_Skin.M416_x2 = 1010042027;
    new_Skin.M416_x3 = 1010042026;
    new_Skin.M416_x4 = 1010042025;
    new_Skin.M416_x6 = 1010042024;
    new_Skin.M416_quickMag = 1010042034;
    new_Skin.M416_extendedMag = 1010042035;
    new_Skin.M416_quickNextended = 1010042036;
    new_Skin.M416_stock = 1010042047;
    new_Skin.M416_stock2 = 1010042047;
    new_Skin.M416_stock3 = 1010042047;
    new_Skin.M416_stock4 = 1010042047;
    new_Skin.M416_stock5 = 1010042047;
    new_Skin.M416_verical = 1010042046;
    new_Skin.M416_angle = 1010042044;
    new_Skin.M416_lightgrip = 202004;
    new_Skin.M416_pink = 202005;
    new_Skin.M416_lazer = 203015;
    new_Skin.M416_thumb = 202006;
  }
  if (preferences.Config.Skin.M416 == 10) {
    new_Skin.M4164 = 1101004218;
    new_Skin.M416_2 = 1010042153;
    new_Skin.M416_3 = 1010042163;
    new_Skin.M416_4 = 1010042173;
    new_Skin.M416_flash = 1010042128;
    new_Skin.M416_compe = 1010042127;
    new_Skin.M416_silent = 1010042129;
    new_Skin.M416_reddot = 1010042119;
    new_Skin.M416_holo = 1010042118;
    new_Skin.M416_x2 = 1010042117;
    new_Skin.M416_x3 = 1010042116;
    new_Skin.M416_x4 = 1010042115;
    new_Skin.M416_x6 = 1010042114;
    new_Skin.M416_quickMag = 1010042124;
    new_Skin.M416_extendedMag = 1010042125;
    new_Skin.M416_quickNextended = 1010042126;
    new_Skin.M416_stock = 1010042137;
    new_Skin.M416_stock2 = 1010042137;
    new_Skin.M416_stock3 = 1010042137;
    new_Skin.M416_stock4 = 1010042137;
    new_Skin.M416_stock5 = 1010042137;
    new_Skin.M416_verical = 1010042136;
    new_Skin.M416_angle = 1010042134;
    new_Skin.M416_lightgrip = 1010042138;
    new_Skin.M416_pink = 1010042139;
    new_Skin.M416_lazer = 1010042144;
    new_Skin.M416_thumb = 1010042135;
  }
  if (preferences.Config.Skin.M416 == 11) {
    new_Skin.M4164 = 1101004226;
    new_Skin.M416_2 = 11010042214;
    new_Skin.M416_3 = 11010042215;
    new_Skin.M416_4 = 11010042216;
    new_Skin.M416_flash = 1010042238;
    new_Skin.M416_compe = 1010042237;
    new_Skin.M416_silent = 1010042239;
    new_Skin.M416_reddot = 1010042233;
    new_Skin.M416_holo = 1010042232;
    new_Skin.M416_x2 = 1010042231;
    new_Skin.M416_x3 = 1010042219;
    new_Skin.M416_x4 = 1010042218;
    new_Skin.M416_x6 = 1010042217;
    new_Skin.M416_quickMag = 1010042234;
    new_Skin.M416_extendedMag = 1010042235;
    new_Skin.M416_quickNextended = 1010042236;
    new_Skin.M416_stock = 1010042244;
    new_Skin.M416_stock2 = 1010042244;
    new_Skin.M416_stock3 = 1010042244;
    new_Skin.M416_stock4 = 1010042244;
    new_Skin.M416_stock5 = 1010042244;
    new_Skin.M416_verical = 1010042243;
    new_Skin.M416_thumb = 1010042242;
    new_Skin.M416_angle = 1010042241;
    new_Skin.M416_lightgrip = 1010042245;
    new_Skin.M416_pink = 1010042246;
    new_Skin.M416_lazer = 1010042247;
  }
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.Groza == 0) {
    new_Skin.Groza = 101005;
  }
  if (preferences.Config.Skin.Groza == 1) {
    new_Skin.Groza = 1101005019;
  }
  if (preferences.Config.Skin.Groza == 2) {
    new_Skin.Groza = 1101005025;
  }
  if (preferences.Config.Skin.Groza == 3) {
    new_Skin.Groza = 1101005038;
  }
  if (preferences.Config.Skin.Groza == 4) {
    new_Skin.Groza = 1101005043;
  }
  if (preferences.Config.Skin.Groza == 5) {
    new_Skin.Groza = 1101005052;
  }
  if (preferences.Config.Skin.Groza == 6) {
    new_Skin.Groza = 1101005082;
  }
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.Groza == 0) {
    new_Skin.Groza1 = 1010052;
  }
  if (preferences.Config.Skin.Groza == 1) {
    new_Skin.Groza1 = 1101005019;
  }
  if (preferences.Config.Skin.Groza == 2) {
    new_Skin.Groza1 = 1101005025;
  }
  if (preferences.Config.Skin.Groza == 3) {
    new_Skin.Groza1 = 1101005038;
  }
  if (preferences.Config.Skin.Groza == 4) {
    new_Skin.Groza1 = 1101005043;
  }
  if (preferences.Config.Skin.Groza == 5) {
    new_Skin.Groza1 = 1101005052;
  }
  if (preferences.Config.Skin.Groza == 6) {
    new_Skin.Groza1 = 1101005082;
  }
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.Groza == 0) {
    new_Skin.Groza2 = 1010053;
  }
  if (preferences.Config.Skin.Groza == 1) {
    new_Skin.Groza2 = 1101005019;
  }
  if (preferences.Config.Skin.Groza == 2) {
    new_Skin.Groza2 = 1101005025;
  }
  if (preferences.Config.Skin.Groza == 3) {
    new_Skin.Groza2 = 1101005038;
  }
  if (preferences.Config.Skin.Groza == 4) {
    new_Skin.Groza2 = 1101005043;
  }
  if (preferences.Config.Skin.Groza == 5) {
    new_Skin.Groza2 = 1101005052;
  }
  if (preferences.Config.Skin.Groza == 6) {
    new_Skin.Groza2 = 1101005082;
  }
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.Groza == 0) {
    new_Skin.Groza3 = 1010054;
  }
  if (preferences.Config.Skin.Groza == 1) {
    new_Skin.Groza3 = 1101005019;
  }
  if (preferences.Config.Skin.Groza == 2) {
    new_Skin.Groza3 = 1101005025;
  }
  if (preferences.Config.Skin.Groza == 3) {
    new_Skin.Groza3 = 1101005038;
  }
  if (preferences.Config.Skin.Groza == 4) {
    new_Skin.Groza3 = 1101005043;
  }
  if (preferences.Config.Skin.Groza == 5) {
    new_Skin.Groza3 = 1101005052;
  }
  if (preferences.Config.Skin.Groza == 6) {
    new_Skin.Groza3 = 1101005082;
  }
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.Groza == 0) {
    new_Skin.Groza4 = 1010055;
  }
  if (preferences.Config.Skin.Groza == 1) {
    new_Skin.Groza4 = 1101005019;
  }
  if (preferences.Config.Skin.Groza == 2) {
    new_Skin.Groza4 = 1101005025;
  }
  if (preferences.Config.Skin.Groza == 3) {
    new_Skin.Groza4 = 1101005038;
  }
  if (preferences.Config.Skin.Groza == 4) {
    new_Skin.Groza4 = 1101005043;
  }
  if (preferences.Config.Skin.Groza == 5) {
    new_Skin.Groza4 = 1101005052;
  }
  if (preferences.Config.Skin.Groza == 6) {
    new_Skin.Groza4 = 1101005082;
  }
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.Groza == 0) {
    new_Skin.Groza5 = 1010056;
  }
  if (preferences.Config.Skin.Groza == 1) {
    new_Skin.Groza5 = 1101005019;
  }
  if (preferences.Config.Skin.Groza == 2) {
    new_Skin.Groza5 = 1101005025;
  }
  if (preferences.Config.Skin.Groza == 3) {
    new_Skin.Groza5 = 1101005038;
  }
  if (preferences.Config.Skin.Groza == 4) {
    new_Skin.Groza5 = 1101005043;
  }
  if (preferences.Config.Skin.Groza == 5) {
    new_Skin.Groza5 = 1101005052;
  }
  if (preferences.Config.Skin.Groza == 6) {
    new_Skin.Groza5 = 1101005082;
  }
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.Groza == 0) {
    new_Skin.Groza6 = 1010057;
  }
  if (preferences.Config.Skin.Groza == 1) {
    new_Skin.Groza6 = 1101005019;
  }
  if (preferences.Config.Skin.Groza == 2) {
    new_Skin.Groza6 = 1101005025;
  }
  if (preferences.Config.Skin.Groza == 3) {
    new_Skin.Groza6 = 1101005038;
  }
  if (preferences.Config.Skin.Groza == 4) {
    new_Skin.Groza6 = 1101005043;
  }
  if (preferences.Config.Skin.Groza == 5) {
    new_Skin.Groza6 = 1101005052;
  }
  if (preferences.Config.Skin.Groza == 6) {
    new_Skin.Groza6 = 1101005082;
  }
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.AUG == 0)
    new_Skin.AUG = 101006;
  if (preferences.Config.Skin.AUG == 1)
    new_Skin.AUG = 1101006033;
  if (preferences.Config.Skin.AUG == 2)
    new_Skin.AUG = 1101006044;
  if (preferences.Config.Skin.AUG == 3)
    new_Skin.AUG = 1101006062;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.AUG == 0)
    new_Skin.AUG1 = 1010062;
  if (preferences.Config.Skin.AUG == 1)
    new_Skin.AUG1 = 1101006033;
  if (preferences.Config.Skin.AUG == 2)
    new_Skin.AUG1 = 1101006044;
  if (preferences.Config.Skin.AUG == 3)
    new_Skin.AUG1 = 1101006062;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.AUG == 0)
    new_Skin.AUG2 = 1010063;
  if (preferences.Config.Skin.AUG == 1)
    new_Skin.AUG2 = 1101006033;
  if (preferences.Config.Skin.AUG == 2)
    new_Skin.AUG2 = 1101006044;
  if (preferences.Config.Skin.AUG == 3)
    new_Skin.AUG2 = 1101006062;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.AUG == 0)
    new_Skin.AUG3 = 1010064;
  if (preferences.Config.Skin.AUG == 1)
    new_Skin.AUG3 = 1101006033;
  if (preferences.Config.Skin.AUG == 2)
    new_Skin.AUG3 = 1101006044;
  if (preferences.Config.Skin.AUG == 3)
    new_Skin.AUG3 = 1101006062;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.AUG == 0)
    new_Skin.AUG4 = 1010065;
  if (preferences.Config.Skin.AUG == 1)
    new_Skin.AUG4 = 1101006033;
  if (preferences.Config.Skin.AUG == 2)
    new_Skin.AUG4 = 1101006044;
  if (preferences.Config.Skin.AUG == 3)
    new_Skin.AUG4 = 1101006062;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.AUG == 0)
    new_Skin.AUG5 = 1010066;
  if (preferences.Config.Skin.AUG == 1)
    new_Skin.AUG5 = 1101006033;
  if (preferences.Config.Skin.AUG == 2)
    new_Skin.AUG5 = 1101006044;
  if (preferences.Config.Skin.AUG == 3)
    new_Skin.AUG5 = 1101006062;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.AUG == 0)
    new_Skin.AUG6 = 1010067;
  if (preferences.Config.Skin.AUG == 1)
    new_Skin.AUG6 = 1101006033;
  if (preferences.Config.Skin.AUG == 2)
    new_Skin.AUG6 = 1101006044;
  if (preferences.Config.Skin.AUG == 3)
    new_Skin.AUG6 = 1101006062;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.QBZ == 0)
    new_Skin.QBZ = 101007;
  if (preferences.Config.Skin.QBZ == 1)
    new_Skin.QBZ = 1101007025;
  if (preferences.Config.Skin.QBZ == 2)
    new_Skin.QBZ = 1101007036;
  if (preferences.Config.Skin.QBZ == 3)
    new_Skin.QBZ = 1101007046;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.M762 == 0) {
    new_Skin.M762 = 101008;
    new_Skin.M762_Mag = 291008;
  }
  if (preferences.Config.Skin.M762 == 1) {
    new_Skin.M762 = 1101008026;
    new_Skin.M762_Mag = 1010080261;
  }
  if (preferences.Config.Skin.M762 == 2) {
    new_Skin.M762 = 1101008051;
    new_Skin.M762_Mag = 1010080511;
  }
  if (preferences.Config.Skin.M762 == 3) {
    new_Skin.M762 = 1101008061;
    new_Skin.M762_Mag = 1010080611;
  }
  if (preferences.Config.Skin.M762 == 4) {
    new_Skin.M762 = 1101008081;
    new_Skin.M762_Mag = 1010080811;
  }
  if (preferences.Config.Skin.M762 == 5) {
    new_Skin.M762 = 1101008104;
    new_Skin.M762_Mag = 1010081041;
  }
  if (preferences.Config.Skin.M762 == 6) {
    new_Skin.M762 = 1101008116;
    new_Skin.M762_Mag = 1010081161;
  }
  if (preferences.Config.Skin.M762 == 7) {
    new_Skin.M762 = 1101008126;
    new_Skin.M762_Mag = 1010081261;
  }
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.M762 == 0) {
    new_Skin.M7621 = 1010082;
    new_Skin.M762_Mag = 291008;
  }
  if (preferences.Config.Skin.M762 == 1) {
    new_Skin.M7621 = 1101008026;
    new_Skin.M762_Mag = 1010080261;
  }
  if (preferences.Config.Skin.M762 == 2) {
    new_Skin.M7621 = 1101008051;
    new_Skin.M762_Mag = 1010080511;
  }
  if (preferences.Config.Skin.M762 == 3) {
    new_Skin.M7621 = 1101008061;
    new_Skin.M762_Mag = 1010080611;
  }
  if (preferences.Config.Skin.M762 == 4) {
    new_Skin.M7621 = 1101008081;
    new_Skin.M762_Mag = 1010080811;
  }
  if (preferences.Config.Skin.M762 == 5) {
    new_Skin.M7621 = 1101008104;
    new_Skin.M762_Mag = 1010081041;
  }
  if (preferences.Config.Skin.M762 == 6) {
    new_Skin.M7621 = 1101008116;
    new_Skin.M762_Mag = 1010081161;
  }
  if (preferences.Config.Skin.M762 == 7) {
    new_Skin.M7621 = 1101008126;
    new_Skin.M762_Mag = 1010081261;
  }
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.M762 == 0) {
    new_Skin.M7622 = 1010083;
    new_Skin.M762_Mag = 291008;
  }
  if (preferences.Config.Skin.M762 == 1) {
    new_Skin.M7622 = 1101008026;
    new_Skin.M762_Mag = 1010080261;
  }
  if (preferences.Config.Skin.M762 == 2) {
    new_Skin.M7622 = 1101008051;
    new_Skin.M762_Mag = 1010080511;
  }
  if (preferences.Config.Skin.M762 == 3) {
    new_Skin.M7622 = 1101008061;
    new_Skin.M762_Mag = 1010080611;
  }
  if (preferences.Config.Skin.M762 == 4) {
    new_Skin.M7622 = 1101008081;
    new_Skin.M762_Mag = 1010080811;
  }
  if (preferences.Config.Skin.M762 == 5) {
    new_Skin.M7622 = 1101008104;
    new_Skin.M762_Mag = 1010081041;
  }
  if (preferences.Config.Skin.M762 == 6) {
    new_Skin.M7622 = 1101008116;
    new_Skin.M762_Mag = 1010081161;
  }
  if (preferences.Config.Skin.M762 == 7) {
    new_Skin.M7622 = 1101008126;
    new_Skin.M762_Mag = 1010081261;
  }
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.M762 == 0) {
    new_Skin.M7623 = 1010084;
    new_Skin.M762_Mag = 291008;
  }
  if (preferences.Config.Skin.M762 == 1) {
    new_Skin.M7623 = 1101008026;
    new_Skin.M762_Mag = 1010080261;
  }
  if (preferences.Config.Skin.M762 == 2) {
    new_Skin.M7623 = 1101008051;
    new_Skin.M762_Mag = 1010080511;
  }
  if (preferences.Config.Skin.M762 == 3) {
    new_Skin.M7623 = 1101008061;
    new_Skin.M762_Mag = 1010080611;
  }
  if (preferences.Config.Skin.M762 == 4) {
    new_Skin.M7623 = 1101008081;
    new_Skin.M762_Mag = 1010080811;
  }
  if (preferences.Config.Skin.M762 == 5) {
    new_Skin.M7623 = 1101008104;
    new_Skin.M762_Mag = 1010081041;
  }
  if (preferences.Config.Skin.M762 == 6) {
    new_Skin.M7623 = 1101008116;
    new_Skin.M762_Mag = 1010081161;
  }
  if (preferences.Config.Skin.M762 == 7) {
    new_Skin.M7623 = 1101008126;
    new_Skin.M762_Mag = 1010081261;
  }
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.M762 == 0) {
    new_Skin.M7624 = 1010085;
    new_Skin.M762_Mag = 291008;
  }
  if (preferences.Config.Skin.M762 == 1) {
    new_Skin.M7624 = 1101008026;
    new_Skin.M762_Mag = 1010080261;
  }
  if (preferences.Config.Skin.M762 == 2) {
    new_Skin.M7624 = 1101008051;
    new_Skin.M762_Mag = 1010080511;
  }
  if (preferences.Config.Skin.M762 == 3) {
    new_Skin.M7624 = 1101008061;
    new_Skin.M762_Mag = 1010080611;
  }
  if (preferences.Config.Skin.M762 == 4) {
    new_Skin.M7624 = 1101008081;
    new_Skin.M762_Mag = 1010080811;
  }
  if (preferences.Config.Skin.M762 == 5) {
    new_Skin.M7624 = 1101008104;
    new_Skin.M762_Mag = 1010081041;
  }
  if (preferences.Config.Skin.M762 == 6) {
    new_Skin.M7624 = 1101008116;
    new_Skin.M762_Mag = 1010081161;
  }
  if (preferences.Config.Skin.M762 == 7) {
    new_Skin.M7624 = 1101008126;
    new_Skin.M762_Mag = 1010081261;
  }
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.M762 == 0) {
    new_Skin.M7625 = 1010086;
    new_Skin.M762_Mag = 291008;
  }
  if (preferences.Config.Skin.M762 == 1) {
    new_Skin.M7625 = 1101008026;
    new_Skin.M762_Mag = 1010080261;
  }
  if (preferences.Config.Skin.M762 == 2) {
    new_Skin.M7625 = 1101008051;
    new_Skin.M762_Mag = 1010080511;
  }
  if (preferences.Config.Skin.M762 == 3) {
    new_Skin.M7625 = 1101008061;
    new_Skin.M762_Mag = 1010080611;
  }
  if (preferences.Config.Skin.M762 == 4) {
    new_Skin.M7625 = 1101008081;
    new_Skin.M762_Mag = 1010080811;
  }
  if (preferences.Config.Skin.M762 == 5) {
    new_Skin.M7625 = 1101008104;
    new_Skin.M762_Mag = 1010081041;
  }
  if (preferences.Config.Skin.M762 == 6) {
    new_Skin.M7625 = 1101008116;
    new_Skin.M762_Mag = 1010081161;
  }
  if (preferences.Config.Skin.M762 == 7) {
    new_Skin.M7625 = 1101008126;
    new_Skin.M762_Mag = 1010081261;
  }
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.M762 == 0) {
    new_Skin.M7626 = 1010087;
    new_Skin.M762_Mag = 291008;
  }
  if (preferences.Config.Skin.M762 == 1) {
    new_Skin.M7626 = 1101008026;
    new_Skin.M762_Mag = 1010080261;
  }
  if (preferences.Config.Skin.M762 == 2) {
    new_Skin.M7626 = 1101008051;
    new_Skin.M762_Mag = 1010080511;
  }
  if (preferences.Config.Skin.M762 == 3) {
    new_Skin.M7626 = 1101008061;
    new_Skin.M762_Mag = 1010080611;
  }
  if (preferences.Config.Skin.M762 == 4) {
    new_Skin.M7626 = 1101008081;
    new_Skin.M762_Mag = 1010080811;
  }
  if (preferences.Config.Skin.M762 == 5) {
    new_Skin.M7626 = 1101008104;
    new_Skin.M762_Mag = 1010081041;
  }
  if (preferences.Config.Skin.M762 == 6) {
    new_Skin.M7626 = 1101008116;
    new_Skin.M762_Mag = 1010081161;
  }
  if (preferences.Config.Skin.M762 == 7) {
    new_Skin.M7626 = 1101008126;
    new_Skin.M762_Mag = 1010081261;
  }
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.ACE32 == 0)
    new_Skin.ACE32 = 101102;
  if (preferences.Config.Skin.ACE32 == 1)
    new_Skin.ACE32 = 1101102007;
  if (preferences.Config.Skin.ACE32 == 2)
    new_Skin.ACE32 = 1101102017;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.ACE32 == 0)
    new_Skin.ACE321 = 1011022;
  if (preferences.Config.Skin.ACE32 == 1)
    new_Skin.ACE321 = 1101102007;
  if (preferences.Config.Skin.ACE32 == 2)
    new_Skin.ACE321 = 1101102017;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.ACE32 == 0)
    new_Skin.ACE322 = 1011023;
  if (preferences.Config.Skin.ACE32 == 1)
    new_Skin.ACE322 = 1101102007;
  if (preferences.Config.Skin.ACE32 == 2)
    new_Skin.ACE322 = 1101102017;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.ACE32 == 0)
    new_Skin.ACE323 = 1011024;
  if (preferences.Config.Skin.ACE32 == 1)
    new_Skin.ACE323 = 1101102007;
  if (preferences.Config.Skin.ACE32 == 2)
    new_Skin.ACE323 = 1101102017;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.ACE32 == 0)
    new_Skin.ACE324 = 1011025;
  if (preferences.Config.Skin.ACE32 == 1)
    new_Skin.ACE324 = 1101102007;
  if (preferences.Config.Skin.ACE32 == 2)
    new_Skin.ACE324 = 1101102017;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.ACE32 == 0)
    new_Skin.ACE325 = 1011026;
  if (preferences.Config.Skin.ACE32 == 1)
    new_Skin.ACE325 = 1101102007;
  if (preferences.Config.Skin.ACE32 == 2)
    new_Skin.ACE325 = 1101102017;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.ACE32 == 0)
    new_Skin.ACE326 = 1011027;
  if (preferences.Config.Skin.ACE32 == 1)
    new_Skin.ACE326 = 1101102007;
  if (preferences.Config.Skin.ACE32 == 2)
    new_Skin.ACE326 = 1101102017;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.UZI == 0)
    new_Skin.UZI = 102001;
  if (preferences.Config.Skin.UZI == 1)
    new_Skin.UZI = 1102001024;
  if (preferences.Config.Skin.UZI == 2)
    new_Skin.UZI = 1102001036;
  if (preferences.Config.Skin.UZI == 3)
    new_Skin.UZI = 1102001058;
  if (preferences.Config.Skin.UZI == 4)
    new_Skin.UZI = 1102001069;
  if (preferences.Config.Skin.UZI == 5)
    new_Skin.UZI = 1102001089;
  if (preferences.Config.Skin.UZI == 6)
    new_Skin.UZI = 1102001102;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.UZI == 0)
    new_Skin.UZI1 = 1020012;
  if (preferences.Config.Skin.UZI == 1)
    new_Skin.UZI1 = 1102001024;
  if (preferences.Config.Skin.UZI == 2)
    new_Skin.UZI1 = 1102001036;
  if (preferences.Config.Skin.UZI == 3)
    new_Skin.UZI1 = 1102001058;
  if (preferences.Config.Skin.UZI == 4)
    new_Skin.UZI1 = 1102001069;
  if (preferences.Config.Skin.UZI == 5)
    new_Skin.UZI1 = 1102001089;
  if (preferences.Config.Skin.UZI == 6)
    new_Skin.UZI1 = 1102001102;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.UZI == 0)
    new_Skin.UZI2 = 1020013;
  if (preferences.Config.Skin.UZI == 1)
    new_Skin.UZI2 = 1102001024;
  if (preferences.Config.Skin.UZI == 2)
    new_Skin.UZI2 = 1102001036;
  if (preferences.Config.Skin.UZI == 3)
    new_Skin.UZI2 = 1102001058;
  if (preferences.Config.Skin.UZI == 4)
    new_Skin.UZI2 = 1102001069;
  if (preferences.Config.Skin.UZI == 5)
    new_Skin.UZI2 = 1102001089;
  if (preferences.Config.Skin.UZI == 6)
    new_Skin.UZI2 = 1102001102;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.UZI == 0)
    new_Skin.UZI4 = 1020014;
  if (preferences.Config.Skin.UZI == 1)
    new_Skin.UZI3 = 1102001024;
  if (preferences.Config.Skin.UZI == 2)
    new_Skin.UZI3 = 1102001036;
  if (preferences.Config.Skin.UZI == 3)
    new_Skin.UZI3 = 1102001058;
  if (preferences.Config.Skin.UZI == 4)
    new_Skin.UZI3 = 1102001069;
  if (preferences.Config.Skin.UZI == 5)
    new_Skin.UZI3 = 1102001089;
  if (preferences.Config.Skin.UZI == 6)
    new_Skin.UZI3 = 1102001102;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.UZI == 0)
    new_Skin.UZI4 = 1020015;
  if (preferences.Config.Skin.UZI == 1)
    new_Skin.UZI4 = 1102001024;
  if (preferences.Config.Skin.UZI == 2)
    new_Skin.UZI4 = 1102001036;
  if (preferences.Config.Skin.UZI == 3)
    new_Skin.UZI4 = 1102001058;
  if (preferences.Config.Skin.UZI == 4)
    new_Skin.UZI4 = 1102001069;
  if (preferences.Config.Skin.UZI == 5)
    new_Skin.UZI4 = 1102001089;
  if (preferences.Config.Skin.UZI == 6)
    new_Skin.UZI4 = 1102001102;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.UZI == 0)
    new_Skin.UZI5 = 1020016;
  if (preferences.Config.Skin.UZI == 1)
    new_Skin.UZI5 = 1102001024;
  if (preferences.Config.Skin.UZI == 2)
    new_Skin.UZI5 = 1102001036;
  if (preferences.Config.Skin.UZI == 3)
    new_Skin.UZI5 = 1102001058;
  if (preferences.Config.Skin.UZI == 4)
    new_Skin.UZI5 = 1102001069;
  if (preferences.Config.Skin.UZI == 5)
    new_Skin.UZI5 = 1102001089;
  if (preferences.Config.Skin.UZI == 6)
    new_Skin.UZI5 = 1102001102;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.UZI == 0)
    new_Skin.UZI6 = 1020017;
  if (preferences.Config.Skin.UZI == 1)
    new_Skin.UZI6 = 1102001024;
  if (preferences.Config.Skin.UZI == 2)
    new_Skin.UZI6 = 1102001036;
  if (preferences.Config.Skin.UZI == 3)
    new_Skin.UZI6 = 1102001058;
  if (preferences.Config.Skin.UZI == 4)
    new_Skin.UZI6 = 1102001069;
  if (preferences.Config.Skin.UZI == 5)
    new_Skin.UZI6 = 1102001089;
  if (preferences.Config.Skin.UZI == 6)
    new_Skin.UZI6 = 1102001102;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.UMP == 0)
    new_Skin.UMP = 102002;
  if (preferences.Config.Skin.UMP == 1)
    new_Skin.UMP = 1102002043;
  if (preferences.Config.Skin.UMP == 2)
    new_Skin.UMP = 1102002061;
  if (preferences.Config.Skin.UMP == 3)
    new_Skin.UMP = 1102002090;
  if (preferences.Config.Skin.UMP == 4)
    new_Skin.UMP = 1102002117;
  if (preferences.Config.Skin.UMP == 5)
    new_Skin.UMP = 1102002124;
  if (preferences.Config.Skin.UMP == 6)
    new_Skin.UMP = 1102002129;
  if (preferences.Config.Skin.UMP == 7)
    new_Skin.UMP = 1102002136;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.UMP == 0)
    new_Skin.UMP1 = 1020022;
  if (preferences.Config.Skin.UMP == 1)
    new_Skin.UMP1 = 1102002043;
  if (preferences.Config.Skin.UMP == 2)
    new_Skin.UMP1 = 1102002061;
  if (preferences.Config.Skin.UMP == 3)
    new_Skin.UMP1 = 1102002090;
  if (preferences.Config.Skin.UMP == 4)
    new_Skin.UMP1 = 1102002117;
  if (preferences.Config.Skin.UMP == 5)
    new_Skin.UMP1 = 1102002124;
  if (preferences.Config.Skin.UMP == 6)
    new_Skin.UMP1 = 1102002129;
  if (preferences.Config.Skin.UMP == 7)
    new_Skin.UMP1 = 1102002136;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.UMP == 0)
    new_Skin.UMP2 = 1020023;
  if (preferences.Config.Skin.UMP == 1)
    new_Skin.UMP2 = 1102002043;
  if (preferences.Config.Skin.UMP == 2)
    new_Skin.UMP2 = 1102002061;
  if (preferences.Config.Skin.UMP == 3)
    new_Skin.UMP2 = 1102002090;
  if (preferences.Config.Skin.UMP == 4)
    new_Skin.UMP2 = 1102002117;
  if (preferences.Config.Skin.UMP == 5)
    new_Skin.UMP2 = 1102002124;
  if (preferences.Config.Skin.UMP == 6)
    new_Skin.UMP2 = 1102002129;
  if (preferences.Config.Skin.UMP == 7)
    new_Skin.UMP2 = 1102002136;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.UMP == 0)
    new_Skin.UMP3 = 1020024;
  if (preferences.Config.Skin.UMP == 1)
    new_Skin.UMP3 = 1102002043;
  if (preferences.Config.Skin.UMP == 2)
    new_Skin.UMP3 = 1102002061;
  if (preferences.Config.Skin.UMP == 3)
    new_Skin.UMP3 = 1102002090;
  if (preferences.Config.Skin.UMP == 4)
    new_Skin.UMP3 = 1102002117;
  if (preferences.Config.Skin.UMP == 5)
    new_Skin.UMP3 = 1102002124;
  if (preferences.Config.Skin.UMP == 6)
    new_Skin.UMP3 = 1102002129;
  if (preferences.Config.Skin.UMP == 7)
    new_Skin.UMP3 = 1102002136;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.UMP == 0)
    new_Skin.UMP4 = 1020025;
  if (preferences.Config.Skin.UMP == 1)
    new_Skin.UMP4 = 1102002043;
  if (preferences.Config.Skin.UMP == 2)
    new_Skin.UMP4 = 1102002061;
  if (preferences.Config.Skin.UMP == 3)
    new_Skin.UMP4 = 1102002090;
  if (preferences.Config.Skin.UMP == 4)
    new_Skin.UMP4 = 1102002117;
  if (preferences.Config.Skin.UMP == 5)
    new_Skin.UMP4 = 1102002124;
  if (preferences.Config.Skin.UMP == 6)
    new_Skin.UMP4 = 1102002129;
  if (preferences.Config.Skin.UMP == 7)
    new_Skin.UMP4 = 1102002136;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.UMP == 0)
    new_Skin.UMP5 = 1020026;
  if (preferences.Config.Skin.UMP == 1)
    new_Skin.UMP5 = 1102002043;
  if (preferences.Config.Skin.UMP == 2)
    new_Skin.UMP5 = 1102002061;
  if (preferences.Config.Skin.UMP == 3)
    new_Skin.UMP5 = 1102002090;
  if (preferences.Config.Skin.UMP == 4)
    new_Skin.UMP5 = 1102002117;
  if (preferences.Config.Skin.UMP == 5)
    new_Skin.UMP5 = 1102002124;
  if (preferences.Config.Skin.UMP == 6)
    new_Skin.UMP5 = 1102002129;
  if (preferences.Config.Skin.UMP == 7)
    new_Skin.UMP5 = 1102002136;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.UMP == 0)
    new_Skin.UMP6 = 1020027;
  if (preferences.Config.Skin.UMP == 1)
    new_Skin.UMP6 = 1102002043;
  if (preferences.Config.Skin.UMP == 2)
    new_Skin.UMP6 = 1102002061;
  if (preferences.Config.Skin.UMP == 3)
    new_Skin.UMP6 = 1102002090;
  if (preferences.Config.Skin.UMP == 4)
    new_Skin.UMP6 = 1102002117;
  if (preferences.Config.Skin.UMP == 5)
    new_Skin.UMP6 = 1102002124;
  if (preferences.Config.Skin.UMP == 6)
    new_Skin.UMP6 = 1102002129;
  if (preferences.Config.Skin.UMP == 7)
    new_Skin.UMP6 = 1102002136;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.Vector == 0)
    new_Skin.Vector = 102003;
  if (preferences.Config.Skin.Vector == 1)
    new_Skin.Vector = 1102003020;
  if (preferences.Config.Skin.Vector == 2)
    new_Skin.Vector = 1102003031;
  if (preferences.Config.Skin.Vector == 3)
    new_Skin.Vector = 1102003065;
  if (preferences.Config.Skin.Vector == 4)
    new_Skin.Vector = 1102003080;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.Thompson == 0)
    new_Skin.Thompson = 102004;
  if (preferences.Config.Skin.Thompson == 1)
    new_Skin.Thompson = 1102004018;
  if (preferences.Config.Skin.Thompson == 2)
    new_Skin.Thompson = 1102004034;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.Bizon == 0)
    new_Skin.Bizon = 102005;
  if (preferences.Config.Skin.Bizon == 1)
    new_Skin.Bizon = 1102005007;
  if (preferences.Config.Skin.Bizon == 2)
    new_Skin.Bizon = 1102005020;
  if (preferences.Config.Skin.Bizon == 3)
    new_Skin.Bizon = 1102005041;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.K98 == 0)
    new_Skin.K98 = 103001;
  if (preferences.Config.Skin.K98 == 1)
    new_Skin.K98 = 1103001060;
  if (preferences.Config.Skin.K98 == 2)
    new_Skin.K98 = 1103001079;
  if (preferences.Config.Skin.K98 == 3)
    new_Skin.K98 = 1103001101;
  if (preferences.Config.Skin.K98 == 4)
    new_Skin.K98 = 1103001145;
  if (preferences.Config.Skin.K98 == 5)
    new_Skin.K98 = 1103001160;
  if (preferences.Config.Skin.K98 == 6)
    new_Skin.K98 = 1103001179;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.K98 == 0)
    new_Skin.K981 = 1030012;
  if (preferences.Config.Skin.K98 == 1)
    new_Skin.K981 = 1103001060;
  if (preferences.Config.Skin.K98 == 2)
    new_Skin.K981 = 1103001079;
  if (preferences.Config.Skin.K98 == 3)
    new_Skin.K981 = 1103001101;
  if (preferences.Config.Skin.K98 == 4)
    new_Skin.K981 = 1103001145;
  if (preferences.Config.Skin.K98 == 5)
    new_Skin.K981 = 1103001160;
  if (preferences.Config.Skin.K98 == 6)
    new_Skin.K981 = 1103001179;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.K98 == 0)
    new_Skin.K982 = 1030013;
  if (preferences.Config.Skin.K98 == 1)
    new_Skin.K982 = 1103001060;
  if (preferences.Config.Skin.K98 == 2)
    new_Skin.K982 = 1103001079;
  if (preferences.Config.Skin.K98 == 3)
    new_Skin.K982 = 1103001101;
  if (preferences.Config.Skin.K98 == 4)
    new_Skin.K982 = 1103001145;
  if (preferences.Config.Skin.K98 == 5)
    new_Skin.K982 = 1103001160;
  if (preferences.Config.Skin.K98 == 6)
    new_Skin.K982 = 1103001179;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.K98 == 0)
    new_Skin.K983 = 1030014;
  if (preferences.Config.Skin.K98 == 1)
    new_Skin.K983 = 1103001060;
  if (preferences.Config.Skin.K98 == 2)
    new_Skin.K983 = 1103001079;
  if (preferences.Config.Skin.K98 == 3)
    new_Skin.K983 = 1103001101;
  if (preferences.Config.Skin.K98 == 4)
    new_Skin.K983 = 1103001145;
  if (preferences.Config.Skin.K98 == 5)
    new_Skin.K983 = 1103001160;
  if (preferences.Config.Skin.K98 == 6)
    new_Skin.K983 = 1103001179;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.K98 == 0)
    new_Skin.K984 = 1030015;
  if (preferences.Config.Skin.K98 == 1)
    new_Skin.K984 = 1103001060;
  if (preferences.Config.Skin.K98 == 2)
    new_Skin.K984 = 1103001079;
  if (preferences.Config.Skin.K98 == 3)
    new_Skin.K984 = 1103001101;
  if (preferences.Config.Skin.K98 == 4)
    new_Skin.K984 = 1103001145;
  if (preferences.Config.Skin.K98 == 5)
    new_Skin.K984 = 1103001160;
  if (preferences.Config.Skin.K98 == 6)
    new_Skin.K984 = 1103001179;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.K98 == 0)
    new_Skin.K985 = 1030016;
  if (preferences.Config.Skin.K98 == 1)
    new_Skin.K985 = 1103001060;
  if (preferences.Config.Skin.K98 == 2)
    new_Skin.K985 = 1103001079;
  if (preferences.Config.Skin.K98 == 3)
    new_Skin.K985 = 1103001101;
  if (preferences.Config.Skin.K98 == 4)
    new_Skin.K985 = 1103001145;
  if (preferences.Config.Skin.K98 == 5)
    new_Skin.K985 = 1103001160;
  if (preferences.Config.Skin.K98 == 6)
    new_Skin.K985 = 1103001179;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.K98 == 0)
    new_Skin.K986 = 1030017;
  if (preferences.Config.Skin.K98 == 1)
    new_Skin.K986 = 1103001060;
  if (preferences.Config.Skin.K98 == 2)
    new_Skin.K986 = 1103001079;
  if (preferences.Config.Skin.K98 == 3)
    new_Skin.K986 = 1103001101;
  if (preferences.Config.Skin.K98 == 4)
    new_Skin.K986 = 1103001145;
  if (preferences.Config.Skin.K98 == 5)
    new_Skin.K986 = 1103001160;
  if (preferences.Config.Skin.K98 == 6)
    new_Skin.K986 = 1103001179;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (new_Skin.M24 == 0)
    new_Skin.M24 = 103002;
  if (preferences.Config.Skin.M24 == 1)
    new_Skin.M24 = 1103002018;
  if (preferences.Config.Skin.M24 == 2)
    new_Skin.M24 = 1103002030;
  if (preferences.Config.Skin.M24 == 3)
    new_Skin.M24 = 1103002048;
  if (preferences.Config.Skin.M24 == 4)
    new_Skin.M24 = 1103002056;
  if (preferences.Config.Skin.M24 == 5)
    new_Skin.M24 = 1103002087;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (new_Skin.M24 == 0)
    new_Skin.M241 = 1030022;
  if (preferences.Config.Skin.M24 == 1)
    new_Skin.M241 = 1103002018;
  if (preferences.Config.Skin.M24 == 2)
    new_Skin.M241 = 1103002030;
  if (preferences.Config.Skin.M24 == 3)
    new_Skin.M241 = 1103002048;
  if (preferences.Config.Skin.M24 == 4)
    new_Skin.M241 = 1103002056;
  if (preferences.Config.Skin.M24 == 5)
    new_Skin.M241 = 1103002087;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (new_Skin.M24 == 0)
    new_Skin.M242 = 1030023;
  if (preferences.Config.Skin.M24 == 1)
    new_Skin.M242 = 1103002018;
  if (preferences.Config.Skin.M24 == 2)
    new_Skin.M242 = 1103002030;
  if (preferences.Config.Skin.M24 == 3)
    new_Skin.M242 = 1103002048;
  if (preferences.Config.Skin.M24 == 4)
    new_Skin.M242 = 1103002056;
  if (preferences.Config.Skin.M24 == 5)
    new_Skin.M242 = 1103002087;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (new_Skin.M24 == 0)
    new_Skin.M243 = 1030024;
  if (preferences.Config.Skin.M24 == 1)
    new_Skin.M243 = 1103002018;
  if (preferences.Config.Skin.M24 == 2)
    new_Skin.M243 = 1103002030;
  if (preferences.Config.Skin.M24 == 3)
    new_Skin.M243 = 1103002048;
  if (preferences.Config.Skin.M24 == 4)
    new_Skin.M243 = 1103002056;
  if (preferences.Config.Skin.M24 == 5)
    new_Skin.M243 = 1103002087;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (new_Skin.M24 == 0)
    new_Skin.M244 = 1030025;
  if (preferences.Config.Skin.M24 == 1)
    new_Skin.M244 = 1103002018;
  if (preferences.Config.Skin.M24 == 2)
    new_Skin.M244 = 1103002030;
  if (preferences.Config.Skin.M24 == 3)
    new_Skin.M244 = 1103002048;
  if (preferences.Config.Skin.M24 == 4)
    new_Skin.M244 = 1103002056;
  if (preferences.Config.Skin.M24 == 5)
    new_Skin.M244 = 1103002087;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (new_Skin.M24 == 0)
    new_Skin.M245 = 1030026;
  if (preferences.Config.Skin.M24 == 1)
    new_Skin.M245 = 1103002018;
  if (preferences.Config.Skin.M24 == 2)
    new_Skin.M245 = 1103002030;
  if (preferences.Config.Skin.M24 == 3)
    new_Skin.M245 = 1103002048;
  if (preferences.Config.Skin.M24 == 4)
    new_Skin.M245 = 1103002056;
  if (preferences.Config.Skin.M24 == 5)
    new_Skin.M245 = 1103002087;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (new_Skin.M24 == 0)
    new_Skin.M246 = 1030027;
  if (preferences.Config.Skin.M24 == 1)
    new_Skin.M246 = 1103002018;
  if (preferences.Config.Skin.M24 == 2)
    new_Skin.M246 = 1103002030;
  if (preferences.Config.Skin.M24 == 3)
    new_Skin.M246 = 1103002048;
  if (preferences.Config.Skin.M24 == 4)
    new_Skin.M246 = 1103002056;
  if (preferences.Config.Skin.M24 == 5)
    new_Skin.M246 = 1103002087;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.AWM == 0)
    new_Skin.AWM = 103003;
  if (preferences.Config.Skin.AWM == 1)
    new_Skin.AWM = 1103003022;
  if (preferences.Config.Skin.AWM == 2)
    new_Skin.AWM = 1103003030;
  if (preferences.Config.Skin.AWM == 3)
    new_Skin.AWM = 1103003042;
  if (preferences.Config.Skin.AWM == 4)
    new_Skin.AWM = 1103003051;
  if (preferences.Config.Skin.AWM == 5)
    new_Skin.AWM = 1103003062;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.AWM == 0)
    new_Skin.AWM1 = 1030032;
  if (preferences.Config.Skin.AWM == 1)
    new_Skin.AWM1 = 1103003022;
  if (preferences.Config.Skin.AWM == 2)
    new_Skin.AWM1 = 1103003030;
  if (preferences.Config.Skin.AWM == 3)
    new_Skin.AWM1 = 1103003042;
  if (preferences.Config.Skin.AWM == 4)
    new_Skin.AWM1 = 1103003051;
  if (preferences.Config.Skin.AWM == 5)
    new_Skin.AWM1 = 1103003062;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.AWM == 0)
    new_Skin.AWM2 = 1030033;
  if (preferences.Config.Skin.AWM == 1)
    new_Skin.AWM2 = 1103003022;
  if (preferences.Config.Skin.AWM == 2)
    new_Skin.AWM2 = 1103003030;
  if (preferences.Config.Skin.AWM == 3)
    new_Skin.AWM2 = 1103003042;
  if (preferences.Config.Skin.AWM == 4)
    new_Skin.AWM2 = 1103003051;
  if (preferences.Config.Skin.AWM == 5)
    new_Skin.AWM2 = 1103003062;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.AWM == 0)
    new_Skin.AWM3 = 1030034;
  if (preferences.Config.Skin.AWM == 1)
    new_Skin.AWM3 = 1103003022;
  if (preferences.Config.Skin.AWM == 2)
    new_Skin.AWM3 = 1103003030;
  if (preferences.Config.Skin.AWM == 3)
    new_Skin.AWM3 = 1103003042;
  if (preferences.Config.Skin.AWM == 4)
    new_Skin.AWM3 = 1103003051;
  if (preferences.Config.Skin.AWM == 5)
    new_Skin.AWM3 = 1103003062;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.AWM == 0)
    new_Skin.AWM4 = 1030035;
  if (preferences.Config.Skin.AWM == 1)
    new_Skin.AWM4 = 1103003022;
  if (preferences.Config.Skin.AWM == 2)
    new_Skin.AWM4 = 1103003030;
  if (preferences.Config.Skin.AWM == 3)
    new_Skin.AWM4 = 1103003042;
  if (preferences.Config.Skin.AWM == 4)
    new_Skin.AWM4 = 1103003051;
  if (preferences.Config.Skin.AWM == 5)
    new_Skin.AWM4 = 1103003062;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.AWM == 0)
    new_Skin.AWM5 = 1030036;
  if (preferences.Config.Skin.AWM == 1)
    new_Skin.AWM5 = 1103003022;
  if (preferences.Config.Skin.AWM == 2)
    new_Skin.AWM5 = 1103003030;
  if (preferences.Config.Skin.AWM == 3)
    new_Skin.AWM5 = 1103003042;
  if (preferences.Config.Skin.AWM == 4)
    new_Skin.AWM5 = 1103003051;
  if (preferences.Config.Skin.AWM == 5)
    new_Skin.AWM5 = 1103003062;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.AWM == 0)
    new_Skin.AWM6 = 1030037;
  if (preferences.Config.Skin.AWM == 1)
    new_Skin.AWM6 = 1103003022;
  if (preferences.Config.Skin.AWM == 2)
    new_Skin.AWM6 = 1103003030;
  if (preferences.Config.Skin.AWM == 3)
    new_Skin.AWM6 = 1103003042;
  if (preferences.Config.Skin.AWM == 4)
    new_Skin.AWM6 = 1103003051;
  if (preferences.Config.Skin.AWM == 5)
    new_Skin.AWM6 = 1103003062;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.DP28 == 0)
    new_Skin.DP28 = 105002;
  if (preferences.Config.Skin.DP28 == 1)
    new_Skin.DP28 = 1105002018;
  if (preferences.Config.Skin.DP28 == 2)
    new_Skin.DP28 = 1105002035;
  if (preferences.Config.Skin.DP28 == 3)
    new_Skin.DP28 = 1105002058;
  if (preferences.Config.Skin.DP28 == 4)
    new_Skin.DP28 = 1105002063;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.DP28 == 0)
    new_Skin.DP281 = 1050022;
  if (preferences.Config.Skin.DP28 == 1)
    new_Skin.DP281 = 1105002018;
  if (preferences.Config.Skin.DP28 == 2)
    new_Skin.DP281 = 1105002035;
  if (preferences.Config.Skin.DP28 == 3)
    new_Skin.DP281 = 1105002058;
  if (preferences.Config.Skin.DP28 == 4)
    new_Skin.DP281 = 1105002063;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.DP28 == 0)
    new_Skin.DP282 = 1050023;
  if (preferences.Config.Skin.DP28 == 1)
    new_Skin.DP282 = 1105002018;
  if (preferences.Config.Skin.DP28 == 2)
    new_Skin.DP282 = 1105002035;
  if (preferences.Config.Skin.DP28 == 3)
    new_Skin.DP282 = 1105002058;
  if (preferences.Config.Skin.DP28 == 4)
    new_Skin.DP282 = 1105002063;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.DP28 == 0)
    new_Skin.DP283 = 1050024;
  if (preferences.Config.Skin.DP28 == 1)
    new_Skin.DP283 = 1105002018;
  if (preferences.Config.Skin.DP28 == 2)
    new_Skin.DP283 = 1105002035;
  if (preferences.Config.Skin.DP28 == 3)
    new_Skin.DP283 = 1105002058;
  if (preferences.Config.Skin.DP28 == 4)
    new_Skin.DP283 = 1105002063;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.DP28 == 0)
    new_Skin.DP284 = 1050025;
  if (preferences.Config.Skin.DP28 == 1)
    new_Skin.DP284 = 1105002018;
  if (preferences.Config.Skin.DP28 == 2)
    new_Skin.DP284 = 1105002035;
  if (preferences.Config.Skin.DP28 == 3)
    new_Skin.DP284 = 1105002058;
  if (preferences.Config.Skin.DP28 == 4)
    new_Skin.DP284 = 1105002063;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.DP28 == 0)
    new_Skin.DP285 = 1050026;
  if (preferences.Config.Skin.DP28 == 1)
    new_Skin.DP285 = 1105002018;
  if (preferences.Config.Skin.DP28 == 2)
    new_Skin.DP285 = 1105002035;
  if (preferences.Config.Skin.DP28 == 3)
    new_Skin.DP285 = 1105002058;
  if (preferences.Config.Skin.DP28 == 4)
    new_Skin.DP285 = 1105002063;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.DP28 == 0)
    new_Skin.DP286 = 1050027;
  if (preferences.Config.Skin.DP28 == 1)
    new_Skin.DP286 = 1105002018;
  if (preferences.Config.Skin.DP28 == 2)
    new_Skin.DP286 = 1105002035;
  if (preferences.Config.Skin.DP28 == 3)
    new_Skin.DP286 = 1105002058;
  if (preferences.Config.Skin.DP28 == 4)
    new_Skin.DP286 = 1105002063;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (new_Skin.M249 == 0)
    new_Skin.M249 = 105001;
    new_Skin.M249s = 205009;
  if (preferences.Config.Skin.M249 == 1)
    new_Skin.M249 = 1105001020;
    new_Skin.M249s = 1050010351;
  if (preferences.Config.Skin.M249 == 2)
    new_Skin.M249 = 1105001034;
    new_Skin.M249s = 1050010412;
  if (preferences.Config.Skin.M249 == 3)
    new_Skin.M249 = 1105001048;
    new_Skin.M249s = 1050010482;
  if (preferences.Config.Skin.M249 == 4)
    new_Skin.M249 = 1105001054;
    new_Skin.M249s = 1050010542;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (new_Skin.M249 == 0)
    new_Skin.M2491 = 1050012;
    new_Skin.M249s = 205009;
  if (preferences.Config.Skin.M249 == 1)
    new_Skin.M2491 = 1105001020;
    new_Skin.M249s = 1050010351;
  if (preferences.Config.Skin.M249 == 2)
    new_Skin.M2491 = 1105001034;
    new_Skin.M249s = 1050010412;
  if (preferences.Config.Skin.M249 == 3)
    new_Skin.M2491 = 1105001048;
    new_Skin.M249s = 1050010482;
  if (preferences.Config.Skin.M249 == 4)
    new_Skin.M2491 = 1105001054;
    new_Skin.M249s = 1050010542;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (new_Skin.M249 == 0)
    new_Skin.M2492 = 1050013;
    new_Skin.M249s = 205009;
  if (preferences.Config.Skin.M249 == 1)
    new_Skin.M2492 = 1105001020;
    new_Skin.M249s = 1050010351;
  if (preferences.Config.Skin.M249 == 2)
    new_Skin.M2492 = 1105001034;
    new_Skin.M249s = 1050010412;
  if (preferences.Config.Skin.M249 == 3)
    new_Skin.M2492 = 1105001048;
    new_Skin.M249s = 1050010482;
  if (preferences.Config.Skin.M249 == 4)
    new_Skin.M2492 = 1105001054;
    new_Skin.M249s = 1050010542;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (new_Skin.M249 == 0)
    new_Skin.M2493 = 1050014;
    new_Skin.M249s = 205009;
  if (preferences.Config.Skin.M249 == 1)
    new_Skin.M2493 = 1105001020;
    new_Skin.M249s = 1050010351;
  if (preferences.Config.Skin.M249 == 2)
    new_Skin.M2493 = 1105001034;
    new_Skin.M249s = 1050010412;
  if (preferences.Config.Skin.M249 == 3)
    new_Skin.M2493 = 1105001048;
    new_Skin.M249s = 1050010482;
  if (preferences.Config.Skin.M249 == 4)
    new_Skin.M2493 = 1105001054;
    new_Skin.M249s = 1050010542;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (new_Skin.M249 == 0)
    new_Skin.M2494 = 1050015;
    new_Skin.M249s = 205009;
  if (preferences.Config.Skin.M249 == 1)
    new_Skin.M2494 = 1105001020;
    new_Skin.M249s = 1050010351;
  if (preferences.Config.Skin.M249 == 2)
    new_Skin.M2494 = 1105001034;
    new_Skin.M249s = 1050010412;
  if (preferences.Config.Skin.M249 == 3)
    new_Skin.M2494 = 1105001048;
    new_Skin.M249s = 1050010482;
  if (preferences.Config.Skin.M249 == 4)
    new_Skin.M2494 = 1105001054;
    new_Skin.M249s = 1050010542;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (new_Skin.M249 == 0)
    new_Skin.M2495 = 1050016;
    new_Skin.M249s = 205009;
  if (preferences.Config.Skin.M249 == 1)
    new_Skin.M2495 = 1105001020;
    new_Skin.M249s = 1050010351;
  if (preferences.Config.Skin.M249 == 2)
    new_Skin.M2495 = 1105001034;
    new_Skin.M249s = 1050010412;
  if (preferences.Config.Skin.M249 == 3)
    new_Skin.M2495 = 1105001048;
    new_Skin.M249s = 1050010482;
  if (preferences.Config.Skin.M249 == 4)
    new_Skin.M2495 = 1105001054;
    new_Skin.M249s = 1050010542;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (new_Skin.M249 == 0)
    new_Skin.M2496 = 1050017;
    new_Skin.M249s = 205009;
  if (preferences.Config.Skin.M249 == 1)
    new_Skin.M2496 = 1105001020;
    new_Skin.M249s = 1050010351;
  if (preferences.Config.Skin.M249 == 2)
    new_Skin.M2496 = 1105001034;
    new_Skin.M249s = 1050010412;
  if (preferences.Config.Skin.M249 == 3)
    new_Skin.M2496 = 1105001048;
    new_Skin.M249s = 1050010482;
  if (preferences.Config.Skin.M249 == 4)
    new_Skin.M2496 = 1105001054;
    new_Skin.M249s = 1050010542;
  
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

   if (preferences.Config.Skin.Bigfoot == 0)
    new_Skin.Bigfoot = 1953001;
  if (preferences.Config.Skin.Bigfoot == 1)
    new_Skin.Bigfoot = 1953004;
    
  if (preferences.Config.Skin.OMirado == 0)
    new_Skin.OMirado = 1915001;
  if (preferences.Config.Skin.OMirado == 1)
    new_Skin.OMirado = 1915011;
  if (preferences.Config.Skin.OMirado == 2)
    new_Skin.OMirado = 1915099;
    
  if (preferences.Config.Skin.Mirado == 0)
    new_Skin.Mirado = 1914001;
  if (preferences.Config.Skin.Mirado == 1)
    new_Skin.Mirado = 1914011;
    
  if (preferences.Config.Skin.Moto == 0)
    new_Skin.Moto = 1901001;
  if (preferences.Config.Skin.Moto == 1)
    new_Skin.Moto = 1901073;
  if (preferences.Config.Skin.Moto == 2)
    new_Skin.Moto = 1901074;
  if (preferences.Config.Skin.Moto == 3)
    new_Skin.Moto = 1901075;
  if (preferences.Config.Skin.Moto == 4)
    new_Skin.Moto = 1901047;
  if (preferences.Config.Skin.Moto == 5)
    new_Skin.Moto = 1901085;
  if (preferences.Config.Skin.Moto == 6)
    new_Skin.Moto = 1901076;
  if (preferences.Config.Skin.Moto == 7)
    new_Skin.Moto = 1901027;
  if (preferences.Config.Skin.Moto == 8)
    new_Skin.Moto = 1901018;
  if (preferences.Config.Skin.Moto == 9)
    new_Skin.Moto = 1901085;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

if (preferences.Config.Skin.Buggy == 0)
    new_Skin.Buggy = 1907001;
  if (preferences.Config.Skin.Buggy == 1)
    new_Skin.Buggy = 1907047;
  if (preferences.Config.Skin.Buggy == 2)
    new_Skin.Buggy = 1907009;
if (preferences.Config.Skin.Buggy == 3)
    new_Skin.Buggy = 1907010;
if (preferences.Config.Skin.Buggy == 4)
    new_Skin.Buggy = 1907011;
if (preferences.Config.Skin.Buggy == 5)
    new_Skin.Buggy = 1907012;
if (preferences.Config.Skin.Buggy == 6)
    new_Skin.Buggy = 1907013;
if (preferences.Config.Skin.Buggy == 7)
    new_Skin.Buggy = 1907014;
if (preferences.Config.Skin.Buggy == 8)
    new_Skin.Buggy = 1907015;
if (preferences.Config.Skin.Buggy == 9)
    new_Skin.Buggy = 1907016;
if (preferences.Config.Skin.Buggy == 10)
    new_Skin.Buggy = 1907017;
if (preferences.Config.Skin.Buggy == 11)
    new_Skin.Buggy = 1907018;
if (preferences.Config.Skin.Buggy == 12)
    new_Skin.Buggy = 1907019;
if (preferences.Config.Skin.Buggy == 13)
    new_Skin.Buggy = 1907020;
if (preferences.Config.Skin.Buggy == 14)
    new_Skin.Buggy = 1907021;
if (preferences.Config.Skin.Buggy == 15)
    new_Skin.Buggy = 1907022;
if (preferences.Config.Skin.Buggy == 16)
    new_Skin.Buggy = 1907023;
if (preferences.Config.Skin.Buggy == 17)
    new_Skin.Buggy = 1907024;
if (preferences.Config.Skin.Buggy == 18)
    new_Skin.Buggy = 1907025;
if (preferences.Config.Skin.Buggy == 19)
    new_Skin.Buggy = 1907026;
if (preferences.Config.Skin.Buggy == 20)
    new_Skin.Buggy = 1907027;
if (preferences.Config.Skin.Buggy == 21)
    new_Skin.Buggy = 1907028;
if (preferences.Config.Skin.Buggy == 22)
    new_Skin.Buggy = 1907029;
if (preferences.Config.Skin.Buggy == 23)
    new_Skin.Buggy = 1907030;
if (preferences.Config.Skin.Buggy == 24)
    new_Skin.Buggy = 1907031;
if (preferences.Config.Skin.Buggy == 25)
    new_Skin.Buggy = 1907032;
if (preferences.Config.Skin.Buggy == 26)
    new_Skin.Buggy = 1907033;
if (preferences.Config.Skin.Buggy == 27)
    new_Skin.Buggy = 1907034;
if (preferences.Config.Skin.Buggy == 28)
    new_Skin.Buggy = 1907035;
if (preferences.Config.Skin.Buggy == 29)
    new_Skin.Buggy = 1907036;
if (preferences.Config.Skin.Buggy == 30)
    new_Skin.Buggy = 1907037;
if (preferences.Config.Skin.Buggy == 31)
    new_Skin.Buggy = 1907038;
if (preferences.Config.Skin.Buggy == 32)
    new_Skin.Buggy = 1907039;
if (preferences.Config.Skin.Buggy == 33)
    new_Skin.Buggy = 1907040;
    
  if (preferences.Config.Skin.Dacia == 0)
    new_Skin.Dacia = 1903001;
  if (preferences.Config.Skin.Dacia == 1)
    new_Skin.Dacia = 1903076;
  if (preferences.Config.Skin.Dacia == 2)
    new_Skin.Dacia = 1903079;
  if (preferences.Config.Skin.Dacia == 3)
    new_Skin.Dacia = 1903071;
  if (preferences.Config.Skin.Dacia == 4)
    new_Skin.Dacia = 1903014;
  if (preferences.Config.Skin.Dacia == 5)
    new_Skin.Dacia = 1903017;
  if (preferences.Config.Skin.Dacia == 6)
    new_Skin.Dacia = 1903035;
  if (preferences.Config.Skin.Dacia == 7)
    new_Skin.Dacia = 1903087;
  if (preferences.Config.Skin.Dacia == 8)
    new_Skin.Dacia = 1903088;
  if (preferences.Config.Skin.Dacia == 9)
    new_Skin.Dacia = 1903089;
  if (preferences.Config.Skin.Dacia == 10)
    new_Skin.Dacia = 1903090;
  if (preferences.Config.Skin.Dacia == 11)
    new_Skin.Dacia = 1903074;
  if (preferences.Config.Skin.Dacia == 12)
    new_Skin.Dacia = 1903075;
  if (preferences.Config.Skin.Dacia == 13)
    new_Skin.Dacia = 1903072;
  if (preferences.Config.Skin.Dacia == 14)
    new_Skin.Dacia = 1903073;
  if (preferences.Config.Skin.Dacia == 15)
    new_Skin.Dacia = 1903080;
  if (preferences.Config.Skin.Dacia == 16)
    new_Skin.Dacia = 1903189;
  if (preferences.Config.Skin.Dacia == 17)
    new_Skin.Dacia = 1903190;
  if (preferences.Config.Skin.Dacia == 18)
    new_Skin.Dacia = 1903191;
  if (preferences.Config.Skin.Dacia == 19)
    new_Skin.Dacia = 1903192;
  if (preferences.Config.Skin.Dacia == 20)
    new_Skin.Dacia = 1903193;
  if (preferences.Config.Skin.Dacia == 21)
    new_Skin.Dacia = 1903197;
  
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  
if (preferences.Config.Skin.MiniBus == 0)
    new_Skin.MiniBus = 1904001;
  if (preferences.Config.Skin.MiniBus == 1)
    new_Skin.MiniBus = 1904005;
  if (preferences.Config.Skin.MiniBus == 2)
    new_Skin.MiniBus = 1904006;
if (preferences.Config.Skin.MiniBus == 3)
    new_Skin.MiniBus = 1904007;
if (preferences.Config.Skin.MiniBus == 4)
    new_Skin.MiniBus = 1904008;
if (preferences.Config.Skin.MiniBus == 5)
    new_Skin.MiniBus = 1904009;
if (preferences.Config.Skin.MiniBus == 6)
    new_Skin.MiniBus = 1904010;
if (preferences.Config.Skin.MiniBus == 7)
    new_Skin.MiniBus = 1904011;
if (preferences.Config.Skin.MiniBus == 8)
    new_Skin.MiniBus = 1904012;
if (preferences.Config.Skin.MiniBus == 9)
    new_Skin.MiniBus = 1904013;
if (preferences.Config.Skin.MiniBus == 10)
    new_Skin.MiniBus = 1904014;
if (preferences.Config.Skin.MiniBus == 11)
    new_Skin.MiniBus = 1904015;
if (preferences.Config.Skin.MiniBus == 12)
    new_Skin.MiniBus = 1904004;
  
  if (preferences.Config.Skin.CoupeRP == 0)
    new_Skin.CoupeRP = 1961001;
  if (preferences.Config.Skin.CoupeRP == 1)
    new_Skin.CoupeRP = 1961024;
  if (preferences.Config.Skin.CoupeRP == 2)
    new_Skin.CoupeRP = 1961047;
  if (preferences.Config.Skin.CoupeRP == 3)
    new_Skin.CoupeRP = 1961034;
  if (preferences.Config.Skin.CoupeRP == 4)
    new_Skin.CoupeRP = 1961018;
  if (preferences.Config.Skin.CoupeRP == 5)
    new_Skin.CoupeRP = 1961007;
  if (preferences.Config.Skin.CoupeRP == 6)
    new_Skin.CoupeRP = 1961010;
  if (preferences.Config.Skin.CoupeRP == 7)
    new_Skin.CoupeRP = 1961049;
  if (preferences.Config.Skin.CoupeRP == 8)
    new_Skin.CoupeRP = 1961048;
  if (preferences.Config.Skin.CoupeRP == 9)
    new_Skin.CoupeRP = 1961012;
  if (preferences.Config.Skin.CoupeRP == 10)
    new_Skin.CoupeRP = 1961013;
  if (preferences.Config.Skin.CoupeRP == 11)
    new_Skin.CoupeRP = 1961014;
  if (preferences.Config.Skin.CoupeRP == 12)
    new_Skin.CoupeRP = 1961015;
  if (preferences.Config.Skin.CoupeRP == 13)
    new_Skin.CoupeRP = 1961016;
  if (preferences.Config.Skin.CoupeRP == 14)
    new_Skin.CoupeRP = 1961017;
  if (preferences.Config.Skin.CoupeRP == 15)
    new_Skin.CoupeRP = 1961020;
  if (preferences.Config.Skin.CoupeRP == 16)
    new_Skin.CoupeRP = 1961021;
  if (preferences.Config.Skin.CoupeRP == 17)
    new_Skin.CoupeRP = 1961025;
  if (preferences.Config.Skin.CoupeRP == 18)
    new_Skin.CoupeRP = 1961029;
  if (preferences.Config.Skin.CoupeRP == 19)
    new_Skin.CoupeRP = 1961030;
  if (preferences.Config.Skin.CoupeRP == 20)
    new_Skin.CoupeRP = 1961031;
  if (preferences.Config.Skin.CoupeRP == 21)
    new_Skin.CoupeRP = 1961032;
  if (preferences.Config.Skin.CoupeRP == 22)
    new_Skin.CoupeRP = 1961033;
  if (preferences.Config.Skin.CoupeRP == 23)
    new_Skin.CoupeRP = 1961035;
  if (preferences.Config.Skin.CoupeRP == 24)
    new_Skin.CoupeRP = 1961036;
  if (preferences.Config.Skin.CoupeRP == 22)
    new_Skin.CoupeRP = 1961037;
  if (preferences.Config.Skin.CoupeRP == 26)
    new_Skin.CoupeRP = 1961038;
  if (preferences.Config.Skin.CoupeRP == 27)
    new_Skin.CoupeRP = 1961039;
  if (preferences.Config.Skin.CoupeRP == 28)
    new_Skin.CoupeRP = 1961040;
  if (preferences.Config.Skin.CoupeRP == 29)
    new_Skin.CoupeRP = 1961041;
  if (preferences.Config.Skin.CoupeRP == 30)
    new_Skin.CoupeRP = 1961042;
  if (preferences.Config.Skin.CoupeRP == 31)
    new_Skin.CoupeRP = 1961043;
  if (preferences.Config.Skin.CoupeRP == 32)
    new_Skin.CoupeRP = 1961044;
  if (preferences.Config.Skin.CoupeRP == 33)
    new_Skin.CoupeRP = 1961045;
  if (preferences.Config.Skin.CoupeRP == 34)
    new_Skin.CoupeRP = 1961046;
  if (preferences.Config.Skin.CoupeRP == 35)
    new_Skin.CoupeRP = 1961050;
  if (preferences.Config.Skin.CoupeRP == 36)
    new_Skin.CoupeRP = 1961051;
  if (preferences.Config.Skin.CoupeRP == 37)
    new_Skin.CoupeRP = 1961052;
  if (preferences.Config.Skin.CoupeRP == 38)
    new_Skin.CoupeRP = 1961053;
  if (preferences.Config.Skin.CoupeRP == 39)
    new_Skin.CoupeRP = 1961054;
  if (preferences.Config.Skin.CoupeRP == 40)
    new_Skin.CoupeRP = 1961055;
  if (preferences.Config.Skin.CoupeRP == 41)
    new_Skin.CoupeRP = 1961056;
  if (preferences.Config.Skin.CoupeRP == 42)
    new_Skin.CoupeRP = 1961057;

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  if (preferences.Config.Skin.UAZ == 0)
    new_Skin.UAZ = 1908001;
  if (preferences.Config.Skin.UAZ == 1)
    new_Skin.UAZ = 1908067;
  if (preferences.Config.Skin.UAZ == 2)
    new_Skin.UAZ = 1908061;
  if (preferences.Config.Skin.UAZ == 3)
    new_Skin.UAZ = 1908032;
  if (preferences.Config.Skin.UAZ == 4)
    new_Skin.UAZ = 1908068;
  if (preferences.Config.Skin.UAZ == 5)
    new_Skin.UAZ = 1908066;
  if (preferences.Config.Skin.UAZ == 6)
    new_Skin.UAZ = 1908075;
  if (preferences.Config.Skin.UAZ == 7)
    new_Skin.UAZ = 1908076;
  if (preferences.Config.Skin.UAZ == 8)
    new_Skin.UAZ = 1908077;
  if (preferences.Config.Skin.UAZ == 9)
    new_Skin.UAZ = 1908078;
  if (preferences.Config.Skin.UAZ == 10)
    new_Skin.UAZ = 1908084;
  if (preferences.Config.Skin.UAZ == 11)
    new_Skin.UAZ = 1908085;
  if (preferences.Config.Skin.UAZ == 12)
    new_Skin.UAZ = 1908086;
  if (preferences.Config.Skin.UAZ == 13)
    new_Skin.UAZ = 1908088;
  if (preferences.Config.Skin.UAZ == 14)
    new_Skin.UAZ = 1908089;
  if (preferences.Config.Skin.UAZ == 15)
    new_Skin.UAZ = 1908188;
  if (preferences.Config.Skin.UAZ == 16)
    new_Skin.UAZ = 1908189;
  if (preferences.Config.Skin.UAZ == 17)
    new_Skin.UAZ = 1957001;
 
 if (preferences.Config.Skin.Boat == 0)
    new_Skin.Boat = 1911001;
  if (preferences.Config.Skin.Boat == 1)
    new_Skin.Boat = 1911013;
  if (preferences.Config.Skin.Boat == 2)
    new_Skin.Boat = 1911003;
if (preferences.Config.Skin.Boat == 3)
    new_Skin.Boat = 1911004;
if (preferences.Config.Skin.Boat == 4)
    new_Skin.Boat = 1911005;
if (preferences.Config.Skin.Boat == 5)
    new_Skin.Boat = 1911006;
if (preferences.Config.Skin.Boat == 6)
    new_Skin.Boat = 1911007;
if (preferences.Config.Skin.Boat == 7)
    new_Skin.Boat = 1911008;
if (preferences.Config.Skin.Boat == 8)
    new_Skin.Boat = 1911009;
if (preferences.Config.Skin.Boat == 9)
    new_Skin.Boat = 1911010;
if (preferences.Config.Skin.Boat == 10)
    new_Skin.Boat = 1911011;
if (preferences.Config.Skin.Boat == 11)
    new_Skin.Boat = 1911012;

}



int m4v[] = { 101004, 1010042, 1101004046, 1101004062, 1101004078, 1101004086, 1101004098, 1101004138, 1101004163,1101004201,1101004209,1101004218,1101004226
};
int m4168[] = { 1010042, 1101004046, 1101004062, 1101004078, 1101004086, 1101004098, 1101004138, 1101004163,1101004201,1101004209,1101004218,1101004226
};
int m4169[] = { 1010043, 1101004046, 1101004062, 1101004078, 1101004086, 1101004098, 1101004138, 1101004163,1101004201,1101004209,1101004218,1101004226
};
int m4161[] = { 1010044, 1101004046, 1101004062, 1101004078, 1101004086, 1101004098, 1101004138, 1101004163,1101004201,1101004209,1101004218,1101004226
};
int m4162[] = { 1010045, 1101004046, 1101004062, 1101004078, 1101004086, 1101004098, 1101004138, 1101004163,1101004201,1101004209,1101004218,1101004226
};
int m4163[] = { 1010046, 1101004046, 1101004062, 1101004078, 1101004086, 1101004098, 1101004138, 1101004163,1101004201,1101004209,1101004218,1101004226
};
int m4164[] = { 1010047, 1101004046, 1101004062, 1101004078, 1101004086, 1101004098, 1101004138, 1101004163,1101004201,1101004209,1101004218,1101004226
};
int scar[] = { 101003,1101003195, 1101003057, 1101003070, 1101003080, 1101003119, 1101003146, 1101003167, 1101003181};
int scar1[] = { 1010032,1101003195, 1101003057, 1101003070, 1101003080, 1101003119, 1101003146, 1101003167, 1101003181};
int scar2[] = { 1010033,1101003195, 1101003057, 1101003070, 1101003080, 1101003119, 1101003146, 1101003167, 1101003181};
int scar3[] = { 1010034,1101003195, 1101003057, 1101003070, 1101003080, 1101003119, 1101003146, 1101003167, 1101003181};
int scar4[] = { 1010035,1101003195, 1101003057, 1101003070, 1101003080, 1101003119, 1101003146, 1101003167, 1101003181};
int scar5[] = { 1010036,1101003195, 1101003057, 1101003070, 1101003080, 1101003119, 1101003146, 1101003167, 1101003181};
int scar6[] = { 1010037,1101003195, 1101003057, 1101003070, 1101003080, 1101003119, 1101003146, 1101003167, 1101003181};
int akmv[] = { 101001,1101001089, 1101001103, 1101001116, 1101001128, 1101001143, 1101001154, 1101001174,1101001213,1101001231,1101001242
};
int akm1[] = { 1010012,1101001089, 1101001103, 1101001116, 1101001128, 1101001143, 1101001154, 1101001174,1101001213,1101001231,1101001242
};
int akm2[] = { 1010013,1101001089, 1101001103, 1101001116, 1101001128, 1101001143, 1101001154, 1101001174,1101001213,1101001231,1101001242
};
int akm3[] = { 1010014,1101001089, 1101001103, 1101001116, 1101001128, 1101001143, 1101001154, 1101001174,1101001213,1101001231,1101001242
};
int akm4[] = { 1010015,1101001089, 1101001103, 1101001116, 1101001128, 1101001143, 1101001154, 1101001174,1101001213,1101001231,1101001242
};
int akm5[] = { 1010016,1101001089, 1101001103, 1101001116, 1101001128, 1101001143, 1101001154, 1101001174,1101001213,1101001231,1101001242
};
int akm6[] = { 1010017,1101001089, 1101001103, 1101001116, 1101001128, 1101001143, 1101001154, 1101001174,1101001213,1101001231,1101001242
};
int m7[] = { 101008, 1101008026, 1101008051, 1101008061, 1101008081, 1101008104, 1101008116, 1101008126};
int m71[] = { 1010082, 1101008026, 1101008051, 1101008061, 1101008081, 1101008104, 1101008116, 1101008126};
int m72[] = { 1010083, 1101008026, 1101008051, 1101008061, 1101008081, 1101008104, 1101008116, 1101008126};
int m73[] = { 1010084, 1101008026, 1101008051, 1101008061, 1101008081, 1101008104, 1101008116, 1101008126};
int m74[] = { 1010085, 1101008026, 1101008051, 1101008061, 1101008081, 1101008104, 1101008116, 1101008126};
int m75[] = { 1010086, 1101008026, 1101008051, 1101008061, 1101008081, 1101008104, 1101008116, 1101008126};
int m76[] = { 1010087, 1101008026, 1101008051, 1101008061, 1101008081, 1101008104, 1101008116, 1101008126};
int awm[] = { 103003, 1103003022, 1103003030, 1103003042, 1103003051, 1103003062};
int awm1[] = { 1030032, 1103003022, 1103003030, 1103003042, 1103003051, 1103003062};
int awm2[] = { 1030033, 1103003022, 1103003030, 1103003042, 1103003051, 1103003062};
int awm3[] = { 1030034, 1103003022, 1103003030, 1103003042, 1103003051, 1103003062};
int awm4[] = { 1030035, 1103003022, 1103003030, 1103003042, 1103003051, 1103003062};
int awm5[] = { 1030036, 1103003022, 1103003030, 1103003042, 1103003051, 1103003062};
int awm6[] = { 1030037, 1103003022, 1103003030, 1103003042, 1103003051, 1103003062};
int kar[] = { 103001, 1103001060, 1103001079, 1103001101, 1103001145, 1103001160, 1103001179};
int kar1[] = { 1030012, 1103001060, 1103001079, 1103001101, 1103001145, 1103001160, 1103001179};
int kar2[] = { 1030013, 1103001060, 1103001079, 1103001101, 1103001145, 1103001160, 1103001179};
int kar3[] = { 1030014, 1103001060, 1103001079, 1103001101, 1103001145, 1103001160, 1103001179};
int kar4[] = { 1030015, 1103001060, 1103001079, 1103001101, 1103001145, 1103001160, 1103001179};
int kar5[] = { 1030016, 1103001060, 1103001079, 1103001101, 1103001145, 1103001160, 1103001179};
int kar6[] = { 1030017, 1103001060, 1103001079, 1103001101, 1103001145, 1103001160, 1103001179};
int m24[] = { 103002, 1103002018, 1103002030, 1103002048, 1103002056, 1103002087};
int m241[] = { 1030022, 1103002018, 1103002030, 1103002048, 1103002056, 1103002087};
int m242[] = { 1030023, 1103002018, 1103002030, 1103002048, 1103002056, 1103002087};
int m243[] = { 1030024, 1103002018, 1103002030, 1103002048, 1103002056, 1103002087};
int m244[] = { 1030025, 1103002018, 1103002030, 1103002048, 1103002056, 1103002087};
int m245[] = { 1030026, 1103002018, 1103002030, 1103002048, 1103002056, 1103002087};
int m246[] = { 1030027, 1103002018, 1103002030, 1103002048, 1103002056, 1103002087};
int dp[] = { 105002, 1105002018, 1105002035, 1105002058, 1105002063};
int dp1[] = { 1050022, 1105002018, 1105002035, 1105002058, 1105002063};
int dp2[] = { 1050023, 1105002018, 1105002035, 1105002058, 1105002063};
int dp3[] = { 1050024, 1105002018, 1105002035, 1105002058, 1105002063};
int dp4[] = { 1050025, 1105002018, 1105002035, 1105002058, 1105002063};
int dp5[] = { 1050026, 1105002018, 1105002035, 1105002058, 1105002063};
int dp6[] = { 1050027, 1105002018, 1105002035, 1105002058, 1105002063};
int m249[] = { 105001, 1105001020, 1105001034, 1105001048, 1105001054};
int m2491[] = { 1050012, 1105001020, 1105001034, 1105001048, 1105001054};
int m2492[] = { 1050013, 1105001020, 1105001034, 1105001048, 1105001054};
int m2493[] = { 1050014, 1105001020, 1105001034, 1105001048, 1105001054};
int m2494[] = { 1050015, 1105001020, 1105001034, 1105001048, 1105001054};
int m2495[] = { 1050016, 1105001020, 1105001034, 1105001048, 1105001054};
int m2496[] = { 1050017, 1105001020, 1105001034, 1105001048, 1105001054};
int groza[] = { 101005, 1101005019, 1101005025, 1101005038, 1101005043, 1101005052, 1101005082};
int groza1[] = { 1010052, 1101005019, 1101005025, 1101005038, 1101005043, 1101005052, 1101005082};
int groza2[] = { 1010053, 1101005019, 1101005025, 1101005038, 1101005043, 1101005052, 1101005082};
int groza3[] = { 1010054, 1101005019, 1101005025, 1101005038, 1101005043, 1101005052, 1101005082};
int groza4[] = { 1010055, 1101005019, 1101005025, 1101005038, 1101005043, 1101005052, 1101005082};
int groza5[] = { 1010056, 1101005019, 1101005025, 1101005038, 1101005043, 1101005052, 1101005082};
int groza6[] = { 1010057, 1101005019, 1101005025, 1101005038, 1101005043, 1101005052, 1101005082};
int aug[] = { 101006, 1101006033, 1101006044, 1101006062};
int aug1[] = { 1010062, 1101006033, 1101006044, 1101006062};
int aug2[] = { 1010063, 1101006033, 1101006044, 1101006062};
int aug3[] = { 1010064, 1101006033, 1101006044, 1101006062};
int aug4[] = { 1010065, 1101006033, 1101006044, 1101006062};
int aug5[] = { 1010066, 1101006033, 1101006044, 1101006062};
int aug6[] = { 1010067, 1101006033, 1101006044, 1101006062};
int m16[] = { 101002, 1101002029, 1101002056, 1101002068, 1101002081, 1101002103};
int m161[] = { 1010022, 1101002029, 1101002056, 1101002068, 1101002081, 1101002103};
int m162[] = { 1010023, 1101002029, 1101002056, 1101002068, 1101002081, 1101002103};
int m163[] = { 1010024, 1101002029, 1101002056, 1101002068, 1101002081, 1101002103};
int m164[] = { 1010025, 1101002029, 1101002056, 1101002068, 1101002081, 1101002103};
int m165[] = { 1010026, 1101002029, 1101002056, 1101002068, 1101002081, 1101002103};
int m166[] = { 1010027, 1101002029, 1101002056, 1101002068, 1101002081, 1101002103};
int uzi[] = { 102001, 1102001024, 1102001036, 1102001058, 1102001069, 1102001089, 1102001102};
int uzi1[] = { 1020012, 1102001024, 1102001036, 1102001058, 1102001069, 1102001089, 1102001102};
int uzi2[] = { 1020013, 1102001024, 1102001036, 1102001058, 1102001069, 1102001089, 1102001102};
int uzi3[] = { 1020014, 1102001024, 1102001036, 1102001058, 1102001069, 1102001089, 1102001102};
int uzi4[] = { 1020015, 1102001024, 1102001036, 1102001058, 1102001069, 1102001089, 1102001102};
int uzi5[] = { 1020016, 1102001024, 1102001036, 1102001058, 1102001069, 1102001089, 1102001102};
int uzi6[] = { 1020017, 1102001024, 1102001036, 1102001058, 1102001069, 1102001089, 1102001102};
int ump[] = { 102002, 1102002043, 1102002061, 1102002090, 1102002117, 1102002124, 1102002129, 1102002136};
int ump1[] = { 1020022, 1102002043, 1102002061, 1102002090, 1102002117, 1102002124, 1102002129, 1102002136};
int ump2[] = { 1020023, 1102002043, 1102002061, 1102002090, 1102002117, 1102002124, 1102002129, 1102002136};
int ump3[] = { 1020024, 1102002043, 1102002061, 1102002090, 1102002117, 1102002124, 1102002129, 1102002136};
int ump4[] = { 1020025, 1102002043, 1102002061, 1102002090, 1102002117, 1102002124, 1102002129, 1102002136};
int ump5[] = { 1020026, 1102002043, 1102002061, 1102002090, 1102002117, 1102002124, 1102002129, 1102002136};
int ump6[] = { 1020027, 1102002043, 1102002061, 1102002090, 1102002117, 1102002124, 1102002129, 1102002136};
int vectorr[] = { 102003, 1102003020, 1102003031, 1102003065, 1102003080};
int tommy[] = { 102004, 1102004018, 1102004034};
int bizon[] = { 102005, 1102005007, 1102005020, 1102005041};
int ace32[] = { 101102, 1101102007, 1101102017};
int ace321[] = { 1011022, 1101102007, 1101102017};
int ace322[] = { 1011023, 1101102007, 1101102017};
int ace323[] = { 1011024, 1101102007, 1101102017};
int ace324[] = { 1011025, 1101102007, 1101102017};
int ace325[] = { 1011026, 1101102007, 1101102017};
int ace326[] = { 1011027, 1101102007, 1101102017};
int mk145[] = { 1030075,  1103007028};
int mk146[] = { 1030074,  1103007028};
int mk147[] = { 1030072,  1103007028};
int mk148[] = { 1030073,  1103007028};
int mk149[] = { 1030076,  1103007028};
int mk140[] = { 1030077,  1103007028};
int mk14[] = { 103007,  1103007028};
int longyin1111[] = { 203001,  1030070218};
int longyin2222[] = { 203003,  1030070216};
int longyin3333[] = { 203014,  1030070215};
int longyin4444[] = { 203004,  1030070214};
int longyin6666[] = { 203015,  1030070213};
int longyin8888[] = { 203005,  1030070212};
int tuosb[] = { 205003,  1030070236};
int tuosb1[] = { 2050032,  1030070236};
int tuosb2[] = { 2050033,  1030070236};
int tuosb3[] = { 2050034,  1030070236};
int tuosb4[] = { 2050035,  1030070236};
int mg311[] = { 1050105,  1105010008,  1105010019};
int mg322[] = { 1050106,  1105010008,  1105010019};
int mg333[] = { 1050107,  1105010008,  1105010019};
int mg344[] = { 1050102,  1105010008,  1105010019};
int mg355[] = { 1050103,  1105010008,  1105010019};
int mg366[] = { 1050104,  1105010008,  1105010019};
int p90[] = { 102105,  1102105012};
int p901[] = { 1021052,  1102105012};
int p902[] = { 1021053,  1102105012};
int p903[] = { 1021054,  1102105012};
int p904[] = { 1021055,  1102105012};
int p905[] = { 1021056,  1102105012};
int p906[] = { 1021057,  1102105012};
int pan[] = { 108004, 1108004125, 1108004145, 1108004160, 1108004283, 1108004337, 1108004356, 1108004365, 1108004054, 1108004008};

int m249s[] = { 205009, 1050010351, 1050010412, 1050010482, 1050010542};
int mg3[] = { 105010,  1105010008,  1105010019};
int akmmag[] = { 291001,204013,204011,204012,1010010891, 1010011031, 1010011161, 1010011281, 1010011431, 1010011541, 1010011741,1010012131,1010012311,1010012421
};
int m7mag[] = { 291008,204013,204011,204012,1010080261, 1010080511, 1010080611, 1010080811, 1010081041, 1010081161, 1010081261};
int scarmag[] = { 291003,204013,204011,204012,1010031897,1010030571, 1010030701, 1010030801, 1010031191, 1010031461, 1010031671, 1010031811};
int m4mag[] = { 291004,204013,204011,204012,1010040461,1010040611,1010040781,1010040861,1010040981,1010041381,1010041631,1010042011,1010042073,1010042153  };

int m4sight[] = { 203008,1010040462,1010040612,1010040782,1010040862,1010040982,1010041382,1010041632,1010042012,1010042083,1010042163  };

int m4stock[] = { 205005,1010040463,1010040613,1010040783,1010040863,1010040983,1010041383,1010041633,1010042013,1010042093,1010042173  };

int m4stock1[] = { 205002,1010040480,205002,205002,205002,205002,1010041146,1010041579,1010041966,1010042137,1010042173  };

int m4stock2[] = { 2050022,1010040480,205002,205002,205002,205002,1010041146,1010041579,1010041966,1010042137,1010042173  };

int m4stock3[] = { 2050023,1010040480,205002,205002,205002,205002,1010041146,1010041579,1010041966,1010042137,1010042173  };

int m4stock4[] = { 2050024,1010040480,205002,205002,205002,205002,1010041146,1010041579,1010041966,1010042137,1010042173  };

int m4stock5[] = { 2050025,1010040480,205002,205002,205002,205002,1010041146,1010041579,1010041966,1010042137,1010042173  };

int m4reddot[] = { 203001,1010040470,203001,203001,203001,203001,1010041128,1010041566,1010041948,1010042029,1010042119  };

int m46666[] = { 203015,1010040481,203015,203015,203015,203015,203015,203015,1010041967,1010042024,1010042114  };

int m43444[] = { 203004,1010040466,203004,203004,203004,203004,1010041124,1010041554,1010041944,1010042025,1010042116  };

int m43333[] = { 203014,1010040467,203014,203014,203014,203014,1010041125,1010041560,1010041945,1010042026,1010042116  };

int m42222[] = { 203003,1010040468,203003,203003,203003,203003,1010041126,1010041564,1010041946,1010042027,1010042117  };

int m16s[] = { 205007, 1010020292, 1010020562, 1010020682, 1010020812, 1010021032};
int m16mag[] = { 291002,204013,204011,204012, 1010020291, 1010020561, 1010020681, 1010020811, 1010021031};


int emote1[] = { 2200101,12220023,12219677,12219716,12209401,12220028,12209701,12209801,12209901 };
int emote2[] = { 2200201,12210201,12210601,12220028,12219819,12211801,12212001,12212201,12212401 };
int emote3[] = { 2200301,12212601,12213201,12219715,12219814,12213601,12213801,12214001,12214201 };

int SuitX[] = { 403003,1405628,1405870,1405983,1406152,1406311,1406475,1406638,1406872 };

int Bag[] = { 501006,501005,501004,501003,501002,501001,1501003550,1501003277,1501003321,1501003443,1501003265,1501003051,1501003220,1501003174 };

int Helmet[] = { 502001,502002,502003,1502003014,1502003028,1502003023,1501002443,1502003031,1502003033,1502003069,1502003261 };

static int prevXSuits = preferences.Config.Skin.XSuits;

static bool callFunction = false;
#pragma mark - MTKViewDelegate
namespace Variables {
    int ActiveTab = 1;
}
bool callNotify = false;

- (void)drawInMTKView:(MTKView*)view
{

    ImGuiIO& io = ImGui::GetIO();
    io.DisplaySize.x = view.bounds.size.width;
    io.DisplaySize.y = view.bounds.size.height;
    
    
    
#if TARGET_OS_OSX
    CGFloat framebufferScale = view.window.screen.backingScaleFactor ?: NSScreen.mainScreen.backingScaleFactor;
#else
    CGFloat framebufferScale = view.window.screen.nativeScale;
#endif
    io.DisplayFramebufferScale = ImVec2(framebufferScale, framebufferScale);
    io.DeltaTime = 1 / float(view.preferredFramesPerSecond ?: 60);
    
    
    id<MTLCommandBuffer> commandBuffer = [self.commandQueue commandBuffer];
    
    
    
    
    
    
    
    if (MenDeal == true) {
        [self.view setUserInteractionEnabled:YES];
    } else if (MenDeal == false) {
        [self.view setUserInteractionEnabled:NO];
    }
    
    MTLRenderPassDescriptor* renderPassDescriptor = view.currentRenderPassDescriptor;
    if (renderPassDescriptor != nil)
    {
        id <MTLRenderCommandEncoder> renderEncoder = [commandBuffer renderCommandEncoderWithDescriptor:renderPassDescriptor];
        [renderEncoder pushDebugGroup:@""];
        
        ImGui_ImplMetal_NewFrame(renderPassDescriptor);
        ImGui::NewFrame();
        
      
        
        CGFloat x = (([UIApplication sharedApplication].windows[0].rootViewController.view.frame.size.width) - 360) / 2;
        CGFloat y = (([UIApplication sharedApplication].windows[0].rootViewController.view.frame.size.height) - 360) /2;
        static ImVec4 active = to_vec4(158, 158, 158, 255);
        static ImVec4 inactive = to_vec4(66, 66, 66, 255);


if (elapsedd < 1000 && !callNotify) {
 //ImGui::InsertNotification({ ImGuiToastType_Success, 3000, "Welcome User !", "" });
   
 //callNotify = true;
 }
        ImGui::SetNextWindowPos(ImVec2(x, y), ImGuiCond_FirstUseEver);
       
        
ImGui::SetNextWindowSize(ImVec2(480, 300), ImGuiCond_FirstUseEver);

            if (MenDeal == true)
            {
                            
ImGui::Begin((ICON_FA_HOME"  iOS PUBG M416 ESP - JB ｜2025") /*nameshow3*/, &MenDeal, ImGuiWindowFlags_NoCollapse);


            //ImGui::SetCursorPos({35, 25});
            //ImGui::SetWindowFontScale(1.0f); // 将字体缩放设置为1.5倍


ImGui::SetWindowFontScale(1.0f);
              
static int tab = 1;

//ImGui::SetCursorPos({15, 100});



            if (ImGui::Button("人物绘制", ImVec2(90, 20))) tab = 1;
         //ImGui::SameLine();
ImGui::TableNextColumn();

            if (ImGui::Button("物品绘制", ImVec2(90, 20))) tab = 0;
         //ImGui::SameLine();
ImGui::TableNextColumn();

           if (ImGui::Button("其他绘制", ImVec2(90, 20))) tab = 3;
         //ImGui::SameLine();
ImGui::TableNextColumn();

ImGui::TextColored(ImVec4(0.0f, 1.0f, 0.0f, 1.0f), "---追锁---");

ImGui::TableNextColumn();

            if (ImGui::Button("函数追锁", ImVec2(90, 20))) tab = 2;
         //ImGui::SameLine();
ImGui::TableNextColumn();
 
            if (ImGui::Button("追锁设定", ImVec2(90, 20))) tab = 4;
         //ImGui::SameLine();
ImGui::TableNextColumn();
            if (ImGui::Button("追锁参数", ImVec2(90, 20))) tab = 5;
         //ImGui::SameLine();
ImGui::TableNextColumn();
                    ImGui::TextColored(ImVec4(0.0f, 1.0f, 0.0f, 1.0f), "---函数---");

ImGui::TableNextColumn();
                   
            if (ImGui::Button("引擎美化", ImVec2(90, 20))) tab = 6;

ImGui::TableNextColumn();
                   
            if (ImGui::Button("函数功能", ImVec2(90, 20))) tab = 7;

ImGui::TableNextColumn();
                   
            if (ImGui::Button("音乐菜单", ImVec2(90, 20))) tab = 8;



if (tab == 0) {
ImGui::SetCursorPos({110, 25});

ImGui::BeginChild("ScrollingRegion", ImVec2(360, 260), true, ImGuiWindowFlags_HorizontalScrollbar);

{

    if(ImGui::Checkbox("手持武器", &Weapon)){
        [[NSUserDefaults standardUserDefaults] setBool:Weapon forKey:@"Weapon"];        
    }
      ImGui::SameLine();
    if(ImGui::Checkbox("盒子绘制", &箱子)){
        [[NSUserDefaults standardUserDefaults] setBool:箱子 forKey:@"箱子"];        
    }
    ImGui::Checkbox(("载具绘制"), &Config.ESPMenu.车辆显示);
      ImGui::SameLine();
    if(ImGui::Checkbox("手雷预警", &手雷预警)){
        [[NSUserDefaults standardUserDefaults] setBool:手雷预警 forKey:@"手雷预警"];        
    }


                        
                        //到期时间
                        //ImGui::Text("到期时间: %s", [UserInfoManager shareUserInfoManager].time.UTF8String);
                        
                        

}
ImGui::EndChild();
             }

        if (tab == 1) {

ImGui::SetCursorPos({110, 25});

ImGui::BeginChild("ScrollingRegion", ImVec2(360, 260), true, ImGuiWindowFlags_HorizontalScrollbar);

{


ImGui::TableNextColumn();

    if(ImGui::Checkbox("显示方框", &Box)){
        [[NSUserDefaults standardUserDefaults] setBool:Box forKey:@"Box"];        
    }
      ImGui::SameLine();
    if(ImGui::Checkbox("显示射线", &Line)){
        [[NSUserDefaults standardUserDefaults] setBool:Line forKey:@"Line"];        
    }
      ImGui::SameLine();
    if(ImGui::Checkbox("显示骨骼", &Skeleton)){
        [[NSUserDefaults standardUserDefaults] setBool:Skeleton forKey:@"Skeleton"];        
    }
    if(ImGui::Checkbox("显示昵称", &Name)){
        [[NSUserDefaults standardUserDefaults] setBool:Name forKey:@"Name"];        
    }
      ImGui::SameLine();
    if(ImGui::Checkbox("显示距离", &Distance)){
        [[NSUserDefaults standardUserDefaults] setBool:Distance forKey:@"Distance"];        
    }
      ImGui::SameLine();
    if(ImGui::Checkbox("显示血量", &Health)){
        [[NSUserDefaults standardUserDefaults] setBool:Health forKey:@"Health"];        
    }
    if(ImGui::Checkbox("绘制雷达", &雷达预警1)){
        [[NSUserDefaults standardUserDefaults] setBool:雷达预警1 forKey:@"雷达预警1"];        
    }

      ImGui::SameLine();
    if(ImGui::Checkbox("辅助准心", &辅助准心)){                                   
           }

ImGui::TableNextColumn();
    if(ImGui::Checkbox("背后预警", &Alert)){
        [[NSUserDefaults standardUserDefaults] setBool:Alert forKey:@"Alert"];        
    }
      ImGui::SameLine();
      
if (ImGui::Checkbox(("人数显示"),                            &人数显示)) {                            
                        }


      ImGui::SameLine();

    if(ImGui::Checkbox("忽略人机", &忽略人机)){
        [[NSUserDefaults standardUserDefaults] setBool:忽略人机 forKey:@"忽略人机"];        
    }


 //ImGui::SetCursorPos({30, 60});
//ImGui::TableNextColumn();



}
ImGui::EndChild();
                        
                                         }



               if (tab == 2) {
ImGui::SetCursorPos({110, 25});

ImGui::BeginChild("ScrollingRegion", ImVec2(360, 260), true, ImGuiWindowFlags_HorizontalScrollbar);

{


   //ImGui::Spacing();
//ImGui::SetCursorPos({10, 30});


    if(ImGui::Checkbox("函数自瞄", &AimBot)){
        [[NSUserDefaults standardUserDefaults] setBool:AimBot forKey:@"AimBot"];        
    }

    if(ImGui::Checkbox("函数追踪", &Enable)){
        [[NSUserDefaults standardUserDefaults] setBool:Enable forKey:@"Enable"];        
    }

      ImGui::SameLine();

    if(ImGui::Checkbox("HOOK弹道", &坐标追)){
        [[NSUserDefaults standardUserDefaults] setBool:坐标追 forKey:@"坐标追"];        
    }

        ImGui::SameLine();

    if(ImGui::Checkbox("自描圈", &自描圈)){
        [[NSUserDefaults standardUserDefaults] setBool:自描圈 forKey:@"自描圈"];        
    }
    if(ImGui::Checkbox("动态圈", &动态圈)){
        [[NSUserDefaults standardUserDefaults] setBool:动态圈 forKey:@"动态圈"];        
    }
        ImGui::SameLine();
    if(ImGui::Checkbox("瞄准线", &瞄准线)){
        [[NSUserDefaults standardUserDefaults] setBool:瞄准线 forKey:@"瞄准线"];        
    }
                        

    //ImGui::PopStyleVar();

}
}

        if (tab == 3) {

ImGui::SetCursorPos({110, 25});

ImGui::BeginChild("ScrollingRegion", ImVec2(360, 260), true, ImGuiWindowFlags_HorizontalScrollbar);

{

    if(ImGui::Checkbox("熊猫血条", &血条1)){
        [[NSUserDefaults standardUserDefaults] setBool:血条1 forKey:@"血条1"];        
    }
      ImGui::SameLine();
    if(ImGui::Checkbox("鲨鱼血条", &血条2)){
        [[NSUserDefaults standardUserDefaults] setBool:血条2 forKey:@"血条2"];        
    }

      ImGui::SameLine();

if (ImGui::Checkbox(("主播漏手"),                            &小黑点)) {                            
                        }

    if(ImGui::Checkbox("全局信息", &thongtin)){
        [[NSUserDefaults standardUserDefaults] setBool:thongtin forKey:@"thongtin"];        
    }
      ImGui::SameLine();
if (ImGui::Checkbox(("MAD血"),                            &MAD血条)) {                            
                        }

    if(ImGui::SliderFloat("雷达X", &RadarX, 0.0f, 1000,"%.0f%")){
        [[NSUserDefaults standardUserDefaults] setFloat:RadarX forKey:@"RadarX"];
        
    }
    if(ImGui::SliderFloat("雷达Y", &RadarY, 0.0f, 1000,"%.0f%")){
        [[NSUserDefaults standardUserDefaults] setFloat:RadarY forKey:@"RadarY"];
        
    }
    if(ImGui::SliderFloat("雷达大小", &RadarSize, 0.0f, 1000,"%.0f%")){
        [[NSUserDefaults standardUserDefaults] setFloat:RadarSize forKey:@"RadarSize"];
        
    }
    if(ImGui::SliderFloat("背敌间距", &BackSize, 1.0f, 200,"%.0f%")){
        [[NSUserDefaults standardUserDefaults] setFloat:BackSize forKey:@"BackSize"];
        
    }
    ImGui::SliderFloat("车辆显示距离", &物资距离, 1.0f, 300.0f);



}
ImGui::EndChild();
                        
                                         }

        if (tab == 4) {

ImGui::SetCursorPos({110, 25});

ImGui::BeginChild("ScrollingRegion", ImVec2(360, 260), true, ImGuiWindowFlags_HorizontalScrollbar);

{

    if(ImGui::Checkbox("倒地不打", &IgnoreKnocked)){
        [[NSUserDefaults standardUserDefaults] setBool:IgnoreKnocked forKey:@"IgnoreKnocked"];        
    }
ImGui::SameLine();
    if(ImGui::Checkbox("不打人机", &IgnoreBot)){
        [[NSUserDefaults standardUserDefaults] setBool:IgnoreBot forKey:@"IgnoreBot"];        
    }
                        ImGui::SameLine();
    if(ImGui::Checkbox("掩体判断", &VisCheck)){
        [[NSUserDefaults standardUserDefaults] setBool:VisCheck forKey:@"VisCheck"];        
    }

                        ImGui::Text(("瞄准模式 :"));
                        ImGui::SameLine();
                        static const char *triggers[] = {("强锁"),
                                                         ("开枪瞄准"),
                                                         ("开镜瞄准"),
                                                         (
                                                                 "开枪瞄准 & 开镜瞄准"),
                                                         (
                                                                 "Any (Shooting / Scoping)")};
                        if (ImGui::Combo(("##Trigger"),
                                         (int *) &preferences.Config.SilentAim.Trigger, triggers, 5,
                                         -1)) {
                            
                        }

                                               
                        ImGui::Text(("射击部位 : "));
                        ImGui::SameLine();
                        static const char *targets[] = {("头部"),
                                                        ("身体")};
                        if (ImGui::Combo(("##Target"),
                                         (int *) &preferences.Config.SilentAim.Target, targets, 2,
                                         -1)) {
                            
                        }




}
ImGui::EndChild();
                        
                                         }

        if (tab == 5) {

ImGui::SetCursorPos({110, 25});

ImGui::BeginChild("ScrollingRegion", ImVec2(360, 260), true, ImGuiWindowFlags_HorizontalScrollbar);

{

                        ImGui::Text(("圆圈大小 : "));
                        ImGui::SameLine();
                        
                        ImGui::SliderInt("##foov", &preferences.Config.SilentAim.Cross, 1.0f, 370.0f);

                        ImGui::Text(("自描速度 : "));
                        ImGui::SameLine();

    if(ImGui::SliderFloat(" ", &Aimsmooth, 1.0f, 10.0f)){
        [[NSUserDefaults standardUserDefaults] setFloat:Aimsmooth forKey:@"Aimsmooth"];
        
    }

                        ImGui::Text(("追踪概率 : "));
                        ImGui::SameLine();

                        ImGui::SliderFloat("##ijskslsk", &追踪状态, 0.0f, 100.0f);   

                        ImGui::Text(("压枪力度 : "));
                        ImGui::SameLine();

    if(ImGui::SliderFloat("##ksksmsmskksk", &AimRecc, 0.0f, 10.0f)){
        [[NSUserDefaults standardUserDefaults] setFloat:AimRecc forKey:@"AimRecc"];
        
    }

                        ImGui::Text(("瞄准距离 : "));
                        ImGui::SameLine();
                        
                        ImGui::SliderFloat("##distance", &g_disstance, 1.0f, 300.f);


}
ImGui::EndChild();
                        
                                         }

        if (tab == 7) {

ImGui::SetCursorPos({110, 25});

ImGui::BeginChild("ScrollingRegion", ImVec2(360, 260), true, ImGuiWindowFlags_HorizontalScrollbar);

{

ImGui::TableNextColumn();


    if (ImGui::BeginMenu("可安全功能"))
    {


      
if (ImGui::Checkbox(("下雨"),                                            &下雨)) {                            
                        }
      ImGui::SameLine();
      
if (ImGui::Checkbox(("下雪"),                                            &下雪)) {                            
                        }
      ImGui::SameLine();
      
if (ImGui::Checkbox(("X特效"),                                            &X特效)) {                            
                        }

      ImGui::SameLine();
      
if (ImGui::Checkbox(("枪械变大"),                                            &枪械变大)) {                            
                        }

if (ImGui::Button("胜利")) {      
    g_LocalPlayer->STPlayerController->RPC_GiveUpGame();//        


                        }

      ImGui::SameLine();

if (ImGui::Checkbox(("子弹信息"),                                            &子弹信息)) {                            
                        }

        ImGui::Checkbox("广角", &WideView);
                        if (WideView){
                         ImGui::SliderInt("视角大小", &WideValue, 1.1, 140.0);
     }


        ImGui::Checkbox("可控聚点", &聚点);
                        if (聚点){
                         ImGui::SliderInt("调节", &judianvalue, -2.4, 4.2);
     }


ImGui::EndTabItem();
                }

    if (ImGui::BeginMenu("危险功能"))
    {

if (ImGui::Checkbox(("六道仙人"),                                            &快速射击)) {                            
                        }

      ImGui::SameLine();

if (ImGui::Checkbox(("加速"),                                            &加速)) {                            
                        }

      ImGui::SameLine();

if (ImGui::Checkbox(("路飞"),                                            &路飞)) {                            
                        }


      ImGui::SameLine();

if (ImGui::Checkbox(("快速跳伞"),                                            &快速跳伞)) {                            
                        }

     

if (ImGui::Checkbox(("暴力载具"),                                            &暴力载具)) {                            
                        }



      ImGui::SameLine();

        ImGui::Checkbox("人物速度", &msdmax);
                        if (msdmax){
                         ImGui::SliderInt("速度", &msdmaxValue, 0, 2820);
     }



      ImGui::SameLine();
if (ImGui::Checkbox(("微加速"),                                            &微加速)) {                            
                        }




ImGui::EndTabItem();
                }

    if (ImGui::BeginMenu("反禁令功能"))
    {


if (ImGui::Checkbox(("过移速异常"),                                            &过移速异常)) {                            
                        }

if (ImGui::Checkbox(("SDK过检测"),                                            &anti1)) {                            
                        }

if (ImGui::Checkbox(("SDK过检测2"),                                            &anti2)) {                            
                        }





ImGui::EndTabItem();
                }



}
ImGui::EndChild();
                        
                                         }

        if (tab == 8) {

ImGui::SetCursorPos({110, 25});

ImGui::BeginChild("ScrollingRegion", ImVec2(360, 260), true, ImGuiWindowFlags_HorizontalScrollbar);

{

ImGui::TableNextColumn();

if (ImGui::Button("跳楼机")) {
        MyMusicPlayer::playMusic("http://music.163.com/song/media/outer/url?id=2645500113.mp3");
    }
                ImGui::SameLine();
if (ImGui::Button("可不可以")) {
        MyMusicPlayer::playMusic("http://music.163.com/song/media/outer/url?id=553755659.mp3");
    }
                ImGui::SameLine();
if (ImGui::Button("赤伶")) {
        MyMusicPlayer::playMusic("http://music.163.com/song/media/outer/url?id=2151673939.mp3");
    }
                ImGui::SameLine();
if (ImGui::Button("红色高跟鞋")) {
        MyMusicPlayer::playMusic("http://music.163.com/song/media/outer/url?id=1959190717.mp3");
    }

if (ImGui::Button("别怕我伤心")) {
    MyMusicPlayer::playMusic("http://music.163.com/song/media/outer/url?id=28819837.mp3");
}

ImGui::SameLine();

if (ImGui::Button("红色高跟鞋DJ")) {
    MyMusicPlayer::playMusic("http://music.163.com/song/media/outer/url?id=2152970758.mp3");
}

ImGui::SameLine();
if (ImGui::Button("猜不透")) {
    MyMusicPlayer::playMusic("http://music.163.com/song/media/outer/url?id=2066713227.mp3");
}
if (ImGui::Button("停止音乐")) {
    MyMusicPlayer::playMusic("https://www.kozco.com/tech/32k.mp3");
}



}
ImGui::EndChild();
                        
                                         }


                 if (tab == 6) {
ImGui::SetCursorPos({110, 25});

ImGui::BeginChild("ScrollingRegion", ImVec2(360, 260), true, ImGuiWindowFlags_HorizontalScrollbar);

 {

ImGui::Spacing();

                        
         if (ImGui::BeginTable("##Type", 3, ImGuiTableFlags_BordersOuter | ImGuiTableFlags_BordersInner)) {
                    ImGui::TableSetupColumn("模型皮肤", 0, 50);
                    ImGui::TableSetupColumn("死亡盒子", 0, 50);
                    ImGui::TableSetupColumn("击杀播报", 0, 50);
                    ImGui::TableHeadersRow();
                    ImGui::TableNextRow();
                    
                    ImGui::TableNextColumn();
                    if (ImGui::Checkbox("###01", &ModSkinn)){
                                        //if (ModSkinn)
                                        //ImGui::InsertNotification({ ImGuiToastType_Success, 3000, "Mod Skin Activated !", "" });
                                        }
                    ImGui::TableNextColumn();
                    ImGui::Checkbox("###02", &DeadBox);
                    ImGui::TableNextColumn();
                    ImGui::Checkbox("####2", &KillMessage);
                    ImGui::EndTable();
                    }
                    const float buttonWidth = (ImGui::GetContentRegionAvail().x - ImGui::GetStyle().ItemSpacing.x * 2) / 3;
                        ImGui::BeginGroup();
                        ImGui::PushStyleVar(ImGuiStyleVar_FrameRounding, 5.0f);
                        ImGui::PushStyleColor(ImGuiCol_Button, Settings::Tab == 0 ? active : inactive);

ImGui::SetCursorPos({30, 80});
                        if (ImGui::Button("人物", ImVec2(75, 0)))
                        Settings::Tab = 0;
                        ImGui::SameLine();
                        ImGui::SetCursorPosX(ImGui::GetCursorPosX() + ImGui::GetStyle().ItemSpacing.x);
                        ImGui::PushStyleColor(ImGuiCol_Button, Settings::Tab == 1 ? active : inactive);
                        if(ImGui::Button("武器", ImVec2(75, 0)))
                        Settings::Tab = 1;
                        ImGui::SameLine();
                        ImGui::SetCursorPosX(ImGui::GetCursorPosX() + ImGui::GetStyle().ItemSpacing.x);
                        ImGui::PushStyleColor(ImGuiCol_Button, Settings::Tab == 2 ? active : inactive);
                        if(ImGui::Button("载具", ImVec2(75, 0)))
                            Settings::Tab = 2;
                        ImGui::PopStyleVar();
                        ImGui::PopStyleColor(3);
                        ImGui::EndGroup();
                    

ImGui::SetCursorPos({40, 110});

                    if (ModSkinn){
                    //Player
                        if (Settings::Tab == 0) {
                    if (ImGui::BeginTable("##ModSkin", 3, ImGuiTableFlags_BordersOuter | ImGuiTableFlags_BordersInner)) {
                    ImGui::TableSetupColumn("开启", 0, 20);
                    ImGui::TableSetupColumn("名字", 0, 30);
                    ImGui::TableSetupColumn("美化", 0, 60);
                    ImGui::TableHeadersRow();
                    ImGui::TableNextRow();
                    
                    ImGui::TableNextColumn();
                    ImGui::Checkbox("###0", &preferences.Outfit);
                    ImGui::TableNextColumn();
                    ImGui::Text("套装");
                    ImGui::TableNextColumn();
                    if (ImGui::InputInt("##Suit", &preferences.Config.Skin.XSuits)) {
                    if (prevXSuits != preferences.Config.Skin.XSuits) {
                    start = std::chrono::high_resolution_clock::now();
                    callFunction = true;
                    prevXSuits = preferences.Config.Skin.XSuits;
                    }
                }
                
                    ImGui::TableNextColumn();
                    
                    
                    ImGui::Checkbox("###1", &preferences.Face);
                    ImGui::TableNextColumn();
                    ImGui::Text("脸");
                    ImGui::TableNextColumn();
                    ImGui::InputInt("##face", &preferences.Config.Skin.XSuits);
                    ImGui::TableNextColumn();
                    
                    
                    ImGui::Checkbox("###2", &preferences.Bagg);
                    ImGui::TableNextColumn();
                    ImGui::Text("背包");
                    ImGui::TableNextColumn();
                    ImGui::InputInt("##bag", &preferences.bag);
                    ImGui::TableNextColumn();
                    
                    
                    ImGui::Checkbox("###3", &preferences.Helmett);
                    ImGui::TableNextColumn();
                    ImGui::Text("头盔");
                    ImGui::TableNextColumn();
                    ImGui::InputInt("##helmet", &preferences.helmet);
                    ImGui::TableNextColumn();
                    
                    
                    ImGui::Checkbox("###4", &preferences.Emote);
                    ImGui::TableNextColumn();
                    ImGui::Text("Emote");
                    ImGui::TableNextColumn();
                    ImGui::InputInt("##emote", &ModEmote1);
                    ImGui::TableNextColumn();
                    
                    
                    ImGui::Checkbox("###5", &preferences.Parachute);
                    ImGui::TableNextColumn();
                    ImGui::Text("降落伞");
                    ImGui::TableNextColumn();
                    ImGui::InputInt("##Parachute", &preferences.Config.Skin.Parachute);
                    //ImGui::TableNextColumn();
                    
                    ImGui::EndTable();
                    }
                }
                    if (Settings::Tab == 1) {
                    if (ImGui::BeginTable("##ModGun", 3, ImGuiTableFlags_BordersOuter | ImGuiTableFlags_BordersInner)) {
                    ImGui::TableSetupColumn("开启", 0, 20);
                    ImGui::TableSetupColumn("名字", 0, 30);
                    ImGui::TableSetupColumn("美化", 0, 60);
                    ImGui::TableHeadersRow();
                    ImGui::TableNextRow();
                    
                    ImGui::TableNextColumn();
                    ImGui::Checkbox("###0", &preferences.M416);
                    ImGui::TableNextColumn();
                    ImGui::Text("M416");
                    ImGui::TableNextColumn();
                    ImGui::InputInt("##m4", &preferences.Config.Skin.M416);
                    ImGui::TableNextColumn();
                    
                    
                    ImGui::Checkbox("###1", &preferences.AKM);
                    ImGui::TableNextColumn();
                    ImGui::Text("AKM");
                    ImGui::TableNextColumn();
                    ImGui::InputInt("##ak", &preferences.Config.Skin.AKM);
                    ImGui::TableNextColumn();


                    ImGui::Checkbox("###hsuwjsh", &preferences.MK14);
                    ImGui::TableNextColumn();
                    ImGui::Text("MK14");
                    ImGui::TableNextColumn();
                    ImGui::InputInt("##mk14", &preferences.Config.Skin.MK14);
                    ImGui::TableNextColumn();


                    ImGui::Checkbox("###cyygbhj", &preferences.MG3);
                    ImGui::TableNextColumn();
                    ImGui::Text("MG3");
                    ImGui::TableNextColumn();
                    ImGui::InputInt("##mg3", &preferences.Config.Skin.MG3);
                    ImGui::TableNextColumn();


                    ImGui::Checkbox("###xbsjsjhs", &preferences.P90);
                    ImGui::TableNextColumn();
                    ImGui::Text("P90");
                    ImGui::TableNextColumn();
                    ImGui::InputInt("##p90", &preferences.Config.Skin.P90);
                    ImGui::TableNextColumn();
                    
                    
                    ImGui::Checkbox("###2", &preferences.SCARL);
                    ImGui::TableNextColumn();
                    ImGui::Text("SCAR-L");
                    ImGui::TableNextColumn();
                    ImGui::InputInt("##scar", &preferences.Config.Skin.Scar);
                    ImGui::TableNextColumn();
                    
                
                    ImGui::Checkbox("###3", &preferences.M762);
                    ImGui::TableNextColumn();
                    ImGui::Text("M762");
                    ImGui::TableNextColumn();
                    ImGui::InputInt("##M762", &preferences.Config.Skin.M762);
                    ImGui::TableNextColumn();
                    
                    ImGui::Checkbox("###23", &preferences.GROZA);
                    ImGui::TableNextColumn();
                    ImGui::Text("GROZA");
                    ImGui::TableNextColumn();
                    ImGui::InputInt("##GR", &preferences.Config.Skin.Groza);
                    ImGui::TableNextColumn();
                    
                
                    ImGui::Checkbox("###32", &preferences.AUG);
                    ImGui::TableNextColumn();
                    ImGui::Text("AUG");
                    ImGui::TableNextColumn();
                    ImGui::InputInt("##AUG", &preferences.Config.Skin.AUG);
                    ImGui::TableNextColumn();
                    
                    ImGui::Checkbox("###3U2", &preferences.M16);
                    ImGui::TableNextColumn();
                    ImGui::Text("M16A4");
                    ImGui::TableNextColumn();
                    ImGui::InputInt("##M16A4", &preferences.Config.Skin.M16A4);
                    ImGui::TableNextColumn();
                    
                    
                    ImGui::Checkbox("###3Ui2", &preferences.ACE32);
                    ImGui::TableNextColumn();
                    ImGui::Text("ACE32");
                    ImGui::TableNextColumn();
                    ImGui::InputInt("##ACE", &preferences.Config.Skin.ACE32);
                    ImGui::TableNextColumn();
                    
                    ImGui::Checkbox("###19", &preferences.KAR98);
                    ImGui::TableNextColumn();
                    ImGui::Text("Kar98-k");
                    ImGui::TableNextColumn();
                    ImGui::InputInt("##rak", &preferences.Config.Skin.K98);
                    ImGui::TableNextColumn();
                    
                    
                    ImGui::Checkbox("###20", &preferences.M24);
                    ImGui::TableNextColumn();
                    ImGui::Text("M24");
                    ImGui::TableNextColumn();
                    ImGui::InputInt("##M24", &preferences.Config.Skin.M24);
                    ImGui::TableNextColumn();
                    
                
                    ImGui::Checkbox("###21", &preferences.AWM);
                    ImGui::TableNextColumn();
                    ImGui::Text("AWM");
                    ImGui::TableNextColumn();
                    ImGui::InputInt("##AWM", &preferences.Config.Skin.AWM);
                    ImGui::TableNextColumn();
                    
                    
                    ImGui::Checkbox("###19T", &preferences.DP28);
                    ImGui::TableNextColumn();
                    ImGui::Text("DP-28");
                    ImGui::TableNextColumn();
                    ImGui::InputInt("##ra6k", &preferences.Config.Skin.DP28);
                    ImGui::TableNextColumn();
                    
                    
                    ImGui::Checkbox("###260", &preferences.M249);
                    ImGui::TableNextColumn();
                    ImGui::Text("M249");
                    ImGui::TableNextColumn();
                    ImGui::InputInt("##M24g", &preferences.Config.Skin.M249);
                    ImGui::TableNextColumn();
                    
                
                    ImGui::Checkbox("###21372", &preferences.UZI);
                    ImGui::TableNextColumn();
                    ImGui::Text("UZI");
                    ImGui::TableNextColumn();
                    ImGui::InputInt("##UZI", &preferences.Config.Skin.UZI);
                    ImGui::TableNextColumn();
                    
                    
                    ImGui::Checkbox("###20UI", &preferences.UMP);
                    ImGui::TableNextColumn();
                    ImGui::Text("UMP");
                    ImGui::TableNextColumn();
                    ImGui::InputInt("##UNP", &preferences.Config.Skin.UMP);
                    ImGui::TableNextColumn();
                    
                
                    ImGui::Checkbox("###TT21", &preferences.TOMMY);
                    ImGui::TableNextColumn();
                    ImGui::Text("Thompson");
                    ImGui::TableNextColumn();
                    ImGui::InputInt("##Thompson", &preferences.Config.Skin.Thompson);
                    ImGui::TableNextColumn();
                    
                    
                    ImGui::Checkbox("###19TV", &preferences.VECTOR);
                    ImGui::TableNextColumn();
                    ImGui::Text("Vector");
                    ImGui::TableNextColumn();
                    ImGui::InputInt("##Vector", &preferences.Config.Skin.Vector);
                    ImGui::TableNextColumn();
                    
                    
                    ImGui::Checkbox("###26y0", &preferences.BIZON);
                    ImGui::TableNextColumn();
                    ImGui::Text("Bizon");
                    ImGui::TableNextColumn();
                    ImGui::InputInt("##M24yg", &preferences.Config.Skin.Bizon);
                    ImGui::TableNextColumn();
                    
                    ImGui::Checkbox("###26gy0", &preferences.PAN);
                    ImGui::TableNextColumn();
                    ImGui::Text("平底锅");
                    ImGui::TableNextColumn();
                    ImGui::InputInt("##M24ygy", &preferences.Config.Skin.Pan);
                    ImGui::EndTable();
                    }
                }
                
                    if (Settings::Tab == 2) {
                    if (ImGui::BeginTable("##ModCar", 3, ImGuiTableFlags_BordersOuter | ImGuiTableFlags_BordersInner)) {
                    ImGui::TableSetupColumn("开启", 0, 20);
                    ImGui::TableSetupColumn("名字", 0, 30);
                    ImGui::TableSetupColumn("美化", 0, 60);
                    ImGui::TableHeadersRow();
                    ImGui::TableNextRow();
                    
                    ImGui::TableNextColumn();
                    ImGui::Checkbox("###0", &preferences.Dacia);
                    ImGui::TableNextColumn();
                    ImGui::Text("Dacia");
                    ImGui::TableNextColumn();
                    ImGui::InputInt("##dacia", &preferences.Config.Skin.Dacia);
                    ImGui::TableNextColumn();
                    
                    
                    ImGui::Checkbox("###1", &preferences.CoupeRB);
                    ImGui::TableNextColumn();
                    ImGui::Text("Coupe RB");
                    ImGui::TableNextColumn();
                    ImGui::InputInt("##coupe", &preferences.Config.Skin.CoupeRP);
                    ImGui::TableNextColumn();
                    
                    
                    ImGui::Checkbox("###2", &preferences.UAZ);
                    ImGui::TableNextColumn();
                    ImGui::Text("UAZ");
                    ImGui::TableNextColumn();
                    ImGui::InputInt("##uaz", &preferences.Config.Skin.UAZ);
                    ImGui::TableNextColumn();
                    
                    ImGui::Checkbox("###23", &preferences.Moto);
                    ImGui::TableNextColumn();
                    ImGui::Text("MotoBike");
                    ImGui::TableNextColumn();
                    ImGui::InputInt("##moto", &preferences.Config.Skin.Moto);
                    
                    ImGui::TableNextColumn();
                    ImGui::Checkbox("###235", &preferences.BigFoot);
                    ImGui::TableNextColumn();
                    ImGui::Text("BigFoot");
                    ImGui::TableNextColumn();
                    ImGui::InputInt("##Bigfoot", &preferences.Config.Skin.Bigfoot);
                    
                    ImGui::TableNextColumn();
                    ImGui::Checkbox("###2345", &preferences.Mirado);
                    ImGui::TableNextColumn();
                    ImGui::Text("Mirado");
                    ImGui::TableNextColumn();
                    ImGui::InputInt("##OMirado", &preferences.Config.Skin.Mirado);
                    
                    ImGui::TableNextColumn();
                    ImGui::Checkbox("###2365", &preferences.Buggy);
                    ImGui::TableNextColumn();
                    ImGui::Text("Buggy");
                    ImGui::TableNextColumn();
                    ImGui::InputInt("##Buggy", &preferences.Config.Skin.Buggy);
                    
                    ImGui::TableNextColumn();
                    ImGui::Checkbox("###234995", &preferences.MiniBus);
                    ImGui::TableNextColumn();
                    ImGui::Text("MiniBus");
                    ImGui::TableNextColumn();
                    ImGui::InputInt("##miniB", &preferences.Config.Skin.MiniBus);
                    
                    ImGui::TableNextColumn();
                    ImGui::Checkbox("###23650", &preferences.Boat);
                    ImGui::TableNextColumn();
                    ImGui::Text("PG-117");
                    ImGui::TableNextColumn();
                    ImGui::InputInt("##bg77", &preferences.Config.Skin.Boat);
                    
                    ImGui::EndTable();
                    }
                }}
             //￼￼}
                        
                        
     }
ImGui::EndChild();           
                    
} 
               
                ImGui::End();
                ImGui::PushStyleVar(ImGuiStyleVar_WindowRounding, 5.f);
    ImGui::PushStyleColor(ImGuiCol_WindowBg, ImVec4(43.f / 255.f, 43.f / 255.f, 43.f / 255.f, 100.f / 255.f));
    ImGui::RenderNotifications();
    ImGui::PopStyleVar(1); // Don't forget to Pop()
    ImGui::PopStyleColor(1);
                
            }
        
            
            ImGui::Render();
            ImDrawData* draw_data = ImGui::GetDrawData();
            ImGui_ImplMetal_RenderDrawData(draw_data, commandBuffer, renderEncoder);
            
            
            [renderEncoder popDebugGroup];
            [renderEncoder endEncoding];
            
            [commandBuffer presentDrawable:view.currentDrawable];
            
        }
        
        
        
        
        
        [commandBuffer commit];
        
        
        
        
    }

    




- (void)mtkView:(MTKView*)view drawableSizeWillChange:(CGSize)size
{
    
}



#pragma mark - Interaction

- (void)updateIOWithTouchEvent:(UIEvent *)event
{
    UITouch *anyTouch = event.allTouches.anyObject;
    CGPoint touchLocation = [anyTouch locationInView:self.view];
    ImGuiIO &io = ImGui::GetIO();
    io.MousePos = ImVec2(touchLocation.x, touchLocation.y);
    
    BOOL hasActiveTouch = NO;
    for (UITouch *touch in event.allTouches)
    {
        if (touch.phase != UITouchPhaseEnded && touch.phase != UITouchPhaseCancelled)
        {
            hasActiveTouch = YES;
            break;
        }
    }
    io.MouseDown[0] = hasActiveTouch;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self updateIOWithTouchEvent:event];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self updateIOWithTouchEvent:event];
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self updateIOWithTouchEvent:event];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self updateIOWithTouchEvent:event];
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

kaddr getRealOffset(kaddr offset){
    return (unsigned long)Get_module_base()+offset; //rootfull
}

long obbbbl() {
   
        NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
          NSString *BundID = [infoDictionary objectForKey:@"CFBundleIdentifier"];
        if([BundID containsString:@"com.tencent.ig"]){
            return getRealOffset(0x10A455D28);
        }
        if([BundID containsString:@"kr"]){
            return getRealOffset(0x10A5D77A8);
        }
        if([BundID containsString:@"rekoo"]){
            return getRealOffset(0x10A60E0A8);
        }
        if([BundID containsString:@"vn.vng.pubgmobile"]){
            return getRealOffset(0x10A360AA8);
        }
        if([BundID containsString:@"imobile"]){
            return getRealOffset(0x1093cbf6e);
        }
        if([BundID containsString:@"com.tencent.igce"]){
            return getRealOffset(0x1058E57C8);
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
            auto ViewPort = GEngine->GameViewport;
            if(ViewPort) {
                GEWorld = ViewPort->World;
                return ViewPort->World;
            }
        }
    }
    return 0;
}
//TNameEntryArray *GetGNames() {
//return (TNameEntryArray *) fast2();
//}
TNameEntryArray *GetGNames() {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
      NSString *BundID = [infoDictionary objectForKey:@"CFBundleIdentifier"];
    if([BundID containsString:@"com.tencent.ig"]){
        return ((TNameEntryArray *(*)()) ((unsigned long)Get_module_base() + 0x10487CBE8))();
    }
    if([BundID containsString:@"kr"]){
        return ((TNameEntryArray *(*)()) ((unsigned long)Get_module_base() + 0x1049EAB1C))();
    }
    if([BundID containsString:@"rekoo"]){
        return ((TNameEntryArray *(*)()) ((unsigned long)Get_module_base() + 0x1049FDBC8))();
    }
    if([BundID containsString:@"vn.vng.pubgmobile"]){
        return ((TNameEntryArray *(*)()) ((unsigned long)Get_module_base() + 0x1047CACD4))();
    }
    if([BundID containsString:@"imobile"]){
        return ((TNameEntryArray *(*)()) ((unsigned long)Get_module_base() + 0x104002620))();
    }
    if([BundID containsString:@"com.tencent.igce"]){
        return ((TNameEntryArray *(*)()) ((unsigned long)Get_module_base() + 0x10C2C60C8))();
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
auto SmartAimPos(ASTExtraPlayerCharacter *Player, ASTExtraPlayerController *localPlayerController) {
  
  auto HeadPos = Player->GetBonePos("Head", {});
  auto NeckPos = Player->GetBonePos("neck_01", {});
  auto SpinPos = Player->GetBonePos("spine_03", {});
  auto SpinPos2 = Player->GetBonePos("spine_02", {});
  auto pelvisPos = Player->GetBonePos("pelvis", {});
  
  auto UarmrPos = Player->GetBonePos("upperarm_r", {});
  auto LowarmrPos = Player->GetBonePos("lowerarm_r", {});
  auto HandrPos = Player->GetBonePos("hand_r", {});
  auto ItemrPos = Player->GetBonePos("item_r", {});


  auto UarmlPos = Player->GetBonePos("upperarm_l", {});
  auto LowarmlPos = Player->GetBonePos("lowerarm_l", {});
  auto HandlPos = Player->GetBonePos("hand_l", {});
  auto ItemlPos = Player->GetBonePos("item_l", {});
  
  auto ThirPos = Player->GetBonePos("thigh_r", {});
  auto CalrPos = Player->GetBonePos("calf_r", {});
  auto Footr = Player->GetBonePos("foot_r", {});
  
  
  
  auto ThilPos = Player->GetBonePos("thigh_l", {});
  auto CallPos = Player->GetBonePos("calf_l", {});
  auto FootlPos = Player->GetBonePos("foot_l", {});

                        
                        
                        
  if(localPlayerController->LineOfSightTo(localPlayerController->PlayerCameraManager, HeadPos, true)) {
  
  return HeadPos;
  } else if(localPlayerController->LineOfSightTo(localPlayerController->PlayerCameraManager, NeckPos, true)) {
  
  return NeckPos;
  } else if(localPlayerController->LineOfSightTo(localPlayerController->PlayerCameraManager, SpinPos, true)) {
  
  return SpinPos;
  } else if(localPlayerController->LineOfSightTo(localPlayerController->PlayerCameraManager, SpinPos2, true)) {
  
  return SpinPos2;
  } else if(localPlayerController->LineOfSightTo(localPlayerController->PlayerCameraManager, pelvisPos, true)) {
  
  return pelvisPos;//
  } else if(localPlayerController->LineOfSightTo(localPlayerController->PlayerCameraManager, UarmrPos, true)) {
  
  return UarmrPos;
  } else if(localPlayerController->LineOfSightTo(localPlayerController->PlayerCameraManager, LowarmrPos, true)) {
  
  return LowarmrPos;
  } else if(localPlayerController->LineOfSightTo(localPlayerController->PlayerCameraManager, HandrPos, true)) {
  
  return HandrPos;
  } else if(localPlayerController->LineOfSightTo(localPlayerController->PlayerCameraManager, ItemrPos, true)) {
  
  return ItemrPos;
  } else if(localPlayerController->LineOfSightTo(localPlayerController->PlayerCameraManager, UarmlPos, true)) {
  
  return UarmlPos;
  } else if(localPlayerController->LineOfSightTo(localPlayerController->PlayerCameraManager, LowarmlPos, true)) {
  
  return LowarmlPos;
  } else if(localPlayerController->LineOfSightTo(localPlayerController->PlayerCameraManager, HandlPos, true)) {
  
  return HandlPos;
  } else if(localPlayerController->LineOfSightTo(localPlayerController->PlayerCameraManager, ItemlPos, true)) {
  
  return ItemlPos;
  } else if(localPlayerController->LineOfSightTo(localPlayerController->PlayerCameraManager, ThirPos, true)) {
  
  return ThirPos;
  } else if(localPlayerController->LineOfSightTo(localPlayerController->PlayerCameraManager, CalrPos, true)) {
  
  return CalrPos;
  } else if(localPlayerController->LineOfSightTo(localPlayerController->PlayerCameraManager, Footr, true)) {
  
  return Footr;
  } else if(localPlayerController->LineOfSightTo(localPlayerController->PlayerCameraManager, ThilPos, true)) {
  
  return ThilPos;
  } else if(localPlayerController->LineOfSightTo(localPlayerController->PlayerCameraManager, CallPos, true)) {
  
  return CallPos;
  } else if(localPlayerController->LineOfSightTo(localPlayerController->PlayerCameraManager, FootlPos, true)) {
  
  return FootlPos;
  }
  
  
  return HeadPos;
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
struct FLinearColor HPBorderColor;
ASTExtraPlayerCharacter *g_LocalPlayer;
ASTExtraPlayerController *g_PlayerController;
#define COLOR_RED   FLinearColor(1.f, 0.f, 0.f, 1.f)
#define COLOR_BLACK FLinearColor(0, 0, 0, 1.f)
#define COLOR_NMHL FLinearColor(0, 0, 0, 1.f)
#define COLOR_WHITE FLinearColor(1.f, 1.f, 1.f, 1.f)
#define COLOR_RED   FLinearColor(1.f, 0, 0, 1.f)
#define COLOR_LIME  FLinearColor(0, 1.f, 0, 1.f)
#define COLOR_NMSL  FLinearColor(1.0f, 1.0f, 0.0f, 1.0f)
#define COLOR_CYAN  FLinearColor(0.f, 1.f, 1.f, 1.f)
#define COLOR_BLUE  FLinearColor(0, 0, 1.f, 1.f)
#define COLOR_CAR   FLinearColor(1.f, 0.5f, 1.f, 1.f)
#define GREEN       FLinearColor(0 / 255.f, 153 / 255.f, 0 / 255.f, 1.f)
#define ABU         FLinearColor(0.f, 0.f, 0.f, 1.f) // 黑色，不透明
//#define ABU         FLinearColor(0 / 255.f, 204 / 255.f, 204 / 255.f, 1.f)
#define COLOR_GREEN FLinearColor(0, 0.5f, 0, 1.f)
#define COLOR_PLAYER FLinearColor(1.000f, 0.620f, 0.150f, 1.000f)
#define COLOR_YELLOW FLinearColor(1.000f, 1.000f, 0.000f, 1.000f)
#define COLOR_GGVIP FLinearColor(1.000f, 1.000f, 0.000f, 1.000f)
UGameplayStatics* iosde = (UGameplayStatics*)UGameplayStatics::StaticClass();
ASTExtraPlayerController *localPlayerController = 0;
#define W2S(w, s) iosde->ProjectWorldToScreen(localPlayerController, w, true, s)

void DrawRectangle(AHUD *HUD, FVector2D Pos, float Width, float Height, float Thickness, FLinearColor Color) {
    HUD->DrawLine(Pos.X, Pos.Y, Pos.X + Width, Pos.Y, Color, Thickness);
    HUD->DrawLine(Pos.X, Pos.Y, Pos.X, Pos.Y + Height, Color, Thickness);
    HUD->DrawLine(Pos.X + Width, Pos.Y, Pos.X + Width, Pos.Y + Height, Color, Thickness);
    HUD->DrawLine(Pos.X, Pos.Y + Height, Pos.X + Width, Pos.Y + Height, Color, Thickness);
}
FVector2D rotateCoord(float angle, FVector2D coord) {
float s = sin(angle * M_PI / 180);
float c = cos(angle * M_PI / 180);

return {
coord.X * c + coord.Y * s, -coord.X * s + coord.Y * c
};
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



void VectorAnglesRadar(Vector3 & forward, FVector & angles) {
 if (forward.X == 0.f && forward.Y == 0.f) {
  angles.X = forward.Z > 0.f ? -90.f : 90.f;
  angles.Y = 0.f;
 } else {
  angles.X = RAD2DEG(atan2(-forward.Z, forward.Magnitude(forward)));
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
void DrawRadarcan(UCanvas* Canvas,float yaw, FVector Player, FVector Local, int xAxis, int yAxis, int width, int height, FLinearColor color)
{
    bool out = false;
    FVector siz;
    siz.X = width;
    siz.Y = height;
    FVector pos;
    pos.X = xAxis;
    pos.Y = yAxis;
    float RadarCenterX = pos.X + (siz.X / 2);
    float RadarCenterY = pos.Y + (siz.Y / 2);
    Canvas->K2_DrawBox({pos.X, pos.Y}, {siz.X, siz.Y}, 1);
    Canvas->K2_DrawLine({RadarCenterX, RadarCenterY}, {pos.X, pos.Y}, 1.f,  color);
    Canvas->K2_DrawLine({RadarCenterX, RadarCenterY}, {pos.X + siz.X, pos.Y}, 1.f,  color);
    Canvas->K2_DrawLine({pos.X, RadarCenterY}, {pos.X + siz.X, RadarCenterY}, 1.f,  color);
    Canvas->K2_DrawLine({RadarCenterX, RadarCenterY}, {RadarCenterX, pos.Y + siz.Y}, 1.f,  color);
    DrawCircle( Canvas, RadarCenterX, RadarCenterY, 2, 2, color);
    FVector2D single = WorldToRadar(yaw, Player, Local, pos.X, pos.Y, FVector(siz.X, siz.Y, 0), out);
   
}
bool offscreen (FVector2D point , FVector2D scren)
{
    if (point.X <= 0 || point.Y <= 0 || point.X >= scren.X || point.Y >= scren.Y)
    {
        return true;
        
    }
    
    return false;
}

//预警箭头
void DrawArrows(AHUD * hud,std::array < FVector2D, 39 > Loc, float thickness, FLinearColor color) {

    DrawLine(hud,Loc.at(0), Loc.at(1), thickness * 1.f, color);
    DrawLine(hud,Loc.at(1), Loc.at(2), thickness * 1.f, color);
    DrawLine(hud,Loc.at(2), Loc.at(6), thickness * 1.f, color);
    DrawLine(hud,Loc.at(6), Loc.at(5), thickness * 1.f, color);
    DrawLine(hud,Loc.at(5), Loc.at(4), thickness * 1.f, color);
    DrawLine(hud,Loc.at(4), Loc.at(3), thickness * 1.f, color);
    DrawLine(hud,Loc.at(3), Loc.at(0), thickness * 1.f, color);
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
    FLinearColor clr = FLinearColor(0.0f, 1.0f, 0.0f, 0.5f); // Green color

    float barHeight = (currentHealth / maxHealth) * height;

    // Change color based on health percentage
    if (currentHealth <= (maxHealth * 0.6)) {
        clr = FLinearColor(1.0f, 0.0f, 1.0f, 0.5f); // Magenta color
    }

    if (currentHealth < (maxHealth * 0.3)) {
        clr = FLinearColor(1.0f, 0.0f, 0.0f, 0.5f); // Red color
    }

    // Draw the health bar rectangle
    HUD->DrawRect(clr, screenPos.X, screenPos.Y, 3.0f, barHeight);
}
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
void DrawOutlinedText1(AHUD *HUD, FString Text, FVector2D Pos, FLinearColor Color, FLinearColor OutlineColor, bool isCenter = false) {
    UCanvas *Canvas = HUD->Canvas;
    Canvas->K2_DrawText(robotoFont, Text, Pos, Color, 1.f, {}, {}, isCenter, isCenter, true, OutlineColor);
}

void DrawText(AHUD *HUD, FString Text, FVector2D Pos, FLinearColor Color, bool isCenter = false) {
    UCanvas *Canvas = HUD->Canvas;
    Canvas->K2_DrawText(robotoFont, Text, Pos, Color, 1.f, {}, {}, isCenter, isCenter, false, {});
}

void DrawSmallOutlinedText(AHUD *HUD, FString Text, FVector2D Pos, FLinearColor Color, FLinearColor OutlineColor, bool isCenter = false) {
    UCanvas *Canvas = HUD->Canvas;
    Canvas->K2_DrawText(robotoTinyFont, Text, Pos, Color, 1.f, {}, {}, isCenter, isCenter, true, OutlineColor);
}
void DrawSmallOutlined(AHUD *HUD, FString Text, FVector2D Pos, FLinearColor Color, FLinearColor OutlineColor, bool isCenter = false) {
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
void DrawCircle(UCanvas *Canvas, int x, int y, int radius, int numsides, FLinearColor OutlineColor) {
float Step = M_PI * 2.0 / numsides;
int Count = 0;
FVector2D V[128];
for (float a = 0; a < M_PI * 2.0; a += Step) {
float X1 = radius * cos(a) + x;
float Y1 = radius * sin(a) + y;
float X2 = radius * cos(a + Step) + x;
float Y2 = radius * sin(a + Step) + y;
V[Count].X = X1;
V[Count].Y = Y1;
V[Count + 1].X = X2;
V[Count + 1].Y = Y2;
Canvas->K2_DrawLine(FVector2D({
V[Count].X,
V[Count].Y
}), FVector2D({
X2,
Y2
}), 1.f, OutlineColor);
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
// 假设的绘制函数，需要根据您的引擎或框架进行实现
void DrawConvexPolygon(AHUD* HUD, FVector2D* Points, int NumPoints, FLinearColor Color) {
    // 这里需要实现绘制凸多边形的逻辑，可能需要调用引擎提供的API
}

//void DrawLine(UUserWidget* HUD, FVector2D* Points, int NumPoints, FLinearColor Color, float Width) {
    // 这里需要实现绘制线条的逻辑，可能需要调用引擎提供的API
//}

void DrawFilledRect1(AHUD *HUD, FVector2D initial_pos, float w, float h)
{
	int Count = 0;
	FVector2D V[128];
    static float cnt = 0.0f;
    const float rainbowSpeed = 1;
    FLinearColor rainbowColors[] = {
    FLinearColor(1.0f, 0.0f, 0.0f, 1.0f), // A: Red
    FLinearColor(1.0f, 0.5f, 0.0f, 1.0f), // B: Orange
    FLinearColor(1.0f, 1.0f, 0.0f, 1.0f), // C: Yellow
    FLinearColor(0.0f, 1.0f, 0.0f, 1.0f), // D: Green
    FLinearColor(0.0f, 0.0f, 1.0f, 1.0f), // E: Blue
    FLinearColor(0.5f, 0.0f, 1.0f, 1.0f), // F: Indigo
    FLinearColor(1.0f, 0.0f, 1.0f, 1.0f), // G: Violet
    FLinearColor(1.0f, 0.0f, 0.5f, 1.0f), // H: Purple
    FLinearColor(0.5f, 0.0f, 0.5f, 1.0f), // I: Mauve
    FLinearColor(0.0f, 0.5f, 0.5f, 1.0f), // J: Teal
    FLinearColor(0.5f, 0.5f, 0.5f, 1.0f), // K: Gray
    FLinearColor(0.5f, 0.0f, 0.0f, 1.0f), // L: Maroon
    FLinearColor(0.0f, 0.5f, 0.0f, 1.0f), // M: Lime
    FLinearColor(0.0f, 0.5f, 0.5f, 1.0f), // N: Aqua
    FLinearColor(0.5f, 0.5f, 0.0f, 1.0f), // O: Olive
    FLinearColor(0.0f, 0.0f, 0.5f, 1.0f), // P: Navy
    FLinearColor(0.5f, 0.0f, 0.5f, 1.0f), // Q: Fuchsia
    FLinearColor(0.5f, 1.0f, 0.0f, 1.0f), // R: Chartreuse
    FLinearColor(0.0f, 0.5f, 1.0f, 1.0f), // S: Sky Blue
    FLinearColor(1.0f, 0.5f, 0.5f, 1.0f), // T: Salmon
    FLinearColor(0.5f, 0.0f, 0.0f, 1.0f), // U: Burgundy
    FLinearColor(0.0f, 0.0f, 0.0f, 1.0f), // V: Black
    FLinearColor(1.0f, 1.0f, 1.0f, 1.0f), // W: White
    FLinearColor(0.0f, 1.0f, 1.0f, 1.0f), // X: Cyan
    FLinearColor(0.5f, 0.5f, 1.0f, 1.0f), // Y: Lavender
    FLinearColor(0.75f, 0.75f, 0.0f, 1.0f) // Z: Gold
    };
    int rainbowColorIndex = static_cast<int>(fmod(cnt * rainbowSpeed, 7.0f));

    // Interpolate between two adjacent rainbow colors manually
    FLinearColor color1 = rainbowColors[rainbowColorIndex];
    FLinearColor color2 = rainbowColors[(rainbowColorIndex + 1) % 7]; // Wrap around
    float t = fmod(cnt * rainbowSpeed, 1.0f); // Interpolation factor
    FLinearColor rainbowColor = FLinearColor(
            color1.R + (color2.R - color1.R) * t,
            color1.G + (color2.G - color1.G) * t,
            color1.B + (color2.B - color1.B) * t,
            1.0f
    );
    for (float i = 0.f; i < h; i += 1.f)
    DrawLine(HUD, FVector2D(initial_pos.X, initial_pos.Y - i), FVector2D(initial_pos.X + w, initial_pos.Y - i), 1.f, rainbowColor);
     if (cnt >= 360.0f) {
        cnt = 0.0f;
    }
    else {
        cnt += 0.02f;
    }        
}
void DrawCircle2(AHUD *HUD, int x, int y, int radius, int numsides) {
    // 颜色变化代码
    static float cnt = 0.0f;
    const float rainbowSpeed = 1.0f;

    // 定义彩虹颜色数组（使用7种颜色）
    FLinearColor rainbowColors[] = {
    FLinearColor(1.0f, 0.0f, 0.0f, 1.0f), // A: Red
    FLinearColor(1.0f, 0.5f, 0.0f, 1.0f), // B: Orange
    FLinearColor(1.0f, 1.0f, 0.0f, 1.0f), // C: Yellow
    FLinearColor(0.0f, 1.0f, 0.0f, 1.0f), // D: Green
    FLinearColor(0.0f, 0.0f, 1.0f, 1.0f), // E: Blue
    FLinearColor(0.5f, 0.0f, 1.0f, 1.0f), // F: Indigo
    FLinearColor(1.0f, 0.0f, 1.0f, 1.0f), // G: Violet
    FLinearColor(1.0f, 0.0f, 0.5f, 1.0f), // H: Purple
    FLinearColor(0.5f, 0.0f, 0.5f, 1.0f), // I: Mauve
    FLinearColor(0.0f, 0.5f, 0.5f, 1.0f), // J: Teal
    FLinearColor(0.5f, 0.5f, 0.5f, 1.0f), // K: Gray
    FLinearColor(0.5f, 0.0f, 0.0f, 1.0f), // L: Maroon
    FLinearColor(0.0f, 0.5f, 0.0f, 1.0f), // M: Lime
    FLinearColor(0.0f, 0.5f, 0.5f, 1.0f), // N: Aqua
    FLinearColor(0.5f, 0.5f, 0.0f, 1.0f), // O: Olive
    FLinearColor(0.0f, 0.0f, 0.5f, 1.0f), // P: Navy
    FLinearColor(0.5f, 0.0f, 0.5f, 1.0f), // Q: Fuchsia
    FLinearColor(0.5f, 1.0f, 0.0f, 1.0f), // R: Chartreuse
    FLinearColor(0.0f, 0.5f, 1.0f, 1.0f), // S: Sky Blue
    FLinearColor(1.0f, 0.5f, 0.5f, 1.0f), // T: Salmon
    FLinearColor(0.5f, 0.0f, 0.0f, 1.0f), // U: Burgundy
    FLinearColor(0.0f, 0.0f, 0.0f, 1.0f), // V: Black
    FLinearColor(1.0f, 1.0f, 1.0f, 1.0f), // W: White
    FLinearColor(0.0f, 1.0f, 1.0f, 1.0f), // X: Cyan
    FLinearColor(0.5f, 0.5f, 1.0f, 1.0f), // Y: Lavender
    FLinearColor(0.75f, 0.75f, 0.0f, 1.0f) // Z: Gold
    };

    // 计算当前颜色索引
    int colorIndex = static_cast<int>(fmod(cnt * rainbowSpeed, 7.0f));

    // 插值颜色
    FLinearColor color1 = rainbowColors[colorIndex];
    FLinearColor color2 = rainbowColors[(colorIndex + 1) % 7];
    float t = fmod(cnt * rainbowSpeed, 1.0f);
    FLinearColor currentColor = FLinearColor(
        color1.R + (color2.R - color1.R) * t,
        color1.G + (color2.G - color1.G) * t,
        color1.B + (color2.B - color1.B) * t,
        1.0f
    );

    // 更新计数器
     if (cnt >= 360.0f) {
        cnt = 0.0f;
    }
    else {
        cnt += 0.02f;
    }        

    // 绘制圆形
    float Step = M_PI * 2.0 / numsides;
    int Count = 0;
    FVector2D V[128];
    for (float a = 0; a < M_PI * 2.0; a += Step) {
        float X1 = radius * cos(a) + x;
        float Y1 = radius * sin(a) + y;
        float X2 = radius * cos(a + Step) + x;
        float Y2 = radius * sin(a + Step) + y;
        V[Count].X = X1;
        V[Count].Y = Y1;
        V[Count + 1].X = X2;
        V[Count + 1].Y = Y2;
        HUD->Canvas->K2_DrawLine(FVector2D({ V[Count].X, V[Count].Y }), FVector2D({ X2, Y2 }), 1.f, currentColor);
    }
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
void *LoadFont() {
    while (!robotoFont || !robotoTinyFont || !tslFont) {
        tslFont = UObject::FindObject<UFont>("Font TSLFont.TSLFont");
        robotoFont = UObject::FindObject<UFont>("Font Roboto.Roboto");
        robotoTinyFont = UObject::FindObject<UFont>("Font RobotoTiny.RobotoTiny");
        sleep(1);
    }
    return 0;
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
 
FVector WorldToRadar(float Yaw, FVector Origin, FVector LocalOrigin, float PosX, float PosY, Vector3 Size, bool &outbuff) {
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
 }else{
  bool flag3 = Xector2.X < PosX;
  if (flag3) {
   Xector2.X = PosX;
  }
 }
 bool flag4 = Xector2.Y > PosY + Size.Y;
 if (flag4) {
  Xector2.Y = PosY + Size.Y;
 }else{
  bool flag5 = Xector2.Y < PosY;
  if (flag5){
   Xector2.Y = PosY;
  }
 }
 bool flag6 = Xector2.Y == PosY || Xector2.X == PosX;
 if (flag6){
  flag = true;
 }
 outbuff = flag;
 return Xector2;
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
void RotateTriangle(std::array<Vector3, 3> & points, float rotation) {
 const auto points_center = (points.at(0) + points.at(1) + points.at(2)) / 3;
 for (auto & point : points) {
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
//UGameplayStatics* iosde = (UGameplayStatics*)UGameplayStatics::StaticClass();


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

            if (!Player->Mesh) //
                continue;

            if (!Player->RootComponent) //
                continue;

            if([[NSUserDefaults standardUserDefaults] boolForKey:@"IgnoreKnocked"]){
                if (Player->Health == 0.0f)
                    continue;
            }
            if([[NSUserDefaults standardUserDefaults] boolForKey:@"IgnoreBot"]){
                if (Player->bEnsure)
                    continue;
            }
            
            float dist = localPlayer->GetDistanceTo(Player) / 100.0f;
                if (dist > g_disstance)
                continue;
            
            if([[NSUserDefaults standardUserDefaults] boolForKey:@"VisCheck"]){
                if (!localController->LineOfSightTo(Player, {0, 0, 0}, true))
                    continue;
            }
            auto Root = Player->GetBonePos("Root", {});
            auto Head = Player->GetBonePos("Head", {});

            FVector2D RootSc, HeadSc;
            if (W2S(Root, &RootSc) && W2S(Head, &HeadSc)) {
                float height = abs(HeadSc.Y - RootSc.Y);
                float width = height * 0.65f;

                FVector middlePoint = {HeadSc.X + (width / 2), HeadSc.Y + (height / 2), 0};
                if ((middlePoint.X >= 0 && middlePoint.X <= (float) glWidth) &&
                    (middlePoint.Y >= 0 && middlePoint.Y <= (float) glHeight)) {
                    FVector2D v2Middle = FVector2D((float) (glWidth / 2), (float) (glHeight / 2));
                    FVector2D v2Loc = FVector2D(middlePoint.X, middlePoint.Y);
                    if(isInsideFOV((int)middlePoint.X, (int)middlePoint.Y )) {
                    float distance = FVector2D::Distance(v2Middle, v2Loc);
    if([[NSUserDefaults standardUserDefaults] boolForKey:@"动态圈"]){
if (g_LocalPlayer->bIsWeaponFiring) {
    preferences.Config.SilentAim.Cross += 1.5f;  // 视野减少速度减慢到每帧0.1单位
    if (preferences.Config.SilentAim.Cross > 181.0f) {
        preferences.Config.SilentAim.Cross = 180.0f;  // 最小视野大小
    }
}else{
    preferences.Config.SilentAim.Cross -= 0.1f;  // 视野恢复速度减慢到每帧0.1单位
    if (preferences.Config.SilentAim.Cross < 61.0f) {
        preferences.Config.SilentAim.Cross = 60.0f;  // 最大视野大小
        }	
}}
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
        //if (!g_Token.empty() && !g_Auth.empty() && g_Token == g_Auth && _version == modVersion) {
    //if (preferences.Config.SilentAim.Enable && 追踪状态) {
    if([[NSUserDefaults standardUserDefaults] boolForKey:@"Enable"] && 追踪状态){
        
        ASTExtraPlayerCharacter *Target = GetTargetByCrossDist();
        
        if (Target) {
            bool triggerOk = false;
              if (preferences.Config.SilentAim.Trigger ==JsonPreferences::EAimTrigger::Scoping) {     triggerOk =   g_LocalPlayer->bIsGunADS;

                                    } else triggerOk = true;
                                    if (triggerOk) {
                
                FVector targetAimPos = Target->GetBonePos("Head", {0,0,0});
                targetAimPos.Z -= 7.0f;
                if (preferences.Config.SilentAim.Target == JsonPreferences::EAimTarget::Chest) {
                    targetAimPos.Z -= 25.0f;
                }
            
               UShootWeaponEntity *ShootWeaponEntityComponent = thiz->ShootWeaponEntityComponent;
                if (ShootWeaponEntityComponent) {
                    ASTExtraVehicleBase *CurrentVehicle = Target->CurrentVehicle;
                    if (CurrentVehicle) {
                        FVector LinearVelocity = CurrentVehicle->ReplicatedMovement.LinearVelocity;

                        float dist = g_LocalPlayer->GetDistanceTo(Target);
                        auto timeToTravel = dist / ShootWeaponEntityComponent->BulletFireSpeed;
        
                        targetAimPos = UKismetMathLibrary::Add_VectorVector(targetAimPos, UKismetMathLibrary::Multiply_VectorFloat(LinearVelocity, timeToTravel));
                    } else {
                        FVector Velocity = Target->GetVelocity();

                        float dist = g_LocalPlayer->GetDistanceTo(Target);
                        auto timeToTravel = dist / ShootWeaponEntityComponent->BulletFireSpeed;

                        targetAimPos = UKismetMathLibrary::Add_VectorVector(targetAimPos, UKismetMathLibrary::Multiply_VectorFloat(Velocity, timeToTravel));
                    }
                    FVector fDir = UKismetMathLibrary::Subtract_VectorVector(targetAimPos, start);
                    FRotator sex = UKismetMathLibrary::Conv_VectorToRotator(fDir);

                    rot = sex;
                }
            }
        }

    }

    if (坐标追) {
        
        ASTExtraPlayerCharacter *Target = GetTargetByCrossDist();
        
        if (Target) {
            bool triggerOk = false;
              if (preferences.Config.SilentAim.Trigger ==JsonPreferences::EAimTrigger::Scoping) {     triggerOk =   g_LocalPlayer->bIsGunADS;

                                    } else triggerOk = true;
                                    if (triggerOk) {
                
FVector targetAimPos = Target->GetBonePos("Head", {0, 0, 0});//头部骨骼
                    targetAimPos.Z += 13.0f;

FRotator sex = ToRotator(start, targetAimPos);


            int BulletX; //  [Offset: 0x80, Size: 0x4]   //  子弹坐标X
            int BulletZ; //  [Offset: 0x7c, Size: 0x4]   //  子弹坐标Z
            int BulletY; //  [Offset: 0x78, Size: 0x4]   //  子弹坐标Y
            FVector_NetQuantize WeaponOwnerHeadPos;//[Offset: 0x84, Size: 0xc]  //  武器拥有者头部位置
            float DamageRate;//[Offset: 0x90, Size: 0x4]  //  损坏率
            bool bIsFirstImpact;//(ByteOffset: 0, ByteMask: 1, FieldMask: 255)[Offset: 0x94, Size: 0x1]  //  b 是第一次撞击
            FVector_NetQuantize GunTailPos;//[Offset: 0x98, Size: 0xc]  //  枪尾位置


return orig_shoot_event(thiz, targetAimPos, sex, weapon, unk1);
                }
            
        }
    }

    return orig_shoot_event(thiz, start, rot, weapon, unk1);
}















void RenderESP(AHUD *HUD, int ScreenWidth, int ScreenHeight) {
    updateSkin();
        ASTExtraPlayerCharacter *localPlayer = 0;
        ASTExtraPlayerController *localPlayerController = 0;
        glWidth = ScreenWidth;
        glHeight = ScreenHeight;
        UCanvas *Canvas = HUD->Canvas;
        if (Canvas) {

            static bool loadFont = false;
        if (!loadFont) {
            LoadFont();
            loadFont = true;
        }
        

//水印
            if (!robotoFont || !tslFont || !robotoTinyFont)
                return;
            tslFont->LegacyFontSize = 15;
std::wstring name = L"    ";
            DrawTextcan(HUD, FString(name), {(float) screenWidth/2, 30}, COLOR_RED, COLOR_BLACK);
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
std::wstring name = L"";
            DrawTextcan(HUD, FString(name), {(float) screenWidth/2, 180}, COLOR_WHITE, COLOR_BLACK);
     std::string classname = Actor->GetName();
               if (classname.find("AirAttackBomb_C") != std::string::npos || classname.find("AirAttackBomb_Livik_C") != std::string::npos) {
                FVector2D LootPos;
       FVector PosV = Actor->K2_GetActorLocation();
       float Distance = Actor->GetDistanceTo(localPlayer) / 100.f;
       std::wstring tmp = L"!! AirAttack Nearby !!";
      DrawText(HUD, FString(tmp), {(float) screenWidth / 2, 150},
                                         COLOR_RED, true);
                                    if (gGameplayStatics->ProjectWorldToScreen(
                                            localPlayerController,
                                            Actor->RootComponent->RelativeLocation,
                                            false, &LootPos)) {
                                        std::string s = "Bomb";
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
                UKismetMathLibrary* UMC = (UKismetMathLibrary*)UKismetMathLibrary::StaticClass();
                if (NetDriver) {
                    UNetConnection *ServerConnection = NetDriver->ServerConnection;
                    if (ServerConnection) {
                        localPlayerController = (ASTExtraPlayerController *) ServerConnection->PlayerController;
                    }
                }



                if (localPlayerController) {
                    //localPlayerController->AntiCheatManagerComp = 0;
                    //localPlayerController->bShouldReportAntiCheat = false;
                    //localPlayerController->CheatClass =0;
                    //localPlayerController->CheatManager =0;

                    
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
                         
if ([[NSUserDefaults standardUserDefaults] boolForKey:@"AimBot"]) {

        ASTExtraPlayerCharacter *Target = GetTargetByCrossDist();
                               
                                                if (Target) {
                                                    bool triggerOk = false;
                                                    if (preferences.Config.SilentAim.Trigger) {
                                                        triggerOk = g_LocalPlayer->bIsWeaponFiring;
                                                    } else if (preferences.Config.SilentAim.Trigger) {
                                                        triggerOk = g_LocalPlayer->bIsGunADS;
                                                    } else if (preferences.Config.SilentAim.Trigger) {
                                                        triggerOk = g_LocalPlayer->bIsWeaponFiring && g_LocalPlayer->bIsGunADS;
                                                    } else if (preferences.Config.SilentAim.Trigger) {
                                                        triggerOk = g_LocalPlayer->bIsWeaponFiring || g_LocalPlayer->bIsGunADS;
                                        } else triggerOk = true;

                                        auto SmartPos = SmartAimPos(Target, localPlayerController);

                                     if (triggerOk) {

      FVector targetAimPos;                                                    if (preferences.Config.SilentAim.Target == JsonPreferences::EAimTarget::Head) {
     targetAimPos = Target->GetBonePos("Head", {});
                                        } else if (preferences.Config.SilentAim.Target == JsonPreferences::EAimTarget::Chest) {
      targetAimPos = Target->GetBonePos("pelvis", {});
                                        }
                                      
                                            auto WeaponManagerComponent = localPlayer->WeaponManagerComponent;
                                            if (WeaponManagerComponent) {
                                                auto propSlot = WeaponManagerComponent->GetCurrentUsingPropSlot();
                                                if ((int) propSlot.GetValue() >= 1 &&
                                                    (int) propSlot.GetValue() <= 3) {
                                                    auto CurrentWeaponReplicated = (ASTExtraShootWeapon *) WeaponManagerComponent->CurrentWeaponReplicated;
                                                    if (CurrentWeaponReplicated) {
                                                        auto ShootWeaponComponent = CurrentWeaponReplicated->ShootWeaponComponent;
                                                        if (ShootWeaponComponent) {
                                                            UShootWeaponEntity *ShootWeaponEntityComponent = ShootWeaponComponent->ShootWeaponEntityComponent;
                                                            if (ShootWeaponEntityComponent) {
                                                                ASTExtraVehicleBase *CurrentVehicle = Target->CurrentVehicle;
                                                                if (CurrentVehicle) {
                                                                    FVector LinearVelocity = CurrentVehicle->ReplicatedMovement.LinearVelocity;
                                                                    float dist = localPlayer->GetDistanceTo(Target);
                                                                    auto timeToTravel = dist /
                                                                    ShootWeaponEntityComponent->BulletFireSpeed;
                                                                    targetAimPos = UMC->Add_VectorVector(targetAimPos,UMC->Multiply_VectorFloat(LinearVelocity, timeToTravel));
                                                                } else {
                                                                    FVector CurrentPlayerLocation = Target->K2_GetActorLocation();
                                                                    static FVector PreviousPlayerLocation;
                                                                    float HeightChange = CurrentPlayerLocation.Z - PreviousPlayerLocation.Z;
                                                                    PreviousPlayerLocation = CurrentPlayerLocation;
                                                                    
                                                                    FVector Velocity = Target->GetVelocity();
                                                                    float dist = localPlayer->GetDistanceTo(Target);
                                                                    auto timeToTravel = dist /
                                                                    ShootWeaponEntityComponent->BulletFireSpeed;
                                                                    targetAimPos = UMC->Add_VectorVector(targetAimPos, UMC->Multiply_VectorFloat(Velocity, timeToTravel));
                                                                    if (HeightChange < 0) {
                                                                        targetAimPos.Z += HeightChange;
                                                                    }
                                                                    targetAimPos.Z += Velocity.Z * timeToTravel + 0.5f * 576.3f * timeToTravel * timeToTravel;
                                                                    
                                                                }
                                                                if (localPlayer->bIsGunADS) {
                                                                    if (localPlayer->bIsWeaponFiring) {
                                                                        float dist = localPlayer->GetDistanceTo(Target) / 100.f;
                                                                        targetAimPos.Z -= dist * [[NSUserDefaults standardUserDefaults] integerForKey:@"AimRecc"];
                                                                    }
                                                                }
                                                                
                                                                FVector fDir = UKismetMathLibrary::Subtract_VectorVector(targetAimPos, g_PlayerController->PlayerCameraManager->CameraCache.POV.Location);
                                                                FRotator Yaptr = UKismetMathLibrary::Conv_VectorToRotator(fDir);
                                                                
                                                                FRotator CpYaT = localPlayerController->PlayerCameraManager->CameraCache.POV.Rotation;
                                                                //localController->PlayerCameraManager->CameraCache.POV.Rotation;
                                                                
                                                                
                                                                Yaptr.Pitch -= CpYaT.Pitch;
                                                                Yaptr.Yaw -= CpYaT.Yaw;
                                                                Yaptr.Roll = 0.f;
                                                                NekoHook(Yaptr);
                                                                
                                                                CpYaT.Pitch += Yaptr.Pitch / [[NSUserDefaults standardUserDefaults] integerForKey:@"Aimsmooth"];
                                                                CpYaT.Yaw += Yaptr.Yaw / [[NSUserDefaults standardUserDefaults] integerForKey:@"Aimsmooth"];
                                                                CpYaT.Roll = 0.f;
                                                                
                                                                
                                                                
                                                                localPlayerController->SetControlRotation(CpYaT,"");
                                                                
                                                                //- check if player knocked dwon tragent or not target
                                                                bool AuFirStatus = false;
                                                                if((IsAutofire) && (isAimKnocked)){
                                                                    AuFirStatus = true;
                                                                }else{
                                                                    AuFirStatus = false;
                                                                }
                                                                if (AuFirStatus){
                                                                    if(Distance < autodiss()){
                                                                        if(CurrentWeaponReplicated->CurBulletNumInClip > 1)
                                                                        {
                                                                            // localPlayerController->OnPressFire();
                                                                            // localPlayerController->OnReleaseFire();
                                                                            // autoFIRE(Interval);
                                                                            counter++;
                                                                            if(counter > Interval){
                                                                                localPlayerController->OnPressFire();
                                                                                localPlayerController->OnReleaseFire();
                                                                                counter = 0;
                                                                            }
                                                                        }
                                                                        if(CurrentWeaponReplicated->CurBulletNumInClip <= 1){
                                                                            CurrentWeaponReplicated->StartReload();
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }

                                
                                                                  
               //if (zhuizongshexian){

            //打击部位
//ASTExtraPlayerCharacter *Target = GetTargetByCrossDist();
					//if (Target)
					//{

            //DrawCircle(HUD, points.at(0).X, points.at(0).Y, 6, 100, COLOR_LIME);
  //long PlayerAimLineColor = (1.f, 1.f, 0, 1.f);
					    //FVector Head = Target->GetBonePos("Head", {});
                        //FVector2D HeadPosSC;
                        //if (W2S(Head, (FVector2D *)&HeadPosSC)) {
                       //DrawLine(HUD, {(float) screenWidth / 2,  (float) (screenHeight / 2)}, FVector2D(HeadPosSC.X, HeadPosSC.Y + PlayerAimLineColor),2.0f, COLOR_GREEN);
                        //}


//}
//}
//瞄准线
    if([[NSUserDefaults standardUserDefaults] boolForKey:@"瞄准线"]){
               if ([[NSUserDefaults standardUserDefaults] boolForKey:@"Enable"] || [[NSUserDefaults standardUserDefaults] boolForKey:@"AimBot"] || [[NSUserDefaults standardUserDefaults] boolForKey:@"AimBot1"]){
			        long PlayerAimLineColor = (1.f, 0, 0, 1.f);
            //打击部位
ASTExtraPlayerCharacter *Target = GetTargetByCrossDist();
					if (Target)
					{

					    FVector Head = Target->GetBonePos("Head", {});
                        FVector2D HeadPosSC;
                        if (W2S(Head, (FVector2D *)&HeadPosSC)) {
                       DrawLine(HUD, {(float) screenWidth / 2,  (float) (screenHeight / 2)}, FVector2D(HeadPosSC.X, HeadPosSC.Y + PlayerAimLineColor),1.5f, COLOR_RED);
                        }
}
}}
//
                                if ([[NSUserDefaults standardUserDefaults] boolForKey:@"Enable"] && 追踪状态) {
                    auto WeaponManagerComponent = localPlayer->WeaponManagerComponent;
                    if (WeaponManagerComponent) {
                        auto propSlot = WeaponManagerComponent->GetCurrentUsingPropSlot();
                        if ((int) propSlot.GetValue() >= 1 && (int) propSlot.GetValue() <= 3) {
                            auto CurrentWeaponReplicated = (ASTExtraShootWeapon *) WeaponManagerComponent->CurrentWeaponReplicated;
                            if (CurrentWeaponReplicated) {
                                auto ShootWeaponComponent = CurrentWeaponReplicated->ShootWeaponComponent;
                                if (ShootWeaponComponent) {
                                    int shoot_event_idx = 169;
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
    if([[NSUserDefaults standardUserDefaults] boolForKey:@"自描圈"]){
               if ([[NSUserDefaults standardUserDefaults] boolForKey:@"Enable"] || [[NSUserDefaults standardUserDefaults] boolForKey:@"AimBot"] || [[NSUserDefaults standardUserDefaults] boolForKey:@"AimBot1"]){

    DrawCircle2(HUD, ScreenWidth/2, ScreenHeight/2, preferences.Config.SilentAim.Cross, 100);

                //DrawCircle(HUD, ScreenWidth/2, ScreenHeight/2, preferences.Config.SilentAim.Cross, 100, COLOR_CYAN);
                    }
}


if (子弹信息) { 
    auto WeaponManagerComponent = localPlayer->WeaponManagerComponent;
    if (WeaponManagerComponent) {
    auto CurrentWeaponReplicated = (ASTExtraShootWeapon *) WeaponManagerComponent->CurrentWeaponReplicated;//指针指向类名ASTExtraShootWeapon
    if (CurrentWeaponReplicated) {             

    int CurHP = (int) CurrentWeaponReplicated->CurBulletNumInClip;
    int MaxHP = (int) CurrentWeaponReplicated->CurMaxBulletNumInOneClip;
  // “300，410是周边线条位置”“300，280是线条内填充物位置” 分别是X轴和Y轴 它们的Y轴要相差130才算对齐
    DrawFilledRect1(HUD, {900, 900}, 23, (CurHP * 130 / MaxHP));
    DrawRectangle(HUD, {900, 770}, 23, 130, 1.0f, {1.f, 1.f, 1.f, 1.f});
        }
    }
 }         
    if([[NSUserDefaults standardUserDefaults] boolForKey:@"动态圈"]){
               if ([[NSUserDefaults standardUserDefaults] boolForKey:@"Enable"] || [[NSUserDefaults standardUserDefaults] boolForKey:@"AimBot"] || [[NSUserDefaults standardUserDefaults] boolForKey:@"AimBot1"]){
                DrawCircle(HUD, ScreenWidth/2, ScreenHeight/2, preferences.Config.SilentAim.Cross, 100, COLOR_CYAN);
                    }
}

                        if (ModSkinn){
                       if (DeadBox){
                       std::vector<APlayerTombBox *> TombBox;
                        GetAllActors(TombBox);
                        for (auto actor = TombBox.begin();
                             actor != TombBox.end(); actor++) {
                            auto TombBoxx = *actor;
                            if (TombBoxx && TombBoxx->DamageCauser && TombBoxx->TargetPlayer && g_PlayerController) // Check pointers before dereferencing
                            {
                                if (TombBoxx->DamageCauser->PlayerKey == g_PlayerController->PlayerKey)
                                {
                                    auto PlayerKey = TombBoxx->TargetPlayer->PlayerKey;
                                    if (AlreadyChangedSet.find(PlayerKey) == AlreadyChangedSet.end())
                                    {
                                        if (g_LocalPlayer && g_LocalPlayer->WeaponManagerComponent) // Check pointers before dereferencing
                                        {
                                            auto DeadBoxAvatarCompPtr = (uintptr_t*)((uintptr_t)TombBoxx + 0x668); //DeadBoxAvatarComponent_BP_C* DeadBoxAvatarComponent_BP
                                            if (DeadBoxAvatarCompPtr)
                                            {
                                                auto DeadBoxAvatarComp = *DeadBoxAvatarCompPtr;
                                                auto CurrentWeaponReplicated = g_LocalPlayer->WeaponManagerComponent->CurrentWeaponReplicated;
                                                if (CurrentWeaponReplicated)
                                                {
                                               
                                                        auto Weaponid = g_LocalPlayer->WeaponManagerComponent->CurrentWeaponReplicated->GetWeaponID();
       if (Weaponid == 101004) {
       ChangeItemAVc(DeadBoxAvatarComp, new_Skin.M416_1);
       AlreadyChangedSet.insert(PlayerKey);
       } else if (Weaponid == 1010042) {
       ChangeItemAVc(DeadBoxAvatarComp, new_Skin.M4168);
       AlreadyChangedSet.insert(PlayerKey);
       } else if (Weaponid == 1010043) {
       ChangeItemAVc(DeadBoxAvatarComp, new_Skin.M4169);
       AlreadyChangedSet.insert(PlayerKey);
       } else if (Weaponid == 1010044) {
       ChangeItemAVc(DeadBoxAvatarComp, new_Skin.M4161);
       AlreadyChangedSet.insert(PlayerKey);
       } else if (Weaponid == 1010045) {
       ChangeItemAVc(DeadBoxAvatarComp, new_Skin.M4162);
       AlreadyChangedSet.insert(PlayerKey);
       } else if (Weaponid == 1010046) {
       ChangeItemAVc(DeadBoxAvatarComp, new_Skin.M4163);
       AlreadyChangedSet.insert(PlayerKey);
       } else if (Weaponid == 1010047) {
       ChangeItemAVc(DeadBoxAvatarComp, new_Skin.M4164);
       AlreadyChangedSet.insert(PlayerKey);
       } else if (Weaponid == 101001) {
       ChangeItemAVc(DeadBoxAvatarComp, new_Skin.AKM);
       AlreadyChangedSet.insert(PlayerKey);
       } else if (Weaponid == 1010012) {
       ChangeItemAVc(DeadBoxAvatarComp, new_Skin.AKM1);
       AlreadyChangedSet.insert(PlayerKey);
       } else if (Weaponid == 1010013) {
       ChangeItemAVc(DeadBoxAvatarComp, new_Skin.AKM2);
       AlreadyChangedSet.insert(PlayerKey);
       } else if (Weaponid == 1010014) {
       ChangeItemAVc(DeadBoxAvatarComp, new_Skin.AKM3);
       AlreadyChangedSet.insert(PlayerKey);
       } else if (Weaponid == 1010015) {
       ChangeItemAVc(DeadBoxAvatarComp, new_Skin.AKM4);
       AlreadyChangedSet.insert(PlayerKey);
       } else if (Weaponid == 1010016) {
       ChangeItemAVc(DeadBoxAvatarComp, new_Skin.AKM5);
       AlreadyChangedSet.insert(PlayerKey);
       } else if (Weaponid == 1010017) {
       ChangeItemAVc(DeadBoxAvatarComp, new_Skin.AKM6);
       AlreadyChangedSet.insert(PlayerKey);
       } else if (Weaponid == 101003) {
       ChangeItemAVc(DeadBoxAvatarComp, new_Skin.Scar);
       AlreadyChangedSet.insert(PlayerKey);
       } else if (Weaponid == 1010032) {
       ChangeItemAVc(DeadBoxAvatarComp, new_Skin.Scar1);
       AlreadyChangedSet.insert(PlayerKey);
       } else if (Weaponid == 1010033) {
       ChangeItemAVc(DeadBoxAvatarComp, new_Skin.Scar2);
       AlreadyChangedSet.insert(PlayerKey);
       } else if (Weaponid == 1010034) {
       ChangeItemAVc(DeadBoxAvatarComp, new_Skin.Scar3);
       AlreadyChangedSet.insert(PlayerKey);
       } else if (Weaponid == 1010035) {
       ChangeItemAVc(DeadBoxAvatarComp, new_Skin.Scar4);
       AlreadyChangedSet.insert(PlayerKey);
       } else if (Weaponid == 101008) {
       ChangeItemAVc(DeadBoxAvatarComp, new_Skin.M762);
       AlreadyChangedSet.insert(PlayerKey);
       } else if (Weaponid == 1010082) {
       ChangeItemAVc(DeadBoxAvatarComp, new_Skin.M7621);
       AlreadyChangedSet.insert(PlayerKey);
       } else if (Weaponid == 1010083) {
       ChangeItemAVc(DeadBoxAvatarComp, new_Skin.M7622);
       AlreadyChangedSet.insert(PlayerKey);
       } else if (Weaponid == 1010084) {
       ChangeItemAVc(DeadBoxAvatarComp, new_Skin.M7623);
       AlreadyChangedSet.insert(PlayerKey);
       } else if (Weaponid == 1010085) {
       ChangeItemAVc(DeadBoxAvatarComp, new_Skin.M7624);
       AlreadyChangedSet.insert(PlayerKey);
       } else if (Weaponid == 1010086) {
       ChangeItemAVc(DeadBoxAvatarComp, new_Skin.M7625);
       AlreadyChangedSet.insert(PlayerKey);
       } else if (Weaponid == 1010087) {
       ChangeItemAVc(DeadBoxAvatarComp, new_Skin.M7626);
       AlreadyChangedSet.insert(PlayerKey);
       } else if (Weaponid == 105010) {
       ChangeItemAVc(DeadBoxAvatarComp, new_Skin.MG3);
       AlreadyChangedSet.insert(PlayerKey);
       } else if (Weaponid == 102002) {
       ChangeItemAVc(DeadBoxAvatarComp, new_Skin.UMP);
       AlreadyChangedSet.insert(PlayerKey);
       } else if (Weaponid == 101006) {
       ChangeItemAVc(DeadBoxAvatarComp, new_Skin.AUG);
       AlreadyChangedSet.insert(PlayerKey);
       } else if (Weaponid == 103007) {
       ChangeItemAVc(DeadBoxAvatarComp, new_Skin.MK14);
       AlreadyChangedSet.insert(PlayerKey);
       } else if (Weaponid == 1030075) {
       ChangeItemAVc(DeadBoxAvatarComp, new_Skin.MK145);
       AlreadyChangedSet.insert(PlayerKey);
       } else if (Weaponid == 1030074) {
       ChangeItemAVc(DeadBoxAvatarComp, new_Skin.MK146);
       AlreadyChangedSet.insert(PlayerKey);
       } else if (Weaponid == 1030072) {
       ChangeItemAVc(DeadBoxAvatarComp, new_Skin.MK147);
       AlreadyChangedSet.insert(PlayerKey);
       } else if (Weaponid == 1030073) {
       ChangeItemAVc(DeadBoxAvatarComp, new_Skin.MK148);
       AlreadyChangedSet.insert(PlayerKey);
       } else if (Weaponid == 1030076) {
       ChangeItemAVc(DeadBoxAvatarComp, new_Skin.MK149);
       AlreadyChangedSet.insert(PlayerKey);
       } else if (Weaponid == 1030077) {
       ChangeItemAVc(DeadBoxAvatarComp, new_Skin.MK140);
       AlreadyChangedSet.insert(PlayerKey);
       } else if (Weaponid == 101005) {
       ChangeItemAVc(DeadBoxAvatarComp, new_Skin.Groza);
       AlreadyChangedSet.insert(PlayerKey);
       }
                                                }
                                            }
                                        }
                                    }
                                }
                                
                            }
                            
                        }
        }
                    
        
     if (localPlayer->WeaponManagerComponent != 0) {
     if (localPlayer->WeaponManagerComponent->CurrentWeaponReplicated != 0 ) {
         int weapowep = localPlayer->WeaponManagerComponent->CurrentWeaponReplicated->GetWeaponID();
        auto currentTime = std::chrono::steady_clock::now();
         auto landchud = localPlayer->WeaponManagerComponent->CurrentWeaponReplicated->synData;
         auto timeDiff = std::chrono::duration_cast<std::chrono::milliseconds>(currentTime - lastWeaponChangeTime).count();
         if (timeDiff > 1000) {
         for (int j = 0; j < landchud.Num(); j++) {
             auto& weaponInfo = landchud[j];
             auto weaponid = weaponInfo.DefineID.TypeSpecificID;
             if (weaponid != 0)
             {
                 if (preferences.AKM && weapowep == 101001){
                 for (int i = 0; i < sizeof(akmv) / sizeof(akmv[0]); i++) {
                 if (weaponid == akmv[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.AKM;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(akmmag) / sizeof(akmmag[0]); i++) {
                 if (weaponid == akmmag[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.AKM_Mag;
                     break;
                  }
                 }
                }
                 if (preferences.AKM1 && weapowep == 1010012){
                 for (int i = 0; i < sizeof(akm1) / sizeof(akm1[0]); i++) {
                 if (weaponid == akm1[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.AKM1;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(akmmag) / sizeof(akmmag[0]); i++) {
                 if (weaponid == akmmag[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.AKM_Mag;
                     break;
                  }
                 }
                }
                 if (preferences.AKM2 && weapowep == 1010013){
                 for (int i = 0; i < sizeof(akm2) / sizeof(akm2[0]); i++) {
                 if (weaponid == akm2[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.AKM2;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(akmmag) / sizeof(akmmag[0]); i++) {
                 if (weaponid == akmmag[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.AKM_Mag;
                     break;
                  }
                 }
                }
                 if (preferences.AKM3 && weapowep == 1010014){
                 for (int i = 0; i < sizeof(akm3) / sizeof(akm3[0]); i++) {
                 if (weaponid == akm3[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.AKM1;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(akmmag) / sizeof(akmmag[0]); i++) {
                 if (weaponid == akmmag[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.AKM_Mag;
                     break;
                  }
                 }
                }
                 if (preferences.AKM4 && weapowep == 1010015){
                 for (int i = 0; i < sizeof(akm4) / sizeof(akm4[0]); i++) {
                 if (weaponid == akm4[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.AKM4;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(akmmag) / sizeof(akmmag[0]); i++) {
                 if (weaponid == akmmag[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.AKM_Mag;
                     break;
                  }
                 }
                }
                 if (preferences.AKM5 && weapowep == 1010016){
                 for (int i = 0; i < sizeof(akm5) / sizeof(akm5[0]); i++) {
                 if (weaponid == akm5[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.AKM5;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(akmmag) / sizeof(akmmag[0]); i++) {
                 if (weaponid == akmmag[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.AKM_Mag;
                     break;
                  }
                 }
                }
                 if (preferences.AKM6 && weapowep == 1010017){
                 for (int i = 0; i < sizeof(akm6) / sizeof(akm6[0]); i++) {
                 if (weaponid == akm6[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.AKM6;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(akmmag) / sizeof(akmmag[0]); i++) {
                 if (weaponid == akmmag[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.AKM_Mag;
                     break;
                  }
                 }
                }
                if (preferences.KAR98 && weapowep == 103001){
                 for (int i = 0; i < sizeof(kar) / sizeof(kar[0]); i++) {
                 if (weaponid == kar[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.K98;
                     break;
                  }
                 }
                }
                if (preferences.KAR981 && weapowep == 1030012){
                 for (int i = 0; i < sizeof(kar1) / sizeof(kar1[0]); i++) {
                 if (weaponid == kar1[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.K981;
                     break;
                  }
                 }
                }
                if (preferences.KAR982 && weapowep == 1030013){
                 for (int i = 0; i < sizeof(kar2) / sizeof(kar2[0]); i++) {
                 if (weaponid == kar2[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.K982;
                     break;
                  }
                 }
                }
                if (preferences.KAR983 && weapowep == 1030014){
                 for (int i = 0; i < sizeof(kar3) / sizeof(kar3[0]); i++) {
                 if (weaponid == kar3[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.K983;
                     break;
                  }
                 }
                }
                if (preferences.KAR984 && weapowep == 1030015){
                 for (int i = 0; i < sizeof(kar4) / sizeof(kar4[0]); i++) {
                 if (weaponid == kar4[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.K984;
                     break;
                  }
                 }
                }
                if (preferences.KAR985 && weapowep == 1030016){
                 for (int i = 0; i < sizeof(kar5) / sizeof(kar5[0]); i++) {
                 if (weaponid == kar5[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.K985;
                     break;
                  }
                 }
                }
                if (preferences.KAR986 && weapowep == 1030017){
                 for (int i = 0; i < sizeof(kar6) / sizeof(kar6[0]); i++) {
                 if (weaponid == kar6[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.K986;
                     break;
                  }
                 }
                }
                if (preferences.M24 && weapowep == 103002){
                 for (int i = 0; i < sizeof(m24) / sizeof(m24[0]); i++) {
                 if (weaponid == m24[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M24;
                     break;
                  }
                 }
                }
                if (preferences.M241 && weapowep == 1030022){
                 for (int i = 0; i < sizeof(m241) / sizeof(m241[0]); i++) {
                 if (weaponid == m241[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M241;
                     break;
                  }
                 }
                }
                if (preferences.M242 && weapowep == 1030023){
                 for (int i = 0; i < sizeof(m242) / sizeof(m242[0]); i++) {
                 if (weaponid == m242[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M242;
                     break;
                  }
                 }
                }
                if (preferences.M243 && weapowep == 1030024){
                 for (int i = 0; i < sizeof(m243) / sizeof(m243[0]); i++) {
                 if (weaponid == m243[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M243;
                     break;
                  }
                 }
                }
                if (preferences.M244 && weapowep == 1030025){
                 for (int i = 0; i < sizeof(m244) / sizeof(m244[0]); i++) {
                 if (weaponid == m244[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M244;
                     break;
                  }
                 }
                }
                if (preferences.M245 && weapowep == 1030026){
                 for (int i = 0; i < sizeof(m245) / sizeof(m245[0]); i++) {
                 if (weaponid == m245[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M245;
                     break;
                  }
                 }
                }
                if (preferences.M246 && weapowep == 1030027){
                 for (int i = 0; i < sizeof(m246) / sizeof(m246[0]); i++) {
                 if (weaponid == m246[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M246;
                     break;
                  }
                 }
                }
                if (preferences.AWM && weapowep == 103003){
                 for (int i = 0; i < sizeof(awm) / sizeof(awm[0]); i++) {
                 if (weaponid == awm[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.AWM;
                     break;
                  }
                 }
                }
                if (preferences.AWM1 && weapowep == 1030032){
                 for (int i = 0; i < sizeof(awm1) / sizeof(awm1[0]); i++) {
                 if (weaponid == awm1[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.AWM1;
                     break;
                  }
                 }
                }
                if (preferences.AWM2 && weapowep == 1030033){
                 for (int i = 0; i < sizeof(awm2) / sizeof(awm2[0]); i++) {
                 if (weaponid == awm2[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.AWM2;
                     break;
                  }
                 }
                }
                if (preferences.AWM3 && weapowep == 1030034){
                 for (int i = 0; i < sizeof(awm3) / sizeof(awm3[0]); i++) {
                 if (weaponid == awm3[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.AWM3;
                     break;
                  }
                 }
                }
                if (preferences.AWM4 && weapowep == 1030035){
                 for (int i = 0; i < sizeof(awm4) / sizeof(awm4[0]); i++) {
                 if (weaponid == awm4[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.AWM4;
                     break;
                  }
                 }
                }
                if (preferences.AWM5 && weapowep == 1030036){
                 for (int i = 0; i < sizeof(awm5) / sizeof(awm5[0]); i++) {
                 if (weaponid == awm5[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.AWM5;
                     break;
                  }
                 }
                }
                if (preferences.AWM6 && weapowep == 1030037){
                 for (int i = 0; i < sizeof(awm6) / sizeof(awm6[0]); i++) {
                 if (weaponid == awm6[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.AWM6;
                     break;
                  }
                 }
                }
                
                
                if (preferences.TOMMY && weapowep == 102004){
                 for (int i = 0; i < sizeof(tommy) / sizeof(tommy[0]); i++) {
                 if (weaponid == tommy[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.Thompson;
                     break;
                  }
                 }
                }
                if (preferences.ACE32 && weapowep == 101102){
                 for (int i = 0; i < sizeof(ace32) / sizeof(ace32[0]); i++) {
                 if (weaponid == ace32[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.ACE32;
                     break;
                  }
                 }
                }
                if (preferences.ACE321 && weapowep == 1011022){
                 for (int i = 0; i < sizeof(ace321) / sizeof(ace321[0]); i++) {
                 if (weaponid == ace321[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.ACE321;
                     break;
                  }
                 }
                }
                if (preferences.ACE322 && weapowep == 1011023){
                 for (int i = 0; i < sizeof(ace322) / sizeof(ace322[0]); i++) {
                 if (weaponid == ace322[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.ACE322;
                     break;
                  }
                 }
                }
                if (preferences.ACE323 && weapowep == 1011024){
                 for (int i = 0; i < sizeof(ace323) / sizeof(ace323[0]); i++) {
                 if (weaponid == ace323[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.ACE323;
                     break;
                  }
                 }
                }
                if (preferences.ACE324 && weapowep == 1011025){
                 for (int i = 0; i < sizeof(ace324) / sizeof(ace324[0]); i++) {
                 if (weaponid == ace324[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.ACE324;
                     break;
                  }
                 }
                }
                if (preferences.ACE325 && weapowep == 1011026){
                 for (int i = 0; i < sizeof(ace325) / sizeof(ace325[0]); i++) {
                 if (weaponid == ace325[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.ACE325;
                     break;
                  }
                 }
                }
                if (preferences.ACE326 && weapowep == 1011027){
                 for (int i = 0; i < sizeof(ace326) / sizeof(ace326[0]); i++) {
                 if (weaponid == ace326[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.ACE326;
                     break;
                  }
                 }
                }
                if (preferences.MK145 && weapowep == 1030075){
                 for (int i = 0; i < sizeof(mk145) / sizeof(mk145[0]); i++) {
                 if (weaponid == mk145[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.MK145;
                     break;
                 }
                }
                for (int i = 0; i < sizeof(longyin8888) / sizeof(longyin8888[0]); i++) {
                 if (weaponid == longyin8888[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.longyin_x8888;
                     break;
                 }
                }
                for (int i = 0; i < sizeof(longyin1111) / sizeof(longyin1111[0]); i++) {
                 if (weaponid == longyin1111[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.longyin_x1111;
                     break;
                 }
                }
                for (int i = 0; i < sizeof(longyin2222) / sizeof(longyin2222[0]); i++) {
                 if (weaponid == longyin2222[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.longyin_x2222;
                     break;
                 }
                }
                for (int i = 0; i < sizeof(longyin3333) / sizeof(longyin3333[0]); i++) {
                 if (weaponid == longyin3333[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.longyin_x3333;
                     break;
                 }
                }
                for (int i = 0; i < sizeof(longyin4444) / sizeof(longyin4444[0]); i++) {
                 if (weaponid == longyin4444[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.longyin_x4444;
                     break;
                 }
                }
                for (int i = 0; i < sizeof(longyin6666) / sizeof(longyin6666[0]); i++) {
                 if (weaponid == longyin6666[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.longyin_x6666;
                     break;
                  }
                 }
                for (int i = 0; i < sizeof(tuosb) / sizeof(tuosb[0]); i++) {
                 if (weaponid == tuosb[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.tuosb;
                     break;
                  }
                 }
                for (int i = 0; i < sizeof(tuosb1) / sizeof(tuosb1[0]); i++) {
                 if (weaponid == tuosb1[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.tuosb1;
                     break;
                  }
                 }
                for (int i = 0; i < sizeof(tuosb2) / sizeof(tuosb2[0]); i++) {
                 if (weaponid == tuosb2[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.tuosb2;
                     break;
                  }
                 }
                for (int i = 0; i < sizeof(tuosb3) / sizeof(tuosb3[0]); i++) {
                 if (weaponid == tuosb3[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.tuosb3;
                     break;
                  }
                 }
                for (int i = 0; i < sizeof(tuosb4) / sizeof(tuosb4[0]); i++) {
                 if (weaponid == tuosb4[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.tuosb4;
                     break;
                  }
                 }
                }
                if (preferences.MK14 && weapowep == 103007){
                 for (int i = 0; i < sizeof(mk14) / sizeof(mk14[0]); i++) {
                 if (weaponid == mk14[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.MK14;
                     break;
                 }
                }
                for (int i = 0; i < sizeof(longyin8888) / sizeof(longyin8888[0]); i++) {
                 if (weaponid == longyin8888[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.longyin_x8888;
                     break;
                 }
                }
                for (int i = 0; i < sizeof(longyin1111) / sizeof(longyin1111[0]); i++) {
                 if (weaponid == longyin1111[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.longyin_x1111;
                     break;
                 }
                }
                for (int i = 0; i < sizeof(longyin2222) / sizeof(longyin2222[0]); i++) {
                 if (weaponid == longyin2222[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.longyin_x2222;
                     break;
                 }
                }
                for (int i = 0; i < sizeof(longyin3333) / sizeof(longyin3333[0]); i++) {
                 if (weaponid == longyin3333[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.longyin_x3333;
                     break;
                 }
                }
                for (int i = 0; i < sizeof(longyin4444) / sizeof(longyin4444[0]); i++) {
                 if (weaponid == longyin4444[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.longyin_x4444;
                     break;
                 }
                }
                for (int i = 0; i < sizeof(longyin6666) / sizeof(longyin6666[0]); i++) {
                 if (weaponid == longyin6666[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.longyin_x6666;
                     break;
                  }
                 }
                for (int i = 0; i < sizeof(tuosb) / sizeof(tuosb[0]); i++) {
                 if (weaponid == tuosb[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.tuosb;
                     break;
                  }
                 }
                for (int i = 0; i < sizeof(tuosb1) / sizeof(tuosb1[0]); i++) {
                 if (weaponid == tuosb1[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.tuosb1;
                     break;
                  }
                 }
                for (int i = 0; i < sizeof(tuosb2) / sizeof(tuosb2[0]); i++) {
                 if (weaponid == tuosb2[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.tuosb2;
                     break;
                  }
                 }
                for (int i = 0; i < sizeof(tuosb3) / sizeof(tuosb3[0]); i++) {
                 if (weaponid == tuosb3[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.tuosb3;
                     break;
                  }
                 }
                for (int i = 0; i < sizeof(tuosb4) / sizeof(tuosb4[0]); i++) {
                 if (weaponid == tuosb4[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.tuosb4;
                     break;
                  }
                 }
                }
                if (preferences.MK147 && weapowep == 1030072){
                 for (int i = 0; i < sizeof(mk147) / sizeof(mk147[0]); i++) {
                 if (weaponid == mk147[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.MK147;
                     break;
                 }
                }
                for (int i = 0; i < sizeof(longyin8888) / sizeof(longyin8888[0]); i++) {
                 if (weaponid == longyin8888[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.longyin_x8888;
                     break;
                 }
                }
                for (int i = 0; i < sizeof(longyin1111) / sizeof(longyin1111[0]); i++) {
                 if (weaponid == longyin1111[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.longyin_x1111;
                     break;
                 }
                }
                for (int i = 0; i < sizeof(longyin2222) / sizeof(longyin2222[0]); i++) {
                 if (weaponid == longyin2222[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.longyin_x2222;
                     break;
                 }
                }
                for (int i = 0; i < sizeof(longyin3333) / sizeof(longyin3333[0]); i++) {
                 if (weaponid == longyin3333[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.longyin_x3333;
                     break;
                 }
                }
                for (int i = 0; i < sizeof(longyin4444) / sizeof(longyin4444[0]); i++) {
                 if (weaponid == longyin4444[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.longyin_x4444;
                     break;
                 }
                }
                for (int i = 0; i < sizeof(longyin6666) / sizeof(longyin6666[0]); i++) {
                 if (weaponid == longyin6666[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.longyin_x6666;
                     break;
                  }
                 }
                for (int i = 0; i < sizeof(tuosb) / sizeof(tuosb[0]); i++) {
                 if (weaponid == tuosb[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.tuosb;
                     break;
                  }
                 }
                for (int i = 0; i < sizeof(tuosb1) / sizeof(tuosb1[0]); i++) {
                 if (weaponid == tuosb1[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.tuosb1;
                     break;
                  }
                 }
                for (int i = 0; i < sizeof(tuosb2) / sizeof(tuosb2[0]); i++) {
                 if (weaponid == tuosb2[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.tuosb2;
                     break;
                  }
                 }
                for (int i = 0; i < sizeof(tuosb3) / sizeof(tuosb3[0]); i++) {
                 if (weaponid == tuosb3[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.tuosb3;
                     break;
                  }
                 }
                for (int i = 0; i < sizeof(tuosb4) / sizeof(tuosb4[0]); i++) {
                 if (weaponid == tuosb4[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.tuosb4;
                     break;
                  }
                 }
                }
                if (preferences.MK146 && weapowep == 1030074){
                 for (int i = 0; i < sizeof(mk146) / sizeof(mk146[0]); i++) {
                 if (weaponid == mk146[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.MK146;
                     break;
                 }
                }
                for (int i = 0; i < sizeof(longyin8888) / sizeof(longyin8888[0]); i++) {
                 if (weaponid == longyin8888[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.longyin_x8888;
                     break;
                 }
                }
                for (int i = 0; i < sizeof(longyin1111) / sizeof(longyin1111[0]); i++) {
                 if (weaponid == longyin1111[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.longyin_x1111;
                     break;
                 }
                }
                for (int i = 0; i < sizeof(longyin2222) / sizeof(longyin2222[0]); i++) {
                 if (weaponid == longyin2222[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.longyin_x2222;
                     break;
                 }
                }
                for (int i = 0; i < sizeof(longyin3333) / sizeof(longyin3333[0]); i++) {
                 if (weaponid == longyin3333[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.longyin_x3333;
                     break;
                 }
                }
                for (int i = 0; i < sizeof(longyin4444) / sizeof(longyin4444[0]); i++) {
                 if (weaponid == longyin4444[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.longyin_x4444;
                     break;
                 }
                }
                for (int i = 0; i < sizeof(longyin6666) / sizeof(longyin6666[0]); i++) {
                 if (weaponid == longyin6666[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.longyin_x6666;
                     break;
                  }
                 }
                for (int i = 0; i < sizeof(tuosb) / sizeof(tuosb[0]); i++) {
                 if (weaponid == tuosb[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.tuosb;
                     break;
                  }
                 }
                for (int i = 0; i < sizeof(tuosb1) / sizeof(tuosb1[0]); i++) {
                 if (weaponid == tuosb1[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.tuosb1;
                     break;
                  }
                 }
                for (int i = 0; i < sizeof(tuosb2) / sizeof(tuosb2[0]); i++) {
                 if (weaponid == tuosb2[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.tuosb2;
                     break;
                  }
                 }
                for (int i = 0; i < sizeof(tuosb3) / sizeof(tuosb3[0]); i++) {
                 if (weaponid == tuosb3[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.tuosb3;
                     break;
                  }
                 }
                for (int i = 0; i < sizeof(tuosb4) / sizeof(tuosb4[0]); i++) {
                 if (weaponid == tuosb4[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.tuosb4;
                     break;
                  }
                 }
                }
                if (preferences.MK148 && weapowep == 1030073){
                 for (int i = 0; i < sizeof(mk148) / sizeof(mk148[0]); i++) {
                 if (weaponid == mk148[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.MK148;
                     break;
                 }
                }
                for (int i = 0; i < sizeof(longyin8888) / sizeof(longyin8888[0]); i++) {
                 if (weaponid == longyin8888[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.longyin_x8888;
                     break;
                 }
                }
                for (int i = 0; i < sizeof(longyin1111) / sizeof(longyin1111[0]); i++) {
                 if (weaponid == longyin1111[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.longyin_x1111;
                     break;
                 }
                }
                for (int i = 0; i < sizeof(longyin2222) / sizeof(longyin2222[0]); i++) {
                 if (weaponid == longyin2222[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.longyin_x2222;
                     break;
                 }
                }
                for (int i = 0; i < sizeof(longyin3333) / sizeof(longyin3333[0]); i++) {
                 if (weaponid == longyin3333[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.longyin_x3333;
                     break;
                 }
                }
                for (int i = 0; i < sizeof(longyin4444) / sizeof(longyin4444[0]); i++) {
                 if (weaponid == longyin4444[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.longyin_x4444;
                     break;
                 }
                }
                for (int i = 0; i < sizeof(longyin6666) / sizeof(longyin6666[0]); i++) {
                 if (weaponid == longyin6666[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.longyin_x6666;
                     break;
                  }
                 }
                for (int i = 0; i < sizeof(tuosb) / sizeof(tuosb[0]); i++) {
                 if (weaponid == tuosb[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.tuosb;
                     break;
                  }
                 }
                for (int i = 0; i < sizeof(tuosb1) / sizeof(tuosb1[0]); i++) {
                 if (weaponid == tuosb1[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.tuosb1;
                     break;
                  }
                 }
                for (int i = 0; i < sizeof(tuosb2) / sizeof(tuosb2[0]); i++) {
                 if (weaponid == tuosb2[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.tuosb2;
                     break;
                  }
                 }
                for (int i = 0; i < sizeof(tuosb3) / sizeof(tuosb3[0]); i++) {
                 if (weaponid == tuosb3[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.tuosb3;
                     break;
                  }
                 }
                for (int i = 0; i < sizeof(tuosb4) / sizeof(tuosb4[0]); i++) {
                 if (weaponid == tuosb4[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.tuosb4;
                     break;
                  }
                 }
                }
                if (preferences.mg31 && weapowep == 1050105){
                 for (int i = 0; i < sizeof(mg311) / sizeof(mg311[0]); i++) {
                 if (weaponid == mg311[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.mg31;
                     break;
                  }
                 }
                }
                if (preferences.mg32 && weapowep == 1050106){
                 for (int i = 0; i < sizeof(mg322) / sizeof(mg322[0]); i++) {
                 if (weaponid == mg322[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.mg32;
                     break;
                  }
                 }
                }
                if (preferences.mg33 && weapowep == 1050107){
                 for (int i = 0; i < sizeof(mg333) / sizeof(mg333[0]); i++) {
                 if (weaponid == mg333[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.mg33;
                     break;
                  }
                 }
                }
                if (preferences.mg34 && weapowep == 1050102){
                 for (int i = 0; i < sizeof(mg344) / sizeof(mg344[0]); i++) {
                 if (weaponid == mg344[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.mg34;
                     break;
                  }
                 }
                }
                if (preferences.mg35 && weapowep == 1050103){
                 for (int i = 0; i < sizeof(mg355) / sizeof(mg355[0]); i++) {
                 if (weaponid == mg355[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.mg35;
                     break;
                  }
                 }
                }
                if (preferences.mg36 && weapowep == 1050104){
                 for (int i = 0; i < sizeof(mg366) / sizeof(mg366[0]); i++) {
                 if (weaponid == mg366[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.mg36;
                     break;
                  }
                 }
                }
                if (preferences.P90 && weapowep == 102105){
                 for (int i = 0; i < sizeof(p90) / sizeof(p90[0]); i++) {
                 if (weaponid == p90[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.P90;
                     break;
                  }
                 }
                }
                if (preferences.P901 && weapowep == 1021052){
                 for (int i = 0; i < sizeof(p901) / sizeof(p901[0]); i++) {
                 if (weaponid == p901[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.P901;
                     break;
                  }
                 }
                }
                if (preferences.P902 && weapowep == 1021053){
                 for (int i = 0; i < sizeof(p902) / sizeof(p902[0]); i++) {
                 if (weaponid == p902[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.P902;
                     break;
                  }
                 }
                }
                if (preferences.P903 && weapowep == 1021054){
                 for (int i = 0; i < sizeof(p903) / sizeof(p903[0]); i++) {
                 if (weaponid == p903[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.P903;
                     break;
                  }
                 }
                }
                if (preferences.P904 && weapowep == 1021055){
                 for (int i = 0; i < sizeof(p904) / sizeof(p904[0]); i++) {
                 if (weaponid == p904[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.P904;
                     break;
                  }
                 }
                }
                if (preferences.P905 && weapowep == 1021056){
                 for (int i = 0; i < sizeof(p905) / sizeof(p905[0]); i++) {
                 if (weaponid == p905[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.P905;
                     break;
                  }
                 }
                }
                if (preferences.P906 && weapowep == 1021057){
                 for (int i = 0; i < sizeof(p906) / sizeof(p906[0]); i++) {
                 if (weaponid == p906[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.P906;
                     break;
                  }
                 }
                }
                
                if (preferences.BIZON && weapowep == 102005){
                 for (int i = 0; i < sizeof(bizon) / sizeof(bizon[0]); i++) {
                 if (weaponid == bizon[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.Bizon;
                     break;
                  }
                 }
                }
                
                if (preferences.VECTOR && weapowep == 102003){
                 for (int i = 0; i < sizeof(vectorr) / sizeof(vectorr[0]); i++) {
                 if (weaponid == vectorr[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.Vector;
                     break;
                  }
                 }
                }
                if (preferences.UMP && weapowep == 102002){
                 for (int i = 0; i < sizeof(ump) / sizeof(ump[0]); i++) {
                 if (weaponid == ump[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.UMP;
                     break;
                  }
                 }
                }
                if (preferences.UMP1 && weapowep == 1020022){
                 for (int i = 0; i < sizeof(ump1) / sizeof(ump1[0]); i++) {
                 if (weaponid == ump1[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.UMP1;
                     break;
                  }
                 }
                }
                if (preferences.UMP2 && weapowep == 1020023){
                 for (int i = 0; i < sizeof(ump2) / sizeof(ump2[0]); i++) {
                 if (weaponid == ump2[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.UMP2;
                     break;
                  }
                 }
                }
                if (preferences.UMP3 && weapowep == 1020024){
                 for (int i = 0; i < sizeof(ump3) / sizeof(ump3[0]); i++) {
                 if (weaponid == ump3[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.UMP3;
                     break;
                  }
                 }
                }
                if (preferences.UMP4 && weapowep == 1020025){
                 for (int i = 0; i < sizeof(ump4) / sizeof(ump4[0]); i++) {
                 if (weaponid == ump4[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.UMP4;
                     break;
                  }
                 }
                }
                if (preferences.UMP5 && weapowep == 1020026){
                 for (int i = 0; i < sizeof(ump5) / sizeof(ump5[0]); i++) {
                 if (weaponid == ump5[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.UMP5;
                     break;
                  }
                 }
                }
                if (preferences.UMP6 && weapowep == 1020027){
                 for (int i = 0; i < sizeof(ump6) / sizeof(ump6[0]); i++) {
                 if (weaponid == ump6[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.UMP6;
                     break;
                  }
                 }
                }
                if (preferences.UZI && weapowep == 102001){
                 for (int i = 0; i < sizeof(uzi) / sizeof(uzi[0]); i++) {
                 if (weaponid == uzi[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.UZI;
                     break;
                  }
                 }
                }
                if (preferences.UZI1 && weapowep == 1020012){
                 for (int i = 0; i < sizeof(uzi1) / sizeof(uzi1[0]); i++) {
                 if (weaponid == uzi1[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.UZI1;
                     break;
                  }
                 }
                }
                if (preferences.UZI2 && weapowep == 1020013){
                 for (int i = 0; i < sizeof(uzi2) / sizeof(uzi2[0]); i++) {
                 if (weaponid == uzi2[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.UZI2;
                     break;
                  }
                 }
                }
                if (preferences.UZI3 && weapowep == 1020014){
                 for (int i = 0; i < sizeof(uzi3) / sizeof(uzi3[0]); i++) {
                 if (weaponid == uzi3[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.UZI3;
                     break;
                  }
                 }
                }
                if (preferences.UZI4 && weapowep == 1020015){
                 for (int i = 0; i < sizeof(uzi4) / sizeof(uzi4[0]); i++) {
                 if (weaponid == uzi4[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.UZI4;
                     break;
                  }
                 }
                }
                if (preferences.UZI5 && weapowep == 1020016){
                 for (int i = 0; i < sizeof(uzi5) / sizeof(uzi5[0]); i++) {
                 if (weaponid == uzi5[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.UZI5;
                     break;
                  }
                 }
                }
                if (preferences.UZI6 && weapowep == 1020017){
                 for (int i = 0; i < sizeof(uzi6) / sizeof(uzi6[0]); i++) {
                 if (weaponid == uzi6[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.UZI6;
                     break;
                  }
                 }
                }
                if (preferences.M16 && weapowep == 101002){
                 for (int i = 0; i < sizeof(m16) / sizeof(m16[0]); i++) {
                 if (weaponid == m16[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M16A4;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(m16s) / sizeof(m16s[0]); i++) {
                 if (weaponid == m16s[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M16A4_Stock;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(m16mag) / sizeof(m16mag[0]); i++) {
                 if (weaponid == m16mag[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M16A4_Mag;
                     break;
                  }
                 }
                }
                if (preferences.M161 && weapowep == 1010022){
                 for (int i = 0; i < sizeof(m161) / sizeof(m161[0]); i++) {
                 if (weaponid == m161[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M16A41;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(m16s) / sizeof(m16s[0]); i++) {
                 if (weaponid == m16s[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M16A4_Stock;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(m16mag) / sizeof(m16mag[0]); i++) {
                 if (weaponid == m16mag[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M16A4_Mag;
                     break;
                  }
                 }
                }
                if (preferences.M162 && weapowep == 1010023){
                 for (int i = 0; i < sizeof(m162) / sizeof(m162[0]); i++) {
                 if (weaponid == m162[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M16A42;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(m16s) / sizeof(m16s[0]); i++) {
                 if (weaponid == m16s[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M16A4_Stock;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(m16mag) / sizeof(m16mag[0]); i++) {
                 if (weaponid == m16mag[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M16A4_Mag;
                     break;
                  }
                 }
                }
                if (preferences.M163 && weapowep == 1010024){
                 for (int i = 0; i < sizeof(m163) / sizeof(m163[0]); i++) {
                 if (weaponid == m163[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M16A43;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(m16s) / sizeof(m16s[0]); i++) {
                 if (weaponid == m16s[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M16A4_Stock;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(m16mag) / sizeof(m16mag[0]); i++) {
                 if (weaponid == m16mag[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M16A4_Mag;
                     break;
                  }
                 }
                }
                if (preferences.M164 && weapowep == 1010025){
                 for (int i = 0; i < sizeof(m164) / sizeof(m164[0]); i++) {
                 if (weaponid == m164[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M16A44;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(m16s) / sizeof(m16s[0]); i++) {
                 if (weaponid == m16s[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M16A4_Stock;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(m16mag) / sizeof(m16mag[0]); i++) {
                 if (weaponid == m16mag[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M16A4_Mag;
                     break;
                  }
                 }
                }
                if (preferences.M165 && weapowep == 1010026){
                 for (int i = 0; i < sizeof(m165) / sizeof(m165[0]); i++) {
                 if (weaponid == m165[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M16A45;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(m16s) / sizeof(m16s[0]); i++) {
                 if (weaponid == m16s[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M16A4_Stock;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(m16mag) / sizeof(m16mag[0]); i++) {
                 if (weaponid == m16mag[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M16A4_Mag;
                     break;
                  }
                 }
                }
                if (preferences.M166 && weapowep == 1010027){
                 for (int i = 0; i < sizeof(m166) / sizeof(m166[0]); i++) {
                 if (weaponid == m166[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M16A46;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(m16s) / sizeof(m16s[0]); i++) {
                 if (weaponid == m16s[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M16A4_Stock;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(m16mag) / sizeof(m16mag[0]); i++) {
                 if (weaponid == m16mag[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M16A4_Mag;
                     break;
                  }
                 }
                }
                if (preferences.PAN && weapowep == 108004){
                 for (int i = 0; i < sizeof(pan) / sizeof(pan[0]); i++) {
                 if (weaponid == pan[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.Pan;
                     break;
                  }
                 }
                }
                if (preferences.AUG && weapowep == 101006){
                 for (int i = 0; i < sizeof(aug) / sizeof(aug[0]); i++) {
                 if (weaponid == aug[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.AUG;
                     break;
                  }
                 }
                }
                if (preferences.AUG1 && weapowep == 1010062){
                 for (int i = 0; i < sizeof(aug1) / sizeof(aug1[0]); i++) {
                 if (weaponid == aug1[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.AUG1;
                     break;
                  }
                 }
                }
                if (preferences.AUG2 && weapowep == 1010063){
                 for (int i = 0; i < sizeof(aug) / sizeof(aug2[0]); i++) {
                 if (weaponid == aug2[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.AUG2;
                     break;
                  }
                 }
                }
                if (preferences.AUG3 && weapowep == 1010064){
                 for (int i = 0; i < sizeof(aug3) / sizeof(aug3[0]); i++) {
                 if (weaponid == aug3[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.AUG3;
                     break;
                  }
                 }
                }
                if (preferences.AUG4 && weapowep == 1010065){
                 for (int i = 0; i < sizeof(aug4) / sizeof(aug4[0]); i++) {
                 if (weaponid == aug4[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.AUG4;
                     break;
                  }
                 }
                }
                if (preferences.AUG5 && weapowep == 1010066){
                 for (int i = 0; i < sizeof(aug5) / sizeof(aug5[0]); i++) {
                 if (weaponid == aug5[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.AUG5;
                     break;
                  }
                 }
                }
                if (preferences.AUG6 && weapowep == 1010067){
                 for (int i = 0; i < sizeof(aug6) / sizeof(aug6[0]); i++) {
                 if (weaponid == aug6[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.AUG6;
                     break;
                  }
                 }
                }
                if (preferences.GROZA && weapowep == 101005){
                 for (int i = 0; i < sizeof(groza) / sizeof(groza[0]); i++) {
                 if (weaponid == groza[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.Groza;
                     break;
                  }
                 }
                }
                if (preferences.GROZA1 && weapowep == 1010052){
                 for (int i = 0; i < sizeof(groza1) / sizeof(groza1[0]); i++) {
                 if (weaponid == groza1[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.Groza1;
                     break;
                  }
                 }
                }
                if (preferences.GROZA2 && weapowep == 1010053){
                 for (int i = 0; i < sizeof(groza) / sizeof(groza2[0]); i++) {
                 if (weaponid == groza2[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.Groza2;
                     break;
                  }
                 }
                }
                if (preferences.GROZA3 && weapowep == 1010054){
                 for (int i = 0; i < sizeof(groza3) / sizeof(groza3[0]); i++) {
                 if (weaponid == groza3[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.Groza3;
                     break;
                  }
                 }
                }
                if (preferences.GROZA4 && weapowep == 1010055){
                 for (int i = 0; i < sizeof(groza4) / sizeof(groza4[0]); i++) {
                 if (weaponid == groza4[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.Groza4;
                     break;
                  }
                 }
                }
                if (preferences.GROZA5 && weapowep == 1010056){
                 for (int i = 0; i < sizeof(groza5) / sizeof(groza5[0]); i++) {
                 if (weaponid == groza5[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.Groza5;
                     break;
                  }
                 }
                }
                if (preferences.GROZA6 && weapowep == 1010057){
                 for (int i = 0; i < sizeof(groza6) / sizeof(groza6[0]); i++) {
                 if (weaponid == groza6[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.Groza6;
                     break;
                  }
                 }
                }
                if (preferences.DP28 && weapowep == 105002){
                 for (int i = 0; i < sizeof(dp) / sizeof(dp[0]); i++) {
                 if (weaponid == dp[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.DP28;
                     break;
                  }
                 }
                }
                if (preferences.DP281 && weapowep == 1050022){
                 for (int i = 0; i < sizeof(dp1) / sizeof(dp1[0]); i++) {
                 if (weaponid == dp1[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.DP281;
                     break;
                  }
                 }
                }
                if (preferences.DP282 && weapowep == 1050023){
                 for (int i = 0; i < sizeof(dp2) / sizeof(dp2[0]); i++) {
                 if (weaponid == dp2[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.DP282;
                     break;
                  }
                 }
                }
                if (preferences.DP283 && weapowep == 1050024){
                 for (int i = 0; i < sizeof(dp3) / sizeof(dp3[0]); i++) {
                 if (weaponid == dp3[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.DP283;
                     break;
                  }
                 }
                }
                if (preferences.DP284 && weapowep == 1050025){
                 for (int i = 0; i < sizeof(dp4) / sizeof(dp4[0]); i++) {
                 if (weaponid == dp4[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.DP284;
                     break;
                  }
                 }
                }
                if (preferences.DP285 && weapowep == 1050026){
                 for (int i = 0; i < sizeof(dp5) / sizeof(dp5[0]); i++) {
                 if (weaponid == dp5[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.DP285;
                     break;
                  }
                 }
                }
                if (preferences.DP286 && weapowep == 1050027){
                 for (int i = 0; i < sizeof(dp6) / sizeof(dp6[0]); i++) {
                 if (weaponid == dp6[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.DP286;
                     break;
                  }
                 }
                }
                if (preferences.M249 && weapowep == 105001){
                 for (int i = 0; i < sizeof(m249) / sizeof(m249[0]); i++) {
                 if (weaponid == m249[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M249;
                     break;
                  }
                 }
                /* for (int i = 0; i < sizeof(m249s) / sizeof(m249s[0]); i++) {
                 if (weaponid == m249s[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M249s;
                     break;
                  }
                 }*/
                }
                if (preferences.M2491 && weapowep == 1050012){
                 for (int i = 0; i < sizeof(m2491) / sizeof(m2491[0]); i++) {
                 if (weaponid == m2491[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M2491;
                     break;
                  }
                 }
                /* for (int i = 0; i < sizeof(m249s) / sizeof(m249s[0]); i++) {
                 if (weaponid == m249s[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M249s;
                     break;
                  }
                 }*/
                }
                if (preferences.M2492 && weapowep == 1050013){
                 for (int i = 0; i < sizeof(m2492) / sizeof(m2492[0]); i++) {
                 if (weaponid == m2492[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M2492;
                     break;
                  }
                 }
                /* for (int i = 0; i < sizeof(m249s) / sizeof(m249s[0]); i++) {
                 if (weaponid == m249s[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M249s;
                     break;
                  }
                 }*/
                }
                if (preferences.M2493 && weapowep == 1050014){
                 for (int i = 0; i < sizeof(m2493) / sizeof(m2493[0]); i++) {
                 if (weaponid == m2493[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M2493;
                     break;
                  }
                 }
                /* for (int i = 0; i < sizeof(m249s) / sizeof(m249s[0]); i++) {
                 if (weaponid == m249s[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M249s;
                     break;
                  }
                 }*/
                }
                if (preferences.M2494 && weapowep == 1050015){
                 for (int i = 0; i < sizeof(m2494) / sizeof(m2494[0]); i++) {
                 if (weaponid == m2494[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M2494;
                     break;
                  }
                 }
                /* for (int i = 0; i < sizeof(m249s) / sizeof(m249s[0]); i++) {
                 if (weaponid == m249s[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M249s;
                     break;
                  }
                 }*/
                }
                if (preferences.M2495 && weapowep == 1050016){
                 for (int i = 0; i < sizeof(m2495) / sizeof(m2495[0]); i++) {
                 if (weaponid == m2495[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M2495;
                     break;
                  }
                 }
                /* for (int i = 0; i < sizeof(m249s) / sizeof(m249s[0]); i++) {
                 if (weaponid == m249s[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M249s;
                     break;
                  }
                 }*/
                }
                if (preferences.M2496 && weapowep == 1050017){
                 for (int i = 0; i < sizeof(m2496) / sizeof(m2496[0]); i++) {
                 if (weaponid == m2496[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M2496;
                     break;
                  }
                 }
                /* for (int i = 0; i < sizeof(m249s) / sizeof(m249s[0]); i++) {
                 if (weaponid == m249s[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M249s;
                     break;
                  }
                 }*/
                }
                if (preferences.MG3 && weapowep == 105010){
                 for (int i = 0; i < sizeof(m249) / sizeof(mg3[0]); i++) {
                 if (weaponid == mg3[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.MG3;
                     break;
                  }
                 }
                }
                if (preferences.SCARL && weapowep == 101003){
                 for (int i = 0; i < sizeof(scar) / sizeof(scar[0]); i++) {
                 if (weaponid == scar[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.Scar;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(scarmag) / sizeof(scarmag[0]); i++) {
                 if (weaponid == scarmag[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.Scar_Mag;
                     break;
                  }
                 }
                }
                if (preferences.SCARL1 && weapowep == 1010032){
                 for (int i = 0; i < sizeof(scar1) / sizeof(scar[0]); i++) {
                 if (weaponid == scar1[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.Scar1;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(scarmag) / sizeof(scarmag[0]); i++) {
                 if (weaponid == scarmag[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.Scar_Mag;
                     break;
                  }
                 }
                }
                if (preferences.SCARL2 && weapowep == 1010033){
                 for (int i = 0; i < sizeof(scar2) / sizeof(scar2[0]); i++) {
                 if (weaponid == scar2[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.Scar2;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(scarmag) / sizeof(scarmag[0]); i++) {
                 if (weaponid == scarmag[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.Scar_Mag;
                     break;
                  }
                 }
                }
                if (preferences.SCARL3 && weapowep == 1010034){
                 for (int i = 0; i < sizeof(scar3) / sizeof(scar3[0]); i++) {
                 if (weaponid == scar3[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.Scar3;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(scarmag) / sizeof(scarmag[0]); i++) {
                 if (weaponid == scarmag[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.Scar_Mag;
                     break;
                  }
                 }
                }
                if (preferences.SCARL4 && weapowep == 1010035){
                 for (int i = 0; i < sizeof(scar4) / sizeof(scar4[0]); i++) {
                 if (weaponid == scar4[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.Scar4;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(scarmag) / sizeof(scarmag[0]); i++) {
                 if (weaponid == scarmag[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.Scar_Mag;
                     break;
                  }
                 }
                }
                if (preferences.SCARL5 && weapowep == 1010036){
                 for (int i = 0; i < sizeof(scar5) / sizeof(scar5[0]); i++) {
                 if (weaponid == scar5[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.Scar5;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(scarmag) / sizeof(scarmag[0]); i++) {
                 if (weaponid == scarmag[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.Scar_Mag;
                     break;
                  }
                 }
                }
                if (preferences.SCARL6 && weapowep == 1010037){
                 for (int i = 0; i < sizeof(scar6) / sizeof(scar6[0]); i++) {
                 if (weaponid == scar6[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.Scar6;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(scarmag) / sizeof(scarmag[0]); i++) {
                 if (weaponid == scarmag[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.Scar_Mag;
                     break;
                  }
                 }
                }
                
                if (preferences.M762 && weapowep == 101008){
                 for (int i = 0; i < sizeof(m7) / sizeof(m7[0]); i++) {
                 if (weaponid == m7[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M762;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(m7mag) / sizeof(m7mag[0]); i++) {
                 if (weaponid == m7mag[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M762_Mag;
                     break;
                  }
                 }
                }
                if (preferences.M7621 && weapowep == 1010082){
                 for (int i = 0; i < sizeof(m71) / sizeof(m71[0]); i++) {
                 if (weaponid == m71[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M7621;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(m7mag) / sizeof(m7mag[0]); i++) {
                 if (weaponid == m7mag[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M762_Mag;
                     break;
                  }
                 }
                }
                if (preferences.M7622 && weapowep == 1010083){
                 for (int i = 0; i < sizeof(m72) / sizeof(m72[0]); i++) {
                 if (weaponid == m72[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M7622;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(m7mag) / sizeof(m7mag[0]); i++) {
                 if (weaponid == m7mag[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M762_Mag;
                     break;
                  }
                 }
                }
                if (preferences.M7623 && weapowep == 1010084){
                 for (int i = 0; i < sizeof(m73) / sizeof(m73[0]); i++) {
                 if (weaponid == m73[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M7623;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(m7mag) / sizeof(m7mag[0]); i++) {
                 if (weaponid == m7mag[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M762_Mag;
                     break;
                  }
                 }
                }
                if (preferences.M7624 && weapowep == 1010085){
                 for (int i = 0; i < sizeof(m74) / sizeof(m74[0]); i++) {
                 if (weaponid == m74[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M7624;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(m7mag) / sizeof(m7mag[0]); i++) {
                 if (weaponid == m7mag[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M762_Mag;
                     break;
                  }
                 }
                }
                if (preferences.M7625 && weapowep == 1010086){
                 for (int i = 0; i < sizeof(m75) / sizeof(m75[0]); i++) {
                 if (weaponid == m75[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M7625;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(m7mag) / sizeof(m7mag[0]); i++) {
                 if (weaponid == m7mag[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M762_Mag;
                     break;
                  }
                 }
                }
                if (preferences.M7626 && weapowep == 1010087){
                 for (int i = 0; i < sizeof(m76) / sizeof(m76[0]); i++) {
                 if (weaponid == m76[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M7626;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(m7mag) / sizeof(m7mag[0]); i++) {
                 if (weaponid == m7mag[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M762_Mag;
                     break;
                  }
                 }
                }
                if (preferences.M4168 && weapowep == 1010042){
                 for (int i = 0; i < sizeof(m4168) / sizeof(m4168[0]); i++) {
                 if (weaponid == m4168[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M4168;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(m4mag) / sizeof(m4mag[0]); i++) {
                 if (weaponid == m4mag[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_2;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(m4sight) / sizeof(m4sight[0]); i++) {
                 if (weaponid == m4sight[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_3;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(m4stock) / sizeof(m4stock[0]); i++) {
                 if (weaponid == m4stock[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_4;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(m4stock1) / sizeof(m4stock1[0]); i++) {
                 if (weaponid == m4stock1[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_stock;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(m4stock2) / sizeof(m4stock2[0]); i++) {
                 if (weaponid == m4stock2[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_stock2;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(m4stock3) / sizeof(m4stock3[0]); i++) {
                 if (weaponid == m4stock3[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_stock3;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(m4stock4) / sizeof(m4stock4[0]); i++) {
                 if (weaponid == m4stock4[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_stock4;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(m4stock5) / sizeof(m4stock5[0]); i++) {
                 if (weaponid == m4stock5[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_stock5;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(m4reddot) / sizeof(m4reddot[0]); i++) {
                 if (weaponid == m4reddot[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_reddot;
                     break;
                  }
                 }
				     for (int i = 0; i < sizeof(m46666) / sizeof(m46666[0]); i++) {
                 if (weaponid == m46666[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_x6;
                     break;
                  }
				     }
				     for (int i = 0; i < sizeof(m43444) / sizeof(m43444[0]); i++) {
                 if (weaponid == m43444[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_x4;
                     break;
                  }
				     }
				     for (int i = 0; i < sizeof(m43333) / sizeof(m43333[0]); i++) {
                 if (weaponid == m43333[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_x3;
                     break;
                  }
				     }
				     for (int i = 0; i < sizeof(m42222) / sizeof(m42222[0]); i++) {
                 if (weaponid == m42222[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_x2;
                     break;
                  }
				    }
				  }
                if (preferences.M4169 && weapowep == 1010043){
                 for (int i = 0; i < sizeof(m4169) / sizeof(m4169[0]); i++) {
                 if (weaponid == m4169[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M4169;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(m4mag) / sizeof(m4mag[0]); i++) {
                 if (weaponid == m4mag[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_2;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(m4sight) / sizeof(m4sight[0]); i++) {
                 if (weaponid == m4sight[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_3;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(m4stock) / sizeof(m4stock[0]); i++) {
                 if (weaponid == m4stock[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_4;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(m4stock1) / sizeof(m4stock1[0]); i++) {
                 if (weaponid == m4stock1[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_stock;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(m4stock2) / sizeof(m4stock2[0]); i++) {
                 if (weaponid == m4stock2[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_stock2;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(m4stock3) / sizeof(m4stock3[0]); i++) {
                 if (weaponid == m4stock3[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_stock3;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(m4stock4) / sizeof(m4stock4[0]); i++) {
                 if (weaponid == m4stock4[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_stock4;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(m4stock5) / sizeof(m4stock5[0]); i++) {
                 if (weaponid == m4stock5[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_stock5;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(m4reddot) / sizeof(m4reddot[0]); i++) {
                 if (weaponid == m4reddot[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_reddot;
                     break;
                  }
                 }
				     for (int i = 0; i < sizeof(m46666) / sizeof(m46666[0]); i++) {
                 if (weaponid == m46666[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_x6;
                     break;
                  }
				     }
				     for (int i = 0; i < sizeof(m43444) / sizeof(m43444[0]); i++) {
                 if (weaponid == m43444[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_x4;
                     break;
                  }
				     }
				     for (int i = 0; i < sizeof(m43333) / sizeof(m43333[0]); i++) {
                 if (weaponid == m43333[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_x3;
                     break;
                  }
				     }
				     for (int i = 0; i < sizeof(m42222) / sizeof(m42222[0]); i++) {
                 if (weaponid == m42222[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_x2;
                     break;
                  }
				    }
				  }
                if (preferences.M4161 && weapowep == 1010044){
                 for (int i = 0; i < sizeof(m4161) / sizeof(m4161[0]); i++) {
                 if (weaponid == m4161[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M4161;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(m4mag) / sizeof(m4mag[0]); i++) {
                 if (weaponid == m4mag[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_2;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(m4sight) / sizeof(m4sight[0]); i++) {
                 if (weaponid == m4sight[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_3;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(m4stock) / sizeof(m4stock[0]); i++) {
                 if (weaponid == m4stock[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_4;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(m4stock1) / sizeof(m4stock1[0]); i++) {
                 if (weaponid == m4stock1[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_stock;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(m4stock2) / sizeof(m4stock2[0]); i++) {
                 if (weaponid == m4stock2[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_stock2;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(m4stock3) / sizeof(m4stock3[0]); i++) {
                 if (weaponid == m4stock3[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_stock3;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(m4stock4) / sizeof(m4stock4[0]); i++) {
                 if (weaponid == m4stock4[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_stock4;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(m4stock5) / sizeof(m4stock5[0]); i++) {
                 if (weaponid == m4stock5[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_stock5;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(m4reddot) / sizeof(m4reddot[0]); i++) {
                 if (weaponid == m4reddot[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_reddot;
                     break;
                  }
                 }
				     for (int i = 0; i < sizeof(m46666) / sizeof(m46666[0]); i++) {
                 if (weaponid == m46666[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_x6;
                     break;
                  }
				     }
				     for (int i = 0; i < sizeof(m43444) / sizeof(m43444[0]); i++) {
                 if (weaponid == m43444[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_x4;
                     break;
                  }
				     }
				     for (int i = 0; i < sizeof(m43333) / sizeof(m43333[0]); i++) {
                 if (weaponid == m43333[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_x3;
                     break;
                  }
				     }
				     for (int i = 0; i < sizeof(m42222) / sizeof(m42222[0]); i++) {
                 if (weaponid == m42222[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_x2;
                     break;
                  }
				    }
				  }
                if (preferences.M4162 && weapowep == 1010045){
                 for (int i = 0; i < sizeof(m4162) / sizeof(m4162[0]); i++) {
                 if (weaponid == m4162[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M4162;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(m4mag) / sizeof(m4mag[0]); i++) {
                 if (weaponid == m4mag[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_2;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(m4sight) / sizeof(m4sight[0]); i++) {
                 if (weaponid == m4sight[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_3;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(m4stock) / sizeof(m4stock[0]); i++) {
                 if (weaponid == m4stock[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_4;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(m4stock1) / sizeof(m4stock1[0]); i++) {
                 if (weaponid == m4stock1[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_stock;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(m4stock2) / sizeof(m4stock2[0]); i++) {
                 if (weaponid == m4stock2[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_stock2;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(m4stock3) / sizeof(m4stock3[0]); i++) {
                 if (weaponid == m4stock3[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_stock3;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(m4stock4) / sizeof(m4stock4[0]); i++) {
                 if (weaponid == m4stock4[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_stock4;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(m4stock5) / sizeof(m4stock5[0]); i++) {
                 if (weaponid == m4stock5[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_stock5;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(m4reddot) / sizeof(m4reddot[0]); i++) {
                 if (weaponid == m4reddot[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_reddot;
                     break;
                  }
                 }
				     for (int i = 0; i < sizeof(m46666) / sizeof(m46666[0]); i++) {
                 if (weaponid == m46666[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_x6;
                     break;
                  }
				     }
				     for (int i = 0; i < sizeof(m43444) / sizeof(m43444[0]); i++) {
                 if (weaponid == m43444[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_x4;
                     break;
                  }
				     }
				     for (int i = 0; i < sizeof(m43333) / sizeof(m43333[0]); i++) {
                 if (weaponid == m43333[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_x3;
                     break;
                  }
				     }
				     for (int i = 0; i < sizeof(m42222) / sizeof(m42222[0]); i++) {
                 if (weaponid == m42222[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_x2;
                     break;
                  }
				    }
				  } 
                if (preferences.M4163 && weapowep == 1010046){
                 for (int i = 0; i < sizeof(m4163) / sizeof(m4163[0]); i++) {
                 if (weaponid == m4163[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M4163;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(m4mag) / sizeof(m4mag[0]); i++) {
                 if (weaponid == m4mag[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_2;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(m4sight) / sizeof(m4sight[0]); i++) {
                 if (weaponid == m4sight[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_3;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(m4stock) / sizeof(m4stock[0]); i++) {
                 if (weaponid == m4stock[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_4;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(m4stock1) / sizeof(m4stock1[0]); i++) {
                 if (weaponid == m4stock1[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_stock;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(m4stock2) / sizeof(m4stock2[0]); i++) {
                 if (weaponid == m4stock2[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_stock2;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(m4stock3) / sizeof(m4stock3[0]); i++) {
                 if (weaponid == m4stock3[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_stock3;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(m4stock4) / sizeof(m4stock4[0]); i++) {
                 if (weaponid == m4stock4[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_stock4;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(m4stock5) / sizeof(m4stock5[0]); i++) {
                 if (weaponid == m4stock5[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_stock5;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(m4reddot) / sizeof(m4reddot[0]); i++) {
                 if (weaponid == m4reddot[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_reddot;
                     break;
                  }
                 }
				     for (int i = 0; i < sizeof(m46666) / sizeof(m46666[0]); i++) {
                 if (weaponid == m46666[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_x6;
                     break;
                  }
				     }
				     for (int i = 0; i < sizeof(m43444) / sizeof(m43444[0]); i++) {
                 if (weaponid == m43444[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_x4;
                     break;
                  }
				     }
				     for (int i = 0; i < sizeof(m43333) / sizeof(m43333[0]); i++) {
                 if (weaponid == m43333[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_x3;
                     break;
                  }
				     }
				     for (int i = 0; i < sizeof(m42222) / sizeof(m42222[0]); i++) {
                 if (weaponid == m42222[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_x2;
                     break;
                  }
				    }
				  }
                if (preferences.M4164 && weapowep == 1010047){
                 for (int i = 0; i < sizeof(m4164) / sizeof(m4164[0]); i++) {
                 if (weaponid == m4164[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M4164;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(m4mag) / sizeof(m4mag[0]); i++) {
                 if (weaponid == m4mag[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_2;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(m4sight) / sizeof(m4sight[0]); i++) {
                 if (weaponid == m4sight[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_3;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(m4stock) / sizeof(m4stock[0]); i++) {
                 if (weaponid == m4stock[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_4;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(m4stock1) / sizeof(m4stock1[0]); i++) {
                 if (weaponid == m4stock1[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_stock;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(m4stock2) / sizeof(m4stock2[0]); i++) {
                 if (weaponid == m4stock2[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_stock2;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(m4stock3) / sizeof(m4stock3[0]); i++) {
                 if (weaponid == m4stock3[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_stock3;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(m4stock4) / sizeof(m4stock4[0]); i++) {
                 if (weaponid == m4stock4[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_stock4;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(m4stock5) / sizeof(m4stock5[0]); i++) {
                 if (weaponid == m4stock5[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_stock5;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(m4reddot) / sizeof(m4reddot[0]); i++) {
                 if (weaponid == m4reddot[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_reddot;
                     break;
                  }
                 }
				     for (int i = 0; i < sizeof(m46666) / sizeof(m46666[0]); i++) {
                 if (weaponid == m46666[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_x6;
                     break;
                  }
				     }
				     for (int i = 0; i < sizeof(m43444) / sizeof(m43444[0]); i++) {
                 if (weaponid == m43444[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_x4;
                     break;
                  }
				     }
				     for (int i = 0; i < sizeof(m43333) / sizeof(m43333[0]); i++) {
                 if (weaponid == m43333[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_x3;
                     break;
                  }
				     }
				     for (int i = 0; i < sizeof(m42222) / sizeof(m42222[0]); i++) {
                 if (weaponid == m42222[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_x2;
                     break;
                  }
				    }
				  }                                                              
                if (preferences.M416 && weapowep == 101004){
                 for (int i = 0; i < sizeof(m4v) / sizeof(m4v[0]); i++) {
                 if (weaponid == m4v[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_1;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(m4mag) / sizeof(m4mag[0]); i++) {
                 if (weaponid == m4mag[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_2;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(m4sight) / sizeof(m4sight[0]); i++) {
                 if (weaponid == m4sight[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_3;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(m4stock) / sizeof(m4stock[0]); i++) {
                 if (weaponid == m4stock[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_4;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(m4stock1) / sizeof(m4stock1[0]); i++) {
                 if (weaponid == m4stock1[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_stock;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(m4reddot) / sizeof(m4reddot[0]); i++) {
                 if (weaponid == m4reddot[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_reddot;
                     break;
                  }
                 }
				     for (int i = 0; i < sizeof(m46666) / sizeof(m46666[0]); i++) {
                 if (weaponid == m46666[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_x6;
                     break;
                  }
				     }
				     for (int i = 0; i < sizeof(m43444) / sizeof(m43444[0]); i++) {
                 if (weaponid == m43444[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_x4;
                     break;
                  }
				     }
				     for (int i = 0; i < sizeof(m43333) / sizeof(m43333[0]); i++) {
                 if (weaponid == m43333[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_x3;
                     break;
                  }
				     }
				     for (int i = 0; i < sizeof(m42222) / sizeof(m42222[0]); i++) {
                 if (weaponid == m42222[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_x2;
                     break;
                  }
				    }
				  }
                 localPlayer->WeaponManagerComponent->CurrentWeaponReplicated->DelayHandleAvatarMeshChanged();
                 lastWeaponChangeTime = currentTime;
             }
         }
     }
 }
}
//

if (localPlayer -> CurrentVehicle) {
        if (localPlayer -> CurrentVehicle -> VehicleAvatar) {
          std::string SkinIDStr = std::to_string((int) localPlayer -> CurrentVehicle -> VehicleAvatar -> GetDefaultAvatarID());
            Active::SkinCarDefault = localPlayer -> CurrentVehicle -> GetAvatarID();

          
          if (preferences.Moto && strstr(SkinIDStr.c_str(), "1901")) {
            Active::SkinCarMod = new_Skin.Moto;
            Active::SkinCarNew = true;
          } else if (preferences.Dacia && strstr(SkinIDStr.c_str(), "1903")) {
            Active::SkinCarMod = new_Skin.Dacia;
            Active::SkinCarNew = true;
          } else if (preferences.Boat && strstr(SkinIDStr.c_str(), "1911")) {
            Active::SkinCarMod = new_Skin.Boat;
            Active::SkinCarNew = true;
          } else if (preferences.MiniBus && strstr(SkinIDStr.c_str(), "1904")) {
            Active::SkinCarMod = new_Skin.MiniBus;
            Active::SkinCarNew = true;
          } else if (preferences.Mirado && strstr(SkinIDStr.c_str(), "1914")) {
            Active::SkinCarMod = new_Skin.Mirado;
            Active::SkinCarNew = true;
          } else if (preferences.Mirado && strstr(SkinIDStr.c_str(), "1915")) {
            Active::SkinCarMod = new_Skin.Mirado;
            Active::SkinCarNew = true;
          } else if (preferences.Buggy && strstr(SkinIDStr.c_str(), "1907")) {
            Active::SkinCarMod = new_Skin.Buggy;
            Active::SkinCarNew = true;
          }else if (preferences.CoupeRB && strstr(SkinIDStr.c_str(), "1961")) {
            Active::SkinCarMod = new_Skin.CoupeRP;
            Active::SkinCarNew = true;
          } else if (preferences.BigFoot && strstr(SkinIDStr.c_str(), "1953")) {
            Active::SkinCarMod = new_Skin.Bigfoot;
            Active::SkinCarNew = true;
          } else if (preferences.UAZ && strstr(SkinIDStr.c_str(), "1908")) {
            Active::SkinCarMod = new_Skin.UAZ;
            Active::SkinCarNew = true;
          } else Active::SkinCarNew = false;

          if (Active::SkinCarDefault != Active::SkinCarMod && Active::SkinCarNew) {
            
            localPlayer -> CurrentVehicle -> VehicleAvatar -> ChangeItemAvatar(Active::SkinCarMod, true);
          }
        }
      }

 if (localPlayerController->BackpackComponent){
     auto data = localPlayerController->BackpackComponent->ItemListNet;
     auto bag = data.IncArray;
     for (int j = 0; j < bag.Num(); j++) {
     int ID = bag[j].Unit.DefineID.TypeSpecificID;
     if (preferences.Outfit){
 for (int i = 0; i < sizeof(SuitX) / sizeof(SuitX[0]); i++) {
                 if (ID == SuitX[i]) {
                     bag[j].Unit.DefineID.TypeSpecificID = new_Skin.XSuits;
                     break;
                  }
                 }
                }
                if (preferences.Bagg){
for (int i = 0; i < sizeof(Bag) / sizeof(Bag[0]); i++) {
                 if (ID == Bag[i]) {
                     bag[j].Unit.DefineID.TypeSpecificID = bag3;
                     break;
                  }
                 }
                }
                if (preferences.Helmett){
for (int i = 0; i < sizeof(Helmet) / sizeof(Helmet[0]); i++) {
                 if (ID == Helmet[i]) {
                     bag[j].Unit.DefineID.TypeSpecificID = helmett3;
                     break;
                  }
                 }
                }
                if (preferences.Emote){
for (int i = 0; i < sizeof(emote1) / sizeof(emote1[0]); i++) {
                 if (ID == emote1[i]) {
                     bag[j].Unit.DefineID.TypeSpecificID = sEmote1;
                     break;
                  }
                 }
for (int i = 0; i < sizeof(emote2) / sizeof(emote2[0]); i++) {
                 if (ID == emote2[i]) {
                     bag[j].Unit.DefineID.TypeSpecificID = sEmote2;
                     break;
                  }
                 }
for (int i = 0; i < sizeof(emote3) / sizeof(emote3[0]); i++) {
                 if (ID == emote3[i]) {
                     bag[j].Unit.DefineID.TypeSpecificID = sEmote3;
                     break;
                  }
                 }
                }
                /*
                if (preferences.PAN){
                 for (int i = 0; i < sizeof(pan) / sizeof(pan[0]); i++) {
                 if (ID == pan[i]) {
                     bag[j].Unit.DefineID.TypeSpecificID = new_Skin.Pan;
                     break;
                  }
                 }
                }
                if (preferences.KAR98){
                 for (int i = 0; i < sizeof(kar) / sizeof(kar[0]); i++) {
                 if (ID == kar[i]) {
                     bag[j].Unit.DefineID.TypeSpecificID = new_Skin.K98;
                     break;
                  }
                 }
                }
                if (preferences.M24){
                 for (int i = 0; i < sizeof(m24) / sizeof(m24[0]); i++) {
                 if (ID == m24[i]) {
                     bag[j].Unit.DefineID.TypeSpecificID = new_Skin.M24;
                     break;
                  }
                 }
                }
                if (preferences.AWM){
                 for (int i = 0; i < sizeof(awm) / sizeof(awm[0]); i++) {
                 if (ID == awm[i]) {
                     bag[j].Unit.DefineID.TypeSpecificID = new_Skin.AWM;
                     break;
                  }
                 }
                }
                if (preferences.M416){
                 for (int i = 0; i < sizeof(m4v) / sizeof(m4v[0]); i++) {
                 if (ID == m4v[i]) {
                     bag[j].Unit.DefineID.TypeSpecificID = new_Skin.M416_1;
                     break;
                  }
                 }
                }
                if (preferences.AKM){
                 for (int i = 0; i < sizeof(akmv) / sizeof(akmv[0]); i++) {
                 if (ID == akmv[i]) {
                     bag[j].Unit.DefineID.TypeSpecificID = new_Skin.AKM;
                     break;
                  }
                 }
                }
                if (preferences.SCARL){
                 for (int i = 0; i < sizeof(scar) / sizeof(scar[0]); i++) {
                 if (ID == scar[i]) {
                     bag[j].Unit.DefineID.TypeSpecificID = new_Skin.Scar;
                     break;
                  }
                 }
                }
                if (preferences.M762){
                 for (int i = 0; i < sizeof(m7) / sizeof(m7[0]); i++) {
                 if (ID == m7[i]) {
                     bag[j].Unit.DefineID.TypeSpecificID = new_Skin.M762;
                     break;
                  }
                 }
                }
                 /*
 auto itr = weaponDefinitions.find(ID);
                 if (itr != weaponDefinitions.end()) {
                     auto innerItr = itr->second.find(ID);
                     if (innerItr != itr->second.end()) {
                         bag[j].Unit.DefineID.TypeSpecificID = innerItr->second;
                     }
                 }*/
      }
   }

 
   if (localPlayer -> AvatarComponent2) {

                                   auto AvatarComp = localPlayer -> AvatarComponent2;
                                   
                                   //FNetAvatarSyncData NetAvatarComp = * (FNetAvatarSyncData * )((uintptr_t) AvatarComp + 0x388); //if u use 64bit change this offset
// 64位系统下的调整
FNetAvatarSyncData NetAvatarComp = *((FNetAvatarSyncData*)((char*)AvatarComp + 0x388));

                                   auto Slotsybc = NetAvatarComp.SlotSyncData;
        if (preferences.Parachute){
        Slotsybc[11].ItemId = new_Skin.Parachute;
        }
        if (preferences.Outfit){
        Slotsybc[2].ItemId = new_Skin.XSuits;
        }
        if (preferences.Bagg){
        Slotsybc[5].ItemId = bag3;
        }
        if (preferences.Helmett){
        Slotsybc[9].ItemId = helmett3;
        }
   auto now = std::chrono::high_resolution_clock::now();
auto elapsed = std::chrono::duration_cast<std::chrono::seconds>(now - start).count();

if (elapsed < 1 && callFunction) {
    localPlayer->AvatarComponent2->OnRep_BodySlotStateChanged();
    localPlayerController->BackpackComponent->OnRep_ItemListNet();
} else {
    callFunction = false;
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



            if([[NSUserDefaults standardUserDefaults] boolForKey:@"忽略人机"]){
                                    if (Player->bEnsure)
                                        continue;
                                }
                                if (Config.ESPMenu.xiayu) {
         g_LocalPlayer->STPlayerController->SetIsRainy(true);
         }
if (Config.ESPMenu.xiax) {
         g_LocalPlayer->STPlayerController->SetIsSnowy(true);
         
         
         }
if (人物旋转) {
     USceneComponent* MeshContainer = localPlayer->MeshContainer;
     MeshContainer->RelativeRotation = { 0,DanceValue ,0 };
     DanceValue += DancerValue;
     if (DanceValue >= 360.0f)
         DanceValue = 0.0f;
     DanceValue += 旋转速度;//速度
 }
if(枪械变大){
    auto WeaponManagerComponent = localPlayer->WeaponManagerComponent;
    if (WeaponManagerComponent) {
        auto Slot = WeaponManagerComponent->GetCurrentUsingPropSlot();
        if ((int) Slot.GetValue() >= 1 && (int) Slot.GetValue() <= 3) {
            auto CurrentWeaponReplicated = (ASTExtraShootWeapon *) WeaponManagerComponent->CurrentWeaponReplicated;
            if (CurrentWeaponReplicated) {
                auto ShootWeaponEntityComp = CurrentWeaponReplicated->ShootWeaponEntityComp;
                auto ShootWeaponEffectComp = CurrentWeaponReplicated->ShootWeaponEffectComp;
                if (ShootWeaponEntityComp && ShootWeaponEffectComp) {
if (枪械变大) {
    CurrentWeaponReplicated->RootComponent->RelativeScale3D.Y = Gun_Size;
    CurrentWeaponReplicated->RootComponent->RelativeScale3D.Z = Gun_Size;
    CurrentWeaponReplicated->RootComponent->RelativeScale3D.X = Gun_Size;
                      }
                 }
             }
         }
     }
 }


if(暴力载具){
    if (localPlayer->CurrentVehicle) {
                                    auto CurrentVehicle = localPlayer->CurrentVehicle;
                                    auto RootComponent = static_cast<UPrimitiveComponent*>(CurrentVehicle->K2_GetRootComponent());
                                    if (RootComponent) {
                                        if (localPlayer->CurrentVehicle->GetMoveForwardRate() > 0) {
                                            FVector 向量;
                                            auto 控件 = g_PlayerController->PlayerCameraManager->CameraCache.POV.Rotation.Yaw;
                                            float 距离 = 2.f * (控件 / 360.f) * M_PI;
                                            
                                            向量.X = (130 /* disired speed*/ * cosf(距离));
                                           向量.Y = (130 * sinf(距离));
                                            
                                            RootComponent->SetAllPhysicsLinearVelocity(向量, true);
                                        }

                                    }
                                }
                                
                            }       


//武器单发改自动
if (路飞) {
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
        if (快速跳伞) {
            if(localPlayer){
                if(   localPlayer->ParachuteComponent) {
                    localPlayer-> ParachuteComponent->CurrentFallSpeed = (float) 8300;
                    localPlayer->  ParachuteComponent->FreeFall_AcceFall = (float) 25000;
                    localPlayer->  ParachuteComponent->FreeFall_MaxFreeFallSpeed = (float) 25000;
                    localPlayer-> ParachuteComponent->FreeFall_AcceForward = (float) 25000;
                    localPlayer-> ParachuteComponent->FreeFall_MaxForwardExtraFallSpeed = (float) 25000;
                    localPlayer-> ParachuteComponent->Opened_AcceFall = (float) 5000;
                    localPlayer->  ParachuteComponent->Opened_MaxFreeFallSpeed = (float) 5000;
                    localPlayer->  ParachuteComponent->Opened_AcceForward = (float) 5000;
                    localPlayer-> ParachuteComponent->Opened_MaxForwardSpeed = (float) 5000;
                    localPlayer->  ParachuteComponent->Opened_MaxForwardExtraFallSpeed = (float) 5000;
                    localPlayer->  ParachuteComponent->FreeFall_AcceForward = (float) 5000;
                    localPlayer-> ParachuteComponent->FreeFall_MaxForwardExtraFallSpeed = (float) 5000;
                    localPlayer->  ParachuteComponent->Opened_AcceFall = (float) 5000;
                    localPlayer-> ParachuteComponent->Opened_MaxFreeFallSpeed = (float) 5000;
                    localPlayer-> ParachuteComponent->Opened_AcceForward = (float) 5000;
                    localPlayer-> ParachuteComponent->AllowMaxDiatanceSqAtServer = (float) 40000;
                    localPlayer-> ParachuteComponent->MaxZAllowDistance = (float) 40000;
                }}
        }
        if (加速) {{
            if(localPlayer)
                if( localPlayer->STCharacterMovement){
                    localPlayer->  STCharacterMovement->MaxWalkSpeed +=  500.f;
                    localPlayer-> STCharacterMovement->MaxWalkSpeedCrouched =  localPlayer->STCharacterMovement->MaxWalkSpeed * 1000.f;
                }
        }
        }
//内存
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
                                                    //聚点
                                                    if(聚点){


    static float cnt = 0.0f;
    cnt += 0.1f; // 加快变化速度
    cnt = fmod(cnt, 2.0f * 3.1415926535f); // 限制在 [0, 2π)

    float r = cos(cnt) * 0.5f + 0.5f;
    float g = cos(cnt - 2.0f * 3.1415926535f / 3.0f) * 0.5f + 0.5f;
    float b = cos(cnt - 4.0f * 3.1415926535f / 3.0f) * 0.5f + 0.5f;

    // 清零武器偏差与后坐力
    memset(&ShootWeaponEntityComp->DeviationInfo, 0, sizeof(FSDeviation));
    memset(&ShootWeaponEntityComp->RecoilInfo, 0, sizeof(FSRecoilInfo));

    // 其他参数清零
    ShootWeaponEntityComp->ShotGunCenterPerc = judianvalue;
    ShootWeaponEntityComp->ShotGunVerticalSpread = judianvalue;
    ShootWeaponEntityComp->ShotGunHorizontalSpread = judianvalue;
    ShootWeaponEntityComp->GameDeviationFactor = judianvalue;
    ShootWeaponEntityComp->GameDeviationAccuracy = judianvalue;
    ShootWeaponEntityComp->CrossHairInitialSize = judianvalue;
    ShootWeaponEntityComp->CrossHairBurstSpeed = judianvalue;
    ShootWeaponEntityComp->CrossHairBurstIncreaseSpeed = judianvalue;
    ShootWeaponEntityComp->VehicleWeaponDeviationAngle = judianvalue;

    //Color dynamicColor = GetDynamicColor(judianva);

                                                        
                                                    }



if(anti1){

ASTExtraPlayerCharacter *localPlayer = 0;
        ASTExtraPlayerController *localPlayerController = 0;
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
        glWidth = ScreenWidth;
        glHeight = ScreenHeight;
                                                            }

if (过移速异常) {
    //g_LocalPlayer->STPlayerController->RPC_GiveUpGame();
    // 绕过移动检测
    UMoveAntiCheatComponent *bUseMoveAntiCheatCheck = nullptr;
    UMoveAntiCheatComponent *TolerateDistanceFractor = nullptr;
    UMoveAntiCheatComponent *MaxPacketLossRate = nullptr;
    // 禁用移动检测
    bUseMoveAntiCheatCheck = 0;
    TolerateDistanceFractor = 0;
    MaxPacketLossRate = 0;
           if(localPlayer){
                if(localPlayer->MoveAntiCheatComponent) {
                    localPlayer-> MoveAntiCheatComponent = 0;
                }
                if(localPlayerController) {
                    localPlayerController->AntiCheatManagerComp = 0;
                    localPlayerController->bShouldReportAntiCheat = (bool) 0;
                    localPlayerController->CheatManager = 0;
                }
                if(localPlayer->STCharacterMovement) {
                    localPlayer-> STCharacterMovement->bCheatFlying = (bool) 0;
                }
                
                if( localPlayer->STCharacterMovement){
                    localPlayer-> STCharacterMovement->CheatCheckSumFailed = (bool) 0;
                    localPlayer->STCharacterMovement->bCheatClientLocation = (bool) 0;
                    localPlayer-> STCharacterMovement->bUseTimeSpeedAntiCheatCheck = (bool) 0;
                }
            }
}

if(anti2){

        ASTExtraPlayerCharacter *localPlayer = 0;
        ASTExtraPlayerController *localPlayerController = 0;
    USceneComponent *SceneComponent = 0;
        ASTExtraShootWeapon *STExtraShootWeapon = 0;
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
                                                            }
                                                    
                                 if (X特效) {
                                    ShootWeaponEntityComp->ExtraHitPerformScale = 100;
                                                            ShootWeaponEntityComp->HUDAlphaDecreaseSpeedScale = 1.f;

}


         if (下雪) {
         g_LocalPlayer->STPlayerController->SetIsSnowy(true);
         
         
         }   





                         if (WideView) {
                auto ThirdPersonCameraComponent = localPlayer->ThirdPersonCameraComponent;

    if (ThirdPersonCameraComponent)
    {

                    *(float *) ((uintptr_t) &ThirdPersonCameraComponent->OrthoWidth - sizeof(float)) = WideValue;
                }
       }


if (下雨) {
         g_LocalPlayer->STPlayerController->SetIsRainy(true);
         }

                                                    //快速射击
                                                    if(快速射击){
                                                        ShootWeaponEntityComp->ShootInterval =0.000000f;
                                                    }
                                                }
                                        }
                                    }
                                }
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

                                float Distance = Player->GetDistanceTo(localPlayer) / 100.f;
                                if (Distance < 500.f) {
                            if([[NSUserDefaults standardUserDefaults] boolForKey:@"Alert"]){
                                bool Useless = false;
                                FVector2D EntityPos = WorldToRadar(localPlayer->K2_GetActorRotation().Yaw, Head, localPlayer->GetHeadLocation(true), NULL, NULL, FVector((float)screenWidth, (float)screenHeight, 0.f), Useless);
                                float radar_range =  [[NSUserDefaults standardUserDefaults] integerForKey:@"BackSize"];
                                FVector angle;
                                FVector MiddlePoint(((float)screenWidth / 2.f) - EntityPos.X, ((float)screenHeight / 2.f) - EntityPos.Y, 0.f);
                                VectorAnglesRadar(MiddlePoint, angle);
                                const auto AngleYawRadian = DEG2RAD(angle.Y + 180.f);
                                float Point_X = ((float)screenWidth / 2.f) + (radar_range) / 2.f * 8.f * cosf(AngleYawRadian);
                                
                                
                                float Point_Y = ((float)screenHeight / 2.f) + (radar_range) / 2.f * 8.f * sinf(AngleYawRadian);
                                
                                int Points_X = ((float)screenWidth / 2.f) + (radar_range) / 2.f * 8.f * cosf(AngleYawRadian);
                                
                                
                                int Points_Y = ((float)screenHeight / 2.f) + (radar_range) / 2.f * 8.f * sinf(AngleYawRadian);
                                
                                auto Teamid = Player->TeamID;
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
FVector2D BelowRoowwtSc;
if (gGameplayStatics->ProjectWorldToScreen(localPlayerController, Head, false, &BelowRoowwtSc)) {
    // 投影成功时执行的代码块
} else {
    RotateTriangle(points, angle.Y + 180.0f);
    float Thickness = 3.f;
    float dist = Player->GetDistanceTo(localPlayer) / 100.f;
    std::wstring Dis;

    Dis += std::to_wstring((int) dist);
    Dis += L"米";
                                                                       
float offset = 50.0f; // 向左移动的距离（像素）
Points_X -= offset;   // 减少 Points_X 的值
float offset1 = 60.0f; // 向上移动的距离（像素）
Points_Y -= offset1;   // 减少 Points_Y 的值

if (Player->bEnsure) {
    // 人机背地
    DrawArrows(HUD, points, Thickness, COLOR_WHITE); // No arrows if it Bots
    tslFont->LegacyFontSize = 15;
    DrawSmallOutlined(HUD, Dis, FVector2D(Points_X, Points_Y), COLOR_WHITE, COLOR_BLACK);
} else {
    DrawArrows(HUD, points, Thickness, visCol); // No arrows if it Bots
    tslFont->LegacyFontSize = 15;
    DrawSmallOutlined(HUD, Dis, FVector2D(Points_X, Points_Y), visCol, COLOR_BLACK);
}
}}
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


                                        // ESP LINE
                            if([[NSUserDefaults standardUserDefaults] boolForKey:@"Line"]){

                                            FVector screenPos = localPlayerController->PlayerCameraManager->GetCameraLocation();
                                            screenPos.Z += 350.0f;
                                            screenPos.Y += 350.0f;
                                            screenPos.X += 350.0f;
                                            if (!localPlayerController->LineOfSightTo(Player, screenPos, true)) {

DrawLine(HUD, {static_cast<float>(screenWidth / 2), 0}, {HeadSc.X, HeadSc.Y - 50}, 1.0f, COLOR_RED);

if (Player->bEnsure)
                            {
  DrawLine(HUD, {static_cast<float>(screenWidth / 2), 0}, {HeadSc.X, HeadSc.Y - 50}, 1.0f, COLOR_YELLOW);
 }                                         }

else {

DrawLine(HUD, {static_cast<float>(screenWidth / 2), 0}, {HeadSc.X, HeadSc.Y - 50}, 1.0f, COLOR_LIME);
                                            
if (Player->bEnsure)
                            {
  DrawLine(HUD, {static_cast<float>(screenWidth / 2), 0}, {HeadSc.X, HeadSc.Y - 50}, 1.0f, COLOR_WHITE);
 }

}
                                        
}
                                        // ESP SKELETON
                            if([[NSUserDefaults standardUserDefaults] boolForKey:@"Skeleton"]){

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

                                                    }
                                                }
                                                lastBone = currentBone;
                                            }
                                        }
                                    }

                                        
                            if([[NSUserDefaults standardUserDefaults] boolForKey:@"Box"]){
                                            float boxHeight = abs(HeadSc.Y - RootSc.Y);
                                           float boxWidth = boxHeight * 0.65f;
                                           FVector2D vBox = FVector2D(HeadSc.X - (boxWidth / 2), HeadSc.Y);
                                           Box4Line(HUD, 1.5f, vBox.X, vBox.Y, boxWidth, boxHeight, COLOR_WHITE);
                                        }



if(小黑点){
                                            float boxHeight = abs(HeadSc.Y - RootSc.Y);
                                           float boxWidth = boxHeight * 0.00000000000005f;
                                           FVector2D vBox = FVector2D(HeadSc.X - (boxWidth / 1), HeadSc.Y);
                                           Box4Line(HUD, 1.1f, vBox.X, vBox.Y, boxWidth, boxHeight, COLOR_BLACK);
                                        }



                                        // ESP HEALTH血条
      //if (Config.ESPMenu.Health) {
                            if([[NSUserDefaults standardUserDefaults] boolForKey:@"Health"]){

    int CurHP = (int)std::max(0, std::min((int)Player->Health, (int)Player->HealthMax));
    int MaxHP = (int)Player->HealthMax;

    if (Player->Health == 0.0f && !Player->bDead) {
        CurHP = Player->NearDeathBreath;
        if (Player->NearDeatchComponent) {
            MaxHP = Player->NearDeatchComponent->BreathMax;
        }
    }

//auto mWidthScale = std::min(0.1f * Distance, 35.f);
                                    auto mWidth = 148.0f;
                                    auto mHeight = 20.0f;
                                    HeadSc.X -= (mWidth / 2);
                                    HeadSc.Y -= (mHeight * 1.5f);
 bool IsVisible = localPlayerController ->LineOfSightTo (Player, {0, 0, 0}, true);
    std::string s;
    s += std::to_string((int)Distance);
    if  (IsVisible) {
        if  (Player ->bEnsure) {
         //   DrawCircle(HUD, points.at(0).X, points.at(0).Y, 6, 100, COLOR_LIME);
DrawFilledRectangle(HUD, {HeadSc.X, HeadSc.Y - 10}, (CurHP * mWidth / MaxHP), mHeight, {0, 1.f, 0, 0.55f});

        } else {
DrawFilledRectangle(HUD, {HeadSc.X, HeadSc.Y - 10}, (CurHP * mWidth / MaxHP), mHeight, {1.f, 0, 0, 0.55f});
        }
    } else {
        if  (Player ->bEnsure) {
     DrawFilledRectangle(HUD,{HeadSc.X, HeadSc.Y - 10}, (CurHP * mWidth / MaxHP), mHeight,  {0, 1.f, 0, 0.545f});
        } else {
     DrawFilledRectangle(HUD,{HeadSc.X, HeadSc.Y - 10}, (CurHP * mWidth / MaxHP), mHeight,  {0, 1.f, 1.f, 0.545f});
        }
    }







        
                                                          

                                                      

                                 
if (Player->TeamID == 1 || Player->TeamID == 21 || Player->TeamID == 31 || Player->TeamID == 41 || Player->TeamID == 51 || Player->TeamID == 61 || Player->TeamID == 71 || Player->TeamID == 81 || Player->TeamID == 91 || Player->TeamID == 101 || Player->TeamID == 111 || Player->TeamID == 121 || Player->TeamID == 131 || Player->TeamID == 141 || Player->TeamID == 151 || Player->TeamID == 161 || Player->TeamID == 171 || Player->TeamID == 181 || Player->TeamID == 191 || Player->TeamID == 201 || Player->TeamID == 211){

DrawFilledRectangle(HUD, {HeadSc.X, HeadSc.Y - 32}, mWidth, 22.0f, {0.85f, 0.33f, 0.84f, 0});

} else if (Player->TeamID == 2 || Player->TeamID == 22 || Player->TeamID == 32 || Player->TeamID == 42 || Player->TeamID == 52 || Player->TeamID == 62 || Player->TeamID == 72 || Player->TeamID == 82 || Player->TeamID == 92 || Player->TeamID == 102 || Player->TeamID == 112 || Player->TeamID == 122 || Player->TeamID == 132 || Player->TeamID == 142 || Player->TeamID == 152 || Player->TeamID == 162 || Player->TeamID == 172 || Player->TeamID == 182 || Player->TeamID == 192 || Player->TeamID == 202 || Player->TeamID == 212){

DrawFilledRectangle(HUD, {HeadSc.X, HeadSc.Y - 32}, mWidth, 22.0f, {0.62f, 0.12f, 0.94f, 0});

} else if (Player->TeamID == 3 || Player->TeamID == 23 || Player->TeamID == 33 || Player->TeamID == 43 || Player->TeamID == 53 || Player->TeamID == 63 || Player->TeamID == 73 || Player->TeamID == 83 || Player->TeamID == 93 || Player->TeamID == 103 || Player->TeamID == 113 || Player->TeamID == 123 || Player->TeamID == 133 || Player->TeamID == 143 || Player->TeamID == 153 || Player->TeamID == 163 || Player->TeamID == 173 || Player->TeamID == 183 || Player->TeamID == 193 || Player->TeamID == 203 || Player->TeamID == 213){

DrawFilledRectangle(HUD, {HeadSc.X, HeadSc.Y - 32}, mWidth, 22.0f, {0.0f, 1.0f, 0.5f, 0});

} else if (Player->TeamID == 4 || Player->TeamID == 24 || Player->TeamID == 34 || Player->TeamID == 44 || Player->TeamID == 54 || Player->TeamID == 64 || Player->TeamID == 74 || Player->TeamID == 84 || Player->TeamID == 94 || Player->TeamID == 104 || Player->TeamID == 114 || Player->TeamID == 124 || Player->TeamID == 134 || Player->TeamID == 144 || Player->TeamID == 154 || Player->TeamID == 164 || Player->TeamID == 174 || Player->TeamID == 184 || Player->TeamID == 194 || Player->TeamID == 204 || Player->TeamID == 214){

DrawFilledRectangle(HUD, {HeadSc.X, HeadSc.Y - 32}, mWidth, 22.0f, {0.53f, 0.8f, 0.92f, 0});

} else if (Player->TeamID == 5 || Player->TeamID == 25 || Player->TeamID == 35 || Player->TeamID == 45 || Player->TeamID == 55 || Player->TeamID == 65 || Player->TeamID == 75 || Player->TeamID == 85 || Player->TeamID == 95 || Player->TeamID == 105 || Player->TeamID == 115 || Player->TeamID == 125 || Player->TeamID == 135 || Player->TeamID == 145 || Player->TeamID == 155 || Player->TeamID == 165 || Player->TeamID == 175 || Player->TeamID == 185 || Player->TeamID == 195 || Player->TeamID == 205 || Player->TeamID == 215){

DrawFilledRectangle(HUD, {HeadSc.X, HeadSc.Y - 32}, mWidth, 22.0f, {0.0f, 1.0f, 1.0f, 0});

} else if (Player->TeamID == 6 || Player->TeamID == 26 || Player->TeamID == 36 || Player->TeamID == 46 || Player->TeamID == 56 || Player->TeamID == 66 || Player->TeamID == 76 || Player->TeamID == 86 || Player->TeamID == 96 || Player->TeamID == 106 || Player->TeamID == 116 || Player->TeamID == 126 || Player->TeamID == 136 || Player->TeamID == 146 || Player->TeamID == 156 || Player->TeamID == 166 || Player->TeamID == 176 || Player->TeamID == 186 || Player->TeamID == 196 || Player->TeamID == 206 || Player->TeamID == 216){

DrawFilledRectangle(HUD, {HeadSc.X, HeadSc.Y - 32}, mWidth, 22.0f, {0.12f, 0.56f, 1.0f, 0});

} else if (Player->TeamID == 7 || Player->TeamID == 27 || Player->TeamID == 37 || Player->TeamID == 47 || Player->TeamID == 57 || Player->TeamID == 67 || Player->TeamID == 77 || Player->TeamID == 87 || Player->TeamID == 97 || Player->TeamID == 107 || Player->TeamID == 117 || Player->TeamID == 127 || Player->TeamID == 137 || Player->TeamID == 147 || Player->TeamID == 157 || Player->TeamID == 167 || Player->TeamID == 177 || Player->TeamID == 187 || Player->TeamID == 197 || Player->TeamID == 207 || Player->TeamID == 217){

DrawFilledRectangle(HUD, {HeadSc.X, HeadSc.Y - 32}, mWidth, 22.0f, {1.0f, 0.0f, 1.0f, 0});

} else if (Player->TeamID == 8 || Player->TeamID == 18 || Player->TeamID == 28 || Player->TeamID == 38 || Player->TeamID == 48 || Player->TeamID == 58 || Player->TeamID == 68 || Player->TeamID == 78 || Player->TeamID == 88 || Player->TeamID == 98 || Player->TeamID == 108 || Player->TeamID == 118 || Player->TeamID == 128 || Player->TeamID == 138 || Player->TeamID == 148 || Player->TeamID == 158 || Player->TeamID == 168 || Player->TeamID == 178 || Player->TeamID == 188 || Player->TeamID == 198 || Player->TeamID == 208 || Player->TeamID == 218){

DrawFilledRectangle(HUD, {HeadSc.X, HeadSc.Y - 32}, mWidth, 22.0f, {0.16f, 0.14f, 0.13f, 0});

} else if (Player->TeamID == 9 || Player->TeamID == 19 || Player->TeamID == 29 || Player->TeamID == 39 || Player->TeamID == 49 || Player->TeamID == 59 || Player->TeamID == 69 || Player->TeamID == 79 || Player->TeamID == 89 || Player->TeamID == 99 || Player->TeamID == 109 || Player->TeamID == 119 || Player->TeamID == 129 || Player->TeamID == 139 || Player->TeamID == 149 || Player->TeamID == 159 || Player->TeamID == 169 || Player->TeamID == 179 || Player->TeamID == 189 || Player->TeamID == 199 || Player->TeamID == 209 || Player->TeamID == 219){

DrawFilledRectangle(HUD, {HeadSc.X, HeadSc.Y - 32}, mWidth, 22.0f, {1.0f, 0.5f, 0.31f, 0});

} else if (Player->TeamID == 10){

DrawFilledRectangle(HUD, {HeadSc.X, HeadSc.Y - 32}, mWidth, 22.0f, {0.42f, 0.35f, 0.8f, 0});

} else if (Player->TeamID == 11){

DrawFilledRectangle(HUD, {HeadSc.X, HeadSc.Y - 32}, mWidth, 22.0f, {0.5f, 1.0f, 0.8f, 0});

} else if (Player->TeamID == 12){

DrawFilledRectangle(HUD, {HeadSc.X, HeadSc.Y - 32}, mWidth, 22.0f, {0.25f, 0.41f, 0.88f, 0});

} else if (Player->TeamID == 13){

DrawFilledRectangle(HUD, {HeadSc.X, HeadSc.Y - 32}, mWidth, 22.0f, {1.0f, 0.5f, 0.0f, 0});

} else if (Player->TeamID == 14){

DrawFilledRectangle(HUD, {HeadSc.X, HeadSc.Y - 32}, mWidth, 22.0f, {0.94f, 0.9f, 0.5f, 0});

} else if (Player->TeamID == 15){

DrawFilledRectangle(HUD, {HeadSc.X, HeadSc.Y - 32}, mWidth, 22.0f, {0.75f, 0.75f, 0.75f, 0});

} else if (Player->TeamID == 16){

DrawFilledRectangle(HUD, {HeadSc.X, HeadSc.Y - 32}, mWidth, 22.0f, {1.0f, 0.92f, 0.8f, 0});

} else if (Player->TeamID == 17){

DrawFilledRectangle(HUD, {HeadSc.X, HeadSc.Y - 32}, mWidth, 22.0f, {0.89f, 0.09f, 0.05f, 0});

}else {

DrawFilledRectangle(HUD, {HeadSc.X, HeadSc.Y - 32}, mWidth, 22.0f, {0.89f, 0.09f, 0.05f, 0});

}

}




// ESP INFO
                            if([[NSUserDefaults standardUserDefaults] boolForKey:@"Weapon"]){
                    //    if (Player->bEnsure){

          auto WeaponManagerComponent = Player->WeaponManagerComponent;
        if (WeaponManagerComponent) {
            {
          auto CurrentWeaponReplicated = (ASTExtraShootWeapon *)WeaponManagerComponent->CurrentWeaponReplicated;
          if (CurrentWeaponReplicated) {
           auto WeaponId = (int)CurrentWeaponReplicated->GetWeaponID();
           if (WeaponId) {
            

            std::wstring s;
            s += CurrentWeaponReplicated->GetWeaponName().ToWString();
        robotoFont->LegacyFontSize = 10.0f;
         DrawOutlinedText(HUD, FString(s), FVector2D(RootSc.X, (HeadSc.Y - 28)), FLinearColor(1.0, 0.4980392156862745, 0.0, 1.0), COLOR_BLACK, true);
           }
      }
         }
        }
        
       }

//名字➕队伍
//名字➕队伍
                            if([[NSUserDefaults standardUserDefaults] boolForKey:@"Name"]){

                        robotoFont->LegacyFontSize = 9.f;
                        std::wstring knockedstr = L"[倒地]";

                        std::wstring Text;
                         
                         Text = std::to_wstring(Player->TeamID) + L"  " + Player->PlayerName.ToWString();
                         
                  //Text = Player->PlayerName.ToWString();
                                   
                        
                        if (Player->Health <= 0)
                        {
                            if (Player->bEnsure)
                            {
                            DrawOutlinedText(HUD, FString(knockedstr), FVector2D(RootSc.X - 1, (RootSc.Y + 0)), COLOR_PLAYER, COLOR_BLACK, true);
                            }
                            else
                            {
                            DrawOutlinedText(HUD, FString(knockedstr), FVector2D(RootSc.X - 1, (RootSc.Y + 0)), FLinearColor(255 / 255.0f, 220 / 255.0f, 220 / 255.0f, 0.8f), COLOR_BLACK, true);
                            }
                        }
                        else
                        {
                            if (!Player->bEnsure)

                            {
DrawOutlinedText(HUD, FString(Text), FVector2D(RootSc.X -13, (HeadSc.Y - 0)), COLOR_CAR, COLOR_BLACK, true);
                            }
                            else
                            {

DrawOutlinedText(HUD, FString(Text), FVector2D(RootSc.X - 13, (HeadSc.Y - 0)), COLOR_CAR, COLOR_BLACK, true);
                            }
                        }
                    }

                            if([[NSUserDefaults standardUserDefaults] boolForKey:@"thongtin"]){
       
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
            //std::wstring s;

            s += "\n ANTIBAN SAFE ";
            s += "\n 对局信息 ";
            s += "\n 当前对局ID : ";
            s += std::to_string((int) ingame->GameID);
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
 if([[NSUserDefaults standardUserDefaults] boolForKey:@"箱子"]){

                   std::vector<APickUpListWrapperActor*>LootboxBase;
                   GetAllActors(LootboxBase);
                   
                    for (auto actor = LootboxBase.begin(); actor != LootboxBase.end(); actor++) {
                         auto Pick = *actor;                                                
                                                
                         if (!Pick->RootComponent)
                                continue;
                    
                          float Distance = Pick->GetDistanceTo(localPlayer) / 100.0f;
                                                                    
                         if (Distance >150.0)//骨灰盒显示最大距离
                                continue;
                   
                           FVector2D PickUpListsPos;                  
                    
                         if (W2S(Pick->K2_GetActorLocation(), &PickUpListsPos)) {
                                //std::string s = "\n Box";
                                std::string s;
                                s += "(";
                                s += std::to_string((int) Distance);
                                s += "米)";
                            tslFont->LegacyFontSize = 10;
                        
                DrawOutlinedText1(HUD, FString("Box"), {PickUpListsPos.X, PickUpListsPos.Y}, COLOR_WHITE, COLOR_BLACK, true);                            
                        }
                    }
                }
      if([[NSUserDefaults standardUserDefaults] boolForKey:@"血条2"]){

float CurHP = std::max(0.f, std::min(Player->Health, Player->HealthMax));
                            float MaxHP = Player->HealthMax;
                            float HealthPercentage = CurHP / MaxHP;
                            FLinearColor HPColor = FLinearColor(1.0f - HealthPercentage, HealthPercentage, 0.0f, HealthPercentage); // Added alpha
                            FVector HeadLocation = Player->GetHeadLocation(true);
                            HeadLocation.Z += 30.f;
                            FVector2D HeadScreenPos;
                            if (UGameplayStatics::ProjectWorldToScreen(localPlayerController, HeadLocation, false, &HeadScreenPos)) {
                            float BarWidth = 160;
                            float BarHeight = 28;
                            HeadScreenPos.X -= BarWidth / 2;
                            HeadScreenPos.Y -= BarHeight * 1.5f;
							if(!Player->bEnsure) {
							DrawFilledRectangle(HUD, {HeadScreenPos.X, HeadScreenPos.Y}, (CurHP * BarWidth / MaxHP), BarHeight, COLOR_RED);
							} else {
							DrawFilledRectangle(HUD, {HeadScreenPos.X, HeadScreenPos.Y}, (CurHP * BarWidth / MaxHP), BarHeight, COLOR_GREEN);
							}
                            }
}
//仿鲨鱼血条							
if ([[NSUserDefaults standardUserDefaults] boolForKey:@"血条2"]) {
    auto AboveHead = Player->GetHeadLocation(true);
    AboveHead.Z += 35.f;
    FVector2D AboveHeadSc;
    if (gGameplayStatics->ProjectWorldToScreen(localPlayerController, AboveHead, false, &AboveHeadSc)) {
        tslFont->LegacyFontSize = fmax(5, 11 - (int)(Distance / 80));
        float txtWidth, txtHeight;
        HUD->GetTextSize(Player->PlayerName, tslFont, 1.f, &txtWidth, &txtHeight);
        if (!Player->bIsAI) {
            DrawOutlinedText(HUD, Player->PlayerName, {AboveHeadSc.X, AboveHeadSc.Y - txtHeight}, COLOR_WHITE, COLOR_BLACK, true);
        } else {
            DrawOutlinedText(HUD, FString("BOT"), {AboveHeadSc.X, AboveHeadSc.Y - txtHeight}, COLOR_WHITE, COLOR_BLACK, true);
        }
        tslFont->LegacyFontSize = TSL_FONT_DEFAULT_SIZE;
    }
    std::wstring ws;
    std::wstring s;
    // 队伍 id
    ws += L"[";
    ws += std::to_wstring(Player->TeamID);
    ws += L"]";
    // 距离
    s += L"[";
    s += std::to_wstring((int) Distance);
    s += L"]";
    tslFont->LegacyFontSize = fmax(5, 12 - (int)(Distance / 80));
    float txtWidth, txtHeight;
    HUD->GetTextSize(Player->PlayerName, tslFont, 1.f, &txtWidth, &txtHeight);
    DrawOutlinedText(HUD, s, FVector2D(AboveHeadSc.X + 75, AboveHeadSc.Y - 50), COLOR_YELLOW, COLOR_BLACK, true);
    DrawOutlinedText(HUD, ws, FVector2D(AboveHeadSc.X - 70, AboveHeadSc.Y - 50), COLOR_GREEN, COLOR_BLACK, true);  // 调整后的X坐标
}


//熊猫血条
                            if([[NSUserDefaults standardUserDefaults] boolForKey:@"血条1"]){

                                float CurHP = std::max(0.f, std::min(Player->Health, Player->HealthMax));
                                float MaxHP = Player->HealthMax;
                                auto WeaponManagerComponent = Player->WeaponManagerComponent;
                                std::wstring wep;
                                
                                
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
                                auto AboveHead =  Player->GetBonePos("Head", {});
                                auto rot =  Player->GetBonePos("Root", {});
                               // AboveHead.Z+=60;
                                FVector2D AboveHeadSc;
                                FVector2D ROT3;
                                
                               
                                bool IsVisible = localPlayerController ->LineOfSightTo(Player, { 0, 0, 0 }, false);
                                if(IsVisible) {
                                    //green
                                    visCol.R = 0.f;
                                    visCol.G = 1.f;
                                    visCol.B = 0.f;
                                    visCol.A = 1.f;
                                }else {
                                    //red
                                    visCol.R = 1.f;
                                    visCol.G = 0.f;
                                    visCol.B = 0.f;
                                    visCol.A = 1.f;
                                }
                                if(Player->Health==0){
                                    //倒地 255 165 0 橙色
                                    HPBorderColor.R=255/255;
                                    HPBorderColor.G=165/255;
                                    HPBorderColor.B=0/255;
                                    HPBorderColor.A=0.7;
                                    
                                    
                                }
                              
                              
                                if(Player->IsRescueingOther){
                                   
                                    //倒地 255 165 0 橙色
                                    HPBorderColor.R=0/255;
                                    HPBorderColor.G=1;
                                    HPBorderColor.B=1;
                                    HPBorderColor.A=0.7;
                                }

                             
                              
                                if(Player->IsRescueingOther){
                                  
                                    //倒地 255 165 0 橙色
                                    Color.R=0/255;
                                    Color.G=1;
                                    Color.B=1;
                                    Color.A=0.5;
                                }
                                                                
                                
                                if(Player->bEnsure){
                                    //人机 血量->白色
                                    Color.R=0;
                                    Color.G=1;
                                    Color.B=0;
                                    Color.A=0.5;
                                    
                                   
                                    
                                }else{
                                    //真人
                                    if(IsVisible){
                                        //漏了 绿色
                                        Color.R=1;
                                        Color.G=0;
                                        Color.B=0;
                                        Color.A=0.5;
                                        
                                    }else{
                                        //没漏 红色
                                        Color.R=1;
                                        Color.G=0;
                                        Color.B=0;
                                        Color.A=0.5;
                                        
                                    }
                                  
                                    
                                    
                                }
                                    
                                    
                                    
                                    if(Player->bEnsure){
                                        //人机 血量->白色
                                        HPBorderColor.R=0;
                                        HPBorderColor.G=1;
                                        HPBorderColor.B=0;
                                        HPBorderColor.A=0.7;
                                    }else{
                                        //真人
                                        if(IsVisible){
                                            //漏了 绿色
                                            HPBorderColor.R=1;
                                            HPBorderColor.G=0;
                                            HPBorderColor.B=0;
                                            HPBorderColor.A=0.7;
                                            
                                        }else{
                                            //没漏 红色
                                            HPBorderColor.R=1;
                                            HPBorderColor.G=0;
                                            HPBorderColor.B=0;
                                            HPBorderColor.A=0.7;
                                            
                                        }
                                       
                                        
                                        
                                        
                                    }
                                    
                                    
                                    
                                if ((gGameplayStatics->ProjectWorldToScreen(localPlayerController, AboveHead, false, &AboveHeadSc))&&(gGameplayStatics->ProjectWorldToScreen(localPlayerController, rot, false, &ROT3))) {
                                    auto Teamid = Player->TeamID;
                                    auto mWidthScale = std::min(0.1f * Distance, 35.f);
                                    auto mWidth = 90.f - mWidthScale;
                                    auto mHeight = mWidth * 0.175f;
                                    AboveHeadSc.X -= (100 / 2);
                                    AboveHeadSc.Y -= (mHeight * 1.5f);
                                    if(射线2){
                                        Canvas->K2_DrawLine({(float)ScreenWidth/2 , 8}, {AboveHeadSc.X , AboveHeadSc.Y - 35}, 1, visCol);
                                    }
                                   
                                    
                                    std::wstring Name;
                                    {
                                        
                                        
                                        if (Player->bEnsure)
                                            Name = L" BOT";
                                        
                                        else if (Player->PlayerName.IsValid())
                                        {
                                            
                                            Name = Player->PlayerName.ToWString();
                                            
                                        }
                                        if(Player->Health==0)
                                            Name=L"倒地";
                                    }
                                    std::wstring Team;
                                    
                                    Team += std::to_wstring((int) Teamid);
                                    
                                    std::wstring Dis;
                                    
                                    
                                    std::wstring Gun;

                               
                                    Dis += std::to_wstring((int) Distance);
                                    Dis += L"M";
                                    
                            
                            if([[NSUserDefaults standardUserDefaults] boolForKey:@"血条1"]){
                                        
                                        auto WeaponManagerComponent = Player->WeaponManagerComponent;
                                        if (WeaponManagerComponent) {
                                            auto CurrentWeaponReplicated = (ASTExtraShootWeapon *)WeaponManagerComponent->CurrentWeaponReplicated;
                                            if (CurrentWeaponReplicated) {
                                                auto WeaponId = (int)CurrentWeaponReplicated->GetWeaponID();
                                                if (WeaponId) {
                                                    Gun += CurrentWeaponReplicated->GetWeaponName().ToWString();
                                                    
                                                }
                                            }
                                            
                                            
                                        }
                                      
                                    }
                                        //血量 边框
                                        DrawRectangle(HUD, {AboveHeadSc.X, AboveHeadSc.Y-40}, 120, 25, 1.0f, HPBorderColor);
                                        DrawFilledRectangle(HUD, {AboveHeadSc.X, AboveHeadSc.Y-40}, (CurHP * 120 / MaxHP), 25, Color);
                                        
                                    
                                        //信息
                                        robotoTinyFont->LegacyFontSize =15;
                                        
                                        DrawSmallOutlinedText(HUD,Team, FVector2D(AboveHeadSc.X, AboveHeadSc.Y-40), COLOR_WHITE, {0,0,0,1}, false);
                                        DrawSmallOutlinedText(HUD,Name, FVector2D(AboveHeadSc.X+20, AboveHeadSc.Y-40), COLOR_WHITE, {0,0,0,1}, false);
                                        
                                       DrawSmallOutlinedText(HUD,Dis, FVector2D(AboveHeadSc.X, AboveHeadSc.Y-40-20), COLOR_WHITE, {0,0,0,0}, false);
                                        DrawSmallOutlinedText(HUD,Gun, FVector2D(AboveHeadSc.X+65, AboveHeadSc.Y-40-20), COLOR_WHITE, {0,0,0,0}, false);

                                }
                                
                                
                                
                                
                                
                            }


                           if (MAD血条) {
                                    float CurHP = std::max(0.f, std::min(Player->Health, Player->HealthMax));
                                    float MaxHP = Player->HealthMax;
                                    
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
                                    auto mWidthScale = std::min(0.1f * Distance, 35.f);
                                    
                                    auto mWidth = 160.f - mWidthScale;
                                    auto mHeight = mWidth * 0.15f;
                                    
                                    auto mHeighthp = mWidth * 0.05f;
                                    
                                    
                                    
                                    HeadSc.X -= (mWidth / 2);
                                    HeadSc.Y -= (mHeight * 1.55f);
                                    // vẽ khung Tên
                                    //DrawFilledRectangle(HUD, {HeadSc.X, HeadSc.Y},  mWidth , mHeight, COLOR_BLACKHP);
                                    if (Player->Health <= 1.0f && !Player->bDead) {
                                        
                                        //thanh máu
                                        //DrawFilledRectangle(HUD, {HeadSc.X, HeadSc.Y - 9}, (CurHP * mWidth / MaxHP), mHeighthp, COLOR_YELLOWHP);
                                        // vẽ khung máu
                                        DrawRectangle(HUD, {HeadSc.X, HeadSc.Y - 10}, mWidth, mHeighthp, 1.4f, {0, 0, 0, 0.6});
                                        DrawRectangle(HUD, {HeadSc.X+40, HeadSc.Y - 10 }, mWidth-40, mHeighthp, 1.4f, {0, 0, 0, 0.6});
                                        DrawRectangle(HUD, {HeadSc.X+80, HeadSc.Y - 10}, mWidth-80, mHeighthp, 1.4f, {0, 0, 0, 0.6});
                                        DrawRectangle(HUD, {HeadSc.X+120, HeadSc.Y - 10}, mWidth-120, mHeighthp, 1.4f, {0, 0, 0, 0.6});
                                        
                                        
                                    }else{
                                        //thanh máu
                                        DrawFilledRectangle(HUD, {HeadSc.X, HeadSc.Y - 9}, (CurHP * mWidth / MaxHP), mHeighthp, visCol);
                                        // vẽ khung máu
                                        DrawRectangle(HUD, {HeadSc.X, HeadSc.Y - 10}, mWidth, mHeighthp, 1.4f, {0, 0, 0, 0.6});
                                        DrawRectangle(HUD, {HeadSc.X+40, HeadSc.Y - 10 }, mWidth-40, mHeighthp, 1.4f, {0, 0, 0, 0.6});
                                        DrawRectangle(HUD, {HeadSc.X+80, HeadSc.Y - 10}, mWidth-80, mHeighthp, 1.4f, {0, 0, 0, 0.6});
                                        DrawRectangle(HUD, {HeadSc.X+120, HeadSc.Y - 10}, mWidth-120, mHeighthp, 1.4f, {0, 0, 0, 0.6});
                                    }}
                            


if (辅助准心) {
DrawLine(HUD, FVector2D((glWidth / 2)-16, glHeight/2), FVector2D((glWidth / 2)+16, glHeight/2), 1.6, COLOR_RED);
DrawLine(HUD, FVector2D(glWidth / 2, (glHeight/2)-16), FVector2D(glWidth / 2, (glHeight/2)+16), 1.6, COLOR_RED);
}


if (微加速){
localPlayer->STCharacterMovement->MaxWalkSpeed = 9999990.0f;
localPlayer->CharacterMovement->bCheatFlying = false;
localPlayer->CharacterMovement->GroundFriction = 1.f;
for (int i = 0; i < Actors.size(); i++) {
auto Actor = Actors[i];
if (isObjectInvalid(Actor))
continue;
if (Actors[i]->IsA(ASTExtraBaseCharacter::StaticClass())) {
auto playerChar = (ASTExtraBaseCharacter *) Actors[i];
playerChar->HighWalkSpeed = 999999.0f;
playerChar->MaxCrouchSpeed = 999999.0f;
playerChar->MaxProneSpeed = 999999.0f;
playerChar->MaxSprintSpeed = 999999.0f;
playerChar->MaxSprintCrouchSpeed = 999999.0f;
playerChar->MaxSwimSpeed = 999999.0f;
playerChar->SpeedDynamicScale = 999999.0f;
playerChar->EnergySpeedScale = 999999.0f;
playerChar->SwitchWeaponSpeedScale = 999999.0f;
playerChar->StandRadius = 50.0f;
playerChar->DyingRadius = 50.0f;
}}}


if (msdmax) {
    g_LocalPlayer->CharacterMovement->MaxWalkSpeed = msdmaxValue*0.8f; 
    g_LocalPlayer->CharacterMovement->Acceleration = msdmaxValue*0.8f;
    //g_LocalPlayer->STPlayerController->AcknowledgePawn->CustomTimeDilation = DefaultWalkSpeed * msdmaxValue;
    g_LocalPlayer->CharacterMovement->MaxCustomMovementSpeed = msdmaxValue*0.8f;
    g_LocalPlayer->CharacterMovement->MaxAcceleration = msdmaxValue*0.8f;
    g_LocalPlayer->CharacterMovement->BrakingDecelerationWalking = msdmaxValue*0.8f;
    g_LocalPlayer->CharacterMovement->MaxWalkSpeedCrouched = msdmaxValue*0.8f;
    g_LocalPlayer->CharacterMovement->MinAnalogWalkSpeed = msdmaxValue*0.8f;
}





//雷达
                            //if(Config.ESPMenu.雷达预警1){
                            if([[NSUserDefaults standardUserDefaults] boolForKey:@"雷达预警1"]){

                                                                 bool out= false;

                                                       float PosX = [[NSUserDefaults standardUserDefaults] integerForKey:@"RadarX"];
                                                       float  PosY = [[NSUserDefaults standardUserDefaults] integerForKey:@"RadarY"];

                                                      float  SizeX =  [[NSUserDefaults standardUserDefaults] integerForKey:@"RadarSize"]; //Width of Radar Box.
                                                      float  SizeY =  [[NSUserDefaults standardUserDefaults] integerForKey:@"RadarSize"]; //Height of Radar Box.
                                                     

                                                        float RadarCenterX = PosX + (SizeX / 2);
                                                        float RadarCenterY = PosY + (SizeY / 2);
               
                                                         
                                                               
                                                        FVector MyPosition = Player->RootComponent->RelativeLocation;
                                                        FVector EnemyPosition = localPlayer->RootComponent->RelativeLocation;

                                
                          
                           
                                
                                
                                
                                float yaw =localPlayerController->PlayerCameraManager->CameraCache.POV.Rotation.Yaw;
                             
                                bool Useless = false;
                                FVector2D EntityPos = WorldToRadar(yaw, MyPosition, EnemyPosition, PosX, PosY, FVector((float)SizeX, (float)SizeY, 0.f), Useless);

                                std::wstring Dis;

                                Dis += std::to_wstring((int) Distance);
                                Dis += L"M";
                                DrawRadarcan(Canvas, yaw, EnemyPosition, MyPosition, PosX, PosY, SizeX, SizeY, {1,1,1,1});
                                if (Distance >= 0.0f && Distance < 500.0f){
                                                     //   draw->AddCircleFilled(ImVec2(single.X, single.Y), 3, SCOLORA);
                                    robotoTinyFont->LegacyFontSize = 12;
                                    Canvas->K2_DrawPolygon(nil,  FVector2D(EntityPos.X,EntityPos.Y), 8, 100, visCol);
                                    
                                  //  Canvas->K2_DrawPolygon(nil,  FVector2D(MyPosition.X,MyPosition.Y),8, 100, COLOR_BLACK);
                                    
                                    
                                                            DrawSmallText(HUD, Dis, FVector2D(EntityPos.X,EntityPos.Y), visCol);
                                                
                                                       }
                                                    }

              




                                        // ESP INFO
                            if([[NSUserDefaults standardUserDefaults] boolForKey:@"Distance"]){

                                        std::wstring distance;
                            distance = std::to_wstring((int) Distance) + L" M";
                            robotoFont->LegacyFontSize = 11.f;
                            DrawSmallOutlinedText(HUD, FString(distance), FVector2D(RootSc.X - 1, (RootSc.Y + 17)), COLOR_WHITE, COLOR_BLACK, true);

                        }
                                    }
                                }
                            }
if (Config.ESPMenu.车辆显示) {
 std::vector<ASTExtraVehicleBase*> VehicleBase;
 GetAllActors(VehicleBase);
 for (auto actor = VehicleBase.begin(); actor != VehicleBase.end(); actor++) {
auto Vehicle = *actor;
if (!Vehicle->Mesh)
continue;
if (!Vehicle->RootComponent)
continue;
float Distance = Vehicle->GetDistanceTo(localPlayer) / 100.f;
FVector2D vehiclePos;

                auto ROOT  =Vehicle->K2_GetActorLocation();
                ROOT.Z -=50;
                if (Distance > 10 && Distance <= 物资距离) {
                    if (gGameplayStatics->ProjectWorldToScreen(localPlayerController,ROOT, true, &vehiclePos)) {




//if (UGameplayStatics::ProjectWorldToScreen(localController, Vehicle->RootComponent->RelativeLocation, false, &vehiclePos)) {
UTexture2D* VehicleIcon = Vehicle->VehicleIcon;
UVehicleCommonComponent* VehicleCommon = Vehicle->VehicleCommon;
int VehicleIconWidth = VehicleIcon->ImportedSize.X == 128.f ? 38 : 35;
HUD->Canvas->K2_DrawTexture(VehicleIcon, FVector2D(vehiclePos.X+VehicleIconWidth,vehiclePos.Y - 55), FVector2D(64,64), FVector2D(0.0f, 0.0f), FVector2D(1.0f, 1.0f), COLOR_WHITE, EBlendMode::BLEND_Translucent, 90.f, FVector2D(0,0));
// 载具信息
float VehicleHP = 100 * VehicleCommon->HP / VehicleCommon->HPMax;
float VehicleFuel = 100 * VehicleCommon->Fuel / VehicleCommon->FuelMax;
std::wstring VehicleHPstr = L"血量: "+std::to_wstring((int)VehicleHP);
std::wstring VehicleFuelstr = L"油量: "+std::to_wstring((int)VehicleFuel);
tslFont->LegacyFontSize = 10;
DrawOutlinedText(HUD, VehicleHPstr,FVector2D(vehiclePos.X, vehiclePos.Y),FLinearColor(1.f, 1.f, 1.f, 1.f), FLinearColor(0.f, 0.f, 0.f, 1.f), true);
DrawOutlinedText(HUD, VehicleFuelstr,FVector2D(vehiclePos.X, vehiclePos.Y+12),FLinearColor(1.f, 1.f, 1.f, 1.f), FLinearColor(0.f, 0.f, 0.f, 1.f), true);
}
 }
  }
    }
    UGameplayStatics* gGameplayStatics = (UGameplayStatics*)UGameplayStatics::StaticClass();
    ///if (Config.ESPMenu.手雷预警)
    //{
        //std::vector < ASTExtraGrenadeBase * >GrenadeBase;
        ////GetAllActors(GrenadeBase);
        //for (auto actor = GrenadeBase.begin();
             ///actor != GrenadeBase.end(); actor++)
        //{
            //auto Grenade = *actor;
            //if(Grenade) {
                //if(Grenade->ItemDefineID.TypeSpecificID ==602002)
                    //continue;
                //if(Grenade->ItemDefineID.TypeSpecificID == 602004);
                //auto RootComponent = Grenade->RootComponent;
                //if (RootComponent) {
                    ///float gDistance =
                    ////Grenade->GetDistanceTo(localPlayer) /100.f;
                    //if (gDistance <= 200.f)
                    //{
                        //tslFont->LegacyFontSize =
                        //max(6, 15 - (int)(gDistance / 100.f));
                        //float txtWidth, txtHeight;
                        //std::wstring grenadetext = (L"<Grenade>");
                 
                        //HUD->GetTextSize(grenadetext,
                                          //tslFont, 1.f, &txtWidth,
                                          //&txtHeight);
                        //FVector2D Location;
                        //if (W2S
                            //(RootComponent->RelativeLocation, &Location))
                        //{
                            //DrawOutlinedText(HUD,
                                             //FString(
                                                     //grenadetext),
                                             //FVector2D(Location.X,
                                                       //Location.Y + 34),COLOR_RED, COLOR_BLACK, true);
                        //}
                        //tslFont->LegacyFontSize = TSL_FONT_DEFAULT_SIZE;
                        //if (gDistance < 13)
                        //{
                            //std::wstring gwarn;
                            //gwarn = std::wstring(L" 注意手雷！！");//iAwareTexSiz
                  
                            //tslFont->LegacyFontSize = 1 + iAwareTexSiz;
                            //DrawOutlinedText(HUD, FString(gwarn),
                                             //FVector2D(screenWidth / 2,
                                                       //screenHeight / 2),
                                             ////COLOR_RED, COLOR_BLACK, true);
                            //tslFont->LegacyFontSize =
                            //TSL_FONT_DEFAULT_SIZE;
                        //}//
                        //{
                            ////FVector bbOrigin =
                            ///RootComponent->RelativeLocation;
                            //FVector bbExtends(10, 10, 10);
                            //FVector bbOrigin2;
                            //bbOrigin -= bbExtends / 2;
                            // bottom plane
                            //FVector one = bbOrigin;
                            ////FVector two = bbOrigin;
                            ///two.X += bbExtends.X;
                            ///FVector three = bbOrigin;
                            //three.X += bbExtends.X;
                            ///three.Y += bbExtends.Y;
                            //FVector four = bbOrigin;
                            //four.Y += bbExtends.Y;
                            //FVector five = one;
                            //five.Z += bbExtends.Z;
                            //FVector six = two;
                            //six.Z += bbExtends.Z;
                            //（FVector seven = three;
                            //seven.Z += bbExtends.Z;
                            //FVector eight = four;
                            //eight.Z += bbExtends.Z;
                            //FVector2D s1, s2, s3, s4, s5, s6, s7, s8;
                            //if (W2S(one, &s1) && W2S(two, &s2)
                                //&& W2S(three, &s3) && W2S(four, &s4)
                                //&& W2S(five, &s5) && W2S(six, &s6)
                                //&& W2S(seven, &s7) && W2S(eight, &s8))
                            //{
                                //DrawLine(HUD, s1, s2, 1.3f, COLOR_RED);
                                //DrawLine(HUD, s2, s3,1.3f, COLOR_RED);
                                //DrawLine(HUD, s3, s4, 1.3f, COLOR_RED);
                                //DrawLine(HUD, s4, s1, 1.3f, COLOR_RED);
                                //DrawLine(HUD, s5, s6, 1.3f, COLOR_RED);
                                //DrawLine(HUD, s6, s7, 1.3f, COLOR_RED);
                                //DrawLine(HUD, s7, s8,1.3f, COLOR_RED);
                                //DrawLine(HUD, s8, s5, 1.3f, COLOR_RED);
                                //DrawLine(HUD, s1, s5, 1.3f, COLOR_RED);
                                //DrawLine(HUD, s2, s6, 1.3f, COLOR_RED);
                                //DrawLine(HUD, s3, s7, 1.3f, COLOR_RED);
                                //DrawLine(HUD, s4, s8, 1.3f, COLOR_RED);
                            //}
                        //}
                    //}
                //}
            //}
        //}
        //GrenadeBase.clear();
    //}
    //if (Config.ESPMenu.手雷预警)
    //{
                      if([[NSUserDefaults standardUserDefaults] boolForKey:@"手雷预警"]){

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
                       
                            tslFont->LegacyFontSize = 1 + iAwareTexSiz;
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
                            //人数显示

                            if (人数显示) {


    std::wstring numi = L"Player：" + std::to_wstring(totalEnemies) +
                        L"｜Bot：" + std::to_wstring(totalBots) + L" ";
    tslFont->LegacyFontSize = 25;
    DrawTextcan(HUD, FString(numi), {(float) screenWidth / 2, 100},
                COLOR_RED, COLOR_BLACK);
}
                        }
                    }
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

//void fixesp(AHUD *pHUD, void *pArgs){
    //auto Params = (AHUD_ReceiveDrawHUD_Params *) pArgs;
    //g_screenWidth = Params->SizeX;
    //g_screenHeight = Params->SizeY;
    //if(Params){
        //RenderESP(pHUD, Params->SizeX, Params->SizeY);
       
    //}
//}
    
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
if (ModSkinn && KillMessage){
const char *pBroadCast = ("Function ShadowTrackerExtra.STExtraPlayerController.BroadcastFatalDamageToClientWithStruct");
    if (pFunc) {
        if (pFunc->GetFullName() == pBroadCast) {
            ASTExtraPlayerController *pController = (ASTExtraPlayerController *) pObj;
            if (pController) {
                auto Params = (ASTExtraPlayerController_BroadcastFatalDamageToClientWithStruct_Params *) pArgs;
                if (Params) {
if (g_PlayerController->PlayerKey == Params->FatalDamageParameter.CauserKey && !g_PlayerController->STExtraBaseCharacter->CurrentVehicle && g_LocalPlayer->WeaponManagerComponent->CurrentWeaponReplicated){
    Params->FatalDamageParameter.CauserClothAvatarID = new_Skin.XSuits;
        //M416
     if(strstr(g_LocalPlayer->WeaponManagerComponent->CurrentWeaponReplicated->GetWeaponName().ToString(), "M416")){
                     Params->FatalDamageParameter.CauserWeaponAvatarID = new_Skin.M416_1;
      }
                    if(strstr(g_LocalPlayer->WeaponManagerComponent->CurrentWeaponReplicated->GetWeaponName().ToString(), "AKM")){
     Params->FatalDamageParameter.CauserWeaponAvatarID = new_Skin.AKM;
     }
     if(strstr(g_LocalPlayer->WeaponManagerComponent->CurrentWeaponReplicated->GetWeaponName().ToString(), "SCAR-L")){
                     Params->FatalDamageParameter.CauserWeaponAvatarID = new_Skin.Scar;
      }
                    if(strstr(g_LocalPlayer->WeaponManagerComponent->CurrentWeaponReplicated->GetWeaponName().ToString(), "M16A4")){
     Params->FatalDamageParameter.CauserWeaponAvatarID = new_Skin.M16A4;
     }
     if(strstr(g_LocalPlayer->WeaponManagerComponent->CurrentWeaponReplicated->GetWeaponName().ToString(), "GROZA")){
                     Params->FatalDamageParameter.CauserWeaponAvatarID = new_Skin.Groza;
      }
                    if(strstr(g_LocalPlayer->WeaponManagerComponent->CurrentWeaponReplicated->GetWeaponName().ToString(), "AUG")){
     Params->FatalDamageParameter.CauserWeaponAvatarID = new_Skin.AUG;
     }
     if(strstr(g_LocalPlayer->WeaponManagerComponent->CurrentWeaponReplicated->GetWeaponName().ToString(), "M762")){
                     Params->FatalDamageParameter.CauserWeaponAvatarID = new_Skin.M762;
      }

                    if(strstr(g_LocalPlayer->WeaponManagerComponent->CurrentWeaponReplicated->GetWeaponName().ToString(), "Kar98K")){
     Params->FatalDamageParameter.CauserWeaponAvatarID = new_Skin.K98;
     }
     if(strstr(g_LocalPlayer->WeaponManagerComponent->CurrentWeaponReplicated->GetWeaponName().ToString(), "M24")){
                     Params->FatalDamageParameter.CauserWeaponAvatarID = new_Skin.M24;
      }
                    if(strstr(g_LocalPlayer->WeaponManagerComponent->CurrentWeaponReplicated->GetWeaponName().ToString(), "AWM")){
     Params->FatalDamageParameter.CauserWeaponAvatarID = new_Skin.AWM;
     }
     if(strstr(g_LocalPlayer->WeaponManagerComponent->CurrentWeaponReplicated->GetWeaponName().ToString(), "DP-28")){
     Params->FatalDamageParameter.CauserWeaponAvatarID = new_Skin.DP28;
     }
     if(strstr(g_LocalPlayer->WeaponManagerComponent->CurrentWeaponReplicated->GetWeaponName().ToString(), "UMP")){
                     Params->FatalDamageParameter.CauserWeaponAvatarID = new_Skin.UMP;
      }
     if(strstr(g_LocalPlayer->WeaponManagerComponent->CurrentWeaponReplicated->GetWeaponName().ToString(), "Mk14")){
                     Params->FatalDamageParameter.CauserWeaponAvatarID = new_Skin.MK14;
      }
     if(strstr(g_LocalPlayer->WeaponManagerComponent->CurrentWeaponReplicated->GetWeaponName().ToString(), "Mk14 (Refined)")){
                     Params->FatalDamageParameter.CauserWeaponAvatarID = new_Skin.MK145;
      }
     if(strstr(g_LocalPlayer->WeaponManagerComponent->CurrentWeaponReplicated->GetWeaponName().ToString(), "MK146")){
                     Params->FatalDamageParameter.CauserWeaponAvatarID = new_Skin.MK146;
      }
     if(strstr(g_LocalPlayer->WeaponManagerComponent->CurrentWeaponReplicated->GetWeaponName().ToString(), "AUG")){
                     Params->FatalDamageParameter.CauserWeaponAvatarID = new_Skin.AUG;
      }
     if(strstr(g_LocalPlayer->WeaponManagerComponent->CurrentWeaponReplicated->GetWeaponName().ToString(), "MG3")){
                     Params->FatalDamageParameter.CauserWeaponAvatarID = new_Skin.MG3;
      }
     if(strstr(g_LocalPlayer->WeaponManagerComponent->CurrentWeaponReplicated->GetWeaponName().ToString(), "MG3 (Refined)")){
                     Params->FatalDamageParameter.CauserWeaponAvatarID = new_Skin.mg31;
      }
    
                    if(strstr(g_LocalPlayer->WeaponManagerComponent->CurrentWeaponReplicated->GetWeaponName().ToString(), "M249")){
     Params->FatalDamageParameter.CauserWeaponAvatarID = new_Skin.M249;
     }
     
  }
    
   }
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