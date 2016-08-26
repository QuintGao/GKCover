# GKCover

已支持CocoaPods：pod GKCover ,'~>1.0.4'

使用方法
1.底部弹窗

```
    UIView *redView = [UIView new];
    redView.backgroundColor = [UIColor redColor];
    redView.gk_size = CGSizeMake(KScreenW, 200);
    
    [GKCover translucentCoverFrom:self.view content:redView animated:YES];
    
```
2.中间弹窗

```
    UIView *greenView = [UIView new];
    greenView.backgroundColor = [UIColor greenColor];
    greenView.gk_size = CGSizeMake(240, 160);
    0.
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

Demo效果图：



更新日志：

```
1.1.0.0版本：添加底部遮罩和中间遮罩
2.1.0.1版本：添加自定义遮罩
3.1.0.2版本：添加使用方法
4.1.0.3版本：修改一个全透明遮罩不能点击消失的bug
5.1.0.4版本：更新Demo工程，添加更多使用方法
6.1.0.5版本：遮罩支持显示和隐藏的block，可以在block中添加要实现的方法
```