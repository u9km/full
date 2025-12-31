//XN开源PUBG3.2引擎源码 打包更换验证及可使用 TG；Hack_GTX 进频道等待开源和平GTX
//XN操死小辞 小处的全家
//小辞喜欢白嫖 目尊无人 小辞母亲已被操烂
//小处喜欢装逼 被刺 喷驱同时也是死妈的
//使用此源码的人都是小辞 小处他们的爹 如小辞小处使用本源码 扣东西 必全家死光


#import "HeeeNoScreenShotView.h"
//#import "MyCaiDang.h"
@interface HeeeNoScreenShotView ()
@property (nonatomic,strong) UITextField *textField;
@property (nonatomic,strong) UIView *clearView;

@end

@implementation HeeeNoScreenShotView

- (instancetype)init {
  self = [super init];
  if (self) {
    [self setupUI];
  }
  return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if (self) {
    [self setupUI];
  }
  return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
  self = [super initWithCoder:coder];
  if (self) {
    [self setupUI];
  }
  return self;
}

- (void)layoutSubviews {
  [super layoutSubviews];
  self.textField.frame = self.bounds;
  self.clearView.frame = self.bounds;
}

- (void)setupUI {
  [self addSubview:self.textField];
  self.textField.subviews.firstObject.userInteractionEnabled = YES;
  [self.textField.subviews.firstObject addSubview:self.clearView];
}

- (void)addSubview:(UIView *)view {
  [super addSubview:view];
  if (self.textField != view) {
    [self.clearView addSubview:view];
  }
}


- (UITextField *)textField {
  if (!_textField) {
    _textField = [[UITextField alloc] init];

    _textField.secureTextEntry = YES;      //过直播开关
  }
  
  return _textField;
}

- (UIView *)clearView {
  if (!_clearView) {
    _clearView = [[UIView alloc] init];
  }
  return _clearView;
}

@end
