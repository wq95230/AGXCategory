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
- (BOOL) agisValidMobileNumber;

//有效的真实姓名
- (BOOL) agisValidRealName;

//是否只有中文
- (BOOL) agisOnlyChinese;

//有效的验证码(根据自家的验证码位数进行修改)
- (BOOL) agisValidVerifyCode;

//有效的银行卡号
- (BOOL) agisValidBankCardNumber;

//有效的邮箱
- (BOOL) agisValidEmail;

//有效的字母数字密码
- (BOOL) agisValidAlphaNumberPassword;

//检测有效身份证
//15位
- (BOOL) agisValidIdentifyFifteen;

//18位
- (BOOL) agisValidIdentifyEighteen;

//限制只能输入数字
- (BOOL) agisOnlyNumber;

@end

NS_ASSUME_NONNULL_END
