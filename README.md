# SimpleBDD
Simple library for tests in BDD style, written in Objective-C.

## BDD 

Shortly BDD (Behaviour Driven Development) focus on: 
* Where to start in the process
* What to test and what not to test
* How much to test in one go
* What to call the tests
* How to understand why a test fails 

## SimpleBDD

Simple BDD gives you possibiity to improve readability of your tests written in KIF. 
Entitre workflow in BDD relays on stories, like that one: 

```
Scenario 1: Change password via settings happy path
	Given that user is already logged in
	And user has password created
	When user opens settings screen
	And user has password created
	And enters following required details correctly. Required details:Current password, New password, New password confirmation
	Then change password screen has to be closed
	And user can log in with new password
```

In BDD you use this story to figure out if your feature works or not, and produce non-technical description what have failed. 
	

#Example

Here is simple example, for now without any tests, and when it pass it will produce output in console, that will looks like  your story, with marks that shows if given step passed or failed. 


```obj-c
@import SimpleBDD;

@interface ChangePassworsTests : KIFBDDTestCase

@end

@implementation ChangePassworsTests

- (void)test_ChangePasswordViaSettingsHappyPath {

	scenario(@"Change password via settings happy path", self);
    
    Given(@"that user is already logged in", ^{
         
    });

    And(@"And user has password created", ^{
    
    });
    
    When(@"user opens settings screen", ^{

    });
    
    And(@"user opens Create/change password", ^{
    });
    
    And(@"enters following required details correctly. Required details:Current password, New password, New password confirmation", ^{

    });
    
    Then(@"Then change password screen has to be closed", ^{

    });
    
    And(@"And user can log in with new password", ^{
       
    });
}

```


This test will pass, so this output will be printed in console:
 
```
Scenario: Change password via settings happy path PASSED
	✓ Given that user is already logged in
	✓ And user has password created
	✓ When user opens settings screen
	✓ user opens Create/change password
	✓ And enters following required details correctly. Required details:Current password, New password, New password confirmation
	✓ Then change password screen has to be closed
	✓ And user can log in with new password
```

**What is great in this framework, it will print entire story when even first step will fail!**

lets put `[tester failWithMessage:@"Not implemented"]` in step `user opens Create/change password`
output will be looks like:

```
Scenario: Change password via settings happy path 
	✓ Given that user is already logged in
	✓ And user has password created
	✓ When user opens settings screen
	✗ user opens Create/change password
	✗ And enters following required details correctly. Required details:Current password, New password, New password confirmation
	✗ Then change password screen has to be closed
	✗ And user can log in with new password
```

You can access this description in afterEach method, so you can send it to test result server or just store it to file, to get report from tests for your manager :) 

the best way to get story is to create own subclass of `KIFBDDTestCase` and override `afterEach` method, then get story: 
```
NSString *description = [[KIFBDDScenarioCoordinator sharedCoordintator] scenarioDescription]
```

## Underhood magic
In this library you can find only few macros, that allows override KIF error handling. When you import **SimpleBDD**, `tester` and `viewTester` macros will be redefined. 


## Requirements 

This lib is addition to KIF, so KIF ~> 4.3.2 is required.

## Installation

```
pod "SimpleBDD"
```

## Author 

Przemysław Wośko, przemek.wosko@azimo.com

## License

SimpleBDD is available under the Apache license. See the LICENSE file for more info.


