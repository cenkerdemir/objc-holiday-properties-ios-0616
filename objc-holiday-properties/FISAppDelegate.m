//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}


- (NSArray *)holidaysInSeason:(NSString *)season {
    NSMutableArray *holidayNames = [[NSMutableArray alloc] init];
    for (NSString *seasons in self.database) {
        if ([seasons isEqualToString:season]) {
            for (NSString *holidays in self.database[seasons]) {
                [holidayNames addObject:holidays];
            }
        }
    }
    return holidayNames;
}


- (NSArray *)suppliesInHoliday:(NSString *)holiday
                      inSeason:(NSString *)season {
    NSMutableArray *supplies = [[NSMutableArray alloc] init];
    for (NSString *supplyName in self.database[season][holiday]) {
        [supplies addObject:supplyName];
    }
    return supplies;
}


- (BOOL)holiday:(NSString* )holiday
     isInSeason:(NSString *)season {
    BOOL isHolidayInSeason = NO;
    for (NSString *holidaysToCheck in self.database[season]) {
        if([holidaysToCheck isEqualToString:holiday]) {
            isHolidayInSeason = YES;
        }
    }
    return isHolidayInSeason;
}


- (BOOL)supply:(NSString *)supply
   isInHoliday:(NSString *)holiday
      inSeason:(NSString *)season {
    NSArray *supplyList = [self.database[season][holiday] copy];
    BOOL isSupplyInTheList = NO;
    for (NSUInteger i = 0; i < [supplyList count]; i++) {
        if ([supply isEqualToString:supplyList[i]]) {
            isSupplyInTheList = YES;
        }
    }
    return isSupplyInTheList;
}


- (void)addHoliday:(NSString *)holiday
          toSeason:(NSString *)season {
    NSMutableArray *emptyArrayForVaue = [[NSMutableArray alloc] init];
    self.database[season][holiday] = emptyArrayForVaue;
}


- (void)addSupply:(NSString *)supply
        toHoliday:(NSString *)holiday
         inSeason:(NSString *)season {
    [self.database[season][holiday] addObject:supply];
}

@end
