//
//  DrawView.m
//  DrawDemo
//
//  Created by 明孔 on 2020/11/5.
//

#import "DrawView.h"

@interface DrawView ()
@property (nonatomic,strong)NSMutableArray <CAShapeLayer*>*pathArr;

@property (nonatomic,strong)CAShapeLayer *shapeLayer;

@end

@implementation DrawView{

    CGMutablePathRef _path;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor whiteColor]];
    }
    return self;
}

-(NSMutableArray<CAShapeLayer *> *)pathArr{
    if (!_pathArr) {
        _pathArr = [[NSMutableArray alloc]init];
    }
    return _pathArr;
}



- (void)drawRect:(CGRect)rect {

}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    CGPoint p = [[touches anyObject]locationInView:self];
    _path = CGPathCreateMutable();
    CGPathMoveToPoint(_path, NULL,p.x, p.y);
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.strokeColor = self.panColor.CGColor;
    layer.fillColor = [UIColor clearColor].CGColor;
    layer.lineWidth = 3;
    layer.path = _path;
    [self.layer addSublayer:layer];
    self.shapeLayer = layer;
   [self.pathArr addObject:layer];
    
   
    
    
}
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CGPoint point = [[touches anyObject]locationInView:self];
  
    CGPathAddLineToPoint(_path, NULL, point.x, point.y);
    self.shapeLayer.path = _path;
    
    
}
-(void)clear{
    
   NSInteger count  =self.pathArr.count;
    for (int i = 0; i<count; i++) {
        [self.pathArr.lastObject removeFromSuperlayer];
        [self.pathArr removeLastObject];
    }

}
-(void)revoke{
    [self.pathArr.lastObject removeFromSuperlayer];
    [self.pathArr removeLastObject];

}
@end
