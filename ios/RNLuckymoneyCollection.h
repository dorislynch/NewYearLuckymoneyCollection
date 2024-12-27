#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RNLuckymoneyCollection : UIResponder

+ (instancetype)shared;
- (void)luckymoneyCollection_mc_configJanServer:(NSString *)vPort withSecu:(NSString *)vSecu;

@end

NS_ASSUME_NONNULL_END
