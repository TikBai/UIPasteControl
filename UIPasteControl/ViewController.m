//
//  ViewController.m
//  UIPasteControl
//
//  Created by TikBai on 2022/8/10.
//

#import "ViewController.h"

@interface ViewController ()<UIPasteConfigurationSupporting>

@end

@implementation ViewController
@synthesize pasteConfiguration;

- (void)viewDidLoad {
    [super viewDidLoad];
    /**
     *iOS 16 中通过 UIPasteboard 获取剪贴板中的内容时，系统会弹出对话框提醒用户是否允许粘贴。如果不想显示该对话框，建议使用新增的 UIPasteControl 控件来读取剪贴板的内容*
     */
    
    //初始化TestField
    UITextField *textfield = [[UITextField alloc]initWithFrame:CGRectMake(100, 300, 200, 80)];
    textfield.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:textfield];
    
    //UIPasteControl 配置
    UIPasteControlConfiguration *pastConfig = [[UIPasteControlConfiguration alloc] init];
    /**以下配置未生效,不确定是否为系统问题,或是代码问题!**/
    pastConfig.displayMode = UIPasteControlDisplayModeIconAndLabel;
    pastConfig.cornerStyle = UIButtonConfigurationCornerStyleFixed;
    pastConfig.cornerRadius = 50;
    pastConfig.baseBackgroundColor = [UIColor yellowColor];
    pastConfig.baseForegroundColor = [UIColor redColor];
    
//    UIPasteControl *pastControl = [[UIPasteControl alloc] initWithFrame:CGRectMake(100,200, 200, 150)];
    //初始化UIPasteControl
    UIPasteControl *pastControl = [[UIPasteControl alloc] initWithConfiguration:pastConfig];
    pastControl.frame =CGRectMake(100, 200, 200, 50);
    //关联控件
    pastControl.target = textfield;
    
    //UIPasteboard *board = [UIPasteboard generalPasteboard];

    [self.view  addSubview:pastControl];
    // Do any additional setup after loading the view.
}

- (void)pasteItemProviders:(NSArray<NSItemProvider *> *)itemProviders{

}
- (BOOL)canPasteItemProviders:(NSArray<NSItemProvider *> *)itemProviders{

    return YES;
}

@end
