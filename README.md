# GKCover

已支持CocoaPods：pod GKCover ,'~>1.0.4'

使用方法
1.底部弹窗

```
    UIView *redView = [UIView new];
    redView.backgroundColor = [UIColor redColor];
    redView.gk_size = CGSizeMake(self.view.frame.size.width, 200);
    
    [GKCover translucentCoverFrom:self.view content:redView animated:YES];
    
```
2.中间弹窗

```
    UIView *greenView = [UIView new];
    greenView.backgroundColor = [UIColor greenColor];
    greenView.gk_size = CGSizeMake(240, 160);
    
    [GKCover translucentWindowCenterCoverContent:greenView animated:YES];
```
3.自定义弹窗

```
GKCover *cover = [GKCover transparentCoverWithTarget:self action:@selector(hidden)];
    cover.frame = self.view.bounds;
    [self.view addSubview:cover];
    self.cover = cover;
    
    UIView *customView = [UIView new];
    customView.backgroundColor = [UIColor purpleColor];
    customView.frame = CGRectMake((KScreenW -  300)/2, 0, 300, 200);
    [self.view addSubview:customView];
    self.customView = customView;
    
    [UIView animateWithDuration:0.25 animations:^{
        customView.gk_y = (KScreenH - 200)/2;
    }];
```

Demo效果图：暂无