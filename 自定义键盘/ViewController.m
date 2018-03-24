//
//  ViewController.m
//  自定义数字键盘
//
//  Created by Yutian Duan on 2018/3/21.
//  Copyright © 2018年 duanyutian. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic ,strong) UITextField *textField;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 40)];
  toolBar.barStyle = UIBarStyleBlack;
  //! 将UIBarButtonSystemItemFlexibleSpace是用来调整按钮之间保持等间距的,UIBarButtonSystemItemFlexibleSpace如果设置成toolBar的items数组中的第一个元素可以创建靠右的工具条按钮.
  UIBarButtonItem *item1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
  
  UIBarButtonItem *item2 = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:nil];
  UIBarButtonItem *item3 = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(resignKeyboard)];
  toolBar.items = @[item1,item2,item3];
  //! inputAccessoryView默认是nil,如果设置了,它会随键盘一起弹出并显示在键盘的顶端.
  _textField.inputAccessoryView = toolBar;
  
  UIView *keyboardView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 300)];
  keyboardView.backgroundColor = [UIColor lightGrayColor];
  //! inputView显示键盘的view,如果重写这个view将不再弹出键盘,而是弹出我们自定义的view
  _textField.inputView = keyboardView;
  
  CGFloat btnWidth = 80;
  CGFloat btnHeight = 50;
  CGFloat offX = ([UIScreen mainScreen].bounds.size.width-btnWidth*3)/4.0;
  CGFloat offY = 20;
  for(int i = 0; i < 11; i++) {
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake((btnWidth+offX)*(i%3)+offX, (btnHeight+offY)*(i/3)+offY, btnWidth, btnHeight)];
    btn.backgroundColor = [UIColor orangeColor];
    [btn setTitle:[NSString stringWithFormat:@"%d",i] forState:UIControlStateNormal];
    btn.showsTouchWhenHighlighted = YES;
    [keyboardView addSubview:btn];
    if(i == 9) {
      [btn setTitle:@"删除" forState:UIControlStateNormal];
    } else if (i == 10) {
      [btn setTitle:@"清空" forState:UIControlStateNormal];
    }
    
    btn.tag = i;
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
  }
  
  [_textField becomeFirstResponder];

  // Do any additional setup after loading the view, typically from a nib.
}

- (void)resignKeyboard {
  [_textField resignFirstResponder];
}

- (void)btnClick:(UIButton *)sender {
  switch (sender.tag) {
    case 9: {
      //! 删除一个字符
      [_textField deleteBackward];
    }
      break;
      
    case 10: {
      [_textField setText:@""];
      //可以判断一个textField上面是否有字符串
      if([_textField hasText]) {
        NSLog(@"textField不为空");
      } else {
        NSLog(@"textField为空");
      }
    }
      break;
      
    default: {
      //! 插入字符
      [_textField insertText:[NSString stringWithFormat:@"%ld",(long)sender.tag]];
    }
      break;
  }
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}


@end
