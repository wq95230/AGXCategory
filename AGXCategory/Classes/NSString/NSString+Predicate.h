//
//  NSString+Predicate.h
//  BaseDemo
//
//  Created by 刘剑锋 on 2022/5/28.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Predicate)

//有效的电话号码
- (BOOL) ag_isValidMobileNumber;

//有效的真实姓名
- (BOOL) ag_isValidRealName;

//是否只有中文
- (BOOL) ag_isOnlyChinese;

//有效的验证码(根据自家的验证码位数进行修改)
- (BOOL) ag_isValidVerifyCode;

//有效的银行卡号
- (BOOL) ag_isValidBankCardNumber;

//有效的邮箱
- (BOOL) ag_isValidEmail;

//有效的字母数字密码
- (BOOL) ag_isValidAlphaNumberPassword;

//检测有效身份证
//15位
- (BOOL) ag_isValidIdentifyFifteen;

//18位
- (BOOL) ag_isValidIdentifyEighteen;

//限制只能输入数字
- (BOOL) ag_isOnlyNumber;

@end

NS_ASSUME_NONNULL_END
