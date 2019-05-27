//
//  ReportCreatViewController.m
//  Medical
//
//  Created by 许冬 on 2019/5/26.
//  Copyright © 2019 Danny. All rights reserved.
//

#import "ReportCreatViewController.h"
#import "XLForm.h"
#import "User.h"
#import "SCLAlertView.h"
#import "Realm.h"

@interface ReportCreatViewController ()

// owner
@property (nonatomic, strong) XLFormSectionDescriptor *ownerSection;
@property (nonatomic, strong) XLFormRowDescriptor *ownerPhoneRow;
@property (nonatomic, strong) XLFormRowDescriptor *ownerNameRow;
@property (nonatomic, strong) XLFormRowDescriptor *ownerMatchRow;

// pet
@property (nonatomic, strong) XLFormSectionDescriptor *petSection;
@property (nonatomic, strong) XLFormRowDescriptor *petSpeciesRow;
@property (nonatomic, strong) XLFormRowDescriptor *petNameRow;

// report
@property (nonatomic, strong) XLFormSectionDescriptor *reportSection;
@property (nonatomic, strong) XLFormRowDescriptor *checkItemRow;
@property (nonatomic, strong) XLFormRowDescriptor *sampleTypeRow;

@property (nonatomic, strong) XLFormRowDescriptor *report1Row;
@property (nonatomic, strong) XLFormRowDescriptor *report2Row;
@property (nonatomic, strong) XLFormRowDescriptor *report3Row;
@property (nonatomic, strong) XLFormRowDescriptor *report4Row;
@property (nonatomic, strong) XLFormRowDescriptor *report5Row;

// Image
@property (nonatomic, strong) XLFormSectionDescriptor *imageSection;
@property (nonatomic, strong) XLFormRowDescriptor *reportImageRow;

// Date
@property (nonatomic, strong) XLFormSectionDescriptor *dateSection;
@property (nonatomic, strong) XLFormRowDescriptor *reportDateRow;

@end

@implementation ReportCreatViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self){
        [self initializeForm];
    }
    return self;
}


- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self){
        [self initializeForm];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveBtnClicked)];
}

#pragma mark - Init form
- (void)initializeForm {
    self.form = [XLFormDescriptor formDescriptor];
    
    // owner
    self.ownerSection = [XLFormSectionDescriptor formSectionWithTitle:@"主人信息"];
    [self.form addFormSection:self.ownerSection];
    
    self.ownerPhoneRow = [XLFormRowDescriptor formRowDescriptorWithTag:@"ownerPhone" rowType:XLFormRowDescriptorTypePhone title:@"主人手机"];
    [self.ownerSection addFormRow:self.ownerPhoneRow];
    
    self.ownerNameRow = [XLFormRowDescriptor formRowDescriptorWithTag:@"ownerName" rowType:XLFormRowDescriptorTypeName title:@"主人姓名"];
    [self.ownerSection addFormRow:self.ownerNameRow];
    
    self.ownerMatchRow = [XLFormRowDescriptor formRowDescriptorWithTag:@"ownerMatch" rowType:XLFormRowDescriptorTypeButton title:@"匹配"];
    
    XLFormAction *action = [[XLFormAction alloc] init];
    __weak typeof(self)weakSelf = self;
    action.formBlock = ^(XLFormRowDescriptor * __nonnull sender){
        __strong typeof(weakSelf)strongSelf = weakSelf;
        [strongSelf ownerMatch];
    };
    self.ownerMatchRow.action = action;
    [self.ownerSection addFormRow:self.ownerMatchRow];
    
    // pet
    self.petSection = [XLFormSectionDescriptor formSectionWithTitle:@"宠物信息"];
    [self.form addFormSection:self.petSection];
    
    self.petSpeciesRow = [XLFormRowDescriptor formRowDescriptorWithTag:@"petSpecies" rowType:XLFormRowDescriptorTypeSelectorSegmentedControl title:@"宠物种类"];
    self.petSpeciesRow.selectorOptions = @[@"狗狗", @"猫猫"];
    [self.petSection addFormRow:self.petSpeciesRow];
    
    self.petNameRow = [XLFormRowDescriptor formRowDescriptorWithTag:@"petName" rowType:XLFormRowDescriptorTypeName title:@"宠物姓名"];
    [self.petSection addFormRow:self.petNameRow];
    
    // report
    self.reportSection = [XLFormSectionDescriptor formSectionWithTitle:@"报告内容"];
    [self.form addFormSection:self.reportSection];
    
    self.checkItemRow = [XLFormRowDescriptor formRowDescriptorWithTag:@"checkItem" rowType:XLFormRowDescriptorTypeSelectorSegmentedControl title:@"检查项目"];
    self.checkItemRow.selectorOptions = @[@"直接镜检", @"染色镜检"];
    [self.reportSection addFormRow:self.checkItemRow];
    
    self.sampleTypeRow = [XLFormRowDescriptor formRowDescriptorWithTag:@"sampleType" rowType:XLFormRowDescriptorTypeSelectorSegmentedControl title:@"样本种类"];
    self.sampleTypeRow.selectorOptions = @[@"皮肤", @"毛发", @"耳道分泌物"];
    [self.reportSection addFormRow:self.sampleTypeRow];
    
    self.report1Row = [XLFormRowDescriptor formRowDescriptorWithTag:@"report1" rowType:XLFormRowDescriptorTypeText title:@"细菌"];
    [self.reportSection addFormRow:self.report1Row];
    
    self.report2Row = [XLFormRowDescriptor formRowDescriptorWithTag:@"report2" rowType:XLFormRowDescriptorTypeText title:@"真菌"];
    [self.reportSection addFormRow:self.report2Row];
    
    self.report3Row = [XLFormRowDescriptor formRowDescriptorWithTag:@"report3" rowType:XLFormRowDescriptorTypeText title:@"寄生虫"];
    [self.reportSection addFormRow:self.report3Row];
    
    self.report4Row = [XLFormRowDescriptor formRowDescriptorWithTag:@"report4" rowType:XLFormRowDescriptorTypeText title:@"毛发"];
    [self.reportSection addFormRow:self.report4Row];
    
    self.report5Row = [XLFormRowDescriptor formRowDescriptorWithTag:@"report5" rowType:XLFormRowDescriptorTypeText title:@"毛发"];
    [self.reportSection addFormRow:self.report5Row];
    
    // Image
    self.imageSection = [XLFormSectionDescriptor formSectionWithTitle:@"附图"];
    [self.form addFormSection:self.imageSection];
    
    self.reportImageRow = [XLFormRowDescriptor formRowDescriptorWithTag:@"reportImage" rowType:XLFormRowDescriptorTypeImage title:@"附图"];
    [self.imageSection addFormRow:self.reportImageRow];
    
    // Date
    self.dateSection = [XLFormSectionDescriptor formSectionWithTitle:@"日期"];
    [self.form addFormSection:self.dateSection];
    
    self.reportDateRow = [XLFormRowDescriptor formRowDescriptorWithTag:@"reportDate" rowType:XLFormRowDescriptorTypeDate title:@"日期"];
    [self.dateSection addFormRow:self.reportDateRow];

}

#pragma mark - Save
- (void)saveBtnClicked {
    // validation
    if (!self.ownerPhoneRow.value || [(NSString *)self.ownerPhoneRow.value length] != 11) {
        SCLAlertView *alert = [[SCLAlertView alloc] init];
        [alert showWarning:self title:@"输入错误" subTitle:@"【主人手机号】输入错误" closeButtonTitle:@"OK" duration:0.0f];
        return;
    }
    
    if (!self.ownerNameRow.value) {
        SCLAlertView *alert = [[SCLAlertView alloc] init];
        [alert showWarning:self title:@"输入错误" subTitle:@"【主人名称】输入错误" closeButtonTitle:@"OK" duration:0.0f];
        return;
    }
    
    if (!self.petSpeciesRow.value) {
        SCLAlertView *alert = [[SCLAlertView alloc] init];
        [alert showWarning:self title:@"输入错误" subTitle:@"【宠物种类】未选择" closeButtonTitle:@"OK" duration:0.0f];
        return;
    }
    
    if (!self.petNameRow.value) {
        SCLAlertView *alert = [[SCLAlertView alloc] init];
        [alert showWarning:self title:@"输入错误" subTitle:@"【宠物名称】输入错误" closeButtonTitle:@"OK" duration:0.0f];
        return;
    }
    
    if (!self.checkItemRow.value) {
        SCLAlertView *alert = [[SCLAlertView alloc] init];
        [alert showWarning:self title:@"输入错误" subTitle:@"【检查项目】未选择" closeButtonTitle:@"OK" duration:0.0f];
        return;
    }
    
    if (!self.sampleTypeRow.value) {
        SCLAlertView *alert = [[SCLAlertView alloc] init];
        [alert showWarning:self title:@"输入错误" subTitle:@"【样本种类】未选择" closeButtonTitle:@"OK" duration:0.0f];
        return;
    }
    
    if (!self.report1Row.value ||
        !self.report2Row.value ||
        !self.report3Row.value ||
        !self.report4Row.value ||
        !self.report5Row.value) {
        SCLAlertView *alert = [[SCLAlertView alloc] init];
        [alert showWarning:self title:@"输入错误" subTitle:@"【检查内容】输入错误" closeButtonTitle:@"OK" duration:0.0f];
        return;
    }
    
    if (!self.reportDateRow.value) {
        SCLAlertView *alert = [[SCLAlertView alloc] init];
        [alert showWarning:self title:@"输入错误" subTitle:@"【日期】未选择" closeButtonTitle:@"OK" duration:0.0f];
        return;
    }
    
    // save
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];
    
    User *user = [[User objectsWhere:@"phone == %@", self.ownerPhoneRow.value] firstObject];
    if (!user) {
        user = [[User alloc] init];
        [realm addObject:user];
    }
    user.phone = self.ownerPhoneRow.value;
    user.name = self.ownerNameRow.value;
    
    Pet *pet = [[user.pets objectsWhere:@"name == %@", self.petNameRow.value] firstObject];
    if (!pet) {
        pet = [[Pet alloc] init];
        [user.pets addObject:pet];
    }
    pet.species = self.petSpeciesRow.value;
    pet.name = self.petNameRow.value;
    
    SkinExaminationReport *report = [[SkinExaminationReport alloc] init];
    [pet.skinExaminationReports addObject:report];
    report.checkItem = self.checkItemRow.value;
    report.sampleType = self.sampleTypeRow.value;
    report.checkBacteria = self.report1Row.value;
    report.checkFungus = self.report2Row.value;
    report.checkParasite = self.report3Row.value;
    report.checkHair = self.report4Row.value;
    report.checkAbnormalCell = self.report5Row.value;
    report.date = self.reportDateRow.value;
    
    [realm commitWriteTransaction];
    SCLAlertView *alert = [[SCLAlertView alloc] init];
    [alert showSuccess:self title:@"已保存" subTitle:nil closeButtonTitle:@"OK" duration:0.0f];
    return;
}

- (void)ownerMatch {
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
