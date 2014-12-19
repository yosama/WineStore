//
//  YOSWineViewController.m
//  WineStore
//
//  Created by Yosnier on 19/12/14.
//  Copyright (c) 2014 yos. All rights reserved.
//

#import "YOSWineViewController.h"



@implementation YOSWineViewController


-(id) initWithModel: (YOSWineModel *) aModel{
    
    if ( self = [super initWithNibName:nil
                                bundle:nil]){
        _model = aModel;
    }
    
    return self;
    
}




// Mantiene sincronizado modelo y vista.
//-(void) viewWillAppear:(BOOL)animated{
//    [super viewWillAppear:<#animated#>];
//}
//
//-(void) viewWillDisappear:(BOOL)animated{
//    [super viewWillAppear:<#animated#>];
//}



// Cuando el sistema operativa se da cuenta que se esta quedando sin memoria, envia un mensaje a este metodo.
// Lo que se hace aqui es eliminar todo aquello que no necesites.
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
