//
//  TheAddressBookUtil.m
//  FaDaMi
//
//  Created by apple on 17/1/9.
//  Copyright © 2017年 CQZ. All rights reserved.
//

#import "TheAddressBookUtil.h"

// iOS 9.0 以下
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>

// iOS 9.0 及以上
#import <Contacts/Contacts.h>
#import <ContactsUI/ContactsUI.h>

#define kRootViewController [UIApplication sharedApplication].keyWindow.rootViewController

@implementation FDMContactModel

- (instancetype)initWithName:(NSString *)name phoneNumber:(NSString *)phoneNumber {
    self = [super init];
    if (self) {
        self.name = name;
        self.phoneNumber = phoneNumber;
    }
    return self;
}
@end

@interface TheAddressBookUtil () <UINavigationControllerDelegate, ABPeoplePickerNavigationControllerDelegate, CNContactPickerDelegate>

@property (nonatomic, copy) FDMContactsBlock contactBlock;

@end

@implementation TheAddressBookUtil

#pragma mark - 调用系统通讯录 选择并获取联系人信息
- (void)callContactsHandler:(FDMContactsBlock)handler {
    
    self.contactBlock = handler;
    NSDictionary* dict = [NSDictionary dictionaryWithObject:UIColorMakeWithHex(@"#333333") forKey:NSForegroundColorAttributeName];

    if ([UIDevice currentDevice].systemVersion.floatValue < 9.0) {
        
        ABPeoplePickerNavigationController *peoplePicker = [[ABPeoplePickerNavigationController alloc] init];
        peoplePicker.peoplePickerDelegate = self;
        if(IOS8_SDK_ALLOWED){
            peoplePicker.predicateForSelectionOfPerson = [NSPredicate predicateWithValue:false];
        }

        [[UINavigationBar appearance] setTintColor:UIColorMakeWithHex(@"#878787")];
        [[UINavigationBar appearance] setTitleTextAttributes:dict];
        [kRootViewController presentViewController:peoplePicker animated:YES completion:nil];
        
    }else{  // iOS 9.0 以后，使用新的系统通讯录框架
        
        CNContactStore *contactStore = [[CNContactStore alloc] init];
//            [CNContactStore authorizationStatusForEntityType:(CNEntityTypeContacts)];
        
        [contactStore requestAccessForEntityType:CNEntityTypeContacts completionHandler:^(BOOL granted, NSError * _Nullable error) {
            
            if (granted) {
                CNContactPickerViewController *picker = [[CNContactPickerViewController alloc] init];
                picker.delegate = self;
                [[UINavigationBar appearance] setTintColor:UIColorMakeWithHex(@"#878787")];
                [[UINavigationBar appearance] setTitleTextAttributes:dict];
//                picker.displayedPropertyKeys = @[CNContactGivenNameKey, CNContactFamilyNameKey, CNContactImageDataKey,CNContactPhoneticMiddleNameKey,CNContactPhoneticFamilyNameKey,CNContactPhoneticOrganizationNameKey,CNContactPhoneNumbersKey];

                [kRootViewController presentViewController:picker animated:YES completion:^{
                    
                }];
            }
        }];
    }
}
#pragma mark - ABPeoplePickerNavigationController delegate
- (void)peoplePickerNavigationController:(ABPeoplePickerNavigationController*)peoplePicker didSelectPerson:(ABRecordRef)person {
    
    ABPersonViewController *personViewController = [[ABPersonViewController alloc] init];
    personViewController.displayedPerson = person;
    [peoplePicker pushViewController:personViewController animated:YES];
}
// 在联系人详情页可直接发信息/打电话
- (void)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker didSelectPerson:(ABRecordRef)person property:(ABPropertyID)property identifier:(ABMultiValueIdentifier)identifier{
    
    
    ABMultiValueRef phone = ABRecordCopyValue(person, kABPersonPhoneProperty);
    long index = ABMultiValueGetIndexForIdentifier(phone,identifier);
    NSString *phoneNumber = (__bridge NSString *)ABMultiValueCopyValueAtIndex(phone, index);
    
    if ([phoneNumber hasPrefix:@"+"]) {
        phoneNumber = [phoneNumber substringFromIndex:3];
    }
    
    phoneNumber = [phoneNumber stringByReplacingOccurrencesOfString:@"-" withString:@""];
    
    NSString *firstName = (__bridge NSString *)ABRecordCopyValue(person, kABPersonFirstNameProperty);
    if (!firstName) {
        firstName = @""; //!!!: 注意这里firstName/lastName是 给@"" 还是 @" ", 如果姓名要求无空格, 则必须为@""
    }
    
    NSString *lastName=(__bridge NSString *)ABRecordCopyValue(person, kABPersonLastNameProperty);
    if (!lastName) {
        lastName = @"";
    }
    
    NSString *personName = [NSString stringWithFormat:@"%@%@", lastName,firstName];

    FDMContactModel *model = [[FDMContactModel alloc] initWithName:personName phoneNumber:phoneNumber];
    if (self.contactBlock) {
        self.contactBlock(model);
    }
    
    [kRootViewController dismissViewControllerAnimated:YES completion:^{}];
}
- (void)peoplePickerNavigationControllerDidCancel:(ABPeoplePickerNavigationController *)peoplePicker {
    
    [peoplePicker dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark - CNContactPickerViewController delegate
// 通讯录列表 - 点击某个联系人 - 详情页 - 点击一个号码, 返回
- (void)contactPicker:(CNContactPickerViewController *)picker didSelectContactProperty:(CNContactProperty *)contactProperty {
    
    NSString *personName = [NSString stringWithFormat:@"%@%@", contactProperty.contact.familyName, contactProperty.contact.givenName];
    
    //判断点击的是否是手机号，如果是手机号的话。则返回手机号，否则取出第一个手机号。  如果没有手机号 则什么都不返回
    
    if ([contactProperty.value isKindOfClass:[CNPhoneNumber class]]) {
        
        CNPhoneNumber *pNum = (CNPhoneNumber *)contactProperty.value;
        NSString *phoneNumber = pNum.stringValue;
        FDMContactModel *model = [[FDMContactModel alloc] initWithName:personName phoneNumber:phoneNumber];
        if (self.contactBlock) {
            self.contactBlock(model);
        }

    } else {
        
        if ([contactProperty.contact.phoneNumbers count] > 0) {
            NSArray *pNumberArrays = contactProperty.contact.phoneNumbers;
            CNLabeledValue *labValue = pNumberArrays[0];
            CNPhoneNumber *pNum = labValue.value;
            NSString *phoneNumber = pNum.stringValue;
            FDMContactModel *model = [[FDMContactModel alloc] initWithName:personName phoneNumber:phoneNumber];
            if (self.contactBlock) {
                self.contactBlock(model);
            }
        }
    }
    
}

- (void)contactPickerDidCancel:(CNContactPickerViewController *)picker {
    
    [kRootViewController dismissViewControllerAnimated:YES completion:^{}];
}

@end
