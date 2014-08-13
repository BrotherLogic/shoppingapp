//
//  MainListHeaderTableViewCell.m
//  ShoppingList
//
//  Created by Simon on 03/08/2014.
//  Copyright (c) 2014 Brotherlogic. All rights reserved.
//

#import "MainListHeaderTableViewCell.h"

@implementation MainListHeaderTableViewCell

@synthesize mainLabel;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
