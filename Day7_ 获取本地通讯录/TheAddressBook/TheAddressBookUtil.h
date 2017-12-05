//
//  TheAddressBookUtil.h
//  FaDaMi
//
//  Created by apple on 17/1/9.
//  Copyright © 2017年 CQZ. All rights reserved.
//

#import <Foundation/Foundation.h>

/** model 类 */
@interface FDMContactModel : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *phoneNumber;

@end

typedef void(^FDMContactsBlock)(FDMContactModel *contact);

@interface TheAddressBookUtil : NSObject

/**
 *  调用系统通讯录 选择并获取联系人信息
 *
 *  @param handler 选取联系人后的回调
 */
- (void)callContactsHandler:(FDMContactsBlock)handler;

@end
