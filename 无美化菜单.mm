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
int vest = 0;
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

// 后加modskin分区bool
bool M416 = false;
bool M4168 = false;
bool M4169 = false;
bool M4161 = false;
bool M4162 = false;
bool M4163 = false;
bool M4164 = false;
bool AKM = false;
bool AKM1 = false;
bool AKM2 = false;
bool AKM3 = false;
bool AKM4 = false;
bool AKM5 = false;
bool AKM6 = false;
bool Vest = false;
bool MK14 = false;
bool MK145 = false;
bool MK146 = false;
bool MK147 = false;
bool MK148 = false;
bool MK149 = false;
bool MK140 = false;
bool mg31 = false;
bool mg32 = false;
bool mg33 = false;
bool mg34 = false;
bool mg35 = false;
bool mg36 = false;
bool P90 = false;
bool P901 = false;
bool P902 = false;
bool P903 = false;
bool P904 = false;
bool P905 = false;
bool P906 = false;
bool SCARL = false;
bool SCARL1 = false;
bool SCARL2 = false;
bool SCARL3 = false;
bool SCARL4 = false;
bool SCARL5 = false;
bool SCARL6 = false;
bool M762 = false;
bool M7621 = false;
bool M7622 = false;
bool M7623 = false;
bool M7624 = false;
bool M7625 = false;
bool M7626 = false;
bool AWM = false;
bool AWM1 = false;
bool AWM2 = false;
bool AWM3 = false;
bool AWM4 = false;
bool AWM5 = false;
bool AWM6 = false;
bool KAR98 = false;
bool KAR981 = false;
bool KAR982 = false;
bool KAR983 = false;
bool KAR984 = false;
bool KAR985 = false;
bool KAR986 = false;
bool M24 = false;
bool M241 = false;
bool M242 = false;
bool M243 = false;
bool M244 = false;
bool M245 = false;
bool M246 = false;
bool M16 = false;
bool M161 = false;
bool M162 = false;
bool M163 = false;
bool M164 = false;
bool M165 = false;
bool M166 = false;
bool M249 = false;
bool M2491 = false;
bool M2492 = false;
bool M2493 = false;
bool M2494 = false;
bool M2495 = false;
bool M2496 = false;
bool MG3 = false;
bool DP28 = false;
bool DP281 = false;
bool DP282 = false;
bool DP283 = false;
bool DP284 = false;
bool DP285 = false;
bool DP286 = false;
bool GROZA = false;
bool GROZA1 = false;
bool GROZA2 = false;
bool GROZA3 = false;
bool GROZA4 = false;
bool GROZA5 = false;
bool GROZA6 = false;
bool AUG = false;
bool AUG1 = false;
bool AUG2 = false;
bool AUG3 = false;
bool AUG4 = false;
bool AUG5 = false;
bool AUG6 = false;
bool PAN = false;
bool UZI = false;
bool UZI1 = false;
bool UZI2 = false;
bool UZI3 = false;
bool UZI4 = false;
bool UZI5 = false;
bool UZI6 = false;
bool UMP = false;
bool UMP1 = false;
bool UMP2 = false;
bool UMP3 = false;
bool UMP4 = false;
bool UMP5 = false;
bool UMP6 = false;
bool TOMMY = false;
bool BIZON = false;
bool ACE32 = false;
bool ACE321 = false;
bool ACE322 = false;
bool ACE323 = false;
bool ACE324 = false;
bool ACE325 = false;
bool ACE326 = false;
bool VECTOR = false;
bool Mk47  = false; // 经典
bool Mk471  = false; // 破损
bool Mk472  = false; // 修复
bool AMR = false;
bool AMR1 = false; // 完好
bool AMR2 = false; // 改进
bool AMR3 = false; // 精致
bool MK666 = false; // 经典妹控
bool S12K = false; // kings Ian
bool S12K1 = false; // 破损
bool S12K2 = false; // 修复
bool S12K3 = false; // 完好
bool S12K4 = false; // 改进
bool S12K5 = false; // 精致
bool S12K6 = false; // 独眼蛇
bool S12K7 = false; // 钢铁
bool dbs = false;
bool dbs1 = false; // 修复
bool dbs2 = false;
bool dbs3 = false;
bool dbs4 = false;
bool dbs5 = false;
bool dbs6 = false;
bool dbs7 = false;
bool FAMAS = false;
bool FAMAS精致 = false;
bool FAMAS改进 = false;
bool FAMAS完好 = false;
bool FAMAS修复 = false;
bool qbz = false;
bool qbz2 =false;//
bool qbz5 =false;//
bool 不一秒套装 = false;


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
  int XSuits = -15;
 //后加modskin分区int=///////////////////////////////////////////////////////////////////////////////////////
  int AKM = 0; 
int AKM1 = 0;
int AKM2 = 0;
int AKM3 = 0;
int AKM4 = 0;
int AKM5 = 0;
int AKM6 = 0;
int M16A4 = 0;
int M16A41 = 0;
int M16A42 = 0;
int M16A43 = 0;
int M16A44 = 0;
int M16A45 = 0;
int M16A46 = 0;
int Scar = 0;
int Scar1 = 0;
int Scar2 = 0;
int Scar3 = 0;
int Scar4 = 0;
int Scar5 = 0;
int Scar6 = 0;
int M416 = 0;
int M4168 = 0;
int M4169 = 0;
int M4161 = 0;
int M4162 = 0;
int M4163 = 0;
int M4164 = 0;
int Groza = 0;
int Groza1 = 0;
int Groza2 = 0;
int Groza3 = 0;
int Groza4 = 0;
int Groza5 = 0;
int Groza6 = 0;
int AUG = 0;
int AUG1 = 0;
int AUG2 = 0;
int AUG3 = 0;
int AUG4 = 0;
int AUG5 = 0;
int AUG6 = 0;
int QBZ = 0;
int M762 = 0;
int M7621 = 0;
int M7622 = 0;
int M7623 = 0;
int M7624 = 0;
int M7625 = 0;
int M7626 = 0;
int ACE32 = 0;
int ACE321 = 0;
int ACE322 = 0;
int ACE323 = 0;
int ACE324 = 0;
int ACE325 = 0;
int ACE326 = 0;
int Parachute = 0;
int UZI = 0;
int UZI1 = 0;
int UZI2 = 0;
int UZI3 = 0;
int UZI4 = 0;
int UZI5 = 0;
int UZI6 = 0;
int UMP = 0;
int UMP1 = 0;
int UMP2 = 0;
int UMP3 = 0;
int UMP4 = 0;
int UMP5 = 0;
int UMP6 = 0;
int Vector = 0;
int Thompson = 0;
int Bizon = 0;
int MK145 = 0;
int MK14 = 0;
int MK146 = 0;
int MK147 = 0;
int MK148 = 0;
int MK149 = 0;
int MK140 = 0;
int MK666 = 0; // 经典mk
int mg31 = 0;
int mg32 = 0;
int mg33 = 0;
int mg34 = 0;
int mg35 = 0;
int mg36 = 0;
int P90 = 0;
int P901 = 0;
int P902 = 0;
int P903 = 0;
int P904 = 0;
int P905 = 0;
int P906 = 0;
int K98 = 0;
int K981 = 0;
int K982 = 0;
int K983 = 0;
int K984 = 0;
int K985 = 0;
int K986 = 0;
int M24 = 0;
int M241 = 0;
int M242 = 0;
int M243 = 0;
int M244 = 0;
int M245 = 0;
int M246 = 0;
int AWM = 0;
int AWM1 = 0;
int AWM2 = 0;
int AWM3 = 0;
int AWM4 = 0;
int AWM5 = 0;
int AWM6 = 0;
int DP28 = 0;
int DP281 = 0;
int DP282 = 0;
int DP283 = 0;
int DP284 = 0;
int DP285 = 0;
int DP286 = 0;
int M249 = 0;
int M2491 = 0;
int M2492 = 0;
int M2493 = 0;
int M2494 = 0;
int M2495 = 0;
int M2496 = 0;
int MG3 = 0;
int Mk47 = 0;
int Mk471 = 0;
int Mk472 = 0;
int AMR = 0;
int AMR1 = 0;
int AMR2 = 0;
int AMR3 = 0;
int S12K = 0;
int S12K1 = 0;
int S12K2 = 0;
int S12K3 = 0;
int S12K4 = 0;
int S12K5 = 0;
int S12K6 = 0;
int S12K7 = 0;
int dbs = 0;
int dbs1 = 0;
int dbs2 = 0;
int dbs3 = 0;
int dbs4 = 0;
int dbs5 = 0;
int dbs6 = 0;
int dbs7 = 0;
int FAMAS = 0;
int FAMAS精致 = 0;
int FAMAS改进 = 0;
int FAMAS完好 = 0;
int FAMAS修复 = 0;
int qbz = 0;
int qbz2 = 0;
int qbz5 = 0;
int 不一秒套装=-15;

  int Moto = 0;
  int CoupeRP = 0;
  int UAZ = 0;
  int Dacia = 0;
  int Bigfoot = 0;
  int Mirado = 0;
  int OMirado = 0;
  int Buggy = 0;
  int MiniBus = 0;
  int Boat = 0;
};
sModSkin Skin{false};
        
    };
    sConfig Config{false};

} preferences;
static int helmett3 = 0;
static int bag3 = 0;
static int vest3 = 0;
bool ModSkinn = false;
bool KillMessage = false;
bool DeadBox = false;
int sEmote1 = 2200101;
int sEmote2 = 2200201;
int sEmote3 = 2200301;
int ModEmote1 = 0;
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
  //int 不一秒美化 = 403003;
  //int XSuits1 = 40604002;
  int Parachute = 703001;
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

int XSuits1 = 40604002;
  int Hair = 40601001;
  int Shoes = 0;
  int Shorts = 404026;
  int Kabba = 410517;
int Gloves = 452002;
//////////////////////////////////////////////////////////////////////后加int

  int AKM = 101001;
  int AKM1 = 1010012; //修复
  int AKM2 = 1010013; //完好
  int AKM3 = 1010014; //改进
  int AKM4 = 1010015; //精致
  int AKM5 = 1010016; //独眼蛇
  int AKM6 = 1010017; //钢铁
  int AKM_Mag = 291001; //弹匣
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

  int longyin_x6666 = 203015; //默认6倍
  int longyin_x8888 = 203005; //8倍
  int longyin_x1111 = 203001; //红点
  int longyin_x2222 = 203008; //m416机械瞄具
  int longyin_x3333 = 203014; //默认3倍
  int longyin_x4444 = 203004;//四倍
  int tuosb = 205003;//托腮版默认
  int tuosb1 = 2050032;//修复托腮版
  int tuosb2 = 2050033;//完好托腮版
  int tuosb3 = 2050034;//改进托腮版
  int tuosb4 = 2050035;//精致托腮版


  
  int M762 = 101008;
  int M7621 = 1010082;
  int M7622 = 1010083;
  int M7623 = 1010084;
  int M7624 = 1010085;
  int M7625 = 1010086;
  int M7626 = 1010087;
  int M762_Mag = 291008;
  int M762_flash = 201010;
  int M762_compe = 201009;
  int M762_silent = 201011;
  int M762_红点 = 203001;
  int M762_全息 = 203002;
  int M762_2倍镜 = 203003;
  int M762_3倍镜 = 203014;
  int M762_4倍镜 = 203004;
  int M762_6倍镜 = 203015;
  int M762_quickMag = 204012;
  int M762_extendedMag = 204011;
  int M762_quickNextended = 204013;
  int M762_angle = 202001;
  int M762_lightgrip = 202004;
  int M762_pink = 202005;
  int M762_lazer = 202007;
  int M762_thumb = 202006;

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

    //精致妹控
        int MK14 = 1030075;
        //弹匣
        int MK14_4 = 2040095;
        //8倍
        int MK14_2 = 203005;
        //枪托
        int MK14_5 = 2050035;
        //枪口
        int MK14_6 = 2010035;
        //红点
        int MK14_10 = 203001;
        //6倍
        int MK14_11 = 203015;
        //步枪扩容
        int MK14_12 = 2040135;
        //步枪补偿
        int MK14_13 = 2010095;
        //狙击消音
        int MK14_14 = 2010075;
        //步枪消音
        int MK14_15 = 2010115;
    
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
  int mg3_x1 = 203001;
  int mg3_x3 = 203014;
  int mg3_holo = 203002; 
  int mg3_x4 = 203004;
  int mg3_mag = 295007;
  int mg3_x2 = 203003;
  int mg3_x6 = 203015;
  int QBZ = 101007;
  int AUG = 101006;
  int AUG红点 = 203001;
  int AUG6倍 =203015;
  int AUG1 = 1010062;
  int AUG2 = 1010063;
  int AUG3 = 1010064;
  int AUG4 = 1010065;
  int AUG5 = 1010066;
  int AUG6 = 1010067;
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
 int UMP红 = 203001;
  int UMP6倍 =203015;
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
int AMR1 = 1030123;
int AMR2 = 1030124;
int AMR3 = 1030125;
  int VSS = 103005;
  int SKS = 103004;
  int Mini14 = 103006;
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
  int M249s = 205009;
  int Mk47 = 101009;
int Mk471 = 1010091;
int Mk472 = 1010092;
int MK666 = 103007;
int S12K = 104003;
int S12K1 = 1040031;
int S12K2 = 1040032;
int S12K3 = 1040033;
int S12K4 = 1040034;
int S12K5 = 1040035;
int S12K6 = 1040036;
int S12K7 = 1040037;
int dbs = 104004;
int dbs1 = 1040041;
int dbs2 = 1040042;
int dbs3 = 1040043;
int  dbs4 = 104004;
int dbs5 = 1040045;
int dbs6 = 1040046;
int dbs7 = 1040047;
int FAMAS =1040047;
int FAMAS修复 =10400472;
int FAMAS完好 =10400473;
int FAMAS改进 =10400474;
int FAMAS精致 =10400475;
int qbz =101007;
int qbz2 =1010072;
int qbz5 =1010075;
int 不一秒套装= 403003;
  int Skorpion = 106008;
  int Moto = 1901001;
  int CoupeRP = 1961001;
  int Dacia = 1903001;
  int UAZ = 1908001;
  int Bigfoot = 1953001;
  int Mirado = 1914004;
  int OMirado = 1915001;
  int Buggy = 1907001;
  int MiniBus = 1987001;
  int Boat = 1911001;

};

inline snew_Skin new_Skin;



std::chrono::steady_clock::time_point lastChangeTime;
std::chrono::steady_clock::time_point lastWeaponChangeTime;
//背包
void updateSkin() {
if (preferences.vest == 0)

                    vest3 = 50001;

if (preferences.bag == 0)

                    bag3 = 50001;
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
                    bag3 = 1501003211;

                    
if (preferences.bag == 9)

                    bag3 = 1501003261;
if (preferences.bag == 10)

                    bag3 = 1501003652;

                    //if (preferences.xsuit == 10)
                    //bag3 = 0;
                    //if (preferences.xsuit == 11)
                    //bag3 = 0;
                    //if (preferences.xsuit == 12)//todo
                    //bag3 = 0;
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


//衣服



if (preferences.Config.Skin.XSuits == 1) {
    new_Skin.XSuits = 1405627;  // ID: 1405871 | name: 血鸦圣装(4星) ID: 1405627 | name: 金尊法老圣装(4星)
}
if (preferences.Config.Skin.XSuits == 2) {
    new_Skin.XSuits = 1405871;  // ID: 1405871 | name: 血鸦圣装(4星)
}
if (preferences.Config.Skin.XSuits == 3) {
    new_Skin.XSuits = 1405981;  // ID: 1405981 | name: 海洋之王圣装(4星)
    new_Skin.Hair = 1402873;  // ID: 1402873 | name: ###海洋之王圣装头饰
}
if (preferences.Config.Skin.XSuits == 4) {
    new_Skin.XSuits = 1406474;  // ID: 1406474 | name: 金辉艳后圣装（5星）
    // new_Skin.Hair = 1410085;
}
if (preferences.Config.Skin.XSuits == 5) {
    new_Skin.XSuits = 1406639;  // ID: 1406639 | name: 千面诡皇圣装（3星）
    new_Skin.Hair = 1410243;  // ID: 1410243 | name: ###千面诡皇圣装头饰-白（2级）
}
if (preferences.Config.Skin.XSuits == 6) {
    new_Skin.XSuits = 1406812;  // ID: 1406812 | name: 血渊圣王圣装（4星）
}
if (preferences.Config.Skin.XSuits == 7) {
    new_Skin.XSuits = 1406969;  // ID: 1406968 | name: 秘渊灵主圣装(4星)
}
if (preferences.Config.Skin.XSuits == 8) {
    new_Skin.XSuits = 1407102;  // ID: 1407102 | name: 曙光芙洛拉圣装(6星)
}
if (preferences.Config.Skin.XSuits == 9) {
    new_Skin.XSuits = 1407216;  // ID: 1407216 | name: 圣焰伊格尼圣装(4星)
}
if (preferences.Config.Skin.XSuits == 10) {
    new_Skin.XSuits = 1407363;  // ID: 1407363 | name: 风灵迦尔圣装(4星)
}
if (preferences.Config.Skin.XSuits == 11) {
    new_Skin.XSuits = 1405426;
}
if (preferences.Config.Skin.XSuits == 12) {
    new_Skin.XSuits = 1400051;
    new_Skin.Shorts = 1400052;
}
if (preferences.Config.Skin.XSuits == 13) {
    new_Skin.XSuits = 1407453;
}
if (preferences.Config.Skin.XSuits == 14) {
    new_Skin.XSuits = 1406327;
}
if (preferences.Config.Skin.XSuits == 15) {
    new_Skin.XSuits = 1406140;
}
if (preferences.Config.Skin.XSuits == 16) {
    new_Skin.XSuits = 1406398;  // 涤焰魔甲套装
    new_Skin.Hair = 40605012;  // 双马尾
}
if (preferences.Config.Skin.XSuits == 17) {
    new_Skin.XSuits = 1407385;  // 顽皮恶魔套装1407385
    new_Skin.XSuits1 = 1403257;
}
if (preferences.Config.Skin.XSuits == 18) {
    new_Skin.XSuits = 1407188;  // 小杰套装1407188
    new_Skin.Hair = 40605012;  // 双马尾
}
if (preferences.Config.Skin.XSuits == 19) {
    new_Skin.XSuits = 1405205;  // 酷萌兔宝套装1405205
    new_Skin.Hair = 40605012;  // 双马尾
}
if (preferences.Config.Skin.XSuits == 20) {
    new_Skin.XSuits = 1406759;  // 数码酷熊套装1406759
}
if (preferences.Config.Skin.XSuits == 21) {
    new_Skin.XSuits = 1400106;  // 武装女仆套装1400106
    new_Skin.Hair = 40605012;  // 双马尾
}
if (preferences.Config.Skin.XSuits == 22) {
    new_Skin.XSuits = 1405801;  // B.Duck套装1405801
    new_Skin.Hair = 1405791;  // ID: 1405791 | name: B.Duck头部
}
if (preferences.Config.Skin.XSuits == 23) {
    new_Skin.XSuits = 1406914;  // 秘法使徒套装1406914
}
if (preferences.Config.Skin.XSuits == 24) {
    new_Skin.XSuits = 1406954;  // 比克角色（绿哥布林）
}
if (preferences.Config.Skin.XSuits == 25) {
    new_Skin.XSuits = 1407031;  // KFC绝地上校
}
if (preferences.Config.Skin.XSuits == 26) {
    new_Skin.XSuits = 1407396;
    new_Skin.Hair = 40605012;  // 双马尾
}
if (preferences.Config.Skin.XSuits == 27) {
    new_Skin.XSuits = 1405238;
}
if (preferences.Config.Skin.XSuits == 28) {
    new_Skin.XSuits = 1400288;  // 黑鲨行动潜水服1400288
}
if (preferences.Config.Skin.XSuits == 29) {
    new_Skin.XSuits = 1406406;
    new_Skin.Hair = 40605012;  // 双马尾
}
if (preferences.Config.Skin.XSuits == 30) {
    new_Skin.XSuits = 1405334;
    new_Skin.Hair = 40605012;  // 双马尾
}
if (preferences.Config.Skin.XSuits == 31) {
    new_Skin.XSuits = 1405229;
    new_Skin.Hair = 40605012;  // 双马尾
}
if (preferences.Config.Skin.XSuits == 32) {
    
}
if (preferences.Config.Skin.XSuits == 33) {
    new_Skin.XSuits = 1400782;
}
if (preferences.Config.Skin.XSuits == 34) {
    new_Skin.XSuits = 1406388;
}
if (preferences.Config.Skin.XSuits == 35) {
    new_Skin.XSuits = 1407107;
}
if (preferences.Config.Skin.XSuits == 36) {
    new_Skin.XSuits = 1406244;  // 五条
}
if (preferences.Config.Skin.XSuits == 37) {
    new_Skin.XSuits = 1406439;  // 万圣节吸血鬼HomeLander Super SuitSet1406439
}
if (preferences.Config.Skin.XSuits == 38) {
    new_Skin.XSuits = 1406386;  // 零
}
if (preferences.Config.Skin.XSuits == 39) {
    new_Skin.XSuits = 1404000;  // 白鲨鱼
    new_Skin.Shorts = 1404002;  // 裤子
    new_Skin.Shoes = 1404003;//白鲨鱼鞋子
    new_Skin.Gloves = 452001;  // 冰霜手套
    new_Skin.Kabba = 1400563;  // 欧美脸
    new_Skin.Hair = 40605012;  // 双马尾
}
if (preferences.Config.Skin.XSuits == 40) {
    new_Skin.XSuits = 1404243;  // 假木乃伊
    new_Skin.Shorts = 1404230;  // 裤子
    new_Skin.Shoes = 1404231;
    new_Skin.Hair = 1403095;
}
if (preferences.Config.Skin.XSuits == 41) {
    new_Skin.XSuits = 1400101;  // 指挥官
    new_Skin.Shorts = 1400122;//裤子
    new_Skin.Hair = 40605011;  // 大悲头
    new_Skin.Kabba = 1404198;  // 红眼罩
}
if (preferences.Config.Skin.XSuits == 42) {
    new_Skin.XSuits = 1404127;
    new_Skin.Shorts = 1404441;  // 裤子
    new_Skin.Hair = 1410020;
}
if (preferences.Config.Skin.XSuits == 43) {
    new_Skin.XSuits = 1404049;  // 黄鲨鱼衣
    new_Skin.Shorts = 1404050;  // 裤子
    new_Skin.Shoes = 1404051;  // 鞋子
}
if (preferences.Config.Skin.XSuits == 44) {
    new_Skin.XSuits = 1400569;  // 紫鲨鱼衣
    new_Skin.Shorts = 1400650;  // 紫鲨鱼裤子
    new_Skin.Shoes = 1400651;  // 紫鲨鱼鞋子
}
if (preferences.Config.Skin.XSuits == 45) {
    new_Skin.XSuits = 1400101;  // 指挥官上衣
    new_Skin.Shorts = 1404397;  // 精美织物裤子
    new_Skin.Shoes = 1400651;  // BAPE Sta
    new_Skin.Kabba = 1400563;  // 欧美脸
    new_Skin.Hair = 40605011;  // 大悲头
}
if (preferences.Config.Skin.XSuits == 46) {
    new_Skin.XSuits = 1400708;  // 战队服
    new_Skin.Shorts = 1404002;  // 白鲨鱼裤子
    new_Skin.Shoes = 1400651;  // BAPE Sta
    new_Skin.Kabba = 1400563;  // 欧美脸
    new_Skin.Hair = 40605011;  // 大悲头
}
if (preferences.Config.Skin.XSuits == 47) {
    new_Skin.XSuits = 1404153;  // 甜蜜菠萝上衣1404153
    new_Skin.Shorts = 1404152;  // 甜蜜菠萝裤子1404152
    new_Skin.Shoes = 1404151;  // 甜蜜菠萝鞋子1404151
    new_Skin.Hair = 40605012;  // 双马尾
}
if (preferences.Config.Skin.XSuits == 48) {
    new_Skin.XSuits = 1407387;  // 魅夜死神
}
if (preferences.Config.Skin.XSuits == 49) {
    new_Skin.XSuits = 1406280;  // Joyful Kitten Set1406280
}
if (preferences.Config.Skin.XSuits == 50) {
    new_Skin.XSuits = 1407440;  // 神极寒战神套装
}
if (preferences.Config.Skin.XSuits == 51) {
    new_Skin.XSuits = 1407392;  // 蛮荒主宰套装
}
if (preferences.Config.Skin.XSuits == 52) {
    new_Skin.XSuits = 1407391;  // 玫瑰夫人
}
if (preferences.Config.Skin.XSuits == 53) {
    new_Skin.XSuits = 1407415;  // 2b
    new_Skin.Hair = 1410738;  // 2b
}
if (preferences.Config.Skin.XSuits == 54) {
    new_Skin.XSuits = 1407330;  // 苍白上将
}
if (preferences.Config.Skin.XSuits == 55) {
    new_Skin.XSuits = 1407286;  // 赛博猫妖
}
if (preferences.Config.Skin.XSuits == 56) {
    new_Skin.XSuits = 1407470;  // 烈焰古神
}
if (preferences.Config.Skin.XSuits == 57) {
    new_Skin.XSuits = 1407224;  // 神域金皇
}
if (preferences.Config.Skin.XSuits == 58) {
    new_Skin.XSuits = 1407219;  // 圣焰伊格尔
}
if (preferences.Config.Skin.XSuits == 59) {
    new_Skin.XSuits = 1407160;  // 神魂忍者
}
if (preferences.Config.Skin.XSuits == 60) {
    new_Skin.XSuits = 1407106;  // 炽焰绯狐
}
if (preferences.Config.Skin.XSuits == 61) {
    new_Skin.XSuits = 1407048;  // 霹雳拳王
}
if (preferences.Config.Skin.XSuits == 62) {
    new_Skin.XSuits = 1406977;  // 怒涛主宰
}
if (preferences.Config.Skin.XSuits == 63) {
    new_Skin.XSuits = 1406976;  // 音乐之王
}
if (preferences.Config.Skin.XSuits == 64) {
    new_Skin.XSuits = 1406898;  // 龙女魔后
}
if (preferences.Config.Skin.XSuits == 65) {
    new_Skin.XSuits = 1406824;  // 血魂魔皇
}
if (preferences.Config.Skin.XSuits == 66) {
    new_Skin.XSuits = 1406823;  // 极辉女帝
}
if (preferences.Config.Skin.XSuits == 67) {
    new_Skin.XSuits = 1407511;  // 幽冥阿努比斯圣装(6星)
}

if (preferences.Config.Skin.XSuits == 68) {
    new_Skin.XSuits = 1407441;  // 糖心雪宝套装
}
if (preferences.Config.Skin.XSuits == 69) {
    new_Skin.XSuits = 1407329;  // 霓虹天后套装
}
if (preferences.Config.Skin.XSuits == 70) {
    new_Skin.XSuits = 1410610;  // SPY套装
}
if (preferences.Config.Skin.XSuits == 71) {
    new_Skin.XSuits = 1407563;  // 艾伦·耶格尔角色皮肤
}
if (preferences.Config.Skin.XSuits == 72) {
    new_Skin.XSuits = 1407564;  // 进击的巨人套装
}
if (preferences.Config.Skin.XSuits == 73) {
    new_Skin.XSuits = 1407565;  // 三笠·阿克曼角色皮肤
}
if (preferences.Config.Skin.XSuits == 74) {
    new_Skin.XSuits = 1407566;  // 阿尔敏角色皮肤
}
if (preferences.Config.Skin.XSuits == 75) {
    new_Skin.XSuits = 1407567;  // 超大型巨人（阿尔敏）套装
}
if (preferences.Config.Skin.XSuits == 76) {
    new_Skin.XSuits = 1407568;  // 利威尔角色皮肤
}
if (preferences.Config.Skin.XSuits == 77) {
    new_Skin.XSuits = 1407569;  // 铠之巨人玩偶服
}
if (preferences.Config.Skin.XSuits == 78) {
    new_Skin.XSuits = 1407570;  // 调查兵团作战套装
}
if (preferences.Config.Skin.XSuits == 79) {
    new_Skin.XSuits = 1407597;  // 艾伦·耶格尔角色皮肤（重复ID需注意）
}
if (preferences.Config.Skin.XSuits == 80) {
    new_Skin.XSuits = 1407598;  // 进击的巨人套装
}
if (preferences.Config.Skin.XSuits == 81) {
    new_Skin.XSuits = 1407599;  // 三笠·阿克曼角色皮肤
}
if (preferences.Config.Skin.XSuits == 82) {
    new_Skin.XSuits = 1407600;  // 阿尔敏角色皮肤
}
if (preferences.Config.Skin.XSuits == 83) {
    new_Skin.XSuits = 1407601;  // 超大型巨人（阿尔敏）套装
}
if (preferences.Config.Skin.XSuits == 84) {
    new_Skin.XSuits = 1407602;  // 利威尔角色皮肤
}
if (preferences.Config.Skin.XSuits == 85) {
    new_Skin.XSuits = 1407603;  // 霓虹幻翼套装
}
if (preferences.Config.Skin.XSuits == 86) {
    new_Skin.XSuits = 1407604;  // 进击的巨人套装
}
if (preferences.Config.Skin.XSuits == 87) {
    new_Skin.XSuits = 1407605;  // 进击的巨人套装
}
if (preferences.Config.Skin.XSuits == 88) {
    new_Skin.XSuits = 1407558;  // 曙光女帝套装
}
if (preferences.Config.Skin.XSuits == 89) {
    new_Skin.XSuits = 1407559;  // 暗月至尊套装
}
if (preferences.Config.Skin.XSuits == 90) {
    new_Skin.XSuits = 1407275;  // 神羽男
}
if (preferences.Config.Skin.XSuits == 91) {
    new_Skin.XSuits = 0;  // 
    new_Skin.Shorts = 0;  // 
    new_Skin.Shoes = 0;//
    new_Skin.Gloves = 0;  // 
    new_Skin.Kabba = 0;  // 
    new_Skin.Hair = 0;  // 
}

 if (preferences.Config.Skin.AKM == 0) {
    new_Skin.AKM = 1101001022;
    new_Skin.AKM1 = 1101001022;
    new_Skin.AKM2 = 1101001022;
    new_Skin.AKM3 = 1101001022;
    new_Skin.AKM4 = 1101001022;
    new_Skin.AKM5 = 1101001022;
    new_Skin.AKM6 = 1101001022;
    new_Skin.AKM_Mag = 1010010231;
  }
  if (preferences.Config.Skin.AKM == 1) {
    new_Skin.AKM = 1101001248;
    new_Skin.AKM1 = 1101001248;
    new_Skin.AKM2 = 1101001248;
    new_Skin.AKM3 = 1101001248;
    new_Skin.AKM4 = 1101001248;
    new_Skin.AKM5 = 1101001248;
    new_Skin.AKM6 = 1101001248;
    new_Skin.AKM_Mag = 1010012444;
new_Skin.longyin_x1111 = 1030070218;
    new_Skin.longyin_x2222 = 1030070216;
    new_Skin.longyin_x3333 = 1030070215;
    new_Skin.longyin_x4444 = 1030070214;
    new_Skin.longyin_x6666 = 1030070213;
    new_Skin.longyin_x8888 = 1030070212;

  }
  if (preferences.Config.Skin.AKM == 2) {
    new_Skin.AKM = 1101001102;
    
    new_Skin.AKM_Mag = 1010011031;
  }
  if (preferences.Config.Skin.AKM == 3) {
    new_Skin.AKM = 1101001115;
    
    new_Skin.AKM_Mag = 1010011161;
  }
  if (preferences.Config.Skin.AKM == 4) {
    new_Skin.AKM = 1101001127;
    
    new_Skin.AKM_Mag = 1010011281;
  }
  if (preferences.Config.Skin.AKM == 5) {
    new_Skin.AKM = 1101001142;
    new_Skin.AKM_Mag = 1010011431;
  }
  if (preferences.Config.Skin.AKM == 6) {
    new_Skin.AKM = 1101001153;
    new_Skin.AKM_Mag = 1010011541;
  }
  if (preferences.Config.Skin.AKM == 7) {
    new_Skin.AKM = 1101001173;
    new_Skin.AKM_Mag = 1010011741;
  }
  if (preferences.Config.Skin.AKM == 8) {
    new_Skin.AKM = 1101001212;
    new_Skin.AKM_Mag = 1010012131;
  }
  if (preferences.Config.Skin.AKM == 9) {
    new_Skin.AKM = 1101001230;
    new_Skin.AKM_Mag = 1010012311;
  }
  if (preferences.Config.Skin.AKM == 10) {
    new_Skin.AKM = 1101001241;
    new_Skin.AKM_Mag = 1010012421;
  }
if (preferences.Config.Skin.AKM == 11) {
    new_Skin.AKM = 1101001022;
    new_Skin.AKM_Mag = 1010010231;
  }
if (preferences.Config.Skin.AKM == 12) {
    new_Skin.AKM = 1101001062;
    new_Skin.AKM_Mag = 1010010571;
  }
if (preferences.Config.Skin.AKM == 13) {
    new_Skin.AKM = 1101001264;
    new_Skin.AKM_Mag = 1010012641;
}
  ////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.AKM == 0) {
    new_Skin.AKM1 = 1101001022;


  }
  if (preferences.Config.Skin.AKM == 1) {
    new_Skin.AKM1 = 1101001248;


  }
  if (preferences.Config.Skin.AKM == 2) {
    new_Skin.AKM1 = 1101001102;
    
  }
  if (preferences.Config.Skin.AKM == 3) {
    new_Skin.AKM1 = 1101001115;
    
  }
  if (preferences.Config.Skin.AKM == 4) {
    new_Skin.AKM1 = 1101001127;
    
  }
  if (preferences.Config.Skin.AKM == 5) {
    new_Skin.AKM1 = 1101001142;
    
  }
  if (preferences.Config.Skin.AKM == 6) {
    new_Skin.AKM1 = 1101001153;
    

  }
  if (preferences.Config.Skin.AKM == 7) {
    new_Skin.AKM1 = 1101001173;
    
  }
  if (preferences.Config.Skin.AKM == 8) {
    new_Skin.AKM1 = 1101001212;
    
  }
  if (preferences.Config.Skin.AKM == 9) {
    new_Skin.AKM1 = 1101001230;
    
  }
  if (preferences.Config.Skin.AKM == 10) {
    new_Skin.AKM1 = 1101001241;
    
  }
if (preferences.Config.Skin.AKM == 11) {
    new_Skin.AKM1 = 1101001022;
    
  }
if (preferences.Config.Skin.AKM == 12) {
    new_Skin.AKM1 = 1101001062;
    
  }
if (preferences.Config.Skin.AKM == 13) {
    new_Skin.AKM1 = 1101001264;
    
}
  ////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.AKM == 0) {
    new_Skin.AKM2 = 1101001022;
    new_Skin.AKM_Mag = 1010010231;
  }
  if (preferences.Config.Skin.AKM == 1) {
    new_Skin.AKM2 = 1101001248;
    new_Skin.AKM_Mag = 1010012444;
  }
  if (preferences.Config.Skin.AKM == 2) {
    new_Skin.AKM2 = 1101001102;
    new_Skin.AKM_Mag = 1010011031;
  }
  if (preferences.Config.Skin.AKM == 3) {
    new_Skin.AKM2 = 1101001115;
    new_Skin.AKM_Mag = 1010011161;
  }
  if (preferences.Config.Skin.AKM == 4) {
    new_Skin.AKM2 = 1101001127;
    new_Skin.AKM_Mag = 1010011281;
  }
  if (preferences.Config.Skin.AKM == 5) {
    new_Skin.AKM2 = 1101001142;
    new_Skin.AKM_Mag = 1010011431;
  }
  if (preferences.Config.Skin.AKM == 6) {
    new_Skin.AKM2 = 1101001153;
    new_Skin.AKM_Mag = 1010011541;
  }
  if (preferences.Config.Skin.AKM == 7) {
    new_Skin.AKM2 = 1101001173;
    new_Skin.AKM_Mag = 1010011741;
  }
  if (preferences.Config.Skin.AKM == 8) {
    new_Skin.AKM2 = 1101001212;
    new_Skin.AKM_Mag = 1010012131;
  }
  if (preferences.Config.Skin.AKM == 9) {
    new_Skin.AKM2 = 1101001230;
    new_Skin.AKM_Mag = 1010012311;
  }
  if (preferences.Config.Skin.AKM == 10) {
    new_Skin.AKM2 = 1101001241;
    new_Skin.AKM_Mag = 1010012421;
  }
if (preferences.Config.Skin.AKM == 11) {
    new_Skin.AKM2 = 1101001022;
    new_Skin.AKM_Mag = 1010010231;
  }
if (preferences.Config.Skin.AKM == 12) {
    new_Skin.AKM2 = 1101001062;
    new_Skin.AKM_Mag = 1010010571;
  }
if (preferences.Config.Skin.AKM == 13) {
    new_Skin.AKM2 = 1101001264;
    new_Skin.AKM_Mag = 1010012641;
}
  ////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.AKM == 0) {
    new_Skin.AKM3 = 1101001022;
    new_Skin.AKM_Mag = 1010010231;
  }
  if (preferences.Config.Skin.AKM == 1) {
    new_Skin.AKM3 = 1101001248;
    new_Skin.AKM_Mag = 1010012444;
  }
  if (preferences.Config.Skin.AKM == 2) {
    new_Skin.AKM3 = 1101001102;
    new_Skin.AKM_Mag = 1010011031;
  }
  if (preferences.Config.Skin.AKM == 3) {
    new_Skin.AKM3 = 1101001115;
    new_Skin.AKM_Mag = 1010011161;
  }
  if (preferences.Config.Skin.AKM == 4) {
    new_Skin.AKM3 = 1101001127;
    new_Skin.AKM_Mag = 1010011281;
  }
  if (preferences.Config.Skin.AKM == 5) {
    new_Skin.AKM3 = 1101001142;
    new_Skin.AKM_Mag = 1010011431;
  }
  if (preferences.Config.Skin.AKM == 6) {
    new_Skin.AKM3 = 1101001153;
    new_Skin.AKM_Mag = 1010011541;
  }
  if (preferences.Config.Skin.AKM == 7) {
    new_Skin.AKM3 = 1101001173;
    new_Skin.AKM_Mag = 1010011741;
  }
  if (preferences.Config.Skin.AKM == 8) {
    new_Skin.AKM3 = 1101001212;
    new_Skin.AKM_Mag = 1010012131;
  }
  if (preferences.Config.Skin.AKM == 9) {
    new_Skin.AKM3 = 1101001230;
    new_Skin.AKM_Mag = 1010012311;
  }
  if (preferences.Config.Skin.AKM == 10) {
    new_Skin.AKM3 = 1101001241;
    new_Skin.AKM_Mag = 1010012421;
  }
if (preferences.Config.Skin.AKM == 11) {
    new_Skin.AKM3 = 1101001022;
    new_Skin.AKM_Mag = 1010010231;
  }
if (preferences.Config.Skin.AKM == 12) {
    new_Skin.AKM3 = 1101001062;
    new_Skin.AKM_Mag = 1010010571;
  }
if (preferences.Config.Skin.AKM == 13) {
    new_Skin.AKM3 = 1101001264;
    new_Skin.AKM_Mag = 1010012641;
}
  ////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.AKM == 0) {
    new_Skin.AKM4 = 1101001022;
    new_Skin.AKM_Mag = 1010010231;
  }
  if (preferences.Config.Skin.AKM == 1) {
    new_Skin.AKM4 = 1101001248;
    new_Skin.AKM_Mag = 1010012444;
  }
  if (preferences.Config.Skin.AKM == 2) {
    new_Skin.AKM4 = 1101001102;
    new_Skin.AKM_Mag = 1010011031;
  }
  if (preferences.Config.Skin.AKM == 3) {
    new_Skin.AKM4 = 1101001115;
    new_Skin.AKM_Mag = 1010011161;
  }
  if (preferences.Config.Skin.AKM == 4) {
    new_Skin.AKM4 = 1101001127;
    new_Skin.AKM_Mag = 1010011281;
  }
  if (preferences.Config.Skin.AKM == 5) {
    new_Skin.AKM4 = 1101001142;
    new_Skin.AKM_Mag = 1010011431;
  }
  if (preferences.Config.Skin.AKM == 6) {
    new_Skin.AKM4 = 1101001153;
    new_Skin.AKM_Mag = 1010011541;
  }
  if (preferences.Config.Skin.AKM == 7) {
    new_Skin.AKM4 = 1101001173;
    new_Skin.AKM_Mag = 1010011741;
  }
  if (preferences.Config.Skin.AKM == 8) {
    new_Skin.AKM4 = 1101001212;
    new_Skin.AKM_Mag = 1010012131;
  }
  if (preferences.Config.Skin.AKM == 9) {
    new_Skin.AKM4 = 1101001230;
    new_Skin.AKM_Mag = 1010012311;
  }
  if (preferences.Config.Skin.AKM == 10) {
    new_Skin.AKM4 = 1101001241;
    new_Skin.AKM_Mag = 1010012421;
  }
if (preferences.Config.Skin.AKM == 11) {
    new_Skin.AKM4 = 1101001022;
    new_Skin.AKM_Mag = 1010010231;
  }
if (preferences.Config.Skin.AKM == 12) {
    new_Skin.AKM4 = 1101001062;
    new_Skin.AKM_Mag = 1010010571;
  }
if (preferences.Config.Skin.AKM == 13) {
    new_Skin.AKM4 = 1101001264;
    new_Skin.AKM_Mag = 1010012641;
} 
  ////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.AKM == 0) {
    new_Skin.AKM5 = 1101001022;
    new_Skin.AKM_Mag = 1010010231;
  }
  if (preferences.Config.Skin.AKM == 1) {
    new_Skin.AKM5 = 1101001248;
    new_Skin.AKM_Mag = 1010012444;
  }
  if (preferences.Config.Skin.AKM == 2) {
    new_Skin.AKM5 = 1101001102;
    new_Skin.AKM_Mag = 1010011031;
  }
  if (preferences.Config.Skin.AKM == 3) {
    new_Skin.AKM5 = 1101001115;
    new_Skin.AKM_Mag = 1010011161;
  }
  if (preferences.Config.Skin.AKM == 4) {
    new_Skin.AKM5 = 1101001127;
    new_Skin.AKM_Mag = 1010011281;
  }
  if (preferences.Config.Skin.AKM == 5) {
    new_Skin.AKM5 = 1101001142;
    new_Skin.AKM_Mag = 1010011431;
  }
  if (preferences.Config.Skin.AKM == 6) {
    new_Skin.AKM5 = 1101001153;
    new_Skin.AKM_Mag = 1010011541;
  }
  if (preferences.Config.Skin.AKM == 7) {
    new_Skin.AKM5 = 1101001173;
    new_Skin.AKM_Mag = 1010011741;
  }
  if (preferences.Config.Skin.AKM == 8) {
    new_Skin.AKM5 = 1101001212;
    new_Skin.AKM_Mag = 1010012131;
  }
  if (preferences.Config.Skin.AKM == 9) {
    new_Skin.AKM5 = 1101001230;
    new_Skin.AKM_Mag = 1010012311;
  }
  if (preferences.Config.Skin.AKM == 10) {
    new_Skin.AKM5 = 1101001241;
    new_Skin.AKM_Mag = 1010012421;
  }
if (preferences.Config.Skin.AKM == 11) {
    new_Skin.AKM5 = 1101001022;
    new_Skin.AKM_Mag = 1010010231;
  }
if (preferences.Config.Skin.AKM == 12) {
    new_Skin.AKM5 = 1101001062;
    new_Skin.AKM_Mag = 1010010571;
  }
if (preferences.Config.Skin.AKM == 13) {
    new_Skin.AKM5 = 1101001264;
    new_Skin.AKM_Mag = 1010012641;
}
  ////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.AKM == 0) {
    new_Skin.AKM6 = 1101001022;
    new_Skin.AKM_Mag = 1010010231;
  }
  if (preferences.Config.Skin.AKM == 1) {
    new_Skin.AKM6 = 1101001248;
    new_Skin.AKM_Mag = 1010012444;
  }
  if (preferences.Config.Skin.AKM == 2) {
    new_Skin.AKM6 = 1101001102;
    new_Skin.AKM_Mag = 1010011031;
  }
  if (preferences.Config.Skin.AKM == 3) {
    new_Skin.AKM6 = 1101001115;
    new_Skin.AKM_Mag = 1010011161;
  }
  if (preferences.Config.Skin.AKM == 4) {
    new_Skin.AKM6 = 1101001127;
    new_Skin.AKM_Mag = 1010011281;
  }
  if (preferences.Config.Skin.AKM == 5) {
    new_Skin.AKM6 = 1101001142;
    new_Skin.AKM_Mag = 1010011431;
  }
  if (preferences.Config.Skin.AKM == 6) {
    new_Skin.AKM6 = 1101001153;
    new_Skin.AKM_Mag = 1010011541;
  }
  if (preferences.Config.Skin.AKM == 7) {
    new_Skin.AKM6 = 1101001173;
    new_Skin.AKM_Mag = 1010011741;
  }
  if (preferences.Config.Skin.AKM == 8) {
    new_Skin.AKM6 = 1101001212;
    new_Skin.AKM_Mag = 1010012131;
  }
  if (preferences.Config.Skin.AKM == 9) {
    new_Skin.AKM6 = 1101001230;
    new_Skin.AKM_Mag = 1010012311;
  }
  if (preferences.Config.Skin.AKM == 10) {
    new_Skin.AKM6 = 1101001241;
    new_Skin.AKM_Mag = 1010012421;
  }
if (preferences.Config.Skin.AKM == 11) {
    new_Skin.AKM6 = 1101001022;
    new_Skin.AKM_Mag = 1010010231;
  }
if (preferences.Config.Skin.AKM == 12) {
    new_Skin.AKM6 = 1101001062;
    new_Skin.AKM_Mag = 1010010571;
  }
if (preferences.Config.Skin.AKM == 13) {
    new_Skin.AKM6 = 1101001264;
    new_Skin.AKM_Mag = 1010012641;
}
////////////////////////////////////////////////////////
//
  if (preferences.Config.Skin.M16A4 == 0) {
    new_Skin.M16A4 = 101002;
    new_Skin.M16A4_Stock = 205007;
    new_Skin.M16A4_Mag = 291002;
new_Skin.longyin_x1111 = 1030070218;
    new_Skin.longyin_x2222 = 1030070216;
    new_Skin.longyin_x3333 = 1030070215;
    new_Skin.longyin_x4444 = 1030070214;
    new_Skin.longyin_x6666 = 1030070213;
    new_Skin.longyin_x8888 = 1030070212;
  }
  if (preferences.Config.Skin.M16A4 == 1) {
    new_Skin.M16A4 = 1101002028;
    new_Skin.M16A4_Stock = 1010020292;
    new_Skin.M16A4_Mag = 1010020291;
  }
  if (preferences.Config.Skin.M16A4 == 2) {
    new_Skin.M16A4 = 1101002055;
    new_Skin.M16A4_Stock = 1010020562;
    new_Skin.M16A4_Mag = 1010020561;
  }
  if (preferences.Config.Skin.M16A4 == 3) {
    new_Skin.M16A4 = 1101002067;
    new_Skin.M16A4_Stock = 1010020682;
    new_Skin.M16A4_Mag = 1010020681;
  }
  if (preferences.Config.Skin.M16A4 == 4) {
    new_Skin.M16A4 = 1101002080;
    new_Skin.M16A4_Stock = 1010020812;
    new_Skin.M16A4_Mag = 1010020811;
  }
  if (preferences.Config.Skin.M16A4 == 5) {
    new_Skin.M16A4 = 1101002102;
    new_Skin.M16A4_Stock = 1010021032;
    new_Skin.M16A4_Mag = 1010021031;
  }
//1
if (preferences.Config.Skin.M16A4 == 0) {
    new_Skin.M16A41 = 101002;
    new_Skin.M16A4_Stock = 205007;
    new_Skin.M16A4_Mag = 291002;
  }
  if (preferences.Config.Skin.M16A4 == 1) {
    new_Skin.M16A41 = 1101002028;
    new_Skin.M16A4_Stock = 1010020292;
    new_Skin.M16A4_Mag = 1010020291;
  }
  if (preferences.Config.Skin.M16A4 == 2) {
    new_Skin.M16A41 = 1101002055;
    new_Skin.M16A4_Stock = 1010020562;
    new_Skin.M16A4_Mag = 1010020561;
  }
  if (preferences.Config.Skin.M16A4 == 3) {
    new_Skin.M16A41 = 1101002067;
    new_Skin.M16A4_Stock = 1010020682;
    new_Skin.M16A4_Mag = 1010020681;
  }
  if (preferences.Config.Skin.M16A4 == 4) {
    new_Skin.M16A41 = 1101002080;
    new_Skin.M16A4_Stock = 1010020812;
    new_Skin.M16A4_Mag = 1010020811;
  }
  if (preferences.Config.Skin.M16A4 == 5) {
    new_Skin.M16A41 = 1101002102;
    new_Skin.M16A4_Stock = 1010021032;
    new_Skin.M16A4_Mag = 1010021031;
  }
//
if (preferences.Config.Skin.M16A4 == 0) {
    new_Skin.M16A42 = 101002;
    new_Skin.M16A4_Stock = 205007;
    new_Skin.M16A4_Mag = 291002;
  }
  if (preferences.Config.Skin.M16A4 == 1) {
    new_Skin.M16A42 = 1101002028;
    new_Skin.M16A4_Stock = 1010020292;
    new_Skin.M16A4_Mag = 1010020291;
  }
  if (preferences.Config.Skin.M16A4 == 2) {
    new_Skin.M16A42 = 1101002055;
    new_Skin.M16A4_Stock = 1010020562;
    new_Skin.M16A4_Mag = 1010020561;
  }
  if (preferences.Config.Skin.M16A4 == 3) {
    new_Skin.M16A42 = 1101002067;
    new_Skin.M16A4_Stock = 1010020682;
    new_Skin.M16A4_Mag = 1010020681;
  }
  if (preferences.Config.Skin.M16A4 == 4) {
    new_Skin.M16A42 = 1101002080;
    new_Skin.M16A4_Stock = 1010020812;
    new_Skin.M16A4_Mag = 1010020811;
  }
  if (preferences.Config.Skin.M16A4 == 5) {
    new_Skin.M16A42 = 1101002102;
    new_Skin.M16A4_Stock = 1010021032;
    new_Skin.M16A4_Mag = 1010021031;
  }
//
if (preferences.Config.Skin.M16A4 == 0) {
    new_Skin.M16A43 = 101002;
    new_Skin.M16A4_Stock = 205007;
    new_Skin.M16A4_Mag = 291002;
  }
  if (preferences.Config.Skin.M16A4 == 1) {
    new_Skin.M16A43 = 1101002028;
    new_Skin.M16A4_Stock = 1010020292;
    new_Skin.M16A4_Mag = 1010020291;
  }
  if (preferences.Config.Skin.M16A4 == 2) {
    new_Skin.M16A43 = 1101002055;
    new_Skin.M16A4_Stock = 1010020562;
    new_Skin.M16A4_Mag = 1010020561;
  }
  if (preferences.Config.Skin.M16A4 == 3) {
    new_Skin.M16A43 = 1101002067;
    new_Skin.M16A4_Stock = 1010020682;
    new_Skin.M16A4_Mag = 1010020681;
  }
  if (preferences.Config.Skin.M16A4 == 4) {
    new_Skin.M16A43 = 1101002080;
    new_Skin.M16A4_Stock = 1010020812;
    new_Skin.M16A4_Mag = 1010020811;
  }
  if (preferences.Config.Skin.M16A4 == 5) {
    new_Skin.M16A43 = 1101002102;
    new_Skin.M16A4_Stock = 1010021032;
    new_Skin.M16A4_Mag = 1010021031;
  }
//
if (preferences.Config.Skin.M16A4 == 0) {
    new_Skin.M16A44 = 101002;
    new_Skin.M16A4_Stock = 205007;
    new_Skin.M16A4_Mag = 291002;
  }
  if (preferences.Config.Skin.M16A4 == 1) {
    new_Skin.M16A44 = 1101002028;
    new_Skin.M16A4_Stock = 1010020292;
    new_Skin.M16A4_Mag = 1010020291;
  }
  if (preferences.Config.Skin.M16A4 == 2) {
    new_Skin.M16A44 = 1101002055;
    new_Skin.M16A4_Stock = 1010020562;
    new_Skin.M16A4_Mag = 1010020561;
  }
  if (preferences.Config.Skin.M16A4 == 3) {
    new_Skin.M16A44 = 1101002067;
    new_Skin.M16A4_Stock = 1010020682;
    new_Skin.M16A4_Mag = 1010020681;
  }
  if (preferences.Config.Skin.M16A4 == 4) {
    new_Skin.M16A44 = 1101002080;
    new_Skin.M16A4_Stock = 1010020812;
    new_Skin.M16A4_Mag = 1010020811;
  }
  if (preferences.Config.Skin.M16A4 == 5) {
    new_Skin.M16A44 = 1101002102;
    new_Skin.M16A4_Stock = 1010021032;
    new_Skin.M16A4_Mag = 1010021031;
  }
if (preferences.Config.Skin.M16A4 == 0) {
    new_Skin.M16A45 = 101002;
    new_Skin.M16A4_Stock = 205007;
    new_Skin.M16A4_Mag = 291002;
  }
  if (preferences.Config.Skin.M16A4 == 1) {
    new_Skin.M16A45 = 1101002028;
    new_Skin.M16A4_Stock = 1010020292;
    new_Skin.M16A4_Mag = 1010020291;
  }
  if (preferences.Config.Skin.M16A4 == 2) {
    new_Skin.M16A45 = 1101002055;
    new_Skin.M16A4_Stock = 1010020562;
    new_Skin.M16A4_Mag = 1010020561;
  }
  if (preferences.Config.Skin.M16A4 == 3) {
    new_Skin.M16A45 = 1101002067;
    new_Skin.M16A4_Stock = 1010020682;
    new_Skin.M16A4_Mag = 1010020681;
  }
  if (preferences.Config.Skin.M16A4 == 4) {
    new_Skin.M16A45 = 1101002080;
    new_Skin.M16A4_Stock = 1010020812;
    new_Skin.M16A4_Mag = 1010020811;
  }
  if (preferences.Config.Skin.M16A4 == 5) {
    new_Skin.M16A45 = 1101002102;
    new_Skin.M16A4_Stock = 1010021032;
    new_Skin.M16A4_Mag = 1010021031;
  }
if (preferences.Config.Skin.M16A4 == 0) {
    new_Skin.M16A46 = 101002;
    new_Skin.M16A4_Stock = 205007;
    new_Skin.M16A4_Mag = 291002;
  }
  if (preferences.Config.Skin.M16A4 == 1) {
    new_Skin.M16A46 = 1101002028;
    new_Skin.M16A4_Stock = 1010020292;
    new_Skin.M16A4_Mag = 1010020291;
  }
  if (preferences.Config.Skin.M16A4 == 2) {
    new_Skin.M16A46 = 1101002055;
    new_Skin.M16A4_Stock = 1010020562;
    new_Skin.M16A4_Mag = 1010020561;
  }
  if (preferences.Config.Skin.M16A4 == 3) {
    new_Skin.M16A46 = 1101002067;
    new_Skin.M16A4_Stock = 1010020682;
    new_Skin.M16A4_Mag = 1010020681;
  }
  if (preferences.Config.Skin.M16A4 == 4) {
    new_Skin.M16A46 = 1101002080;
    new_Skin.M16A4_Stock = 1010020812;
    new_Skin.M16A4_Mag = 1010020811;
  }
  if (preferences.Config.Skin.M16A4 == 5) {
    new_Skin.M16A46 = 1101002102;
    new_Skin.M16A4_Stock = 1010021032;
    new_Skin.M16A4_Mag = 1010021031;
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  if (preferences.Config.Skin.MK14 == 0) {
    new_Skin.MK145 = 1030075;//默认精致
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
    new_Skin.MK145 = 1103007027;//精致龙吟
    new_Skin.MK149 = 1103007027;//精致龙吟
    //FatalDamageParameter->CauserWeaponAvatarID = 1103007027;//killmsg
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
///////////////////////////////////////////////////////////////////////////////////////////
if (preferences.Config.Skin.MK14 == 2) {
    new_Skin.MK14 = 1103002155;//夜影晨曦1103002156
    
  }
  if (preferences.Config.Skin.MK14 == 3) {
    new_Skin.MK14 = 1103002135;//骄阳辉月1103002136
  
  }

if (preferences.Config.Skin.MK14 == 2) {
    new_Skin.MK146 = 1103002155;//夜影晨曦1103002156
    
  }
  if (preferences.Config.Skin.MK14 == 3) {
    new_Skin.MK146 = 1103002135;//骄阳辉月1103002136
  
  }

if (preferences.Config.Skin.MK14 == 2) {
    new_Skin.MK147 = 1103002155;//夜影晨曦1103002156
    
  }
  if (preferences.Config.Skin.MK14 == 3) {
    new_Skin.MK147 = 1103002135;//骄阳辉月1103002136
  
  }
if (preferences.Config.Skin.MK14 == 2) {
    new_Skin.MK148 = 1103002155;//夜影晨曦1103002156
    
  }
  if (preferences.Config.Skin.MK14 == 3) {
    new_Skin.MK148 = 1103002135;//骄阳辉月1103002136
  
  }
if (preferences.Config.Skin.MK14 == 2) {
    new_Skin.MK149 = 1103002155;//夜影晨曦1103002156
    
  }
  if (preferences.Config.Skin.MK14 == 3) {
    new_Skin.MK149 = 1103002135;//骄阳辉月1103002136
  
  }
if (preferences.Config.Skin.MK14 == 2) {
    new_Skin.MK140 = 1103002155;//夜影晨曦1103002156
    
  }
  if (preferences.Config.Skin.MK14 == 3) {
    new_Skin.MK140 = 1103002135;//骄阳辉月1103002136
  
  }
if (preferences.Config.Skin.MK14 == 2) {
    new_Skin.MK145 = 1103002155;//夜影晨曦1103002156
    
  }
  if (preferences.Config.Skin.MK14 == 3) {
    new_Skin.MK145 = 1103002135;//骄阳辉月1103002136
  
  }
//////////////////////////////////////////////////////////////////////////////
if (preferences.Config.Skin.MK14 == 4) {
    new_Skin.MK145 = 1103003061;//AWM
}
if (preferences.Config.Skin.MK14 == 5) {
    new_Skin.MK145 = 1103003041;//AWM
}
if (preferences.Config.Skin.MK14 == 6) {
    new_Skin.MK145 = 1103003086;//AWM
}

if (preferences.Config.Skin.MK14 == 7) {
    new_Skin.MK145 = 1101001264;//沙子身影akm
}
if (preferences.Config.Skin.MK14 == 8) {
    new_Skin.MK145 = 1101004061;//红莲哥斯拉狗杂
}

if (preferences.Config.Skin.MK14 == 0) {
    new_Skin.MK145 = 1030075;//默认精致
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
    new_Skin.MK147 = 1103007027;//精致龙吟
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

if (preferences.Config.Skin.MK14 == 4) {
    new_Skin.MK147 = 1103003061;//AWM
}
if (preferences.Config.Skin.MK14 == 5) {
    new_Skin.MK147 = 1103003041;//AWM
}
if (preferences.Config.Skin.MK14 == 6) {
    new_Skin.MK147 = 1103003086;//AWM
}

if (preferences.Config.Skin.MK14 == 7) {
    new_Skin.MK147 = 1101001264;//沙子身影akm
}
if (preferences.Config.Skin.MK14 == 8) {
    new_Skin.MK147 = 1101004061;//红莲哥斯拉狗杂
}

if (preferences.Config.Skin.MK14 == 0) {
    new_Skin.MK148 = 1030075;//默认精致
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
    new_Skin.MK148 = 1103007027;//精致龙吟
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
 
if (preferences.Config.Skin.MK14 == 4) {
    new_Skin.MK148 = 1103003061;//AWM
}
if (preferences.Config.Skin.MK14 == 5) {
    new_Skin.MK148 = 1103003041;//AWM
}
if (preferences.Config.Skin.MK14 == 6) {
    new_Skin.MK148 = 1103003086;//AWM
}

if (preferences.Config.Skin.MK14 == 7) {
    new_Skin.MK148 = 1101001264;//沙子身影akm
}
if (preferences.Config.Skin.MK14 == 8) {
    new_Skin.MK148 = 1101004061;//红莲哥斯拉狗杂
}

if (preferences.Config.Skin.MK14 == 0) {
    new_Skin.MK149 = 1030075;//默认精致
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
    new_Skin.MK149 = 1103007027;//精致龙吟
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
  
if (preferences.Config.Skin.MK14 == 4) {
    new_Skin.MK149 = 1103003061;//AWM
}
if (preferences.Config.Skin.MK14 == 5) {
    new_Skin.MK149 = 1103003041;//AWM
}
if (preferences.Config.Skin.MK14 == 6) {
    new_Skin.MK149 = 1103003086;//AWM
}

if (preferences.Config.Skin.MK14 == 7) {
    new_Skin.MK149 = 1101001264;//沙子身影akm
}
if (preferences.Config.Skin.MK14 == 8) {
    new_Skin.MK149 = 1101004061;//红莲哥斯拉狗杂
}

if (preferences.Config.Skin.MK14 == 0) {
    new_Skin.MK140 = 1030075;//默认精致
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
    new_Skin.MK140 = 1103007027;//精致龙吟
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
  
if (preferences.Config.Skin.MK14 == 4) {
    new_Skin.MK140 = 1103003061;//AWM
}
if (preferences.Config.Skin.MK14 == 5) {
    new_Skin.MK140 = 1103003041;//AWM
}
if (preferences.Config.Skin.MK14 == 6) {
    new_Skin.MK140 = 1103003086;//AWM
}

if (preferences.Config.Skin.MK14 == 7) {
    new_Skin.MK140 = 1101001264;//沙子身影akm
}
if (preferences.Config.Skin.MK14 == 8) {
    new_Skin.MK140 = 1101005097;//红莲哥斯拉狗杂
}

if (preferences.Config.Skin.MK14 == 0) {
    new_Skin.MK14 = 1030075;//默认精致
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
    new_Skin.MK14 = 1103007027;//精致龙吟
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
  
if (preferences.Config.Skin.MK14 == 4) {
    new_Skin.MK14 = 1103003061;//AWM
}
if (preferences.Config.Skin.MK14 == 5) {
    new_Skin.MK14 = 1103003041;//AWM
}
if (preferences.Config.Skin.MK14 == 6) {
    new_Skin.MK14 = 1103003086;//AWM
}

if (preferences.Config.Skin.MK14 == 7) {
    new_Skin.MK14 = 1101001264;//沙子身影akm
}
if (preferences.Config.Skin.MK14 == 8) {
    new_Skin.MK14 = 1101005097;//红莲哥斯拉狗杂
}

if (preferences.Config.Skin.MK14 == 0) {
    new_Skin.MK146 = 1030075;//默认精致
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
    new_Skin.MK146 = 1103007027;//精致龙吟
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
  
if (preferences.Config.Skin.MK14 == 4) {
    new_Skin.MK146 = 1103003061;//AWM
}
if (preferences.Config.Skin.MK14 == 5) {
    new_Skin.MK146 = 1103003041;//AWM
}
if (preferences.Config.Skin.MK14 == 6) {
    new_Skin.MK146 = 1103003086;//AWM
}

if (preferences.Config.Skin.MK14 == 7) {
    new_Skin.MK146 = 1101001264;//沙子身影akm
}
if (preferences.Config.Skin.MK14 == 8) {
    new_Skin.MK146 = 1101005097;//红莲哥斯拉狗杂
}

/*
if (preferences.Config.Skin.MK14 == 0) {
    new_Skin.MK14666 = 1030075;//默认精致
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
    new_Skin.MK14666 = 1103007027;//精致龙吟
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
  
if (preferences.Config.Skin.MK14 == 4) {
    new_Skin.MK14666 = 1103003061;//AWM
}
if (preferences.Config.Skin.MK14 == 5) {
    new_Skin.MK14666 = 1103003041;//AWM
}
if (preferences.Config.Skin.MK14 == 6) {
    new_Skin.MK14666 = 1103003086;//AWM
}

if (preferences.Config.Skin.MK14 == 7) {
    new_Skin.MK14666 = 1101001264;//沙子身影akm
}
if (preferences.Config.Skin.MK14 == 8) {
    new_Skin.MK14666 = 1101005097;//红莲哥斯拉狗杂
}*/

//////////////////////////////////////////////////////////////////////////////////////////
if (preferences.Config.Skin.MG3 == 5) {
new_Skin.mg32 = 1103002155;//夜影晨曦1103002156
}
if (preferences.Config.Skin.MG3 == 6) {
new_Skin.mg32 = 1103002135;//骄阳辉月1103002136
}

if (preferences.Config.Skin.MG3 == 5) {
new_Skin.mg32 = 1103002155;//夜影晨曦1103002156
}
if (preferences.Config.Skin.MG3 == 6) {
new_Skin.mg32 = 1103002135;//骄阳辉月1103002136
}

if (preferences.Config.Skin.MG3 == 5) {
new_Skin.mg34 = 1103002155;//夜影晨曦1103002156
}
if (preferences.Config.Skin.MG3 == 6) {
new_Skin.mg34 = 1103002135;//骄阳辉月1103002136
}

if (preferences.Config.Skin.MG3 == 5) {
new_Skin.mg35 = 1103002155;//夜影晨曦1103002156
}
if (preferences.Config.Skin.MG3 == 6) {
new_Skin.mg35 = 1103002135;//骄阳辉月1103002136
}

if (preferences.Config.Skin.MG3 == 5) {
new_Skin.mg35 = 1103002155;//夜影晨曦1103002156
}
if (preferences.Config.Skin.MG3 == 6) {
new_Skin.mg35 = 1103002135;//骄阳辉月1103002136
}

  if (preferences.Config.Skin.MG3 == 0) {
    new_Skin.mg31 = 1050106;//经典g3 295007
    new_Skin.mg3_mag = 295007;    
    new_Skin.mg3_x6 = 203015;
    new_Skin.mg3_x1 = 203001;
    new_Skin.mg3_x2 = 203003;
    new_Skin.mg3_x3 = 203014;
    new_Skin.mg3_x4 = 203004;    
    new_Skin.mg3_holo = 203002;
  }
  if (preferences.Config.Skin.MG3 == 1) {
    new_Skin.mg31 = 1105010007;//苍龙
    new_Skin.mg3_mag = 295007;
    new_Skin.mg3_x6 = 203015;
    new_Skin.mg3_x1 = 203001;
    new_Skin.mg3_x2 = 203003;
    new_Skin.mg3_x3 = 203014;
    new_Skin.mg3_x4 = 203004;    
    new_Skin.mg3_holo = 203002;    
  }
  if (preferences.Config.Skin.MG3 == 2) {
    new_Skin.mg31 = 1105010018;//风铃
    new_Skin.mg3_x1 = 1050100144;
    new_Skin.mg3_mag = 1050100137;
    new_Skin.mg3_x6 = 1050100138;
    new_Skin.mg3_x2 = 1050100142;
    new_Skin.mg3_x3 = 1050100141;
    new_Skin.mg3_x4 = 1050100139;    
    new_Skin.mg3_holo = 1050100143;    
  }
if (preferences.Config.Skin.MG3 == 3) {
    new_Skin.mg31 = 1103003061;//AWM
    new_Skin.mg3_mag = 295007;
    new_Skin.mg3_x6 = 203015;
    new_Skin.mg3_x1 = 203001;
    new_Skin.mg3_x2 = 203003;
    new_Skin.mg3_x3 = 203014;
    new_Skin.mg3_x4 = 203004;    
    new_Skin.mg3_holo = 203002;
  }
if (preferences.Config.Skin.MG3 == 4) {
    new_Skin.mg31 = 1103003041;//AWM
    new_Skin.mg3_mag = 295007;
    new_Skin.mg3_x6 = 203015;
    new_Skin.mg3_x1 = 203001;
    new_Skin.mg3_x2 = 203003;
    new_Skin.mg3_x3 = 203014;
    new_Skin.mg3_x4 = 203004;    
    new_Skin.mg3_holo = 203002;
  }

if (preferences.Config.Skin.MG3 == 0) {
    new_Skin.mg32 = 1050106;//经典g3 295007
    new_Skin.mg3_mag = 295007;    
    new_Skin.mg3_x6 = 203015;
    new_Skin.mg3_x1 = 203001;
    new_Skin.mg3_x2 = 203003;
    new_Skin.mg3_x3 = 203014;
    new_Skin.mg3_x4 = 203004;    
    new_Skin.mg3_holo = 203002;
  }
  if (preferences.Config.Skin.MG3 == 1) {
    new_Skin.mg32 = 1105010007;//苍龙
    new_Skin.mg3_mag = 295007;
    new_Skin.mg3_x6 = 203015;
    new_Skin.mg3_x1 = 203001;
    new_Skin.mg3_x2 = 203003;
    new_Skin.mg3_x3 = 203014;
    new_Skin.mg3_x4 = 203004;    
    new_Skin.mg3_holo = 203002;    
  }
  if (preferences.Config.Skin.MG3 == 2) {
    new_Skin.mg32 = 1105010018;//风铃
    new_Skin.mg3_x1 = 1050100144;
    new_Skin.mg3_mag = 1050100137;
    new_Skin.mg3_x6 = 1050100138;
    new_Skin.mg3_x2 = 1050100142;
    new_Skin.mg3_x3 = 1050100141;
    new_Skin.mg3_x4 = 1050100139;    
    new_Skin.mg3_holo = 1050100143;    
  }
if (preferences.Config.Skin.MG3 == 3) {
    new_Skin.mg32 = 1103003061;//AWM
    new_Skin.mg3_mag = 295007;
    new_Skin.mg3_x6 = 203015;
    new_Skin.mg3_x1 = 203001;
    new_Skin.mg3_x2 = 203003;
    new_Skin.mg3_x3 = 203014;
    new_Skin.mg3_x4 = 203004;    
    new_Skin.mg3_holo = 203002;
  }
if (preferences.Config.Skin.MG3 == 4) {
    new_Skin.mg32 = 1103003041;//AWM
    new_Skin.mg3_mag = 295007;
    new_Skin.mg3_x6 = 203015;
    new_Skin.mg3_x1 = 203001;
    new_Skin.mg3_x2 = 203003;
    new_Skin.mg3_x3 = 203014;
    new_Skin.mg3_x4 = 203004;    
    new_Skin.mg3_holo = 203002;
  }
//
if (preferences.Config.Skin.MG3 == 0) {
    new_Skin.mg33 = 1050106;//经典g3 295007
    new_Skin.mg3_mag = 295007;    
    new_Skin.mg3_x6 = 203015;
    new_Skin.mg3_x1 = 203001;
    new_Skin.mg3_x2 = 203003;
    new_Skin.mg3_x3 = 203014;
    new_Skin.mg3_x4 = 203004;    
    new_Skin.mg3_holo = 203002;
  }
  if (preferences.Config.Skin.MG3 == 1) {
    new_Skin.mg33 = 1105010007;//苍龙
    new_Skin.mg3_mag = 295007;
    new_Skin.mg3_x6 = 203015;
    new_Skin.mg3_x1 = 203001;
    new_Skin.mg3_x2 = 203003;
    new_Skin.mg3_x3 = 203014;
    new_Skin.mg3_x4 = 203004;    
    new_Skin.mg3_holo = 203002;    
  }
  if (preferences.Config.Skin.MG3 == 2) {
    new_Skin.mg33 = 1105010018;//风铃
    new_Skin.mg3_x1 = 1050100144;
    new_Skin.mg3_mag = 1050100137;
    new_Skin.mg3_x6 = 1050100138;
    new_Skin.mg3_x2 = 1050100142;
    new_Skin.mg3_x3 = 1050100141;
    new_Skin.mg3_x4 = 1050100139;    
    new_Skin.mg3_holo = 1050100143;    
  }
if (preferences.Config.Skin.MG3 == 3) {
    new_Skin.mg33 = 1103003061;//AWM
    new_Skin.mg3_mag = 295007;
    new_Skin.mg3_x6 = 203015;
    new_Skin.mg3_x1 = 203001;
    new_Skin.mg3_x2 = 203003;
    new_Skin.mg3_x3 = 203014;
    new_Skin.mg3_x4 = 203004;    
    new_Skin.mg3_holo = 203002;
  }
if (preferences.Config.Skin.MG3 == 4) {
    new_Skin.mg33 = 1103003041;//AWM
    new_Skin.mg3_mag = 295007;
    new_Skin.mg3_x6 = 203015;
    new_Skin.mg3_x1 = 203001;
    new_Skin.mg3_x2 = 203003;
    new_Skin.mg3_x3 = 203014;
    new_Skin.mg3_x4 = 203004;    
    new_Skin.mg3_holo = 203002;
  }
//
if (preferences.Config.Skin.MG3 == 0) {
    new_Skin.mg34 = 1050106;//经典g3 295007
    new_Skin.mg3_mag = 295007;    
    new_Skin.mg3_x6 = 203015;
    new_Skin.mg3_x1 = 203001;
    new_Skin.mg3_x2 = 203003;
    new_Skin.mg3_x3 = 203014;
    new_Skin.mg3_x4 = 203004;    
    new_Skin.mg3_holo = 203002;
  }
  if (preferences.Config.Skin.MG3 == 1) {
    new_Skin.mg34 = 1105010007;//苍龙
    new_Skin.mg3_mag = 295007;
    new_Skin.mg3_x6 = 203015;
    new_Skin.mg3_x1 = 203001;
    new_Skin.mg3_x2 = 203003;
    new_Skin.mg3_x3 = 203014;
    new_Skin.mg3_x4 = 203004;    
    new_Skin.mg3_holo = 203002;    
  }
  if (preferences.Config.Skin.MG3 == 2) {
    new_Skin.mg34 = 1105010018;//风铃
    new_Skin.mg3_x1 = 1050100144;
    new_Skin.mg3_mag = 1050100137;
    new_Skin.mg3_x6 = 1050100138;
    new_Skin.mg3_x2 = 1050100142;
    new_Skin.mg3_x3 = 1050100141;
    new_Skin.mg3_x4 = 1050100139;    
    new_Skin.mg3_holo = 1050100143;    
  }
if (preferences.Config.Skin.MG3 == 3) {
    new_Skin.mg34 = 1103003061;//AWM
    new_Skin.mg3_mag = 295007;
    new_Skin.mg3_x6 = 203015;
    new_Skin.mg3_x1 = 203001;
    new_Skin.mg3_x2 = 203003;
    new_Skin.mg3_x3 = 203014;
    new_Skin.mg3_x4 = 203004;    
    new_Skin.mg3_holo = 203002;
  }
if (preferences.Config.Skin.MG3 == 4) {
    new_Skin.mg34 = 1103003041;//AWM
    new_Skin.mg3_mag = 295007;
    new_Skin.mg3_x6 = 203015;
    new_Skin.mg3_x1 = 203001;
    new_Skin.mg3_x2 = 203003;
    new_Skin.mg3_x3 = 203014;
    new_Skin.mg3_x4 = 203004;    
    new_Skin.mg3_holo = 203002;
  }
//
if (preferences.Config.Skin.MG3 == 0) {
    new_Skin.mg35 = 1050106;//经典g3 295007
    new_Skin.mg3_mag = 295007;    
    new_Skin.mg3_x6 = 203015;
    new_Skin.mg3_x1 = 203001;
    new_Skin.mg3_x2 = 203003;
    new_Skin.mg3_x3 = 203014;
    new_Skin.mg3_x4 = 203004;    
    new_Skin.mg3_holo = 203002;
  }
  if (preferences.Config.Skin.MG3 == 1) {
    new_Skin.mg35 = 1105010007;//苍龙
    new_Skin.mg3_mag = 295007;
    new_Skin.mg3_x6 = 203015;
    new_Skin.mg3_x1 = 203001;
    new_Skin.mg3_x2 = 203003;
    new_Skin.mg3_x3 = 203014;
    new_Skin.mg3_x4 = 203004;    
    new_Skin.mg3_holo = 203002;    
  }
  if (preferences.Config.Skin.MG3 == 2) {
    new_Skin.mg35 = 1105010018;//风铃
    new_Skin.mg3_x1 = 1050100144;
    new_Skin.mg3_mag = 1050100137;
    new_Skin.mg3_x6 = 1050100138;
    new_Skin.mg3_x2 = 1050100142;
    new_Skin.mg3_x3 = 1050100141;
    new_Skin.mg3_x4 = 1050100139;    
    new_Skin.mg3_holo = 1050100143;    
  }
if (preferences.Config.Skin.MG3 == 3) {
    new_Skin.mg35 = 1103003061;//AWM
    new_Skin.mg3_mag = 295007;
    new_Skin.mg3_x6 = 203015;
    new_Skin.mg3_x1 = 203001;
    new_Skin.mg3_x2 = 203003;
    new_Skin.mg3_x3 = 203014;
    new_Skin.mg3_x4 = 203004;    
    new_Skin.mg3_holo = 203002;
  }
if (preferences.Config.Skin.MG3 == 4) {
    new_Skin.mg35 = 1103003041;//AWM
    new_Skin.mg3_mag = 295007;
    new_Skin.mg3_x6 = 203015;
    new_Skin.mg3_x1 = 203001;
    new_Skin.mg3_x2 = 203003;
    new_Skin.mg3_x3 = 203014;
    new_Skin.mg3_x4 = 203004;    
    new_Skin.mg3_holo = 203002;
  }

if (preferences.Config.Skin.MG3 == 0) {
    new_Skin.mg36 = 1050106;//经典g3 295007
    new_Skin.mg3_mag = 295007;    
    new_Skin.mg3_x6 = 203015;
    new_Skin.mg3_x1 = 203001;
    new_Skin.mg3_x2 = 203003;
    new_Skin.mg3_x3 = 203014;
    new_Skin.mg3_x4 = 203004;    
    new_Skin.mg3_holo = 203002;
  }
  if (preferences.Config.Skin.MG3 == 1) {
    new_Skin.mg36 = 1105010007;//苍龙
    new_Skin.mg3_mag = 295007;
    new_Skin.mg3_x6 = 203015;
    new_Skin.mg3_x1 = 203001;
    new_Skin.mg3_x2 = 203003;
    new_Skin.mg3_x3 = 203014;
    new_Skin.mg3_x4 = 203004;    
    new_Skin.mg3_holo = 203002;    
  }
  if (preferences.Config.Skin.MG3 == 2) {
    new_Skin.mg36 = 1105010018;//风铃
    new_Skin.mg3_x1 = 1050100144;
    new_Skin.mg3_mag = 1050100137;
    new_Skin.mg3_x6 = 1050100138;
    new_Skin.mg3_x2 = 1050100142;
    new_Skin.mg3_x3 = 1050100141;
    new_Skin.mg3_x4 = 1050100139;    
    new_Skin.mg3_holo = 1050100143;    
  }
if (preferences.Config.Skin.MG3 == 3) {
    new_Skin.mg36 = 1103003061;//AWM
    new_Skin.mg3_mag = 295007;
    new_Skin.mg3_x6 = 203015;
    new_Skin.mg3_x1 = 203001;
    new_Skin.mg3_x2 = 203003;
    new_Skin.mg3_x3 = 203014;
    new_Skin.mg3_x4 = 203004;    
    new_Skin.mg3_holo = 203002;
  }
if (preferences.Config.Skin.MG3 == 4) {
    new_Skin.mg36 = 1103003041;//AWM
    new_Skin.mg3_mag = 295007;
    new_Skin.mg3_x6 = 203015;
    new_Skin.mg3_x1 = 203001;
    new_Skin.mg3_x2 = 203003;
    new_Skin.mg3_x3 = 203014;
    new_Skin.mg3_x4 = 203004;    
    new_Skin.mg3_holo = 203002;
  }
  
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (new_Skin.P90 == 0)
    new_Skin.P90 = 102105;
  if (preferences.Config.Skin.P90 == 1)
    new_Skin.P90 = 1102105011;
if (preferences.Config.Skin.P90 == 2)
    new_Skin.P90 = 1102105001;
//1
  if (new_Skin.P90 == 0)
    new_Skin.P901 = 102105;
  if (preferences.Config.Skin.P90 == 1)
    new_Skin.P901 = 1102105011;
if (preferences.Config.Skin.P90 == 2)
    new_Skin.P901 = 1102105001;
//2
if (new_Skin.P90 == 0)
    new_Skin.P90 = 102105;
  if (preferences.Config.Skin.P90 == 1)
    new_Skin.P902 = 1102105011;
if (preferences.Config.Skin.P90 == 2)
    new_Skin.P902 = 1102105001;
//
if (new_Skin.P90 == 0)
    new_Skin.P903 = 102105;
  if (preferences.Config.Skin.P90 == 1)
    new_Skin.P903 = 1102105011;
if (preferences.Config.Skin.P90 == 2)
    new_Skin.P903 = 1102105001;
//
if (new_Skin.P90 == 0)
    new_Skin.P904 = 102105;
  if (preferences.Config.Skin.P90 == 1)
    new_Skin.P904 = 1102105011;
if (preferences.Config.Skin.P90 == 2)
    new_Skin.P904 = 1102105001;
//
if (new_Skin.P90 == 0)
    new_Skin.P905 = 102105;
  if (preferences.Config.Skin.P90 == 1)
    new_Skin.P905 = 1102105011;
if (preferences.Config.Skin.P90 == 2)
    new_Skin.P905 = 1102105001;
//
if (new_Skin.P90 == 0)
    new_Skin.P906 = 102105;
  if (preferences.Config.Skin.P90 == 1)
    new_Skin.P906 = 1102105011;
if (preferences.Config.Skin.P90 == 2)
    new_Skin.P906 = 1102105001;
//
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.MG3 == 0) {
    new_Skin.MG3 = 105010;
    new_Skin.mg3_mag = 295007;
    new_Skin.mg3_x6 = 203015;
    new_Skin.mg3_x1 = 203001;
    new_Skin.mg3_x2 = 203003;
    new_Skin.mg3_x3 = 203014;
    new_Skin.mg3_x4 = 203004;    
    new_Skin.mg3_holo = 203002;
  }
  if (preferences.Config.Skin.MG3 == 1) {
    new_Skin.MG3 = 1105010007;
    new_Skin.mg3_mag = 295007;
    new_Skin.mg3_x6 = 203015;
    new_Skin.mg3_x1 = 203001;
    new_Skin.mg3_x2 = 203003;
    new_Skin.mg3_x3 = 203014;
    new_Skin.mg3_x4 = 203004;    
    new_Skin.mg3_holo = 203002;
  }
  if (preferences.Config.Skin.MG3 == 2) {
    new_Skin.MG3 = 1105010018;
    new_Skin.mg3_x1 = 1050100144;
    new_Skin.mg3_mag = 1050100137;
    new_Skin.mg3_x6 = 1050100138;
    new_Skin.mg3_x2 = 1050100142;
    new_Skin.mg3_x3 = 1050100141;
    new_Skin.mg3_x4 = 1050100139;    
    new_Skin.mg3_holo = 1050100143;
  }
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  if (preferences.Config.Skin.Scar == 0) {
    new_Skin.Scar = 101003;
    new_Skin.Scar_Mag = 291003;
new_Skin.longyin_x1111 = 1030070218;
    new_Skin.longyin_x2222 = 1030070216;
    new_Skin.longyin_x3333 = 1030070215;
    new_Skin.longyin_x4444 = 1030070214;
    new_Skin.longyin_x6666 = 1030070213;
    new_Skin.longyin_x8888 = 1030070212;
  }
  if (preferences.Config.Skin.Scar == 1) {
    new_Skin.Scar = 1101003194;
    new_Skin.Scar_Mag = 1010031897;
  }
  if (preferences.Config.Skin.Scar == 2) {
    new_Skin.Scar = 1101003056;
    new_Skin.Scar_Mag = 1010030571;
  }
  if (preferences.Config.Skin.Scar == 3) {
    new_Skin.Scar = 1101003069;
    new_Skin.Scar_Mag = 1010030701;
  }
  if (preferences.Config.Skin.Scar == 4) {
    new_Skin.Scar = 1101003079;
    new_Skin.Scar_Mag = 1010030801;
  }
  if (preferences.Config.Skin.Scar == 5) {
    new_Skin.Scar = 1101003118;
    new_Skin.Scar_Mag = 1010031191;
  }
  if (preferences.Config.Skin.Scar == 6) {
    new_Skin.Scar = 1101003145;
    new_Skin.Scar_Mag = 1010031461;
  }
  if (preferences.Config.Skin.Scar == 7) {
    new_Skin.Scar = 1101003166;
    new_Skin.Scar_Mag = 1010031671;
  }
  if (preferences.Config.Skin.Scar == 8) {
    new_Skin.Scar = 1101003180;
    new_Skin.Scar_Mag = 1010031811;
  }
if (preferences.Config.Skin.Scar == 9) {
    new_Skin.Scar = 1101003207;
    new_Skin.Scar_Mag = 1010032071;
  }
//
if (preferences.Config.Skin.Scar == 0) {
    new_Skin.Scar1 = 101003;
    new_Skin.Scar_Mag = 291003;
  }
  if (preferences.Config.Skin.Scar == 1) {
    new_Skin.Scar1 = 1101003194;
    new_Skin.Scar_Mag = 1010031897;
  }
  if (preferences.Config.Skin.Scar == 2) {
    new_Skin.Scar1 = 1101003056;
    new_Skin.Scar_Mag = 1010030571;
  }
  if (preferences.Config.Skin.Scar == 3) {
    new_Skin.Scar1 = 1101003069;
    new_Skin.Scar_Mag = 1010030701;
  }
  if (preferences.Config.Skin.Scar == 4) {
    new_Skin.Scar1 = 1101003079;
    new_Skin.Scar_Mag = 1010030801;
  }
  if (preferences.Config.Skin.Scar == 5) {
    new_Skin.Scar1 = 1101003118;
    new_Skin.Scar_Mag = 1010031191;
  }
  if (preferences.Config.Skin.Scar == 6) {
    new_Skin.Scar1 = 1101003145;
    new_Skin.Scar_Mag = 1010031461;
  }
  if (preferences.Config.Skin.Scar == 7) {
    new_Skin.Scar1 = 1101003166;
    new_Skin.Scar_Mag = 1010031671;
  }
  if (preferences.Config.Skin.Scar == 8) {
    new_Skin.Scar1 = 1101003180;
    new_Skin.Scar_Mag = 1010031811;
  }
if (preferences.Config.Skin.Scar == 9) {
    new_Skin.Scar1 = 1101003207;
    new_Skin.Scar_Mag = 1010032071;
  }
//
if (preferences.Config.Skin.Scar == 0) {
    new_Skin.Scar2 = 101003;
    new_Skin.Scar_Mag = 291003;
  }
  if (preferences.Config.Skin.Scar == 1) {
    new_Skin.Scar2 = 1101003194;
    new_Skin.Scar_Mag = 1010031897;
  }
  if (preferences.Config.Skin.Scar == 2) {
    new_Skin.Scar2 = 1101003056;
    new_Skin.Scar_Mag = 1010030571;
  }
  if (preferences.Config.Skin.Scar == 3) {
    new_Skin.Scar2 = 1101003069;
    new_Skin.Scar_Mag = 1010030701;
  }
  if (preferences.Config.Skin.Scar == 4) {
    new_Skin.Scar2 = 1101003079;
    new_Skin.Scar_Mag = 1010030801;
  }
  if (preferences.Config.Skin.Scar == 5) {
    new_Skin.Scar2 = 1101003118;
    new_Skin.Scar_Mag = 1010031191;
  }
  if (preferences.Config.Skin.Scar == 6) {
    new_Skin.Scar2 = 1101003145;
    new_Skin.Scar_Mag = 1010031461;
  }
  if (preferences.Config.Skin.Scar == 7) {
    new_Skin.Scar2 = 1101003166;
    new_Skin.Scar_Mag = 1010031671;
  }
  if (preferences.Config.Skin.Scar == 8) {
    new_Skin.Scar2 = 1101003180;
    new_Skin.Scar_Mag = 1010031811;
  }
if (preferences.Config.Skin.Scar == 9) {
    new_Skin.Scar2 = 1101003207;
    new_Skin.Scar_Mag = 1010032071;
  }
//
if (preferences.Config.Skin.Scar == 0) {
    new_Skin.Scar3 = 101003;
    new_Skin.Scar_Mag = 291003;
  }
  if (preferences.Config.Skin.Scar == 1) {
    new_Skin.Scar3 = 1101003194;
    new_Skin.Scar_Mag = 1010031897;
  }
  if (preferences.Config.Skin.Scar == 2) {
    new_Skin.Scar3 = 1101003056;
    new_Skin.Scar_Mag = 1010030571;
  }
  if (preferences.Config.Skin.Scar == 3) {
    new_Skin.Scar3 = 1101003069;
    new_Skin.Scar_Mag = 1010030701;
  }
  if (preferences.Config.Skin.Scar == 4) {
    new_Skin.Scar3 = 1101003079;
    new_Skin.Scar_Mag = 1010030801;
  }
  if (preferences.Config.Skin.Scar == 5) {
    new_Skin.Scar3 = 1101003118;
    new_Skin.Scar_Mag = 1010031191;
  }
  if (preferences.Config.Skin.Scar == 6) {
    new_Skin.Scar3 = 1101003145;
    new_Skin.Scar_Mag = 1010031461;
  }
  if (preferences.Config.Skin.Scar == 7) {
    new_Skin.Scar3 = 1101003166;
    new_Skin.Scar_Mag = 1010031671;
  }
  if (preferences.Config.Skin.Scar == 8) {
    new_Skin.Scar3 = 1101003180;
    new_Skin.Scar_Mag = 1010031811;
  }
if (preferences.Config.Skin.Scar == 9) {
    new_Skin.Scar3 = 1101003207;
    new_Skin.Scar_Mag = 1010032071;
  }
//
if (preferences.Config.Skin.Scar == 0) {
    new_Skin.Scar4 = 101003;
    new_Skin.Scar_Mag = 291003;
  }
  if (preferences.Config.Skin.Scar == 1) {
    new_Skin.Scar4 = 1101003194;
    new_Skin.Scar_Mag = 1010031897;
  }
  if (preferences.Config.Skin.Scar == 2) {
    new_Skin.Scar4 = 1101003056;
    new_Skin.Scar_Mag = 1010030571;
  }
  if (preferences.Config.Skin.Scar == 3) {
    new_Skin.Scar4 = 1101003069;
    new_Skin.Scar_Mag = 1010030701;
  }
  if (preferences.Config.Skin.Scar == 4) {
    new_Skin.Scar4 = 1101003079;
    new_Skin.Scar_Mag = 1010030801;
  }
  if (preferences.Config.Skin.Scar == 5) {
    new_Skin.Scar4 = 1101003118;
    new_Skin.Scar_Mag = 1010031191;
  }
  if (preferences.Config.Skin.Scar == 6) {
    new_Skin.Scar4 = 1101003145;
    new_Skin.Scar_Mag = 1010031461;
  }
  if (preferences.Config.Skin.Scar == 7) {
    new_Skin.Scar4 = 1101003166;
    new_Skin.Scar_Mag = 1010031671;
  }
  if (preferences.Config.Skin.Scar == 8) {
    new_Skin.Scar4 = 1101003180;
    new_Skin.Scar_Mag = 1010031811;
  }
if (preferences.Config.Skin.Scar == 9) {
    new_Skin.Scar4 = 1101003207;
    new_Skin.Scar_Mag = 1010032071;
  }
//
if (preferences.Config.Skin.Scar == 0) {
    new_Skin.Scar5 = 101003;
    new_Skin.Scar_Mag = 291003;
  }
  if (preferences.Config.Skin.Scar == 1) {
    new_Skin.Scar5 = 1101003194;
    new_Skin.Scar_Mag = 1010031897;
  }
  if (preferences.Config.Skin.Scar == 2) {
    new_Skin.Scar5 = 1101003056;
    new_Skin.Scar_Mag = 1010030571;
  }
  if (preferences.Config.Skin.Scar == 3) {
    new_Skin.Scar5 = 1101003069;
    new_Skin.Scar_Mag = 1010030701;
  }
  if (preferences.Config.Skin.Scar == 4) {
    new_Skin.Scar5 = 1101003079;
    new_Skin.Scar_Mag = 1010030801;
  }
  if (preferences.Config.Skin.Scar == 5) {
    new_Skin.Scar5 = 1101003118;
    new_Skin.Scar_Mag = 1010031191;
  }
  if (preferences.Config.Skin.Scar == 6) {
    new_Skin.Scar5 = 1101003145;
    new_Skin.Scar_Mag = 1010031461;
  }
  if (preferences.Config.Skin.Scar == 7) {
    new_Skin.Scar5 = 1101003166;
    new_Skin.Scar_Mag = 1010031671;
  }
  if (preferences.Config.Skin.Scar == 8) {
    new_Skin.Scar5 = 1101003180;
    new_Skin.Scar_Mag = 1010031811;
  }
if (preferences.Config.Skin.Scar == 9) {
    new_Skin.Scar5 = 1101003207;
    new_Skin.Scar_Mag = 1010032071;
  }
//
if (preferences.Config.Skin.Scar == 0) {
    new_Skin.Scar6 = 101003;
    new_Skin.Scar_Mag = 291003;
  }
  if (preferences.Config.Skin.Scar == 1) {
    new_Skin.Scar6 = 1101003194;
    new_Skin.Scar_Mag = 1010031897;
  }
  if (preferences.Config.Skin.Scar == 2) {
    new_Skin.Scar6 = 1101003056;
    new_Skin.Scar_Mag = 1010030571;
  }
  if (preferences.Config.Skin.Scar == 3) {
    new_Skin.Scar6 = 1101003069;
    new_Skin.Scar_Mag = 1010030701;
  }
  if (preferences.Config.Skin.Scar == 4) {
    new_Skin.Scar6 = 1101003079;
    new_Skin.Scar_Mag = 1010030801;
  }
  if (preferences.Config.Skin.Scar == 5) {
    new_Skin.Scar6 = 1101003118;
    new_Skin.Scar_Mag = 1010031191;
  }
  if (preferences.Config.Skin.Scar == 6) {
    new_Skin.Scar6 = 1101003145;
    new_Skin.Scar_Mag = 1010031461;
  }
  if (preferences.Config.Skin.Scar == 7) {
    new_Skin.Scar6 = 1101003166;
    new_Skin.Scar_Mag = 1010031671;
  }
  if (preferences.Config.Skin.Scar == 8) {
    new_Skin.Scar6 = 1101003180;
    new_Skin.Scar_Mag = 1010031811;
  }
if (preferences.Config.Skin.Scar == 9) {
    new_Skin.Scar6 = 1101003207;
    new_Skin.Scar_Mag = 1010032071;
  }

//
//////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.M416 == 0) {//枪械M416
    new_Skin.M416_1 = 101004;//枪身
    new_Skin.M416_2 = 291004;//弹匣
    new_Skin.M416_3 = 203008;//瞄具
    new_Skin.M416_4 = 205005;//枪托
    new_Skin.M416_flash = 201010;//消炎
    new_Skin.M416_compe = 201009;//
    new_Skin.M416_silent = 201011;//
    new_Skin.M416_reddot = 203001;//红点
    new_Skin.M416_holo = 203002;//
    new_Skin.M416_x2 = 203003;//
    new_Skin.M416_x3 = 203014;//
    new_Skin.M416_x4 = 203004;//
    new_Skin.M416_x6 = 203015;//
    new_Skin.M416_quickMag = 204012;//
    new_Skin.M416_extendedMag = 204011;//
    new_Skin.M416_quickNextended = 204013;//
    new_Skin.M416_stock = 205002;//枪托
    new_Skin.M416_stock2 = 2050022;//品质修
    new_Skin.M416_stock3 = 2050023;//完好
    new_Skin.M416_stock4 = 2050024;//改
    new_Skin.M416_stock5 = 2050025;//精
    new_Skin.M416_verical = 203015;//6倍
    new_Skin.M416_angle = 202001;//woba
    new_Skin.M416_lightgrip = 202004;//woba
    new_Skin.M416_pink = 202005;//woba
    new_Skin.M416_lazer = 203015;//woba
    new_Skin.M416_thumb = 202006;//woba
  }
  if (preferences.Config.Skin.M416 == 1) {
    new_Skin.M416_1 = 1101004045;//ID: 1101004045 | name: 冰霜核心-M416(6级)
    new_Skin.M416_2 = 1010040461;//弹匣
    new_Skin.M416_3 = 1010040462;//瞄具
    new_Skin.M416_4 = 1010040463;//枪托
    new_Skin.M416_flash = 1010040474;//xiaoyanqi
    new_Skin.M416_compe = 1010040475;//buchangqi
    new_Skin.M416_silent = 1010040476;//xiaoyinqi
    new_Skin.M416_reddot = 1010040470;//hongdian
    new_Skin.M416_holo = 1010040469;
    new_Skin.M416_x2 = 1010040468;
    new_Skin.M416_x3 = 1010040467;
    new_Skin.M416_x4 = 1010040466;
    new_Skin.M416_x6 = 1010040481;
    new_Skin.M416_quickMag = 1010040471;//kuaikuo
    new_Skin.M416_extendedMag = 1010040472;//kuaisu
    new_Skin.M416_quickNextended = 1010040473;//kuaikuo
    new_Skin.M416_stock = 1010040480;//zhanshuqiangtuo
    new_Skin.M416_stock2 = 1010040480;//
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
    new_Skin.M416_1 = 1101004061;//愚人小丑
    new_Skin.M416_2 = 1010040611;
    new_Skin.M416_3 = 1010040612;
    new_Skin.M416_4 = 1010040613;
    new_Skin.M416_flash = 1010040577;
    new_Skin.M416_compe = 1010040578;
    new_Skin.M416_silent = 1010040579;
    new_Skin.M416_reddot = 1010040569;
    new_Skin.M416_holo = 1010040568;
    new_Skin.M416_x2 = 1010040567;
    new_Skin.M416_x3 = 1010040566;
    new_Skin.M416_x4 = 1010040565;
    new_Skin.M416_x6 = 1010040564;
    new_Skin.M416_quickMag = 1010040570;
    new_Skin.M416_extendedMag = 1010040575;
    new_Skin.M416_quickNextended = 1010040576;
    new_Skin.M416_stock = 1010040586;
    new_Skin.M416_stock2 = 1010040586;
    new_Skin.M416_stock3 = 1010040586;
    new_Skin.M416_stock4 = 1010040586;
    new_Skin.M416_stock5 = 1010040586;
    new_Skin.M416_verical = 203015;
    new_Skin.M416_angle = 1010040580;
    new_Skin.M416_lightgrip = 1010040587;
    new_Skin.M416_pink = 1010040588;
    new_Skin.M416_lazer = 1010040589;
    new_Skin.M416_thumb = 1010040584;
  }
  if (preferences.Config.Skin.M416 == 3) {
    new_Skin.M416_1 = 1101004077;
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
    new_Skin.M416_1 = 1101004085;
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
    new_Skin.M416_1 = 1101004097;
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
    new_Skin.M416_1 = 1101004137;
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
    new_Skin.M416_1 = 1101004162;
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
    new_Skin.M416_1 = 1101004200;
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
    new_Skin.M416_1 = 1101004208;
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
    new_Skin.M416_1 = 1101004217;
    new_Skin.M4168 = 1101004217;
    new_Skin.M4169 = 1101004217;
    new_Skin.M4162 = 1101004217;
    new_Skin.M4163 = 1101004217;
    new_Skin.M4164 = 1101004217;
    //new_Skin.M416_2 = 1010042153;
    //new_Skin.M416_3 = 1010042163;
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
    //new_Skin.M416_stock2 = 1010042137;
    //new_Skin.M416_stock3 = 1010042137;
    //new_Skin.M416_stock4 = 1010042137;
    //new_Skin.M416_stock5 = 1010042137;
    new_Skin.M416_verical = 1010042136;
    new_Skin.M416_angle = 1010042134;
    new_Skin.M416_lightgrip = 1010042138;
    new_Skin.M416_pink = 1010042139;
    new_Skin.M416_lazer = 1010042144;
    new_Skin.M416_thumb = 1010042135;
  }
  if (preferences.Config.Skin.M416 == 11) {
    new_Skin.M416_1 = 1101004225;
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
  
  if (preferences.Config.Skin.M416 == 12) {
    new_Skin.M416_1 = 1101004235;
    new_Skin.M416_2 = 1010042361;
    new_Skin.M416_3 = 1010042362;
    new_Skin.M416_4 = 1010042363;
    new_Skin.M416_flash = 1010042307;
    new_Skin.M416_compe = 1010042306;
    new_Skin.M416_silent = 1010042308;
    new_Skin.M416_reddot = 1010042299;
    new_Skin.M416_holo = 1010042298;
    new_Skin.M416_x2 = 1010042297;
    new_Skin.M416_x3 = 1010042296;
    new_Skin.M416_x4 = 1010042295;
    new_Skin.M416_x6 = 1010042294;
    new_Skin.M416_quickMag = 1010042300;
    new_Skin.M416_extendedMag = 1010042304;
    new_Skin.M416_quickNextended = 1010042305;
    new_Skin.M416_stock = 1010042315;
    new_Skin.M416_stock2 = 1010042315;
    new_Skin.M416_stock3 = 1010042315;
    new_Skin.M416_stock4 = 1010042315;
    new_Skin.M416_stock5 = 1010042315;
    new_Skin.M416_verical = 1010042314;
    new_Skin.M416_thumb = 1010042310;
    new_Skin.M416_angle = 1010042309;
    new_Skin.M416_lightgrip = 1010042316;
    new_Skin.M416_pink = 1010042317;
    new_Skin.M416_lazer = 1010042318;
  }
if (preferences.Config.Skin.M416 == 13) {
    new_Skin.M416_1 = 1101004045;
    new_Skin.M416_2 = 1010040461;
    new_Skin.M416_3 = 1010040462;
    new_Skin.M416_4 = 1010040463;
    new_Skin.M416_flash = 1010040474;
    new_Skin.M416_compe = 1010040475;
    new_Skin.M416_silent = 1010040476;
   new_Skin.M416_reddot = 203001;
   new_Skin.M416_holo = 203002;
   new_Skin.M416_x2 = 203003;
   new_Skin.M416_x3 = 203014;
    new_Skin.M416_x4 = 203004;
  
    new_Skin.M416_x6 = 203015;
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
/////////////////////////////////////////////下面是数字8的替换
if (preferences.Config.Skin.M416 == 0) {//枪械M416
    new_Skin.M4168 = 101004;//枪身
    new_Skin.M416_2 = 291004;//弹匣
    new_Skin.M416_3 = 203008;//瞄具
    new_Skin.M416_4 = 205005;//枪托
    new_Skin.M416_flash = 201010;//消炎
    new_Skin.M416_compe = 201009;//
    new_Skin.M416_silent = 201011;//
    new_Skin.M416_reddot = 203001;//红点
    new_Skin.M416_holo = 203002;//
    new_Skin.M416_x2 = 203003;//
    new_Skin.M416_x3 = 203014;//
    new_Skin.M416_x4 = 203004;//
    new_Skin.M416_x6 = 203015;//
    new_Skin.M416_quickMag = 204012;//
    new_Skin.M416_extendedMag = 204011;//
    new_Skin.M416_quickNextended = 204013;//
    new_Skin.M416_stock = 205002;//枪托
    new_Skin.M416_stock2 = 2050022;//品质修
    new_Skin.M416_stock3 = 2050023;//完好
    new_Skin.M416_stock4 = 2050024;//改
    new_Skin.M416_stock5 = 2050025;//精
    new_Skin.M416_verical = 203015;//6倍
    new_Skin.M416_angle = 202001;//woba
    new_Skin.M416_lightgrip = 202004;//woba
    new_Skin.M416_pink = 202005;//woba
    new_Skin.M416_lazer = 203015;//woba
    new_Skin.M416_thumb = 202006;//woba
  }
  if (preferences.Config.Skin.M416 == 1) {
    new_Skin.M4168 = 1101004045;//ID: 1101004045 | name: 冰霜核心-M416(6级)
    new_Skin.M416_2 = 1010040461;//弹匣
    new_Skin.M416_3 = 1010040462;//瞄具
    new_Skin.M416_4 = 1010040463;//枪托
    new_Skin.M416_flash = 1010040474;//xiaoyanqi
    new_Skin.M416_compe = 1010040475;//buchangqi
    new_Skin.M416_silent = 1010040476;//xiaoyinqi
    new_Skin.M416_reddot = 1010040470;//hongdian
    new_Skin.M416_holo = 1010040469;
    new_Skin.M416_x2 = 1010040468;
    new_Skin.M416_x3 = 1010040467;
    new_Skin.M416_x4 = 1010040466;
    new_Skin.M416_x6 = 1010040481;
    new_Skin.M416_quickMag = 1010040471;//kuaikuo
    new_Skin.M416_extendedMag = 1010040472;//kuaisu
    new_Skin.M416_quickNextended = 1010040473;//kuaikuo
    new_Skin.M416_stock = 1010040480;//zhanshuqiangtuo
    new_Skin.M416_stock2 = 1010040480;//
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
    new_Skin.M4168 = 1101004061;//愚人小丑
    new_Skin.M416_2 = 1010040611;
    new_Skin.M416_3 = 1010040612;
    new_Skin.M416_4 = 1010040613;
    new_Skin.M416_flash = 1010040577;
    new_Skin.M416_compe = 1010040578;
    new_Skin.M416_silent = 1010040579;
    new_Skin.M416_reddot = 1010040569;
    new_Skin.M416_holo = 1010040568;
    new_Skin.M416_x2 = 1010040567;
    new_Skin.M416_x3 = 1010040566;
    new_Skin.M416_x4 = 1010040565;
    new_Skin.M416_x6 = 1010040564;
    new_Skin.M416_quickMag = 1010040570;
    new_Skin.M416_extendedMag = 1010040575;
    new_Skin.M416_quickNextended = 1010040576;
    new_Skin.M416_stock = 1010040586;
    new_Skin.M416_stock2 = 1010040586;
    new_Skin.M416_stock3 = 1010040586;
    new_Skin.M416_stock4 = 1010040586;
    new_Skin.M416_stock5 = 1010040586;
    new_Skin.M416_verical = 203015;
    new_Skin.M416_angle = 1010040580;
    new_Skin.M416_lightgrip = 1010040587;
    new_Skin.M416_pink = 1010040588;
    new_Skin.M416_lazer = 1010040589;
    new_Skin.M416_thumb = 1010040584;
  }
  if (preferences.Config.Skin.M416 == 3) {
    new_Skin.M4168 = 1101004077;
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
    new_Skin.M4168 = 1101004085;
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
    new_Skin.M4168 = 1101004097;
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
    new_Skin.M4168 = 1101004137;
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
    new_Skin.M4168 = 1101004162;
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
    new_Skin.M4168 = 1101004200;
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
    new_Skin.M4168 = 1101004208;
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
/*
  if (preferences.Config.Skin.M416 == 10) {

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
*/
  if (preferences.Config.Skin.M416 == 11) {
    new_Skin.M4168 = 1101004225;
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
  
  if (preferences.Config.Skin.M416 == 12) {
    new_Skin.M4168 = 1101004235;
    new_Skin.M416_2 = 1010042361;
    new_Skin.M416_3 = 1010042362;
    new_Skin.M416_4 = 1010042363;
    new_Skin.M416_flash = 1010042307;
    new_Skin.M416_compe = 1010042306;
    new_Skin.M416_silent = 1010042308;
    new_Skin.M416_reddot = 1010042299;
    new_Skin.M416_holo = 1010042298;
    new_Skin.M416_x2 = 1010042297;
    new_Skin.M416_x3 = 1010042296;
    new_Skin.M416_x4 = 1010042295;
    new_Skin.M416_x6 = 1010042294;
    new_Skin.M416_quickMag = 1010042300;
    new_Skin.M416_extendedMag = 1010042304;
    new_Skin.M416_quickNextended = 1010042305;
    new_Skin.M416_stock = 1010042315;
    new_Skin.M416_stock2 = 1010042315;
    new_Skin.M416_stock3 = 1010042315;
    new_Skin.M416_stock4 = 1010042315;
    new_Skin.M416_stock5 = 1010042315;
    new_Skin.M416_verical = 1010042314;
    new_Skin.M416_thumb = 1010042310;
    new_Skin.M416_angle = 1010042309;
    new_Skin.M416_lightgrip = 1010042316;
    new_Skin.M416_pink = 1010042317;
    new_Skin.M416_lazer = 1010042318;
  }
if (preferences.Config.Skin.M416 == 13) {
    new_Skin.M4168 = 1101004045;
    new_Skin.M416_2 = 1010040461;
    new_Skin.M416_3 = 1010040462;
    new_Skin.M416_4 = 1010040463;
    new_Skin.M416_flash = 1010040474;
    new_Skin.M416_compe = 1010040475;
    new_Skin.M416_silent = 1010040476;
   new_Skin.M416_reddot = 203001;
   new_Skin.M416_holo = 203002;
   new_Skin.M416_x2 = 203003;
   new_Skin.M416_x3 = 203014;
    new_Skin.M416_x4 = 203004;
  
    new_Skin.M416_x6 = 203015;
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
//下面是数字9的替换⬇️
if (preferences.Config.Skin.M416 == 0) {//枪械M416
    new_Skin.M4169 = 101004;//枪身
    new_Skin.M416_2 = 291004;//弹匣
    new_Skin.M416_3 = 203008;//瞄具
    new_Skin.M416_4 = 205005;//枪托
    new_Skin.M416_flash = 201010;//消炎
    new_Skin.M416_compe = 201009;//
    new_Skin.M416_silent = 201011;//
    new_Skin.M416_reddot = 203001;//红点
    new_Skin.M416_holo = 203002;//
    new_Skin.M416_x2 = 203003;//
    new_Skin.M416_x3 = 203014;//
    new_Skin.M416_x4 = 203004;//
    new_Skin.M416_x6 = 203015;//
    new_Skin.M416_quickMag = 204012;//
    new_Skin.M416_extendedMag = 204011;//
    new_Skin.M416_quickNextended = 204013;//
    new_Skin.M416_stock = 205002;//枪托
    new_Skin.M416_stock2 = 2050022;//品质修
    new_Skin.M416_stock3 = 2050023;//完好
    new_Skin.M416_stock4 = 2050024;//改
    new_Skin.M416_stock5 = 2050025;//精
    new_Skin.M416_verical = 203015;//6倍
    new_Skin.M416_angle = 202001;//woba
    new_Skin.M416_lightgrip = 202004;//woba
    new_Skin.M416_pink = 202005;//woba
    new_Skin.M416_lazer = 203015;//woba
    new_Skin.M416_thumb = 202006;//woba
  }
  if (preferences.Config.Skin.M416 == 1) {
    new_Skin.M4169 = 1101004045;//ID: 1101004045 | name: 冰霜核心-M416(6级)
    new_Skin.M416_2 = 1010040461;//弹匣
    new_Skin.M416_3 = 1010040462;//瞄具
    new_Skin.M416_4 = 1010040463;//枪托
    new_Skin.M416_flash = 1010040474;//xiaoyanqi
    new_Skin.M416_compe = 1010040475;//buchangqi
    new_Skin.M416_silent = 1010040476;//xiaoyinqi
    new_Skin.M416_reddot = 1010040470;//hongdian
    new_Skin.M416_holo = 1010040469;
    new_Skin.M416_x2 = 1010040468;
    new_Skin.M416_x3 = 1010040467;
    new_Skin.M416_x4 = 1010040466;
    new_Skin.M416_x6 = 1010040481;
    new_Skin.M416_quickMag = 1010040471;//kuaikuo
    new_Skin.M416_extendedMag = 1010040472;//kuaisu
    new_Skin.M416_quickNextended = 1010040473;//kuaikuo
    new_Skin.M416_stock = 1010040480;//zhanshuqiangtuo
    new_Skin.M416_stock2 = 1010040480;//
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
    new_Skin.M4169 = 1101004061;//愚人小丑
    new_Skin.M416_2 = 1010040611;
    new_Skin.M416_3 = 1010040612;
    new_Skin.M416_4 = 1010040613;
    new_Skin.M416_flash = 1010040577;
    new_Skin.M416_compe = 1010040578;
    new_Skin.M416_silent = 1010040579;
    new_Skin.M416_reddot = 1010040569;
    new_Skin.M416_holo = 1010040568;
    new_Skin.M416_x2 = 1010040567;
    new_Skin.M416_x3 = 1010040566;
    new_Skin.M416_x4 = 1010040565;
    new_Skin.M416_x6 = 1010040564;
    new_Skin.M416_quickMag = 1010040570;
    new_Skin.M416_extendedMag = 1010040575;
    new_Skin.M416_quickNextended = 1010040576;
    new_Skin.M416_stock = 1010040586;
    new_Skin.M416_stock2 = 1010040586;
    new_Skin.M416_stock3 = 1010040586;
    new_Skin.M416_stock4 = 1010040586;
    new_Skin.M416_stock5 = 1010040586;
    new_Skin.M416_verical = 203015;
    new_Skin.M416_angle = 1010040580;
    new_Skin.M416_lightgrip = 1010040587;
    new_Skin.M416_pink = 1010040588;
    new_Skin.M416_lazer = 1010040589;
    new_Skin.M416_thumb = 1010040584;
  }
  if (preferences.Config.Skin.M416 == 3) {
    new_Skin.M4169 = 1101004077;
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
    new_Skin.M4169 = 1101004085;
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
    new_Skin.M4169 = 1101004097;
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
    new_Skin.M4169 = 1101004137;
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
    new_Skin.M4169 = 1101004162;
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
    new_Skin.M4169 = 1101004200;
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
    new_Skin.M4169 = 1101004208;
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
/*
  if (preferences.Config.Skin.M416 == 10) {

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
*/
  if (preferences.Config.Skin.M416 == 11) {
    new_Skin.M4169 = 1101004225;
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
  
  if (preferences.Config.Skin.M416 == 12) {
    new_Skin.M4169 = 1101004235;
    new_Skin.M416_2 = 1010042361;
    new_Skin.M416_3 = 1010042362;
    new_Skin.M416_4 = 1010042363;
    new_Skin.M416_flash = 1010042307;
    new_Skin.M416_compe = 1010042306;
    new_Skin.M416_silent = 1010042308;
    new_Skin.M416_reddot = 1010042299;
    new_Skin.M416_holo = 1010042298;
    new_Skin.M416_x2 = 1010042297;
    new_Skin.M416_x3 = 1010042296;
    new_Skin.M416_x4 = 1010042295;
    new_Skin.M416_x6 = 1010042294;
    new_Skin.M416_quickMag = 1010042300;
    new_Skin.M416_extendedMag = 1010042304;
    new_Skin.M416_quickNextended = 1010042305;
    new_Skin.M416_stock = 1010042315;
    new_Skin.M416_stock2 = 1010042315;
    new_Skin.M416_stock3 = 1010042315;
    new_Skin.M416_stock4 = 1010042315;
    new_Skin.M416_stock5 = 1010042315;
    new_Skin.M416_verical = 1010042314;
    new_Skin.M416_thumb = 1010042310;
    new_Skin.M416_angle = 1010042309;
    new_Skin.M416_lightgrip = 1010042316;
    new_Skin.M416_pink = 1010042317;
    new_Skin.M416_lazer = 1010042318;
  }
if (preferences.Config.Skin.M416 == 13) {
    new_Skin.M4169 = 1101004045;
    new_Skin.M416_2 = 1010040461;
    new_Skin.M416_3 = 1010040462;
    new_Skin.M416_4 = 1010040463;
    new_Skin.M416_flash = 1010040474;
    new_Skin.M416_compe = 1010040475;
    new_Skin.M416_silent = 1010040476;
   new_Skin.M416_reddot = 203001;
   new_Skin.M416_holo = 203002;
   new_Skin.M416_x2 = 203003;
   new_Skin.M416_x3 = 203014;
    new_Skin.M416_x4 = 203004;
  
    new_Skin.M416_x6 = 203015;
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
//下面是数字2的替换
if (preferences.Config.Skin.M416 == 0) {//枪械M416
    new_Skin.M4162 = 101004;//枪身
    new_Skin.M416_2 = 291004;//弹匣
    new_Skin.M416_3 = 203008;//瞄具
    new_Skin.M416_4 = 205005;//枪托
    new_Skin.M416_flash = 201010;//消炎
    new_Skin.M416_compe = 201009;//
    new_Skin.M416_silent = 201011;//
    new_Skin.M416_reddot = 203001;//红点
    new_Skin.M416_holo = 203002;//
    new_Skin.M416_x2 = 203003;//
    new_Skin.M416_x3 = 203014;//
    new_Skin.M416_x4 = 203004;//
    new_Skin.M416_x6 = 203015;//
    new_Skin.M416_quickMag = 204012;//
    new_Skin.M416_extendedMag = 204011;//
    new_Skin.M416_quickNextended = 204013;//
    new_Skin.M416_stock = 205002;//枪托
    new_Skin.M416_stock2 = 2050022;//品质修
    new_Skin.M416_stock3 = 2050023;//完好
    new_Skin.M416_stock4 = 2050024;//改
    new_Skin.M416_stock5 = 2050025;//精
    new_Skin.M416_verical = 203015;//6倍
    new_Skin.M416_angle = 202001;//woba
    new_Skin.M416_lightgrip = 202004;//woba
    new_Skin.M416_pink = 202005;//woba
    new_Skin.M416_lazer = 203015;//woba
    new_Skin.M416_thumb = 202006;//woba
  }
  if (preferences.Config.Skin.M416 == 1) {
    new_Skin.M4162 = 1101004045;//ID: 1101004045 | name: 冰霜核心-M416(6级)
    new_Skin.M416_2 = 1010040461;//弹匣
    new_Skin.M416_3 = 1010040462;//瞄具
    new_Skin.M416_4 = 1010040463;//枪托
    new_Skin.M416_flash = 1010040474;//xiaoyanqi
    new_Skin.M416_compe = 1010040475;//buchangqi
    new_Skin.M416_silent = 1010040476;//xiaoyinqi
    new_Skin.M416_reddot = 1010040470;//hongdian
    new_Skin.M416_holo = 1010040469;
    new_Skin.M416_x2 = 1010040468;
    new_Skin.M416_x3 = 1010040467;
    new_Skin.M416_x4 = 1010040466;
    new_Skin.M416_x6 = 1010040481;
    new_Skin.M416_quickMag = 1010040471;//kuaikuo
    new_Skin.M416_extendedMag = 1010040472;//kuaisu
    new_Skin.M416_quickNextended = 1010040473;//kuaikuo
    new_Skin.M416_stock = 1010040480;//zhanshuqiangtuo
    new_Skin.M416_stock2 = 1010040480;//
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
    new_Skin.M4162 = 1101004061;//愚人小丑
    new_Skin.M416_2 = 1010040611;
    new_Skin.M416_3 = 1010040612;
    new_Skin.M416_4 = 1010040613;
    new_Skin.M416_flash = 1010040577;
    new_Skin.M416_compe = 1010040578;
    new_Skin.M416_silent = 1010040579;
    new_Skin.M416_reddot = 1010040569;
    new_Skin.M416_holo = 1010040568;
    new_Skin.M416_x2 = 1010040567;
    new_Skin.M416_x3 = 1010040566;
    new_Skin.M416_x4 = 1010040565;
    new_Skin.M416_x6 = 1010040564;
    new_Skin.M416_quickMag = 1010040570;
    new_Skin.M416_extendedMag = 1010040575;
    new_Skin.M416_quickNextended = 1010040576;
    new_Skin.M416_stock = 1010040586;
    new_Skin.M416_stock2 = 1010040586;
    new_Skin.M416_stock3 = 1010040586;
    new_Skin.M416_stock4 = 1010040586;
    new_Skin.M416_stock5 = 1010040586;
    new_Skin.M416_verical = 203015;
    new_Skin.M416_angle = 1010040580;
    new_Skin.M416_lightgrip = 1010040587;
    new_Skin.M416_pink = 1010040588;
    new_Skin.M416_lazer = 1010040589;
    new_Skin.M416_thumb = 1010040584;
  }
  if (preferences.Config.Skin.M416 == 3) {
    new_Skin.M4162 = 1101004077;
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
    new_Skin.M4162 = 1101004085;
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
    new_Skin.M4162 = 1101004097;
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
    new_Skin.M4162 = 1101004137;
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
    new_Skin.M4162 = 1101004162;
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
    new_Skin.M4162 = 1101004200;
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
    new_Skin.M4162 = 1101004208;
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
/*
  if (preferences.Config.Skin.M416 == 10) {

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
*/
  if (preferences.Config.Skin.M416 == 11) {
    new_Skin.M4162 = 1101004225;
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
  
  if (preferences.Config.Skin.M416 == 12) {
    new_Skin.M4162 = 1101004235;
    new_Skin.M416_2 = 1010042361;
    new_Skin.M416_3 = 1010042362;
    new_Skin.M416_4 = 1010042363;
    new_Skin.M416_flash = 1010042307;
    new_Skin.M416_compe = 1010042306;
    new_Skin.M416_silent = 1010042308;
    new_Skin.M416_reddot = 1010042299;
    new_Skin.M416_holo = 1010042298;
    new_Skin.M416_x2 = 1010042297;
    new_Skin.M416_x3 = 1010042296;
    new_Skin.M416_x4 = 1010042295;
    new_Skin.M416_x6 = 1010042294;
    new_Skin.M416_quickMag = 1010042300;
    new_Skin.M416_extendedMag = 1010042304;
    new_Skin.M416_quickNextended = 1010042305;
    new_Skin.M416_stock = 1010042315;
    new_Skin.M416_stock2 = 1010042315;
    new_Skin.M416_stock3 = 1010042315;
    new_Skin.M416_stock4 = 1010042315;
    new_Skin.M416_stock5 = 1010042315;
    new_Skin.M416_verical = 1010042314;
    new_Skin.M416_thumb = 1010042310;
    new_Skin.M416_angle = 1010042309;
    new_Skin.M416_lightgrip = 1010042316;
    new_Skin.M416_pink = 1010042317;
    new_Skin.M416_lazer = 1010042318;
  }
if (preferences.Config.Skin.M416 == 13) {
    new_Skin.M4162 = 1101004045;
    new_Skin.M416_2 = 1010040461;
    new_Skin.M416_3 = 1010040462;
    new_Skin.M416_4 = 1010040463;
    new_Skin.M416_flash = 1010040474;
    new_Skin.M416_compe = 1010040475;
    new_Skin.M416_silent = 1010040476;
   new_Skin.M416_reddot = 203001;
   new_Skin.M416_holo = 203002;
   new_Skin.M416_x2 = 203003;
   new_Skin.M416_x3 = 203014;
    new_Skin.M416_x4 = 203004;
  
    new_Skin.M416_x6 = 203015;
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
//数字3替换⬇️
if (preferences.Config.Skin.M416 == 0) {//枪械M416
    new_Skin.M4163 = 101004;//枪身
    new_Skin.M416_2 = 291004;//弹匣
    new_Skin.M416_3 = 203008;//瞄具
    new_Skin.M416_4 = 205005;//枪托
    new_Skin.M416_flash = 201010;//消炎
    new_Skin.M416_compe = 201009;//
    new_Skin.M416_silent = 201011;//
    new_Skin.M416_reddot = 203001;//红点
    new_Skin.M416_holo = 203002;//
    new_Skin.M416_x2 = 203003;//
    new_Skin.M416_x3 = 203014;//
    new_Skin.M416_x4 = 203004;//
    new_Skin.M416_x6 = 203015;//
    new_Skin.M416_quickMag = 204012;//
    new_Skin.M416_extendedMag = 204011;//
    new_Skin.M416_quickNextended = 204013;//
    new_Skin.M416_stock = 205002;//枪托
    new_Skin.M416_stock2 = 2050022;//品质修
    new_Skin.M416_stock3 = 2050023;//完好
    new_Skin.M416_stock4 = 2050024;//改
    new_Skin.M416_stock5 = 2050025;//精
    new_Skin.M416_verical = 203015;//6倍
    new_Skin.M416_angle = 202001;//woba
    new_Skin.M416_lightgrip = 202004;//woba
    new_Skin.M416_pink = 202005;//woba
    new_Skin.M416_lazer = 203015;//woba
    new_Skin.M416_thumb = 202006;//woba
  }
  if (preferences.Config.Skin.M416 == 1) {
    new_Skin.M4163 = 1101004045;//ID: 1101004045 | name: 冰霜核心-M416(6级)
    new_Skin.M416_2 = 1010040461;//弹匣
    new_Skin.M416_3 = 1010040462;//瞄具
    new_Skin.M416_4 = 1010040463;//枪托
    new_Skin.M416_flash = 1010040474;//xiaoyanqi
    new_Skin.M416_compe = 1010040475;//buchangqi
    new_Skin.M416_silent = 1010040476;//xiaoyinqi
    new_Skin.M416_reddot = 1010040470;//hongdian
    new_Skin.M416_holo = 1010040469;
    new_Skin.M416_x2 = 1010040468;
    new_Skin.M416_x3 = 1010040467;
    new_Skin.M416_x4 = 1010040466;
    new_Skin.M416_x6 = 1010040481;
    new_Skin.M416_quickMag = 1010040471;//kuaikuo
    new_Skin.M416_extendedMag = 1010040472;//kuaisu
    new_Skin.M416_quickNextended = 1010040473;//kuaikuo
    new_Skin.M416_stock = 1010040480;//zhanshuqiangtuo
    new_Skin.M416_stock2 = 1010040480;//
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
    new_Skin.M4163 = 1101004061;//愚人小丑
    new_Skin.M416_2 = 1010040611;
    new_Skin.M416_3 = 1010040612;
    new_Skin.M416_4 = 1010040613;
    new_Skin.M416_flash = 1010040577;
    new_Skin.M416_compe = 1010040578;
    new_Skin.M416_silent = 1010040579;
    new_Skin.M416_reddot = 1010040569;
    new_Skin.M416_holo = 1010040568;
    new_Skin.M416_x2 = 1010040567;
    new_Skin.M416_x3 = 1010040566;
    new_Skin.M416_x4 = 1010040565;
    new_Skin.M416_x6 = 1010040564;
    new_Skin.M416_quickMag = 1010040570;
    new_Skin.M416_extendedMag = 1010040575;
    new_Skin.M416_quickNextended = 1010040576;
    new_Skin.M416_stock = 1010040586;
    new_Skin.M416_stock2 = 1010040586;
    new_Skin.M416_stock3 = 1010040586;
    new_Skin.M416_stock4 = 1010040586;
    new_Skin.M416_stock5 = 1010040586;
    new_Skin.M416_verical = 203015;
    new_Skin.M416_angle = 1010040580;
    new_Skin.M416_lightgrip = 1010040587;
    new_Skin.M416_pink = 1010040588;
    new_Skin.M416_lazer = 1010040589;
    new_Skin.M416_thumb = 1010040584;
  }
  if (preferences.Config.Skin.M416 == 3) {
    new_Skin.M4163 = 1101004077;
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
    new_Skin.M4163 = 1101004085;
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
    new_Skin.M4163 = 1101004097;
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
    new_Skin.M4163 = 1101004137;
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
    new_Skin.M4163 = 1101004162;
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
    new_Skin.M4163 = 1101004200;
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
    new_Skin.M4163 = 1101004208;
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
  }/*
  if (preferences.Config.Skin.M416 == 10) {

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
  }*/
  if (preferences.Config.Skin.M416 == 11) {
    new_Skin.M4163 = 1101004225;
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
  
  if (preferences.Config.Skin.M416 == 12) {
    new_Skin.M4163 = 1101004235;
    new_Skin.M416_2 = 1010042361;
    new_Skin.M416_3 = 1010042362;
    new_Skin.M416_4 = 1010042363;
    new_Skin.M416_flash = 1010042307;
    new_Skin.M416_compe = 1010042306;
    new_Skin.M416_silent = 1010042308;
    new_Skin.M416_reddot = 1010042299;
    new_Skin.M416_holo = 1010042298;
    new_Skin.M416_x2 = 1010042297;
    new_Skin.M416_x3 = 1010042296;
    new_Skin.M416_x4 = 1010042295;
    new_Skin.M416_x6 = 1010042294;
    new_Skin.M416_quickMag = 1010042300;
    new_Skin.M416_extendedMag = 1010042304;
    new_Skin.M416_quickNextended = 1010042305;
    new_Skin.M416_stock = 1010042315;
    new_Skin.M416_stock2 = 1010042315;
    new_Skin.M416_stock3 = 1010042315;
    new_Skin.M416_stock4 = 1010042315;
    new_Skin.M416_stock5 = 1010042315;
    new_Skin.M416_verical = 1010042314;
    new_Skin.M416_thumb = 1010042310;
    new_Skin.M416_angle = 1010042309;
    new_Skin.M416_lightgrip = 1010042316;
    new_Skin.M416_pink = 1010042317;
    new_Skin.M416_lazer = 1010042318;
  }
if (preferences.Config.Skin.M416 == 13) {
    new_Skin.M4163 = 1101004045;
    new_Skin.M416_2 = 1010040461;
    new_Skin.M416_3 = 1010040462;
    new_Skin.M416_4 = 1010040463;
    new_Skin.M416_flash = 1010040474;
    new_Skin.M416_compe = 1010040475;
    new_Skin.M416_silent = 1010040476;
   new_Skin.M416_reddot = 203001;
   new_Skin.M416_holo = 203002;
   new_Skin.M416_x2 = 203003;
   new_Skin.M416_x3 = 203014;
    new_Skin.M416_x4 = 203004;
  
    new_Skin.M416_x6 = 203015;
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
//数字4的替换
if (preferences.Config.Skin.M416 == 0) {//枪械M416
    new_Skin.M4164 = 101004;//枪身
    new_Skin.M416_2 = 291004;//弹匣
    new_Skin.M416_3 = 203008;//瞄具
    new_Skin.M416_4 = 205005;//枪托
    new_Skin.M416_flash = 201010;//消炎
    new_Skin.M416_compe = 201009;//
    new_Skin.M416_silent = 201011;//
    new_Skin.M416_reddot = 203001;//红点
    new_Skin.M416_holo = 203002;//
    new_Skin.M416_x2 = 203003;//
    new_Skin.M416_x3 = 203014;//
    new_Skin.M416_x4 = 203004;//
    new_Skin.M416_x6 = 203015;//
    new_Skin.M416_quickMag = 204012;//
    new_Skin.M416_extendedMag = 204011;//
    new_Skin.M416_quickNextended = 204013;//
    new_Skin.M416_stock = 205002;//枪托
    new_Skin.M416_stock2 = 2050022;//品质修
    new_Skin.M416_stock3 = 2050023;//完好
    new_Skin.M416_stock4 = 2050024;//改
    new_Skin.M416_stock5 = 2050025;//精
    new_Skin.M416_verical = 203015;//6倍
    new_Skin.M416_angle = 202001;//woba
    new_Skin.M416_lightgrip = 202004;//woba
    new_Skin.M416_pink = 202005;//woba
    new_Skin.M416_lazer = 203015;//woba
    new_Skin.M416_thumb = 202006;//woba
  }
  if (preferences.Config.Skin.M416 == 1) {
    new_Skin.M4164 = 1101004045;//ID: 1101004045 | name: 冰霜核心-M416(6级)
    new_Skin.M416_2 = 1010040461;//弹匣
    new_Skin.M416_3 = 1010040462;//瞄具
    new_Skin.M416_4 = 1010040463;//枪托
    new_Skin.M416_flash = 1010040474;//xiaoyanqi
    new_Skin.M416_compe = 1010040475;//buchangqi
    new_Skin.M416_silent = 1010040476;//xiaoyinqi
    new_Skin.M416_reddot = 1010040470;//hongdian
    new_Skin.M416_holo = 1010040469;
    new_Skin.M416_x2 = 1010040468;
    new_Skin.M416_x3 = 1010040467;
    new_Skin.M416_x4 = 1010040466;
    new_Skin.M416_x6 = 1010040481;
    new_Skin.M416_quickMag = 1010040471;//kuaikuo
    new_Skin.M416_extendedMag = 1010040472;//kuaisu
    new_Skin.M416_quickNextended = 1010040473;//kuaikuo
    new_Skin.M416_stock = 1010040480;//zhanshuqiangtuo
    new_Skin.M416_stock2 = 1010040480;//
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
    new_Skin.M4164 = 1101004061;//愚人小丑
    new_Skin.M416_2 = 1010040611;
    new_Skin.M416_3 = 1010040612;
    new_Skin.M416_4 = 1010040613;
    new_Skin.M416_flash = 1010040577;
    new_Skin.M416_compe = 1010040578;
    new_Skin.M416_silent = 1010040579;
    new_Skin.M416_reddot = 1010040569;
    new_Skin.M416_holo = 1010040568;
    new_Skin.M416_x2 = 1010040567;
    new_Skin.M416_x3 = 1010040566;
    new_Skin.M416_x4 = 1010040565;
    new_Skin.M416_x6 = 1010040564;
    new_Skin.M416_quickMag = 1010040570;
    new_Skin.M416_extendedMag = 1010040575;
    new_Skin.M416_quickNextended = 1010040576;
    new_Skin.M416_stock = 1010040586;
    new_Skin.M416_stock2 = 1010040586;
    new_Skin.M416_stock3 = 1010040586;
    new_Skin.M416_stock4 = 1010040586;
    new_Skin.M416_stock5 = 1010040586;
    new_Skin.M416_verical = 203015;
    new_Skin.M416_angle = 1010040580;
    new_Skin.M416_lightgrip = 1010040587;
    new_Skin.M416_pink = 1010040588;
    new_Skin.M416_lazer = 1010040589;
    new_Skin.M416_thumb = 1010040584;
  }
  if (preferences.Config.Skin.M416 == 3) {
    new_Skin.M4164 = 1101004077;
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
    new_Skin.M4164 = 1101004085;
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
    new_Skin.M4164 = 1101004097;
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
    new_Skin.M4164 = 1101004137;
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
    new_Skin.M4164 = 1101004162;
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
    new_Skin.M4164 = 1101004200;
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
    new_Skin.M4164 = 1101004208;
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
  }/*
  if (preferences.Config.Skin.M416 == 10) {

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
  }*/
  if (preferences.Config.Skin.M416 == 11) {
    new_Skin.M4164 = 1101004225;
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
  
  if (preferences.Config.Skin.M416 == 12) {
    new_Skin.M4164 = 1101004235;
    new_Skin.M416_2 = 1010042361;
    new_Skin.M416_3 = 1010042362;
    new_Skin.M416_4 = 1010042363;
    new_Skin.M416_flash = 1010042307;
    new_Skin.M416_compe = 1010042306;
    new_Skin.M416_silent = 1010042308;
    new_Skin.M416_reddot = 1010042299;
    new_Skin.M416_holo = 1010042298;
    new_Skin.M416_x2 = 1010042297;
    new_Skin.M416_x3 = 1010042296;
    new_Skin.M416_x4 = 1010042295;
    new_Skin.M416_x6 = 1010042294;
    new_Skin.M416_quickMag = 1010042300;
    new_Skin.M416_extendedMag = 1010042304;
    new_Skin.M416_quickNextended = 1010042305;
    new_Skin.M416_stock = 1010042315;
    new_Skin.M416_stock2 = 1010042315;
    new_Skin.M416_stock3 = 1010042315;
    new_Skin.M416_stock4 = 1010042315;
    new_Skin.M416_stock5 = 1010042315;
    new_Skin.M416_verical = 1010042314;
    new_Skin.M416_thumb = 1010042310;
    new_Skin.M416_angle = 1010042309;
    new_Skin.M416_lightgrip = 1010042316;
    new_Skin.M416_pink = 1010042317;
    new_Skin.M416_lazer = 1010042318;
  }
if (preferences.Config.Skin.M416 == 13) {
    new_Skin.M4164 = 1101004045;
    new_Skin.M416_2 = 1010040461;
    new_Skin.M416_3 = 1010040462;
    new_Skin.M416_4 = 1010040463;
    new_Skin.M416_flash = 1010040474;
    new_Skin.M416_compe = 1010040475;
    new_Skin.M416_silent = 1010040476;
   new_Skin.M416_reddot = 203001;
   new_Skin.M416_holo = 203002;
   new_Skin.M416_x2 = 203003;
   new_Skin.M416_x3 = 203014;
    new_Skin.M416_x4 = 203004;
  
    new_Skin.M416_x6 = 203015;
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
  
  
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.Groza == 0) {
    new_Skin.Groza = 101005;
  }
  if (preferences.Config.Skin.Groza == 1) {
    new_Skin.Groza = 1101005018;
  }
  if (preferences.Config.Skin.Groza == 2) {
    new_Skin.Groza = 1101005024;
  }
  if (preferences.Config.Skin.Groza == 3) {
    new_Skin.Groza = 1101005037;
  }
  if (preferences.Config.Skin.Groza == 4) {
    new_Skin.Groza = 1101005042;
  }
  if (preferences.Config.Skin.Groza == 5) {
    new_Skin.Groza = 1101005051;
  }
  if (preferences.Config.Skin.Groza == 6) {
    new_Skin.Groza = 1101005081;             
  }
  if (preferences.Config.Skin.Groza == 7) {
    new_Skin.Groza = 1101005097;              
  }
///
if (preferences.Config.Skin.Groza == 0) {
    new_Skin.Groza1 = 101005;
  }
  if (preferences.Config.Skin.Groza == 1) {
    new_Skin.Groza1 = 1101005018;
  }
  if (preferences.Config.Skin.Groza == 2) {
    new_Skin.Groza1 = 1101005024;
  }
  if (preferences.Config.Skin.Groza == 3) {
    new_Skin.Groza1 = 1101005037;
  }
  if (preferences.Config.Skin.Groza == 4) {
    new_Skin.Groza1 = 1101005042;
  }
  if (preferences.Config.Skin.Groza == 5) {
    new_Skin.Groza1 = 1101005051;
  }
  if (preferences.Config.Skin.Groza == 6) {
    new_Skin.Groza1 = 1101005081;             
  }
  if (preferences.Config.Skin.Groza == 7) {
    new_Skin.Groza1 = 1101005097;              
  }
////////
if (preferences.Config.Skin.Groza == 0) {
    new_Skin.Groza2 = 101005;
  }
  if (preferences.Config.Skin.Groza == 1) {
    new_Skin.Groza2 = 1101005018;
  }
  if (preferences.Config.Skin.Groza == 2) {
    new_Skin.Groza2 = 1101005024;
  }
  if (preferences.Config.Skin.Groza == 3) {
    new_Skin.Groza2 = 1101005037;
  }
  if (preferences.Config.Skin.Groza == 4) {
    new_Skin.Groza2 = 1101005042;
  }
  if (preferences.Config.Skin.Groza == 5) {
    new_Skin.Groza2 = 1101005051;
  }
  if (preferences.Config.Skin.Groza == 6) {
    new_Skin.Groza2 = 1101005081;             
  }
  if (preferences.Config.Skin.Groza == 7) {
    new_Skin.Groza2 = 1101005097; 
///             
  }if (preferences.Config.Skin.Groza == 0) {
    new_Skin.Groza3 = 101005;
  }
  if (preferences.Config.Skin.Groza == 1) {
    new_Skin.Groza3 = 1101005018;
  }
  if (preferences.Config.Skin.Groza == 2) {
    new_Skin.Groza3 = 1101005024;
  }
  if (preferences.Config.Skin.Groza == 3) {
    new_Skin.Groza3 = 1101005037;
  }
  if (preferences.Config.Skin.Groza == 4) {
    new_Skin.Groza3 = 1101005042;
  }
  if (preferences.Config.Skin.Groza == 5) {
    new_Skin.Groza3 = 1101005051;
  }
  if (preferences.Config.Skin.Groza == 6) {
    new_Skin.Groza3 = 1101005081;             
  }
  if (preferences.Config.Skin.Groza == 7) {
    new_Skin.Groza3 = 1101005097;              
  }
////
if (preferences.Config.Skin.Groza == 0) {
    new_Skin.Groza4 = 101005;
  }
  if (preferences.Config.Skin.Groza == 1) {
    new_Skin.Groza4 = 1101005018;
  }
  if (preferences.Config.Skin.Groza == 2) {
    new_Skin.Groza4 = 1101005024;
  }
  if (preferences.Config.Skin.Groza == 3) {
    new_Skin.Groza4 = 1101005037;
  }
  if (preferences.Config.Skin.Groza == 4) {
    new_Skin.Groza4 = 1101005042;
  }
  if (preferences.Config.Skin.Groza == 5) {
    new_Skin.Groza4 = 1101005051;
  }
  if (preferences.Config.Skin.Groza == 6) {
    new_Skin.Groza4 = 1101005081;             
  }
  if (preferences.Config.Skin.Groza == 7) {
    new_Skin.Groza4 = 1101005097;              
  }
///////
if (preferences.Config.Skin.Groza == 0) {
    new_Skin.Groza5 = 101005;
  }
  if (preferences.Config.Skin.Groza == 1) {
    new_Skin.Groza5 = 1101005018;
  }
  if (preferences.Config.Skin.Groza == 2) {
    new_Skin.Groza5 = 1101005024;
  }
  if (preferences.Config.Skin.Groza == 3) {
    new_Skin.Groza5 = 1101005037;
  }
  if (preferences.Config.Skin.Groza == 4) {
    new_Skin.Groza5 = 1101005042;
  }
  if (preferences.Config.Skin.Groza == 5) {
    new_Skin.Groza5 = 1101005051;
  }
  if (preferences.Config.Skin.Groza == 6) {
    new_Skin.Groza5 = 1101005081;             
  }
  if (preferences.Config.Skin.Groza == 7) {
    new_Skin.Groza5 = 1101005097;              
  }
//////
if (preferences.Config.Skin.Groza == 0) {
    new_Skin.Groza6 = 101005;
  }
  if (preferences.Config.Skin.Groza == 1) {
    new_Skin.Groza6 = 1101005018;
  }
  if (preferences.Config.Skin.Groza == 2) {
    new_Skin.Groza6 = 1101005024;
  }
  if (preferences.Config.Skin.Groza == 3) {
    new_Skin.Groza6 = 1101005037;
  }
  if (preferences.Config.Skin.Groza == 4) {
    new_Skin.Groza6 = 1101005042;
  }
  if (preferences.Config.Skin.Groza == 5) {
    new_Skin.Groza6 = 1101005051;
  }
  if (preferences.Config.Skin.Groza == 6) {
    new_Skin.Groza6 = 1101005081;             
  }
  if (preferences.Config.Skin.Groza == 7) {
    new_Skin.Groza6 = 1101005097;              
  }
  
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.AUG == 0)
    new_Skin.AUG = 101006;
  if (preferences.Config.Skin.AUG == 1)
    new_Skin.AUG = 1101006032;
  if (preferences.Config.Skin.AUG == 2)
    new_Skin.AUG = 1101006043;
  if (preferences.Config.Skin.AUG == 3)
    new_Skin.AUG = 1101006061;
new_Skin.AUG红点 = 1010060696;
new_Skin.AUG6倍 = 1010060691;
if (preferences.Config.Skin.AUG == 4)
    new_Skin.AUG = 1101006074;
new_Skin.AUG红点 = 1010060696;
new_Skin.AUG6倍 = 1010060691;
///
if (preferences.Config.Skin.AUG == 0)
    new_Skin.AUG1 = 101006;
  if (preferences.Config.Skin.AUG == 1)
    new_Skin.AUG1 = 1101006032;
  if (preferences.Config.Skin.AUG == 2)
    new_Skin.AUG1 = 1101006043;
  if (preferences.Config.Skin.AUG == 3)
    new_Skin.AUG1 = 1101006061;
if (preferences.Config.Skin.AUG == 4)
    new_Skin.AUG1 = 1101006074;
/////////
if (preferences.Config.Skin.AUG == 0)
    new_Skin.AUG2 = 101006;
  if (preferences.Config.Skin.AUG == 1)
    new_Skin.AUG2 = 1101006032;
  if (preferences.Config.Skin.AUG == 2)
    new_Skin.AUG2 = 1101006043;
  if (preferences.Config.Skin.AUG == 3)
    new_Skin.AUG2 = 1101006061;
if (preferences.Config.Skin.AUG == 4)
    new_Skin.AUG2 = 1101006074;
/////
if (preferences.Config.Skin.AUG == 0)
    new_Skin.AUG3 = 101006;
  if (preferences.Config.Skin.AUG == 1)
    new_Skin.AUG3 = 1101006032;
  if (preferences.Config.Skin.AUG == 2)
    new_Skin.AUG3 = 1101006043;
  if (preferences.Config.Skin.AUG == 3)
    new_Skin.AUG3 = 1101006061;
if (preferences.Config.Skin.AUG == 4)
    new_Skin.AUG3 = 1101006074;
///
if (preferences.Config.Skin.AUG == 0)
    new_Skin.AUG4 = 101006;
  if (preferences.Config.Skin.AUG == 1)
    new_Skin.AUG4 = 1101006032;
  if (preferences.Config.Skin.AUG == 2)
    new_Skin.AUG4 = 1101006043;
  if (preferences.Config.Skin.AUG == 3)
    new_Skin.AUG4 = 1101006061;
if (preferences.Config.Skin.AUG == 4)
    new_Skin.AUG4 = 1101006074;
//
if (preferences.Config.Skin.AUG == 0)
    new_Skin.AUG5 = 101006;
  if (preferences.Config.Skin.AUG == 1)
    new_Skin.AUG5 = 1101006032;
  if (preferences.Config.Skin.AUG == 2)
    new_Skin.AUG5 = 1101006043;
  if (preferences.Config.Skin.AUG == 3)
    new_Skin.AUG5 = 1101006061;
if (preferences.Config.Skin.AUG == 4)
    new_Skin.AUG5 = 1101006074;
///
if (preferences.Config.Skin.AUG == 0)
    new_Skin.AUG6 = 101006;
  if (preferences.Config.Skin.AUG == 1)
    new_Skin.AUG6 = 1101006032;
  if (preferences.Config.Skin.AUG == 2)
    new_Skin.AUG6 = 1101006043;
  if (preferences.Config.Skin.AUG == 3)
    new_Skin.AUG6 = 1101006061;
if (preferences.Config.Skin.AUG == 4)
    new_Skin.AUG6 = 1101006074;
  /*
  if (preferences.Config.Skin.QBZ == 0)
    new_Skin.QBZ = 101007;
  if (preferences.Config.Skin.QBZ == 1)
    new_Skin.QBZ = 1101007024;
  if (preferences.Config.Skin.QBZ == 2)
    new_Skin.QBZ = 1101007035;
  if (preferences.Config.Skin.QBZ == 3)
    new_Skin.QBZ = 1101007045
*/
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.M762 == 0) {
    new_Skin.M762 = 101008;
    new_Skin.M762_Mag = 291008;
    new_Skin.M762_flash = 201010;
    new_Skin.M762_compe = 201009;
    new_Skin.M762_silent = 201011;
    new_Skin.M762_红点 = 203001;
    new_Skin.M762_全息 = 203002;
    new_Skin.M762_2倍镜 = 203003;
    new_Skin.M762_3倍镜 = 203014;
    new_Skin.M762_4倍镜 = 203004;
    new_Skin.M762_6倍镜 = 203015;
    new_Skin.M762_quickMag = 204012;
    new_Skin.M762_extendedMag = 204011;
    new_Skin.M762_quickNextended = 204013;
    new_Skin.M762_angle = 202001;
    new_Skin.M762_lightgrip = 202004;
    new_Skin.M762_pink = 202005;
    new_Skin.M762_lazer = 202007;
    new_Skin.M762_thumb = 202006;
new_Skin.longyin_x1111 = 1030070218;
    new_Skin.longyin_x2222 = 1030070216;
    new_Skin.longyin_x3333 = 1030070215;
    new_Skin.longyin_x4444 = 1030070214;
    new_Skin.longyin_x6666 = 1030070213;
    new_Skin.longyin_x8888 = 1030070212;
  }
  if (preferences.Config.Skin.M762 == 1) {
    new_Skin.M762 = 1101008025;
    new_Skin.M762_Mag = 1010080261;
    new_Skin.M762_flash = 201010;
    new_Skin.M762_compe = 201009;
    new_Skin.M762_silent = 201011;
    new_Skin.M762_红点 = 203001;
    new_Skin.M762_全息 = 203002;
    new_Skin.M762_2倍镜 = 203003;
    new_Skin.M762_3倍镜 = 203014;
    new_Skin.M762_4倍镜 = 203004;
    new_Skin.M762_6倍镜 = 203015;
    new_Skin.M762_quickMag = 204012;
    new_Skin.M762_extendedMag = 204011;
    new_Skin.M762_quickNextended = 204013;
    new_Skin.M762_angle = 202001;
    new_Skin.M762_lightgrip = 202004;
    new_Skin.M762_pink = 202005;
    new_Skin.M762_lazer = 202007;
    new_Skin.M762_thumb = 202006;
  }
  if (preferences.Config.Skin.M762 == 2) {
    new_Skin.M762 = 1101008050;
    new_Skin.M762_Mag = 1010080511;
    new_Skin.M762_flash = 201010;
    new_Skin.M762_compe = 201009;
    new_Skin.M762_silent = 201011;
    new_Skin.M762_红点 = 203001;
    new_Skin.M762_全息 = 203002;
    new_Skin.M762_2倍镜 = 203003;
    new_Skin.M762_3倍镜 = 203014;
    new_Skin.M762_4倍镜 = 203004;
    new_Skin.M762_6倍镜 = 203015;
    new_Skin.M762_quickMag = 204012;
    new_Skin.M762_extendedMag = 204011;
    new_Skin.M762_quickNextended = 204013;
    new_Skin.M762_angle = 202001;
    new_Skin.M762_lightgrip = 202004;
    new_Skin.M762_pink = 202005;
    new_Skin.M762_lazer = 202007;
    new_Skin.M762_thumb = 202006;
  }
  if (preferences.Config.Skin.M762 == 3) {
    new_Skin.M762 = 1101008060;
    new_Skin.M762_Mag = 1010080611;
    new_Skin.M762_flash = 201010;
    new_Skin.M762_compe = 201009;
    new_Skin.M762_silent = 201011;
    new_Skin.M762_红点 = 203001;
    new_Skin.M762_全息 = 203002;
    new_Skin.M762_2倍镜 = 203003;
    new_Skin.M762_3倍镜 = 203014;
    new_Skin.M762_4倍镜 = 203004;
    new_Skin.M762_6倍镜 = 203015;
    new_Skin.M762_quickMag = 204012;
    new_Skin.M762_extendedMag = 204011;
    new_Skin.M762_quickNextended = 204013;
    new_Skin.M762_angle = 202001;
    new_Skin.M762_lightgrip = 202004;
    new_Skin.M762_pink = 202005;
    new_Skin.M762_lazer = 202007;
    new_Skin.M762_thumb = 202006;
  }
  if (preferences.Config.Skin.M762 == 4) {
    new_Skin.M762 = 1101008080;
    new_Skin.M762_Mag = 1010080811;
    new_Skin.M762_flash = 201010;
    new_Skin.M762_compe = 201009;
    new_Skin.M762_silent = 201011;
    new_Skin.M762_红点 = 1010080976;
    new_Skin.M762_全息 = 203002;
    new_Skin.M762_2倍镜 = 203003;
    new_Skin.M762_3倍镜 = 203014;
    new_Skin.M762_4倍镜 = 203004;
    new_Skin.M762_6倍镜 = 203015;
    new_Skin.M762_quickMag = 204012;
    new_Skin.M762_extendedMag = 204011;
    new_Skin.M762_quickNextended = 204013;
    new_Skin.M762_angle = 202001;
    new_Skin.M762_lightgrip = 202004;
    new_Skin.M762_pink = 202005;
    new_Skin.M762_lazer = 202007;
    new_Skin.M762_thumb = 202006;
  }
  if (preferences.Config.Skin.M762 == 5) {
    new_Skin.M762 = 1101008103;
    new_Skin.M762_Mag = 1010081041;
    new_Skin.M762_flash = 201010;
    new_Skin.M762_compe = 201009;
    new_Skin.M762_silent = 201011;
    new_Skin.M762_红点 = 203001;
    new_Skin.M762_全息 = 203002;
    new_Skin.M762_2倍镜 = 203003;
    new_Skin.M762_3倍镜 = 203014;
    new_Skin.M762_4倍镜 = 203004;
    new_Skin.M762_6倍镜 = 203015;
    new_Skin.M762_quickMag = 204012;
    new_Skin.M762_extendedMag = 204011;
    new_Skin.M762_quickNextended = 204013;
    new_Skin.M762_angle = 202001;
    new_Skin.M762_lightgrip = 202004;
    new_Skin.M762_pink = 202005;
    new_Skin.M762_lazer = 202007;
    new_Skin.M762_thumb = 202006;
  }
  if (preferences.Config.Skin.M762 == 6) {
    new_Skin.M762 = 1101008115;
    new_Skin.M762_Mag = 1010081161;
    new_Skin.M762_flash = 201010;
    new_Skin.M762_compe = 201009;
    new_Skin.M762_silent = 201011;
    new_Skin.M762_红点 = 1010081206;
    new_Skin.M762_全息 = 203002;
    new_Skin.M762_2倍镜 = 203003;
    new_Skin.M762_3倍镜 = 203014;
    new_Skin.M762_4倍镜 = 203004;
    new_Skin.M762_6倍镜 = 203015;
    new_Skin.M762_quickMag = 204012;
    new_Skin.M762_extendedMag = 204011;
    new_Skin.M762_quickNextended = 204013;
    new_Skin.M762_angle = 202001;
    new_Skin.M762_lightgrip = 202004;
    new_Skin.M762_pink = 202005;
    new_Skin.M762_lazer = 202007;
    new_Skin.M762_thumb = 202006;
  }
  if (preferences.Config.Skin.M762 == 7) {
    new_Skin.M762 = 1101008125;
    new_Skin.M762_Mag = 1010081261;
    new_Skin.M762_flash = 201010;
    new_Skin.M762_compe = 201009;
    new_Skin.M762_silent = 201011;
    new_Skin.M762_红点 = 1010081307;
    new_Skin.M762_全息 = 203002;
    new_Skin.M762_2倍镜 = 203003;
    new_Skin.M762_3倍镜 = 203014;
    new_Skin.M762_4倍镜 = 203004;
    new_Skin.M762_6倍镜 = 203015;
    new_Skin.M762_quickMag = 204012;
    new_Skin.M762_extendedMag = 204011;
    new_Skin.M762_quickNextended = 204013;
    new_Skin.M762_angle = 202001;
    new_Skin.M762_lightgrip = 202004;
    new_Skin.M762_pink = 202005;
    new_Skin.M762_lazer = 202007;
    new_Skin.M762_thumb = 202006;
  }
  if (preferences.Config.Skin.M762 == 8) {
    new_Skin.M762 = 1101008135;
    new_Skin.M762_Mag = 1010081361;
    new_Skin.M762_flash = 1010081401;
    new_Skin.M762_compe = 1010081402;
    new_Skin.M762_silent = 1010081401;
    new_Skin.M762_红点 = 1010081396;
    new_Skin.M762_全息 = 1010081395;
    new_Skin.M762_2倍镜 = 1010081394;
    new_Skin.M762_3倍镜 = 1010081393;
    new_Skin.M762_4倍镜 = 1010081392;
    new_Skin.M762_6倍镜 = 1010081391;
    new_Skin.M762_quickMag = 1010081397;
    new_Skin.M762_extendedMag = 1010081398;
    new_Skin.M762_quickNextended = 1010081399;
    new_Skin.M762_thumb = 1010081408;
    new_Skin.M762_angle = 1010081404;
    new_Skin.M762_lightgrip = 1010081406;
    new_Skin.M762_pink = 1010081407;
    new_Skin.M762_lazer = 1010081409;
  }
if (preferences.Config.Skin.M762 == 9) {
    new_Skin.M762 = 1101008145;
    new_Skin.M762_Mag = 1010081427;
    new_Skin.M762_flash = 201010;
    new_Skin.M762_compe = 201009;
    new_Skin.M762_silent = 201011;
    new_Skin.M762_红点 = 1010081526;
    new_Skin.M762_全息 = 203002;
    new_Skin.M762_2倍镜 = 203003;
    new_Skin.M762_3倍镜 = 203014;
    new_Skin.M762_4倍镜 = 203004;
    new_Skin.M762_6倍镜 = 203015;
    new_Skin.M762_quickMag = 204012;
    new_Skin.M762_extendedMag = 204011;
    new_Skin.M762_quickNextended = 204013;
    new_Skin.M762_angle = 202001;
    new_Skin.M762_lightgrip = 202004;
    new_Skin.M762_pink = 202005;
    new_Skin.M762_lazer = 202007;
    new_Skin.M762_thumb = 202006;
}///
  if (preferences.Config.Skin.M762 == 0) {
    new_Skin.M7621 = 101008;
    new_Skin.M762_Mag = 291008;
    new_Skin.M762_flash = 201010;
    new_Skin.M762_compe = 201009;
    new_Skin.M762_silent = 201011;

    new_Skin.M762_quickMag = 204012;
    new_Skin.M762_extendedMag = 204011;
    new_Skin.M762_quickNextended = 204013;
    new_Skin.M762_angle = 202001;
    new_Skin.M762_lightgrip = 202004;
    new_Skin.M762_pink = 202005;
    new_Skin.M762_lazer = 202007;
    new_Skin.M762_thumb = 202006;
  }
  if (preferences.Config.Skin.M762 == 1) {
    new_Skin.M7621 = 1101008025;
    new_Skin.M762_Mag = 1010080261;
    new_Skin.M762_flash = 201010;
    new_Skin.M762_compe = 201009;
    new_Skin.M762_silent = 201011;
    
    new_Skin.M762_quickMag = 204012;
    new_Skin.M762_extendedMag = 204011;
    new_Skin.M762_quickNextended = 204013;
    new_Skin.M762_angle = 202001;
    new_Skin.M762_lightgrip = 202004;
    new_Skin.M762_pink = 202005;
    new_Skin.M762_lazer = 202007;
    new_Skin.M762_thumb = 202006;
  }
  if (preferences.Config.Skin.M762 == 2) {
    new_Skin.M7621 = 1101008050;
    new_Skin.M762_Mag = 1010080511;
    new_Skin.M762_flash = 201010;
    new_Skin.M762_compe = 201009;
    new_Skin.M762_silent = 201011;
    
    new_Skin.M762_quickMag = 204012;
    new_Skin.M762_extendedMag = 204011;
    new_Skin.M762_quickNextended = 204013;
    new_Skin.M762_angle = 202001;
    new_Skin.M762_lightgrip = 202004;
    new_Skin.M762_pink = 202005;
    new_Skin.M762_lazer = 202007;
    new_Skin.M762_thumb = 202006;
  }
  if (preferences.Config.Skin.M762 == 3) {
    new_Skin.M7621 = 1101008060;
    new_Skin.M762_Mag = 1010080611;
    new_Skin.M762_flash = 201010;
    new_Skin.M762_compe = 201009;
    new_Skin.M762_silent = 201011;
    
    new_Skin.M762_quickMag = 204012;
    new_Skin.M762_extendedMag = 204011;
    new_Skin.M762_quickNextended = 204013;
    new_Skin.M762_angle = 202001;
    new_Skin.M762_lightgrip = 202004;
    new_Skin.M762_pink = 202005;
    new_Skin.M762_lazer = 202007;
    new_Skin.M762_thumb = 202006;
  }
  if (preferences.Config.Skin.M762 == 4) {
    new_Skin.M7621 = 1101008080;
    new_Skin.M762_Mag = 1010080811;
    new_Skin.M762_flash = 201010;
    new_Skin.M762_compe = 201009;
    new_Skin.M762_silent = 201011;
   
    new_Skin.M762_quickMag = 204012;
    new_Skin.M762_extendedMag = 204011;
    new_Skin.M762_quickNextended = 204013;
    new_Skin.M762_angle = 202001;
    new_Skin.M762_lightgrip = 202004;
    new_Skin.M762_pink = 202005;
    new_Skin.M762_lazer = 202007;
    new_Skin.M762_thumb = 202006;
  }
  if (preferences.Config.Skin.M762 == 5) {
    new_Skin.M7621 = 1101008103;
    new_Skin.M762_Mag = 1010081041;
    new_Skin.M762_flash = 201010;
    new_Skin.M762_compe = 201009;
    new_Skin.M762_silent = 201011;
  
    new_Skin.M762_quickMag = 204012;
    new_Skin.M762_extendedMag = 204011;
    new_Skin.M762_quickNextended = 204013;
    new_Skin.M762_angle = 202001;
    new_Skin.M762_lightgrip = 202004;
    new_Skin.M762_pink = 202005;
    new_Skin.M762_lazer = 202007;
    new_Skin.M762_thumb = 202006;
  }
  if (preferences.Config.Skin.M762 == 6) {
    new_Skin.M7621 = 1101008115;
    new_Skin.M762_Mag = 1010081161;
    new_Skin.M762_flash = 201010;
    new_Skin.M762_compe = 201009;
    new_Skin.M762_silent = 201011;
    
    new_Skin.M762_6倍镜 = 203015;
    new_Skin.M762_quickMag = 204012;
    new_Skin.M762_extendedMag = 204011;
    new_Skin.M762_quickNextended = 204013;
    new_Skin.M762_angle = 202001;
    new_Skin.M762_lightgrip = 202004;
    new_Skin.M762_pink = 202005;
    new_Skin.M762_lazer = 202007;
    new_Skin.M762_thumb = 202006;
  }
  if (preferences.Config.Skin.M762 == 7) {
    new_Skin.M7621 = 1101008125;
    new_Skin.M762_Mag = 1010081261;
    new_Skin.M762_flash = 201010;
    new_Skin.M762_compe = 201009;
    new_Skin.M762_silent = 201011;
    
    new_Skin.M762_quickMag = 204012;
    new_Skin.M762_extendedMag = 204011;
    new_Skin.M762_quickNextended = 204013;
    new_Skin.M762_angle = 202001;
    new_Skin.M762_lightgrip = 202004;
    new_Skin.M762_pink = 202005;
    new_Skin.M762_lazer = 202007;
    new_Skin.M762_thumb = 202006;
  }
  if (preferences.Config.Skin.M762 == 8) {
    new_Skin.M7621 = 1101008135;
    new_Skin.M762_Mag = 1010081361;
    new_Skin.M762_flash = 1010081401;
    new_Skin.M762_compe = 1010081402;
    new_Skin.M762_silent = 1010081401;
    
    new_Skin.M762_quickMag = 1010081397;
    new_Skin.M762_extendedMag = 1010081398;
    new_Skin.M762_quickNextended = 1010081399;
    new_Skin.M762_thumb = 1010081408;
    new_Skin.M762_angle = 1010081404;
    new_Skin.M762_lightgrip = 1010081406;
    new_Skin.M762_pink = 1010081407;
    new_Skin.M762_lazer = 1010081409;
  }
if (preferences.Config.Skin.M762 == 9) {
    new_Skin.M7621 = 1101008145;
    new_Skin.M762_Mag = 1010081427;
    new_Skin.M762_flash = 201010;
    new_Skin.M762_compe = 201009;
    new_Skin.M762_silent = 201011;
    
    new_Skin.M762_quickMag = 204012;
    new_Skin.M762_extendedMag = 204011;
    new_Skin.M762_quickNextended = 204013;
    new_Skin.M762_angle = 202001;
    new_Skin.M762_lightgrip = 202004;
    new_Skin.M762_pink = 202005;
    new_Skin.M762_lazer = 202007;
    new_Skin.M762_thumb = 202006;
}
  if (preferences.Config.Skin.M762 == 0) {
    new_Skin.M7622 = 101008;
    new_Skin.M762_Mag = 291008;
    new_Skin.M762_flash = 201010;
    new_Skin.M762_compe = 201009;
    new_Skin.M762_silent = 201011;
    
    new_Skin.M762_quickMag = 204012;
    new_Skin.M762_extendedMag = 204011;
    new_Skin.M762_quickNextended = 204013;
    new_Skin.M762_angle = 202001;
    new_Skin.M762_lightgrip = 202004;
    new_Skin.M762_pink = 202005;
    new_Skin.M762_lazer = 202007;
    new_Skin.M762_thumb = 202006;
  }
  if (preferences.Config.Skin.M762 == 1) {
    new_Skin.M7622 = 1101008025;
    new_Skin.M762_Mag = 1010080261;
    new_Skin.M762_flash = 201010;
    new_Skin.M762_compe = 201009;
    new_Skin.M762_silent = 201011;
    
    new_Skin.M762_quickMag = 204012;
    new_Skin.M762_extendedMag = 204011;
    new_Skin.M762_quickNextended = 204013;
    new_Skin.M762_angle = 202001;
    new_Skin.M762_lightgrip = 202004;
    new_Skin.M762_pink = 202005;
    new_Skin.M762_lazer = 202007;
    new_Skin.M762_thumb = 202006;
  }
  if (preferences.Config.Skin.M762 == 2) {
    new_Skin.M7622 = 1101008050;
    new_Skin.M762_Mag = 1010080511;
    new_Skin.M762_flash = 201010;
    new_Skin.M762_compe = 201009;
    new_Skin.M762_silent = 201011;
    
    new_Skin.M762_quickMag = 204012;
    new_Skin.M762_extendedMag = 204011;
    new_Skin.M762_quickNextended = 204013;
    new_Skin.M762_angle = 202001;
    new_Skin.M762_lightgrip = 202004;
    new_Skin.M762_pink = 202005;
    new_Skin.M762_lazer = 202007;
    new_Skin.M762_thumb = 202006;
  }
  if (preferences.Config.Skin.M762 == 3) {
    new_Skin.M7622 = 1101008060;
    new_Skin.M762_Mag = 1010080611;
    new_Skin.M762_flash = 201010;
    new_Skin.M762_compe = 201009;
    new_Skin.M762_silent = 201011;
    
    new_Skin.M762_quickMag = 204012;
    new_Skin.M762_extendedMag = 204011;
    new_Skin.M762_quickNextended = 204013;
    new_Skin.M762_angle = 202001;
    new_Skin.M762_lightgrip = 202004;
    new_Skin.M762_pink = 202005;
    new_Skin.M762_lazer = 202007;
    new_Skin.M762_thumb = 202006;
  }
  if (preferences.Config.Skin.M762 == 4) {
    new_Skin.M7622 = 1101008080;
    new_Skin.M762_Mag = 1010080811;
    new_Skin.M762_flash = 201010;
    new_Skin.M762_compe = 201009;
    new_Skin.M762_silent = 201011;
    
    new_Skin.M762_quickMag = 204012;
    new_Skin.M762_extendedMag = 204011;
    new_Skin.M762_quickNextended = 204013;
    new_Skin.M762_angle = 202001;
    new_Skin.M762_lightgrip = 202004;
    new_Skin.M762_pink = 202005;
    new_Skin.M762_lazer = 202007;
    new_Skin.M762_thumb = 202006;
  }
  if (preferences.Config.Skin.M762 == 5) {
    new_Skin.M7622 = 1101008103;
    new_Skin.M762_Mag = 1010081041;
    new_Skin.M762_flash = 201010;
    new_Skin.M762_compe = 201009;
    new_Skin.M762_silent = 201011;
    
    new_Skin.M762_quickMag = 204012;
    new_Skin.M762_extendedMag = 204011;
    new_Skin.M762_quickNextended = 204013;
    new_Skin.M762_angle = 202001;
    new_Skin.M762_lightgrip = 202004;
    new_Skin.M762_pink = 202005;
    new_Skin.M762_lazer = 202007;
    new_Skin.M762_thumb = 202006;
  }
  if (preferences.Config.Skin.M762 == 6) {
    new_Skin.M7622 = 1101008115;
    new_Skin.M762_Mag = 1010081161;
    new_Skin.M762_flash = 201010;
    new_Skin.M762_compe = 201009;
    new_Skin.M762_silent = 201011;
    
    new_Skin.M762_quickMag = 204012;
    new_Skin.M762_extendedMag = 204011;
    new_Skin.M762_quickNextended = 204013;
    new_Skin.M762_angle = 202001;
    new_Skin.M762_lightgrip = 202004;
    new_Skin.M762_pink = 202005;
    new_Skin.M762_lazer = 202007;
    new_Skin.M762_thumb = 202006;
  }
  if (preferences.Config.Skin.M762 == 7) {
    new_Skin.M7622 = 1101008125;
    new_Skin.M762_Mag = 1010081261;
    new_Skin.M762_flash = 201010;
    new_Skin.M762_compe = 201009;
    new_Skin.M762_silent = 201011;
    
    new_Skin.M762_quickMag = 204012;
    new_Skin.M762_extendedMag = 204011;
    new_Skin.M762_quickNextended = 204013;
    new_Skin.M762_angle = 202001;
    new_Skin.M762_lightgrip = 202004;
    new_Skin.M762_pink = 202005;
    new_Skin.M762_lazer = 202007;
    new_Skin.M762_thumb = 202006;
  }
  if (preferences.Config.Skin.M762 == 8) {
    new_Skin.M7622 = 1101008135;
    new_Skin.M762_Mag = 1010081361;
    new_Skin.M762_flash = 1010081401;
    new_Skin.M762_compe = 1010081402;
    new_Skin.M762_silent = 1010081401;
    
    new_Skin.M762_quickMag = 1010081397;
    new_Skin.M762_extendedMag = 1010081398;
    new_Skin.M762_quickNextended = 1010081399;
    new_Skin.M762_thumb = 1010081408;
    new_Skin.M762_angle = 1010081404;
    new_Skin.M762_lightgrip = 1010081406;
    new_Skin.M762_pink = 1010081407;
    new_Skin.M762_lazer = 1010081409;
  }
if (preferences.Config.Skin.M762 == 9) {
    new_Skin.M7622 = 1101008145;
    new_Skin.M762_Mag = 1010081427;
    new_Skin.M762_flash = 201010;
    new_Skin.M762_compe = 201009;
    new_Skin.M762_silent = 201011;
    
    new_Skin.M762_quickMag = 204012;
    new_Skin.M762_extendedMag = 204011;
    new_Skin.M762_quickNextended = 204013;
    new_Skin.M762_angle = 202001;
    new_Skin.M762_lightgrip = 202004;
    new_Skin.M762_pink = 202005;
    new_Skin.M762_lazer = 202007;
    new_Skin.M762_thumb = 202006;
}
  if (preferences.Config.Skin.M762 == 0) {
    new_Skin.M7623 = 101008;
    new_Skin.M762_Mag = 291008;
    new_Skin.M762_flash = 201010;
    new_Skin.M762_compe = 201009;
    new_Skin.M762_silent = 201011;
    
    new_Skin.M762_quickMag = 204012;
    new_Skin.M762_extendedMag = 204011;
    new_Skin.M762_quickNextended = 204013;
    new_Skin.M762_angle = 202001;
    new_Skin.M762_lightgrip = 202004;
    new_Skin.M762_pink = 202005;
    new_Skin.M762_lazer = 202007;
    new_Skin.M762_thumb = 202006;
  }
  if (preferences.Config.Skin.M762 == 1) {
    new_Skin.M7623 = 1101008025;
    new_Skin.M762_Mag = 1010080261;
    new_Skin.M762_flash = 201010;
    new_Skin.M762_compe = 201009;
    new_Skin.M762_silent = 201011;
    
    new_Skin.M762_quickMag = 204012;
    new_Skin.M762_extendedMag = 204011;
    new_Skin.M762_quickNextended = 204013;
    new_Skin.M762_angle = 202001;
    new_Skin.M762_lightgrip = 202004;
    new_Skin.M762_pink = 202005;
    new_Skin.M762_lazer = 202007;
    new_Skin.M762_thumb = 202006;
  }
  if (preferences.Config.Skin.M762 == 2) {
    new_Skin.M7623 = 1101008050;
    new_Skin.M762_Mag = 1010080511;
    new_Skin.M762_flash = 201010;
    new_Skin.M762_compe = 201009;
    new_Skin.M762_silent = 201011;
    
    new_Skin.M762_quickMag = 204012;
    new_Skin.M762_extendedMag = 204011;
    new_Skin.M762_quickNextended = 204013;
    new_Skin.M762_angle = 202001;
    new_Skin.M762_lightgrip = 202004;
    new_Skin.M762_pink = 202005;
    new_Skin.M762_lazer = 202007;
    new_Skin.M762_thumb = 202006;
  }
  if (preferences.Config.Skin.M762 == 3) {
    new_Skin.M7623 = 1101008060;
    new_Skin.M762_Mag = 1010080611;
    new_Skin.M762_flash = 201010;
    new_Skin.M762_compe = 201009;
    new_Skin.M762_silent = 201011;
    
    new_Skin.M762_quickMag = 204012;
    new_Skin.M762_extendedMag = 204011;
    new_Skin.M762_quickNextended = 204013;
    new_Skin.M762_angle = 202001;
    new_Skin.M762_lightgrip = 202004;
    new_Skin.M762_pink = 202005;
    new_Skin.M762_lazer = 202007;
    new_Skin.M762_thumb = 202006;
  }
  if (preferences.Config.Skin.M762 == 4) {
    new_Skin.M7623 = 1101008080;
    new_Skin.M762_Mag = 1010080811;
    new_Skin.M762_flash = 201010;
    new_Skin.M762_compe = 201009;
    new_Skin.M762_silent = 201011;
    
    new_Skin.M762_quickMag = 204012;
    new_Skin.M762_extendedMag = 204011;
    new_Skin.M762_quickNextended = 204013;
    new_Skin.M762_angle = 202001;
    new_Skin.M762_lightgrip = 202004;
    new_Skin.M762_pink = 202005;
    new_Skin.M762_lazer = 202007;
    new_Skin.M762_thumb = 202006;
  }
  if (preferences.Config.Skin.M762 == 5) {
    new_Skin.M7623 = 1101008103;
    new_Skin.M762_Mag = 1010081041;
    new_Skin.M762_flash = 201010;
    new_Skin.M762_compe = 201009;
    new_Skin.M762_silent = 201011;
    
    new_Skin.M762_quickMag = 204012;
    new_Skin.M762_extendedMag = 204011;
    new_Skin.M762_quickNextended = 204013;
    new_Skin.M762_angle = 202001;
    new_Skin.M762_lightgrip = 202004;
    new_Skin.M762_pink = 202005;
    new_Skin.M762_lazer = 202007;
    new_Skin.M762_thumb = 202006;
  }
  if (preferences.Config.Skin.M762 == 6) {
    new_Skin.M7623 = 1101008115;
    new_Skin.M762_Mag = 1010081161;
    new_Skin.M762_flash = 201010;
    new_Skin.M762_compe = 201009;
    new_Skin.M762_silent = 201011;
    
    new_Skin.M762_quickMag = 204012;
    new_Skin.M762_extendedMag = 204011;
    new_Skin.M762_quickNextended = 204013;
    new_Skin.M762_angle = 202001;
    new_Skin.M762_lightgrip = 202004;
    new_Skin.M762_pink = 202005;
    new_Skin.M762_lazer = 202007;
    new_Skin.M762_thumb = 202006;
  }
  if (preferences.Config.Skin.M762 == 7) {
    new_Skin.M7623 = 1101008125;
    new_Skin.M762_Mag = 1010081261;
    new_Skin.M762_flash = 201010;
    new_Skin.M762_compe = 201009;
    new_Skin.M762_silent = 201011;
    
    new_Skin.M762_quickMag = 204012;
    new_Skin.M762_extendedMag = 204011;
    new_Skin.M762_quickNextended = 204013;
    new_Skin.M762_angle = 202001;
    new_Skin.M762_lightgrip = 202004;
    new_Skin.M762_pink = 202005;
    new_Skin.M762_lazer = 202007;
    new_Skin.M762_thumb = 202006;
  }
  if (preferences.Config.Skin.M762 == 8) {
    new_Skin.M7623 = 1101008135;
    new_Skin.M762_Mag = 1010081361;
    new_Skin.M762_flash = 1010081401;
    new_Skin.M762_compe = 1010081402;
    new_Skin.M762_silent = 1010081401;
    
    new_Skin.M762_quickMag = 1010081397;
    new_Skin.M762_extendedMag = 1010081398;
    new_Skin.M762_quickNextended = 1010081399;
    new_Skin.M762_thumb = 1010081408;
    new_Skin.M762_angle = 1010081404;
    new_Skin.M762_lightgrip = 1010081406;
    new_Skin.M762_pink = 1010081407;
    new_Skin.M762_lazer = 1010081409;
  }
if (preferences.Config.Skin.M762 == 9) {
    new_Skin.M7623 = 1101008145;
    new_Skin.M762_Mag = 1010081427;
}
  if (preferences.Config.Skin.M762 == 0) {
    new_Skin.M7624 = 101008;
    new_Skin.M762_Mag = 291008;
  }
  if (preferences.Config.Skin.M762 == 1) {
    new_Skin.M7624 = 1101008025;
    new_Skin.M762_Mag = 1010080261;
  }
  if (preferences.Config.Skin.M762 == 2) {
    new_Skin.M7624 = 1101008050;
    new_Skin.M762_Mag = 1010080511;
  }
  if (preferences.Config.Skin.M762 == 3) {
    new_Skin.M7624 = 1101008060;
    new_Skin.M762_Mag = 1010080611;
  }
  if (preferences.Config.Skin.M762 == 4) {
    new_Skin.M7624 = 1101008080;
    new_Skin.M762_Mag = 1010080811;
  }
  if (preferences.Config.Skin.M762 == 5) {
    new_Skin.M7624 = 1101008103;
    new_Skin.M762_Mag = 1010081041;
  }
  if (preferences.Config.Skin.M762 == 6) {
    new_Skin.M7624 = 1101008115;
    new_Skin.M762_Mag = 1010081161;
  }
  if (preferences.Config.Skin.M762 == 7) {
    new_Skin.M7624 = 1101008125;
    new_Skin.M762_Mag = 1010081261;
  }
  if (preferences.Config.Skin.M762 == 8) {
    new_Skin.M7624 = 1101008135;
    new_Skin.M762_Mag = 1010081361;
    new_Skin.M762_flash = 1010081401;
    new_Skin.M762_compe = 1010081402;
    new_Skin.M762_silent = 1010081401;
    
    new_Skin.M762_quickMag = 1010081397;
    new_Skin.M762_extendedMag = 1010081398;
    new_Skin.M762_quickNextended = 1010081399;
    new_Skin.M762_thumb = 1010081408;
    new_Skin.M762_angle = 1010081404;
    new_Skin.M762_lightgrip = 1010081406;
    new_Skin.M762_pink = 1010081407;
    new_Skin.M762_lazer = 1010081409;
  }
if (preferences.Config.Skin.M762 == 9) {
    new_Skin.M7624 = 1101008145;
    new_Skin.M762_Mag = 1010081427;
}
  if (preferences.Config.Skin.M762 == 0) {
    new_Skin.M7625 = 101008;
    new_Skin.M762_Mag = 291008;
  }
  if (preferences.Config.Skin.M762 == 1) {
    new_Skin.M7625 = 1101008025;
    new_Skin.M762_Mag = 1010080261;
  }
  if (preferences.Config.Skin.M762 == 2) {
    new_Skin.M7625 = 1101008050;
    new_Skin.M762_Mag = 1010080511;
  }
  if (preferences.Config.Skin.M762 == 3) {
    new_Skin.M7625 = 1101008060;
    new_Skin.M762_Mag = 1010080611;
  }
  if (preferences.Config.Skin.M762 == 4) {
    new_Skin.M7625 = 1101008080;
    new_Skin.M762_Mag = 1010080811;
  }
  if (preferences.Config.Skin.M762 == 5) {
    new_Skin.M7625 = 1101008103;
    new_Skin.M762_Mag = 1010081041;
  }
  if (preferences.Config.Skin.M762 == 6) {
    new_Skin.M7625 = 1101008115;
    new_Skin.M762_Mag = 1010081161;
  }
  if (preferences.Config.Skin.M762 == 7) {
    new_Skin.M7625 = 1101008125;
    new_Skin.M762_Mag = 1010081261;
  }
  if (preferences.Config.Skin.M762 == 8) {
    new_Skin.M7625 = 1101008135;
    new_Skin.M762_Mag = 1010081361;
    new_Skin.M762_flash = 1010081401;
    new_Skin.M762_compe = 1010081402;
    new_Skin.M762_silent = 1010081401;
    
    new_Skin.M762_quickMag = 1010081397;
    new_Skin.M762_extendedMag = 1010081398;
    new_Skin.M762_quickNextended = 1010081399;
    new_Skin.M762_thumb = 1010081408;
    new_Skin.M762_angle = 1010081404;
    new_Skin.M762_lightgrip = 1010081406;
    new_Skin.M762_pink = 1010081407;
    new_Skin.M762_lazer = 1010081409;
  }
if (preferences.Config.Skin.M762 == 9) {
    new_Skin.M7625 = 1101008145;
    new_Skin.M762_Mag = 1010081427;
    new_Skin.M762_flash = 201010;
    new_Skin.M762_compe = 201009;
    new_Skin.M762_silent = 201011;
    
    
    new_Skin.M762_quickMag = 204012;
    new_Skin.M762_extendedMag = 204011;
    new_Skin.M762_quickNextended = 204013;
    new_Skin.M762_angle = 202001;
    new_Skin.M762_lightgrip = 202004;
    new_Skin.M762_pink = 202005;
    new_Skin.M762_lazer = 202007;
    new_Skin.M762_thumb = 202006;
}
  if (preferences.Config.Skin.M762 == 0) {
    new_Skin.M7626 = 101008;
    new_Skin.M762_Mag = 291008;
    new_Skin.M762_flash = 201010;
    new_Skin.M762_compe = 201009;
    new_Skin.M762_silent = 201011;
    
    new_Skin.M762_quickMag = 204012;
    new_Skin.M762_extendedMag = 204011;
    new_Skin.M762_quickNextended = 204013;
    new_Skin.M762_angle = 202001;
    new_Skin.M762_lightgrip = 202004;
    new_Skin.M762_pink = 202005;
    new_Skin.M762_lazer = 202007;
    new_Skin.M762_thumb = 202006;
  }
  if (preferences.Config.Skin.M762 == 1) {
    new_Skin.M7626 = 1101008025;
    new_Skin.M762_Mag = 1010080261;
    new_Skin.M762_flash = 201010;
    new_Skin.M762_compe = 201009;
    new_Skin.M762_silent = 201011;
    
    new_Skin.M762_quickMag = 204012;
    new_Skin.M762_extendedMag = 204011;
    new_Skin.M762_quickNextended = 204013;
    new_Skin.M762_angle = 202001;
    new_Skin.M762_lightgrip = 202004;
    new_Skin.M762_pink = 202005;
    new_Skin.M762_lazer = 202007;
    new_Skin.M762_thumb = 202006;
  }
  if (preferences.Config.Skin.M762 == 2) {
    new_Skin.M7626 = 1101008050;
    new_Skin.M762_Mag = 1010080511;
    new_Skin.M762_flash = 201010;
    new_Skin.M762_compe = 201009;
    new_Skin.M762_silent = 201011;
    
    new_Skin.M762_quickMag = 204012;
    new_Skin.M762_extendedMag = 204011;
    new_Skin.M762_quickNextended = 204013;
    new_Skin.M762_angle = 202001;
    new_Skin.M762_lightgrip = 202004;
    new_Skin.M762_pink = 202005;
    new_Skin.M762_lazer = 202007;
    new_Skin.M762_thumb = 202006;
  }
  if (preferences.Config.Skin.M762 == 3) {
    new_Skin.M7626 = 1101008060;
    new_Skin.M762_Mag = 1010080611;
    new_Skin.M762_flash = 201010;
    new_Skin.M762_compe = 201009;
    new_Skin.M762_silent = 201011;
    
    new_Skin.M762_quickMag = 204012;
    new_Skin.M762_extendedMag = 204011;
    new_Skin.M762_quickNextended = 204013;
    new_Skin.M762_angle = 202001;
    new_Skin.M762_lightgrip = 202004;
    new_Skin.M762_pink = 202005;
    new_Skin.M762_lazer = 202007;
    new_Skin.M762_thumb = 202006;
  }
  if (preferences.Config.Skin.M762 == 4) {
    new_Skin.M7626 = 1101008080;
    new_Skin.M762_Mag = 1010080811;
    new_Skin.M762_flash = 201010;
    new_Skin.M762_compe = 201009;
    new_Skin.M762_silent = 201011;

    new_Skin.M762_quickMag = 204012;
    new_Skin.M762_extendedMag = 204011;
    new_Skin.M762_quickNextended = 204013;
    new_Skin.M762_angle = 202001;
    new_Skin.M762_lightgrip = 202004;
    new_Skin.M762_pink = 202005;
    new_Skin.M762_lazer = 202007;
    new_Skin.M762_thumb = 202006;
  }
  if (preferences.Config.Skin.M762 == 5) {
    new_Skin.M7626 = 1101008103;
    new_Skin.M762_Mag = 1010081041;
    new_Skin.M762_flash = 201010;
    new_Skin.M762_compe = 201009;
    new_Skin.M762_silent = 201011;
    
    new_Skin.M762_quickMag = 204012;
    new_Skin.M762_extendedMag = 204011;
    new_Skin.M762_quickNextended = 204013;
    new_Skin.M762_angle = 202001;
    new_Skin.M762_lightgrip = 202004;
    new_Skin.M762_pink = 202005;
    new_Skin.M762_lazer = 202007;
    new_Skin.M762_thumb = 202006;
  }
  if (preferences.Config.Skin.M762 == 6) {
    new_Skin.M7626 = 1101008115;
    new_Skin.M762_Mag = 1010081161;
    new_Skin.M762_flash = 201010;
    new_Skin.M762_compe = 201009;
    new_Skin.M762_silent = 201011;

    new_Skin.M762_quickMag = 204012;
    new_Skin.M762_extendedMag = 204011;
    new_Skin.M762_quickNextended = 204013;
    new_Skin.M762_angle = 202001;
    new_Skin.M762_lightgrip = 202004;
    new_Skin.M762_pink = 202005;
    new_Skin.M762_lazer = 202007;
    new_Skin.M762_thumb = 202006;
  }
  if (preferences.Config.Skin.M762 == 7) {
    new_Skin.M7626 = 1101008125;
    new_Skin.M762_Mag = 1010081261;
    new_Skin.M762_flash = 201010;
    new_Skin.M762_compe = 201009;
    new_Skin.M762_silent = 201011;
    
    new_Skin.M762_quickMag = 204012;
    new_Skin.M762_extendedMag = 204011;
    new_Skin.M762_quickNextended = 204013;
    new_Skin.M762_angle = 202001;
    new_Skin.M762_lightgrip = 202004;
    new_Skin.M762_pink = 202005;
    new_Skin.M762_lazer = 202007;
    new_Skin.M762_thumb = 202006;
  }
  if (preferences.Config.Skin.M762 == 8) {
    new_Skin.M7626 = 1101008135;
    new_Skin.M762_Mag = 1010081361;
    new_Skin.M762_flash = 1010081401;
    new_Skin.M762_compe = 1010081402;
    new_Skin.M762_silent = 1010081401;
    
    new_Skin.M762_quickMag = 1010081397;
    new_Skin.M762_extendedMag = 1010081398;
    new_Skin.M762_quickNextended = 1010081399;
    new_Skin.M762_thumb = 1010081408;
    new_Skin.M762_angle = 1010081404;
    new_Skin.M762_lightgrip = 1010081406;
    new_Skin.M762_pink = 1010081407;
    new_Skin.M762_lazer = 1010081409;
  }
if (preferences.Config.Skin.M762 == 9) {
    new_Skin.M7626 = 1101008145;
    new_Skin.M762_Mag = 1010081427;
    new_Skin.M762_flash = 201010;
    new_Skin.M762_compe = 201009;
    new_Skin.M762_silent = 201011;
    
    new_Skin.M762_quickMag = 204012;
    new_Skin.M762_extendedMag = 204011;
    new_Skin.M762_quickNextended = 204013;
    new_Skin.M762_angle = 202001;
    new_Skin.M762_lightgrip = 202004;
    new_Skin.M762_pink = 202005;
    new_Skin.M762_lazer = 202007;
    new_Skin.M762_thumb = 202006;
}
  

  
    

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.ACE32 == 0)
    new_Skin.ACE32 = 101102;
  if (preferences.Config.Skin.ACE32 == 1)
    new_Skin.ACE32 = 1101102006;
  if (preferences.Config.Skin.ACE32 == 2)
    new_Skin.ACE32 = 1101102016;
  if (preferences.Config.Skin.ACE32 == 3)
    new_Skin.ACE32 = 1101102024;
new_Skin.longyin_x1111 = 1030070218;
    new_Skin.longyin_x2222 = 1030070216;
    new_Skin.longyin_x3333 = 1030070215;
    new_Skin.longyin_x4444 = 1030070214;
    new_Skin.longyin_x6666 = 1030070213;
    new_Skin.longyin_x8888 = 1030070212;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.ACE32 == 0)
    new_Skin.ACE321 = 1011022;
  if (preferences.Config.Skin.ACE32 == 1)
    new_Skin.ACE321 = 1101102006;
  if (preferences.Config.Skin.ACE32 == 2)
    new_Skin.ACE321 = 1101102016;
  if (preferences.Config.Skin.ACE32 == 3)
    new_Skin.ACE321 = 1101102024;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.ACE32 == 0)
    new_Skin.ACE322 = 1011023;
  if (preferences.Config.Skin.ACE32 == 1)
    new_Skin.ACE322 = 1101102006;
  if (preferences.Config.Skin.ACE32 == 2)
    new_Skin.ACE322 = 1101102016;
  if (preferences.Config.Skin.ACE32 == 3)
    new_Skin.ACE322 = 1101102024;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.ACE32 == 0)
    new_Skin.ACE323 = 1011024;
  if (preferences.Config.Skin.ACE32 == 1)
    new_Skin.ACE323 = 1101102006;
  if (preferences.Config.Skin.ACE32 == 2)
    new_Skin.ACE323 = 1101102016;
  if (preferences.Config.Skin.ACE32 == 3)
    new_Skin.ACE323 = 1101102024;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.ACE32 == 0)
    new_Skin.ACE324 = 1011025;
  if (preferences.Config.Skin.ACE32 == 1)
    new_Skin.ACE324 = 1101102006;
  if (preferences.Config.Skin.ACE32 == 2)
    new_Skin.ACE324 = 1101102016;
  if (preferences.Config.Skin.ACE32 == 3)
    new_Skin.ACE324 = 1101102024;
  
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.ACE32 == 0)
    new_Skin.ACE325 = 1011026;
  if (preferences.Config.Skin.ACE32 == 1)
    new_Skin.ACE325 = 1101102006;
  if (preferences.Config.Skin.ACE32 == 2)
    new_Skin.ACE325 = 1101102016;
  if (preferences.Config.Skin.ACE32 == 3)
    new_Skin.ACE325 = 1101102024;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.ACE32 == 0)
    new_Skin.ACE326 = 1011027;
  if (preferences.Config.Skin.ACE32 == 1)
    new_Skin.ACE326 = 1101102006;
  if (preferences.Config.Skin.ACE32 == 2)
    new_Skin.ACE326 = 1101102016;
  if (preferences.Config.Skin.ACE32 == 3)
    new_Skin.ACE326 = 1101102024;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
if (preferences.Config.Skin.AMR == 0){
      new_Skin.AMR = 103012;
      new_Skin.AMR1 = 1030123;
      new_Skin.AMR2 = 1030124;
      new_Skin.AMR3 = 1030125;  
new_Skin.longyin_x1111 = 1030070218;
    new_Skin.longyin_x2222 = 1030070216;
    new_Skin.longyin_x3333 = 1030070215;
    new_Skin.longyin_x4444 = 1030070214;
    new_Skin.longyin_x6666 = 1030070213;
    new_Skin.longyin_x8888 = 1030070212;
    }

    if (preferences.Config.Skin.AMR == 1){
      new_Skin.AMR = 1103012018;
      new_Skin.AMR1 = 1103012019;
      new_Skin.AMR2 = 1103012019;
      new_Skin.AMR3 = 1103012019;    
    }
    
    if (preferences.Config.Skin.AMR == 2){
      new_Skin.AMR = 1103012009;
      new_Skin.AMR1 = 1103012010;
      new_Skin.AMR2 = 1103012010;
      new_Skin.AMR3 = 1103012010;   
    }
    
    if (preferences.Config.Skin.AMR == 3){
      new_Skin.AMR = 1030120100;
      new_Skin.AMR1 = 1030120101;
      new_Skin.AMR2 = 1030120101;
      new_Skin.AMR3 = 1030120101;    
    }
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.UZI == 0)
    new_Skin.UZI = 102001;
  if (preferences.Config.Skin.UZI == 1)
    new_Skin.UZI = 1102001023;
  if (preferences.Config.Skin.UZI == 2)
    new_Skin.UZI = 1102001035;
  if (preferences.Config.Skin.UZI == 3)
    new_Skin.UZI = 1102001057;
  if (preferences.Config.Skin.UZI == 4)
    new_Skin.UZI = 1102001068;
  if (preferences.Config.Skin.UZI == 5)
    new_Skin.UZI = 1102001088;
  if (preferences.Config.Skin.UZI == 6)
    new_Skin.UZI = 1102001101;
if (preferences.Config.Skin.UZI == 7)
    new_Skin.UZI = 1102001119;
//

  if (preferences.Config.Skin.UZI == 1)
    new_Skin.UZI1 = 1102001023;
  if (preferences.Config.Skin.UZI == 2)
    new_Skin.UZI1 = 1102001035;
  if (preferences.Config.Skin.UZI == 3)
    new_Skin.UZI1 = 1102001057;
  if (preferences.Config.Skin.UZI == 4)
    new_Skin.UZI1 = 1102001068;
  if (preferences.Config.Skin.UZI == 5)
    new_Skin.UZI1 = 1102001088;
  if (preferences.Config.Skin.UZI == 6)
    new_Skin.UZI1 = 1102001101;
if (preferences.Config.Skin.UZI == 7)
    new_Skin.UZI1 = 1102001119;
//
if (preferences.Config.Skin.UZI == 0)
    new_Skin.UZI2 = 102001;
  if (preferences.Config.Skin.UZI == 1)
    new_Skin.UZI2 = 1102001023;
  if (preferences.Config.Skin.UZI == 2)
    new_Skin.UZI2 = 1102001035;
  if (preferences.Config.Skin.UZI == 3)
    new_Skin.UZI2 = 1102001057;
  if (preferences.Config.Skin.UZI == 4)
    new_Skin.UZI2 = 1102001068;
  if (preferences.Config.Skin.UZI == 5)
    new_Skin.UZI2 = 1102001088;
  if (preferences.Config.Skin.UZI == 6)
    new_Skin.UZI2 = 1102001101;
if (preferences.Config.Skin.UZI == 7)
    new_Skin.UZI2 = 1102001119;
//
if (preferences.Config.Skin.UZI == 0)
    new_Skin.UZI = 102001;
  if (preferences.Config.Skin.UZI == 1)
    new_Skin.UZI3 = 1102001023;
  if (preferences.Config.Skin.UZI == 2)
    new_Skin.UZI3 = 1102001035;
  if (preferences.Config.Skin.UZI == 3)
    new_Skin.UZI3 = 1102001057;
  if (preferences.Config.Skin.UZI == 4)
    new_Skin.UZI3 = 1102001068;
  if (preferences.Config.Skin.UZI == 5)
    new_Skin.UZI3 = 1102001088;
  if (preferences.Config.Skin.UZI == 6)
    new_Skin.UZI3 = 1102001101;
if (preferences.Config.Skin.UZI == 7)
    new_Skin.UZI3 = 1102001119;
if (preferences.Config.Skin.UZI == 0)
    new_Skin.UZI = 102001;
  if (preferences.Config.Skin.UZI == 1)
    new_Skin.UZI4 = 1102001023;
  if (preferences.Config.Skin.UZI == 2)
    new_Skin.UZI4 = 1102001035;
  if (preferences.Config.Skin.UZI == 3)
    new_Skin.UZI4 = 1102001057;
  if (preferences.Config.Skin.UZI == 4)
    new_Skin.UZI4 = 1102001068;
  if (preferences.Config.Skin.UZI == 5)
    new_Skin.UZI4 = 1102001088;
  if (preferences.Config.Skin.UZI == 6)
    new_Skin.UZI4 = 1102001101;
if (preferences.Config.Skin.UZI == 7)
    new_Skin.UZI4 = 1102001119;
if (preferences.Config.Skin.UZI == 0)
    new_Skin.UZI = 102001;
  if (preferences.Config.Skin.UZI == 1)
    new_Skin.UZI5 = 1102001023;
  if (preferences.Config.Skin.UZI == 2)
    new_Skin.UZI5 = 1102001035;
  if (preferences.Config.Skin.UZI == 3)
    new_Skin.UZI5 = 1102001057;
  if (preferences.Config.Skin.UZI == 4)
    new_Skin.UZI5 = 1102001068;
  if (preferences.Config.Skin.UZI == 5)
    new_Skin.UZI5 = 1102001088;
  if (preferences.Config.Skin.UZI == 6)
    new_Skin.UZI5 = 1102001101;
if (preferences.Config.Skin.UZI == 7)
    new_Skin.UZI5 = 1102001119;
if (preferences.Config.Skin.UZI == 0)
    new_Skin.UZI = 102001;
  if (preferences.Config.Skin.UZI == 1)
    new_Skin.UZI6 = 1102001023;
  if (preferences.Config.Skin.UZI == 2)
    new_Skin.UZI5 = 1102001035;
  if (preferences.Config.Skin.UZI == 3)
    new_Skin.UZI5 = 1102001057;
  if (preferences.Config.Skin.UZI == 4)
    new_Skin.UZI6 = 1102001068;
  if (preferences.Config.Skin.UZI == 5)
    new_Skin.UZI6 = 1102001088;
  if (preferences.Config.Skin.UZI == 6)
    new_Skin.UZI6 = 1102001101;
if (preferences.Config.Skin.UZI == 7)
    new_Skin.UZI6 = 1102001119;
  //////////////////////// ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.UMP == 0)
    new_Skin.UMP = 102002;
new_Skin.longyin_x1111 = 1030070218;
    new_Skin.longyin_x2222 = 1030070216;
    new_Skin.longyin_x3333 = 1030070215;
    new_Skin.longyin_x4444 = 1030070214;
    new_Skin.longyin_x6666 = 1030070213;
    new_Skin.longyin_x8888 = 1030070212;
  if (preferences.Config.Skin.UMP == 1)
    new_Skin.UMP = 1102002042;

  if (preferences.Config.Skin.UMP == 2)
    new_Skin.UMP = 1102002060;

  if (preferences.Config.Skin.UMP == 3)
    new_Skin.UMP = 1102002089;

  if (preferences.Config.Skin.UMP == 4)
    new_Skin.UMP = 1102002116;

  if (preferences.Config.Skin.UMP == 5)
    new_Skin.UMP = 1102002123;

  if (preferences.Config.Skin.UMP == 6)
    new_Skin.UMP = 1102002128;

  if (preferences.Config.Skin.UMP == 7)
    new_Skin.UMP = 1102002135;
 
  if (preferences.Config.Skin.UMP == 8)
    new_Skin.UMP = 1102002423;
 
if (preferences.Config.Skin.UMP == 0)
    new_Skin.UMP = 102002;
  if (preferences.Config.Skin.UMP == 1)
    new_Skin.UMP1 = 1102002042;
  if (preferences.Config.Skin.UMP == 2)
    new_Skin.UMP1 = 1102002060;
  if (preferences.Config.Skin.UMP == 3)
    new_Skin.UMP1 = 1102002089;
  if (preferences.Config.Skin.UMP == 4)
    new_Skin.UMP1 = 1102002116;
  if (preferences.Config.Skin.UMP == 5)
    new_Skin.UMP1 = 1102002123;
  if (preferences.Config.Skin.UMP == 6)
    new_Skin.UMP1 = 1102002128;
  if (preferences.Config.Skin.UMP == 7)
    new_Skin.UMP1 = 1102002135;
  if (preferences.Config.Skin.UMP == 8)
    new_Skin.UMP1 = 1102002423;
if (preferences.Config.Skin.UMP == 0)
    new_Skin.UMP = 102002;
  if (preferences.Config.Skin.UMP == 1)
    new_Skin.UMP2 = 1102002042;
  if (preferences.Config.Skin.UMP == 2)
    new_Skin.UMP2 = 1102002060;
  if (preferences.Config.Skin.UMP == 3)
    new_Skin.UMP2 = 1102002089;
  if (preferences.Config.Skin.UMP == 4)
    new_Skin.UMP2 = 1102002116;
  if (preferences.Config.Skin.UMP == 5)
    new_Skin.UMP2 = 1102002123;
  if (preferences.Config.Skin.UMP == 6)
    new_Skin.UMP2 = 1102002128;
  if (preferences.Config.Skin.UMP == 7)
    new_Skin.UMP2 = 1102002135;
  if (preferences.Config.Skin.UMP == 8)
    new_Skin.UMP2 = 1102002423;
if (preferences.Config.Skin.UMP == 0)
    new_Skin.UMP = 102002;
  if (preferences.Config.Skin.UMP == 1)
    new_Skin.UMP3 = 1102002042;
  if (preferences.Config.Skin.UMP == 2)
    new_Skin.UMP3 = 1102002060;
  if (preferences.Config.Skin.UMP == 3)
    new_Skin.UMP3 = 1102002089;
  if (preferences.Config.Skin.UMP == 4)
    new_Skin.UMP3 = 1102002116;
  if (preferences.Config.Skin.UMP == 5)
    new_Skin.UMP3 = 1102002123;
  if (preferences.Config.Skin.UMP == 6)
    new_Skin.UMP3 = 1102002128;
  if (preferences.Config.Skin.UMP == 7)
    new_Skin.UMP3 = 1102002135;
  if (preferences.Config.Skin.UMP == 8)
    new_Skin.UMP3 = 1102002423;
if (preferences.Config.Skin.UMP == 0)
    new_Skin.UMP = 102002;
  if (preferences.Config.Skin.UMP == 1)
    new_Skin.UMP4 = 1102002042;
  if (preferences.Config.Skin.UMP == 2)
    new_Skin.UMP4 = 1102002060;
  if (preferences.Config.Skin.UMP == 3)
    new_Skin.UMP4 = 1102002089;
  if (preferences.Config.Skin.UMP == 4)
    new_Skin.UMP4 = 1102002116;
  if (preferences.Config.Skin.UMP == 5)
    new_Skin.UMP4 = 1102002123;
  if (preferences.Config.Skin.UMP == 6)
    new_Skin.UMP4 = 1102002128;
  if (preferences.Config.Skin.UMP == 7)
    new_Skin.UMP4 = 1102002135;
  if (preferences.Config.Skin.UMP == 8)
    new_Skin.UMP4 = 1102002423;
if (preferences.Config.Skin.UMP == 0)
    new_Skin.UMP = 102002;
  if (preferences.Config.Skin.UMP == 1)
    new_Skin.UMP5 = 1102002042;
  if (preferences.Config.Skin.UMP == 2)
    new_Skin.UMP5 = 1102002060;
  if (preferences.Config.Skin.UMP == 3)
    new_Skin.UMP5 = 1102002089;
  if (preferences.Config.Skin.UMP == 4)
    new_Skin.UMP5 = 1102002116;
  if (preferences.Config.Skin.UMP == 5)
    new_Skin.UMP5 = 1102002123;
  if (preferences.Config.Skin.UMP == 6)
    new_Skin.UMP5 = 1102002128;
  if (preferences.Config.Skin.UMP == 7)
    new_Skin.UMP5 = 1102002135;
  if (preferences.Config.Skin.UMP == 8)
    new_Skin.UMP5 = 1102002423;
if (preferences.Config.Skin.UMP == 0)
    new_Skin.UMP = 102002;
  if (preferences.Config.Skin.UMP == 1)
    new_Skin.UMP6 = 1102002042;
  if (preferences.Config.Skin.UMP == 2)
    new_Skin.UMP6 = 1102002060;
  if (preferences.Config.Skin.UMP == 3)
    new_Skin.UMP6 = 1102002089;
  if (preferences.Config.Skin.UMP == 4)
    new_Skin.UMP6 = 1102002116;
  if (preferences.Config.Skin.UMP == 5)
    new_Skin.UMP6 = 1102002123;
  if (preferences.Config.Skin.UMP == 6)
    new_Skin.UMP6 = 1102002128;
  if (preferences.Config.Skin.UMP == 7)
    new_Skin.UMP6 = 1102002135;
  if (preferences.Config.Skin.UMP == 8)
    new_Skin.UMP6 = 1102002423;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  if (preferences.Config.Skin.Vector == 0)
    new_Skin.Vector = 102003;
  if (preferences.Config.Skin.Vector == 1)
    new_Skin.Vector = 1102003019;
  if (preferences.Config.Skin.Vector == 2)
    new_Skin.Vector = 1102003030;
  if (preferences.Config.Skin.Vector == 3)
    new_Skin.Vector = 1102003064;
  if (preferences.Config.Skin.Vector == 4)
    new_Skin.Vector = 1102003079;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.Thompson == 0)
    new_Skin.Thompson = 102004;
  if (preferences.Config.Skin.Thompson == 1)
    new_Skin.Thompson = 11020040187;
  if (preferences.Config.Skin.Thompson == 2)
    new_Skin.Thompson = 1102004033;
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
    new_Skin.K98 = 1103001059;
  if (preferences.Config.Skin.K98 == 2)
    new_Skin.K98 = 1103001078;
  if (preferences.Config.Skin.K98 == 3)
    new_Skin.K98 = 1103001100;
  if (preferences.Config.Skin.K98 == 4)
    new_Skin.K98 = 1103001144;
  if (preferences.Config.Skin.K98 == 5)
    new_Skin.K98 = 1103001159;
  if (preferences.Config.Skin.K98 == 6)
    new_Skin.K98 = 1103001178;
new_Skin.longyin_x1111 = 1030070218;
    new_Skin.longyin_x2222 = 1030070216;
    new_Skin.longyin_x3333 = 1030070215;
    new_Skin.longyin_x4444 = 1030070214;
    new_Skin.longyin_x6666 = 1030070213;
    new_Skin.longyin_x8888 = 1030070212;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (new_Skin.M24 == 0)
    new_Skin.M24 = 103002;
  if (preferences.Config.Skin.M24 == 1)
    new_Skin.M24 = 1103002017;
  if (preferences.Config.Skin.M24 == 2)
    new_Skin.M24 = 1103002029;
  if (preferences.Config.Skin.M24 == 3)
    new_Skin.M24 = 1103002047;
  if (preferences.Config.Skin.M24 == 4)
    new_Skin.M24 = 1103002055;
  if (preferences.Config.Skin.M24 == 5)
    new_Skin.M24 = 1103002086;
new_Skin.longyin_x1111 = 1030070218;
    new_Skin.longyin_x2222 = 1030070216;
    new_Skin.longyin_x3333 = 1030070215;
    new_Skin.longyin_x4444 = 1030070214;
    new_Skin.longyin_x6666 = 1030070213;
    new_Skin.longyin_x8888 = 1030070212;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.AWM == 0)
    new_Skin.AWM = 103003;
  if (preferences.Config.Skin.AWM == 1)
    new_Skin.AWM = 1103003021;
  if (preferences.Config.Skin.AWM == 2)
    new_Skin.AWM = 1103003028;
  if (preferences.Config.Skin.AWM == 3)
    new_Skin.AWM = 1103003041;
  if (preferences.Config.Skin.AWM == 4)
    new_Skin.AWM = 1103003050;
  if (preferences.Config.Skin.AWM == 5)
    new_Skin.AWM = 1103003061;
new_Skin.longyin_x1111 = 1030070218;
    new_Skin.longyin_x2222 = 1030070216;
    new_Skin.longyin_x3333 = 1030070215;
    new_Skin.longyin_x4444 = 1030070214;
    new_Skin.longyin_x6666 = 1030070213;
    new_Skin.longyin_x8888 = 1030070212;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.AWM == 0)
    new_Skin.AWM1 = 1030032;
  if (preferences.Config.Skin.AWM == 1)
    new_Skin.AWM1 = 1103003021;
  if (preferences.Config.Skin.AWM == 2)
    new_Skin.AWM1 = 1103003028;
  if (preferences.Config.Skin.AWM == 3)
    new_Skin.AWM1 = 1103003041;
  if (preferences.Config.Skin.AWM == 4)
    new_Skin.AWM1 = 1103003050;
  if (preferences.Config.Skin.AWM == 5)
    new_Skin.AWM1 = 1103003061;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.AWM == 0)
    new_Skin.AWM2 = 1030033;
  if (preferences.Config.Skin.AWM == 1)
    new_Skin.AWM2 = 1103003021;
  if (preferences.Config.Skin.AWM == 2)
    new_Skin.AWM2 = 1103003028;
  if (preferences.Config.Skin.AWM == 3)
    new_Skin.AWM2 = 1103003041;
  if (preferences.Config.Skin.AWM == 4)
    new_Skin.AWM2 = 1103003050;
  if (preferences.Config.Skin.AWM == 5)
    new_Skin.AWM2 = 1103003061;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.AWM == 0)
    new_Skin.AWM3 = 1030034;
  if (preferences.Config.Skin.AWM == 1)
    new_Skin.AWM3 = 1103003021;
  if (preferences.Config.Skin.AWM == 2)
    new_Skin.AWM3 = 1103003028;
  if (preferences.Config.Skin.AWM == 3)
    new_Skin.AWM3 = 1103003041;
  if (preferences.Config.Skin.AWM == 4)
    new_Skin.AWM3 = 1103003050;
  if (preferences.Config.Skin.AWM == 5)
    new_Skin.AWM3 = 1103003061;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.AWM == 0)
    new_Skin.AWM4 = 1030035;
  if (preferences.Config.Skin.AWM == 1)
    new_Skin.AWM4 = 1103003021;
  if (preferences.Config.Skin.AWM == 2)
    new_Skin.AWM4 = 1103003028;
  if (preferences.Config.Skin.AWM == 3)
    new_Skin.AWM4 = 1103003041;
  if (preferences.Config.Skin.AWM == 4)
    new_Skin.AWM4 = 1103003050;
  if (preferences.Config.Skin.AWM == 5)
    new_Skin.AWM4 = 1103003061;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.AWM == 0)
    new_Skin.AWM5 = 1030036;
  if (preferences.Config.Skin.AWM == 1)
    new_Skin.AWM5 = 1103003021;
  if (preferences.Config.Skin.AWM == 2)
    new_Skin.AWM5 = 1103003028;
  if (preferences.Config.Skin.AWM == 3)
    new_Skin.AWM5 = 1103003041;
  if (preferences.Config.Skin.AWM == 4)
    new_Skin.AWM5 = 1103003050;
  if (preferences.Config.Skin.AWM == 5)
    new_Skin.AWM5 = 1103003061;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.AWM == 0)
    new_Skin.AWM6 = 1030037;
  if (preferences.Config.Skin.AWM == 1)
    new_Skin.AWM6 = 1103003021;
  if (preferences.Config.Skin.AWM == 2)
    new_Skin.AWM6 = 1103003028;
  if (preferences.Config.Skin.AWM == 3)
    new_Skin.AWM6 = 1103003041;
  if (preferences.Config.Skin.AWM == 4)
    new_Skin.AWM6 = 1103003050;
  if (preferences.Config.Skin.AWM == 5)
    new_Skin.AWM6 = 1103003061;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.DP28 == 0)
    new_Skin.DP28 = 105002;
  if (preferences.Config.Skin.DP28 == 1)
    new_Skin.DP28 = 1105002017;
  if (preferences.Config.Skin.DP28 == 2)
    new_Skin.DP28 = 1105002034;
  if (preferences.Config.Skin.DP28 == 3)
    new_Skin.DP28 = 1105002057;
  if (preferences.Config.Skin.DP28 == 4)
    new_Skin.DP28 = 1105002062;
new_Skin.longyin_x1111 = 1030070218;
    new_Skin.longyin_x2222 = 1030070216;
    new_Skin.longyin_x3333 = 1030070215;
    new_Skin.longyin_x4444 = 1030070214;
    new_Skin.longyin_x6666 = 1030070213;
    new_Skin.longyin_x8888 = 1030070212;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.DP28 == 0)
    new_Skin.DP281 = 1050022;
  if (preferences.Config.Skin.DP28 == 1)
    new_Skin.DP281 = 1105002017;
  if (preferences.Config.Skin.DP28 == 2)
    new_Skin.DP281 = 1105002034;
  if (preferences.Config.Skin.DP28 == 3)
    new_Skin.DP281 = 1105002057;
  if (preferences.Config.Skin.DP28 == 4)
    new_Skin.DP281 = 1105002062;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.DP28 == 0)
    new_Skin.DP282 = 1050023;
  if (preferences.Config.Skin.DP28 == 1)
    new_Skin.DP282 = 1105002017;
  if (preferences.Config.Skin.DP28 == 2)
    new_Skin.DP282 = 1105002034;
  if (preferences.Config.Skin.DP28 == 3)
    new_Skin.DP282 = 1105002057;
  if (preferences.Config.Skin.DP28 == 4)
    new_Skin.DP282 = 1105002062;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.DP28 == 0)
    new_Skin.DP283 = 1050024;
  if (preferences.Config.Skin.DP28 == 1)
    new_Skin.DP283 = 1105002017;
  if (preferences.Config.Skin.DP28 == 2)
    new_Skin.DP283 = 1105002034;
  if (preferences.Config.Skin.DP28 == 3)
    new_Skin.DP283 = 1105002057;
  if (preferences.Config.Skin.DP28 == 4)
    new_Skin.DP283 = 1105002062;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.DP28 == 0)
    new_Skin.DP284 = 1050025;
  if (preferences.Config.Skin.DP28 == 1)
    new_Skin.DP284 = 1105002017;
  if (preferences.Config.Skin.DP28 == 2)
    new_Skin.DP284 = 1105002034;
  if (preferences.Config.Skin.DP28 == 3)
    new_Skin.DP284 = 1105002057;
  if (preferences.Config.Skin.DP28 == 4)
    new_Skin.DP284 = 1105002062;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.DP28 == 0)
    new_Skin.DP285 = 1050026;
  if (preferences.Config.Skin.DP28 == 1)
    new_Skin.DP285 = 1105002017;
  if (preferences.Config.Skin.DP28 == 2)
    new_Skin.DP285 = 1105002034;
  if (preferences.Config.Skin.DP28 == 3)
    new_Skin.DP285 = 1105002057;
  if (preferences.Config.Skin.DP28 == 4)
    new_Skin.DP285 = 1105002062;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.DP28 == 0)
    new_Skin.DP286 = 1050027;
  if (preferences.Config.Skin.DP28 == 1)
    new_Skin.DP286 = 1105002017;
  if (preferences.Config.Skin.DP28 == 2)
    new_Skin.DP286 = 1105002034;
  if (preferences.Config.Skin.DP28 == 3)
    new_Skin.DP286 = 1105002057;
  if (preferences.Config.Skin.DP28 == 4)
    new_Skin.DP286 = 1105002062;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (new_Skin.M249 == 0)
    new_Skin.M249 = 105001;
    new_Skin.M249s = 205009;
  if (preferences.Config.Skin.M249 == 1)
    new_Skin.M249 = 1105001019;
    //new_Skin.M249s = 1050010351;
  if (preferences.Config.Skin.M249 == 2)
    new_Skin.M249 = 1105001033;
    new_Skin.M249s = 1050010412;
  if (preferences.Config.Skin.M249 == 3)
    new_Skin.M249 = 1105001047;
    new_Skin.M249s = 1050010482;
  if (preferences.Config.Skin.M249 == 4)
    new_Skin.M249 = 1105001053;
    new_Skin.M249s = 1050010542;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (new_Skin.M249 == 0)
    new_Skin.M2491 = 1050012;
    new_Skin.M249s = 205009;
  if (preferences.Config.Skin.M249 == 1)
    new_Skin.M2491 = 1105001019;
    new_Skin.M249s = 1050010351;
  if (preferences.Config.Skin.M249 == 2)
    new_Skin.M2491 = 1105001033;
    new_Skin.M249s = 1050010412;
  if (preferences.Config.Skin.M249 == 3)
    new_Skin.M2491 = 1105001047;
    new_Skin.M249s = 1050010482;
  if (preferences.Config.Skin.M249 == 4)
    new_Skin.M2491 = 1105001053;
    new_Skin.M249s = 1050010542;
new_Skin.longyin_x1111 = 1030070218;
    new_Skin.longyin_x2222 = 1030070216;
    new_Skin.longyin_x3333 = 1030070215;
    new_Skin.longyin_x4444 = 1030070214;
    new_Skin.longyin_x6666 = 1030070213;
    new_Skin.longyin_x8888 = 1030070212;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (new_Skin.M249 == 0)
    new_Skin.M2492 = 1050013;
    new_Skin.M249s = 205009;
  if (preferences.Config.Skin.M249 == 1)
    new_Skin.M2492 = 1105001019;
    new_Skin.M249s = 1050010351;
  if (preferences.Config.Skin.M249 == 2)
    new_Skin.M2492 = 1105001033;
    new_Skin.M249s = 1050010412;
  if (preferences.Config.Skin.M249 == 3)
    new_Skin.M2492 = 1105001047;
    new_Skin.M249s = 1050010482;
  if (preferences.Config.Skin.M249 == 4)
    new_Skin.M2492 = 1105001053;
    new_Skin.M249s = 1050010542;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (new_Skin.M249 == 0)
    new_Skin.M2493 = 1050014;
    new_Skin.M249s = 205009;
  if (preferences.Config.Skin.M249 == 1)
    new_Skin.M2493 = 1105001019;
    new_Skin.M249s = 1050010351;
  if (preferences.Config.Skin.M249 == 2)
    new_Skin.M2493 = 1105001033;
    new_Skin.M249s = 1050010412;
  if (preferences.Config.Skin.M249 == 3)
    new_Skin.M2493 = 1105001047;
    new_Skin.M249s = 1050010482;
  if (preferences.Config.Skin.M249 == 4)
    new_Skin.M2493 = 1105001053;
    new_Skin.M249s = 1050010542;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (new_Skin.M249 == 0)
    new_Skin.M2494 = 1050015;
    new_Skin.M249s = 205009;
  if (preferences.Config.Skin.M249 == 1)
    new_Skin.M2494 = 1105001019;
    new_Skin.M249s = 1050010351;
  if (preferences.Config.Skin.M249 == 2)
    new_Skin.M2494 = 1105001033;
    new_Skin.M249s = 1050010412;
  if (preferences.Config.Skin.M249 == 3)
    new_Skin.M2494 = 1105001047;
    new_Skin.M249s = 1050010482;
  if (preferences.Config.Skin.M249 == 4)
    new_Skin.M2494 = 1105001053;
    new_Skin.M249s = 1050010542;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (new_Skin.M249 == 0)
    new_Skin.M2495 = 1050016;
    new_Skin.M249s = 205009;
  if (preferences.Config.Skin.M249 == 1)
    new_Skin.M2495 = 1105001019;
    new_Skin.M249s = 1050010351;
  if (preferences.Config.Skin.M249 == 2)
    new_Skin.M2495 = 1105001033;
    new_Skin.M249s = 1050010412;
  if (preferences.Config.Skin.M249 == 3)
    new_Skin.M2495 = 1105001047;
    new_Skin.M249s = 1050010482;
  if (preferences.Config.Skin.M249 == 4)
    new_Skin.M2495 = 1105001053;
    new_Skin.M249s = 1050010542;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (new_Skin.M249 == 0)
    new_Skin.M2496 = 1050017;
    new_Skin.M249s = 205009;
  if (preferences.Config.Skin.M249 == 1)
    new_Skin.M2496 = 1105001019;
    new_Skin.M249s = 1050010351;
  if (preferences.Config.Skin.M249 == 2)
    new_Skin.M2496 = 1105001033;
    new_Skin.M249s = 1050010412;
  if (preferences.Config.Skin.M249 == 3)
    new_Skin.M2496 = 1105001047;
    new_Skin.M249s = 1050010482;
  if (preferences.Config.Skin.M249 == 4)
    new_Skin.M2496 = 1105001053;
    new_Skin.M249s = 1050010542;
  
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.Mk47 == 0)
    new_Skin.Mk47 = 101009;
if (preferences.Config.Skin.Mk47 == 1)
    new_Skin.Mk47 = 1101009001;
if (preferences.Config.Skin.Mk47 == 2)
    new_Skin.Mk47 = 1101009002;
if (preferences.Config.Skin.Mk47 == 3)
    new_Skin.Mk47 = 1101009003;
if (preferences.Config.Skin.Mk47 == 4)
    new_Skin.Mk47 = 1101009004;
if (preferences.Config.Skin.Mk47 == 5)
    new_Skin.Mk47 = 1101009005;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
if (preferences.Config.Skin.Mk47 == 0)
    new_Skin.Mk471 = 1010091;
if (preferences.Config.Skin.Mk47 == 1)
    new_Skin.Mk471 = 1101009001;
if (preferences.Config.Skin.Mk47 == 2)
    new_Skin.Mk471 = 1101009002;
if (preferences.Config.Skin.Mk47 == 3)
    new_Skin.Mk471 = 1101009003;
if (preferences.Config.Skin.Mk47 == 4)
    new_Skin.Mk471 = 1101009004;
if (preferences.Config.Skin.Mk47 == 5)
    new_Skin.Mk471 = 1101009005;

if (preferences.Config.Skin.Mk47 == 0)
    new_Skin.Mk472 = 1010092;
if (preferences.Config.Skin.Mk47 == 1)
    new_Skin.Mk472 = 1101009001;
if (preferences.Config.Skin.Mk47 == 2)
    new_Skin.Mk472 = 1101009002;
if (preferences.Config.Skin.Mk47 == 3)
    new_Skin.Mk472 = 1101009003;
if (preferences.Config.Skin.Mk47 == 4)
    new_Skin.Mk472 = 1101009004;
if (preferences.Config.Skin.Mk47 == 5)
    new_Skin.Mk472 = 1101009005;
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
if (preferences.Config.Skin.FAMAS == 0)
    new_Skin.FAMAS = 101100;

if (preferences.Config.Skin.FAMAS == 1)
    new_Skin.FAMAS = 1101100012;

if (preferences.Config.Skin.FAMAS == 0)
    new_Skin.FAMAS修复 = 1011002;

if (preferences.Config.Skin.FAMAS == 1)
    new_Skin.FAMAS修复 = 1101100012;

if (preferences.Config.Skin.FAMAS == 0)
    new_Skin.FAMAS完好 = 1011003;

if (preferences.Config.Skin.FAMAS == 1)
    new_Skin.FAMAS完好 = 11011000123;

if (preferences.Config.Skin.FAMAS == 0)
    new_Skin.FAMAS改进 = 1011004;

if (preferences.Config.Skin.FAMAS == 1)
    new_Skin.FAMAS改进 = 1101100012;

if (preferences.Config.Skin.FAMAS == 0)
    new_Skin.FAMAS精致 = 1011005;

if (preferences.Config.Skin.FAMAS == 1)
    new_Skin.FAMAS精致 = 1101100012;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

if (preferences.Config.Skin.qbz == 0)
    new_Skin.qbz = 101007;

if (preferences.Config.Skin.qbz2 == 0)
    new_Skin.qbz2 = 1010072;

if (preferences.Config.Skin.qbz5 == 0)
    new_Skin.qbz5 = 1010075;
/////////////////////////////////////////////////////////////////////////////////////////////////////
if (preferences.Config.Skin.qbz == 1)
    new_Skin.qbz = 1101007061;
if (preferences.Config.Skin.qbz2 == 1)
    new_Skin.qbz2 = 1101007061;
if (preferences.Config.Skin.qbz5 == 1)
    new_Skin.qbz5 = 1101007061;
/////////////////////////////////////////////////////////////////////////////////////////////////////
if (preferences.Config.Skin.qbz == 2)
    new_Skin.qbz = 1101007070;
if (preferences.Config.Skin.qbz2 == 2)
    new_Skin.qbz2 = 1101007070;
if (preferences.Config.Skin.qbz5 == 2)
    new_Skin.qbz5 = 1101007070;
/////////////////////////////////////////////////////////////////////////////////////////////////////
if (preferences.Config.Skin.qbz == 3)
    new_Skin.qbz = 1101007045;
if (preferences.Config.Skin.qbz2 == 3)
    new_Skin.qbz2 = 1101007045;
if (preferences.Config.Skin.qbz5 == 3)
    new_Skin.qbz5 = 1101007045;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
if (preferences.Config.Skin.dbs == 0)
    new_Skin.dbs = 104004;
if (preferences.Config.Skin.dbs == 1)
    new_Skin.dbs = 1104004027;
if (preferences.Config.Skin.dbs == 2)
    new_Skin.dbs = 1101009002;
if (preferences.Config.Skin.dbs == 3)
    new_Skin.dbs = 1101009003;
if (preferences.Config.Skin.dbs == 4)
    new_Skin.dbs = 1101009004;
if (preferences.Config.Skin.dbs == 5)
    new_Skin.dbs = 1101009005;
////////////////////////////9999999999999999999999999
if (preferences.Config.Skin.dbs1 == 0)
    new_Skin.dbs1 = 1040041;
if (preferences.Config.Skin.dbs1 == 1)
    new_Skin.dbs1 = 1104004027;
if (preferences.Config.Skin.dbs1 == 2)
    new_Skin.dbs1 = 1101009002;
if (preferences.Config.Skin.dbs1 == 3)
    new_Skin.dbs1 = 1101009003;
if (preferences.Config.Skin.dbs1 == 4)
    new_Skin.dbs1 = 1101009004;
if (preferences.Config.Skin.dbs1 == 5)
    new_Skin.dbs1 = 1101009005;
////////
if (preferences.Config.Skin.dbs2 == 0)
    new_Skin.dbs2 = 1040042;
if (preferences.Config.Skin.dbs2 == 1)
    new_Skin.dbs2 = 1104004027;
if (preferences.Config.Skin.dbs2 == 2)
    new_Skin.dbs2 = 1101009002;
if (preferences.Config.Skin.dbs2 == 3)
    new_Skin.dbs2 = 1101009003;
if (preferences.Config.Skin.dbs2 == 4)
    new_Skin.dbs2 = 1101009004;
if (preferences.Config.Skin.dbs2 == 5)
    new_Skin.dbs2 = 1101009005;
/////////////
if (preferences.Config.Skin.dbs3 == 0)
    new_Skin.dbs3 = 1040043;
if (preferences.Config.Skin.dbs3 == 1)
    new_Skin.dbs3 = 1104004027;
if (preferences.Config.Skin.dbs3 == 2)
    new_Skin.dbs3 = 1101009002;
if (preferences.Config.Skin.dbs3 == 3)
    new_Skin.dbs3 = 1101009003;
if (preferences.Config.Skin.dbs3 == 4)
    new_Skin.dbs3 = 1101009004;
if (preferences.Config.Skin.dbs3 == 5)
    new_Skin.dbs3 = 1101009005;
//
if (preferences.Config.Skin.dbs4 == 0)
    new_Skin.dbs4 = 1040044;
if (preferences.Config.Skin.dbs4 == 1)
    new_Skin.dbs4 = 1104004027;
if (preferences.Config.Skin.dbs4 == 2)
    new_Skin.dbs4 = 1101009002;
if (preferences.Config.Skin.dbs4 == 3)
    new_Skin.dbs4 = 1101009003;
if (preferences.Config.Skin.dbs4 == 4)
    new_Skin.dbs4 = 1101009004;
if (preferences.Config.Skin.dbs4 == 5)
    new_Skin.dbs4 = 1101009005;
if (preferences.Config.Skin.dbs5 == 0)
    new_Skin.dbs5 = 1040045;
if (preferences.Config.Skin.dbs5 == 1)
    new_Skin.dbs5 = 1104004027;
if (preferences.Config.Skin.dbs5 == 2)
    new_Skin.dbs5 = 1101009002;
if (preferences.Config.Skin.dbs5 == 3)
    new_Skin.dbs5 = 1101009003;
if (preferences.Config.Skin.dbs5 == 4)
    new_Skin.dbs5 = 1101009004;
if (preferences.Config.Skin.dbs5 == 5)
    new_Skin.dbs5 = 1101009005;
if (preferences.Config.Skin.dbs6 == 0)
    new_Skin.dbs6 = 1040046;
if (preferences.Config.Skin.dbs6 == 1)
    new_Skin.dbs6 = 1104004027;
if (preferences.Config.Skin.dbs6 == 2)
    new_Skin.dbs6 = 1101009002;
if (preferences.Config.Skin.dbs6 == 3)
    new_Skin.dbs6 = 1101009003;
if (preferences.Config.Skin.dbs6 == 4)
    new_Skin.dbs6 = 1101009004;
if (preferences.Config.Skin.dbs6 == 5)
    new_Skin.dbs6 = 1101009005;
if (preferences.Config.Skin.dbs7 == 0)
    new_Skin.dbs7 = 1040047;
if (preferences.Config.Skin.dbs7 == 1)
    new_Skin.dbs7 = 1104004027;
if (preferences.Config.Skin.dbs7 == 2)
    new_Skin.dbs7 = 1101009002;
if (preferences.Config.Skin.dbs7 == 3)
    new_Skin.dbs7 = 1101009003;
if (preferences.Config.Skin.dbs7 == 4)
    new_Skin.dbs7 = 1101009004;
if (preferences.Config.Skin.dbs7 == 5)
    new_Skin.dbs7 = 1101009005;


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
if (preferences.Config.Skin.S12K == 0)
    new_Skin.S12K = 104003;
if (preferences.Config.Skin.S12K == 1)
    new_Skin.S12K = 1104003036;


////////////////////////////////////////////////////////////////////////////////
if (preferences.Config.Skin.S12K1 == 0)
    new_Skin.S12K1 = 1040031;
if (preferences.Config.Skin.S12K1 == 1)
    new_Skin.S12K1 = 1104003036;

//////////////////////////////////////////
if (preferences.Config.Skin.S12K2 == 0)
    new_Skin.S12K2 = 1040032;
if (preferences.Config.Skin.S12K2 == 1)
    new_Skin.S12K2 = 1104003036;

////////////////////////////////////////////////////////////////////////////////////////////////////
if (preferences.Config.Skin.S12K3 == 0)
    new_Skin.S12K3 = 104003;
if (preferences.Config.Skin.S12K3 == 1)
    new_Skin.S12K3 = 1104003036;

////////////////////////////////////////////////////////////////////////////////////////////////////
if (preferences.Config.Skin.S12K4 == 0)
    new_Skin.S12K4 = 1040034;
if (preferences.Config.Skin.S12K4 == 1)
    new_Skin.S12K4 = 1104003036;

    
////////////////////////////////////////////////////////////////////////////////////////////////////
if (preferences.Config.Skin.S12K5 == 0)
    new_Skin.S12K5 = 1040035;
if (preferences.Config.Skin.S12K5 == 1)
    new_Skin.S12K5 = 1104003036;

////////////////////////////////////////////////////////////////////////////////////////////////////
if (preferences.Config.Skin.S12K6 == 0)
    new_Skin.S12K6 = 104003;
if (preferences.Config.Skin.S12K6 == 1)
    new_Skin.S12K6 = 1104003036;


////////////////////////////////////////////////////////////////////////////////////////////////////
if (preferences.Config.Skin.S12K7 == 0)
    new_Skin.S12K7 = 104003;
if (preferences.Config.Skin.S12K7 == 1)
    new_Skin.S12K7 = 1104003036;

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
if (preferences.Config.Skin.Dacia == 22)
    new_Skin.Dacia = 1903198;
  
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  
if (preferences.Config.Skin.MiniBus == 0)
    new_Skin.MiniBus = 1904001;
  if (preferences.Config.Skin.MiniBus == 1)
    new_Skin.MiniBus = 1987002;
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



//精致妹控
    int MK14[] = { 1030075,113007028 };
    //弹匣
    int MK14_4[] = { 2040095,1030070227 };
    //8倍
    int MK14_2[] = { 203005,1030070212 };
    //枪托
    int MK14_5[] = { 2050035,1030070236 };
    //枪口
    int MK14_6[] = { 2010035,1030070234 };
    //红点
    int MK14_10[] = { 203001,1030070218 };
    //6倍
    int MK14_11[] = { 203015,1030070213};
    //步枪扩容
    int MK14_12[] = { 2040135,1030070224};
    //步枪补偿
    int MK14_13[] = { 2010095,1030070229};
    //狙击消音
    int MK14_14[] = { 2010075,1030070235};
    //步枪消音
int MK14_15[] = { 2010115,1030070232};



int m4v[] = { 101004, 1010042, 1101004046, 1101004062, 1101004078, 1101004086, 1101004098, 1101004138, 1101004163,1101004201,1101004209,1101004218,1101004226 };
int m4168[] = { 1010042, 1101004046, 1101004062, 1101004078, 1101004086, 1101004098, 1101004138, 1101004163,1101004201,1101004209,1101004218,1101004226 };
int m4169[] = { 1010043, 1101004046, 1101004062, 1101004078, 1101004086, 1101004098, 1101004138, 1101004163,1101004201,1101004209,1101004218,1101004226 };
int m4161[] = { 1010044, 1101004046, 1101004062, 1101004078, 1101004086, 1101004098, 1101004138, 1101004163,1101004201,1101004209,1101004218,1101004226 };
int m4162[] = { 1010045, 1101004046, 1101004062, 1101004078, 1101004086, 1101004098, 1101004138, 1101004163,1101004201,1101004209,1101004218,1101004226 };
int m4163[] = { 1010046, 1101004046, 1101004062, 1101004078, 1101004086, 1101004098, 1101004138, 1101004163,1101004201,1101004209,1101004218,1101004226 };
int m4164[] = { 1010047, 1101004046, 1101004062, 1101004078, 1101004086, 1101004098, 1101004138, 1101004163,1101004201,1101004209,1101004218,1101004226 };
int scar[] = { 101003,1101003195, 1101003057, 1101003070, 1101003080, 1101003119, 1101003146, 1101003167, 1101003181};
int scar1[] = { 1010032,1101003195, 1101003057, 1101003070, 1101003080, 1101003119, 1101003146, 1101003167, 1101003181};
int scar2[] = { 1010033,1101003195, 1101003057, 1101003070, 1101003080, 1101003119, 1101003146, 1101003167, 1101003181};
int scar3[] = { 1010034,1101003195, 1101003057, 1101003070, 1101003080, 1101003119, 1101003146, 1101003167, 1101003181};
int scar4[] = { 1010035,1101003195, 1101003057, 1101003070, 1101003080, 1101003119, 1101003146, 1101003167, 1101003181};
int scar5[] = { 1010036,1101003195, 1101003057, 1101003070, 1101003080, 1101003119, 1101003146, 1101003167, 1101003181};
int scar6[] = { 1010037,1101003195, 1101003057, 1101003070, 1101003080, 1101003119, 1101003146, 1101003167, 1101003181};
int akmv[] = { 101001,1101001089, 1101001103, 1101001116, 1101001128, 1101001143, 1101001154, 1101001174,1101001213,1101001231,1101001242 };
int akm1[] = { 1010012,1101001089, 1101001103, 1101001116, 1101001128, 1101001143, 1101001154, 1101001174,1101001213,1101001231,1101001242 };
int akm2[] = { 1010013,1101001089, 1101001103, 1101001116, 1101001128, 1101001143, 1101001154, 1101001174,1101001213,1101001231,1101001242 };
int akm3[] = { 1010014,1101001089, 1101001103, 1101001116, 1101001128, 1101001143, 1101001154, 1101001174,1101001213,1101001231,1101001242 };
int akm4[] = { 1010015,1101001089, 1101001103, 1101001116, 1101001128, 1101001143, 1101001154, 1101001174,1101001213,1101001231,1101001242 };
int akm5[] = { 1010016,1101001089, 1101001103, 1101001116, 1101001128, 1101001143, 1101001154, 1101001174,1101001213,1101001231,1101001242 };
int akm6[] = { 1010017,1101001089, 1101001103, 1101001116, 1101001128, 1101001143, 1101001154, 1101001174,1101001213,1101001231,1101001242 };
int m7[] = { 101008, 1101008026, 1101008051, 1101008061, 1101008081, 1101008104, 1101008116, 1101008126};
int m71[] = { 1010082, 1101008026, 1101008051, 1101008061, 1101008081, 1101008104, 1101008116, 1101008126};
int m72[] = { 1010083, 1101008026, 1101008051, 1101008061, 1101008081, 1101008104, 1101008116, 1101008126};
int m73[] = { 1010084, 1101008026, 1101008051, 1101008061, 1101008081, 1101008104, 1101008116, 1101008126};
int m74[] = { 1010085, 1101008026, 1101008051, 1101008061, 1101008081, 1101008104, 1101008116, 1101008126};
int m75[] = { 1010086, 1101008026, 1101008051, 1101008061, 1101008081, 1101008104, 1101008116, 1101008126};
int m76[] = { 1010087, 1101008026, 1101008051, 1101008061, 1101008081, 1101008104, 1101008116, 1101008126};
int awm[] = { 103003, 1103003022, 1103003028, 1103003041, 1103003050, 1103003061};
int awm1[] = { 1030032, 1103003022, 1103003028, 1103003041, 1103003050, 1103003061};
int awm2[] = { 1030033, 1103003022, 1103003028, 1103003041, 1103003050, 1103003061};
int awm3[] = { 1030034, 1103003022, 1103003028, 1103003041, 1103003050, 1103003061};
int awm4[] = { 1030035, 1103003022, 1103003028, 1103003041, 1103003050, 1103003061};
int awm5[] = { 1030036, 1103003022, 1103003028, 1103003041, 1103003050, 1103003061};
int awm6[] = { 1030037, 1103003022, 1103003028, 1103003041, 1103003050, 1103003061};
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
int dp[] = { 105002, 1105002017, 1105002034, 1105002058, 1105002063};
int dp1[] = { 1050022, 1105002017, 1105002034, 1105002058, 1105002063};
int dp2[] = { 1050023, 1105002017, 1105002034, 1105002058, 1105002063};
int dp3[] = { 1050024, 1105002017, 1105002034, 1105002058, 1105002063};
int dp4[] = { 1050025, 1105002017, 1105002034, 1105002058, 1105002063};
int dp5[] = { 1050026, 1105002017, 1105002034, 1105002058, 1105002063};
int dp6[] = { 1050027, 1105002017, 1105002034, 1105002058, 1105002063};
int m249[] = { 105001, 1105001019, 1105001033, 1105001047, 1105001053};
int m2491[] = { 1050012, 1105001019, 1105001033, 1105001047, 1105001053};
int m2492[] = { 1050013, 1105001019, 1105001033, 1105001047, 1105001053};
int m2493[] = { 1050014, 1105001019, 1105001033, 1105001047, 1105001053};
int m2494[] = { 1050015, 1105001019, 1105001033, 1105001047, 1105001053};
int m2495[] = { 1050016, 1105001019, 1105001033, 1105001047, 1105001053};
int m2496[] = { 1050017, 1105001019, 1105001033, 1105001047, 1105001053};
int groza[] = { 101005, 1101005019, 1101005025, 1101005038, 1101005043, 1101005052, 1101005082};
int groza1[] = { 1010052, 1101005019, 1101005025, 1101005038, 1101005043, 1101005052, 1101005082};
int groza2[] = { 1010053, 1101005019, 1101005025, 1101005038, 1101005043, 1101005052, 1101005082};
int groza3[] = { 1010054, 1101005019, 1101005025, 1101005038, 1101005043, 1101005052, 1101005082};
int groza4[] = { 1010055, 1101005019, 1101005025, 1101005038, 1101005043, 1101005052, 1101005082};
int groza5[] = { 1010056, 1101005019, 1101005025, 1101005038, 1101005043, 1101005052, 1101005082};
int groza6[] = { 1010057, 1101005019, 1101005025, 1101005038, 1101005043, 1101005052, 1101005082};
int aug[] = { 101006, 1101006033, 1101006044, 1101006062};
int AUG红点[] = { 203001};//加倍镜
int AUG6倍[] = { 203015};
int UMP红[] = { 203001};
int UMP6倍[] = { 203015};
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
int vest1[] = { 503101,503102,503103,503104,503105,503106,503107,503108,503109,503110,503111,503112,503113,503114,503115,503116,503117,503118,503200};
int mk145[] = { 1030077,1030076,1030074,1030073,1030072,1030071,1030075,  1103007028};
int mk146[] = { 1030077,1030076,1030074,1030073,1030072,1030071,1030075,  1103007028};
int mk147[] = { 1030077,1030076,1030074,1030073,1030072,1030071,1030075,  1103007028};
int mk148[] = { 1030077,1030076,1030074,1030073,1030072,1030071,1030075,  1103007028};
int mk149[] = { 1030077,1030076,1030074,1030073,1030072,1030071,1030075,  1103007028};
int mk140[] = { 1030077,1030076,1030074,1030073,1030072,1030071,1030075,  1103007028};
int mk14[] = { 1030077,1030076,1030074,1030073,1030072,1030071,1030075,  1103007028};

int longyin1111[] = { 203001,  1030070218};
int longyin2222[] = { 203003,  1030070216};
int longyin3333[] = { 203014,  1030070215};
int longyin4444[] = { 203004,  1030070214};
int longyin6666[] = { 203015,  1030070213};
int longyin8888[] = { 203005,  1030070212};
int m7hd[] = { 203001,  1010081396};          
int m7x2[] = { 203003,  1010081394};
int m7x3[] = { 203014,  1010081393};
int m7x4[] = { 203004,  1010081392};
int m7x6[] = { 203015,  1010081391};
int tuosb[] = { 205003,  1030070236};
int tuosb1[] = { 2050032,  1030070236};
int tuosb2[] = { 2050033,  1030070236};
int tuosb3[] = { 2050034,  1030070236};
int tuosb4[] = { 2050035,  1030070236};
int mg311[] = { 1050105,  1105010008,  1105010019, 1103003061, 1103003041, 1105010001, 1105010001, 1105010012, 1105010020};
int mg3x1[] = { 203001, 203001, 1050100144, 203001, 203001, 203001, 203001,203001}; 
int mg3x2[] = { 203003, 203003, 1050100142, 203003, 203003, 203003, 203003, 203003}; 
int mg3x3[] = { 203014, 203014, 1050100141, 203014, 203014, 203014, 203014, 203014};
int mg3x4[] = { 203004, 203004, 1050100139, 203004, 203004, 203004, 203004, 203004}; 
int mg3x6[] = { 203015, 203015, 1050100138, 203015, 203015, 203015, 203015, 203015};     
int mg3holo[] = { 203002, 203002, 1050100143, 203002, 203002, 203002, 203002, 203002};                    
int mg322[] = { 1050106,  1105010008,  1105010019, 1103003061, 1103003041, 1105010001, 1105010001, 1105010012, 1105010020};            
int mg333[] = { 1050107,  1105010008,  1105010019, 1103003061, 1103003041, 1105010001, 1105010001, 1105010012, 1105010020};
int mg344[] = { 1050102,  1105010008,  1105010019, 1103003061, 1103003041, 1105010001, 1105010001, 1105010012, 1105010020};
int mg355[] = { 1050103,  1105010008,  1105010019, 1103003061, 1103003041, 1105010001, 1105010001, 1105010012, 1105010020};
int mg366[] = { 1050104,  1105010008,  1105010019, 1103003061, 1103003041, 1105010001, 1105010001, 1105010012, 1105010020};
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
int mg3mag[] = { 295007, 295007, 1050100137, 295007, 295007, 295007, 295007, 295007};
int akmmag[] = { 291001,204013,204011,204012,1010010891, 1010011031, 1010011161, 1010011281, 1010011431, 1010011541, 1010011741,1010012131,1010012311,1010012421
};
int m7mag[] = { 291008,204013,204011,204012,1010080261, 1010080511, 1010080611, 1010080811, 1010081041, 1010081161, 1010081261};
int scarmag[] = { 291003,204013,204011,204012,1010031897,1010030571, 1010030701, 1010030801, 1010031191, 1010031461, 1010031671, 1010031811};
int m4mag[] = { 291004,204013,204011,204012,1010040461,1010040611,1010040781,1010040861,1010040981,1010041381,1010041631,1010042011,1010042073,1010042153,1010042361  };

int m4sight[] = { 203008,1010040462,1010040612,1010040782,1010040862,1010040982,1010041382,1010041632,1010042012,1010042083,1010042362  };

int m4stock[] = { 205005,1010040463,1010040613,1010040783,1010040863,1010040983,1010041383,1010041633,1010042013,1010042093,1010042173,1010042363  };

int m4stock1[] ={ 205002,1010040480,1010040586,205002,205002,205002,1010041146,1010041579,1010041966,1010042137,1010042173,1010042363  };

int m4stock2[] =
{ 2050022,1010040480,1010040586,205002,205002,205002,1010041146,1010041579,1010041966,1010042137,1010042173,1010042363  };

int m4stock3[] =
{ 2050023,1010040480,1010040586,205002,205002,205002,1010041146,1010041579,1010041966,1010042137,1010042173,1010042363  };

int m4stock4[] = { 2050024,1010040480,1010040586,205002,205002,205002,1010041146,1010041579,1010041966,1010042137,1010042173,1010042363  };

int m4stock5[] = { 2050025,1010040480,1010040586,205002,205002,205002,1010041146,1010041579,1010041966,1010042137,1010042173,1010042363  };

int m4reddot[] ={ 203001,1010040470,203001,203001,203001,1010041128,1010041566,1010041948,1010042029,1010042119,1010040569,1010042299  };

int m46666[] = { 203015,1010040481,203015,203015,203015,203015,203015,1010041967,1010042024,1010042114,1010040564,1010042294  };

int m43444[] = { 203004,1010040466,203004,203004,203004,1010041124,1010041554,1010041944,1010042025,1010042116,1010040565,1010042295  };

int m43333[] = { 203014,1010040467,203014,203014,203014,1010041125,1010041560,1010041945,1010042026,1010042116,1010040566,1010042296  };

int m42222[] = { 203003,1010040468,203003,203003,203003,1010041126,1010041564,1010041946,1010042027,1010042117,1010040567,1010042297  };

int m16s[] = { 205007, 1010020292, 1010020562, 1010020682, 1010020812, 1010021032};
int m16mag[] = { 291002,204013,204011,204012, 1010020291, 1010020561, 1010020681, 1010020811, 1010021031};

int Bag[] = { 501006,501005,501004,501003,501002,501001,1501003550,1501003277,1501003321,1501003443,1501003265,1501003051,1501003220,1501003174,1501000496 ,1501000051,1501000229,1501000243,1501000081,1501000081,501007,501008,501009,501010,501011,501012,501013,501014,501015,501016};

int Helmet[] = { 502001,502002,502003,1502003014,1502003028,1502003023,1501002443,1502003031,1502003033,1502003069,1502003261 };

int emote1[] = { 2200101,12220023,12219677,12219716,12209401,12220028,12209701,12209801,12209901 };
int emote2[] = { 2200201,12210201,12210601,12220028,12219819,12211801,12212001,12212201,12212401 };
int emote3[] = { 2200301,12212601,12213201,12219715,12219814,12213601,12213801,12214001,12214201 };

int SuitX[] = { 403003,1405628,1405870,1405983,1406152,1406311,1406475,1406638,1406872 };
int Mk47[] = { 101009,1101009001,1101009002,1101009003,1101009004,1101009005,1101009006,1101009007 };
int Mk471[] = { 1010091,1101009001,1101009002,1101009003,1101009004,1101009005,1101009006,1101009007 };
int Mk472[] = { 1010092,1101009001,1101009002,1101009003,1101009004,1101009005,1101009006,1101009007 };
int AMR[] = { 103012, 1103012019, 1103012010,1030120101};
int AMR1[] = { 1030123, 1103012019, 1103012010,1030120101};
int AMR2[] = { 1030124, 1103012019, 1103012010,1030120101};
int AMR3[] = { 1030125, 1103012019, 1103012010,1030120101};//整形
int MK666[]= { 103007,  1103007028};
int S12K[]= { 104003,  1104003026};
int S12K1[]= { 1040031,  1104003026};
int S12K2[]= { 1040032,  1104003026};
int S12K3[]= { 1040033,  1104003026};
int S12K4[]= { 1040034,  1104003026};
int S12K5[]= { 1040035,  1104003026};
int S12K6[]= { 1040036,  1104003026};
int S12K7[]= { 1040037,  1104003026};
int dbs[]= { 104004,  1104004027};
int dbs1[]= { 1040041,  1104004027};
int dbs2[]= { 1040042,  1104004027};
int dbs3[]= { 1040043,  1104004027};
int dbs4[]= { 1040044,  1104004027};
int dbs5[]= { 1040045,  1104004027};
int dbs6[]= { 1040046,  1104004027};
int dbs7[]= { 1040047,  1104004027};
int FAMAS[]= { 101100,  1101100012};
int FAMAS修复[]= { 1011002,  1101100012};
int FAMAS完好[]= { 1011003,  1101100012};
int FAMAS改进[]= { 1011004,  1101100012};
int FAMAS精致[]= { 1011005,  1101100012};
int qbz[]= { 101007,  1101007071,1101007062,1101007046};
int qbz2[]= { 1010072,  1101007071,1101007062,1101007046};
int qbz5[]= { 1010075,  1101007071,1101007062,1101007046};
int 不一秒套装[]= { 403003};

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
        auto PrechangeitemAvatar_addr = GetVirtualFunctionAddress(thiz, 135); //vtable idx
        if (PrechangeitemAvatar_addr)
        {
            return ((void(*)(uintptr_t, int, bool))PrechangeitemAvatar_addr)(thiz, InItemID, true);
        }
    }
}
void *(*orig_BroadcastFatalDamage)(ASTExtraPlayerController* thiz, struct FFatalDamageParameter* FatalDamageParameter);
void *hk_BroadcastFatalDamage(ASTExtraPlayerController* thiz, struct FFatalDamageParameter* FatalDamageParameter)
{
if (ModSkinn && KillMessage){//淘汰播报
if (g_PlayerController->PlayerKey == FatalDamageParameter->CauserKey && !g_PlayerController->STExtraBaseCharacter->CurrentVehicle && g_LocalPlayer->WeaponManagerComponent->CurrentWeaponReplicated){
    FatalDamageParameter->CauserClothAvatarID = new_Skin.XSuits; 

if(strstr(g_LocalPlayer->WeaponManagerComponent->CurrentWeaponReplicated->GetWeaponName().ToString(), "m4")){
                     FatalDamageParameter->CauserClothAvatarID = preferences.Config.Skin.M416 ;//preferences.Config.Skin.M416
      }

        

                          if (preferences.Config.Skin.M416 == 1){
                              FatalDamageParameter->CauserWeaponAvatarID = 1101004046; //Glacier - M416
                          } else if (preferences.Config.Skin.M416 == 2){
                              FatalDamageParameter->CauserWeaponAvatarID = 1101004062; //The Fool - M416
                          }else if (preferences.Config.Skin.M416 == 3){
                              FatalDamageParameter->CauserWeaponAvatarID = 1101004086; //Lizard Roar - M416
                          }  else if (preferences.Config.Skin.M416 == 4){
                              FatalDamageParameter->CauserWeaponAvatarID = 1101004078; //Wanderer - M416
                          } else if (preferences.Config.Skin.M416 == 5){
                              FatalDamageParameter->CauserWeaponAvatarID = 1101004098;
                          } else if (preferences.Config.Skin.M416 == 6){
                              FatalDamageParameter->CauserWeaponAvatarID = 1101004137;

                           } else if (preferences.Config.Skin.M416 == 7){
                              FatalDamageParameter->CauserWeaponAvatarID = 1101004162;
                           } else if (preferences.Config.Skin.M416 == 8){
                              FatalDamageParameter->CauserWeaponAvatarID = 1101004200;

                          } else if (preferences.Config.Skin.M416 == 9){
                              FatalDamageParameter->CauserWeaponAvatarID = 1101004208;

                      } else if (preferences.Config.Skin.M416 == 10){
                              FatalDamageParameter->CauserWeaponAvatarID = 1101004217;

} else if (preferences.Config.Skin.M416 == 11){
                              FatalDamageParameter->CauserWeaponAvatarID = 1101004225;

} else if (preferences.Config.Skin.M416 == 12){
                              FatalDamageParameter->CauserWeaponAvatarID = 1101004235;
} else if (preferences.Config.Skin.M416 == 13){
                              FatalDamageParameter->CauserWeaponAvatarID = 1103007027;



   }

/*
                      if (preferences.Config.Skin.MK14 == 1){
                              FatalDamageParameter->CauserWeaponAvatarID = 1103007027;
     }
*/


   if(strstr(g_LocalPlayer->WeaponManagerComponent->CurrentWeaponReplicated->GetWeaponName().ToString(), "MK14")){
                     FatalDamageParameter->CauserClothAvatarID = new_Skin.MK14 ;//preferences.Config.Skin.MK14

      }


     if(strstr(g_LocalPlayer->WeaponManagerComponent->CurrentWeaponReplicated->GetWeaponName().ToString(), "SCAR-L")){
                     FatalDamageParameter->CauserClothAvatarID = new_Skin.Scar ;//new_Skin.Scar
      }

    if(strstr(g_LocalPlayer->WeaponManagerComponent->CurrentWeaponReplicated->GetWeaponName().ToString(), "M16A4")){
     FatalDamageParameter->CauserClothAvatarID = new_Skin.M16A4;
     }
     if(strstr(g_LocalPlayer->WeaponManagerComponent->CurrentWeaponReplicated->GetWeaponName().ToString(), "GROZA")){
                     FatalDamageParameter->CauserClothAvatarID = new_Skin.Groza;
      }
                    if(strstr(g_LocalPlayer->WeaponManagerComponent->CurrentWeaponReplicated->GetWeaponName().ToString(), "AUG")){
     FatalDamageParameter->CauserClothAvatarID = new_Skin.AUG;
     }
     if(strstr(g_LocalPlayer->WeaponManagerComponent->CurrentWeaponReplicated->GetWeaponName().ToString(), "M762")){
                     FatalDamageParameter->CauserClothAvatarID = new_Skin.M762;//new_Skin.M762
      }

                    if(strstr(g_LocalPlayer->WeaponManagerComponent->CurrentWeaponReplicated->GetWeaponName().ToString(), "Kar98K")){
     FatalDamageParameter->CauserClothAvatarID = new_Skin.K98;
     }
     if(strstr(g_LocalPlayer->WeaponManagerComponent->CurrentWeaponReplicated->GetWeaponName().ToString(), "M24")){
                     FatalDamageParameter->CauserClothAvatarID = new_Skin.M24;
      }
                    if(strstr(g_LocalPlayer->WeaponManagerComponent->CurrentWeaponReplicated->GetWeaponName().ToString(), "AWM")){
     FatalDamageParameter->CauserClothAvatarID = new_Skin.AWM;
     }
     if(strstr(g_LocalPlayer->WeaponManagerComponent->CurrentWeaponReplicated->GetWeaponName().ToString(), "DP-28")){
     FatalDamageParameter->CauserClothAvatarID = new_Skin.DP28;
     }
    
                    if(strstr(g_LocalPlayer->WeaponManagerComponent->CurrentWeaponReplicated->GetWeaponName().ToString(), "M249")){
     FatalDamageParameter->CauserClothAvatarID = new_Skin.M249;
     }
                    if(strstr(g_LocalPlayer->WeaponManagerComponent->CurrentWeaponReplicated->GetWeaponName().ToString(), "UMP")){
     FatalDamageParameter->CauserClothAvatarID = new_Skin.UMP;
     }   
   }
}
  return orig_BroadcastFatalDamage(thiz, FatalDamageParameter);
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





                        if (ModSkinn && KillMessage){
                                      auto wep = localPlayerController;
                                        int its =997;
                                        auto VTable = (void**)wep->VTable;
                                        if (VTable && ( VTable[its] != hk_BroadcastFatalDamage)) {
                                            orig_BroadcastFatalDamage = decltype(  orig_BroadcastFatalDamage)(VTable[its]);
                                            VTable[its] = (void *) hk_BroadcastFatalDamage;
                                        }
                                
                            }
                
               
                         
                         
                         
                         
 
           
//自瞄圈淘汰盒子美化

                        if (ModSkinn  && IsLogin){
                       if (DeadBox  && IsLogin){
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
                                            auto DeadBoxAvatarCompPtr = (uintptr_t*)((uintptr_t)TombBoxx + 0x135); //DeadBoxAvatarComponent_BP_C* DeadBoxAvatarComponent_BP //
                                            if (DeadBoxAvatarCompPtr)
                                            {
                                                auto DeadBoxAvatarComp = *DeadBoxAvatarCompPtr;
                                                auto CurrentWeaponReplicated = g_LocalPlayer->WeaponManagerComponent->CurrentWeaponReplicated;
                                                if (CurrentWeaponReplicated)
                                                {
                                               
                                                        auto Weaponid = g_LocalPlayer->WeaponManagerComponent->CurrentWeaponReplicated->GetWeaponID();
       if (Weaponid == 101004) {//淘汰盒子
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

     } else if (Weaponid == 1010036) {
       ChangeItemAVc(DeadBoxAvatarComp, new_Skin.Scar5);
       AlreadyChangedSet.insert(PlayerKey);

     } else if (Weaponid == 1010037) {
       ChangeItemAVc(DeadBoxAvatarComp, new_Skin.Scar6);
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

   } else if (Weaponid == 1050105) {
       ChangeItemAVc(DeadBoxAvatarComp, new_Skin.mg31);
       AlreadyChangedSet.insert(PlayerKey);

   } else if (Weaponid == 1050106) {
       ChangeItemAVc(DeadBoxAvatarComp, new_Skin.mg32);
       AlreadyChangedSet.insert(PlayerKey);

   } else if (Weaponid == 1050102) {
       ChangeItemAVc(DeadBoxAvatarComp, new_Skin.mg34);
       AlreadyChangedSet.insert(PlayerKey);

   
} else if (Weaponid == 1050103) {
       ChangeItemAVc(DeadBoxAvatarComp, new_Skin.mg35);
       AlreadyChangedSet.insert(PlayerKey);

} else if (Weaponid == 1050104) {
       ChangeItemAVc(DeadBoxAvatarComp, new_Skin.mg36);
       AlreadyChangedSet.insert(PlayerKey);


       } else if (Weaponid == 102002) {
       ChangeItemAVc(DeadBoxAvatarComp, new_Skin.UMP);
       AlreadyChangedSet.insert(PlayerKey);



       } else if (Weaponid == 101006) {
       ChangeItemAVc(DeadBoxAvatarComp, new_Skin.AUG);
       AlreadyChangedSet.insert(PlayerKey);

} else if (Weaponid == 1010062) {
       ChangeItemAVc(DeadBoxAvatarComp, new_Skin.AUG1);
       AlreadyChangedSet.insert(PlayerKey);
} else if (Weaponid == 1010063) {
       ChangeItemAVc(DeadBoxAvatarComp, new_Skin.AUG2);
       AlreadyChangedSet.insert(PlayerKey);
} else if (Weaponid == 1010064) {
       ChangeItemAVc(DeadBoxAvatarComp, new_Skin.AUG3);
       AlreadyChangedSet.insert(PlayerKey);
} else if (Weaponid == 1010065) {
       ChangeItemAVc(DeadBoxAvatarComp, new_Skin.AUG4);
       AlreadyChangedSet.insert(PlayerKey);
} else if (Weaponid == 1010066) {
       ChangeItemAVc(DeadBoxAvatarComp, new_Skin.AUG5);
       AlreadyChangedSet.insert(PlayerKey);
} else if (Weaponid == 1010067) {
       ChangeItemAVc(DeadBoxAvatarComp, new_Skin.AUG6);
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

} else if (Weaponid == 1010052) {
       ChangeItemAVc(DeadBoxAvatarComp, new_Skin.Groza1);
       AlreadyChangedSet.insert(PlayerKey);

} else if (Weaponid == 1010053) {
       ChangeItemAVc(DeadBoxAvatarComp, new_Skin.Groza2);
       AlreadyChangedSet.insert(PlayerKey);

} else if (Weaponid == 1010054) {
       ChangeItemAVc(DeadBoxAvatarComp, new_Skin.Groza3);
       AlreadyChangedSet.insert(PlayerKey);

} else if (Weaponid == 1010055) {
       ChangeItemAVc(DeadBoxAvatarComp, new_Skin.Groza4);
       AlreadyChangedSet.insert(PlayerKey);

} else if (Weaponid == 1010056) {
       ChangeItemAVc(DeadBoxAvatarComp, new_Skin.Groza5);
       AlreadyChangedSet.insert(PlayerKey);

} else if (Weaponid == 1010057) {
       ChangeItemAVc(DeadBoxAvatarComp, new_Skin.Groza6);
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
             auto weaponid = weaponInfo.DefineID.TypeSpecificID;//沐////////////////////////////////////////////////////////////////////////

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
if (preferences.AMR && weapowep == 103012){
                 for (int i = 0; i < sizeof(AMR) / sizeof(AMR[0]); i++) {
                 if (weaponid == AMR[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.AMR;
                     break;
}
               }
              }
if (preferences.AMR1 && weapowep == 1030123){
                 for (int i = 0; i < sizeof(m24) / sizeof(AMR1[0]); i++) {
                 if (weaponid == AMR1[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.AMR1;
                     break;
}
               }
              }
if (preferences.AMR2 && weapowep == 1030124){
                 for (int i = 0; i < sizeof(AMR2) / sizeof(AMR2[0]); i++) {
                 if (weaponid == AMR2[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.AMR2;
                     break;
}
               }
              }
if (preferences.AMR3 && weapowep == 1030125){
                 for (int i = 0; i < sizeof(AMR3) / sizeof(AMR3[0]); i++) {
                 if (weaponid == AMR3[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.AMR3;
                     break;
}
               }
              }
if (preferences.MK149 && weapowep == 1030076){
                 for (int i = 0; i < sizeof(mk149) / sizeof(mk149[0]); i++) {
                 if (weaponid == mk149[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.MK149;
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
                if (preferences.MK14 && weapowep == 1030075){
                  for (int i = 0; i < sizeof(MK14) / sizeof(MK14[0]); i++) {
                  if (weaponid == MK14[i]) {
                      weaponInfo.DefineID.TypeSpecificID = new_Skin.MK14;
                      break;
                   }
                  }
                  for (int i = 0; i < sizeof(MK14_4) / sizeof(MK14_4[0]); i++) {
                  if (weaponid == scarmag[i]) {
                      weaponInfo.DefineID.TypeSpecificID = new_Skin.MK14_4;
                      break;
                   }
                  }
                  for (int i = 0; i < sizeof(MK14_2) / sizeof(MK14_2[0]); i++) {
                  if (weaponid == MK14_2[i]) {
                      weaponInfo.DefineID.TypeSpecificID = new_Skin.MK14_2;
                      break;
                   }
                  }
                  for (int i = 0; i < sizeof(MK14_5) / sizeof(MK14_5[0]); i++) {
                  if (weaponid == MK14_5[i]) {
                      weaponInfo.DefineID.TypeSpecificID = new_Skin.MK14_5;
                      break;
                   }
                  }
                  for (int i = 0; i < sizeof(MK14_6) / sizeof(MK14_6[0]); i++) {
                  if (weaponid == MK14_6[i]) {
                      weaponInfo.DefineID.TypeSpecificID = new_Skin.MK14_6;
                      break;
                   }
                  }
                  for (int i = 0; i < sizeof(MK14_10) / sizeof(MK14_10[0]); i++) {
                  if (weaponid == MK14_10[i]) {
                      weaponInfo.DefineID.TypeSpecificID = new_Skin.MK14_10;
                      break;
                   }
                  }
                  for (int i = 0; i < sizeof(MK14_11) / sizeof(MK14_11[0]); i++) {
                  if (weaponid == MK14_11[i]) {
                      weaponInfo.DefineID.TypeSpecificID = new_Skin.MK14_11;
                      break;
                   }
                  }
                  for (int i = 0; i < sizeof(MK14_12) / sizeof(MK14_12[0]); i++) {
                  if (weaponid == MK14_12[i]) {
                      weaponInfo.DefineID.TypeSpecificID = new_Skin.MK14_12;
                      break;
                   }
                  }
                  for (int i = 0; i < sizeof(MK14_13) / sizeof(MK14_13[0]); i++) {
                  if (weaponid == MK14_13[i]) {
                      weaponInfo.DefineID.TypeSpecificID = new_Skin.MK14_13;
                      break;
                   }
                  }
                  for (int i = 0; i < sizeof(MK14_14) / sizeof(MK14_14[0]); i++) {
                  if (weaponid == MK14_14[i]) {
                      weaponInfo.DefineID.TypeSpecificID = new_Skin.MK14_14;
                      break;
                   }
                  }
                  for (int i = 0; i < sizeof(MK14_15) / sizeof(MK14_15[0]); i++) {
                  if (weaponid == MK14_15[i]) {
                      weaponInfo.DefineID.TypeSpecificID = new_Skin.MK14_15;
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
                 for (int i = 0; i < sizeof(mg3x1) / sizeof(mg3x1[0]); i++) {
                 if (weaponid == mg3x1[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.mg3_x1;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(mg3x2) / sizeof(mg3x2[0]); i++) {
                 if (weaponid == mg3x2[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.mg3_x2;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(mg3x3) / sizeof(mg3x3[0]); i++) {
                 if (weaponid == mg3x3[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.mg3_x3;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(mg3x4) / sizeof(mg3x4[0]); i++) {
                 if (weaponid == mg3x4[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.mg3_x4;
                      break;
                  }
                 }
                 for (int i = 0; i < sizeof(mg3x6) / sizeof(mg3x6[0]); i++) {
                 if (weaponid == mg3x6[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.mg3_x6;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(mg3holo) / sizeof(mg3holo[0]); i++) {
                 if (weaponid == mg3holo[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.mg3_holo;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(mg3mag) / sizeof(mg3mag[0]); i++) {
                 if (weaponid == mg3mag[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.mg3_mag;
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
                 for (int i = 0; i < sizeof(mg3x1) / sizeof(mg3x1[0]); i++) {
                 if (weaponid == mg3x1[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.mg3_x1;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(mg3x2) / sizeof(mg3x2[0]); i++) {
                 if (weaponid == mg3x2[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.mg3_x2;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(mg3x3) / sizeof(mg3x3[0]); i++) {
                 if (weaponid == mg3x3[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.mg3_x3;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(mg3x4) / sizeof(mg3x4[0]); i++) {
                 if (weaponid == mg3x4[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.mg3_x4;
                      break;
                  }
                 }
                 for (int i = 0; i < sizeof(mg3x6) / sizeof(mg3x6[0]); i++) {
                 if (weaponid == mg3x6[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.mg3_x6;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(mg3holo) / sizeof(mg3holo[0]); i++) {
                 if (weaponid == mg3holo[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.mg3_holo;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(mg3mag) / sizeof(mg3mag[0]); i++) {
                 if (weaponid == mg3mag[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.mg3_mag;
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
                 for (int i = 0; i < sizeof(mg3x1) / sizeof(mg3x1[0]); i++) {
                 if (weaponid == mg3x1[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.mg3_x1;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(mg3x2) / sizeof(mg3x2[0]); i++) {
                 if (weaponid == mg3x2[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.mg3_x2;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(mg3x3) / sizeof(mg3x3[0]); i++) {
                 if (weaponid == mg3x3[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.mg3_x3;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(mg3x4) / sizeof(mg3x4[0]); i++) {
                 if (weaponid == mg3x4[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.mg3_x4;
                      break;
                  }
                 }
                 for (int i = 0; i < sizeof(mg3x6) / sizeof(mg3x6[0]); i++) {
                 if (weaponid == mg3x6[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.mg3_x6;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(mg3holo) / sizeof(mg3holo[0]); i++) {
                 if (weaponid == mg3holo[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.mg3_holo;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(mg3mag) / sizeof(mg3mag[0]); i++) {
                 if (weaponid == mg3mag[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.mg3_mag;
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
                 for (int i = 0; i < sizeof(mg3x1) / sizeof(mg3x1[0]); i++) {
                 if (weaponid == mg3x1[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.mg3_x1;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(mg3x2) / sizeof(mg3x2[0]); i++) {
                 if (weaponid == mg3x2[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.mg3_x2;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(mg3x3) / sizeof(mg3x3[0]); i++) {
                 if (weaponid == mg3x3[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.mg3_x3;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(mg3x4) / sizeof(mg3x4[0]); i++) {
                 if (weaponid == mg3x4[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.mg3_x4;
                      break;
                  }
                 }
                 for (int i = 0; i < sizeof(mg3x6) / sizeof(mg3x6[0]); i++) {
                 if (weaponid == mg3x6[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.mg3_x6;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(mg3holo) / sizeof(mg3holo[0]); i++) {
                 if (weaponid == mg3holo[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.mg3_holo;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(mg3mag) / sizeof(mg3mag[0]); i++) {
                 if (weaponid == mg3mag[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.mg3_mag;
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
                 for (int i = 0; i < sizeof(mg3x1) / sizeof(mg3x1[0]); i++) {
                 if (weaponid == mg3x1[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.mg3_x1;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(mg3x2) / sizeof(mg3x2[0]); i++) {
                 if (weaponid == mg3x2[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.mg3_x2;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(mg3x3) / sizeof(mg3x3[0]); i++) {
                 if (weaponid == mg3x3[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.mg3_x3;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(mg3x4) / sizeof(mg3x4[0]); i++) {
                 if (weaponid == mg3x4[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.mg3_x4;
                      break;
                  }
                 }
                 for (int i = 0; i < sizeof(mg3x6) / sizeof(mg3x6[0]); i++) {
                 if (weaponid == mg3x6[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.mg3_x6;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(mg3holo) / sizeof(mg3holo[0]); i++) {
                 if (weaponid == mg3holo[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.mg3_holo;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(mg3mag) / sizeof(mg3mag[0]); i++) {
                 if (weaponid == mg3mag[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.mg3_mag;
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
                 for (int i = 0; i < sizeof(mg3x1) / sizeof(mg3x1[0]); i++) {
                 if (weaponid == mg3x1[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.mg3_x1;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(mg3x2) / sizeof(mg3x2[0]); i++) {
                 if (weaponid == mg3x2[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.mg3_x2;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(mg3x3) / sizeof(mg3x3[0]); i++) {
                 if (weaponid == mg3x3[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.mg3_x3;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(mg3x4) / sizeof(mg3x4[0]); i++) {
                 if (weaponid == mg3x4[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.mg3_x4;
                      break;
                  }
                 }
                 for (int i = 0; i < sizeof(mg3x6) / sizeof(mg3x6[0]); i++) {
                 if (weaponid == mg3x6[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.mg3_x6;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(mg3holo) / sizeof(mg3holo[0]); i++) {
                 if (weaponid == mg3holo[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.mg3_holo;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(mg3mag) / sizeof(mg3mag[0]); i++) {
                 if (weaponid == mg3mag[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.mg3_mag;
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

for (int i = 0; i < sizeof(UMP红) / sizeof(UMP红[0]); i++) {
                 if (weaponid == UMP红[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.UMP红;
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
for (int i = 0; i < sizeof(UMP红) / sizeof(UMP红[0]); i++) {
                 if (weaponid == UMP红[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.UMP红;
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
for (int i = 0; i < sizeof(UMP红) / sizeof(UMP红[0]); i++) {
                 if (weaponid == UMP红[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.UMP红;
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
for (int i = 0; i < sizeof(UMP红) / sizeof(UMP红[0]); i++) {
                 if (weaponid == UMP红[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.UMP红;
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
for (int i = 0; i < sizeof(UMP红) / sizeof(UMP红[0]); i++) {
                 if (weaponid == UMP红[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.UMP红;
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
for (int i = 0; i < sizeof(UMP红) / sizeof(UMP红[0]); i++) {
                 if (weaponid == UMP红[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.UMP红;
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
for (int i = 0; i < sizeof(UMP红) / sizeof(UMP红[0]); i++) {
                 if (weaponid == UMP红[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.UMP红;
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
for (int i = 0; i < sizeof(AUG红点) / sizeof(AUG红点[0]); i++) {
                 if (weaponid == AUG红点[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.AUG红点;
                     break;
                  }
                 }
for (int i = 0; i < sizeof(AUG6倍) / sizeof(AUG6倍[0]); i++) {
                 if (weaponid == AUG6倍[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.AUG6倍;
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
for (int i = 0; i < sizeof(AUG红点) / sizeof(AUG红点[0]); i++) {
                 if (weaponid == AUG红点[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.AUG红点;
                     break;
                  }
                 }
for (int i = 0; i < sizeof(AUG6倍) / sizeof(AUG6倍[0]); i++) {
                 if (weaponid == AUG6倍[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.AUG6倍;
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
for (int i = 0; i < sizeof(AUG红点) / sizeof(AUG红点[0]); i++) {
                 if (weaponid == AUG红点[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.AUG红点;
                     break;
                  }
                 }
for (int i = 0; i < sizeof(AUG6倍) / sizeof(AUG6倍[0]); i++) {
                 if (weaponid == AUG6倍[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.AUG6倍;
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
for (int i = 0; i < sizeof(AUG红点) / sizeof(AUG红点[0]); i++) {
                 if (weaponid == AUG红点[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.AUG红点;
                     break;
                  }
                 }
for (int i = 0; i < sizeof(AUG6倍) / sizeof(AUG6倍[0]); i++) {
                 if (weaponid == AUG6倍[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.AUG6倍;
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
for (int i = 0; i < sizeof(AUG红点) / sizeof(AUG红点[0]); i++) {
                 if (weaponid == AUG红点[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.AUG红点;
                     break;
                  }
                 }
for (int i = 0; i < sizeof(AUG6倍) / sizeof(AUG6倍[0]); i++) {
                 if (weaponid == AUG6倍[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.AUG6倍;
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
for (int i = 0; i < sizeof(AUG红点) / sizeof(AUG红点[0]); i++) {
                 if (weaponid == AUG红点[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.AUG红点;
                     break;
                  }
                 }
for (int i = 0; i < sizeof(AUG6倍) / sizeof(AUG6倍[0]); i++) {
                 if (weaponid == AUG6倍[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.AUG6倍;
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
for (int i = 0; i < sizeof(AUG红点) / sizeof(AUG红点[0]); i++) {
                 if (weaponid == AUG红点[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.AUG红点;
                     break;
                  }
                 }
for (int i = 0; i < sizeof(AUG6倍) / sizeof(AUG6倍[0]); i++) {
                 if (weaponid == AUG6倍[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.AUG6倍;
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
                 for (int i = 0; i < sizeof(mg3x1) / sizeof(mg3x1[0]); i++) {
                 if (weaponid == mg3x1[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.mg3_x1;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(mg3x2) / sizeof(mg3x2[0]); i++) {
                 if (weaponid == mg3x2[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.mg3_x2;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(mg3x3) / sizeof(mg3x3[0]); i++) {
                 if (weaponid == mg3x3[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.mg3_x3;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(mg3x4) / sizeof(mg3x4[0]); i++) {
                 if (weaponid == mg3x4[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.mg3_x4;
                      break;
                  }
                 }
                 for (int i = 0; i < sizeof(mg3x6) / sizeof(mg3x6[0]); i++) {
                 if (weaponid == mg3x6[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.mg3_x6;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(mg3holo) / sizeof(mg3holo[0]); i++) {
                 if (weaponid == mg3holo[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.mg3_holo;
                     break;
                  }
                 }
                 for (int i = 0; i < sizeof(mg3mag) / sizeof(mg3mag[0]); i++) {
                 if (weaponid == mg3mag[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.mg3_mag;
                     break;
                  }
                 }
                }
if (preferences.Mk47 && weapowep == 101009){
                 for (int i = 0; i < sizeof(Mk47) / sizeof(Mk47[0]); i++) {
                 if (weaponid == Mk47[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.Mk47;//榴弹枪
                     break;
               }
                 }
                }
if (preferences.Mk471 && weapowep == 1010091){
                 for (int i = 0; i < sizeof(Mk47) / sizeof(Mk47[0]); i++) {
                 if (weaponid == Mk47[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.Mk47;//榴弹枪
                     break;
               }
                 }
                }
if (preferences.Mk472 && weapowep == 1010092){
                 for (int i = 0; i < sizeof(Mk47) / sizeof(Mk47[0]); i++) {
                 if (weaponid == Mk47[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.Mk47;//榴弹枪
                     break;
               }
                 }
                }
                if (preferences.MK666 && weapowep == 103007){
                 for (int i = 0; i < sizeof(MK666) / sizeof(MK666[0]); i++) {
                 if (weaponid == MK666[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.MK666;//MK666
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
                }
if (preferences.S12K && weapowep == 104003){
                 for (int i = 0; i < sizeof(S12K) / sizeof(S12K[0]); i++) {
                 if (weaponid == S12K[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.S12K;//S12Kif
                     break;


}
                 }
                }
if (preferences.S12K1 && weapowep == 1040031){
                 for (int i = 0; i < sizeof(S12K1) / sizeof(S12K1[0]); i++) {
                 if (weaponid == S12K1[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.S12K1;//S12Kif
                     break;


}
                 }
                }
if (preferences.S12K2 && weapowep == 1040032){
                 for (int i = 0; i < sizeof(S12K2) / sizeof(S12K2[0]); i++) {
                 if (weaponid == S12K2[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.S12K2;//S12Kif
                     break;


}
                 }
                }
if (preferences.S12K3 && weapowep == 1040033){
                 for (int i = 0; i < sizeof(S12K3) / sizeof(S12K3[0]); i++) {
                 if (weaponid == S12K3[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.S12K3;//S12Kif
                     break;


}
                 }
                }
if (preferences.S12K4 && weapowep == 1040034){
                 for (int i = 0; i < sizeof(S12K4) / sizeof(S12K4[0]); i++) {
                 if (weaponid == S12K4[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.S12K4;//S12Kif
                     break;


}
                 }
                }
if (preferences.S12K5 && weapowep == 1040035){
                 for (int i = 0; i < sizeof(S12K5) / sizeof(S12K5[0]); i++) {
                 if (weaponid == S12K5[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.S12K5;//S12Kif
                     break;


}
                 }
                }
if (preferences.S12K6 && weapowep == 1040036){
                 for (int i = 0; i < sizeof(S12K6) / sizeof(S12K6[0]); i++) {
                 if (weaponid == S12K6[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.S12K6;//S12Kif
                     break;


}
                 }
                }
if (preferences.S12K7 && weapowep == 1040037){
                 for (int i = 0; i < sizeof(S12K7) / sizeof(S12K7[0]); i++) {
                 if (weaponid == S12K7[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.S12K7;//S12Kif
                     break;


}
                 }
                }
if (preferences.dbs && weapowep == 104004){
                 for (int i = 0; i < sizeof(dbs) / sizeof(dbs[0]); i++) {
                 if (weaponid == dbs[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.dbs;//dbs
                     break;


}
                 }
                }
if (preferences.dbs1 && weapowep == 1040041){
                 for (int i = 0; i < sizeof(dbs1) / sizeof(dbs1[0]); i++) {
                 if (weaponid == dbs1[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.dbs1;//dbs
                     break;


}
                 }
                }

if (preferences.dbs2 && weapowep == 1040042){
                 for (int i = 0; i < sizeof(dbs2) / sizeof(dbs2[0]); i++) {
                 if (weaponid == dbs2[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.dbs2;//dbs
                     break;


}
                 }
                }
if (preferences.dbs3 && weapowep == 1040043){
                 for (int i = 0; i < sizeof(dbs3) / sizeof(dbs3[0]); i++) {
                 if (weaponid == dbs3[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.dbs3;//dbs
                     break;


}
                 }
                }
if (preferences.dbs4 && weapowep == 1040044){
                 for (int i = 0; i < sizeof(dbs) / sizeof(dbs[0]); i++) {
                 if (weaponid == dbs4[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.dbs4;//dbs
                     break;


}
                 }
                }
if (preferences.dbs5 && weapowep == 1040045){
                 for (int i = 0; i < sizeof(dbs5) / sizeof(dbs5[0]); i++) {
                 if (weaponid == dbs5[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.dbs5;//dbs
                     break;


}
                 }
                }
if (preferences.dbs6 && weapowep == 1040046){
                 for (int i = 0; i < sizeof(dbs6) / sizeof(dbs6[0]); i++) {
                 if (weaponid == dbs6[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.dbs6;//dbs
                     break;


}
                 }
                }
if (preferences.dbs7 && weapowep == 1040047){
                 for (int i = 0; i < sizeof(dbs7) / sizeof(dbs7[0]); i++) {
                 if (weaponid == dbs7[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.dbs7;//dbs
                     break;


}
                 }
                }
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
if (preferences.FAMAS && weapowep == 101100){
                 for (int i = 0; i < sizeof(FAMAS) / sizeof(FAMAS[0]); i++) {
                 if (weaponid == FAMAS[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.FAMAS;//
                     break;


}
                 }
                }

if (preferences.FAMAS修复 && weapowep == 1011002){
                 for (int i = 0; i < sizeof(FAMAS修复) / sizeof(FAMAS修复[0]); i++) {
                 if (weaponid == FAMAS修复[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.FAMAS修复;//
                     break;


}
                 }
                }
if (preferences.FAMAS完好 && weapowep == 1011003){
                 for (int i = 0; i < sizeof(FAMAS完好) / sizeof(FAMAS完好[0]); i++) {
                 if (weaponid == FAMAS完好[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.FAMAS完好;//
                     break;


}
                 }
                }
if (preferences.FAMAS改进 && weapowep == 1011004){
                 for (int i = 0; i < sizeof(FAMAS完好) / sizeof(FAMAS改进[0]); i++) {
                 if (weaponid == FAMAS改进[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.FAMAS改进;//
                     break;


}
                 }
                }
if (preferences.FAMAS精致 && weapowep == 1011005){
                 for (int i = 0; i < sizeof(FAMAS精致) / sizeof(FAMAS精致[0]); i++) {
                 if (weaponid == FAMAS精致[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.FAMAS精致;//
                     break;


}
                 }
                }
                //qbz
////////////////////////////////////////////                /////////
if (preferences.qbz && weapowep == 101007){
                 for (int i = 0; i < sizeof(qbz) / sizeof(qbz[0]); i++) {
                 if (weaponid == qbz[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.qbz;//
                     break;


}
                 }
                }
if (preferences.qbz2 && weapowep == 1010072){
                 for (int i = 0; i < sizeof(qbz2) / sizeof(qbz[0]); i++) {
                 if (weaponid == qbz2[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.qbz2;//
                     break;


}
                 }
                }                
if (preferences.qbz5 && weapowep == 1010075){
                 for (int i = 0; i < sizeof(qbz5) / sizeof(qbz5[0]); i++) {
                 if (weaponid == qbz5[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.qbz5;//
                     break;


}
                 }
                }                
                
                
                
                
                
                if (preferences.不一秒套装 && weapowep == 403003){
                 for (int i = 0; i < sizeof(qbz) / sizeof(qbz[0]); i++) {
                 if (weaponid == 不一秒套装[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.不一秒套装;//
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
                for (int i = 0; i < sizeof(m7hd) / sizeof(m7hd[0]); i++) {
                 if (weaponid == m7hd[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M762_红点;
                     break;
                 }
                }
                for (int i = 0; i < sizeof(m7x2) / sizeof(m7x2[0]); i++) {
                 if (weaponid == m7x2[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M762_2倍镜;
                     break;
                 }
                }
                for (int i = 0; i < sizeof(m7x3) / sizeof(m7x3[0]); i++) {
                 if (weaponid == m7x3[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M762_3倍镜;
                     break;
                 }
                }
                for (int i = 0; i < sizeof(m7x4) / sizeof(m7x4[0]); i++) {
                 if (weaponid == m7x4[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M762_4倍镜;
                     break;
                 }
                }
                for (int i = 0; i < sizeof(m7x6) / sizeof(m7x6[0]); i++) {
                 if (weaponid == m7x6[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M762_6倍镜;
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
                 for (int i = 0; i < sizeof(m7hd) / sizeof(m7hd[0]); i++) {
                 if (weaponid == m7hd[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M762_红点;
                     break;
                 }
                }
                for (int i = 0; i < sizeof(m7x2) / sizeof(m7x2[0]); i++) {
                 if (weaponid == m7x2[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M762_2倍镜;
                     break;
                 }
                }
                for (int i = 0; i < sizeof(m7x3) / sizeof(m7x3[0]); i++) {
                 if (weaponid == m7x3[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M762_3倍镜;
                     break;
                 }
                }
                for (int i = 0; i < sizeof(m7x4) / sizeof(m7x4[0]); i++) {
                 if (weaponid == m7x4[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M762_4倍镜;
                     break;
                 }
                }
                for (int i = 0; i < sizeof(m7x6) / sizeof(m7x6[0]); i++) {
                 if (weaponid == m7x6[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M762_6倍镜;
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
                 for (int i = 0; i < sizeof(m7hd) / sizeof(m7hd[0]); i++) {
                 if (weaponid == m7hd[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M762_红点;
                     break;
                 }
                }
                for (int i = 0; i < sizeof(m7x2) / sizeof(m7x2[0]); i++) {
                 if (weaponid == m7x2[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M762_2倍镜;
                     break;
                 }
                }
                for (int i = 0; i < sizeof(m7x3) / sizeof(m7x3[0]); i++) {
                 if (weaponid == m7x3[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M762_3倍镜;
                     break;
                 }
                }
                for (int i = 0; i < sizeof(m7x4) / sizeof(m7x4[0]); i++) {
                 if (weaponid == m7x4[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M762_4倍镜;
                     break;
                 }
                }
                for (int i = 0; i < sizeof(m7x6) / sizeof(m7x6[0]); i++) {
                 if (weaponid == m7x6[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M762_6倍镜;
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
                 for (int i = 0; i < sizeof(m7hd) / sizeof(m7hd[0]); i++) {
                 if (weaponid == m7hd[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M762_红点;
                     break;
                 }
                }
                for (int i = 0; i < sizeof(m7x2) / sizeof(m7x2[0]); i++) {
                 if (weaponid == m7x2[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M762_2倍镜;
                     break;
                 }
                }
                for (int i = 0; i < sizeof(m7x3) / sizeof(m7x3[0]); i++) {
                 if (weaponid == m7x3[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M762_3倍镜;
                     break;
                 }
                }
                for (int i = 0; i < sizeof(m7x4) / sizeof(m7x4[0]); i++) {
                 if (weaponid == m7x4[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M762_4倍镜;
                     break;
                 }
                }
                for (int i = 0; i < sizeof(m7x6) / sizeof(m7x6[0]); i++) {
                 if (weaponid == m7x6[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M762_6倍镜;
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
                 for (int i = 0; i < sizeof(m7hd) / sizeof(m7hd[0]); i++) {
                 if (weaponid == m7hd[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M762_红点;
                     break;
                 }
                }
                for (int i = 0; i < sizeof(m7x2) / sizeof(m7x2[0]); i++) {
                 if (weaponid == m7x2[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M762_2倍镜;
                     break;
                 }
                }
                for (int i = 0; i < sizeof(m7x3) / sizeof(m7x3[0]); i++) {
                 if (weaponid == m7x3[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M762_3倍镜;
                     break;
                 }
                }
                for (int i = 0; i < sizeof(m7x4) / sizeof(m7x4[0]); i++) {
                 if (weaponid == m7x4[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M762_4倍镜;
                     break;
                 }
                }
                for (int i = 0; i < sizeof(m7x6) / sizeof(m7x6[0]); i++) {
                 if (weaponid == m7x6[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M762_6倍镜;
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
                 for (int i = 0; i < sizeof(m7hd) / sizeof(m7hd[0]); i++) {
                 if (weaponid == m7hd[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M762_红点;
                     break;
                 }
                }
                for (int i = 0; i < sizeof(m7x2) / sizeof(m7x2[0]); i++) {
                 if (weaponid == m7x2[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M762_2倍镜;
                     break;
                 }
                }
                for (int i = 0; i < sizeof(m7x3) / sizeof(m7x3[0]); i++) {
                 if (weaponid == m7x3[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M762_3倍镜;
                     break;
                 }
                }
                for (int i = 0; i < sizeof(m7x4) / sizeof(m7x4[0]); i++) {
                 if (weaponid == m7x4[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M762_4倍镜;
                     break;
                 }
                }
                for (int i = 0; i < sizeof(m7x6) / sizeof(m7x6[0]); i++) {
                 if (weaponid == m7x6[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M762_6倍镜;
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
                 for (int i = 0; i < sizeof(m7hd) / sizeof(m7hd[0]); i++) {
                 if (weaponid == m7hd[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M762_红点;
                     break;
                 }
                }
                for (int i = 0; i < sizeof(m7x2) / sizeof(m7x2[0]); i++) {
                 if (weaponid == m7x2[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M762_2倍镜;
                     break;
                 }
                }
                for (int i = 0; i < sizeof(m7x3) / sizeof(m7x3[0]); i++) {
                 if (weaponid == m7x3[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M762_3倍镜;
                     break;
                 }
                }
                for (int i = 0; i < sizeof(m7x4) / sizeof(m7x4[0]); i++) {
                 if (weaponid == m7x4[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M762_4倍镜;
                     break;
                 }
                }
                for (int i = 0; i < sizeof(m7x6) / sizeof(m7x6[0]); i++) {
                 if (weaponid == m7x6[i]) {
                     weaponInfo.DefineID.TypeSpecificID = new_Skin.M762_6倍镜;
                     break;
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////








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
}//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

if (localPlayer -> CurrentVehicle) {//本地玩家当前车辆
        if (localPlayer -> CurrentVehicle -> VehicleAvatar) {
          std::string SkinIDStr = std::to_string((int) localPlayer -> CurrentVehicle -> VehicleAvatar -> GetDefaultAvatarID());//获取默认id
            Active::SkinCarDefault = localPlayer -> CurrentVehicle -> GetAvatarID();//SkinCarDefault皮肤车默认选项

          
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
            
            localPlayer -> CurrentVehicle -> VehicleAvatar -> ChangeItemAvatar(Active::SkinCarMod, true);//ChangeItemAvatar更改项目图标
          }
        }
      }
//判断
 if (localPlayerController->BackpackComponent){//BackpackComponent背包组件
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
/*
if (不一秒套装){
 for (int i = 0; i < sizeof(不一秒套装) / sizeof(不一秒套装[0]); i++) {
                 if (ID == SuitX[i]) {
                     bag[j].Unit.DefineID.TypeSpecificID = new_Skin.XSuits;
                     break;
                  }
                 }
                }
*/
                if (preferences.Bagg){
for (int i = 0; i < sizeof(Bag) / sizeof(Bag[0]); i++) {
                 if (ID == Bag[i]) {
                     bag[j].Unit.DefineID.TypeSpecificID = bag3;//背包判断
                     break;
                  }
                 }
                }
if (preferences.Vest){
for (int i = 0; i < sizeof(vest1) / sizeof(vest1[0]); i++) {
                 if (ID == vest1[i]) {
                     bag[j].Unit.DefineID.TypeSpecificID = vest3;//背包判断
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
//xmxmxm
if (preferences.Parachute){
        Slotsybc[9].ItemId = new_Skin.Parachute;
        }
        if (preferences.Outfit){
        Slotsybc[2].ItemId = new_Skin.XSuits;
        Slotsybc[4].ItemId = new_Skin.Hair;//索引
        Slotsybc[1].ItemId = new_Skin.Shorts;
        Slotsybc[3].ItemId = new_Skin.Shoes;
        Slotsybc[0].ItemId = new_Skin.Kabba;
        Slotsybc[7].ItemId = new_Skin.Gloves;
        }
        if (preferences.Bagg){
        Slotsybc[5].ItemId = bag3;
        }
        if (preferences.Helmett){
        Slotsybc[6].ItemId = helmett3;
        }
//xmxmxmxm
/*
      if (preferences.Parachute){
        Slotsybc[9].ItemId = new_Skin.Parachute;
        }
        if (preferences.Outfit){
        Slotsybc[2].ItemId = new_Skin.XSuits;
        }
        if (preferences.Bagg){
        Slotsybc[5].ItemId = bag3;
        }
        if (preferences.Helmett){
        Slotsybc[6].ItemId = helmett3;
        }*/
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

