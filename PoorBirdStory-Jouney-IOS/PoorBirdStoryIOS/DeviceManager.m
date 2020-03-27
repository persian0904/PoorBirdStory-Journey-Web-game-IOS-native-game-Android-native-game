//
//  DeviceManager.m
//  PoorBirdStoryIOS
//
//  Created by NghiemTuan on 3/25/20.
//  Copyright © 2020 NghiemTuan. All rights reserved.
//

#import <sys/utsname.h>

#define kDeviceSimpleModelNameSimulator     @"Simulator"
#define kDeviceSimpleModelNamePhone1G       @"iPhone 1G"
#define kDeviceSimpleModelNamePhone3G       @"iPhone 3G"
#define kDeviceSimpleModelNamePhone3GS      @"iPhone 3GS"
#define kDeviceSimpleModelNamePhone4        @"iPhone 4"
#define kDeviceSimpleModelNamePhone4S       @"iPhone 4S"
#define kDeviceSimpleModelNamePhone5        @"iPhone 5"
#define kDeviceSimpleModelNamePhone5S       @"iPhone 5S"
#define kDeviceSimpleModelNamePhone6        @"iPhone 6"
#define kDeviceSimpleModelNamePhone6Plus    @"iPhone 6 Plus"

#define kDeviceSimpleModelNamePodTouch1G    @"iPod Touch 1G"
#define kDeviceSimpleModelNamePodTouch2G    @"iPod Touch 2G"
#define kDeviceSimpleModelNamePodTouch3G    @"iPod Touch 3G"
#define kDeviceSimpleModelNamePodTouch4G    @"iPod Touch 4G"
#define kDeviceSimpleModelNamePodTouch5G    @"iPod Touch 5G"

#define kDeviceSimpleModelNamePad1          @"iPad 1"
#define kDeviceSimpleModelNamePad2          @"iPad 2"
#define kDeviceSimpleModelNamePad3          @"iPad 3"
#define kDeviceSimpleModelNamePad4          @"iPad 4"
#define kDeviceSimpleModelNamePadAir        @"iPad Air"
#define kDeviceSimpleModelNamePadAir2       @"iPad Air 2"
#define kDeviceSimpleModelNamePadMini       @"iPad Mini"
#define kDeviceSimpleModelNamePadMini2      @"iPad Mini 2"
#define kDeviceSimpleModelNamePadMini3      @"iPad Mini 3"

@implementation DeviceManager

- (NSString *)deviceModelName; {
    struct utsname systemInfo;
    uname(&systemInfo);
    return [ NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
}

- (NSString *)deviceSimpleModelName {
    NSString *deviceModelName = [self deviceModelName];
    
    if ([deviceModelName isEqualToString:@"x86_64"] ||
        [deviceModelName isEqualToString:@"i386"])      return kDeviceSimpleModelNameSimulator;
    
    if ([deviceModelName isEqualToString:@"iPhone1,1"]) return kDeviceSimpleModelNamePhone1G;
    if ([deviceModelName isEqualToString:@"iPhone1,2"]) return kDeviceSimpleModelNamePhone3G;
    if ([deviceModelName hasPrefix:@"iPhone2"])         return kDeviceSimpleModelNamePhone3GS;
    if ([deviceModelName hasPrefix:@"iPhone3"])         return kDeviceSimpleModelNamePhone4;
    if ([deviceModelName hasPrefix:@"iPhone4"])         return kDeviceSimpleModelNamePhone4S;
    if ([deviceModelName hasPrefix:@"iPhone5"])         return kDeviceSimpleModelNamePhone5;
    if ([deviceModelName hasPrefix:@"iPhone6"])         return kDeviceSimpleModelNamePhone5S;
    if ([deviceModelName hasPrefix:@"iPhone7,1"])       return kDeviceSimpleModelNamePhone6Plus;
    if ([deviceModelName hasPrefix:@"iPhone7,2"])       return kDeviceSimpleModelNamePhone6;
    
    if ([deviceModelName hasPrefix:@"iPod1"])           return kDeviceSimpleModelNamePodTouch1G;
    if ([deviceModelName hasPrefix:@"iPod2"])           return kDeviceSimpleModelNamePodTouch2G;
    if ([deviceModelName hasPrefix:@"iPod3"])           return kDeviceSimpleModelNamePodTouch3G;
    if ([deviceModelName hasPrefix:@"iPod4"])           return kDeviceSimpleModelNamePodTouch4G;
    if ([deviceModelName hasPrefix:@"iPod5"])           return kDeviceSimpleModelNamePodTouch5G;
    
    if ([deviceModelName hasPrefix:@"iPad1"])           return kDeviceSimpleModelNamePad1;
    if ([deviceModelName isEqualToString:@"iPad2,1"] ||
        [deviceModelName isEqualToString:@"iPad2,2"] ||
        [deviceModelName isEqualToString:@"iPad2,3"] ||
        [deviceModelName isEqualToString:@"iPad2,4"])   return kDeviceSimpleModelNamePad2;
    if ([deviceModelName isEqualToString:@"iPad2,5"] ||
        [deviceModelName isEqualToString:@"iPad2,6"] ||
        [deviceModelName isEqualToString:@"iPad2,7"])   return kDeviceSimpleModelNamePadMini;
    if ([deviceModelName isEqualToString:@"iPad3,1"] ||
        [deviceModelName isEqualToString:@"iPad3,2"] ||
        [deviceModelName isEqualToString:@"iPad3,3"])   return kDeviceSimpleModelNamePad3;
    if ([deviceModelName isEqualToString:@"iPad3,4"] ||
        [deviceModelName isEqualToString:@"iPad3,5"] ||
        [deviceModelName isEqualToString:@"iPad3,6"])   return kDeviceSimpleModelNamePad4;
    if ([deviceModelName isEqualToString:@"iPad4,1"] ||
        [deviceModelName isEqualToString:@"iPad4,2"] ||
        [deviceModelName isEqualToString:@"iPad4,3"])   return kDeviceSimpleModelNamePadAir;
    if ([deviceModelName isEqualToString:@"iPad4,4"] ||
        [deviceModelName isEqualToString:@"iPad4,5"] ||
        [deviceModelName isEqualToString:@"iPad4,6"])   return kDeviceSimpleModelNamePadMini2;
    if ([deviceModelName hasPrefix:@"iPad5"])           return kDeviceSimpleModelNamePadAir2;
    if ([deviceModelName isEqualToString:@"iPad4,7"] ||
        [deviceModelName isEqualToString:@"iPad4,8"])   return kDeviceSimpleModelNamePadMini3;
    
    return deviceModelName;
}

@end
