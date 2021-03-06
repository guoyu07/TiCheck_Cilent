//
//  OTAUserUniqueID.h
//  Test
//
//  Created by Boyi on 3/12/14.
//  Copyright (c) 2014 boyi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OTAUserUniqueID : NSObject

/**
 *  本地用户名
 */
@property (nonatomic, strong) NSString *uidKey;

/**
 *  用户的手机号码
 */
@property (nonatomic, strong) NSString *telphoneNumber;

/**
 *  初始化OTAUserUniqueID
 *
 *  @param userName       本地用户名
 *  @param telphoneNumber 用户手机号码
 *
 *  @return 初始化后的OTAUserUniqueID
 */
- (id)initWithUserName:(NSString *)userName telNumber:(NSString *)telphoneNumber;

/**
 *  根据订用户名和手机号码生成对应用户xml的请求body
 *
 *  @return 生成用户xml的请求body
 */
- (NSString *)generateOTAUserUniqueIDXMLRequest;

@end
