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
    UIPasteControlConfiguration *pasteConfig = [[UIPasteControlConfiguration alloc] init];
    pasteConfig.displayMode = UIPasteControlDisplayModeIconAndLabel;
    pasteConfig.cornerStyle = UIButtonConfigurationCornerStyleFixed;
    pasteConfig.cornerRadius = 50;
    pasteConfig.baseBackgroundColor = [UIColor yellowColor];
    pasteConfig.baseForegroundColor = [UIColor redColor];
    
//    UIPasteControl *pasteControl = [[UIPasteControl alloc] initWithFrame:CGRectMake(100,200, 200, 150)];
    //初始化UIPasteControl
    UIPasteControl *pasteControl = [[UIPasteControl alloc] initWithConfiguration:pasteConfig];
    pasteControl.frame =CGRectMake(100, 200, 200, 50);
    //关联控件
    pasteControl.target = textfield;
    
    //UIPasteboard *board = [UIPasteboard generalPasteboard];

    [self.view  addSubview:pasteControl];
    // Do any additional setup after loading the view.
}

- (void)pasteItemProviders:(NSArray<NSItemProvider *> *)itemProviders{

}
- (BOOL)canPasteItemProviders:(NSArray<NSItemProvider *> *)itemProviders{

    return YES;
}

@end
