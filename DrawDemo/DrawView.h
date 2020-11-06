//
//  DrawView.h
//  DrawDemo
//
//  Created by 明孔 on 2020/11/5.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DrawView : UIView
//按步撤销
-(void)revoke;
//清空
-(void)clear;
//签名线的粗细
@property (nonatomic,assign)CGFloat panWidth;
//签名的颜色
@property (nonatomic,strong)UIColor* panColor;
@end

NS_ASSUME_NONNULL_END
