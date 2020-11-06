//
//  ViewController.m
//  DrawDemo
//
//  Created by 明孔 on 2020/11/5.
//

#import "ViewController.h"
#import "DrawView.h"
@interface ViewController ()
@property (nonatomic,strong)DrawView *drawView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn1  = [[UIButton alloc]initWithFrame:CGRectMake(30, 50, 100, 100)];
    btn1.tag = 1;
    btn1.backgroundColor = [UIColor orangeColor];
    [btn1 addTarget:self action:@selector(clearView:) forControlEvents:UIControlEventTouchUpInside];
    [btn1 setTitle:[[NSBundle mainBundle]localizedStringForKey:@"clear" value:@"" table:nil] forState:UIControlStateNormal];
    [self.view addSubview:btn1];
    
    UIButton *btn2  = [[UIButton alloc]initWithFrame:CGRectMake(230, 50, 100, 100)];
    [btn2 setTitle:@"回退" forState:UIControlStateNormal];
    btn2.backgroundColor = [UIColor purpleColor];
    [btn2 addTarget:self action:@selector(clearView:) forControlEvents:UIControlEventTouchUpInside];
    btn2.tag = 2;
    [self.view addSubview:btn2];
    
    DrawView *drawView = [[DrawView alloc]initWithFrame:CGRectMake(0, 200, UIScreen.mainScreen.bounds.size.width, UIScreen.mainScreen.bounds.size.height-210)];
    drawView.panColor = [UIColor redColor];
    drawView.panWidth = 8;
    drawView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:drawView];
    self.drawView = drawView;
    
}
-(void)clearView:(UIButton*)sender{
    if (sender.tag == 1) {
        [self.drawView clear];
    }else{
        [self.drawView revoke];
    }
}

@end
