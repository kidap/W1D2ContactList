//
//  Contact.h
//  W1D2ContactList
//
//  Created by Karlo Pagtakhan on 03/08/2016.
//  Copyright © 2016 AccessIT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Contact : NSObject

@property(nonatomic) NSString* name;
@property(nonatomic) NSString* email;

-(id) initNewContactWithName:(NSString *)name withEmail:(NSString *) email;
@end
