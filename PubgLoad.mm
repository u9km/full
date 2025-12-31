

#import "PubgLoad.h"
#import "metalbiew.h"
#import <UIKit/UIKit.h>
#import "HeeeNoScreenShotView.h"

extern bool MenDeal;

@interface ImGuiLoad()
@property (nonatomic, strong) metalbiew *vna;
@property (nonatomic, strong) UIView *floatBall;
@property (nonatomic, strong) UIView *starView; // 新增：持有starView ，用于后续移除动画
@property (nonatomic, assign) CGPoint lastLocation;
@property (nonatomic, assign) BOOL isMenuOpen; // 菜单状态标记
@end

@implementation ImGuiLoad

+ (void)load {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [[self share] initFloatBall];
        [[self share] registerAppStateObserver];

        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [[self share] autoOpenMenu];
        });
    });
}


+ (instancetype)share {
    static ImGuiLoad *tool;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tool = [[ImGuiLoad alloc] init];
    });
    return tool;
}

// 新增：注册应用前后台状态监听
- (void)registerAppStateObserver {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(appDidEnterBackground)
                                                 name:UIApplicationDidEnterBackgroundNotification
                                               object:nil];
    
    // 前台通知可选：若需前台做额外处理可添加，此处仅需后台停动画，前台无需操作
}

// 新增：应用进入后台时，移除旋转动画
- (void)appDidEnterBackground {
    if (self.starView) {
        [self.starView.layer removeAnimationForKey:@"rotationAnimation"];
    }
}

- (void)initFloatBall {
    CGFloat radius = 27;
    self.isMenuOpen = NO;

    // 边框厚度（向内加厚，值越大边框越厚）
    CGFloat borderThickness = 3; // 保持原有厚度
    // 外部边框路径半径（保持不变，确保整体大小一致）
    CGFloat outerRadius = radius * 0.9;
    // 内部青色六芒星半径（外部半径 - 边框厚度，实现向内加厚）
    CGFloat innerRadius = outerRadius - borderThickness + 0.5;
    CGFloat angleStep = 2 * M_PI / 3;
    // 角度偏移：确保六芒星顶点朝上
    CGFloat angleOffset = 2 * M_PI / 3;

    // 绘制外部绿色边框路径（正六芒星外轮廓）
    UIBezierPath *outerGreenPath = [self hexagramPathWithRadius:outerRadius center:radius angleStep:angleStep angleOffset:angleOffset];
    // 绘制内部青色填充路径（正六芒星内轮廓，与原形状一致）
    UIBezierPath *innerCyanPath = [self hexagramPathWithRadius:innerRadius center:radius angleStep:angleStep angleOffset:angleOffset];

    // 创建六芒星视图：赋值给self.starView，用于后续移除动画
    self.starView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, radius * 2, radius * 2)];

    // 绿色边框层（向内加厚效果，保留原逻辑）
    CAShapeLayer *borderLayer = [CAShapeLayer layer];
    borderLayer.strokeColor = [UIColor greenColor].CGColor; // 绿色描边
    borderLayer.fillColor = [UIColor clearColor].CGColor;   // 填充透明
    borderLayer.lineWidth = borderThickness;              // 边框宽度
    borderLayer.path = outerGreenPath.CGPath;
    [self.starView.layer addSublayer:borderLayer];

    // 内部青色填充层（保留原形状和颜色）
    CAShapeLayer *innerFillLayer = [CAShapeLayer layer];
    innerFillLayer.path = innerCyanPath.CGPath;
    innerFillLayer.fillColor = [UIColor cyanColor].CGColor;
    [self.starView.layer addSublayer:innerFillLayer];

    // 配置浮动球（完全保留原有样式、位置）
    self.floatBall = [[UIView alloc] initWithFrame:CGRectMake(0, 0, radius * 2, radius * 2)];
    self.floatBall.layer.cornerRadius = radius;
    self.floatBall.layer.masksToBounds = YES;
    [self.floatBall addSubview:self.starView]; // 使用self.starView

    CGRect screenBounds = [UIScreen mainScreen].bounds;
    CGFloat targetX = screenBounds.size.width * 0.75;
    CGFloat targetY = radius;
    self.floatBall.center = CGPointMake(targetX, targetY);

    // 手势（完全保留原有逻辑）
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    [self.floatBall addGestureRecognizer:tapGesture];

    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    [self.floatBall addGestureRecognizer:panGesture];

    // 旋转逻辑：完全保留第二段代码的3π角度、3秒时长配置
    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    rotationAnimation.toValue = @(M_PI * 3); // 第二段代码原旋转角度
    rotationAnimation.duration = 3;         // 第二段代码原时长
    rotationAnimation.repeatCount = HUGE_VALF;
    rotationAnimation.removedOnCompletion = NO; // 确保停止后保持正立
    [self.starView.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"]; // 给self.starView加动画

    [[UIApplication sharedApplication].keyWindow addSubview:self.floatBall];
}

// 生成正六芒星路径（完全保留原形状逻辑）
- (UIBezierPath *)hexagramPathWithRadius:(CGFloat)radius center:(CGFloat)center angleStep:(CGFloat)step angleOffset:(CGFloat)offset {
    UIBezierPath *path = [UIBezierPath bezierPath];

    // 正立三角形
    [path moveToPoint:CGPointMake(
        center + radius * sin(0 + offset),
        center - radius * cos(0 + offset)
    )];
    [path addLineToPoint:CGPointMake(
        center + radius * sin(step + offset),
        center - radius * cos(step + offset)
    )];
    [path addLineToPoint:CGPointMake(
        center + radius * sin(2 * step + offset),
        center - radius * cos(2 * step + offset)
    )];
    [path closePath];

    // 倒立三角形
    [path moveToPoint:CGPointMake(
        center + radius * sin(M_PI + offset),
        center - radius * cos(M_PI + offset)
    )];
    [path addLineToPoint:CGPointMake(
        center + radius * sin(M_PI + step + offset),
        center - radius * cos(M_PI + step + offset)
    )];
    [path addLineToPoint:CGPointMake(
        center + radius * sin(M_PI + 2 * step + offset),
        center - radius * cos(M_PI + 2 * step + offset)
    )];
    [path closePath];

    return path;
}

- (void)handleTap:(UITapGestureRecognizer *)gesture {
    [self toggleMenu];
}

- (void)handlePan:(UIPanGestureRecognizer *)gesture {
    CGPoint translation = [gesture translationInView:self.floatBall.superview];
    self.floatBall.center = CGPointMake(
        self.floatBall.center.x + translation.x,
        self.floatBall.center.y + translation.y
    );
    [gesture setTranslation:CGPointZero inView:self.floatBall.superview];

    if (gesture.state == UIGestureRecognizerStateEnded) {
        self.lastLocation = self.floatBall.center;
    }
}

- (void)toggleMenu {
    self.isMenuOpen =!self.isMenuOpen;

    if (!_vna) {
        metalbiew *vc = [[metalbiew alloc] init];
        _vna = vc;
    }
    if(MenDeal==true)MenDeal=false;
    else {
        MenDeal=true;
        [[UIApplication sharedApplication].windows[0].rootViewController.view addSubview:_vna.view];}
    
}

- (void)autoOpenMenu {
    if (!_vna) {
        _vna = [[metalbiew alloc] init];
    }
    MenDeal = true;
    [[UIApplication sharedApplication].windows[0].rootViewController.view addSubview:_vna.view];
    self.isMenuOpen = YES;
}

// 新增：销毁时移除通知监听，避免内存泄漏
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end