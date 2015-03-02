//
//  ViewController.m
//  currency_exchange
//
//  Created by Dadits on 1/18/15.
//  Copyright (c) 2015 Dadits. All rights reserved.
//

#import "ViewController.h"
#import "Currency.h"

@interface ViewController ()<NSURLConnectionDataDelegate, UIPickerViewDelegate, UIPickerViewDataSource>
{
    NSMutableArray *currencies;
}

@property (weak, nonatomic) IBOutlet UITextField *sum;
@property (weak, nonatomic) IBOutlet UILabel *resultField;
@property (weak, nonatomic) IBOutlet UIPickerView *pickFrom;
@property (weak, nonatomic) IBOutlet UIPickerView *pickTo;


@property (nonatomic, strong) NSURLConnection *connection;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    currencies = [NSMutableArray array];
    [currencies addObject:[self hryvna]];
    [self getCurrencys];
}

- (void)getCurrencys{
    NSString *urlString = @"https://api.privatbank.ua/p24api/pubinfo?exchange&json&coursid=5";
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    _connection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:YES];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    if (!dictionary) {
        //todo set status with error
        return;
    }
    NSLog(@"%@", dictionary);
    
    for (NSDictionary *current in dictionary) {
        Currency *currency = [[Currency new] initWithDictionary:current];
        [currencies addObject:currency];
        
        NSLog(@"%@", currency.codeName);
        
        //        [currency saveToUserDefaults];
        
    }
    [_pickFrom reloadAllComponents];
    [_pickTo reloadAllComponents];
}


- (IBAction)doConvert:(UIButton *)sender {
    //show result
    //if same rows - send 1
    NSInteger selectedRowToSell = [_pickFrom selectedRowInComponent:0];
    NSInteger selectedRowToBuy = [_pickTo selectedRowInComponent:0];
    
    if (selectedRowToSell == selectedRowToBuy) {
        [self makeConvert:1 to:1];
    } else {
        [self makeConvert:[[currencies[selectedRowToSell] sale] floatValue] to:[[currencies[selectedRowToBuy] buy] floatValue]];
    }
}


-(void)makeConvert:(float)sale to:(float)buy {
    float enteretInt = [_sum.text floatValue];
    float result = sale * enteretInt / buy;
    _resultField.text = [NSString stringWithFormat:@"%.02f", result];
    
}

-(Currency*)hryvna
{
    Currency *uah = [Currency new];
    uah.codeName = @"UAH";
    uah.codeNational = @"UAH";
    uah.sale = @"1";
    uah.buy = @"1";
    return uah;
}


#pragma mark- UIPickerView Delegate & DataSource
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return currencies.count;
}

- (NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSAttributedString *attString = [[NSAttributedString alloc] initWithString:[currencies[row] codeName] attributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:((float)103/255.0) green:((float)167/255.0) blue:((float)52/255.0) alpha:1.0]}];
    
    return attString;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
