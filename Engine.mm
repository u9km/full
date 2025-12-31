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
#include <vector>       
#include <cstdlib> 
#include <ctime>     
#include "imgui/imgui_internal.h"           
#include "ESP/Vector3.hpp"
#include "ESP/Vector2.hpp"
#import <Foundation/Foundation.h>
#import "ESP/UE4.h"
#import "API/APIClient.h"
#include "ESP/tahoma.h"
#import "View/OverlayView.h"
#import "Engine.h"
#import "Image/Icon.h"
//
//音乐
#import "yinyue.h"
//
bool 冻结大厅;
bool 好玩飞天;
bool 鲨鱼血条;
bool 引擎血条;
bool 蹲下飞天;
static float FT = 1.0f;
bool g_EnableScreenBlock = true;
UIWindow *menuWindow = nil;
bool 范围;
bool SDK过检 = true;
bool 游戏启动 = true;
bool ZERO血条;
float FanweiFOV;
float FanweiFOVT;
#define timer(sec) dispatch_after(dispatch_time(DISPATCH_TIME_NOW, sec * NSEC_PER_SEC), kkdispatch_get_main_queue(), ^
NSString *xrpb = NSSENCRYPT("Paste Key...");
#define kWidth  [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height
#define E(str) _xor_(str).c_str()
NSString *bundle;
uint64_t GUObjectArray;
uint64_t GNameFun;
#define Actors_Offset 0xA0
bool isAimKnocked = true;
bool IsValidAddress(kaddr addr) {
    return addr > 0x100000000 && addr < 0x2000000000;
}
static bool showSubOptions = false; 
static bool optionStates[4] = { false, false, false, false }; 
static bool showOptions = false;  
bool anti1 =false;
bool anti2 =false;
bool anti3 =false;
bool anti4 =false;
static bool 加速;
static float SpeedFOV = 1.0f;
//漏打定义
static int 算法 = 0;
static bool 
    // 头部和躯干（7个）
    is头, is脖子, is脖子2, is脊骨1, is脊骨2, is脊骨3, is盆骨,
    
    // 右臂（5个，已删除手指相关）
    is右锁骨, is右肩胛骨, is右上臂, is右小臂, is右手,
    
    // 左臂（5个，已删除手指相关）
    is左锁骨, is左肩胛骨, is左上臂, is左小臂, is左手,
    
    // 右腿（5个）
    is右大腿, is右膝盖, is右小腿, is右脚踝, is右脚,
    
    // 左腿（5个）
    is左大腿, is左膝盖, is左小腿, is左脚踝, is左脚;
bool 喵身体;
//特效
struct Particle {
    ImVec2 pos;         // 位置
    ImVec2 vel;         // 速度向量
    float size;         // 大小
    float alpha;        // 透明度
    float rotation;     // 旋转角度
    float rotationSpeed;// 旋转速度
};

struct LandEffect {
    ImVec2 pos;
    float radius;
    float alpha;
    int type;           // 0=雨 1=雪
    float pulse;        // 脉动动画参数
};

// 全局特效容器（移除血滴，保留雨雪）
static std::vector<Particle> raindrops;
static std::vector<Particle> snowflakes;
static std::vector<LandEffect> landEffects;

// 速度参数（macOS风格：流畅舒缓）
static float rainSpeed = 4.0f;
static float snowSpeed = 1.5f; 
static float textScrollSpeed = 25.0f; 

// 滚动文字（简洁优雅）
static const char* scrollText = "TG:@Mithril_PUBGM  Q:1056338801";
static float textX = 0.0f;
static float textWidth = 0.0f;
static float textPulse = 1.0f;  // 文字呼吸动画

// 初始化标记与风动效果参数
static bool isFirstInit = true;
static float windOffset = 0.0f;
static float windSpeed = 0.3f;

// macOS风格配色方案（与系统UI协调）
// 采用冷色调基础，与macOS默认窗口风格匹配
static const ImVec4 rainColor = ImVec4(0.55f, 0.70f, 0.85f, 0.7f);   // 柔和蓝灰色
static const ImVec4 snowColor = ImVec4(0.92f, 0.95f, 1.0f, 0.8f);    // 浅灰白色
static const ImVec4 textColor = ImVec4(0.2f, 0.2f, 0.2f, 0.9f);      // 深灰色文字（匹配macOS菜单）
static const ImVec4 highlightColor = ImVec4(1.0f, 1.0f, 1.0f, 0.8f); // 高光色

// --------------------------
// 初始化特效（macOS风格：精致不张扬）
// --------------------------
static void InitEffects(ImVec2 windowSize) {
    // 清空现有粒子
    raindrops.clear();
    snowflakes.clear();
    landEffects.clear();
    
    // 雨粒子（适度数量，避免视觉干扰）
    for (int i = 0; i < 80; i++) {
        raindrops.push_back({
            ImVec2(rand() % (int)windowSize.x, rand() % (int)windowSize.y),
            ImVec2(0.0f, 1.0f),
            1.0f + (rand() % 8) / 10.0f,   // 细微大小变化
            0.6f + (rand() % 30) / 100.0f, // 透明度变化
            0.0f,
            0.0f
        });
    }
    
    // 雪花粒子（增加数量，成为视觉主体）
    for (int i = 0; i < 100; i++) {
        snowflakes.push_back({
            ImVec2(rand() % (int)windowSize.x, rand() % (int)windowSize.y),
            ImVec2(0.0f, 1.0f),
            1.8f + (rand() % 20) / 10.0f,
            0.5f + (rand() % 40) / 100.0f,
            0.0f,
            (rand() % 20 - 10) / 20.0f     // 缓慢旋转
        });
    }
    
    // 初始化滚动文字（计算适合macOS字体的宽度）
    textWidth = ImGui::CalcTextSize(scrollText).x;
    textX = windowSize.x;  // 从右侧进入
}

// --------------------------
// 添加落地效果（微妙的视觉反馈）
// --------------------------
static void AddLandEffect(ImVec2 pos, int type) {
    landEffects.push_back({
        pos,
        1.0f,                  // 初始半径
        0.8f,                  // 初始透明度
        type,
        1.0f                   // 脉动参数
    });
}

// --------------------------
// 更新粒子（macOS风格：平滑自然）
// --------------------------
static void UpdateParticles(float deltaTime, ImVec2 windowSize, ImVec2 windowPos) {
    const float bottomY = windowSize.y - 10.0f;
    const float rightX = windowSize.x;
    
    // 风动效果（模拟自然微风，更柔和）
    windOffset += windSpeed * deltaTime;
    float wind = sinf(windOffset) * 2.0f;  // 左右摆动幅度减小
    
    // 更新雨滴（柔和下落）
    for (auto& p : raindrops) {
        // 风力影响随位置变化
        float windInfluence = (p.pos.y / windowSize.y) * wind * 0.7f;
        p.vel.x = windInfluence;
        p.vel.y = rainSpeed * (0.9f + p.size * 0.1f);
        
        // 更新位置
        p.pos.x += p.vel.x * deltaTime * 12;
        p.pos.y += p.vel.y * deltaTime * 12;
        
        // 边界检测与重置
        if (p.pos.y > bottomY || p.pos.x < 0 || p.pos.x > rightX) {
            AddLandEffect(ImVec2(windowPos.x + p.pos.x, windowPos.y + ImMin(p.pos.y, bottomY)), 0);
            p.pos = ImVec2(
                rand() % (int)windowSize.x,
                -10.0f - rand() % 60  // 随机延迟出现，避免整齐感
            );
            p.alpha = 0.6f + (rand() % 30) / 100.0f;
        }
    }
    
    // 更新雪花（缓慢飘落，更明显的摇摆）
    for (auto& p : snowflakes) {
        // 风力影响更明显，模拟轻盈感
        float windInfluence = (p.pos.y / windowSize.y) * wind * 1.5f;
        p.vel.x = windInfluence + (rand() % 20 - 10) / 150.0f;  // 随机偏移减小
        p.vel.y = snowSpeed * (0.8f + p.size * 0.2f);
        
        // 更新位置与旋转
        p.pos.x += p.vel.x * deltaTime * 12;
        p.pos.y += p.vel.y * deltaTime * 12;
        p.rotation += p.rotationSpeed * deltaTime * 1.5;
        
        // 雪花摇摆效果（更自然）
        p.rotation = sinf(p.pos.y * 0.08f) * 0.2f;
        
        // 边界检测与重置
        if (p.pos.y > bottomY || p.pos.x < 0 || p.pos.x > rightX) {
            AddLandEffect(ImVec2(windowPos.x + p.pos.x, windowPos.y + ImMin(p.pos.y, bottomY)), 1);
            p.pos = ImVec2(
                rand() % (int)windowSize.x,
                -10.0f - rand() % 120
            );
            p.alpha = 0.5f + (rand() % 40) / 100.0f;
            p.rotationSpeed = (rand() % 20 - 10) / 20.0f;
        }
    }
    
    // 更新滚动文字（macOS风格：缓慢优雅）
    textX -= textScrollSpeed * deltaTime;
    if (textX < -textWidth) {
        textX = windowSize.x;  // 循环滚动
    }
    
    // 文字呼吸动画（更微妙，符合macOS设计语言）
    textPulse = 1.0f + sinf(ImGui::GetTime() * 0.8f) * 0.05f;
    
    // 更新落地效果
    for (size_t i = 0; i < landEffects.size();) {
        auto& e = landEffects[i];
        e.radius += deltaTime * (e.type == 1 ? 1.8f : 3.5f);  // 雪花扩散更慢
        e.alpha -= deltaTime * (e.type == 1 ? 0.6f : 1.2f);   // 雪花消失更慢
        
        // 脉动效果（更柔和）
        e.pulse = 1.0f + sinf(ImGui::GetTime() * 8.0f) * e.alpha * 0.15f;
        
        if (e.alpha < 0.05f) {
            landEffects.erase(landEffects.begin() + i);
        } else {
            i++;
        }
    }
}

// --------------------------
// 绘制粒子（macOS风格：精致平滑）
// --------------------------
static void DrawParticles(ImDrawList* draw_list, ImVec2 windowPos, ImVec2 windowSize) {
    // 绘制雨滴（纤细柔和）
    for (const auto& p : raindrops) {
        ImVec2 pos = ImVec2(windowPos.x + p.pos.x, windowPos.y + p.pos.y);
        float lineLength = 7.0f + p.size * 1.5f;
        uint8_t alpha = (uint8_t)(p.alpha * 200);
        
        // 雨滴主体（抗锯齿线条）
        draw_list->AddLine(
            pos,
            ImVec2(pos.x, pos.y + lineLength),
            IM_COL32(
                (uint8_t)(rainColor.x * 255),
                (uint8_t)(rainColor.y * 255),
                (uint8_t)(rainColor.z * 255),
                alpha
            ),
            p.size * 0.7f  // 更纤细的线条
        );
        
        // 雨滴头部高光（微妙）
        if (p.size > 1.1f) {
            draw_list->AddCircleFilled(
                pos,
                p.size * 0.4f,
                IM_COL32(
                    (uint8_t)(highlightColor.x * 255),
                    (uint8_t)(highlightColor.y * 255),
                    (uint8_t)(highlightColor.z * 255),
                    (uint8_t)(alpha * 0.5f)
                ),
                8
            );
        }
    }
    
    // 绘制雪花（macOS风格：精致柔和）
    for (const auto& p : snowflakes) {
        ImVec2 pos = ImVec2(windowPos.x + p.pos.x, windowPos.y + p.pos.y);
        float s = p.size;
        uint8_t alpha = (uint8_t)(p.alpha * 180);
        
        // 雪花主体（柔和圆形）
        draw_list->AddCircleFilled(
            pos,
            s,
            IM_COL32(
                (uint8_t)(snowColor.x * 255),
                (uint8_t)(snowColor.y * 255),
                (uint8_t)(snowColor.z * 255),
                alpha
            ),
            16  // 更多边数，更平滑
        );
        
        // 雪花高光（模拟反光）
        ImVec2 highlightPos = ImVec2(
            pos.x + cosf(p.rotation) * s * 0.3f,
            pos.y + sinf(p.rotation) * s * 0.3f
        );
        draw_list->AddCircleFilled(
            highlightPos,
            s * 0.25f,
            IM_COL32(
                (uint8_t)(highlightColor.x * 255),
                (uint8_t)(highlightColor.y * 255),
                (uint8_t)(highlightColor.z * 255),
                (uint8_t)(alpha * 150)
            ),
            8
        );
        
        // 雪花棱角（微妙突出）
        for (int i = 0; i < 6; i++) {
            float angle = p.rotation + (i * 60.0f) * 0.01745f;
            ImVec2 spikePos = ImVec2(
                pos.x + cosf(angle) * s * 1.1f,
                pos.y + sinf(angle) * s * 1.1f
            );
            draw_list->AddLine(
                pos,
                spikePos,
                IM_COL32(
                    (uint8_t)(snowColor.x * 255),
                    (uint8_t)(snowColor.y * 255),
                    (uint8_t)(snowColor.z * 255),
                    (uint8_t)(alpha * 120)
                ),
                s * 0.2f  // 纤细的棱角
            );
        }
    }
    
    // 绘制落地效果（微妙不突兀）
    for (const auto& e : landEffects) {
        uint8_t alpha = (uint8_t)(e.alpha * 180);
        float scaledRadius = e.radius * e.pulse;
        
        if (e.type == 0) {
            // 雨滴落地涟漪（柔和扩散）
            draw_list->AddCircle(
                e.pos,
                scaledRadius,
                IM_COL32(
                    (uint8_t)(rainColor.x * 255),
                    (uint8_t)(rainColor.y * 255),
                    (uint8_t)(rainColor.z * 255),
                    alpha
                ),
                32,
                0.8f  // 纤细的线条
            );
            if (scaledRadius > 2.0f) {
                draw_list->AddCircle(
                    e.pos,
                    scaledRadius * 0.6f,
                    IM_COL32(
                        (uint8_t)(rainColor.x * 255),
                        (uint8_t)(rainColor.y * 255),
                        (uint8_t)(rainColor.z * 255),
                        (uint8_t)(alpha * 0.6f)
                    ),
                    32,
                    0.8f
                );
            }
        } else if (e.type == 1) {
            // 雪花落地效果（轻柔扩散）
            draw_list->AddCircleFilled(
                e.pos,
                scaledRadius * 0.7f,
                IM_COL32(
                    (uint8_t)(snowColor.x * 255),
                    (uint8_t)(snowColor.y * 255),
                    (uint8_t)(snowColor.z * 255),
                    (uint8_t)(alpha * 0.6f)
                ),
                16
            );
        }
    }

    // 绘制滚动文字（macOS风格：清晰优雅）
    ImVec2 textPos = ImVec2(
        windowPos.x + textX, 
        windowPos.y + windowSize.y - 45.0f  // 位置上移，更接近菜单
    );
    
    // 文字采用系统风格（无明显阴影，更简洁）
    draw_list->AddText(
        ImGui::GetFont(),  // 使用与macOS菜单匹配的字体
        36.0f * textPulse, // 稍小字体，更精致
        textPos,
        IM_COL32(
            (uint8_t)(textColor.x * 255),
            (uint8_t)(textColor.y * 255),
            (uint8_t)(textColor.z * 255),
            230  // 稍低透明度，不抢眼
        ),
        scrollText
    );
}
//
static bool 枪械变大;
static float Gun_Size;
static float 巨人;
static bool 人物变大;
bool giamgiat = false;
bool tiaosan= false;
bool init1 = false;
bool init2 = false;
bool init3 = false;
bool init4 = false;
bool init5 = false;
bool WideView = false;
bool 引擎绘制1 = false;
bool 秘银血条 = false;
bool shark = false;
bool feiche = false;
bool xiaxue = false;
bool xiayu = false;
bool gaotiao = false;
bool wuhou = false;
bool jinfang = false;
bool chongchongche = false;
float chongchongche1;
float chongchongche2;
float tocdoquay = 0.0f;
bool yinjiao = false;
static bool show_confirmation = false;
int WideValue = 120;

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

enum EAimTarget {
    Head = 0,
    Chest = 1
};

long l1 = 0xFF544;
long l2 = 0xFFFFF;
//const char * stack230 = 0;//index of class array 75
int stack_20;
int AimF = 3;//瞄准方式
int 追踪概率 =50;
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
struct JsonPreferences {
enum EAimTarget {
        Head = 0,
        Chest = 1,
        随机部位 =2,
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
bool MK145 = false;
bool MK14 = false;
bool MK146 = false;
bool M4145 = false;
bool mg31 = false;
bool mg32 = false;
bool mg33 = false;
bool P90 = false;
bool Bagg = false;
bool Face = false;
bool Outfit = false;
bool Parachute = false;
bool M416 = false;
bool AKM = false;
bool SCARL = false;
bool M762 = false;
bool AWM = false;
bool KAR98 = false;
bool M24 = false;
bool M16 = false;
bool M249 = false;
bool MG3 = false;
bool DP28 = false;
bool GROZA = false;
bool AUG = false;
bool PAN = false;
bool UZI = false;
bool UMP = false;
bool TOMMY = false;
bool BIZON = false;
bool ACE32 = false;
bool VECTOR = false;

    struct sConfig {
         struct sAimMenu {
            bool EnableAllHack;
            bool Enable = false;
            bool AimBot;
            bool Autofire;
            bool CameraCache;
            EAimTarget Target;
            EAimPriority Priority;
//            EAimTrigger Trigger;
            bool IgnoreKnocked;
            bool IgnoreBot;
            bool Prediction;
            bool VisCheck;
            bool Fov;
            bool LessRecoil;
            bool Norecoil;
            bool jinfang;
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
  int M16A4 = 1;
  int Scar = 1;
  int M416 = 1;
  int Groza = 1;
  int AUG = 1;
  int QBZ = 1;
  int M762 = 1;
  int MK145 = 1;
  int MK14 = 1;
  int MK146 = 1;
  int M4145 = 1;
  int mg31 = 1;
  int mg32 = 1;
  int mg33 = 1;
  int P90 = 1;
  int ACE32 = 1;
  int Parachute = 1;
  int UZI = 1;
  int UMP = 1;
  int Vector = 1;
  int Thompson = 1;
  int Bizon = 1;
  int K98 = 1;
  int M24 = 1;
  int AWM = 1;
  int DP28 = 1;
  int M249 = 1;
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
bool IsLootBox = false;
bool IsAirDrop = false;
int Interval = 1;
int counter;
float iAwareTexSiz = 20;
bool iAwareText = true;
float EspTextSiz = 1;
float IteTextSiz = 4;
float EspBoxThik = 2.0f;
float EspSktonThik = 1.5f;
float IsfovSlider = 150.0f;
float AimSmooth = 5.0f;
bool AimTouch = false;
bool antibypass = false;
//UISlider * Aimbot2;
//aimbot bool
float g_disstance = 150.f;
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
bool judian = false;
bool 十字架 = false;
bool 追踪修复 = false;
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
float Aimsmooth = 1.22f;
float Xs=3.1,Ys=3.1;
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
//用Fname读取骨骼名称
FVector GetBoneByName(ASTExtraPlayerCharacter *Actor, const struct FName BoneName) {
    return Actor->GetBonePos(BoneName, FVector());
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
  int AKM_Mag = 291001;
  int M16A4 = 101002;
  int M16A4_Stock = 205007;
  int M16A4_Mag = 291002;
  int Scar = 101003;
  int Scar_Mag = 291003;
  int Pan = 108004;
  int longyin_x66 = 203015;



  int longyin_x88 = 203005;
  int longyin_x666 = 203015;
  int longyin_x6666 = 203015;
  int longyin_x888 = 203005;
  int longyin_x8888 = 203005;
  int longyin_x1111 = 203001;
  int longyin_x11 = 203001;
  int longyin_x111 = 203001;
  int longyin_x2222 = 203008;
  int longyin_x222 = 203008;
  int longyin_x22 = 203008;
  int longyin_x33 = 203014;
  int longyin_x333 = 203014;
  int longyin_x3333 = 203014;
  int longyin_x4444 = 203004;
  int longyin_x444 = 203004;
  int longyin_x44 = 203004;

  int M416_buchang = 2010095;
  int M416_hondian = 203001;
  int M416_x22 = 203008; 
  int M416_x33 = 203014;
  int M416_x44 = 203004;
  int M416_x66 = 203015;
  int M416_kuorong = 2040135;
  int M416_qiangtuo = 2050025;
  int M416_chuizhi = 2020025;
  int M4a = 203004;
  int M4b = 202002;
  int M416_1 = 101004;
  int M416_2 = 291004;
  int M416_3 = 203008;
  int M416_4 = 205005;
  int M416_flash = 201010;
  int M416_compe = 201009;
  int M416_silent = 201011;
  int M416_reddot = 203001;
  int M416_holo = 203001;
  int M416_x2 = 203003;
  int M416_x3 = 203014;
  int M416_x4 = 203004;
  int M416_x6 = 203015;
  int M416_quickMag = 204012;
  int M416_extendedMag = 204011;
  int M416_quickNextended = 204013;
  int M416_stock = 205002;
  int M416_verical = 203015;
  int M416_angle = 202001;
  int M416_lightgrip = 202004;
  int M416_pink = 202005;
  int M416_lazer = 202007;
  int M416_thumb = 202006;

  int Groza = 101005;
  int MK145 = 1030075;
  int MK146 = 1030074;
  int M4145 = 1010045;
  int mg31 = 1050105;
  int mg32 = 1050106;
  int mg33 = 1050107;
  int QBZ = 101007;
  int AUG = 101006;
  int M762 = 101008;
  int M762_Mag = 291008;
  int ACE32 = 101102;
  int Honey = 101012;
  int UZI = 102001;
  int UMP = 102002;
  int Vector = 102003;
  int Thompson = 102004;
  int Bizon = 102005;
  int K98 = 103001;
  int M24 = 103002;
  int AWM = 103003;
  int AMR = 103012;
  int VSS = 103005;
  int SKS = 103004;
  int Mini14 = 103006;
  int MK14 = 103007;
  int SLR = 103009;
  int S1897 = 104002;
  int DP28 = 105002;
  int M249 = 105001;
  int MG3 = 105010;
  int P90 = 102105;
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
                    bag3 = 1501003174; //blood raven x suit
                    if (preferences.bag == 2)
                    bag3 = 1501003220; //Golden Pharaoh X-Suit
                    if (preferences.bag == 3)
                    bag3 = 1501003051; //Avalanche
                    if (preferences.bag == 4)
                    bag3 = 1501003443; //Irresidence
                    if (preferences.bag == 5)
                    bag3 = 1501003265; //Poseidon
                    if (preferences.bag == 6)
                    bag3 = 1501003321; //Arcane Jester X-suit
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
    new_Skin.XSuits = 1405174;
    new_Skin.XSuits1 = 40604012;
  }
  if (preferences.Config.Skin.XSuits == 12) {
    new_Skin.XSuits = 1407195;
  }
  if (preferences.Config.Skin.XSuits == 13) {
    new_Skin.XSuits = 1407194;
    new_Skin.XSuits1 = 1410436;
  }
if (preferences.Config.Skin.XSuits == 14) {
    new_Skin.XSuits = 1406891;
  }
  if (preferences.Config.Skin.XSuits == 15) {
    new_Skin.XSuits = 1400687;
  }
  if (preferences.Config.Skin.XSuits == 16) {
    new_Skin.XSuits = 1407196;
  }
  if (preferences.Config.Skin.XSuits == 17) {
    new_Skin.XSuits = 1407049;
  }
  if (preferences.Config.Skin.XSuits == 18) {
    new_Skin.XSuits = 1406897;
  }
  
  if (preferences.Config.Skin.XSuits == 19) {
    new_Skin.XSuits = 1406892;
  }
  if (preferences.Config.Skin.XSuits == 20) {
    new_Skin.XSuits = 1407049;
  }
  if (preferences.Config.Skin.XSuits == 21) {
    new_Skin.XSuits = 1407188;
  }
  
  

  if (preferences.Config.Skin.AKM == 0) {
    new_Skin.AKM = 101001;
    new_Skin.AKM_Mag = 205005;
  }
  if (preferences.Config.Skin.AKM == 1) {
    new_Skin.AKM = 1101001089;
    new_Skin.AKM_Mag = 1010010891;
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
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

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
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  if (preferences.Config.Skin.Scar == 0) {
    new_Skin.Scar = 101003;
    new_Skin.Scar_Mag = 291003;
  }
  if (preferences.Config.Skin.Scar == 1) {
    new_Skin.Scar = 1101003057;
    new_Skin.Scar_Mag = 1010030571;
  }
  if (preferences.Config.Skin.Scar == 2) {
    new_Skin.Scar = 1101003070;
    new_Skin.Scar_Mag = 1010030701;
  }
  if (preferences.Config.Skin.Scar == 3) {
    new_Skin.Scar = 1101003080;
    new_Skin.Scar_Mag = 1010030801;
  }
  if (preferences.Config.Skin.Scar == 4) {
    new_Skin.Scar = 1101003119;
    new_Skin.Scar_Mag = 1010031191;
  }
  if (preferences.Config.Skin.Scar == 5) {
    new_Skin.Scar = 1101003146;
    new_Skin.Scar_Mag = 1010031461;
  }
  if (preferences.Config.Skin.Scar == 6) {
    new_Skin.Scar = 1101003167;
    new_Skin.Scar_Mag = 1010031671;
  }
  if (preferences.Config.Skin.Scar == 7) {
    new_Skin.Scar = 1101003181;
    new_Skin.Scar_Mag = 1010031811;
  }
  ///////////////////////////////////

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
    new_Skin.M416_verical = 1010042136;
    new_Skin.M416_angle = 1010042134;
    new_Skin.M416_lightgrip = 1010042138;
    new_Skin.M416_pink = 1010042139;
    new_Skin.M416_lazer = 1010042144;
    new_Skin.M416_thumb = 1010042135;
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
  if (preferences.Config.Skin.AUG == 0)
    new_Skin.AUG = 101006;
  if (preferences.Config.Skin.AUG == 1)
    new_Skin.AUG = 1101006033;
  if (preferences.Config.Skin.AUG == 2)
    new_Skin.AUG = 1101006044;
  if (preferences.Config.Skin.AUG == 3)
    new_Skin.AUG = 1101006062;
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
  if (preferences.Config.Skin.ACE32 == 0)
    new_Skin.ACE32 = 101102;
  if (preferences.Config.Skin.ACE32 == 1)
    new_Skin.ACE32 = 1101102007;
  if (preferences.Config.Skin.ACE32 == 2)
    new_Skin.ACE32 = 1101102017;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  if (preferences.Config.Skin.MK145 == 0) {
    new_Skin.MK145 = 1030075;
    new_Skin.longyin_x66 = 203015;
    new_Skin.longyin_x88 = 203005;
    new_Skin.longyin_x11 = 203001;
    new_Skin.longyin_x22 = 203008;
    new_Skin.longyin_x33 = 203014;
    new_Skin.longyin_x44 = 203004;
  }
  if (preferences.Config.Skin.MK145 == 1) {
    new_Skin.MK145 = 1103007028;
    new_Skin.longyin_x66 = 1030070213;
    new_Skin.longyin_x88 = 1030070212;
    new_Skin.longyin_x11 = 1010040470;
    new_Skin.longyin_x22 = 1010040468;
    new_Skin.longyin_x33 = 1010040467;
    new_Skin.longyin_x44 = 1010040466;
  }
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  if (preferences.Config.Skin.MK14 == 0) {
    new_Skin.MK14 = 103007;
    new_Skin.longyin_x6666 = 203015;
    new_Skin.longyin_x8888 = 203005;
    new_Skin.longyin_x1111 = 203001;
    new_Skin.longyin_x2222 = 203008;
    new_Skin.longyin_x3333 = 203014;
    new_Skin.longyin_x4444 = 203004;
  }
  if (preferences.Config.Skin.MK14 == 1) {
    new_Skin.MK14 = 1103007028;
    new_Skin.longyin_x6666 = 1030070213;
    new_Skin.longyin_x8888 = 1030070212;
    new_Skin.longyin_x1111 = 1010040470;
    new_Skin.longyin_x2222 = 1010040468;
    new_Skin.longyin_x3333 = 1010040467;
    new_Skin.longyin_x4444 = 1010040466;
  }
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  if (preferences.Config.Skin.MK146 == 0) {
    new_Skin.MK146 = 1030074;
    new_Skin.longyin_x666 = 203015;
    new_Skin.longyin_x888 = 203005;
    new_Skin.longyin_x111 = 203001;
    new_Skin.longyin_x222 = 203008;
    new_Skin.longyin_x333 = 203014;
    new_Skin.longyin_x444 = 203004;
  }
  if (preferences.Config.Skin.MK146 == 1) {
    new_Skin.MK146 = 1103007028;
    new_Skin.longyin_x666 = 1030070213;
    new_Skin.longyin_x888 = 1030070212;
    new_Skin.longyin_x111 = 1010040470;
    new_Skin.longyin_x222 = 1010040468;
    new_Skin.longyin_x333 = 1010040467;
    new_Skin.longyin_x444 = 1010040466;
  }
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.M4145 == 0) {
    new_Skin.M4145 = 1010045;
    new_Skin.M416_buchang = 2010095;
    new_Skin.M416_hondian = 203001;
    new_Skin.M416_x22 = 203008;
    new_Skin.M416_x33 = 203014;
    new_Skin.M416_x44 = 203004;
    new_Skin.M416_x66 = 203015;
    new_Skin.M416_kuorong = 2040135;
    new_Skin.M416_qiangtuo = 2050025;
    new_Skin.M416_chuizhi = 2020025;
  }
  if (preferences.Config.Skin.M4145 == 1) {
    new_Skin.M4145 = 1101004046;
    new_Skin.M416_buchang = 1010040475;
    new_Skin.M416_hondian = 1010040470;
    new_Skin.M416_x22 = 1010040462;
    new_Skin.M416_x33 = 1010040467;
    new_Skin.M416_x44 = 1010040466;
    new_Skin.M416_x66 = 1010040481;
    new_Skin.M416_kuorong = 1010040473;
    new_Skin.M416_qiangtuo = 1010040463;
    new_Skin.M416_chuizhi = 1010040479;
  }
  if (preferences.Config.Skin.M4145 == 2) {
    new_Skin.M4145 = 1101004226;
    new_Skin.M416_buchang = 1010042237;
    new_Skin.M416_hondian = 1010042233;
    new_Skin.M416_x22 = 1010042215;
    new_Skin.M416_x33 = 1010042219;
    new_Skin.M416_x44 = 1010042218;
    new_Skin.M416_x66 = 1010042217;
    new_Skin.M416_kuorong = 1010042236;
    new_Skin.M416_qiangtuo = 1010042213;
    new_Skin.M416_chuizhi = 1010042243;
  }
  if (preferences.Config.Skin.M4145 == 3) {
    new_Skin.M4145 = 1101004209;
    new_Skin.M416_buchang = 1010042037;
    new_Skin.M416_hondian = 1010042029;
    new_Skin.M416_x22 = 1010042083;
    new_Skin.M416_x33 = 1010042026;
    new_Skin.M416_x44 = 1010042025;
    new_Skin.M416_x66 = 1010042024;
    new_Skin.M416_kuorong = 1010042036;
    new_Skin.M416_qiangtuo = 1010042093;
    new_Skin.M416_chuizhi = 1010042046;
  }
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  if (preferences.Config.Skin.mg31 == 0) {
    new_Skin.mg31 = 1050105;
  }
  if (preferences.Config.Skin.mg31 == 1) {
    new_Skin.mg31 = 1105010008;
  }
  if (preferences.Config.Skin.mg31 == 2) {
    new_Skin.mg33 = 1105010019;
  }
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  if (preferences.Config.Skin.mg32 == 0) {
    new_Skin.mg32 = 1050106;
  }
  if (preferences.Config.Skin.mg32 == 1) {
    new_Skin.mg32 = 1105010008;
  }
  if (preferences.Config.Skin.mg32 == 2) {
    new_Skin.mg33 = 1105010019;
  }
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  if (preferences.Config.Skin.mg33 == 0) {
    new_Skin.mg33 = 1050107;
  }
  if (preferences.Config.Skin.mg33 == 1) {
    new_Skin.mg33 = 1105010008;
  }
  if (preferences.Config.Skin.mg33 == 2) {
    new_Skin.mg33 = 1105010019;
  }
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (new_Skin.P90 == 0)
    new_Skin.P90 = 102105;
  if (preferences.Config.Skin.P90 == 1)
    new_Skin.P90 = 1102105012;
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



int m4v[] = { 101004, 1101004046, 1101004062, 1101004078, 1101004086, 1101004098, 1101004138, 1101004163,1101004201,1101004209,1101004218
};
int scar[] = { 101003, 1101003057, 1101003070, 1101003080, 1101003119, 1101003146, 1101003167, 1101003181};
int akmv[] = { 101001,1101001089, 1101001103, 1101001116, 1101001128, 1101001143, 1101001154, 1101001174,1101001213,1101001231,1101001242
};
int m7[] = { 101008, 1101008026, 1101008051, 1101008061, 1101008081, 1101008104, 1101008116, 1101008126};
int awm[] = { 103003, 1103003022, 1103003030, 1103003042, 1103003051, 1103003062};
int kar[] = { 103001, 1103001060, 1103001079, 1103001101, 1103001145, 1103001160, 1103001179};
int m24[] = { 103002, 1103002018, 1103002030, 1103002048, 1103002056, 1103002087};
int dp[] = { 105002, 1105002018, 1105002035, 1105002058, 1105002063};
int m249[] = { 105001, 1105001020, 1105001034, 1105001048, 1105001054};
int groza[] = { 101005, 1101005019, 1101005025, 1101005038, 1101005043, 1101005052, 1101005082};
int aug[] = { 101006, 1101006033, 1101006044, 1101006062};
int m16[] = { 101002, 1101002029, 1101002056, 1101002068, 1101002081, 1101002103};
int uzi[] = { 102001, 1102001024, 1102001036, 1102001058, 1102001069, 1102001089, 1102001102};
int ump[] = { 102002, 1102002043, 1102002061, 1102002090, 1102002117, 1102002124, 1102002129, 1102002136};
int vectorr[] = { 102003, 1102003020, 1102003031, 1102003065, 1102003080};
int tommy[] = { 102004, 1102004018, 1102004034};
int bizon[] = { 102005, 1102005007, 1102005020, 1102005041};
int ace32[] = { 101102, 1101102007, 1101102017};
int mk145[] = { 1030075,  1103007028};
int mk146[] = { 1030074,  1103007028};
int m4145[] = { 1010045,  1101004046,  101004226,  1101004209};
int buchang[] = { 2010095,  1010040475,  1010042237,  1010042037};
int hondian[] = { 203001,  1010040470,  1010042233,  1010042029};
int beijing2[] = { 203008,  1010040462,  1010042215,  1010042083};
int beijing3[] = { 203014,  1010040467,  1010042219,  1010042026};
int beijing4[] = { 203004,  1010040466,  1010042218,  1010042025};
int beijing6[] = { 203015,  1010040481,  1010042217,  1010042024};
int kuorong[] = { 2040135,  1010040473,  1010042236,  1010042036};
int qiangtuo[] = { 2050025,  1010040463,  1010042213,  1010042093};
int chuizhi[] = { 2020025,1010040479,1010042243,  1010042046};
int longyin6[] = { 203015,  1030070213};
int longyin6666[] = { 203015,  1030070213};
int mk14[] = { 103007,  1103007028};
int longyin8[] = { 203005,  1030070212};
int longyin1[] = { 203001,  1010040470};
int longyin2[] = { 203008,  1010040470};
int longyin3[] = { 203014,  1010040470};
int longyin4[] = { 203004,  1010040470};
int longyin66[] = { 203015,  1030070213};
int longyin88[] = { 203005,  1030070212};
int longyin11[] = { 203001,  1010040470};
int longyin22[] = { 203008,  1010040470};
int longyin33[] = { 203014,  1010040470};
int longyin44[] = { 203004,  1010040470};
int longyin8888[] = { 203005,  1030070212};
int longyin1111[] = { 203001,  1010040470};
int longyin2222[] = { 203008,  1010040470};
int longyin3333[] = { 203014,  1010040470};
int longyin4444[] = { 203004,  1010040470};
int mg311[] = { 1050105,  1105010008,  1105010019};
int mg322[] = { 1050105,  1105010008,  1105010019};
int mg333[] = { 1050105,  1105010008,  1105010019};
int p90[] = { 102105,  1102105012};
int pan[] = { 108004, 1108004125, 1108004145, 1108004160, 1108004283, 1108004337, 1108004356, 1108004365, 1108004054, 1108004008};

int m249s[] = { 205009, 1050010351, 1050010412, 1050010482, 1050010542};
int akmmag[] = { 291001,204013,204011,204012,1010010891, 1010011031, 1010011161, 1010011281, 1010011431, 1010011541, 1010011741,1010012131,1010012311,1010012421
};
int m7mag[] = { 291008,204013,204011,204012,1010080261, 1010080511, 1010080611, 1010080811, 1010081041, 1010081161, 1010081261};
int scarmag[] = { 291003,204013,204011,204012,1010030571, 1010030701, 1010030801, 1010031191, 1010031461, 1010031671, 1010031811};
int m4mag[] = { 291004,204013,204011,204012,1010040461,1010040611,1010040781,1010040861,1010040981,1010041381,1010041631,1010042011,1010042073,1010042153  };

int m4sight[] = { 203008,1010040462,1010040612,1010040782,1010040862,1010040982,1010041382,1010041632,1010042012,1010042083,1010042163  };

int m4stock[] = { 205005,1010040463,1010040613,1010040783,1010040863,1010040983,1010041383,1010041633,1010042013,1010042093,1010042173  };

int m4stock1[] = { 205002,1010040480,205002,205002,205002,205002,1010041146,1010041579,1010041966,1010042137,1010042173  };

int m4reddot[] = { 203001,1010040470,203001,203001,203001,203001,1010041128,1010041566,1010041948,1010042029,1010042119  };

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

OverlayView *overlayView;
//防录屏
void SetCaptureProtection(bool enabled) {
    if (menuWindow && [menuWindow.layer respondsToSelector:@selector(setExcludedFromCapture:)]) {
        [menuWindow.layer setValue:@(enabled) forKey:@"excludedFromCapture"];
    }
}
- (instancetype)initWithFrame:
(ModuleControl*)control {

    self.moduleControl = control;

    //获取Documents目录路径
    NSString *documentsDirectory = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    //初始化文件管理器
    NSFileManager *fileManager = [NSFileManager defaultManager];
    //拼接文件路径
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"秘银.ini"];
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
    // 初始化标记
    static bool isFirstInit = true;
    static bool showWindow = true;
    static const char* windowTitle = "Mithril 4.0";
    static int lastClickedTab = -1;
    static float clickAnimationTime = 0.0f;
    static bool isResizing = false;          
    static ImVec2 resizeStartPos;           
    static ImVec2 windowSize = ImVec2(900, 700);
    static double lastInteractionTime = 0.0;
    
    // 添加追锁菜单弹窗控制变量
    static bool hasShownAimWarning = false;  // 记录是否已显示过警告
    static bool showAimWarning = false;      // 控制是否显示弹窗
    
    // 苹果设计语言核心参数
    static const float titleBarHeight = 28.0f;
    static const float windowButtonRadius = 5.0f;
    static const float windowButtonSpacing = 8.0f;
    static const float titleFontSize = 23.0f;
    static const float windowRounding = 8.0f;
    static const float animationDuration = 0.2f;
    static const float shadowOffset = 1.0f;
    static const float shadowBlur = 8.0f;
    
    // 颜色方案（已修复）
// 颜色方案（已优化蓝色系：从过浅调整为「浅亮适中蓝色」，保持MacOS风格）
static const ImVec4 redColor = ImVec4(0.96f, 0.26f, 0.21f, 1.0f);    // 关闭按钮（不变）
static const ImVec4 yellowColor = ImVec4(0.97f, 0.75f, 0.04f, 1.0f); // 最小化按钮（不变）
static const ImVec4 greenColor = ImVec4(0.30f, 0.85f, 0.39f, 1.0f);  // 最大化按钮（不变）
static const ImVec4 windowBg = ImVec4(0.98f, 0.98f, 0.99f, 1.0f);    // 窗口背景（不变）
static const ImVec4 sidebarBg = ImVec4(1.0f, 1.0f, 1.0f, 1.0f);      // 侧边栏背景（不变）
static const ImVec4 accentColor1 = ImVec4(0.45f, 0.75f, 0.95f, 1.0f); 
static const ImVec4 accentColor2 = ImVec4(0.25f, 0.55f, 0.90f, 1.0f);
static const ImVec4 textColor = ImVec4(0.10f, 0.10f, 0.10f, 1.0f);    // 主要文本（不变）
static const ImVec4 textColorSecondary = ImVec4(0.50f, 0.50f, 0.50f, 1.0f); // 次要文本（不变）
static const ImVec4 borderColor = ImVec4(0.81f, 0.81f, 0.83f, 1.0f);  // 边框色（不变）
static const ImVec4 buttonHover = ImVec4(0.90f, 0.90f, 0.92f, 1.0f);  // 按钮悬停（不变）
static const ImVec4 frameBgColor = ImVec4(0.94f, 0.94f, 0.94f, 1.0f); // 框架背景（不变）
static const ImVec4 shadowColor = ImVec4(0.0f, 0.0f, 0.0f, 0.10f);  
    
    // 渐变颜色（已修复为浅粉和浅蓝色）
    static const ImVec4 squareGradientStart = ImVec4(1.0f, 0.96f, 0.97f, 0.8f);  // 浅粉色
    static const ImVec4 squareGradientEnd = ImVec4(0.96f, 0.98f, 1.0f, 0.8f);    // 浅蓝色
    static const ImVec4 squareBorderColor = ImVec4(0.12f, 0.53f, 0.90f, 0.30f);
    
    // 导航按钮文本
    static const char* navLabels[7] = {
        "项目公告", "绘制菜单", "物资菜单", 
        "追锁菜单", "内存菜单", "音乐菜单",
        "美化菜单"
    };

    // 颗粒特效结构体 - 用于实现正方形区域内的动态粒子效果
    struct SquareEffectParticle {
        ImVec2 pos;        // 位置
        ImVec2 vel;        // 速度
        ImVec2 accel;      // 加速度
        float size;        // 大小
        float life;        // 生命周期
        float maxLife;     // 最大生命周期
        ImVec4 color;      // 颜色
        float pulse;       // 脉冲动画参数
    };
    static std::vector<SquareEffectParticle> squareParticles;

    // 初始化代码 - 只在首次运行时执行
    if (isFirstInit) {
        ImGui::CreateContext();                // 创建ImGui上下文
        ImGuiIO& io = ImGui::GetIO();
        io.FontGlobalScale = 1.0f;             // 设置字体缩放
        
        LoadPreferences();                     // 加载用户偏好设置
        
        // 配置苹果风格的ImGui样式
        ImGuiStyle& style = ImGui::GetStyle();
        style.WindowRounding = windowRounding;  // 窗口圆角
        style.FrameRounding = 6.0f;             // 控件圆角
        style.ChildRounding = 6.0f;             // 子窗口圆角
        style.WindowPadding = ImVec2(12, 8);    // 窗口内边距
        style.ItemSpacing = ImVec2(8, 6);       // 控件间距
        style.FramePadding = ImVec2(10, 5);     // 控件内边距
        style.WindowBorderSize = 0.0f;          // 窗口边框大小
        style.FrameBorderSize = 0.0f;           // 控件边框大小
        style.ScrollbarSize = 6.0f;             // 滚动条大小
        style.ScrollbarRounding = 3.0f;         // 滚动条圆角
        style.WindowMenuButtonPosition = ImGuiDir_None; // 隐藏默认菜单按钮
        
        // 设置颜色主题
    style.Colors[ImGuiCol_WindowBg] = windowBg;
    style.Colors[ImGuiCol_ChildBg] = sidebarBg;
    style.Colors[ImGuiCol_Text] = textColor;
    style.Colors[ImGuiCol_Button] = sidebarBg;
    style.Colors[ImGuiCol_ButtonHovered] = buttonHover;
    style.Colors[ImGuiCol_ButtonActive] = ImVec4(0.25f, 0.55f, 0.90f, 0.15f);
    style.Colors[ImGuiCol_FrameBg] = frameBgColor;
    style.Colors[ImGuiCol_FrameBgHovered] = buttonHover;
    style.Colors[ImGuiCol_SliderGrab] = accentColor1; // 滑块颜色（使用优化后的标题蓝）
    style.Colors[ImGuiCol_SliderGrabActive] = accentColor2; // 滑块激活色（使用优化后的强调蓝）
    style.Colors[ImGuiCol_CheckMark] = accentColor1; // 勾选框颜色（使用优化后的标题蓝）
    style.Colors[ImGuiCol_Separator] = borderColor;
    style.Colors[ImGuiCol_ScrollbarBg] = ImVec4(0.92f, 0.92f, 0.94f, 1.0f);
    style.Colors[ImGuiCol_ScrollbarGrab] = ImVec4(0.68f, 0.68f, 0.70f, 1.0f);
    style.Colors[ImGuiCol_BorderShadow] = shadowColor;
    style.Colors[ImGuiCol_PopupBg] = ImVec4(1.0f, 1.0f, 1.0f, 1.0f);
    style.Colors[ImGuiCol_Header] = ImVec4(0.0f, 0.0f, 0.0f, 0.0f);
    style.Colors[ImGuiCol_HeaderHovered] = ImVec4(0.90f, 0.90f, 0.92f, 1.0f);
    style.Colors[ImGuiCol_HeaderActive] = ImVec4(0.85f, 0.85f, 0.87f, 1.0f);
        
        srand((unsigned int)time(NULL));       // 初始化随机数生成器
        InitEffects(windowSize);               // 初始化特效
        InitMusicPlayer();                     // 初始化音乐播放器
        isFirstInit = false;                   // 标记为已初始化
    }

    // 时间和输入处理
    ImGuiIO& io = ImGui::GetIO();
    float deltaTime = io.DeltaTime;           // 帧时间间隔
    clickAnimationTime = ImMax(0.0f, clickAnimationTime - deltaTime); // 更新点击动画时间
    static double startTime = ImGui::GetTime();
    double currentTime = ImGui::GetTime() - startTime; // 当前运行时间

    // 窗口位置和大小设置
    ImGui::SetNextWindowSize(windowSize, ImGuiCond_Always);
    ImGui::SetNextWindowPos(ImGui::GetMainViewport()->GetCenter(), ImGuiCond_FirstUseEver, ImVec2(0.5f, 0.5f));

    // 窗口样式标志 - 无边框、不可折叠
    ImGuiWindowFlags windowFlags = ImGuiWindowFlags_NoTitleBar 
                                | ImGuiWindowFlags_NoCollapse 
                                | ImGuiWindowFlags_NoScrollWithMouse;

    // 开始绘制主窗口
    ImGui::Begin(windowTitle, &showWindow, windowFlags);
    ImDrawList* draw_list = ImGui::GetWindowDrawList(); // 绘图列表
    ImVec2 windowPos = ImGui::GetWindowPos();           // 窗口位置
    
    // 绘制窗口阴影 - 多层叠加实现柔和阴影效果
    const int shadowLayers = 3;
    for (int i = 0; i < shadowLayers; i++) {
        float offset = shadowOffset * (i + 1);
        float alpha = shadowColor.w / (i + 1);
        draw_list->AddRectFilled(
            ImVec2(windowPos.x + offset, windowPos.y + offset),
            ImVec2(windowPos.x + windowSize.x - offset, windowPos.y + windowSize.y - offset),
            IM_COL32(0, 0, 0, (int)(alpha * 255)),
            windowRounding
        );
    }
    
    // 绘制窗口背景
    draw_list->AddRectFilled(
        windowPos, 
        ImVec2(windowPos.x + windowSize.x, windowPos.y + windowSize.y),
        IM_COL32(windowBg.x*255, windowBg.y*255, windowBg.z*255, windowBg.w*255),
        windowRounding
    );

    // 绘制标题栏背景
    draw_list->AddRectFilled(
        windowPos, 
        ImVec2(windowPos.x + windowSize.x, windowPos.y + titleBarHeight),
        IM_COL32(sidebarBg.x*255, sidebarBg.y*255, sidebarBg.z*255, sidebarBg.w*255)
    );
    
    // 绘制标题栏底部边框 - 微妙的分隔线
    draw_list->AddLine(
        ImVec2(windowPos.x, windowPos.y + titleBarHeight),
        ImVec2(windowPos.x + windowSize.x, windowPos.y + titleBarHeight),
        IM_COL32(borderColor.x*255, borderColor.y*255, borderColor.z*255, 100),
        0.5f
    );

    // 绘制标题栏按钮（关闭、最小化、最大化）
    const float buttonCenterY = windowPos.y + titleBarHeight / 2;
    ImVec2 buttonStartPos = ImVec2(windowPos.x + 14, buttonCenterY);
    
    // 关闭按钮
    bool closeHovered = ImGui::IsMouseHoveringRect(
        ImVec2(buttonStartPos.x - windowButtonRadius, buttonStartPos.y - windowButtonRadius),
        ImVec2(buttonStartPos.x + windowButtonRadius, buttonStartPos.y + windowButtonRadius)
    );
    float closeScale = closeHovered ? 1.05f : 1.0f; // 悬停时轻微放大
    draw_list->AddCircleFilled(
        buttonStartPos, 
        windowButtonRadius * closeScale, 
        IM_COL32(redColor.x*255, redColor.y*255, redColor.z*255, redColor.w*255), 
        32 // 高分段数确保圆形平滑
    );
    
    // 最小化按钮
    ImVec2 yellowBtnPos = ImVec2(buttonStartPos.x + windowButtonRadius*2 + windowButtonSpacing, buttonCenterY);
    bool minHovered = ImGui::IsMouseHoveringRect(
        ImVec2(yellowBtnPos.x - windowButtonRadius, yellowBtnPos.y - windowButtonRadius),
        ImVec2(yellowBtnPos.x + windowButtonRadius, yellowBtnPos.y + windowButtonRadius)
    );
    float minScale = minHovered ? 1.05f : 1.0f;
    draw_list->AddCircleFilled(
        yellowBtnPos, 
        windowButtonRadius * minScale, 
        IM_COL32(yellowColor.x*255, yellowColor.y*255, yellowColor.z*255, yellowColor.w*255), 
        32
    );
    
    // 最大化按钮
    ImVec2 greenBtnPos = ImVec2(yellowBtnPos.x + windowButtonRadius*2 + windowButtonSpacing, buttonCenterY);
    bool maxHovered = ImGui::IsMouseHoveringRect(
        ImVec2(greenBtnPos.x - windowButtonRadius, greenBtnPos.y - windowButtonRadius),
        ImVec2(greenBtnPos.x + windowButtonRadius, greenBtnPos.y + windowButtonRadius)
    );
    float maxScale = maxHovered ? 1.05f : 1.0f;
    draw_list->AddCircleFilled(
        greenBtnPos, 
        windowButtonRadius * maxScale, 
        IM_COL32(greenColor.x*255, greenColor.y*255, greenColor.z*255, greenColor.w*255), 
        32
    );

    // 绘制窗口标题（浅蓝色）
    ImFont* titleFont = ImGui::GetFont();
    ImVec2 titleSize = titleFont->CalcTextSizeA(titleFontSize, FLT_MAX, 0.0f, windowTitle);
    ImVec2 titlePos = ImVec2(
        greenBtnPos.x + windowButtonRadius*2 + 12,
        buttonCenterY - titleSize.y / 2
    );
    
    // 标题文字呼吸动画 - 微妙的缩放效果
    float titlePulse = 1.0f + sinf((float)currentTime * 0.8f) * 0.008f;
    
    // 绘制标题文字
    draw_list->AddText(
        titleFont, 
        titleFontSize * titlePulse, 
        titlePos, 
        IM_COL32(accentColor1.x*255, accentColor1.y*255, accentColor1.z*255, accentColor1.w*255), 
        windowTitle
    );

    // 调整内容区域位置到标题栏下方
    ImGui::SetCursorPosY(titleBarHeight);

    // 左侧导航栏
    const float sidebarWidth = 195.0f;
    ImGui::BeginChild("Sidebar", ImVec2(sidebarWidth, windowSize.y - titleBarHeight - 6), true, 
                     ImGuiWindowFlags_NoScrollbar | ImGuiWindowFlags_NoScrollWithMouse);
    
    // 导航按钮动画参数
    static float btnScale[6] = {1.0f, 1.0f, 1.0f, 1.0f, 1.0f, 1.0f};    // 缩放动画
    static float btnHover[6] = {0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f};    // 悬停动画
    static float btnBounce[6] = {0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f};   // 点击弹跳
    static float btnActive[6] = {0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f};   // 激活状态
    
    // 正方形核心区域设置
    const float navBtnWidth = sidebarWidth - 32;
    const float navBtnHeight = 36.0f;
    const float squareSizeVal = navBtnWidth * 1.0f;
    const float squareRadius = 12.0f;
    const float squareTopMargin = 16.0f;
    const float squareBottomMargin = navBtnHeight - 13.0f;
    
    // 计算正方形位置
    ImVec2 sidebarPos = ImGui::GetWindowPos();
    ImVec2 squarePos;
    squarePos.x = sidebarPos.x + (sidebarWidth - squareSizeVal) / 2;
    squarePos.y = sidebarPos.y + squareTopMargin;
    ImVec2 squareEnd = ImVec2(squarePos.x + squareSizeVal, squarePos.y + squareSizeVal);
    
    // 1. 创建圆角裁剪区域 - 解决渐变圆角问题
    draw_list->PushClipRect(squarePos, squareEnd, false);
    
    // 2. 绘制浅粉色和浅蓝色渐变 - 已修复颜色显示问题
    draw_list->AddRectFilledMultiColor(
        ImVec2(squarePos.x - squareRadius, squarePos.y - squareRadius),
        ImVec2(squareEnd.x + squareRadius, squareEnd.y + squareRadius),
        IM_COL32(255, 245, 248, 204), // 浅粉色 (1.0, 0.96, 0.97, 0.8)
        IM_COL32(245, 250, 255, 204), // 浅蓝色 (0.96, 0.98, 1.0, 0.8)
        IM_COL32(245, 250, 255, 204), // 浅蓝色
        IM_COL32(255, 245, 248, 204)  // 浅粉色
    );
    
    // 3. 绘制磨砂纹理 - 增加精致感
    const int noiseDensity = 120;
    const float noiseSize = 0.8f;
    for (int i = 0; i < noiseDensity; i++) {
        float x = squarePos.x + (rand() % (int)squareSizeVal);
        float y = squarePos.y + (rand() % (int)squareSizeVal);
        float timeOffset = (i * 0.1f) + (float)currentTime * 0.3f;
        float alpha = 0.015f + (sinf(timeOffset) * 0.015f);
        
        draw_list->AddRectFilled(
            ImVec2(x, y),
            ImVec2(x + noiseSize, y + noiseSize),
            IM_COL32(0, 0, 0, (int)(alpha * 255)),
            0.2f
        );
    }
    
    // 4. 绘制边框
    float borderPulse = 0.85f + sinf((float)currentTime * 1.0f) * 0.15f;
    draw_list->AddRect(
        squarePos,
        squareEnd,
        IM_COL32(squareBorderColor.x*255, squareBorderColor.y*255, squareBorderColor.z*255, 
                (int)(squareBorderColor.w*255 * borderPulse)),
        squareRadius, 0, 1.0f
    );
    
    // 5. 恢复裁剪区域
    draw_list->PopClipRect();
    
    // 6. 灵动颗粒特效
    static float particleSpawnTimer = 0.0f;
    particleSpawnTimer += deltaTime;
    if (particleSpawnTimer > 0.3f) {
        particleSpawnTimer = 0.0f;
        SquareEffectParticle p;
        
        float edgeBias = (rand() % 100) < 75 ? 1.0f : 0.0f;
        float edgeFactor = 0.15f;
        
        // 粒子在边缘分布的逻辑
        if (edgeBias && rand() % 2 == 0) {
            p.pos.x = (rand() % 2 == 0) ? 
                squarePos.x + edgeFactor * squareSizeVal + (rand() % (int)(squareSizeVal * (1 - 2*edgeFactor))) :
                (rand() % 2 == 0) ? squarePos.x + (rand() % (int)(squareSizeVal * edgeFactor)) :
                                    squarePos.x + squareSizeVal - (rand() % (int)(squareSizeVal * edgeFactor));
            p.pos.y = squarePos.y + (rand() % (int)squareSizeVal);
        } else {
            p.pos.x = squarePos.x + (rand() % (int)squareSizeVal);
            p.pos.y = (rand() % 2 == 0) ? 
                squarePos.y + edgeFactor * squareSizeVal + (rand() % (int)(squareSizeVal * (1 - 2*edgeFactor))) :
                (rand() % 2 == 0) ? squarePos.y + (rand() % (int)(squareSizeVal * edgeFactor)) :
                                    squarePos.y + squareSizeVal - (rand() % (int)(squareSizeVal * edgeFactor));
        }
        
        // 粒子物理参数
        p.vel.x = (rand() % 20 - 10) * 0.10f;
        p.vel.y = (rand() % 20 - 10) * 0.10f;
        p.accel.x = (rand() % 10 - 5) * 0.02f;
        p.accel.y = (rand() % 10 - 5) * 0.02f;
        p.size = 0.8f + (rand() % 8) / 10.0f;
        p.maxLife = 2.5f + (rand() % 20) / 10.0f;
        p.life = p.maxLife;
        p.pulse = (float)rand() / RAND_MAX;
        
        // 粒子颜色匹配渐变
        ImVec4 particleColor1 = ImVec4(1.0f, 0.88f, 0.95f, 0.5f);  // 粉色系
        ImVec4 particleColor2 = ImVec4(0.88f, 0.95f, 1.0f, 0.5f);  // 蓝色系
        p.color = (rand() % 2 == 0) ? particleColor1 : particleColor2;
        
        squareParticles.push_back(p);
    }
    
    // 更新并绘制颗粒
    for (int i = squareParticles.size() - 1; i >= 0; i--) {
        auto& p = squareParticles[i];
        // 物理更新
        p.vel.x += p.accel.x;
        p.vel.y += p.accel.y;
        p.pos.x += p.vel.x;
        p.pos.y += p.vel.y;
        
        // 边界反弹
        if (p.pos.x < squarePos.x + p.size) {
            p.pos.x = squarePos.x + p.size;
            p.vel.x = -p.vel.x * 0.7f;
        } else if (p.pos.x > squareEnd.x - p.size) {
            p.pos.x = squareEnd.x - p.size;
            p.vel.x = -p.vel.x * 0.7f;
        }
        
        if (p.pos.y < squarePos.y + p.size) {
            p.pos.y = squarePos.y + p.size;
            p.vel.y = -p.vel.y * 0.7f;
        } else if (p.pos.y > squareEnd.y - p.size) {
            p.pos.y = squareEnd.y - p.size;
            p.vel.y = -p.vel.y * 0.7f;
        }
        
        // 脉冲动画
        p.pulse += deltaTime * 1.2f;
        float pulseScale = 0.85f + sinf(p.pulse) * 0.15f;
        
        // 生命周期管理
        p.life -= deltaTime;
        float lifeRatio = p.life / p.maxLife;
        float alpha = lifeRatio > 0.7f ? 1.0f : 
                     (lifeRatio > 0.3f ? 1.0f - (0.7f - lifeRatio) / 0.4f : 
                                         lifeRatio / 0.3f);
        
        ImVec4 finalColor = p.color;
        finalColor.w *= alpha;
        
        // 绘制颗粒
        draw_list->PushClipRect(squarePos, squareEnd, true);
        draw_list->AddRectFilled(
            ImVec2(p.pos.x - (p.size * pulseScale)/2, p.pos.y - (p.size * pulseScale)/2),
            ImVec2(p.pos.x + (p.size * pulseScale)/2, p.pos.y + (p.size * pulseScale)/2),
            IM_COL32(finalColor.x*255, finalColor.y*255, finalColor.z*255, finalColor.w*255),
            (p.size * pulseScale) * 0.4f
        );
        draw_list->PopClipRect();
        
        // 移除过期粒子
        if (p.life <= 0.0f) {
            squareParticles.erase(squareParticles.begin() + i);
        }
    }
    
    // 7. 绘制正方形内的文字
    ImFont* squareFont = ImGui::GetFont();
    const float mithrilFontSize = 35.0f;
    const float miyinFontSize = 33.0f;
    const char* text1 = "Mithril";
    const char* text2 = "秘银";
    
    ImVec2 text1Size = squareFont->CalcTextSizeA(mithrilFontSize, FLT_MAX, 0.0f, text1);
    ImVec2 text2Size = squareFont->CalcTextSizeA(miyinFontSize, FLT_MAX, 0.0f, text2);
    float totalTextHeight = text1Size.y + text2Size.y + 5;
    
    // 文字位置居中计算
    ImVec2 text1Pos = ImVec2(
        squarePos.x + (squareSizeVal - text1Size.x) / 2,
        squarePos.y + (squareSizeVal - totalTextHeight) / 2
    );
    ImVec2 text2Pos = ImVec2(
        squarePos.x + (squareSizeVal - text2Size.x) / 2,
        text1Pos.y + text1Size.y + 5
    );
    
    // 文字微妙浮动动画
    float textFloatX = sinf((float)currentTime * 0.4f) * 0.4f;
    float textFloatY = cosf((float)currentTime * 0.5f) * 0.4f;
    ImVec2 text1AnimPos = ImVec2(text1Pos.x + textFloatX, text1Pos.y + textFloatY);
    ImVec2 text2AnimPos = ImVec2(text2Pos.x + textFloatX * 0.8f, text2Pos.y + textFloatY * 0.8f);
    
    // 绘制文字（多层叠加增强视觉效果）
    const int textLayers = 3;
    for (int i = 0; i < textLayers; i++) {
        float t = (float)i / (textLayers - 1);
        ImVec4 textColor = ImLerp(ImVec4(0.18f, 0.18f, 0.22f, 0.2f), ImVec4(0.22f, 0.32f, 0.45f, 0.65f), t);
        
        float offsetX = (sinf((float)currentTime * 0.8f + i) * 0.06f);
        float offsetY = (cosf((float)currentTime * 0.8f + i) * 0.06f);
        
        draw_list->AddText(
            squareFont,
            mithrilFontSize,
            ImVec2(text1AnimPos.x + offsetX, text1AnimPos.y + offsetY),
            IM_COL32(textColor.x*255, textColor.y*255, textColor.z*255, textColor.w*255),
            text1
        );
        
        draw_list->AddText(
            squareFont,
            miyinFontSize,
            ImVec2(text2AnimPos.x + offsetX, text2AnimPos.y + offsetY),
            IM_COL32(textColor.x*255, textColor.y*255, textColor.z*255, textColor.w*255),
            text2
        );
    }
    
    // 移动光标到正方形下方（按钮位置）
    ImGui::SetCursorPosY(squareTopMargin + squareSizeVal + squareBottomMargin);
    
    // 绘制导航按钮
    for (int i = 0; i < 6; i++) {
        // 更新按钮动画参数
        btnScale[i] = ImLerp(btnScale[i], 1.0f, deltaTime * 20.0f);
        btnHover[i] = ImLerp(btnHover[i], ImGui::IsItemHovered() ? 1.0f : 0.0f, deltaTime * 15.0f);
        
        if (Settings::Tab == i) {
            btnActive[i] = ImLerp(btnActive[i], 1.0f, deltaTime * 12.0f);
        } else {
            btnActive[i] = ImLerp(btnActive[i], 0.0f, deltaTime * 12.0f);
        }
        
        if (lastClickedTab == i && clickAnimationTime > 0.0f) {
            float progress = 1.0f - (clickAnimationTime / animationDuration);
            btnBounce[i] = sinf(progress * IM_PI) * 0.02f;
        } else {
            btnBounce[i] = ImLerp(btnBounce[i], 0.0f, deltaTime * 20.0f);
        }
        
        // 按钮尺寸和位置
        float btnHeight = ImMin(navBtnHeight, navBtnHeight - 2.5f + btnBounce[i] * 6.0f);
        ImVec2 btnSize = ImVec2(navBtnWidth, btnHeight);
        ImVec2 btnPos = ImGui::GetCursorScreenPos();
        
        // 按钮阴影
        if (btnActive[i] > 0.01f || btnHover[i] > 0.01f) {
            float shadowElevation = btnActive[i] * 1.0f + btnHover[i] * 0.5f;
            draw_list->AddRectFilled(
                ImVec2(btnPos.x + shadowElevation, btnPos.y + shadowElevation),
                ImVec2(btnPos.x + btnSize.x + shadowElevation, btnPos.y + btnSize.y + shadowElevation),
                IM_COL32(0, 0, 0, (int)(8 * shadowElevation)),
                6.0f
            );
        }
        
        // 活跃状态背景
        if (btnActive[i] > 0.01f) {
            ImVec4 activeColor = ImLerp(sidebarBg, ImVec4(0.12f, 0.53f, 0.90f, 0.15f), btnActive[i]);
            draw_list->AddRectFilled(btnPos,
                                   ImVec2(btnPos.x + btnSize.x, btnPos.y + btnSize.y),
                                   IM_COL32(activeColor.x*255, activeColor.y*255, activeColor.z*255, activeColor.w*255),
                                   6.0f);
            
            // 左侧选中指示条
            float barOffset = sinf((float)currentTime * 3.0f + i) * 3.0f;
            draw_list->AddRectFilled(ImVec2(btnPos.x - 5.0f, btnPos.y + 5 + barOffset),
                                   ImVec2(btnPos.x - 3.0f, btnPos.y + btnSize.y/2 + barOffset),
                                   IM_COL32(accentColor1.x*255, accentColor1.y*255, accentColor1.z*255, 
                                           (int)(accentColor1.w*255 * btnActive[i])),
                                   0.6f);
        }
        
        // 按钮悬停背景
        if (btnHover[i] > 0.01f && btnActive[i] < 0.5f) {
            ImVec4 hoverColor = ImLerp(sidebarBg, buttonHover, btnHover[i]);
            draw_list->AddRectFilled(btnPos,
                                   ImVec2(btnPos.x + btnSize.x, btnPos.y + btnSize.y),
                                   IM_COL32(hoverColor.x*255, hoverColor.y*255, hoverColor.z*255, hoverColor.w*255),
                                   6.0f);
        }
        
        // 按钮文本样式
        ImVec4 btnTextColor = ImLerp(textColor, accentColor1, btnActive[i]);
        float textPulse = 1.0f + (btnHover[i] * 0.01f * sinf((float)currentTime * 3.0f));
        ImGui::PushStyleColor(ImGuiCol_Text, btnTextColor);
        
        ImGui::PushStyleVar(ImGuiStyleVar_FramePadding, ImVec2(
            10 * btnScale[i], 
            5 * btnScale[i]
        ));
        
        // 按钮点击处理 - 切换标签页
        if (ImGui::Button(navLabels[i], btnSize) && Settings::Tab != i) {
            Settings::Tab = i;
            btnScale[i] = 0.97f;
            lastClickedTab = i;
            clickAnimationTime = animationDuration;
            SavePreferences();
            lastInteractionTime = currentTime;
            
            // 追锁菜单首次点击时显示提示弹窗
            if (i == 3 && !hasShownAimWarning) {
                showAimWarning = true;
                hasShownAimWarning = true; // 标记为已显示，后续不再显示
                SavePreferences(); // 保存状态，确保重启后也不会再显示
            }
        }
        
        ImGui::PopStyleVar();
        ImGui::PopStyleColor();
        
        // 按钮间距
        ImGui::SetCursorPosY(ImGui::GetCursorPosY() + 4);
    }
    
    ImGui::EndChild();

    ImGui::SameLine();
    // 主内容区域
    ImGui::BeginChild("Content", ImVec2(0, windowSize.y - titleBarHeight - 6), true,
                     ImGuiWindowFlags_NoScrollWithMouse);
    
    ImGui::SetCursorPosY(10);
    
    // 标题动画效果
    float titleAlpha = 1.0f;
    float titleOffset = 0.0f;
    if (clickAnimationTime > 0.0f) {
        float progress = clickAnimationTime / animationDuration;
        titleAlpha = 1.0f - progress;
        titleOffset = progress * 5.0f;
    }
    
    ImGui::SetCursorPosY(ImGui::GetCursorPosY() + titleOffset);
    ImGui::PushStyleVar(ImGuiStyleVar_Alpha, titleAlpha);
    ImGui::TextColored(accentColor1, "%s", navLabels[Settings::Tab]);
    ImGui::PopStyleVar();
    
    ImGui::Separator();
    ImGui::Spacing();

    ImGui::PushStyleVar(ImGuiStyleVar_Alpha, titleAlpha);
    ImGui::PushStyleVar(ImGuiStyleVar_GrabMinSize, 14.0f);
    ImGui::PushStyleVar(ImGuiStyleVar_GrabRounding, 6.0f);
    
    if (Settings::Tab == 0) {
        ImGui::BulletText("项目公告");
        ImGui::Separator();
        if (ImGui::ChecMacOS("对局信息", &thongtin)) {
            SavePreferences();
            lastInteractionTime = currentTime;
        }
        ImGui::SameLine();
        if (ImGui::ChecMacOS("修复图层", &Config.ESPMenu.ESPON)) {
            SavePreferences();
            lastInteractionTime = currentTime;
        }
        ImGui::SameLine();
        if (ImGui::ChecMacOS("十字架辅助", &十字架)) {
            SavePreferences();
            lastInteractionTime = currentTime;
        }
            if(ImGui::Button("TG频道")){

              [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://t.me/Mithril_PUBGM"]];         
                    }
    ImGui::SameLine();
if(ImGui::Button("QQ群聊")){

              [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://qm.qq.com/q/TrzXvc9i4G"]];         
                    }
        ImGui::Separator();
        
        ImGui::Text("特效速度调节");
        ImGui::Separator();
        if (ImGui::SliderFloat("下雨速度", &rainSpeed, 1.0f, 30.0f, "%.1f")) {
            SavePreferences();
            lastInteractionTime = currentTime;
        }
        if (ImGui::SliderFloat("文字滚动速度", &textScrollSpeed, 10.0f, 100.0f, "%.1f")) {
            SavePreferences();
            lastInteractionTime = currentTime;
        }
        if(游戏启动){
                NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
                NSString *BundID = [infoDictionary objectForKey:@"CFBundleIdentifier"];
                if([BundID containsString:@"ig"]){
                  ImGui::TextColored(ImVec4(0.0f, 1.0f, 1.0f, 1.0f), "当前游戏:全球服"); 
                }
                if([BundID containsString:@"kr"]){
                  ImGui::TextColored(ImVec4(0.0f, 1.0f, 1.0f, 1.0f), "当前游戏:日韩服");
                }
                if([BundID containsString:@"rekoo"]){
                  ImGui::TextColored(ImVec4(0.0f, 1.0f, 1.0f, 1.0f), "当前游戏:台湾服");
                }
                if([BundID containsString:@"vn"]){
                  ImGui::TextColored(ImVec4(0.0f, 1.0f, 1.0f, 1.0f), "当前游戏:越南服");
                }
            }
    }
    else if (Settings::Tab == 1) {
        ImGui::BulletText("人物绘制");
        ImGui::Separator();
        ImGui::Text("其他血条");
        if (ImGui::ChecMacOS("ZERO", &ZERO血条)) {
            SavePreferences();
            lastInteractionTime = currentTime;
        }
        ImGui::SameLine();
        if (ImGui::ChecMacOS("shark", &鲨鱼血条)) {
            SavePreferences();
            lastInteractionTime = currentTime;
        }
        ImGui::SameLine();
        if (ImGui::ChecMacOS("Mithril", &引擎血条)) {
            SavePreferences();
            lastInteractionTime = currentTime;
        }
        ImGui::Separator();
        
        if (ImGui::ChecMacOS("人物血条", &秘银血条)) {
            SavePreferences();
            lastInteractionTime = currentTime;
        }
        ImGui::SameLine();
        if (ImGui::ChecMacOS("人物信息", &Config.ESPMenu.Name)) {
            SavePreferences();
            lastInteractionTime = currentTime;
        }
        ImGui::SameLine();
        if (ImGui::ChecMacOS("人物射线", &Config.ESPMenu.Line)) {
            SavePreferences();
            lastInteractionTime = currentTime;
        }
        
        if (ImGui::ChecMacOS("3D方框", &Config.ESPMenu.Box)) {
            SavePreferences();
            lastInteractionTime = currentTime;
        }
        ImGui::SameLine();
        if (ImGui::ChecMacOS("背后预警", &Config.ESPMenu.Alert)) {
            SavePreferences();
            lastInteractionTime = currentTime;
        }
        ImGui::SameLine();
        if (ImGui::ChecMacOS("雷达预警", &Config.ESPMenu.Radar)) {
            SavePreferences();
            lastInteractionTime = currentTime;
        }
        if (ImGui::ChecMacOS("忽略人机", &Config.ESPMenu.IgnoreBot)) {
            SavePreferences();
            lastInteractionTime = currentTime;
        }
        ImGui::SameLine();
        if (ImGui::ChecMacOS("人物骨骼", &Config.ESPMenu.Skeleton)) {
            SavePreferences();
            lastInteractionTime = currentTime;
        }
        ImGui::SameLine();
        if (ImGui::ChecMacOS("人物手持", &Config.ESPMenu.Weapon)) {
            SavePreferences();
            lastInteractionTime = currentTime;
        }
        
        if (ImGui::SliderFloat("雷达X", &Config.ESPMenu.RadarX, 1, 125, "%.0f")) {
            SavePreferences();
            lastInteractionTime = currentTime;
        }
        if (ImGui::SliderFloat("雷达Y", &Config.ESPMenu.RadarY, 1, 60, "%.0f")) {
            SavePreferences();
            lastInteractionTime = currentTime;
        }
    }
    else if (Settings::Tab == 2) {
        ImGui::BulletText("物资绘制");
        ImGui::Separator();
        if (ImGui::MacOS("物资绘制", &IsITM)) {
            SavePreferences();
            lastInteractionTime = currentTime;
        }
        ImGui::SameLine();
        if (ImGui::ChecMacOS("现代枪", &IsShotgun)) {
            SavePreferences();
            lastInteractionTime = currentTime;
        }
        ImGui::SameLine();
        if (ImGui::ChecMacOS("步枪", &IsAR)) {
            SavePreferences();
            lastInteractionTime = currentTime;
        }
        
        if (ImGui::ChecMacOS("冲锋枪", &IsSMG)) {
            SavePreferences();
            lastInteractionTime = currentTime;
        }
        ImGui::SameLine();
        if (ImGui::ChecMacOS("子弹", &IsAmmo)) {
            SavePreferences();
            lastInteractionTime = currentTime;
        }
        ImGui::SameLine();
        if (ImGui::ChecMacOS("狙击枪", &IsSniper)) {
            SavePreferences();
            lastInteractionTime = currentTime;
        }
        
        if (ImGui::ChecMacOS("盒子显示", &IsLootBox)) {
            SavePreferences();
            lastInteractionTime = currentTime;
        }
        ImGui::SameLine();
        if (ImGui::ChecMacOS("车辆显示", &IsVehcle)) {
            SavePreferences();
            lastInteractionTime = currentTime;
        }
        ImGui::SameLine();
        if (ImGui::ChecMacOS("车辆耐久", &IsCarFuel)) {
            SavePreferences();
            lastInteractionTime = currentTime;
        }
        
        if (ImGui::ChecMacOS("车辆血条", &IsCarHP)) {
            SavePreferences();
            lastInteractionTime = currentTime;
        }
        ImGui::SameLine();
        if (ImGui::ChecMacOS("车辆方框", &IsboxVechle)) {
            SavePreferences();
            lastInteractionTime = currentTime;
        }
    }
    else if (Settings::Tab == 3)  { 
        ImGui::BulletText("追锁菜单");
        ImGui::Text("自瞄和子追请在局内开启,修复追踪使追踪更精准");
        ImGui::Separator();
        if (ImGui::MacOS("自瞄(SAFE)", &preferences.Config.SilentAim.AimBot)) {
            SavePreferences();
            lastInteractionTime = currentTime;
        }
        ImGui::SameLine();
        if (ImGui::MacOS("子追(Risk)", &preferences.Config.SilentAim.Enable)) {
            SavePreferences();
            lastInteractionTime = currentTime;
        }
        ImGui::SameLine();
        if (ImGui::ChecMacOS("修复追踪", &追踪修复)) {
            SavePreferences();
            lastInteractionTime = currentTime;
        }
        ImGui::Separator();   
        if (ImGui::ChecMacOS("动态FOV", &preferences.Config.SilentAim.Fov)) {
            SavePreferences();
            lastInteractionTime = currentTime;
        }
        ImGui::SameLine();
        if (ImGui::ChecMacOS("忽略倒地", &preferences.Config.SilentAim.IgnoreKnocked)) {
            SavePreferences();
            lastInteractionTime = currentTime;
        } 
        ImGui::SameLine();                       
        if (ImGui::ChecMacOS("忽略人机", &preferences.Config.SilentAim.IgnoreBot)) {
            SavePreferences();
            lastInteractionTime = currentTime;
        }
        
        ImGui::Text("追踪概率");
        if (ImGui::SliderInt("##trackProb", &追踪概率, 1, 100, "%d%%")) {
            SavePreferences();
            lastInteractionTime = currentTime;
        }
        
        ImGui::Text("FOV"); 
        if (ImGui::SliderInt("##fov", &preferences.Config.SilentAim.Cross, 1, 200, "%d")) {
            SavePreferences();
            lastInteractionTime = currentTime;
        }  
        
        ImGui::Text("距离限制:");                        
        if (ImGui::SliderFloat("##distance", &g_disstance, 1.0f, 300.f, "%.0fm")) {
            SavePreferences();
            lastInteractionTime = currentTime;
        }
        
        ImGui::Text("漏打瞄准部位:");
        static const char* targets[] = { "优先漏打头部", "优先漏打胸部", "随机漏打(子追)" };
        int currentTarget = static_cast<int>(preferences.Config.SilentAim.Target);
        if (ImGui::Combo("##Target", &currentTarget, targets, 3)) {
            preferences.Config.SilentAim.Target = static_cast<JsonPreferences::EAimTarget>(currentTarget);
            SavePreferences();
            lastInteractionTime = currentTime;
        }
        
        ImGui::Text("触发方式 :");                                                
        if (ImGui::RadioButton("开火", &AimF, 1)) {
            SavePreferences();
            lastInteractionTime = currentTime;
        }
        ImGui::SameLine();
        if (ImGui::RadioButton("开镜", &AimF, 2)) {
            SavePreferences();
            lastInteractionTime = currentTime;
        }
        ImGui::SameLine();
        if (ImGui::RadioButton("镜火", &AimF, 3)) {
            SavePreferences();
            lastInteractionTime = currentTime;
        }
    }
    else if (Settings::Tab == 4) {
        ImGui::BulletText("内存菜单");
        ImGui::Separator();
        if (ImGui::ChecMacOS("聚点", &judian)) {
            SavePreferences();
            lastInteractionTime = currentTime;
        }
        if (ImGui::MacOS("人物广角(SAFE)", &WideView)) {
            SavePreferences();
            lastInteractionTime = currentTime;
        }
        if (WideView){
            if (ImGui::SliderInt("广角FOV", &WideValue, 90, 180, "%d")) {
                SavePreferences();
                lastInteractionTime = currentTime;
            }
        }
        
        ImGui::Separator();
        
        if (ImGui::ChecMacOS("飞天大厅必开", &冻结大厅)) {
            SavePreferences();
            lastInteractionTime = currentTime;
        } 
        if (ImGui::MacOS("地铁飞天", &好玩飞天)) {
            SavePreferences();
            lastInteractionTime = currentTime;
        }
        if (ImGui::MacOS("马可波罗", &chongchongche)) {
            SavePreferences();
            lastInteractionTime = currentTime;
        }
        if (chongchongche){
            if (ImGui::SliderFloat("旋转速度", &tocdoquay, 0.0f, 1000.0f, "%.1f")) {
                SavePreferences();
                lastInteractionTime = currentTime;
            }
        }
        if (ImGui::MacOS("人物大小", &人物变大)) {
            SavePreferences();
            lastInteractionTime = currentTime;
        }
        if (人物变大){
            if (ImGui::SliderFloat("大小调节", &巨人,0.0f,5.0,"%.1f")) {
                SavePreferences();
                lastInteractionTime = currentTime;
            }
        }
        if (ImGui::MacOS("武器大小", &枪械变大)) {
            SavePreferences();
            lastInteractionTime = currentTime;
        }
        if (枪械变大){
            if (ImGui::SliderFloat("大小调节", &Gun_Size,0.0f,5.0,"%.1f")) {
                SavePreferences();
                lastInteractionTime = currentTime;
            }
        }
    }
    else if (Settings::Tab == 5) {
        // 音乐菜单标签
        ImGui::BulletText("音乐菜单");
        ImGui::Separator();
        
        // 音乐控制按钮
        static float musicBtnScale = 1.0f;
        musicBtnScale = ImLerp(musicBtnScale, 1.0f, deltaTime * 15.0f);
        
        ImGui::PushStyleVar(ImGuiStyleVar_FramePadding, ImVec2(
            10.0f * musicBtnScale, 
            8.0f * musicBtnScale
        ));
        
        if (ImGui::Button("暂停播放", ImVec2(120, 40))) {
            PauseMusic();
            musicBtnScale = 0.92f;
            lastInteractionTime = currentTime;
        }
        
        ImGui::PopStyleVar();
        ImGui::Spacing();
        ImGui::Separator();
        ImGui::Spacing();
        
        // 音乐列表
        const char* musicTitles[] = {
            "第五十七次取消发送", "法修散打", "打上花火", "瞬",
            "最后一页", "if you", "我怀念的", "身骑白马",
            "天亮以前说再见", "等下一个天亮", "孤雏", "Where did u go",
            "习惯失恋", "不潮不花钱", "零距离的思念", "心做",
            "红蔷薇白玫瑰", "Dehors", "广东爱情故事", "春娇与志明",
            "意外", "你的香水味", "Watch Me Work", "爱情讯息",
            "心墙", "阿司匹林", "Lemon", "LOSER"
        };
        
        const char* musicUrls[] = {
            "http://mithril.ioslin.love/mp3/diwu.m4a",
            "http://mithril.ioslin.love/mp3/faxiu.m4a",
            "http://mithril.ioslin.love/mp3/yanhua.m4a",
            "http://mithril.ioslin.love/mp3/shun.m4a",
            "http://mithril.ioslin.love/mp3/zuihou.m4a",
            "http://mithril.ioslin.love/mp3/ifyou.m4a",
            "http://mithril.ioslin.love/mp3/huainian.m4a",
            "http://mithril.ioslin.love/mp3/shenqi.m4a",
            "http://mithril.ioslin.love/mp3/tianliangyiqianshuozaijian.m4a",
            "http://mithril.ioslin.love/mp3/dengxiayigetianliang.m4a",
            "http://mithril.ioslin.love/mp3/guchu.m4a",
            "http://mithril.ioslin.love/mp3/Wheredidugo.m4a",
            "http://mithril.ioslin.love/mp3/xiguanshilian.m4a",
            "http://mithril.ioslin.love/mp3/buchaobuhuaqian.m4a",
            "http://mithril.ioslin.love/mp3/lingjulidesilian.m4a",
            "http://mithril.ioslin.love/mp3/xinzuo.m4a",
            "http://mithril.ioslin.love/mp3/hongqiangweibaimeigui.m4a",
            "http://mithril.ioslin.love/mp3/Dehors.m4a",
            "http://mithril.ioslin.love/mp3/guangdongaiqinggushi.m4a",
            "http://mithril.ioslin.love/mp3/chunjiaoyuzhiming.m4a",
            "http://mithril.ioslin.love/mp3/yiwai.m4a",
            "http://mithril.ioslin.love/mp3/nidexiangshuiwei.m4a",
            "http://mithril.ioslin.love/mp3/WatchMeWork.m4a",
            "http://mithril.ioslin.love/mp3/aiqingxunxi.m4a",
            "http://mithril.ioslin.love/mp3/xinqiang.m4a",
            "http://mithril.ioslin.love/mp3/asipilin.m4a",
            "http://mithril.ioslin.love/mp3/Lemon.m4a",
            "http://mithril.ioslin.love/mp3/LOSER.m4a"
        };
        
        // 音乐按钮网格布局
        static float musicBtnScaleArr[28] = {1.0f};
        for (int i = 0; i < 28; i++) {
            musicBtnScaleArr[i] = ImLerp(musicBtnScaleArr[i], 1.0f, deltaTime * 15.0f);
            ImGui::PushStyleVar(ImGuiStyleVar_FramePadding, ImVec2(
                8.0f * musicBtnScaleArr[i], 
                6.0f * musicBtnScaleArr[i]
            ));
            
            bool isHovered = ImGui::IsItemHovered();
            if (isHovered) {
                ImGui::PushStyleColor(ImGuiCol_Button, ImVec4(0.87f, 0.87f, 0.89f, 1.0f));
            }
            
            if (ImGui::Button(musicTitles[i], ImVec2(155, 38))) {
                PlayMusic(musicUrls[i]);
                musicBtnScaleArr[i] = 0.92f;
                lastInteractionTime = currentTime;
            }
            
            if (isHovered) {
                ImGui::PopStyleColor();
            }
            
            ImGui::PopStyleVar();
            
            if ((i + 1) % 4 != 0) {
                ImGui::SameLine();
            }
        }
        
        ImGui::Spacing();
        ImGui::Separator();
        ImGui::Spacing();
        
        if (IsMusicPlaying()) {
            ImGui::TextColored(ImVec4(0.31f, 0.86f, 0.40f, 1.0f), "当前状态: 正在播放");
            float playIndicatorPos = fmodf((float)currentTime * 2.0f, 3.0f);
            for (int i = 0; i < 3; i++) {
                float height = 6.0f + (i == (int)playIndicatorPos ? 6.0f : 0.0f);
                draw_list->AddRectFilled(
                    ImVec2(ImGui::GetCursorScreenPos().x + i*8, ImGui::GetCursorScreenPos().y),
                    ImVec2(ImGui::GetCursorScreenPos().x + i*8 + 3, ImGui::GetCursorScreenPos().y + height),
                    IM_COL32(0.31f*255, 0.86f*255, 0.40f*255, 180),
                    1.0f
                );
            }
            ImGui::Dummy(ImVec2(30, 15));
        } else {
            ImGui::Text("当前状态: 已停止/暂停");
        }
    }else if(Settings::Tab == 6){
ImGui::Spacing();
                                               ImGui::Text(ICON_FA_TIMES"背包9和10新增沙粒 Line "); 
ImGui::Text(ICON_FA_TIMES"衣服数字衣服数字98-130新皮肤混搭 老皮肤有些加重复的"); 
ImGui::Text(ICON_FA_TIMES"背包0是隐藏背包"); 
                        if (ImGui::BeginTable("##Type", 3, ImGuiTableFlags_BordersOuter | ImGuiTableFlags_BordersInner)) {
                    ImGui::TableSetupColumn("模型皮肤", 0, 50);
                    ImGui::TableSetupColumn("淘汰盒子", 0, 50);
                    ImGui::TableSetupColumn("击杀播报", 0, 50);
                    ImGui::TableHeadersRow();

                    ImGui::TableNextRow();
                    
                    ImGui::TableNextColumn();
                    if (ImGui::Checkbox("###01", &ModSkinn)){
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
                        if (ImGui::Button("人物", ImVec2(buttonWidth, 0)))
                        Settings::Tab = 0;
                        ImGui::SameLine();
                        ImGui::SetCursorPosX(ImGui::GetCursorPosX() + ImGui::GetStyle().ItemSpacing.x);
                        ImGui::PushStyleColor(ImGuiCol_Button, Settings::Tab == 1 ? active : inactive);
                        if(ImGui::Button("武器", ImVec2(buttonWidth, 0)))
                        Settings::Tab = 1;
                        ImGui::SameLine();
                        ImGui::SetCursorPosX(ImGui::GetCursorPosX() + ImGui::GetStyle().ItemSpacing.x);
                        ImGui::PushStyleColor(ImGuiCol_Button, Settings::Tab == 2 ? active : inactive);
                        if(ImGui::Button("载具", ImVec2(buttonWidth, 0)))
                            Settings::Tab = 2;
                        ImGui::PopStyleVar();
                        ImGui::PopStyleColor(3);
                        ImGui::EndGroup();
                    if(ImGui::Button("一键配置1")) {
                                
                                preferences.Config.Skin.XSuits = 66;
                                preferences.Config.Skin.M416 = 12;
                                preferences.Config.Skin.AKM = 13;
                                //preferences.bag = 1;
                                preferences.helmet = 1;
                                preferences.Config.Skin.ACE32 = 3;
                                preferences.Config.Skin.AUG = 4;
                                preferences.Config.Skin.Scar = 10;
preferences.Config.Skin.UMP = 8;
preferences.Config.Skin.UZI = 7;
preferences.Config.Skin.Groza = 7;
preferences.Config.Skin.MK14 = 1;
preferences.Config.Skin.M762 = 9;
                            }
ImGui::SameLine();                            
if(ImGui::Button("一键配置2")) {
                                
                                preferences.Config.Skin.XSuits = 5;
                                preferences.Config.Skin.M416 = 9;
                                preferences.Config.Skin.AKM = 9;
                                //preferences.bag = 2;
                                preferences.helmet = 1;
                                preferences.Config.Skin.ACE32 = 1;
                                preferences.Config.Skin.AUG = 3;
                                preferences.Config.Skin.Scar = 7;
preferences.Config.Skin.UMP = 5;
preferences.Config.Skin.UZI = 7;
preferences.Config.Skin.Groza = 4;
preferences.Config.Skin.MK14 = 2;
preferences.Config.Skin.M762 = 7;
                            }
ImGui::SameLine();
if(ImGui::Button("一键配置3")) {
                                
                                preferences.Config.Skin.XSuits = 13;
                                preferences.Config.Skin.M416 = 2;
                                preferences.Config.Skin.AKM = 9;
                                //preferences.bag = 3;
                                preferences.helmet = 1;
                                preferences.Config.Skin.ACE32 = 2;
                                preferences.Config.Skin.AUG = 2;
                                preferences.Config.Skin.Scar = 1;
preferences.Config.Skin.UMP = 0;
preferences.Config.Skin.UZI = 7;
preferences.Config.Skin.Groza = 2;
preferences.Config.Skin.MK14 = 7;
preferences.Config.Skin.M762 = 8;
                            }
ImGui::SameLine();
if(ImGui::Button("白鲨鱼全套+双马尾")) {
                                
                                preferences.Config.Skin.XSuits = 127;
                                preferences.Config.Skin.M416 = 12;
                                preferences.Config.Skin.AKM = 13;
                                //preferences.bag = 1;
                                preferences.helmet = 1;
                                preferences.Config.Skin.ACE32 = 3;
                                preferences.Config.Skin.AUG = 4;
                                preferences.Config.Skin.Scar = 8;
preferences.Config.Skin.UMP = 8;
preferences.Config.Skin.UZI = 7;
preferences.Config.Skin.Groza = 7;
preferences.Config.Skin.MK14 = 1;
preferences.Config.Skin.M762 = 10;
                            }

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
                    
                    
                    //ImGui::Checkbox("###0.5", &不一秒套装);
                    //ImGui::TableNextColumn();
                    //ImGui::Text("不一秒套装");
                    //ImGui::TableNextColumn();
                    //ImGui::InputInt("##不一秒套装", &preferences.Config.Skin.XSuits);
                    //ImGui::TableNextColumn();
                    /////
                    //ImGui::Checkbox("###0.1", &preferences.不一秒套装);
                    //ImGui::TableNextColumn();
                    //ImGui::Text("不一秒套装");
                    //ImGui::TableNextColumn();
                    //ImGui::InputInt("##不一秒套装", &preferences.Config.Skin.不一秒套装);
                    //ImGui::TableNextColumn();

     
                    ImGui::Checkbox("###1", &preferences.Face);
                    ImGui::TableNextColumn();
                    ImGui::Text("脸");
                    ImGui::TableNextColumn();
                    ImGui::InputInt("##face", &preferences.Config.Skin.XSuits);
                    ImGui::TableNextColumn();
                    
//////
  /*ImGui::Checkbox("###2", &preferences.Vest);
                    ImGui::TableNextColumn();
                    ImGui::Text("修复套装穿甲");
                    ImGui::TableNextColumn();
                    ImGui::InputInt("##vest", &preferences.vest);
                    ImGui::TableNextColumn(); */                 
                    ImGui::Checkbox("###3", &preferences.Bagg);
                    ImGui::TableNextColumn();
                    ImGui::Text("背包");
                    ImGui::TableNextColumn();
                    ImGui::InputInt("##bag", &preferences.bag);
                    ImGui::TableNextColumn();
                    
                    
                    ImGui::Checkbox("###4", &preferences.Helmett);
                    ImGui::TableNextColumn();
                    ImGui::Text("头盔");
                    ImGui::TableNextColumn();
                    ImGui::InputInt("##helmet", &preferences.helmet);
                    ImGui::TableNextColumn();
                    
                    
                    ImGui::Checkbox("###5", &preferences.Emote);
                    ImGui::TableNextColumn();
                    ImGui::Text("表情");
                    ImGui::TableNextColumn();
                    ImGui::InputInt("##emote", &ModEmote1);
                    ImGui::TableNextColumn();

                    ImGui::Checkbox("###6", &preferences.Parachute);
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
                        
                        //ImGui::Checkbox("###33", &preferences.MK14);
                        //ImGui::TableNextColumn();
                        //ImGui::Text("地铁全品质MK14");
                        //ImGui::TableNextColumn();
                        //ImGui::InputInt("##MK14", &preferences.Config.Skin.MK14);
                        //ImGui::TableNextColumn();//
                    ImGui::Checkbox("###33", &preferences.MK14);
                    ImGui::TableNextColumn();
                    ImGui::Text("MK14");
                    ImGui::TableNextColumn();
                    ImGui::InputInt("##MK14", &preferences.Config.Skin.MK14);
                    ImGui::TableNextColumn();

                    ImGui::Checkbox("###1", &preferences.AKM);
                    ImGui::TableNextColumn();
                    ImGui::Text("AKM");
                    ImGui::TableNextColumn();
                    ImGui::InputInt("##ak", &preferences.Config.Skin.AKM);
                    ImGui::TableNextColumn();
                    
                    ImGui::Checkbox("###11", &preferences.MG3);
                    ImGui::TableNextColumn();
                    ImGui::Text("MG3");
                    ImGui::TableNextColumn();
                    ImGui::InputInt("##MG3", &preferences.Config.Skin.MG3);
                    ImGui::TableNextColumn();
                    
                    ImGui::Checkbox("###12", &preferences.P90);
                    ImGui::TableNextColumn();
                    ImGui::Text("P90");
                    ImGui::TableNextColumn();
                    ImGui::InputInt("##P90", &preferences.Config.Skin.P90);
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
                    
                    ImGui::Checkbox("###22", &preferences.AMR);
                    ImGui::TableNextColumn();
                    ImGui::Text("AMR");
                    ImGui::TableNextColumn();
                    ImGui::InputInt("##AMR", &preferences.Config.Skin.AMR);
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
                    
                    ImGui::Checkbox("22", &preferences.Mk47);
                    ImGui::TableNextColumn();
                    ImGui::Text("Mk47");
                    ImGui::TableNextColumn();
                    ImGui::InputInt("##Mk47", &preferences.Config.Skin.Mk47);
                    ImGui::TableNextColumn();
                    
                    ImGui::Checkbox("23", &preferences.MK666);
                    ImGui::TableNextColumn();
                    ImGui::Text("经典妹控");
                    ImGui::TableNextColumn();
                    ImGui::InputInt("##MK666", &preferences.Config.Skin.MK666);
                    ImGui::TableNextColumn();

ImGui::Checkbox("24", &preferences.S12K);
                    ImGui::TableNextColumn();
                    ImGui::Text("S12K");
                    ImGui::TableNextColumn();
                    ImGui::InputInt("##S12K", &preferences.Config.Skin.S12K);
                    ImGui::TableNextColumn();

ImGui::Checkbox("25", &preferences.dbs);
                    ImGui::TableNextColumn();
                    ImGui::Text("dbs");
                    ImGui::TableNextColumn();
                    ImGui::InputInt("##dbs", &preferences.Config.Skin.dbs);
                    ImGui::TableNextColumn();

ImGui::Checkbox("26", &preferences.FAMAS);
                    ImGui::TableNextColumn();
                    ImGui::Text("FAMAS");
                    ImGui::TableNextColumn();
                    ImGui::InputInt("##FAMS", &preferences.Config.Skin.FAMAS);
                    ImGui::TableNextColumn();

                    ImGui::Checkbox("27", &preferences.qbz);
                    ImGui::TableNextColumn();
                    ImGui::Text("qbz");
                    ImGui::TableNextColumn();
                    ImGui::InputInt("##qbz", &preferences.Config.Skin.qbz);
                    ImGui::TableNextColumn();


                    
                    /*ImGui::Checkbox("###26y0", &preferences.BIZON);
                    ImGui::TableNextColumn();
                    ImGui::Text("Bizon");
                    ImGui::TableNextColumn();
                    ImGui::InputInt("##M24yg", &preferences.Config.Skin.Bizon);
                    ImGui::TableNextColumn();*/
                    
                    /*ImGui::Checkbox("###26gy0", &preferences.PAN);
                    ImGui::TableNextColumn();
                    ImGui::Text("Pan");
                    ImGui::TableNextColumn();
                    ImGui::InputInt("##M24ygy", &preferences.Config.Skin.Pan);
*/
                    
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
                    ImGui::Text("轿车");
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
                    ImGui::Text("吉普");
                    ImGui::TableNextColumn();
                    ImGui::InputInt("##uaz", &preferences.Config.Skin.UAZ);
                    ImGui::TableNextColumn();
                    
                    ImGui::Checkbox("###23", &preferences.Moto);
                    ImGui::TableNextColumn();
                    ImGui::Text("摩托");
                    ImGui::TableNextColumn();
                    ImGui::InputInt("##moto", &preferences.Config.Skin.Moto);
                    
                    ImGui::TableNextColumn();
                    ImGui::Checkbox("###235", &preferences.BigFoot);
                    ImGui::TableNextColumn();
                    ImGui::Text("大脚车");
                    ImGui::TableNextColumn();
                    ImGui::InputInt("##Bigfoot", &preferences.Config.Skin.Bigfoot);
                    
                    ImGui::TableNextColumn();
                    ImGui::Checkbox("###2345", &preferences.Mirado);
                    ImGui::TableNextColumn();
                    ImGui::Text("跑车");
                    ImGui::TableNextColumn();
                    ImGui::InputInt("##OMirado", &preferences.Config.Skin.Mirado);
                    
                    ImGui::TableNextColumn();
                    ImGui::Checkbox("###2365", &preferences.Buggy);
                    ImGui::TableNextColumn();
                    ImGui::Text("蹦蹦");
                    ImGui::TableNextColumn();
                    ImGui::InputInt("##Buggy", &preferences.Config.Skin.Buggy);
                    
                    ImGui::TableNextColumn();
                    ImGui::Checkbox("###234995", &preferences.MiniBus);
                    ImGui::TableNextColumn();
                    ImGui::Text("马");
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
                }
            }//
                                
    }

    ImGui::PopStyleVar(2);
    ImGui::PopStyleVar();
    ImGui::EndChild();

    // 更新和绘制粒子效果
    UpdateParticles(deltaTime, windowSize, windowPos);
    DrawParticles(draw_list, windowPos, windowSize);

    ImGui::End();
}
//保存系统配置
void SavePreferences() {
    #ifdef __APPLE__
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:Settings::Tab forKey:@"SelectedTab"];
    
    // 项目公告设置
    [defaults setBool:thongtin forKey:@"ShowMatchInfo"];
    [defaults setBool:Config.ESPMenu.ESPON forKey:@"FixLayers"];
    [defaults setFloat:snowSpeed forKey:@"SnowSpeed"];
    [defaults setFloat:rainSpeed forKey:@"RainSpeed"];
    [defaults setFloat:textScrollSpeed forKey:@"TextScrollSpeed"];
    [defaults setBool:十字架 forKey:@"十字架辅助"];
    
    // 绘制菜单设置
    [defaults setBool:ZERO血条 forKey:@"ShowZeroHealth"];
    [defaults setBool:鲨鱼血条 forKey:@"ShowSharkHealth"];
    [defaults setBool:引擎血条 forKey:@"ShowEngineHealth"];
    [defaults setBool:秘银血条 forKey:@"ShowMithrilHealth"];
    [defaults setBool:Config.ESPMenu.Name forKey:@"ShowPlayerNames"];
    [defaults setBool:Config.ESPMenu.Line forKey:@"ShowPlayerLines"];
    [defaults setBool:Config.ESPMenu.Box forKey:@"Show3DBox"];
    [defaults setBool:Config.ESPMenu.Alert forKey:@"ShowBehindAlert"];
    [defaults setBool:Config.ESPMenu.Radar forKey:@"ShowRadarAlert"];
    [defaults setBool:Config.ESPMenu.GRWAR forKey:@"ShowGrenadeAlert"];
    [defaults setBool:Config.ESPMenu.IgnoreBot forKey:@"IgnoreBots"];
    [defaults setBool:Config.ESPMenu.Skeleton forKey:@"ShowSkeleton"];
    [defaults setBool:Config.ESPMenu.Weapon forKey:@"ShowWeapon"];
    [defaults setFloat:Config.ESPMenu.RadarX forKey:@"RadarX"];
    [defaults setFloat:Config.ESPMenu.RadarY forKey:@"RadarY"];
    
    // 物资菜单设置
    [defaults setBool:IsITM forKey:@"ShowItems"];
    [defaults setBool:IsShotgun forKey:@"ShowShotguns"];
    [defaults setBool:IsAR forKey:@"ShowARs"];
    [defaults setBool:IsSMG forKey:@"ShowSMGs"];
    [defaults setBool:IsAmmo forKey:@"ShowAmmo"];
    [defaults setBool:IsSniper forKey:@"ShowSnipers"];
    [defaults setBool:IsLootBox forKey:@"ShowLootBoxes"];
    [defaults setBool:IsVehcle forKey:@"ShowVehicles"];
    [defaults setBool:IsCarFuel forKey:@"ShowVehicleFuel"];
    [defaults setBool:IsCarHP forKey:@"ShowVehicleHP"];
    [defaults setBool:IsboxVechle forKey:@"ShowVehicleBoxes"];
    
    // 追踪菜单设置
    [defaults setBool:preferences.Config.SilentAim.Fov forKey:@"DynamicFOV"];
    [defaults setBool:preferences.Config.SilentAim.IgnoreKnocked forKey:@"IgnoreKnocked"];
    [defaults setBool:preferences.Config.SilentAim.IgnoreBot forKey:@"AimIgnoreBots"];
    [defaults setInteger:追踪概率 forKey:@"TrackProbability"];
    [defaults setInteger:preferences.Config.SilentAim.Cross forKey:@"AimFOV"];
    [defaults setFloat:g_disstance forKey:@"DistanceLimit"];
    [defaults setInteger:(NSInteger)preferences.Config.SilentAim.Target forKey:@"MissTarget"];
    [defaults setInteger:AimF forKey:@"TriggerMode"];
    
    // 娱乐菜单设置
    [defaults setBool:judian forKey:@"FocusPoint"];
    [defaults setBool:WideView forKey:@"WideView"];
    [defaults setInteger:WideValue forKey:@"WideFOV"];
    [defaults setBool:冻结大厅 forKey:@"FreezeLobby"];
    [defaults setBool:好玩飞天 forKey:@"FlyMode"];
    [defaults setBool:chongchongche forKey:@"SpinMode"];
    [defaults setFloat:tocdoquay forKey:@"SpinSpeed"];
    [defaults setBool:人物变大 forKey:@"EnlargePlayer"];
    [defaults setFloat:巨人 forKey:@"PlayerSize"];
    [defaults setBool:枪械变大 forKey:@"EnlargeWeapons"];
    [defaults setFloat:Gun_Size forKey:@"WeaponSize"];
    
    [defaults synchronize];
    #elif _WIN32
    // Windows平台实现
    #endif
}

// 从系统偏好设置加载配置
void LoadPreferences() {
    #ifdef __APPLE__
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    // 基本设置
    Settings::Tab = [defaults integerForKey:@"SelectedTab"];
    if (Settings::Tab < 0 || Settings::Tab > 5) Settings::Tab = 0;
    
    // 项目公告设置
    thongtin = [defaults boolForKey:@"ShowMatchInfo"];
    Config.ESPMenu.ESPON = [defaults boolForKey:@"FixLayers"];
    十字架 = [defaults boolForKey:@"十字架辅助"];
    snowSpeed = [defaults floatForKey:@"SnowSpeed"];
    if (snowSpeed <= 0) snowSpeed = 15.0f;
    rainSpeed = [defaults floatForKey:@"RainSpeed"];
    if (rainSpeed <= 0) rainSpeed = 15.0f;
    textScrollSpeed = [defaults floatForKey:@"TextScrollSpeed"];
    if (textScrollSpeed <= 0) textScrollSpeed = 50.0f;
    
    // 绘制菜单设置
    ZERO血条 = [defaults boolForKey:@"ShowZeroHealth"];
    鲨鱼血条 = [defaults boolForKey:@"ShowSharkHealth"];
    引擎血条 = [defaults boolForKey:@"ShowEngineHealth"];
    秘银血条 = [defaults boolForKey:@"ShowMithrilHealth"];
    Config.ESPMenu.Name = [defaults boolForKey:@"ShowPlayerNames"];
    Config.ESPMenu.Line = [defaults boolForKey:@"ShowPlayerLines"];
    Config.ESPMenu.Box = [defaults boolForKey:@"Show3DBox"];
    Config.ESPMenu.Alert = [defaults boolForKey:@"ShowBehindAlert"];
    Config.ESPMenu.Radar = [defaults boolForKey:@"ShowRadarAlert"];
    Config.ESPMenu.GRWAR = [defaults boolForKey:@"ShowGrenadeAlert"];
    Config.ESPMenu.IgnoreBot = [defaults boolForKey:@"IgnoreBots"];
    Config.ESPMenu.Skeleton = [defaults boolForKey:@"ShowSkeleton"];
    Config.ESPMenu.Weapon = [defaults boolForKey:@"ShowWeapon"];
    Config.ESPMenu.RadarX = [defaults floatForKey:@"RadarX"];
    Config.ESPMenu.RadarY = [defaults floatForKey:@"RadarY"];
    
    // 物资菜单设置
    IsITM = [defaults boolForKey:@"ShowItems"];
    IsShotgun = [defaults boolForKey:@"ShowShotguns"];
    IsAR = [defaults boolForKey:@"ShowARs"];
    IsSMG = [defaults boolForKey:@"ShowSMGs"];
    IsAmmo = [defaults boolForKey:@"ShowAmmo"];
    IsSniper = [defaults boolForKey:@"ShowSnipers"];
    IsLootBox = [defaults boolForKey:@"ShowLootBoxes"];
    IsVehcle = [defaults boolForKey:@"ShowVehicles"];
    IsCarFuel = [defaults boolForKey:@"ShowVehicleFuel"];
    IsCarHP = [defaults boolForKey:@"ShowVehicleHP"];
    IsboxVechle = [defaults boolForKey:@"ShowVehicleBoxes"];
    
    // 追踪菜单设置
    preferences.Config.SilentAim.Fov = [defaults boolForKey:@"DynamicFOV"];
    preferences.Config.SilentAim.IgnoreKnocked = [defaults boolForKey:@"IgnoreKnocked"];
    preferences.Config.SilentAim.IgnoreBot = [defaults boolForKey:@"AimIgnoreBots"];
    追踪概率 = [defaults integerForKey:@"TrackProbability"];
    if (追踪概率 <= 0 || 追踪概率 > 100) 追踪概率 = 50;
    preferences.Config.SilentAim.Cross = [defaults integerForKey:@"AimFOV"];
    if (preferences.Config.SilentAim.Cross <= 0) preferences.Config.SilentAim.Cross = 50;
    g_disstance = [defaults floatForKey:@"DistanceLimit"];
    if (g_disstance <= 0) g_disstance = 100.0f;
    
    // 修复类型转换
    NSInteger targetInt = [defaults integerForKey:@"MissTarget"];
    preferences.Config.SilentAim.Target = static_cast<JsonPreferences::EAimTarget>(targetInt);
    if (preferences.Config.SilentAim.Target < 0 || preferences.Config.SilentAim.Target > 2) {
        preferences.Config.SilentAim.Target = static_cast<JsonPreferences::EAimTarget>(0);
    }
    
    AimF = [defaults integerForKey:@"TriggerMode"];
    if (AimF < 1 || AimF > 3) AimF = 1;
    
    // 娱乐菜单设置
    judian = [defaults boolForKey:@"FocusPoint"];
    WideView = [defaults boolForKey:@"WideView"];
    WideValue = [defaults integerForKey:@"WideFOV"];
    if (WideValue < 90 || WideValue > 180) WideValue = 120;
    冻结大厅 = [defaults boolForKey:@"FreezeLobby"];
    好玩飞天 = [defaults boolForKey:@"FlyMode"];
    chongchongche = [defaults boolForKey:@"SpinMode"];
    tocdoquay = [defaults floatForKey:@"SpinSpeed"];
    if (tocdoquay < 0) tocdoquay = 300.0f;
    人物变大 = [defaults boolForKey:@"EnlargePlayer"];
    巨人 = [defaults floatForKey:@"PlayerSize"];
    if (巨人 < 0) 巨人 = 1.5f;
    枪械变大 = [defaults boolForKey:@"EnlargeWeapons"];
    Gun_Size = [defaults floatForKey:@"WeaponSize"];
    if (Gun_Size < 0) Gun_Size = 1.5f;
    #elif _WIN32
    // Windows平台实现
    #endif
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
            overlayView.preferredFramesPerSecond = 120;
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
    //自瞄强度

    //自瞄距离
    self.moduleControl->aimbotController.distance = configManager::readFloat(config,"aimbotControl", "distance", 450);
    //自瞄速率
    self.moduleControl->aimbotController.aimbotIntensity = configManager::readFloat(config,"aimbotControl", "intensity", 0.20);
}


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

uint64_t getRealOffset(uint64_t offset)
{
    uint64_t vmaddr = getBaseAddress("ShadowTrackerExtra");
    return vmaddr + offset;
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
            return getRealOffset(0x10A750DF0);//这里写的是guo的偏移
        }
        if([BundID containsString:@"imobile"]){
            return getRealOffset(0x109CBC548);
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
            return ((TNameEntryArray *(*)()) ((unsigned long)_dyld_get_image_vmaddr_slide(1) +0x104AB914C))();
        }
        if([BundID containsString:@"kr"]){
            return ((TNameEntryArray *(*)()) ((unsigned long)_dyld_get_image_vmaddr_slide(1) +0x104C630A0))();
        }
        if([BundID containsString:@"rekoo"]){
            return ((TNameEntryArray *(*)()) ((unsigned long)_dyld_get_image_vmaddr_slide(1) +0x104C3A12C))();
        }
        if([BundID containsString:@"vn"]){
            return ((TNameEntryArray *(*)()) ((unsigned long)_dyld_get_image_vmaddr_slide(1) +0x104A0612C))();//这里写的是gname的偏移
        }
        if([BundID containsString:@"imobile"]){
            return ((TNameEntryArray *(*)()) ((unsigned long)_dyld_get_image_vmaddr_slide(1) +0x1043A93A4))();
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
#define COLOR_WHITE FLinearColor(1.f, 1.f, 1.f, 1.f)
#define COLOR_RED   FLinearColor(1.f, 0, 0, 1.f)
#define COLOR_YELLOW  FLinearColor(1, 1, 0.f, 1.f)
#define COLOR_LIME  FLinearColor(0, 1.f, 0, 1.f)
#define COLOR_BLUE  FLinearColor(0, 0, 1.f, 1.f)
#define COLOR_CAR   FLinearColor(1.f, 0.5f, 1.f, 1.f)
#define GREEN       FLinearColor(0 / 255.f, 153 / 255.f, 0 / 255.f, 1.f)
#define ABU         FLinearColor(0 / 255.f, 204 / 255.f, 204 / 255.f, 1.f)
#define COLOR_GREEN FLinearColor(0, 0.5f, 0, 1.f)
#define COLOR_PLAYER FLinearColor(1.000f, 0.620f, 0.150f, 1.000f)
#define COLOR_ORANGE FLinearColor(1.f, 0.4f, 0, 1.f)
UGameplayStatics* iosde = (UGameplayStatics*)UGameplayStatics::StaticClass();
ASTExtraPlayerController *localPlayerController = 0;
#define W2S(w, s) iosde->ProjectWorldToScreen(localPlayerController, w, true, s)
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
// 绘制圆角矩形填充
void DrawFilledRoundedRect(AHUD* HUD, FVector2D pos, FVector2D size, float radius, FLinearColor fillColor)
{
    // 绘制中间矩形
    DrawFilledRectangle(HUD, FVector2D(pos.X + radius, pos.Y), size.X - 2 * radius, size.Y, fillColor);
    DrawFilledRectangle(HUD, FVector2D(pos.X, pos.Y + radius), radius, size.Y - 2 * radius, fillColor);
    DrawFilledRectangle(HUD, FVector2D(pos.X + size.X - radius, pos.Y + radius), radius, size.Y - 2 * radius, fillColor);

    // 绘制四个角圆填充
    const int NumSides = 32; // 圆滑度
    DrawFilledCircle(HUD, (int)(pos.X + radius), (int)(pos.Y + radius), (int)radius, NumSides, fillColor, fillColor);
    DrawFilledCircle(HUD, (int)(pos.X + size.X - radius), (int)(pos.Y + radius), (int)radius, NumSides, fillColor, fillColor);
    DrawFilledCircle(HUD, (int)(pos.X + radius), (int)(pos.Y + size.Y - radius), (int)radius, NumSides, fillColor, fillColor);
    DrawFilledCircle(HUD, (int)(pos.X + size.X - radius), (int)(pos.Y + size.Y - radius), (int)radius, NumSides, fillColor, fillColor);
}

// 绘制圆角矩形描边
void DrawRoundedRectOutline(AHUD* HUD, FVector2D pos, FVector2D size, float radius, FLinearColor outlineColor, float thickness)
{
    // 画四条边线（用DrawLine）
    // 上边
    HUD->DrawLine(pos.X + radius, pos.Y, pos.X + size.X - radius, pos.Y, outlineColor, thickness);
    // 下边
    HUD->DrawLine(pos.X + radius, pos.Y + size.Y, pos.X + size.X - radius, pos.Y + size.Y, outlineColor, thickness);
    // 左边
    HUD->DrawLine(pos.X, pos.Y + radius, pos.X, pos.Y + size.Y - radius, outlineColor, thickness);
    // 右边
    HUD->DrawLine(pos.X + size.X, pos.Y + radius, pos.X + size.X, pos.Y + size.Y - radius, outlineColor, thickness);

    // 画四个角的圆弧边框（用DrawCircle）
    const int NumSides = 32;
    DrawCircle(HUD, (int)(pos.X + radius), (int)(pos.Y + radius), (int)radius, NumSides, outlineColor);
    DrawCircle(HUD, (int)(pos.X + size.X - radius), (int)(pos.Y + radius), (int)radius, NumSides, outlineColor);
    DrawCircle(HUD, (int)(pos.X + radius), (int)(pos.Y + size.Y - radius), (int)radius, NumSides, outlineColor);
    DrawCircle(HUD, (int)(pos.X + size.X - radius), (int)(pos.Y + size.Y - radius), (int)radius, NumSides, outlineColor);
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
auto GetTargetByCrossDist() {
    ASTExtraPlayerCharacter* result = 0;
    float max = std::numeric_limits<float>::infinity();

    auto localPlayer = g_LocalPlayer;
    auto localController = g_PlayerController;

    if (localPlayer && localController) {
        std::vector<ASTExtraPlayerCharacter*> PlayerCharacter;
        GetAllActors(PlayerCharacter);
        for (auto actor = PlayerCharacter.begin(); actor != PlayerCharacter.end(); actor++) {
            auto Player = *actor;

            if (Player->PlayerKey == localPlayer->PlayerKey)
                continue;
            if (Player->TeamID == localPlayer->TeamID)
                continue;
            if (Player->bDead)
                continue;
            if (Player->bHidden)
                continue;
            if (!Player->Mesh)
                continue;
            if (!Player->RootComponent)
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

            // 视线检测：仅保留原始骨骼（删除所有新增骨骼）
            if(!g_PlayerController->LineOfSightTo(g_PlayerController->PlayerCameraManager, Player->GetBonePos("Head", {0, 0, 0}), false) &&
               !g_PlayerController->LineOfSightTo(g_PlayerController->PlayerCameraManager, Player->GetBonePos("neck_01", {0, 0, 0}), false) &&
               !g_PlayerController->LineOfSightTo(g_PlayerController->PlayerCameraManager, Player->GetBonePos("spine_02", {0, 0, 0}), false) &&
               !g_PlayerController->LineOfSightTo(g_PlayerController->PlayerCameraManager, Player->GetBonePos("pelvis", {0, 0, 0}), false) &&
               !g_PlayerController->LineOfSightTo(g_PlayerController->PlayerCameraManager, Player->GetBonePos("clavicle_r", {0, 0, 0}), false) &&
               !g_PlayerController->LineOfSightTo(g_PlayerController->PlayerCameraManager, Player->GetBonePos("upperarm_r", {0, 0, 0}), false) &&
               !g_PlayerController->LineOfSightTo(g_PlayerController->PlayerCameraManager, Player->GetBonePos("lowerarm_r", {0, 0, 0}), false) &&
               !g_PlayerController->LineOfSightTo(g_PlayerController->PlayerCameraManager, Player->GetBonePos("hand_r", {0, 0, 0}), false) &&
               !g_PlayerController->LineOfSightTo(g_PlayerController->PlayerCameraManager, Player->GetBonePos("clavicle_l", {0, 0, 0}), false) &&
               !g_PlayerController->LineOfSightTo(g_PlayerController->PlayerCameraManager, Player->GetBonePos("upperarm_l", {0, 0, 0}), false) &&
               !g_PlayerController->LineOfSightTo(g_PlayerController->PlayerCameraManager, Player->GetBonePos("lowerarm_l", {0, 0, 0}), false) &&
               !g_PlayerController->LineOfSightTo(g_PlayerController->PlayerCameraManager, Player->GetBonePos("hand_l", {0, 0, 0}), false) &&
               !g_PlayerController->LineOfSightTo(g_PlayerController->PlayerCameraManager, Player->GetBonePos("thigh_r", {0, 0, 0}), false) &&
               !g_PlayerController->LineOfSightTo(g_PlayerController->PlayerCameraManager, Player->GetBonePos("calf_r", {0, 0, 0}), false) &&
               !g_PlayerController->LineOfSightTo(g_PlayerController->PlayerCameraManager, Player->GetBonePos("foot_r", {0, 0, 0}), false) &&
               !g_PlayerController->LineOfSightTo(g_PlayerController->PlayerCameraManager, Player->GetBonePos("thigh_l", {0, 0, 0}), false) &&
               !g_PlayerController->LineOfSightTo(g_PlayerController->PlayerCameraManager, Player->GetBonePos("calf_l", {0, 0, 0}), false) &&
               !g_PlayerController->LineOfSightTo(g_PlayerController->PlayerCameraManager, Player->GetBonePos("foot_l", {0, 0, 0}), false))
                continue;

            static bool 已选择 = false;
            算法 = 0;
            已选择 = false;

            // 仅保留原始骨骼视线检测变量（删除所有新增骨骼变量）
            is头 = localController->LineOfSightTo(localController->PlayerCameraManager, Player->GetBonePos("Head", {}), true);
            is脖子 = localController->LineOfSightTo(localController->PlayerCameraManager, Player->GetBonePos("neck_01", {}), true);
            is脊骨2 = localController->LineOfSightTo(localController->PlayerCameraManager, Player->GetBonePos("spine_02", {}), true);
            is盆骨 = localController->LineOfSightTo(localController->PlayerCameraManager, Player->GetBonePos("pelvis", {}), true);

            is右锁骨 = localController->LineOfSightTo(localController->PlayerCameraManager, Player->GetBonePos("clavicle_r", {}), true);
            is右上臂 = localController->LineOfSightTo(localController->PlayerCameraManager, Player->GetBonePos("upperarm_r", {}), true);
            is右小臂 = localController->LineOfSightTo(localController->PlayerCameraManager, Player->GetBonePos("lowerarm_r", {}), true);
            is右手 = localController->LineOfSightTo(localController->PlayerCameraManager, Player->GetBonePos("hand_r", {}), true);

            is左锁骨 = localController->LineOfSightTo(localController->PlayerCameraManager, Player->GetBonePos("clavicle_l", {}), true);
            is左上臂 = localController->LineOfSightTo(localController->PlayerCameraManager, Player->GetBonePos("upperarm_l", {}), true);
            is左小臂 = localController->LineOfSightTo(localController->PlayerCameraManager, Player->GetBonePos("lowerarm_l", {}), true);
            is左手 = localController->LineOfSightTo(localController->PlayerCameraManager, Player->GetBonePos("hand_l", {}), true);

            is右大腿 = localController->LineOfSightTo(localController->PlayerCameraManager, Player->GetBonePos("thigh_r", {}), true);
            is右小腿 = localController->LineOfSightTo(localController->PlayerCameraManager, Player->GetBonePos("calf_r", {}), true);
            is右脚 = localController->LineOfSightTo(localController->PlayerCameraManager, Player->GetBonePos("foot_r", {}), true);

            is左大腿 = localController->LineOfSightTo(localController->PlayerCameraManager, Player->GetBonePos("thigh_l", {}), true);
            is左小腿 = localController->LineOfSightTo(localController->PlayerCameraManager, Player->GetBonePos("calf_l", {}), true);
            is左脚 = localController->LineOfSightTo(localController->PlayerCameraManager, Player->GetBonePos("foot_l", {}), true);

            // 算法优先级：仅基于原始骨骼（删除新增骨骼的优先级判断）
            if (!已选择 && is头) {
                算法 = 0;
                已选择 = true;
            }
            if (!已选择 && is脖子) {
                算法 = 1;
                已选择 = true;
            }
            if (!已选择 && is脊骨2) {
                算法 = 2;
                已选择 = true;
            }
            if (!已选择 && is盆骨) {
                算法 = 3;
                已选择 = true;
            }

            // 右臂优先级
            if (!已选择 && is右锁骨) {
                算法 = 4;
                已选择 = true;
            }
            if (!已选择 && is右上臂) {
                算法 = 5;
                已选择 = true;
            }
            if (!已选择 && is右小臂) {
                算法 = 6;
                已选择 = true;
            }
            if (!已选择 && is右手) {
                算法 = 7;
                已选择 = true;
            }

            // 左臂优先级
            if (!已选择 && is左锁骨) {
                算法 = 8;
                已选择 = true;
            }
            if (!已选择 && is左上臂) {
                算法 = 9;
                已选择 = true;
            }
            if (!已选择 && is左小臂) {
                算法 = 10;
                已选择 = true;
            }
            if (!已选择 && is左手) {
                算法 = 11;
                已选择 = true;
            }

            // 右腿优先级
            if (!已选择 && is右大腿) {
                算法 = 12;
                已选择 = true;
            }
            if (!已选择 && is右小腿) {
                算法 = 13;
                已选择 = true;
            }
            if (!已选择 && is右脚) {
                算法 = 14;
                已选择 = true;
            }

            // 左腿优先级
            if (!已选择 && is左大腿) {
                算法 = 15;
                已选择 = true;
            }
            if (!已选择 && is左小腿) {
                算法 = 16;
                已选择 = true;
            }
            if (!已选择 && is左脚) {
                算法 = 17;
                已选择 = true;
            }

            auto Root = Player->GetBonePos("Root", {});
            auto Head = Player->GetBonePos("Head", {});

            FVector2D RootSc, HeadSc;
            if (W2S(Root, &RootSc) && W2S(Head, &HeadSc)) {
                float height = abs(HeadSc.Y - RootSc.Y);
                float width = height * 1.00f;

                FVector middlePoint = {HeadSc.X + (width / 2), HeadSc.Y + (height / 2), 0};
                if ((middlePoint.X >= 0 && middlePoint.X <= (float)glWidth) &&
                    (middlePoint.Y >= 0 && middlePoint.Y <= (float)glHeight)) {
                    FVector2D v2Middle = FVector2D((float)(glWidth / 2), (float)(glHeight / 2));
                    FVector2D v2Loc = FVector2D(middlePoint.X, middlePoint.Y);
                    if (isInsideFOV((int)middlePoint.X, (int)middlePoint.Y)) {
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
   if (preferences.Config.SilentAim.Enable) {
        if(!g_LocalPlayer->IsUsingGrenade()){
         ASTExtraPlayerCharacter *Target = GetTargetByCrossDist();
        if (Target) {
            bool triggerOk = g_LocalPlayer->bIsWeaponFiring || g_LocalPlayer->bIsGunADS;
            if (triggerOk) {
                int randomNumber = arc4random_uniform(100);
                if (randomNumber < 追踪概率) { 
                    FVector targetAimPos;
                    switch (preferences.Config.SilentAim.Target) {
case JsonPreferences::EAimTarget::Head: {
    // 算法0-18对应18个关键骨骼（移除手指后：躯干4+右臂4+左臂4+右腿3+左腿3）
    if (算法 == 0) {
        targetAimPos = Target->GetBonePos("Head", {0, 0, 0}); // 头部
    } else if (算法 == 1) {
        targetAimPos = Target->GetBonePos("neck_01", {0, 0, 0}); // 颈部
    } else if (算法 == 2) {
        targetAimPos = Target->GetBonePos("spine_02", {0, 0, 0}); // 躯干
    } else if (算法 == 3) {
        targetAimPos = Target->GetBonePos("pelvis", {0, 0, 0}); // 骨盆
    } else if (算法 == 4) {
        targetAimPos = Target->GetBonePos("clavicle_r", {0, 0, 0}); // 右锁骨
    } else if (算法 == 5) {
        targetAimPos = Target->GetBonePos("upperarm_r", {0, 0, 0}); // 右上臂
    } else if (算法 == 6) {
        targetAimPos = Target->GetBonePos("lowerarm_r", {0, 0, 0}); // 右前臂
    } else if (算法 == 7) {
        targetAimPos = Target->GetBonePos("hand_r", {0, 0, 0}); // 右手
    } else if (算法 == 8) {
        targetAimPos = Target->GetBonePos("clavicle_l", {0, 0, 0}); // 左锁骨（原算法9移至8）
    } else if (算法 == 9) {
        targetAimPos = Target->GetBonePos("upperarm_l", {0, 0, 0}); // 左上臂（原算法10移至9）
    } else if (算法 == 10) {
        targetAimPos = Target->GetBonePos("lowerarm_l", {0, 0, 0}); // 左前臂（原算法11移至10）
    } else if (算法 == 11) {
        targetAimPos = Target->GetBonePos("hand_l", {0, 0, 0}); // 左手（原算法12移至11）
    } else if (算法 == 12) {
        targetAimPos = Target->GetBonePos("thigh_r", {0, 0, 0}); // 右大腿（原算法14移至12）
    } else if (算法 == 13) {
        targetAimPos = Target->GetBonePos("calf_r", {0, 0, 0}); // 右小腿（原算法15移至13）
    } else if (算法 == 14) {
        targetAimPos = Target->GetBonePos("foot_r", {0, 0, 0}); // 右脚（原算法16移至14）
    } else if (算法 == 15) {
        targetAimPos = Target->GetBonePos("thigh_l", {0, 0, 0}); // 左大腿（原算法17移至15）
    } else if (算法 == 16) {
        targetAimPos = Target->GetBonePos("calf_l", {0, 0, 0}); // 左小腿（原算法18移至16）
    } else if (算法 == 17) {
        targetAimPos = Target->GetBonePos("foot_l", {0, 0, 0}); // 左脚（原算法19移至17）
    }
    break;
}
case JsonPreferences::EAimTarget::Chest: {
    // 算法0-18对应18个关键骨骼（移除手指后：躯干优先，其次四肢）
    if (算法 == 0) {
        targetAimPos = Target->GetBonePos("spine_02", {0, 0, 0}); // 躯干核心
    } else if (算法 == 1) {
        targetAimPos = Target->GetBonePos("neck_01", {0, 0, 0}); // 颈部
    } else if (算法 == 2) {
        targetAimPos = Target->GetBonePos("Head", {0, 0, 0}); // 头部
    } else if (算法 == 3) {
        targetAimPos = Target->GetBonePos("pelvis", {0, 0, 0}); // 骨盆
    } else if (算法 == 4) {
        targetAimPos = Target->GetBonePos("clavicle_r", {0, 0, 0}); // 右锁骨
    } else if (算法 == 5) {
        targetAimPos = Target->GetBonePos("upperarm_r", {0, 0, 0}); // 右上臂
    } else if (算法 == 6) {
        targetAimPos = Target->GetBonePos("lowerarm_r", {0, 0, 0}); // 右前臂
    } else if (算法 == 7) {
        targetAimPos = Target->GetBonePos("hand_r", {0, 0, 0}); // 右手
    } else if (算法 == 8) {
        targetAimPos = Target->GetBonePos("clavicle_l", {0, 0, 0}); // 左锁骨（原算法9移至8）
    } else if (算法 == 9) {
        targetAimPos = Target->GetBonePos("upperarm_l", {0, 0, 0}); // 左上臂（原算法10移至9）
    } else if (算法 == 10) {
        targetAimPos = Target->GetBonePos("lowerarm_l", {0, 0, 0}); // 左前臂（原算法11移至10）
    } else if (算法 == 11) {
        targetAimPos = Target->GetBonePos("hand_l", {0, 0, 0}); // 左手（原算法12移至11）
    } else if (算法 == 12) {
        targetAimPos = Target->GetBonePos("thigh_r", {0, 0, 0}); // 右大腿（原算法14移至12）
    } else if (算法 == 13) {
        targetAimPos = Target->GetBonePos("calf_r", {0, 0, 0}); // 右小腿（原算法15移至13）
    } else if (算法 == 14) {
        targetAimPos = Target->GetBonePos("foot_r", {0, 0, 0}); // 右脚（原算法16移至14）
    } else if (算法 == 15) {
        targetAimPos = Target->GetBonePos("thigh_l", {0, 0, 0}); // 左大腿（原算法17移至15）
    } else if (算法 == 16) {
        targetAimPos = Target->GetBonePos("calf_l", {0, 0, 0}); // 左小腿（原算法18移至16）
    } else if (算法 == 17) {
        targetAimPos = Target->GetBonePos("foot_l", {0, 0, 0}); // 左脚（原算法19移至17）
    }
    
    if (喵身体) {
        targetAimPos.Z -= 25.0; 
    }
    break;
}
case JsonPreferences::EAimTarget::随机部位: {
    bool selected = false; 
    int random = rand() % 100; 

    // 30%概率选择头部区域（仅头部/颈部）
    if (random < 30) {
        if (is头) { // 对应Head
            targetAimPos = Target->GetBonePos("Head", {});
            selected = true;
        } else if (is脖子) { // 对应neck_01
            targetAimPos = Target->GetBonePos("neck_01", {});
            selected = true;
        }
    }
    // 60%概率选择上半身（躯干+手臂关键骨骼，移除手指）
    else if (random < 90) {
        if (is脊骨2) { // 对应spine_02
            targetAimPos = Target->GetBonePos("spine_02", {});
            selected = true;
        } else if (is盆骨) { // 对应pelvis
            targetAimPos = Target->GetBonePos("pelvis", {});
            selected = true;
        } else if (is右锁骨) { // 对应clavicle_r
            targetAimPos = Target->GetBonePos("clavicle_r", {});
            selected = true;
        } else if (is左锁骨) { // 对应clavicle_l
            targetAimPos = Target->GetBonePos("clavicle_l", {});
            selected = true;
        } else if (is右上臂) { // 对应upperarm_r
            targetAimPos = Target->GetBonePos("upperarm_r", {});
            selected = true;
        } else if (is左上臂) { // 对应upperarm_l
            targetAimPos = Target->GetBonePos("upperarm_l", {});
            selected = true;
        } else if (is右小臂) { // 对应lowerarm_r
            targetAimPos = Target->GetBonePos("lowerarm_r", {});
            selected = true;
        } else if (is左小臂) { // 对应lowerarm_l
            targetAimPos = Target->GetBonePos("lowerarm_l", {});
            selected = true;
        } else if (is右手) { // 对应hand_r
            targetAimPos = Target->GetBonePos("hand_r", {});
            selected = true;
        } else if (is左手) { // 对应hand_l
            targetAimPos = Target->GetBonePos("hand_l", {});
            selected = true;
        }
    }
    // 10%概率选择下半身（腿部关键骨骼）
    else {
        if (is右大腿) { // 对应thigh_r
            targetAimPos = Target->GetBonePos("thigh_r", {});
            selected = true;
        } else if (is左大腿) { // 对应thigh_l
            targetAimPos = Target->GetBonePos("thigh_l", {});
            selected = true;
        } else if (is右小腿) { // 对应calf_r
            targetAimPos = Target->GetBonePos("calf_r", {});
            selected = true;
        } else if (is左小腿) { // 对应calf_l
            targetAimPos = Target->GetBonePos("calf_l", {});
            selected = true;
        } else if (is右脚) { // 对应foot_r
            targetAimPos = Target->GetBonePos("foot_r", {});
            selected = true;
        } else if (is左脚) { // 对应foot_l
            targetAimPos = Target->GetBonePos("foot_l", {});
            selected = true;
        }
    }
    break;
}            
                        
                        default:
                            targetAimPos = Target->GetBonePos("Head", {0, 0, 0});
                            break;
                    }
                    
                    UShootWeaponEntity *ShootWeaponEntityComponent = thiz->ShootWeaponEntityComponent;
                    if (ShootWeaponEntityComponent) {
                        FVector targetVelocity;
                        float dist = g_LocalPlayer->GetDistanceTo(Target);
                        float travelTime = dist / ShootWeaponEntityComponent->BulletFireSpeed;
                        
                        if (Target->CurrentVehicle) {
                            targetVelocity = Target->CurrentVehicle->ReplicatedMovement.LinearVelocity;
                        } else {
                            targetVelocity = Target->GetVelocity();
                        }
                        
                        targetAimPos += targetVelocity * travelTime;
                        FRotator sex = ToRotator(start, targetAimPos);
                        return orig_shoot_event(thiz, start, sex, weapon, unk1);
                    }
                }
            }
        }
        }else{

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



void RenderESP(AHUD *HUD, int ScreenWidth, int ScreenHeight) {
    updateSkin();
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
std::wstring name = L"";
            DrawTextcan(HUD, FString(name), {(float) screenWidth/2, 80}, COLOR_WHITE, COLOR_BLACK);
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
std::wstring name = L"Mithril";
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

            s += "Mithril";
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
localPlayer->ThirdPersonCameraComponent->SetFieldOfView(WideValue);
            }
auto WeaponManagerComponent = localPlayer->WeaponManagerComponent;
if (preferences.Config.SilentAim.AimBot) {
    if(!g_LocalPlayer->IsUsingGrenade()){
    ASTExtraPlayerCharacter* Target = GetTargetByCrossDist(); 
    if (Target) {
        FVector targetAimPos;
        switch (preferences.Config.SilentAim.Target) {
            case JsonPreferences::EAimTarget::Head: {
                if (算法 == 0) targetAimPos = Target->GetBonePos("Head", {0, 0, 0});
                else if (算法 == 1) targetAimPos = Target->GetBonePos("neck_01", {0, 0, 0});
                else if (算法 == 2) targetAimPos = Target->GetBonePos("spine_02", {0, 0, 0});
                else if (算法 == 3) targetAimPos = Target->GetBonePos("pelvis", {0, 0, 0});
                else if (算法 == 4) targetAimPos = Target->GetBonePos("clavicle_r", {0, 0, 0});
                else if (算法 == 5) targetAimPos = Target->GetBonePos("upperarm_r", {0, 0, 0});
                else if (算法 == 6) targetAimPos = Target->GetBonePos("lowerarm_r", {0, 0, 0});
                else if (算法 == 7) targetAimPos = Target->GetBonePos("hand_r", {0, 0, 0});
                else if (算法 == 8) targetAimPos = Target->GetBonePos("clavicle_l", {0, 0, 0});
                else if (算法 == 9) targetAimPos = Target->GetBonePos("upperarm_l", {0, 0, 0});
                else if (算法 == 10) targetAimPos = Target->GetBonePos("lowerarm_l", {0, 0, 0});
                else if (算法 == 11) targetAimPos = Target->GetBonePos("hand_l", {0, 0, 0});
                else if (算法 == 12) targetAimPos = Target->GetBonePos("thigh_r", {0, 0, 0});
                else if (算法 == 13) targetAimPos = Target->GetBonePos("calf_r", {0, 0, 0});
                else if (算法 == 14) targetAimPos = Target->GetBonePos("foot_r", {0, 0, 0});
                else if (算法 == 15) targetAimPos = Target->GetBonePos("thigh_l", {0, 0, 0});
                else if (算法 == 16) targetAimPos = Target->GetBonePos("calf_l", {0, 0, 0});
                else if (算法 == 17) targetAimPos = Target->GetBonePos("foot_l", {0, 0, 0});
                break;
            }
            case JsonPreferences::EAimTarget::Chest: {
                if (算法 == 0) targetAimPos = Target->GetBonePos("spine_02", {0, 0, 0});
                else if (算法 == 1) targetAimPos = Target->GetBonePos("neck_01", {0, 0, 0});
                else if (算法 == 2) targetAimPos = Target->GetBonePos("Head", {0, 0, 0});
                else if (算法 == 3) targetAimPos = Target->GetBonePos("pelvis", {0, 0, 0});
                else if (算法 == 4) targetAimPos = Target->GetBonePos("clavicle_r", {0, 0, 0});
                else if (算法 == 5) targetAimPos = Target->GetBonePos("upperarm_r", {0, 0, 0});
                else if (算法 == 6) targetAimPos = Target->GetBonePos("lowerarm_r", {0, 0, 0});
                else if (算法 == 7) targetAimPos = Target->GetBonePos("hand_r", {0, 0, 0});
                else if (算法 == 8) targetAimPos = Target->GetBonePos("clavicle_l", {0, 0, 0});
                else if (算法 == 9) targetAimPos = Target->GetBonePos("upperarm_l", {0, 0, 0});
                else if (算法 == 10) targetAimPos = Target->GetBonePos("lowerarm_l", {0, 0, 0});
                else if (算法 == 11) targetAimPos = Target->GetBonePos("hand_l", {0, 0, 0});
                else if (算法 == 12) targetAimPos = Target->GetBonePos("thigh_r", {0, 0, 0});
                else if (算法 == 13) targetAimPos = Target->GetBonePos("calf_r", {0, 0, 0});
                else if (算法 == 14) targetAimPos = Target->GetBonePos("foot_r", {0, 0, 0});
                else if (算法 == 15) targetAimPos = Target->GetBonePos("thigh_l", {0, 0, 0});
                else if (算法 == 16) targetAimPos = Target->GetBonePos("calf_l", {0, 0, 0});
                else if (算法 == 17) targetAimPos = Target->GetBonePos("foot_l", {0, 0, 0});
                
                if (喵身体) targetAimPos.Z -= 25.0; 
                break;
            }
            case JsonPreferences::EAimTarget::随机部位: {
                bool selected = false; 
                int random = rand() % 100; 
                if (random < 30) {
                    if (is头) { targetAimPos = Target->GetBonePos("Head", {}); selected = true; }
                    else if (is脖子) { targetAimPos = Target->GetBonePos("neck_01", {}); selected = true; }
                } else if (random < 90) {
                    if (is脊骨2) { targetAimPos = Target->GetBonePos("spine_02", {}); selected = true; }
                    else if (is盆骨) { targetAimPos = Target->GetBonePos("pelvis", {}); selected = true; }
                    else if (is右锁骨) { targetAimPos = Target->GetBonePos("clavicle_r", {}); selected = true; }
                    else if (is左锁骨) { targetAimPos = Target->GetBonePos("clavicle_l", {}); selected = true; }
                    else if (is右上臂) { targetAimPos = Target->GetBonePos("upperarm_r", {}); selected = true; }
                    else if (is左上臂) { targetAimPos = Target->GetBonePos("upperarm_l", {}); selected = true; }
                    else if (is右小臂) { targetAimPos = Target->GetBonePos("lowerarm_r", {}); selected = true; }
                    else if (is左小臂) { targetAimPos = Target->GetBonePos("lowerarm_l", {}); selected = true; }
                    else if (is右手) { targetAimPos = Target->GetBonePos("hand_r", {}); selected = true; }
                    else if (is左手) { targetAimPos = Target->GetBonePos("hand_l", {}); selected = true; }
                } else {
                    if (is右大腿) { targetAimPos = Target->GetBonePos("thigh_r", {}); selected = true; }
                    else if (is左大腿) { targetAimPos = Target->GetBonePos("thigh_l", {}); selected = true; }
                    else if (is右小腿) { targetAimPos = Target->GetBonePos("calf_r", {}); selected = true; }
                    else if (is左小腿) { targetAimPos = Target->GetBonePos("calf_l", {}); selected = true; }
                    else if (is右脚) { targetAimPos = Target->GetBonePos("foot_r", {}); selected = true; }
                    else if (is左脚) { targetAimPos = Target->GetBonePos("foot_l", {}); selected = true; }
                }
                break;
            }            
            default:
                targetAimPos = Target->GetBonePos("Head", {});
                break;
        }
        auto WeaponManagerComponent = localPlayer->WeaponManagerComponent;
        if (WeaponManagerComponent) {
            auto propSlot = WeaponManagerComponent->GetCurrentUsingPropSlot();
            if ((int)propSlot.GetValue() >= 1 && (int)propSlot.GetValue() <= 3) {
                auto CurrentWeaponReplicated = (ASTExtraShootWeapon*)WeaponManagerComponent->CurrentWeaponReplicated;
                if (CurrentWeaponReplicated) {
                    auto ShootWeaponComponent = CurrentWeaponReplicated->ShootWeaponComponent;
                    if (ShootWeaponComponent) {
                        UShootWeaponEntity* ShootWeaponEntityComponent = ShootWeaponComponent->ShootWeaponEntityComponent;
                        if (ShootWeaponEntityComponent) {
                            ASTExtraVehicleBase* CurrentVehicle = Target->CurrentVehicle;
                            if (CurrentVehicle) {
                                FVector LinearVelocity = CurrentVehicle->ReplicatedMovement.LinearVelocity;
                                float dist = localPlayer->GetDistanceTo(Target);
                                auto timeToTravel = dist / ShootWeaponEntityComponent->BulletFireSpeed;
                                targetAimPos += LinearVelocity * timeToTravel;
                            } else {
                                FVector Velocity = Target->GetVelocity();
                                float dist = localPlayer->GetDistanceTo(Target);
                                auto timeToTravel = dist / ShootWeaponEntityComponent->BulletFireSpeed;
                                targetAimPos += Velocity * timeToTravel;
                            }
                            if (localPlayer->bIsWeaponFiring) {
                                float dist = localPlayer->GetDistanceTo(Target) / 100.f;
                                targetAimPos.Z -= dist * Aimsmooth;
                            }
                            bool triggerOk = false;
                            if (AimF == 1) {
                                triggerOk = g_LocalPlayer->bIsWeaponFiring;
                            } else if (AimF == 2) {
                                triggerOk = g_LocalPlayer->bIsGunADS;
                            } else if (AimF == 3) {
                                triggerOk = g_LocalPlayer->bIsWeaponFiring || g_LocalPlayer->bIsGunADS;
                            }

                            if (triggerOk) {
                                FVector fDir = targetAimPos - g_PlayerController->PlayerCameraManager->CameraCache.POV.Location;
                                FRotator Yaptr = UKismetMathLibrary::Conv_VectorToRotator(fDir);
                                FRotator CpYaT = g_PlayerController->PlayerCameraManager->CameraCache.POV.Rotation;

                                Yaptr.Pitch -= CpYaT.Pitch;
                                Yaptr.Yaw -= CpYaT.Yaw;
                                Yaptr.Roll = 0.f;
                                NekoHook(Yaptr);

                                CpYaT.Pitch += Yaptr.Pitch / Xs;
                                CpYaT.Yaw += Yaptr.Yaw / Ys;
                                CpYaT.Roll = 0.f;
                                g_PlayerController->SetControlRotation(CpYaT, "");
                            }
                        }
                    }
                }
            }
        }
    }
}else{

}
}
if (preferences.Config.SilentAim.Enable) {
    if(!g_LocalPlayer->IsUsingGrenade()){
                    auto WeaponManagerComponent = localPlayer->WeaponManagerComponent;
                    if (WeaponManagerComponent) {
                        auto propSlot = WeaponManagerComponent->GetCurrentUsingPropSlot();
                        if ((int) propSlot.GetValue() >= 1 && (int) propSlot.GetValue() <= 3) {
                            auto CurrentWeaponReplicated = (ASTExtraShootWeapon *) WeaponManagerComponent->CurrentWeaponReplicated;
                            if (CurrentWeaponReplicated) {
                                auto ShootWeaponComponent = CurrentWeaponReplicated->ShootWeaponComponent;
                                if (ShootWeaponComponent) {
                                    int shoot_event_idx = 172;
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
                }else{

                }
}
if (preferences.Config.SilentAim.Enable || preferences.Config.SilentAim.AimBot) {
    if(!g_LocalPlayer->IsUsingGrenade()){
    ASTExtraPlayerCharacter* Target = GetTargetByCrossDist();
    if (Target && HUD && HUD->Canvas) {
        FVector targetAimPos;
        switch (preferences.Config.SilentAim.Target) {
            case JsonPreferences::EAimTarget::Head: {
                if (算法 == 0) targetAimPos = Target->GetBonePos("Head", {0, 0, 0});
                else if (算法 == 1) targetAimPos = Target->GetBonePos("neck_01", {0, 0, 0});
                else if (算法 == 2) targetAimPos = Target->GetBonePos("spine_02", {0, 0, 0});
                else if (算法 == 3) targetAimPos = Target->GetBonePos("pelvis", {0, 0, 0});
                else if (算法 == 4) targetAimPos = Target->GetBonePos("clavicle_r", {0, 0, 0});
                else if (算法 == 5) targetAimPos = Target->GetBonePos("upperarm_r", {0, 0, 0});
                else if (算法 == 6) targetAimPos = Target->GetBonePos("lowerarm_r", {0, 0, 0});
                else if (算法 == 7) targetAimPos = Target->GetBonePos("hand_r", {0, 0, 0});
                else if (算法 == 8) targetAimPos = Target->GetBonePos("clavicle_l", {0, 0, 0});
                else if (算法 == 9) targetAimPos = Target->GetBonePos("upperarm_l", {0, 0, 0});
                else if (算法 == 10) targetAimPos = Target->GetBonePos("lowerarm_l", {0, 0, 0});
                else if (算法 == 11) targetAimPos = Target->GetBonePos("hand_l", {0, 0, 0});
                else if (算法 == 12) targetAimPos = Target->GetBonePos("thigh_r", {0, 0, 0});
                else if (算法 == 13) targetAimPos = Target->GetBonePos("calf_r", {0, 0, 0});
                else if (算法 == 14) targetAimPos = Target->GetBonePos("foot_r", {0, 0, 0});
                else if (算法 == 15) targetAimPos = Target->GetBonePos("thigh_l", {0, 0, 0});
                else if (算法 == 16) targetAimPos = Target->GetBonePos("calf_l", {0, 0, 0});
                else if (算法 == 17) targetAimPos = Target->GetBonePos("foot_l", {0, 0, 0});
                break;
            }
            case JsonPreferences::EAimTarget::Chest: {
                if (算法 == 0) targetAimPos = Target->GetBonePos("spine_02", {0, 0, 0});
                else if (算法 == 1) targetAimPos = Target->GetBonePos("neck_01", {0, 0, 0});
                else if (算法 == 2) targetAimPos = Target->GetBonePos("Head", {0, 0, 0});
                else if (算法 == 3) targetAimPos = Target->GetBonePos("pelvis", {0, 0, 0});
                else if (算法 == 4) targetAimPos = Target->GetBonePos("clavicle_r", {0, 0, 0});
                else if (算法 == 5) targetAimPos = Target->GetBonePos("upperarm_r", {0, 0, 0});
                else if (算法 == 6) targetAimPos = Target->GetBonePos("lowerarm_r", {0, 0, 0});
                else if (算法 == 7) targetAimPos = Target->GetBonePos("hand_r", {0, 0, 0});
                else if (算法 == 8) targetAimPos = Target->GetBonePos("clavicle_l", {0, 0, 0});
                else if (算法 == 9) targetAimPos = Target->GetBonePos("upperarm_l", {0, 0, 0});
                else if (算法 == 10) targetAimPos = Target->GetBonePos("lowerarm_l", {0, 0, 0});
                else if (算法 == 11) targetAimPos = Target->GetBonePos("hand_l", {0, 0, 0});
                else if (算法 == 12) targetAimPos = Target->GetBonePos("thigh_r", {0, 0, 0});
                else if (算法 == 13) targetAimPos = Target->GetBonePos("calf_r", {0, 0, 0});
                else if (算法 == 14) targetAimPos = Target->GetBonePos("foot_r", {0, 0, 0});
                else if (算法 == 15) targetAimPos = Target->GetBonePos("thigh_l", {0, 0, 0});
                else if (算法 == 16) targetAimPos = Target->GetBonePos("calf_l", {0, 0, 0});
                else if (算法 == 17) targetAimPos = Target->GetBonePos("foot_l", {0, 0, 0});
                
                if (喵身体) targetAimPos.Z -= 25.0; 
                break;
            }
            case JsonPreferences::EAimTarget::随机部位: {
                bool selected = false; 
                int random = rand() % 100; 
                if (random < 30) {
                    if (is头) { targetAimPos = Target->GetBonePos("Head", {}); selected = true; }
                    else if (is脖子) { targetAimPos = Target->GetBonePos("neck_01", {}); selected = true; }
                } else if (random < 90) {
                    if (is脊骨2) { targetAimPos = Target->GetBonePos("spine_02", {}); selected = true; }
                    else if (is盆骨) { targetAimPos = Target->GetBonePos("pelvis", {}); selected = true; }
                    else if (is右锁骨) { targetAimPos = Target->GetBonePos("clavicle_r", {}); selected = true; }
                    else if (is左锁骨) { targetAimPos = Target->GetBonePos("clavicle_l", {}); selected = true; }
                    else if (is右上臂) { targetAimPos = Target->GetBonePos("upperarm_r", {}); selected = true; }
                    else if (is左上臂) { targetAimPos = Target->GetBonePos("upperarm_l", {}); selected = true; }
                    else if (is右小臂) { targetAimPos = Target->GetBonePos("lowerarm_r", {}); selected = true; }
                    else if (is左小臂) { targetAimPos = Target->GetBonePos("lowerarm_l", {}); selected = true; }
                    else if (is右手) { targetAimPos = Target->GetBonePos("hand_r", {}); selected = true; }
                    else if (is左手) { targetAimPos = Target->GetBonePos("hand_l", {}); selected = true; }
                } else {
                    if (is右大腿) { targetAimPos = Target->GetBonePos("thigh_r", {}); selected = true; }
                    else if (is左大腿) { targetAimPos = Target->GetBonePos("thigh_l", {}); selected = true; }
                    else if (is右小腿) { targetAimPos = Target->GetBonePos("calf_r", {}); selected = true; }
                    else if (is左小腿) { targetAimPos = Target->GetBonePos("calf_l", {}); selected = true; }
                    else if (is右脚) { targetAimPos = Target->GetBonePos("foot_r", {}); selected = true; }
                    else if (is左脚) { targetAimPos = Target->GetBonePos("foot_l", {}); selected = true; }
                }
                break;
            }            
            default:
                targetAimPos = Target->GetBonePos("Head", {});
                break;
        }

        auto WeaponManagerComponent = localPlayer->WeaponManagerComponent;
        if (WeaponManagerComponent) {
            auto CurrentWeaponReplicated = (ASTExtraShootWeapon*)WeaponManagerComponent->CurrentWeaponReplicated;
            if (CurrentWeaponReplicated) {
                auto ShootWeaponComponent = CurrentWeaponReplicated->ShootWeaponComponent;
                if (ShootWeaponComponent) {
                    UShootWeaponEntity* ShootWeaponEntityComponent = ShootWeaponComponent->ShootWeaponEntityComponent;
                    if (ShootWeaponEntityComponent) {
                        FVector targetVelocity;
                        if (Target->CurrentVehicle) {
                            targetVelocity = Target->CurrentVehicle->ReplicatedMovement.LinearVelocity;
                        } else {
                            targetVelocity = Target->GetVelocity();
                        }
                        float dist = localPlayer->GetDistanceTo(Target);
                        float travelTime = dist / ShootWeaponEntityComponent->BulletFireSpeed;
                        targetAimPos += targetVelocity * travelTime;
                    }
                }
            }
        }

        const float circleRadius = 10.0f;
        const float innerRadius = circleRadius * 0.5f;
        const int segments = 24;
        const float lineThickness = 2.0f;
        bool isFiring = g_LocalPlayer->bIsWeaponFiring;
        const FLinearColor circleColor = isFiring ? 
            FLinearColor(1.0f, 0.0f, 0.0f, 1.0f) :  // 射击中（红色）
            FLinearColor(0.0f, 1.0f, 0.0f, 0.5f);  // 瞄准中（半透明绿色）

        FVector2D screenAimPos;
        if (g_PlayerController->ProjectWorldLocationToScreen(targetAimPos, false, &screenAimPos)) {
            // 确保圈圈在屏幕范围内
            if (screenAimPos.X >= 0 && screenAimPos.X <= screenWidth && 
                screenAimPos.Y >= 0 && screenAimPos.Y <= screenHeight) {

                // 绘制外圆
                FVector2D prevPoint;
                for (int i = 0; i <= segments; i++) {
                    float angle = (i * 360.0f / segments) * PI / 180.0f;
                    FVector2D currentPoint(
                        screenAimPos.X + circleRadius * cos(angle),
                        screenAimPos.Y + circleRadius * sin(angle)
                    );
                    if (i > 0) {
                        HUD->Canvas->K2_DrawLine(prevPoint, currentPoint, lineThickness, circleColor);
                    }
                    prevPoint = currentPoint;
                }

                // 绘制内圆
                for (int i = 0; i <= segments; i++) {
                    float angle = (i * 360.0f / segments) * PI / 180.0f;
                    FVector2D currentPoint(
                        screenAimPos.X + innerRadius * cos(angle),
                        screenAimPos.Y + innerRadius * sin(angle)
                    );
                    if (i > 0) {
                        HUD->Canvas->K2_DrawLine(prevPoint, currentPoint, lineThickness, circleColor);
                    }
                    prevPoint = currentPoint;
                }
            }
        }
    }
}else{

}}
if (preferences.Config.SilentAim.Enable || preferences.Config.SilentAim.AimBot) {
    if(!g_LocalPlayer->IsUsingGrenade()){
    // 状态变量
    static float rotation = 0.0f;
    static float breath_scale = 1.0f;
    static float pulse_intensity = 0.0f;
    static float anim_timer = 0.0f;
    static bool was_firing = false;

    // 增强可见度的参数风格参数
    const int min_dot_count = 8;         // 增加点数量提升辨识度
    const int max_dot_count = 12;
    const float dot_density = 20.0f;     // 提高密度=更多点
    const float base_dot_size = 3.2f;    // 点径加大15%
    const float line_thickness = 2.0f;   // 线条加粗25%
    const float orbit_radius_base = preferences.Config.SilentAim.Cross;
    const float opacity = 1.0f;          // 完全不透明提升可见度

    // 计算点数量
    const float circumference = 2 * 3.1415926f * orbit_radius_base;
    int dot_count = (int)(circumference / dot_density);
    if (dot_count < min_dot_count) dot_count = min_dot_count;
    if (dot_count > max_dot_count) dot_count = max_dot_count;

    // 动画计时器
    anim_timer += 0.016f;
    if (anim_timer > 1000.0f) anim_timer = 0.0f;

    // 更明显的呼吸动画（幅度提高但保持流畅）
    breath_scale = 1.0f + 0.08f * sinf(anim_timer * 0.785f); // 缩放1.0-1.08

    // 增强开火反馈
    bool is_firing = g_LocalPlayer->bIsWeaponFiring;
    if (is_firing) {
        pulse_intensity += 0.3f;
        if (pulse_intensity > 1.0f) pulse_intensity = 1.0f;
    } else {
        pulse_intensity -= 0.15f;
        if (pulse_intensity < 0.0f) pulse_intensity = 0.0f;
    }

    // 稍快的旋转速度提升存在感
    float rot_speed = is_firing ? 4.0f : 1.2f;
    rotation += rot_speed;
    if (rotation >= 360.0f) rotation -= 360.0f;

    // 高可见度配色（提高饱和度但保持苹果风优雅）
    const float colors[6][3] = {
        {0.35f, 0.70f, 1.0f},   // 亮蓝色（更鲜明）
        {0.50f, 0.90f, 0.40f},  // 亮绿色
        {1.0f, 0.55f, 0.60f},   // 亮粉色
        {1.0f, 0.80f, 0.40f},   // 亮金色
        {0.85f, 0.65f, 1.0f},   // 亮紫色
        {0.40f, 0.90f, 0.90f}   // 亮青色
    };

    // 准星中心
    const int center_x = ScreenWidth / 2;
    const int center_y = ScreenHeight / 2;

    // 应用动画效果
    const float orbit_radius = orbit_radius_base * breath_scale * (1.0f + 0.05f * pulse_intensity);
    const float dot_size = base_dot_size * breath_scale * (1.0f + 0.2f * pulse_intensity);

    // 绘制旋转点（增强波动幅度）
    for (int i = 0; i < dot_count; i++) {
        float angle = (i * 360.0f / dot_count) + rotation;
        float rad = angle * 3.1415926f / 180.0f;

        // 更明显的波动效果
        float wave_offset = 0.5f * sinf(anim_timer * 2.0f + i * 0.8f);
        int x = center_x + (int)(orbit_radius * cosf(rad) + wave_offset);
        int y = center_y + (int)(orbit_radius * sinf(rad) + wave_offset);

        // 颜色处理（开火时更亮）
        int color_idx = i % 6;
        float pulse_boost = 0.2f * pulse_intensity; // 开火时提高亮度
        float r = colors[color_idx][0] + pulse_boost;
        float g = colors[color_idx][1] + pulse_boost;
        float b = colors[color_idx][2] + pulse_boost;
        // 限制颜色最大值
        if (r > 1.0f) r = 1.0f;
        if (g > 1.0f) g = 1.0f;
        if (b > 1.0f) b = 1.0f;
        FLinearColor color(r, g, b, opacity);

        // 绘制十字点
        HUD->DrawLine(
            x - dot_size, y,
            x + dot_size, y,
            color,
            line_thickness
        );
        HUD->DrawLine(
            x, y - dot_size,
            x, y + dot_size,
            color,
            line_thickness
        );
    }

    // 增强中心白点（更大更明显）
    float center_dot_size = 1.5f + 0.5f * pulse_intensity;
    // 中心白点外增加一圈细环提升辨识度
    if (pulse_intensity > 0.3f) {
        float ring_size = center_dot_size + 2.0f;
        HUD->DrawLine(
            center_x - ring_size, center_y,
            center_x + ring_size, center_y,
            FLinearColor(1.0f, 1.0f, 1.0f, 0.7f),
            line_thickness * 0.8f
        );
        HUD->DrawLine(
            center_x, center_y - ring_size,
            center_x, center_y + ring_size,
            FLinearColor(1.0f, 1.0f, 1.0f, 0.7f),
            line_thickness * 0.8f
        );
    }
    // 中心主白点
    HUD->DrawLine(
        center_x - center_dot_size, center_y,
        center_x + center_dot_size, center_y,
        FLinearColor(1.0f, 1.0f, 1.0f, opacity),
        line_thickness
    );
    HUD->DrawLine(
        center_x, center_y - center_dot_size,
        center_x, center_y + center_dot_size,
        FLinearColor(1.0f, 1.0f, 1.0f, opacity),
        line_thickness
    );

    was_firing = is_firing;
}else{

}}
if(feiche){
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
                                                        if(十字架){
                                                                // 状态变量
    static float color_timer = 0.0f;
    static float pulse_intensity = 0.0f;
    
    // 更新颜色计时器，实现渐变效果
    color_timer += 0.015f;
    if (color_timer >= FLT_MAX) {
        color_timer = 0.0f;
    }

    // 呼吸效果
    pulse_intensity = 0.1f * sinf(color_timer * 1.5f) + 0.9f;

    // 准星中心
    const int center_x = ScreenWidth / 2;
    const int center_y = ScreenHeight / 2;

    // 更长的十字架长度（比原版增加约50%）
    const float cross_length = 25.0f + 3.0f * pulse_intensity;
    const float cross_thickness = 2.2f;

    // 计算渐变色（使用HSV转RGB实现柔和的浅色过渡）
    // 色调从0到360度循环，保持高亮度和中等饱和度
    float hue = fmodf(color_timer * 15.0f, 360.0f) / 360.0f;
    float saturation = 0.6f;
    float value = 0.9f + 0.1f * pulse_intensity; // 保持浅色基调
    
    // HSV到RGB转换
    float r, g, b;
    int i = floor(hue * 6);
    float f = hue * 6 - i;
    float p = value * (1 - saturation);
    float q = value * (1 - f * saturation);
    float t = value * (1 - (1 - f) * saturation);
    
    switch(i % 6){
        case 0: r = value, g = t, b = p; break;
        case 1: r = q, g = value, b = p; break;
        case 2: r = p, g = value, b = t; break;
        case 3: r = p, g = q, b = value; break;
        case 4: r = t, g = p, b = value; break;
        case 5: r = value, g = p, b = q; break;
    }

    // 应用透明度（始终保持高可见度）
    FLinearColor cross_color(r, g, b, 0.95f);
    
    // 绘制水平横线（更长）
    HUD->DrawLine(
        center_x - cross_length, center_y,
        center_x + cross_length, center_y,
        cross_color,
        cross_thickness
    );
    
    // 绘制垂直竖线（更长）
    HUD->DrawLine(
        center_x, center_y - cross_length,
        center_x, center_y + cross_length,
        cross_color,
        cross_thickness
    );

    // 绘制中心圆点（增强视觉焦点）
    const float center_radius = 3.5f;
    // 外圆环
    HUD->DrawLine(
        center_x - center_radius, center_y,
        center_x + center_radius, center_y,
        FLinearColor(1.0f, 1.0f, 1.0f, 0.9f),
        cross_thickness * 1.2f
    );
    HUD->DrawLine(
        center_x, center_y - center_radius,
        center_x, center_y + center_radius,
        FLinearColor(1.0f, 1.0f, 1.0f, 0.9f),
        cross_thickness * 1.2f
    );
    // 中心小点
    const float inner_radius = 1.5f;
    HUD->DrawLine(
        center_x - inner_radius, center_y,
        center_x + inner_radius, center_y,
        cross_color,
        cross_thickness * 1.5f
    );
    HUD->DrawLine(
        center_x, center_y - inner_radius,
        center_x, center_y + inner_radius,
        cross_color,
        cross_thickness * 1.5f
    );
                                                        }
    if(追踪修复){
ShootWeaponEntityComp->BulletFireSpeed = 100000.f;
    }
                                                        if(judian){
   // 执行聚点代码
    if (ShootWeaponEntityComp) {
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

    // 状态变量
    static float color_timer = 0.0f;
    static float pulse_intensity = 0.0f;
    
    // 更新颜色计时器，实现渐变效果
    color_timer += 0.015f;
    if (color_timer >= FLT_MAX) {
        color_timer = 0.0f;
    }

    // 呼吸效果
    pulse_intensity = 0.1f * sinf(color_timer * 1.5f) + 0.9f;

    // 准星中心
    const int center_x = ScreenWidth / 2;
    const int center_y = ScreenHeight / 2;

    // 更长的十字架长度（比原版增加约50%）
    const float cross_length = 25.0f + 3.0f * pulse_intensity;
    const float cross_thickness = 2.2f;

    // 计算渐变色（使用HSV转RGB实现柔和的浅色过渡）
    // 色调从0到360度循环，保持高亮度和中等饱和度
    float hue = fmodf(color_timer * 15.0f, 360.0f) / 360.0f;
    float saturation = 0.6f;
    float value = 0.9f + 0.1f * pulse_intensity; // 保持浅色基调
    
    // HSV到RGB转换
    float r, g, b;
    int i = floor(hue * 6);
    float f = hue * 6 - i;
    float p = value * (1 - saturation);
    float q = value * (1 - f * saturation);
    float t = value * (1 - (1 - f) * saturation);
    
    switch(i % 6){
        case 0: r = value, g = t, b = p; break;
        case 1: r = q, g = value, b = p; break;
        case 2: r = p, g = value, b = t; break;
        case 3: r = p, g = q, b = value; break;
        case 4: r = t, g = p, b = value; break;
        case 5: r = value, g = p, b = q; break;
    }

    // 应用透明度（始终保持高可见度）
    FLinearColor cross_color(r, g, b, 0.95f);
    
    // 绘制水平横线（更长）
    HUD->DrawLine(
        center_x - cross_length, center_y,
        center_x + cross_length, center_y,
        cross_color,
        cross_thickness
    );
    
    // 绘制垂直竖线（更长）
    HUD->DrawLine(
        center_x, center_y - cross_length,
        center_x, center_y + cross_length,
        cross_color,
        cross_thickness
    );

    // 绘制中心圆点（增强视觉焦点）
    const float center_radius = 3.5f;
    // 外圆环
    HUD->DrawLine(
        center_x - center_radius, center_y,
        center_x + center_radius, center_y,
        FLinearColor(1.0f, 1.0f, 1.0f, 0.9f),
        cross_thickness * 1.2f
    );
    HUD->DrawLine(
        center_x, center_y - center_radius,
        center_x, center_y + center_radius,
        FLinearColor(1.0f, 1.0f, 1.0f, 0.9f),
        cross_thickness * 1.2f
    );
    // 中心小点
    const float inner_radius = 1.5f;
    HUD->DrawLine(
        center_x - inner_radius, center_y,
        center_x + inner_radius, center_y,
        cross_color,
        cross_thickness * 1.5f
    );
    HUD->DrawLine(
        center_x, center_y - inner_radius,
        center_x, center_y + inner_radius,
        cross_color,
        cross_thickness * 1.5f
    );
                                                        }
if(preferences.Config.SilentAim.HitX){
                                                            ShootWeaponEntityComp->ExtraHitPerformScale = 100;
                                                            ShootWeaponEntityComp->HUDAlphaDecreaseSpeedScale = 1.0f;
                                                        }
                                                        if(wuhou){
                                                            
                                                                ShootWeaponEntityComp->AccessoriesVRecoilFactor = 0.0f;
                                                                ShootWeaponEntityComp->AccessoriesHRecoilFactor = 0.0f;
                                                                ShootWeaponEntityComp->AccessoriesRecoveryFactor = 0.0f;
                                                            
                                                        }
                                                        if(preferences.Config.SilentAim.FastShoot){
auto objs = UObject::GetGlobalObjects();//射速加快
for (int i = 0; i < objs.Num(); i++) {
auto Object = objs.GetByIndex(i);
if (isObjectInvalid(Object))
continue;
if (Object->IsA(UShootWeaponEntity::StaticClass())) {
auto playerChar = (UShootWeaponEntity *) Object;
playerChar->BurstShootBulletsNum = 30;
}}
                                                        }
                                                        if (加速) {
g_LocalPlayer->STPlayerController->AcknowledgedPawn->CustomTimeDilation = SpeedFOV;
	// 绕过移动检测
	    UMoveAntiCheatComponent *bUseMoveAntiCheatCheck = nullptr;
	    UMoveAntiCheatComponent *TolerateDistanceFractor = nullptr;
	    UMoveAntiCheatComponent *MaxPacketLossRate = nullptr;
	    // 禁用移动检测
	    bUseMoveAntiCheatCheck = 0;
	    TolerateDistanceFractor = 0;
	    MaxPacketLossRate = 0;
}
if (范围){
uintptr_t Mesh = *(uintptr_t *)((uintptr_t)localPlayer + 0x498);
if (Mesh != 0)
{
    uintptr_t Skeletal = *(uintptr_t *)(Mesh + 0x868);
    if (Skeletal != 0)
    {
        uintptr_t Asset = *(uintptr_t *)(Skeletal + 0x138);
        if (Asset != 0)
        {
            uintptr_t ArraySkeletal = *(uintptr_t *)(Asset + 0x38);
            if (ArraySkeletal != 0)
            {
                uintptr_t SkeletalBodySetup = *(uintptr_t *)(ArraySkeletal + sizeof(uintptr_t) * 14);

                if (SkeletalBodySetup != 0)
                {
                    uintptr_t BoxElems = *(uintptr_t *)(SkeletalBodySetup + 0x38);
                    if (BoxElems != 0)
                    {
                      *(float *)(BoxElems + 0x88) = FanweiFOV;
                        *(float *)(BoxElems + 0x8c) = FanweiFOV;
                        *(float *)(BoxElems + 0x90) = FanweiFOVT;
                    }
                    }
                    }
                    }
                    }
                    }
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
}}}}}}
if(xiayu){
                                                            g_LocalPlayer->STPlayerController->SetIsRainy(true);
                                                        }else{
g_LocalPlayer->STPlayerController->SetIsRainy(false);
}
if(xiaxue){
                                                           
g_LocalPlayer->STPlayerController->SetIsSnowy(true);
                                                        }else{
g_LocalPlayer->STPlayerController->SetIsSnowy(false);
}
if(jinfang){
  ShootWeaponEffectComp->CameraShakeInnerRadius = 0.0f;
                                                            ShootWeaponEffectComp->CameraShakeOuterRadius = 0.0f;
                                                            ShootWeaponEffectComp->CameraShakFalloff = 0.0f;                                                         

                                                        }
if(蹲下飞天){
	
	
	
	
	localPlayer->CharacterMovement->MaxAcceleration = 810000.f;
	
	FVector CurrentLocation = g_LocalPlayer->STPlayerController->AcknowledgedPawn->K2_GetActorLocation();
	
	       float 自身速度 = localPlayer->CharacterMovement->MaxWalkSpeed;
	                            float 自身速度1 = localPlayer->EnergySpeedScale;
	                            int 速度商 = 自身速度/自身速度1;
	                        
	                        if (速度商 == 344|| 速度商 == 353 || 速度商 == 365||速度商 == 366 || 速度商 == 352) {
	            CurrentLocation.Z += 50; // Z轴上升30单位
	       }
	        // 设置新的位置
	        bool bSweep = false;
	        bool bTeleport = false;
	        FHitResult SweepHitResult;
	        g_LocalPlayer->STPlayerController->AcknowledgedPawn->K2_SetActorLocation(CurrentLocation, bSweep, bTeleport, &SweepHitResult);

}
if (chongchongche) {
                                    USceneComponent* MeshContainer = localPlayer->MeshContainer;
                                    MeshContainer->RelativeRotation = { 0,chongchongche1 ,0 };
                                    chongchongche1 += chongchongche2;
                                    if (chongchongche1 >= tocdoquay)
                                        chongchongche1 = 0.0f;
                                    chongchongche1 += 20;
                                }
if (好玩飞天) {
        USceneComponent *MeshContainer = localPlayer->MeshContainer;
if (MeshContainer) {
    if (localPlayer->IsClientPeeking) {
        if (!localPlayer->IsPeekLeft) {
            // 右探头逻辑
            FVector CurrentLocation = g_LocalPlayer->STPlayerController->AcknowledgedPawn->K2_GetActorLocation();

            // 判断是否处于探头状态
            if (localPlayer->IsClientPeeking) {
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
                CurrentLocation += CameraUp * 50;
                // 向下调整
                CurrentLocation -= CameraUp * 50;
                // 向前调整
                CurrentLocation += CameraForward * 50;
                
                // 设置新的位置
                bool bSweep = false;
                bool bTeleport = false;
                FHitResult SweepHitResult;
                g_LocalPlayer->STPlayerController->AcknowledgedPawn->K2_SetActorLocation(CurrentLocation, bSweep, bTeleport, &SweepHitResult);
            }
        } 
}
}
}
   if(冻结大厅){
localPlayer->CharacterMovement->MovementMode = EMovementMode::MOVE_None;
}
 if (人物变大) {
USceneComponent* MeshContainer = localPlayer->MeshContainer;
MeshContainer->SetWorldScale3D({巨人, 巨人, 巨人});
}
if (SDK过检) {
        auto Actors = getActors();
        for (int i = 0; i < Actors.size(); i++) {
            auto Actor = Actors[i];
            //if (isObjectInvalid(Actor))
                //continue;

            if (Actor->IsA(ASTExtraPlayerController::StaticClass())) {
                auto SDK_ASTExtraPlayerCharacter = (ASTExtraPlayerController *) Actor;
                
                
                SDK_ASTExtraPlayerCharacter->bShouldReportAntiCheat = 0;
                SDK_ASTExtraPlayerCharacter->bUseAntiDataReportFilter = 0;
                SDK_ASTExtraPlayerCharacter->bUseAntiDataReportFilterNew = 0;
                SDK_ASTExtraPlayerCharacter->bUseAntiDataReportFilterCheck = 0;
                SDK_ASTExtraPlayerCharacter->LastReportAntiDataTime = 0;
                SDK_ASTExtraPlayerCharacter->bEnableDSErrorLogReport = 0;
}}
}
if(yinjiao){
AudioServicesPlaySystemSound(15);
localPlayer->STPlayerController->ClientOnHurt();
}
}
                                            }
                                        }
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
                                            auto DeadBoxAvatarCompPtr = (uintptr_t*)((uintptr_t)TombBoxx + 0x628); //DeadBoxAvatarComponent_BP_C* DeadBoxAvatarComponent_BP
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
       } else if (Weaponid == 101001) {
       ChangeItemAVc(DeadBoxAvatarComp, new_Skin.AKM);
       AlreadyChangedSet.insert(PlayerKey);
       } else if (Weaponid == 101003) {
       ChangeItemAVc(DeadBoxAvatarComp, new_Skin.Scar);
       AlreadyChangedSet.insert(PlayerKey);
       } else if (Weaponid == 101008) {
       ChangeItemAVc(DeadBoxAvatarComp, new_Skin.M762);
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
				if (preferences.KAR98 && weapowep == 103001){
				 for (int i = 0; i < sizeof(kar) / sizeof(kar[0]); i++) {
                 if (weaponid == kar[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.K98;
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
				if (preferences.AWM && weapowep == 103003){
				 for (int i = 0; i < sizeof(awm) / sizeof(awm[0]); i++) {
                 if (weaponid == awm[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.AWM;
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
                if (preferences.MK145 && weapowep == 1030075){
                 for (int i = 0; i < sizeof(mk145) / sizeof(mk145[0]); i++) {
                 if (weaponid == mk145[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.MK145;
                     break;
                 }
                }
                for (int i = 0; i < sizeof(longyin8) / sizeof(longyin8[0]); i++) {
                 if (weaponid == longyin8[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.longyin_x88;
                     break;
                 }
                }
                for (int i = 0; i < sizeof(longyin1) / sizeof(longyin1[0]); i++) {
                 if (weaponid == longyin1[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.longyin_x11;
                     break;
                 }
                }
                for (int i = 0; i < sizeof(longyin2) / sizeof(longyin2[0]); i++) {
                 if (weaponid == longyin2[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.longyin_x22;
                     break;
                 }
                }
                for (int i = 0; i < sizeof(longyin3) / sizeof(longyin3[0]); i++) {
                 if (weaponid == longyin3[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.longyin_x33;
                     break;
                 }
                }
                for (int i = 0; i < sizeof(longyin4) / sizeof(longyin4[0]); i++) {
                 if (weaponid == longyin4[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.longyin_x44;
                     break;
                 }
                }
                for (int i = 0; i < sizeof(longyin6) / sizeof(longyin6[0]); i++) {
                 if (weaponid == longyin6[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.longyin_x66;
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
                }
                if (preferences.MK146 && weapowep == 1030074){
                 for (int i = 0; i < sizeof(mk146) / sizeof(mk146[0]); i++) {
                 if (weaponid == mk146[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.MK146;
                     break;
                 }
                }
                for (int i = 0; i < sizeof(longyin88) / sizeof(longyin88[0]); i++) {
                 if (weaponid == longyin88[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.longyin_x888;
                     break;
                 }
                }
                for (int i = 0; i < sizeof(longyin11) / sizeof(longyin11[0]); i++) {
                 if (weaponid == longyin11[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.longyin_x111;
                     break;
                 }
                }
                for (int i = 0; i < sizeof(longyin22) / sizeof(longyin22[0]); i++) {
                 if (weaponid == longyin22[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.longyin_x222;
                     break;
                 }
                }
                for (int i = 0; i < sizeof(longyin33) / sizeof(longyin33[0]); i++) {
                 if (weaponid == longyin33[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.longyin_x333;
                     break;
                 }
                }
                for (int i = 0; i < sizeof(longyin44) / sizeof(longyin44[0]); i++) {
                 if (weaponid == longyin44[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.longyin_x444;
                     break;
                 }
                }
                for (int i = 0; i < sizeof(longyin66) / sizeof(longyin66[0]); i++) {
                 if (weaponid == longyin66[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.longyin_x666;
                     break;
                  }
                 }
                }
                if (preferences.M4145 && weapowep == 1010045){
                 for (int i = 0; i < sizeof(m4145) / sizeof(m4145[0]); i++) {
                 if (weaponid == m4145[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M4145;
                     break;
                 }
                }
                for (int i = 0; i < sizeof(hondian) / sizeof(hondian[0]); i++) {
                 if (weaponid == hondian[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_hondian;
                     break;
                 }
                }
                for (int i = 0; i < sizeof(chuizhi) / sizeof(chuizhi[0]); i++) {
                 if (weaponid == chuizhi[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_chuizhi;
                     break;
                 }
                }
                for (int i = 0; i < sizeof(qiangtuo) / sizeof(qiangtuo[0]); i++) {
                 if (weaponid == qiangtuo[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_qiangtuo;
                     break;
                 }
                }
                for (int i = 0; i < sizeof(buchang) / sizeof(buchang[0]); i++) {
                 if (weaponid == buchang[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_buchang;
                     break;
                 }
                }
                for (int i = 0; i < sizeof(kuorong) / sizeof(kuorong[0]); i++) {
                 if (weaponid == kuorong[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_kuorong;
                     break;
                 }
                }
                for (int i = 0; i < sizeof(beijing2) / sizeof(beijing2[0]); i++) {
                 if (weaponid == beijing2[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_x22;
                     break;
                 }
                }
                for (int i = 0; i < sizeof(beijing3) / sizeof(beijing3[0]); i++) {
                 if (weaponid == beijing3[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_x33;
                     break;
                 }
                }
                for (int i = 0; i < sizeof(beijing4) / sizeof(beijing4[0]); i++) {
                 if (weaponid == beijing4[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_x44;
                     break;
                 }
                }
                for (int i = 0; i < sizeof(beijing6) / sizeof(beijing6[0]); i++) {
                 if (weaponid == beijing6[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_x66;
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
                if (preferences.P90 && weapowep == 102105){
                 for (int i = 0; i < sizeof(p90) / sizeof(p90[0]); i++) {
                 if (weaponid == p90[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.P90;
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
				if (preferences.UZI && weapowep == 102001){
				 for (int i = 0; i < sizeof(uzi) / sizeof(uzi[0]); i++) {
                 if (weaponid == uzi[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.UZI;
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
				if (preferences.GROZA && weapowep == 101005){
				 for (int i = 0; i < sizeof(groza) / sizeof(groza[0]); i++) {
                 if (weaponid == groza[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.Groza;
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
				if (preferences.M249 && weapowep == 105001){
				 for (int i = 0; i < sizeof(m249) / sizeof(m249[0]); i++) {
                 if (weaponid == m249[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M249;
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
      }
   }

 
   if (localPlayer -> AvatarComponent2) {

                                   auto AvatarComp = localPlayer -> AvatarComponent2;
                                   
                                   FNetAvatarSyncData NetAvatarComp = * (FNetAvatarSyncData * )((uintptr_t) AvatarComp + 0x388); //if u use 64bit change this offset
                                   auto Slotsybc = NetAvatarComp.SlotSyncData;
		if (preferences.Parachute){
        Slotsybc[11].ItemId = new_Skin.Parachute;
		}
		if (preferences.Outfit){
		Slotsybc[5].ItemId = new_Skin.XSuits;
		}
		if (preferences.Bagg){
		Slotsybc[8].ItemId = bag3;
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
if(Config.ESPMenu.Alert)
{
    bool Useless = false;
                                    FVector2D EntityPos = WorldToRadar(localPlayer->K2_GetActorRotation().Yaw, Head, localPlayer->GetHeadLocation(false), NULL, NULL, FVector((float)screenWidth, (float)screenHeight, 0.f), Useless);
                                    float radar_range = 150.f;
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
                                    FVector2D BelowRoowwtSc;
                                    if (gGameplayStatics->ProjectWorldToScreen(localPlayerController, Head, false, &BelowRoowwtSc)) {
                                    }else{
                                        RotateTriangle(points, angle.Y + 180.0f);
                                        float Thickness = 3.f;
                                        
//箭头预警

bool IsVisible = localPlayerController->LineOfSightTo(
                                                Player,
                                                {0, 0, 0},
                                                false);

if(Player->bEnsure){
                                             DrawArrows(HUD,points, Thickness, COLOR_WHITE); //No arrows if it Bots
                                        } else{
                                            
if(IsVisible){

DrawArrows(HUD,points, Thickness, COLOR_GREEN);   } else {

 DrawArrows(HUD,points, Thickness, COLOR_RED);   }                                       

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
    FLinearColor lineColor;
    if (Player->bEnsure) {
        lineColor = {1.0f, 1.0f, 1.0f, 1.0f};
    } else {
        int colorIndex = rand() % 16;
        switch (colorIndex) {
case 0: lineColor = {0.45f, 0.75f, 0.88f, 1.0f}; break;   
case 1: lineColor = {0.95f, 0.65f, 0.70f, 1.0f}; break;   
case 2: lineColor = {0.60f, 0.80f, 0.38f, 1.0f}; break;  
case 3: lineColor = {0.95f, 0.70f, 0.45f, 1.0f}; break;   
case 4: lineColor = {0.75f, 0.65f, 0.90f, 1.0f}; break;  
case 5: lineColor = {0.70f, 0.82f, 0.92f, 1.0f}; break;   
case 6: lineColor = {0.85f, 0.85f, 0.95f, 1.0f}; break;   
case 7: lineColor = {0.65f, 0.88f, 0.88f, 1.0f}; break;   
case 8: lineColor = {0.95f, 0.70f, 0.60f, 1.0f}; break;   
case 9: lineColor = {0.55f, 0.87f, 0.75f, 1.0f}; break;  
case 10: lineColor = {0.92f, 0.80f, 0.50f, 1.0f}; break; 
case 11: lineColor = {0.87f, 0.65f, 0.75f, 1.0f}; break;  
case 12: lineColor = {0.80f, 0.70f, 0.95f, 1.0f}; break; 
case 13: lineColor = {0.70f, 0.95f, 0.70f, 1.0f}; break; 
case 14: lineColor = {0.95f, 0.70f, 0.80f, 1.0f}; break; 
case 15: lineColor = {0.70f, 0.80f, 0.95f, 1.0f}; break;
        }
    }
    DrawLine(HUD, {(float)ScreenWidth / 2, 20}, {HeadSc.X, HeadSc.Y - 60}, 0.7f, lineColor);
                                        }
if (Config.ESPMenu.Skeleton) {
    FVector Chest = Player->RootComponent->RelativeLocation;
    
    auto Root = Player->GetBonePos("Root", {});
    auto Head = Player->GetBonePos("Head", {});
    FVector2D RootSc, HeadSc;

    // 坐标转屏幕
    FVector2D PlyaerScreen; // 屏幕的坐标
    FVector2D width; // 人物宽度
    FVector2D height; // 人物高度
    FVector2D PlayerSize; // 屏幕的敌人高度宽度坐标

    // 判断是否在屏幕内 并 将敌人的3D 转 2D屏幕坐标
    if(localPlayerController->ProjectWorldLocationToScreen(Chest, false, &PlyaerScreen) && 
       localPlayerController->ProjectWorldLocationToScreen(Head, false, &HeadSc) && 
       localPlayerController->ProjectWorldLocationToScreen(Root, false, &RootSc) && 
       PlyaerScreen.X - 50 < screenWidth && PlyaerScreen.X + 50 > 0 && PlyaerScreen.Y > 0 && PlyaerScreen.Y < screenHeight) {

        float EspSktonThik = 1.5f; // 骨骼线宽

        // 扩展骨骼列表 - 已移除了手指部分的骨骼点
         FName BoneID[] = {
            "Head", "neck_01", "spine_02", "pelvis",  // 躯干（头部-颈部-脊柱-骨盆）
            "clavicle_r", "upperarm_r", "lowerarm_r", "hand_r",  // 右臂（锁骨-上臂-前臂-手）
            "clavicle_l", "upperarm_l", "lowerarm_l", "hand_l",  // 左臂臂（锁骨-上臂-前臂-手）
            "thigh_r", "calf_r", "foot_r",  // 右腿（大腿-小腿-脚）
            "thigh_l", "calf_l", "foot_l"   // 左腿（大腿-小腿-脚）
        }; 

        const int BoneCount = sizeof(BoneID) / sizeof(BoneID[0]);
        FVector2D Bones[BoneCount]; // 保存骨骼在屏幕上的位置
        bool IsVisBone[BoneCount];  // 保存骨骼可视性状态
        
        // 计算所有骨骼的屏幕位置和可视性
        for (int i = 0; i < BoneCount; i++) {
            FVector BonePos = GetBoneByName(Player, BoneID[i]);
            localPlayerController->ProjectWorldLocationToScreen(BonePos, false, &Bones[i]);
            IsVisBone[i] = localPlayerController->LineOfSightTo(localPlayerController->PlayerCameraManager, BonePos, false);
        }

        // 骨骼连接关系定义 - 移除了手指部分的连接
        struct BoneConnection {
            int From;
            int To;
        };

        // 定义骨骼连接关系 - 移除了手指部分的连接
      BoneConnection Connections[] = {
            // 躯干连接
            {0, 1}, {1, 2}, {2, 3},  // 头部->颈部部->脊柱->骨盆
            
            // 右臂连接
            {2, 4}, {4, 5}, {5, 6}, {6, 7},  // 脊柱->右锁骨->右上臂->右前臂->右手
            
            // 左臂连接
            {2, 8}, {8, 9}, {9, 10}, {10, 11},  // 脊柱->左锁骨->左上臂->左前臂->左手
            
            // 右腿连接
            {3, 12}, {12, 13}, {13, 14},  // 骨盆->右大腿->右小腿->右脚
            
            // 左腿连接
            {3, 15}, {15, 16}, {16, 17}   // 骨盆->左大腿->左小腿->左脚
        };


        const int ConnectionCount = sizeof(Connections) / sizeof(Connections[0]);

        // 定义16种变换颜色数组
        FLinearColor VisibleColors[] = {
          FLinearColor(0.20f, 0.52f, 0.65f, 1.0f),   // 深蓝色
            FLinearColor(0.72f, 0.40f, 0.45f, 1.0f),   // 深红色
            FLinearColor(0.35f, 0.58f, 0.15f, 1.0f),   // 深绿色
            FLinearColor(0.72f, 0.45f, 0.20f, 1.0f),   // 深橙色
            FLinearColor(0.52f, 0.40f, 0.67f, 1.0f),   // 深紫色
            FLinearColor(0.45f, 0.60f, 0.70f, 1.0f),   // 深天蓝
            FLinearColor(0.62f, 0.62f, 0.73f, 1.0f),   // 深薰衣草紫
            FLinearColor(0.40f, 0.65f, 0.65f, 1.0f),   // 深青绿色
            FLinearColor(0.75f, 0.50f, 0.40f, 1.0f),   // 深珊瑚色
            FLinearColor(0.35f, 0.67f, 0.55f, 1.0f),   // 深薄荷色
            FLinearColor(0.72f, 0.60f, 0.30f, 1.0f),   // 深金色
            FLinearColor(0.67f, 0.45f, 0.55f, 1.0f),   // 深玫瑰色
            FLinearColor(0.60f, 0.50f, 0.75f, 1.0f),   // 深丁香紫
            FLinearColor(0.50f, 0.75f, 0.50f, 1.0f),   // 深苹果绿
            FLinearColor(0.75f, 0.50f, 0.60f, 1.0f),   // 深西瓜红
            FLinearColor(0.50f, 0.60f, 0.75f, 1.0f)    // 深蓝色
        };
        const int ColorCount = sizeof(VisibleColors) / sizeof(VisibleColors[0]); // 16种颜色

        // 隐藏时的灰白色
        FLinearColor HiddenColor = FLinearColor(1.0f, 0.0f, 0.0f, 0.8f); // 灰白色

        // 绘制所有骨骼连接
        for (int i = 0; i < ConnectionCount; i++) {
            const auto& Connection = Connections[i];
            int fromIdx = Connection.From;
            int toIdx = Connection.To;
            
            // 确保索引有效
            if (fromIdx < 0 || fromIdx >= BoneCount || toIdx < 0 || toIdx >= BoneCount)
                continue;
                
            // 判断连接是否可见（漏出）
            bool isVisible = IsVisBone[fromIdx] && IsVisBone[toIdx];
            
            // 选择线条颜色：可见时用变换颜色（循环使用16种），隐藏时用灰白色
            FLinearColor lineColor;
            if (isVisible) {
                int colorIndex = i % ColorCount; // 循环使用16种颜色
                lineColor = VisibleColors[colorIndex];
            } else {
                lineColor = HiddenColor;
            }
            
            HUD->Canvas->K2_DrawLine(Bones[fromIdx], Bones[toIdx], EspSktonThik, lineColor);
        }
    }
}
//方框                                        
                                    if (Config.ESPMenu.Box) {

auto BoxBounds = Player->Mesh->CachedLocalBounds;
                                    FVector Chest = Player->K2_GetActorLocation();
                                           DrawBox3D(HUD,Player, visCol, Chest, BoxBounds.BoxExtent);
                                        }
//引擎血条
if (引擎血条) {
    FVector AboveHead = Player->GetHeadLocation(true);
    AboveHead.Z += 35.f;
    FVector2D HeadPosSC;
    if (!UGameplayStatics::ProjectWorldToScreen(g_PlayerController, AboveHead, false, &HeadPosSC)) {
        return; 
    }
    
    // 计算缩放因子 - 使用标准C++函数替代FMath::Clamp
    float ScaleFactor = std::min(std::max(Distance / 35.0f, 1.0f), 1.0f); // 35米以上保持不变
    
    float CurHP = std::max(0.f, std::min(Player->Health, Player->HealthMax));
    float MaxHP = Player->HealthMax;
    float HPPercent = CurHP / MaxHP;
    
    if (Player->Health == 0.0f && !Player->bDead) {
        CurHP = Player->NearDeathBreath;
        if (Player->NearDeatchComponent) {
            MaxHP = Player->NearDeatchComponent->BreathMax;
            static float LastHP = CurHP;
            if (CurHP != LastHP) {
                float AnimationSpeed = 100.0f;
            }
            LastHP = CurHP;
        }
        // 应用缩放因子到血条尺寸
        float BarWidth = (CurHP * 125.f / MaxHP) * ScaleFactor;
        float BarHeight = 4.5f * ScaleFactor;
        float BorderWidth = 125.f * ScaleFactor;
        float BorderHeight = 4.5f * ScaleFactor;
        
        DrawFilledRectangle(HUD, FVector2D{HeadPosSC.X - (62.5f * ScaleFactor), HeadPosSC.Y - (28.f * ScaleFactor)}, 
                           BarWidth, BarHeight, FLinearColor(0.f, 0.5f, 1.f, 1.f));
        DrawRectangle(HUD, FVector2D{HeadPosSC.X - (62.5f * ScaleFactor), HeadPosSC.Y - (28.f * ScaleFactor)}, 
                     BorderWidth, BorderHeight, 1.f * ScaleFactor, FLinearColor(0.f, 0.f, 0.f, 1.f));
    } 
    else {
        // 应用缩放因子到血条尺寸
        float BarWidth = 125.f * HPPercent * ScaleFactor;
        float BarHeight = 16.f * ScaleFactor;
        float BorderWidth = 125.f * ScaleFactor;
        float BorderHeight = 16.f * ScaleFactor;
        float BottomBarWidth = (CurHP * 125.f / MaxHP) * ScaleFactor;
        float BottomBarHeight = 4.5f * ScaleFactor;
        
        if (IsVisible) {
            DrawFilledRectangle(HUD, FVector2D{HeadPosSC.X - (62.5f * ScaleFactor), HeadPosSC.Y - (31.5f * ScaleFactor)}, 
                               BarWidth, BarHeight, FLinearColor(0.f, 1.f, 0.f, 0.5f));
        } else {
            DrawFilledRectangle(HUD, FVector2D{HeadPosSC.X - (62.5f * ScaleFactor), HeadPosSC.Y - (31.5f * ScaleFactor)}, 
                               BarWidth, BarHeight, FLinearColor(1.f, 0.f, 0.f, 0.5f));
        }
        DrawRectangle(HUD, FVector2D{HeadPosSC.X - (62.5f * ScaleFactor), HeadPosSC.Y - (31.5f * ScaleFactor)}, 
                     BorderWidth, BorderHeight, 1.f * ScaleFactor, FLinearColor(0.f, 0.f, 0.f, 1.f));
        DrawFilledRectangle(HUD, FVector2D{HeadPosSC.X - (62.5f * ScaleFactor), HeadPosSC.Y - (14.f * ScaleFactor)}, 
                           BottomBarWidth, BottomBarHeight, FLinearColor(1.f, 1.f, 1.f, 1.f));
        DrawRectangle(HUD, FVector2D{HeadPosSC.X - (62.5f * ScaleFactor), HeadPosSC.Y - (14.f * ScaleFactor)}, 
                     BorderWidth, BottomBarHeight, 1.f * ScaleFactor, FLinearColor(0.f, 0.f, 0.f, 1.f));
    }
    
    bool 姓名 = true;
    if (姓名) {
        FVector BelowRoot = Root;
        BelowRoot.Z -= 35.f;
        FVector2D BelowRootSc;
        if (UGameplayStatics::ProjectWorldToScreen(g_PlayerController, BelowRoot, false, &BelowRootSc)) {
            std::wstring is;
            is += std::to_wstring((int)Player->TeamID) + L" ";
            is += Player->bEnsure ? L"Bot" : Player->PlayerName.ToWString();

            // 应用缩放因子到字体大小 - 使用标准C++函数替代FMath::RoundToInt
            tslFont->LegacyFontSize = static_cast<int>(8 * ScaleFactor + 0.5f);
            DrawOutlinedText(HUD, FString(is), 
                           FVector2D{HeadPosSC.X - (63.f * ScaleFactor), HeadPosSC.Y - (24.5f * ScaleFactor)}, 
                           FLinearColor(1.f, 1.f, 1.f, 1.f), FLinearColor(0.f, 0.f, 0.f, 1.f), false);
        }
    }
    
    bool 距离 = true;
    if (距离) {
        FVector BelowRoot = Root;
        BelowRoot.Z -= 35.f;
        FVector2D BelowRootSc;
        if (UGameplayStatics::ProjectWorldToScreen(g_PlayerController, BelowRoot, false, &BelowRootSc)) {
            // 距离数值正常显示，不受缩放影响
            std::wstring ws = std::to_wstring((int)Distance) + L"m";
            
            // 应用缩放因子到字体大小 - 使用标准C++函数替代FMath::RoundToInt
            tslFont->LegacyFontSize = static_cast<int>(8 * ScaleFactor + 0.5f);
            DrawOutlinedText(HUD, FString(ws), 
                           FVector2D{HeadPosSC.X + (35.f * ScaleFactor), HeadPosSC.Y - (24.5f * ScaleFactor)}, 
                           FLinearColor(1.f, 1.f, 1.f, 1.f), FLinearColor(0.f, 0.f, 0.f, 1.f), false);
        }
    }
}
if (ZERO血条) {
    // 配置参数
    constexpr float BASE_SCALE = 0.6f;           // 基础缩放比例
    constexpr float MAX_DISTANCE = 30.0f;        // 最大尺寸对应的距离（30米）
    constexpr float MIN_SCALE_FACTOR = 0.4f;     // 近距离最小缩放比例
    constexpr float baseWidth = 240.0f;          // 基础宽度
    constexpr float baseHeight = 35.0f;          // 基础高度
    constexpr float baseHexCorner = 12.0f;       // 基础边角大小

    // 根据距离计算缩放因子
    // 距离≤30米：随距离增加从最小比例线性放大到基础比例
    // 距离>30米：保持基础比例（最大尺寸）
    float distanceFactor = std::min(Distance / MAX_DISTANCE, 1.0f);
    float scaleFactor = MIN_SCALE_FACTOR + (BASE_SCALE - MIN_SCALE_FACTOR) * distanceFactor;

    // 计算实际尺寸（基于缩放因子）
    const float mWidth = baseWidth * scaleFactor;
    const float mHeight = baseHeight * scaleFactor;
    const float hexCornerSize = baseHexCorner * scaleFactor;
    const float halfHeight = mHeight * 0.5f;
    const float invHalfHeight = 2.0f / mHeight;
    const float lineWidth = 1.f * scaleFactor;

    // 字体大小设置
    static float originalFontSize = robotoFont->LegacyFontSize;
    robotoFont->LegacyFontSize = 32.f * scaleFactor;

    // 血量计算
    int CurHP = (int)std::max(0, std::min((int)Player->Health, (int)Player->HealthMax));
    int MaxHP = (int)Player->HealthMax;
    float healthPercentage = (float)CurHP / (float)MaxHP;

    // 位置计算（随缩放动态调整）
    Vector2 basePos = {
        HeadSc.X - (baseWidth * 0.5f * scaleFactor),  // 水平居中
        HeadSc.Y - (50.0f * scaleFactor)              // 垂直偏移
    };
    const float midSectionWidth = mWidth - 2 * hexCornerSize;
    float filledWidth = std::min(midSectionWidth, midSectionWidth * healthPercentage);

    // 30种队伍颜色（浅色风格）
    const FLinearColor TeamColors[30] = {
        // 原始16种浅色
        FLinearColor(0.40f, 0.72f, 0.85f, 1.0f), // 浅蓝
        FLinearColor(0.92f, 0.60f, 0.65f, 1.0f), // 浅红
        FLinearColor(0.55f, 0.78f, 0.35f, 1.0f), // 浅绿
        FLinearColor(0.92f, 0.65f, 0.40f, 1.0f), // 浅橙
        FLinearColor(0.72f, 0.60f, 0.87f, 1.0f), // 浅紫
        FLinearColor(0.65f, 0.80f, 0.90f, 1.0f), // 浅天蓝
        FLinearColor(0.82f, 0.82f, 0.93f, 1.0f), // 浅薰衣草紫
        FLinearColor(0.60f, 0.85f, 0.85f, 1.0f), // 浅青绿色
        FLinearColor(0.95f, 0.70f, 0.60f, 1.0f), // 浅珊瑚色
        FLinearColor(0.55f, 0.87f, 0.75f, 1.0f), // 浅薄荷色
        FLinearColor(0.92f, 0.80f, 0.50f, 1.0f), // 浅金色
        FLinearColor(0.87f, 0.65f, 0.75f, 1.0f), // 浅玫瑰色
        FLinearColor(0.80f, 0.70f, 0.95f, 1.0f), // 浅丁香紫
        FLinearColor(0.70f, 0.95f, 0.70f, 1.0f), // 浅苹果绿
        FLinearColor(0.95f, 0.70f, 0.80f, 1.0f), // 浅西瓜红
        FLinearColor(0.70f, 0.80f, 0.95f, 1.0f), // 浅蓝
        // 新增14种扩展颜色
        FLinearColor(0.90f, 0.85f, 0.65f, 1.0f), // 浅杏色
        FLinearColor(0.75f, 0.90f, 0.95f, 1.0f), // 浅薄荷青
        FLinearColor(0.85f, 0.70f, 0.90f, 1.0f), // 浅粉紫
        FLinearColor(0.65f, 0.90f, 0.70f, 1.0f), // 浅草绿
        FLinearColor(0.90f, 0.65f, 0.65f, 1.0f), // 浅绯红
        FLinearColor(0.65f, 0.85f, 0.95f, 1.0f), // 浅海蓝
        FLinearColor(0.85f, 0.95f, 0.75f, 1.0f), // 浅黄绿
        FLinearColor(0.95f, 0.85f, 0.75f, 1.0f), // 浅肤色
        FLinearColor(0.70f, 0.95f, 0.85f, 1.0f), // 浅青苹果绿
        FLinearColor(0.95f, 0.75f, 0.90f, 1.0f), // 浅粉紫
        FLinearColor(0.80f, 0.95f, 0.65f, 1.0f), // 浅柠黄
        FLinearColor(0.75f, 0.75f, 0.95f, 1.0f), // 浅靛蓝
        FLinearColor(0.95f, 0.90f, 0.65f, 1.0f), // 浅金黄
        FLinearColor(0.85f, 0.65f, 0.95f, 1.0f)  // 浅茄紫
    };

    // 颜色设置
    FLinearColor fillColor, borderColor;
    const bool isBot = Player->bEnsure;

    if (isBot) {
        // BOT统一灰色
        fillColor = FLinearColor(0.7f, 0.7f, 0.7f, 0.5f);   // 半透明填充
        borderColor = FLinearColor(0.7f, 0.7f, 0.7f, 1.0f); // 不透明边框
    } else {
        // 真人按队伍ID取色
        int teamIndex = Player->TeamID % 30;
        if (teamIndex < 0) teamIndex = 0; // 确保索引有效
        FLinearColor baseColor = TeamColors[teamIndex];
        
        fillColor = baseColor;
        fillColor.A = 0.5f; // 填充半透明
        borderColor = baseColor;
        borderColor.A = 1.0f; // 边框不透明
    }
    const FLinearColor DownBorderColor = {1.f, 1.0f, 1.0f, 1.0f}; // 死亡状态边框

    // 血条填充 - 中间部分
    if (filledWidth > 0) {
        DrawFilledRectangle(HUD, {basePos.X + hexCornerSize, basePos.Y}, 
                           filledWidth, mHeight, fillColor);
    }

    // 血条填充 - 左端三角形
    if (Player->Health > 0) {
        float leftTriWidth = std::min(hexCornerSize, hexCornerSize * 2);
        for (float y = 0; y < mHeight; y += 3.0f * scaleFactor) {
            float ratio = (y < halfHeight) ? y * invHalfHeight : (mHeight - y) * invHalfHeight;
            float width = leftTriWidth * ratio;
            DrawFilledRectangle(HUD, {basePos.X + hexCornerSize - width, basePos.Y + y}, 
                               width, 3.0f * scaleFactor, fillColor);
        }
    }

    // 血条填充 - 右端三角形
    float rightThreshold = (mWidth - hexCornerSize) / mWidth;
    if (healthPercentage > rightThreshold && Player->Health > 0) {
        float rightTriWidth = hexCornerSize * (healthPercentage * mWidth - (mWidth - hexCornerSize)) / hexCornerSize;
        if (rightTriWidth > 0) {
            for (float y = 0; y < mHeight; y += 3.0f * scaleFactor) {
                float ratio = (y < halfHeight) ? y * invHalfHeight : (mHeight - y) * invHalfHeight;
                float width = rightTriWidth * ratio;
                if (width > 0.5f * scaleFactor) {
                    DrawFilledRectangle(HUD, {basePos.X + mWidth - hexCornerSize, basePos.Y + y}, 
                                       width, 3.0f * scaleFactor, fillColor);
                }
            }
        }
    }

    // 边框绘制 - 存活状态
    if (Player->Health > 0) {
        const float step = 1.5f * scaleFactor;
        for (float y = 0; y < halfHeight; y += step) {
            float ratio = y * invHalfHeight;
            float xOffset = hexCornerSize * (1 - ratio);
            
            DrawRectangle(HUD, {basePos.X + xOffset, basePos.Y + y}, 1, 1, lineWidth, borderColor);
            DrawRectangle(HUD, {basePos.X + xOffset, basePos.Y + mHeight - y - 1}, 1, 1, lineWidth, borderColor);
            DrawRectangle(HUD, {basePos.X + mWidth - xOffset - 1, basePos.Y + y}, 1, 1, lineWidth, borderColor);
            DrawRectangle(HUD, {basePos.X + mWidth - xOffset - 1, basePos.Y + mHeight - y - 1}, 1, 1, lineWidth, borderColor);
        }
        DrawRectangle(HUD, {basePos.X + hexCornerSize, basePos.Y}, midSectionWidth, 1, lineWidth, borderColor);
        DrawRectangle(HUD, {basePos.X + hexCornerSize, basePos.Y + mHeight - 1}, midSectionWidth, 1, lineWidth, borderColor);
    }
    // 边框绘制 - 死亡状态
    else {
        const float step = 1.5f * scaleFactor;
        for (float y = 0; y < halfHeight; y += step) {
            float ratio = y * invHalfHeight;
            float xOffset = hexCornerSize * (1 - ratio);
            
            DrawRectangle(HUD, {basePos.X + xOffset, basePos.Y + y}, 1, 1, lineWidth, DownBorderColor);
            DrawRectangle(HUD, {basePos.X + xOffset, basePos.Y + mHeight - y - 1}, 1, 1, lineWidth, DownBorderColor);
            DrawRectangle(HUD, {basePos.X + mWidth - xOffset - 1, basePos.Y + y}, 1, 1, lineWidth, DownBorderColor);
            DrawRectangle(HUD, {basePos.X + mWidth - xOffset - 1, basePos.Y + mHeight - y - 1}, 1, 1, lineWidth, DownBorderColor);
        }
        DrawRectangle(HUD, {basePos.X + hexCornerSize, basePos.Y}, midSectionWidth, 1, lineWidth, DownBorderColor);
        DrawRectangle(HUD, {basePos.X + hexCornerSize, basePos.Y + mHeight - 1}, midSectionWidth, 1, lineWidth, DownBorderColor);
    }

    // 名字绘制
    robotoFont->LegacyFontSize = 14.f * scaleFactor;
    float namePosX = basePos.X + (115.0f * scaleFactor);
    float namePosY = basePos.Y + halfHeight + (2.0f * scaleFactor);
    const FLinearColor defaultOutlineColor = FLinearColor(0.0f, 0.0f, 0.0f, 1.0f);
    
    std::wstring Name = isBot ? L"BOT" : Player->PlayerName.ToWString();
    DrawTextcan(HUD, FString(Name), {namePosX, namePosY}, 
               FLinearColor(1.0f, 1.0f, 1.0f, 0.8f), defaultOutlineColor);

    // 距离显示（显示实际距离，不做限制）
    robotoFont->LegacyFontSize = 14.f * scaleFactor;
    float distPosX = basePos.X + mWidth - (50.0f * scaleFactor);
    float distPosY = basePos.Y - (11.5f * scaleFactor);
    std::wstring distance = std::to_wstring((int)Distance) + L" M"; // 实际距离数值
    DrawOutlinedText(HUD, FString(distance), FVector2D(distPosX, distPosY), 
                    FLinearColor(1.0f, 1.0f, 1.0f, 0.8f), defaultOutlineColor, true);

    // 队伍ID显示
    robotoFont->LegacyFontSize = 12.f * scaleFactor;
    float idPosX = basePos.X + (35.0f * scaleFactor);
    float idPosY = basePos.Y + halfHeight + (2.0f * scaleFactor);
    std::wstring TeamID = std::to_wstring(Player->TeamID);
    DrawOutlinedText(HUD, FString(TeamID), FVector2D(idPosX, idPosY), 
                    FLinearColor(1.0f, 1.0f, 1.0f, 0.8f), defaultOutlineColor, true);

    // 恢复原始字体大小
    robotoFont->LegacyFontSize = originalFontSize;
}
//鲨鱼血条
if (鲨鱼血条) {
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
                                    DrawFilledRectangle(HUD, {HeadSc.X, HeadSc.Y},  mWidth , mHeight, COLOR_BLACK);
                                    if (Player->Health <= 1.0f && !Player->bDead) {
                                        
                                        //thanh máu
                                        DrawFilledRectangle(HUD, {HeadSc.X, HeadSc.Y - 9}, (CurHP * mWidth / MaxHP), mHeighthp, COLOR_YELLOW);
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
                                    }
                                
                                    
                                    std::wstring ws;
                                    
                                    if (Player->bEnsure)
                                        ws = L"BOT";
                                    else if (Player->PlayerName.IsValid())
                                        ws = Player->PlayerName.ToWString();
                                    
                                    tslFont->LegacyFontSize = max(10, 13 - (int)(Distance / 90));
                                    float txtWidth, txtHeight;
                                    
                                    HUD->GetTextSize(Player->PlayerName, tslFont, 1.f, &txtWidth, &txtHeight);
                                    DrawText(HUD, ws, FVector2D(HeadSc.X + 70 , HeadSc.Y + 2 +( txtHeight * 0.5f)), COLOR_WHITE, true);
                                    
                                }
if (秘银血条) {
    float CurHP = std::max(0.f, std::min(Player->Health, Player->HealthMax));
    float MaxHP = Player->HealthMax;
    
    if (Player->Health == 0.0f && !Player->bDead) {
        CurHP = Player->NearDeathBreath;
        if (Player->NearDeatchComponent) {
            MaxHP = Player->NearDeatchComponent->BreathMax;
        }
    }
    
    // 默认颜色 - 人机为灰色
    FLinearColor ColorHP = FLinearColor(0.6f, 0.6f, 0.6f, 0.7f); // 灰色
    FLinearColor BorderColor = FLinearColor(1.f, 1.f, 1.f, 1.f); // 白色描边

    // 如果是真人玩家（bEnsure 为 true 表示人机）
    if (!Player->bEnsure) {
        // 随机选择多种浅色（16种）
        int colorIndex = rand() % 16;
        switch (colorIndex) {
case 0: ColorHP = FLinearColor(0.20f, 0.52f, 0.65f, 1.0f); break;   // 深蓝色
case 1: ColorHP = FLinearColor(0.72f, 0.40f, 0.45f, 1.0f); break;   // 深红色
case 2: ColorHP = FLinearColor(0.35f, 0.58f, 0.15f, 1.0f); break;   // 深绿色
case 3: ColorHP = FLinearColor(0.72f, 0.45f, 0.20f, 1.0f); break;   // 深橙色
case 4: ColorHP = FLinearColor(0.52f, 0.40f, 0.67f, 1.0f); break;   // 深紫色
case 5: ColorHP = FLinearColor(0.45f, 0.60f, 0.70f, 1.0f); break;   // 深天蓝
case 6: ColorHP = FLinearColor(0.62f, 0.62f, 0.73f, 1.0f); break;   // 深薰衣草紫
case 7: ColorHP = FLinearColor(0.40f, 0.65f, 0.65f, 1.0f); break;   // 深青绿色
case 8: ColorHP = FLinearColor(0.75f, 0.50f, 0.40f, 1.0f); break;   // 深珊瑚色
case 9: ColorHP = FLinearColor(0.35f, 0.67f, 0.55f, 1.0f); break;   // 深薄荷色
case 10: ColorHP = FLinearColor(0.72f, 0.60f, 0.30f, 1.0f); break;  // 深金色
case 11: ColorHP = FLinearColor(0.67f, 0.45f, 0.55f, 1.0f); break;  // 深玫瑰色
case 12: ColorHP = FLinearColor(0.60f, 0.50f, 0.75f, 1.0f); break;  // 深丁香紫
case 13: ColorHP = FLinearColor(0.50f, 0.75f, 0.50f, 1.0f); break;  // 深苹果绿
case 14: ColorHP = FLinearColor(0.75f, 0.50f, 0.60f, 1.0f); break;  // 深西瓜红
case 15: ColorHP = FLinearColor(0.50f, 0.60f, 0.75f, 1.0f); break;  // 深蓝色
        }
    }

    if (CurHP == 0 && !Player->bDead) {
        // 濒死状态用红色（真人）或深灰色（人机）
        ColorHP = (!Player->bEnsure) ? FLinearColor(1.f, 0, 0, 1.f) : FLinearColor(0.3f, 0.3f, 0.3f, 1.f);
    }
    
    // 获取头部位置并上移
    FVector AboveHead = Player->GetHeadLocation(true);
    AboveHead.Z += 35.f;
    FVector2D AboveHeadSc;
    
    if (UGameplayStatics::ProjectWorldToScreen(g_PlayerController, AboveHead, false, &AboveHeadSc)) {
        // 增加血条长度（从40增加到80）
        auto mWidthScale = std::min(0.006f * Distance, 100.f);
        auto mWidth = 80.f - mWidthScale;  // 血条长度增加100%
        
        // 减小字体高度
        auto textHeight = 8.f; // 从12减小到8
        auto barHeight = 6.f;  // 固定血条高度
        
        // 位置偏移
        AboveHeadSc.X -= (mWidth / 2);
        AboveHeadSc.Y -= 7.5f;
        
        // 绘制血量条背景 (深灰色)
        FVector2D BarPosition = {AboveHeadSc.X, AboveHeadSc.Y + textHeight + 1.f};
        DrawFilledRectangle(HUD, BarPosition, mWidth, barHeight, FLinearColor(0.2f, 0.2f, 0.2f, 0.7f));
        
        // 绘制当前血量
        float HealthWidth = (static_cast<float>(CurHP) / MaxHP) * mWidth;
        DrawFilledRectangle(HUD, BarPosition, HealthWidth, barHeight, ColorHP);
        
        // 绘制白色描边边框
        DrawRectangle(HUD, BarPosition, mWidth, barHeight, 1.0f, BorderColor);
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
                                            }    }
if (Config.ESPMenu.Name) {
    FVector AboveHead = Player->GetHeadLocation(true);
    AboveHead.Z += 35.f;
    FVector BelowFeet = Player->K2_GetActorLocation();
    BelowFeet.Z -= 50.f;
    
    FVector2D AboveHeadSc, BelowFeetSc;
    bool bHeadVisible = gGameplayStatics->ProjectWorldToScreen(
        g_PlayerController, AboveHead, false, &AboveHeadSc
    );
    
    if (bHeadVisible) {
        std::wstring ws;
        
        // 构建玩家信息字符串
        ws = L"[" + std::to_wstring(Player->TeamID) + L"] ";
        if (Player->bEnsure) {
            ws += L"人机";
        } else {
            ws += Player->PlayerName.ToWString();
        }
        
        // 添加距离信息
        ws += L" (" + std::to_wstring(static_cast<int>(Distance)) + L"米)";
        
        // 位置调整（与第二段代码相同）
        auto mWidthScale = std::min(0.006f * Distance, 100.f);
        auto mWidth = 20.f - mWidthScale;
        auto mHeight = mWidth * 0.125f;
        AboveHeadSc.X -= (mWidth / 2 - 20) + 15;
        AboveHeadSc.Y -= (mHeight * 1.4f + 20);
        
        // 动态字体大小
        tslFont->LegacyFontSize = fmax(5.5f, 10.5f - (Distance / 100));
        
        // 颜色选择逻辑（保持原样）
        FLinearColor NameColor;
        if (Player->bEnsure) {
            NameColor = FLinearColor(0.6f, 0.6f, 0.6f, 1.0f); // 人机保持灰色
        } else {
            int colorIndex = rand() % 16;
            switch (colorIndex) {
                case 0: NameColor = FLinearColor(0.45f, 0.75f, 0.88f, 1.0f); break;
                case 1: NameColor = FLinearColor(0.95f, 0.65f, 0.70f, 1.0f); break;
                case 2: NameColor = FLinearColor(0.60f, 0.80f, 0.38f, 1.0f); break;
                case 3: NameColor = FLinearColor(0.95f, 0.70f, 0.45f, 1.0f); break;
                case 4: NameColor = FLinearColor(0.75f, 0.65f, 0.90f, 1.0f); break;
                case 5: NameColor = FLinearColor(0.70f, 0.82f, 0.92f, 1.0f); break;
                case 6: NameColor = FLinearColor(0.85f, 0.85f, 0.95f, 1.0f); break;
                case 7: NameColor = FLinearColor(0.65f, 0.88f, 0.88f, 1.0f); break;
                case 8: NameColor = FLinearColor(0.95f, 0.70f, 0.60f, 1.0f); break;
                case 9: NameColor = FLinearColor(0.55f, 0.87f, 0.75f, 1.0f); break;
                case 10: NameColor = FLinearColor(0.92f, 0.80f, 0.50f, 1.0f); break;
                case 11: NameColor = FLinearColor(0.87f, 0.65f, 0.75f, 1.0f); break;
                case 12: NameColor = FLinearColor(0.80f, 0.70f, 0.95f, 1.0f); break;
                case 13: NameColor = FLinearColor(0.70f, 0.95f, 0.70f, 1.0f); break;
                case 14: NameColor = FLinearColor(0.95f, 0.70f, 0.80f, 1.0f); break;
                case 15: NameColor = FLinearColor(0.70f, 0.80f, 0.95f, 1.0f); break;
            }
        }
        
        // 绘制带描边的文本（位置与第二段代码相同）
        DrawOutlinedText(HUD, FString(ws), {AboveHeadSc.X, AboveHeadSc.Y}, NameColor, COLOR_BLACK, true);
    }
}
if (preferences.Config.SilentAim.Fov) {
    // 核心修改：从50米开始，无论是否超过100，每增1米减1
    float baseMax = 180.0f;  // 50米时的不开火最大值
    float baseMin = 120.0f;  // 50米时的开火最小值
    
    // 距离每超过50米1米，就减少1（无论是否超过100）
    float distanceOffset = (Distance > 50) ? (Distance - 50) : 0;
    float maxFov = baseMax - distanceOffset;  // 不开火值：200 - (距离-50)
    float minFov = baseMin - distanceOffset;  // 开火值：120 - (距离-50)
    
    // 强制最低限制（不开火≥60，开火≥40）
    maxFov = (maxFov < 80.0f) ? 80.0f : maxFov;
    minFov = (minFov < 60.0f) ? 60.0f : minFov;

    // 新增平滑过渡逻辑 - 仅添加这部分，不修改原有逻辑结构
    static float smoothFov = preferences.Config.SilentAim.Cross;
    const float smoothFactor = 0.15f; // 过渡平滑度
    float targetFov;

    // 确定目标值（与原有逻辑保持一致）
    if (g_LocalPlayer->bIsWeaponFiring) {
        targetFov = minFov;
    } else {
        targetFov = maxFov;
    }

    // 自定义线性插值实现平滑过渡（不使用FMath）
    smoothFov = smoothFov + (targetFov - smoothFov) * smoothFactor;

    // 应用平滑过渡平滑后的值
    preferences.Config.SilentAim.Cross = smoothFov;
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
                        std::wstring grenadetext = (L"<投掷物>");
                 
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
                        tslFont->LegacyFontSize = TSL_FONT_DEFAULT_SIZE;
                        if (gDistance < 13)
                        {
                            std::wstring gwarn;
                            gwarn = std::wstring(L"Move！移动！走开！");//iAwareTexSiz
                  
                            tslFont->LegacyFontSize = 13 + iAwareTexSiz;
                            DrawOutlinedText(HUD, FString(gwarn),
                                             FVector2D(screenWidth / 2,
                                                       screenHeight / 2),
                                             COLOR_RED, COLOR_BLACK, true);
                            tslFont->LegacyFontSize =
                            TSL_FONT_DEFAULT_SIZE;
                        }//
                        {
                            FVector bbOrigin =
                            RootComponent->RelativeLocation;
                            FVector bbExtends(10, 10, 10);
                            FVector bbOrigin2;
                            bbOrigin -= bbExtends / 2;
                            // bottom plane
                            FVector one = bbOrigin;
                            FVector two = bbOrigin;
                            two.X += bbExtends.X;
                            FVector three = bbOrigin;
                            three.X += bbExtends.X;
                            three.Y += bbExtends.Y;
                            FVector four = bbOrigin;
                            four.Y += bbExtends.Y;
                            FVector five = one;
                            five.Z += bbExtends.Z;
                            FVector six = two;
                            six.Z += bbExtends.Z;
                            FVector seven = three;
                            seven.Z += bbExtends.Z;
                            FVector eight = four;
                            eight.Z += bbExtends.Z;
                            FVector2D s1, s2, s3, s4, s5, s6, s7, s8;
                            if (W2S(one, &s1) && W2S(two, &s2)
                                && W2S(three, &s3) && W2S(four, &s4)
                                && W2S(five, &s5) && W2S(six, &s6)
                                && W2S(seven, &s7) && W2S(eight, &s8))
                            {
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
                            }
                        }
                    }
                }
            }
        }
        GrenadeBase.clear();
    }
if (totalEnemies > 0 || totalBots > 0) {
    // 增加空格间距（使用两个全角空格，视觉更舒适）
    std::wstring enemyStr = L"真人:" + std::to_wstring(totalEnemies);
    std::wstring botStr = L"　　人机:" + std::to_wstring(totalBots); // 全角空格确保明显间距

    // 可爱风格字体设置
    tslFont->LegacyFontSize = 24; // 稍大字号更可爱醒目
    // 若SDK支持字体设置，可添加圆润可爱字体（如苹方、圆体等）
    // tslFont->FontName = L"PingFang SC"; // 示例：苹果系统圆润字体
    // tslFont->FontStyle = L"Regular";

    // 精确计算位置，确保间距和居中
    // 基于24号字体估算的宽度（可根据实际字体调整）
    const float enemyTextWidth = (totalEnemies < 10) ? 65.0f : 75.0f; // 一位数/两位数宽度调整
    const float botTextWidth = (totalBots < 10) ? 75.0f : 85.0f;
    const float totalTextWidth = enemyTextWidth + botTextWidth + 20.0f; // 包含间距

    // 整体居中的起始X坐标
    const float startX = (float)screenWidth / 2 - totalTextWidth / 2;
    
    // 真人文本位置（左半部分）
    FVector2D enemyPos = {startX, 130};
    // 人机文本位置（右半部分，与真人保持20像素间距）
    FVector2D botPos = {startX + enemyTextWidth + 20.0f, 130};

    // 更醒目的红色（高饱和亮红色+柔和阴影，提升可爱感）
    FLinearColor brightRed(1.0f, 0.1f, 0.3f, 1.0f); // 更鲜艳的红色
    FLinearColor softShadow(0.0f, 0.0f, 0.0f, 0.7f); // 半透明阴影更柔和

    // 绘制真人：亮红色+轻微阴影偏移（可爱风格细节）
    DrawTextcan(HUD, FString(enemyStr), 
                FVector2D(enemyPos.X + 1, enemyPos.Y + 1), // 阴影轻微偏移
                softShadow, 
                FLinearColor(0,0,0,0)); // 无内阴影
    DrawTextcan(HUD, FString(enemyStr), 
                enemyPos, 
                brightRed, 
                FLinearColor(0,0,0,0));

    // 绘制人机：暖白色+同风格阴影（保持协调）
    FLinearColor warmWhite(1.0f, 0.95f, 0.85f, 1.0f); // 带点暖色调更可爱
    DrawTextcan(HUD, FString(botStr), 
                FVector2D(botPos.X + 1, botPos.Y + 1), // 阴影偏移与真人一致
                softShadow, 
                FLinearColor(0,0,0,0));
    DrawTextcan(HUD, FString(botStr), 
                botPos, 
                warmWhite, 
                FLinearColor(0,0,0,0));
} else {
    // 无人时：可爱风格绿色SAFE（与整体风格统一）
    std::wstring safeText = L"SAFE";
    
    tslFont->LegacyFontSize = 26; // 稍大一点更突出
    
    // 柔和亮绿色（带点黄调更可爱）
    FLinearColor cuteGreen(0.3f, 1.0f, 0.5f, 1.0f);
    FLinearColor softShadow(0.0f, 0.0f, 0.0f, 0.7f);

    // 居中位置
    FVector2D safePos = {(float)screenWidth / 2, 130};

    // 带阴影的可爱风格绘制
    DrawTextcan(HUD, FString(safeText), 
                FVector2D(safePos.X + 1, safePos.Y + 1), 
                softShadow, 
                FLinearColor(0,0,0,0));
    DrawTextcan(HUD, FString(safeText), 
                safePos, 
                cuteGreen, 
                FLinearColor(0,0,0,0));
}
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
                                DrawSmallOutlinedText(HUD, ARM, { itemPos.X,itemPos.Y}, COLOR_WHITE, COLOR_BLACK);
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
}

@end

