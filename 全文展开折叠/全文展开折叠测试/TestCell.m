//
//  TestCell.m
//  全文展开折叠测试
//
//  Created by Biao on 16/6/4.
//  Copyright © 2016年 Biao.com. All rights reserved.
//

#import "TestCell.h"

@interface TestCell()


@end

@implementation TestCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)clickBtn:(UIButton *)sender
{
    if ([self.delegate respondsToSelector:@selector(reloadAtIndex:)]) {
        [self.delegate reloadAtIndex:sender.tag];
    }
 
}

@end
