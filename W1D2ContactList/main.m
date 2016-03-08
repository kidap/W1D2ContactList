//
//  main.m
//  W1D2ContactList
//
//  Created by Karlo Pagtakhan on 03/08/2016.
//  Copyright © 2016 AccessIT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contact.h"
#import "ContactList.h"
#import "InputCollector.h"

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    
    InputCollector *inputHandler = [[InputCollector alloc] init];
    ContactList *mainContactList = [[ContactList alloc] init];
    NSString *enteredString = [[NSString alloc] init];
    NSMutableArray *inputHistory = [[NSMutableArray alloc] init];
    
    while (1 == 1){
      
      //Get the input from the user
      enteredString = [NSString stringWithString: [inputHandler inputForPrompt:@"What would you like do next? [new] - Create a new contact, [list] - List all contacts, [show <#(index) of contact>] Show contact using the index, [find <search>] Find the contact, [quit] - Exit Application \n Enter command: "] ];
      
      //Save history but only keep the last 3
      if (enteredString != nil) {
        [inputHistory addObject:enteredString];
        if ([inputHistory count] >3) {
          [inputHistory removeObjectAtIndex:0];
        }
      }
      
      //Create Contact
      if ([enteredString isEqualToString:@"new"]){
        NSString *name = [[NSString alloc] init];
        NSString *email = [[NSString alloc] init];
        
        
        //Show current status
        NSLog(@"Creating a new contact.");
        
        //Get the data from the user
        bool isEmailInvalid = YES;
        while(isEmailInvalid){
          email = [NSString stringWithString: [inputHandler inputForPrompt:@"Enter the email: "] ];
          isEmailInvalid = [mainContactList isEmailAddressInvalid:email];
        }
        name = [NSString stringWithString: [inputHandler inputForPrompt:@"Enter the name: "] ];
        
        //Create new instance of Contact
        Contact *newContact = [[Contact alloc] initNewContactWithName:name withEmail:email];
        
        //Add the new instance of contact to the contact list
        [mainContactList addContact:newContact];

      // List
      } else if ([enteredString isEqualToString:@"list"]){
        [mainContactList printContactList];

      // Exit
      } else if ([enteredString isEqualToString:@"quit"]){
        return  0;
        
      // Show
      } else if ([enteredString containsString:@"show"]){
        //Get the index from the entered string
        NSString *indexString =[NSString stringWithString:[enteredString stringByReplacingOccurrencesOfString:@"show" withString:@""] ];
        indexString = [ indexString stringByReplacingOccurrencesOfString:@" " withString:@""];
        
        //Check if only numbers where entered
        if ([indexString rangeOfCharacterFromSet:[NSCharacterSet characterSetWithCharactersInString:@"0123456789"]].location != NSNotFound){
          int index = [indexString intValue];
          
          //Show the contact using the index
          [mainContactList showContactUsingIndex:index];
        } else {
          NSLog(@"Error: Please enter an index after the command show");
        }
        
      // Find
      } else if ([enteredString containsString:@"find"]){
        
        //Get the name from the entered string
        NSString *nameToSearch =[NSString stringWithString:[enteredString stringByReplacingOccurrencesOfString:@"find" withString:@""] ];
        nameToSearch = [ nameToSearch stringByReplacingOccurrencesOfString:@" " withString:@""];
        
        //Search from the contact
        [mainContactList findContact:nameToSearch];
        
        
      // History
      } else if ([enteredString containsString:@"history"]){
        
        //Display the input history - last 3
        for (NSString *inputText in inputHistory) {
          NSLog(@"%@", inputText);
        }
        
      } else {
        if ([enteredString isEqualToString:@""]){
          //Do nothing if user just presses enter
        } else{
          NSLog(@"Error: Input was not recognized.");
        }
      }
      
    }
    
  }
  return 0;
}
