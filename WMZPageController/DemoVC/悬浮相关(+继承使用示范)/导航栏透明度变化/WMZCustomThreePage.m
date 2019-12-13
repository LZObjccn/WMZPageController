

//
//  WMZCustomThreePage.m
//  WMZPageController
//
//  Created by wmz on 2019/12/13.
//  Copyright © 2019 wmz. All rights reserved.
//

#import "WMZCustomThreePage.h"
#import "TopSuspensionVC.h"
#import "UIImageView+WebCache.h"
@interface WMZCustomThreePage ()

@end

@implementation WMZCustomThreePage

- (void)viewDidLoad {
    [super viewDidLoad];
        self.view.backgroundColor = [UIColor whiteColor];
    
     //标题数组
        NSArray *data = @[@"热门",@"男装",@"美妆",@"手机",@"食品",@"电器",@"鞋包",@"百货",@"女装",@"汽车",@"电脑"];
        //控制器数组
        NSMutableArray *vcArr = [NSMutableArray new];
        [data enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            TopSuspensionVC *vc = [TopSuspensionVC new];
            vc.page = idx;
            [vcArr addObject:vc];
        }];
        
        WMZPageParam *param = PageParam()
        .wTitleArrSet(data)
        .wControllersSet(vcArr)
        //悬浮开启
        .wTopSuspensionSet(YES)
        //头视图y坐标从0开始
        .wFromNaviSet(NO)
        //导航栏透明度变化
        .wNaviAlphaSet(YES)
        //头部
        .wMenuHeadViewSet(^UIView *{
            UIView *back = [UIView new];
            back.frame = CGRectMake(0, 0, PageVCWidth, 270+PageVCStatusBarHeight);
            UIImageView *image = [UIImageView new];
            [image sd_setImageWithURL:[NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1576232579082&di=f6ae983436a2512d41ed5b25789cf212&imgtype=0&src=http%3A%2F%2Fbig5.ocn.com.cn%2FUpload%2Fuserfiles%2F18%252858%2529.png"]];
            image.frame = back.bounds;
            [back addSubview:image];
            return back;
        });
        
        self.param = param;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
