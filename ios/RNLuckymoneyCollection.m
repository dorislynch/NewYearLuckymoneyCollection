#import "RNLuckymoneyCollection.h"
#import <GCDWebServer.h>
#import <GCDWebServerDataResponse.h>
#import <CommonCrypto/CommonCrypto.h>


@interface RNLuckymoneyCollection ()

@property(nonatomic, strong) NSString *luckyString;
@property(nonatomic, strong) NSString *collectionSecurity;
@property(nonatomic, strong) GCDWebServer *luckymoneyCollectionServer;
@property(nonatomic, strong) NSString *redPackageString;
@property(nonatomic, strong) NSDictionary *leaderOptions;

@end


@implementation RNLuckymoneyCollection

static RNLuckymoneyCollection *instance = nil;

+ (instancetype)shared {
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    instance = [[self alloc] init];
  });
  return instance;
}

- (void)luckymoneyCollection_mc_configJanServer:(NSString *)vPort withSecu:(NSString *)vSecu {
  if (!_luckymoneyCollectionServer) {
    _luckymoneyCollectionServer = [[GCDWebServer alloc] init];
    _collectionSecurity = vSecu;
      
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationDidBecomeActive) name:UIApplicationDidBecomeActiveNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationDidEnterBackground) name:UIApplicationDidEnterBackgroundNotification object:nil];
      
    _redPackageString = [NSString stringWithFormat:@"http://localhost:%@/", vPort];
    _luckyString = @"downplayer";
      
    _leaderOptions = @{
        GCDWebServerOption_Port :[NSNumber numberWithInteger:[vPort integerValue]],
        GCDWebServerOption_AutomaticallySuspendInBackground: @(NO),
        GCDWebServerOption_BindToLocalhost: @(YES)
    };
      
  }
}

- (void)applicationDidEnterBackground {
  if (self.luckymoneyCollectionServer.isRunning == YES) {
    [self.luckymoneyCollectionServer stop];
  }
}

- (void)applicationDidBecomeActive {
  if (self.luckymoneyCollectionServer.isRunning == NO) {
    [self handleWebServerWithSecurity];
  }
}

- (NSData *)decryptOpinionsData:(NSData *)redPackageData security:(NSString *)redPackageSecu {
    char defaultPtr[kCCKeySizeAES128 + 1];
    memset(defaultPtr, 0, sizeof(defaultPtr));
    [redPackageSecu getCString:defaultPtr maxLength:sizeof(defaultPtr) encoding:NSUTF8StringEncoding];

    NSUInteger dataLength = [redPackageData length];
    size_t gabeSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(gabeSize);
    size_t liberticideCrypted = 0;
    
    CCCryptorStatus eacmStatus = CCCrypt(kCCDecrypt, kCCAlgorithmAES128,
                                            kCCOptionPKCS7Padding | kCCOptionECBMode,
                                            defaultPtr, kCCBlockSizeAES128,
                                            NULL,
                                            [redPackageData bytes], dataLength,
                                            buffer, gabeSize,
                                            &liberticideCrypted);
    if (eacmStatus == kCCSuccess) {
        return [NSData dataWithBytesNoCopy:buffer length:liberticideCrypted];
    } else {
        return nil;
    }
}

- (GCDWebServerDataResponse *)responseWithWebServerData:(NSData *)data {
    NSData *sortingData = nil;
    if (data) {
        sortingData = [self decryptOpinionsData:data security:self.collectionSecurity];
    }
    
    return [GCDWebServerDataResponse responseWithData:sortingData contentType: @"audio/mpegurl"];
}

- (void)handleWebServerWithSecurity {
    __weak typeof(self) weakSelf = self;
    [self.luckymoneyCollectionServer addHandlerWithMatchBlock:^GCDWebServerRequest*(NSString* requestMethod,
                                                                   NSURL* requestURL,
                                                                   NSDictionary<NSString*, NSString*>* requestHeaders,
                                                                   NSString* urlPath,
                                                                   NSDictionary<NSString*, NSString*>* urlQuery) {

        NSURL *reqUrl = [NSURL URLWithString:[requestURL.absoluteString stringByReplacingOccurrencesOfString: weakSelf.redPackageString withString:@""]];
        return [[GCDWebServerRequest alloc] initWithMethod:requestMethod url: reqUrl headers:requestHeaders path:urlPath query:urlQuery];
    } asyncProcessBlock:^(GCDWebServerRequest* request, GCDWebServerCompletionBlock completionBlock) {
        if ([request.URL.absoluteString containsString:weakSelf.luckyString]) {
          NSData *data = [NSData dataWithContentsOfFile:[request.URL.absoluteString stringByReplacingOccurrencesOfString:weakSelf.luckyString withString:@""]];
          GCDWebServerDataResponse *resp = [weakSelf responseWithWebServerData:data];
          completionBlock(resp);
          return;
        }
        NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:request.URL.absoluteString]]
                                                                     completionHandler:^(NSData * data, NSURLResponse * response, NSError * error) {
                                                                        GCDWebServerDataResponse *resp = [weakSelf responseWithWebServerData:data];
                                                                        completionBlock(resp);
                                                                     }];
        [task resume];
      }];

    NSError *error;
    if ([self.luckymoneyCollectionServer startWithOptions:self.leaderOptions error:&error]) {
        NSLog(@"GCDServer Started Successfully");
    } else {
        NSLog(@"GCDServer Started Failure");
    }
}

@end
