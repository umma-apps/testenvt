// page 68287 "FIN-Staff Advance Surr. List"
// {
//     CardPageID = "FIN-Staff Advance Accounting";
//     DeleteAllowed = false;
//     Editable = false;
//     InsertAllowed = true;
//     ModifyAllowed = false;
//     PageType = List;
//     PromotedActionCategories = 'New,Process,Reports,Approval,Budgetary Control,Cancellation,Category7_caption,Category8_caption,Category9_caption,Category10_caption';
//     SourceTable = Table61199;
//     SourceTableView = WHERE (Status = FILTER (<> Cancelled),
//                             Posted = CONST (No));

//     layout
//     {
//         area(content)
//         {
//             repeater()
//             {
//                 field(No; No)
//                 {
//                 }
//                 field("Imprest Issue Doc. No"; "Imprest Issue Doc. No")
//                 {
//                 }
//                 field("Surrender Date"; "Surrender Date")
//                 {
//                 }
//                 field("User ID"; "User ID")
//                 {
//                 }
//                 field("Account No."; "Account No.")
//                 {
//                 }
//                 field(Payee; Payee)
//                 {
//                 }
//                 field("Currency Code"; "Currency Code")
//                 {
//                 }
//                 field(Amount; Amount)
//                 {
//                 }
//                 field(Status; Status)
//                 {
//                 }
//                 field("Responsibility Center"; "Responsibility Center")
//                 {
//                 }
//                 field(Surrendered; Surrendered)
//                 {
//                 }
//             }
//         }
//     }

//     actions
//     {
//         area(processing)
//         {
//             group(Functions)
//             {
//                 Caption = 'Functions';
//                 action(Approvals)
//                 {
//                     Caption = 'Approvals';
//                     Image = Approvals;
//                     Promoted = true;
//                     PromotedCategory = Category4;
//                     PromotedIsBig = true;

//                     trigger OnAction()
//                     var
//                         ApprovalEntries: Page "658";
//                     begin

//                         DocumentType := DocumentType::AdvanceSurrender;
//                         ApprovalEntries.Setfilters(DATABASE::"FIN-Staff Advance Surr. Header", DocumentType, No);
//                         ApprovalEntries.RUN;
//                     end;
//                 }
//                 separator()
//                 {
//                 }
//                 action(Post)
//                 {
//                     Caption = 'Post';
//                     Image = PostDocument;
//                     Promoted = true;
//                     PromotedCategory = Process;
//                     PromotedIsBig = true;

//                     trigger OnAction()
//                     var
//                         Txt0001: Label 'Actual Spent and the Cash Receipt Amount should be equal to the amount Issued';
//                     begin
//                         TESTFIELD(Status, Status::Approved);
//                         TESTFIELD("Surrender Posting Date");


//                         IF Posted THEN
//                             ERROR('The transaction has already been posted.');
//                         /*
//                         //Ensure actual spent does not exceed the amount on original document
//                          CALCFIELDS("Actual Spent","Cash Receipt Amount") ;
//                           IF "Actual Spent"+"Cash Receipt Amount" > Amount THEN
//                              ERROR('The actual Amount spent should not exceed the amount issued ');
//                           */
//                         //Get the Cash office user template
//                         Temp.GET(USERID);
//                         SurrBatch := Temp."Advance Surr Batch";
//                         SurrTemplate := Temp."Advance Surr Template";


//                         //HOW ABOUT WHERE ONE RETURNS ALL THE AMOUNT??
//                         //THERE SHOULD BE NO GENJNL ENTRIES BUT REVERSE THE COMMITTMENTS
//                         CALCFIELDS("Actual Spent");
//                         IF "Actual Spent" = 0 THEN
//                             IF CONFIRM(Text000, TRUE) THEN
//                                 UpdateforNoActualSpent
//                             ELSE
//                                 ERROR(Text001);

//                         // DELETE ANY LINE ITEM THAT MAY BE PRESENT
//                         IF GenledSetup.GET THEN BEGIN
//                             GenJnlLine.RESET;
//                             GenJnlLine.SETRANGE(GenJnlLine."Journal Template Name", SurrTemplate);
//                             GenJnlLine.SETRANGE(GenJnlLine."Journal Batch Name", SurrBatch);
//                             GenJnlLine.DELETEALL;
//                         END;

//                         IF DefaultBatch.GET(SurrTemplate, SurrBatch) THEN BEGIN
//                             DefaultBatch.DELETE;
//                         END;

//                         DefaultBatch.RESET;
//                         DefaultBatch."Journal Template Name" := SurrTemplate;
//                         DefaultBatch.Name := SurrBatch;
//                         DefaultBatch.INSERT;
//                         LineNo := 0;

//                         ImprestDetails.RESET;
//                         ImprestDetails.SETRANGE(ImprestDetails."Surrender Doc No.", No);
//                         IF ImprestDetails.FIND('-') THEN BEGIN
//                             REPEAT
//                                 //Post Surrender Journal
//                                 //Compare the amount issued =amount on cash reciecied.
//                                 //Created new field for zero spent
//                                 //

//                                 //ImprestDetails.TESTFIELD("Actual Spent");
//                                 //ImprestDetails.TESTFIELD("Actual Spent");
//                                 /*
//                                 IF (ImprestDetails."Cash Receipt Amount"+ImprestDetails."Actual Spent")<>ImprestDetails.Amount THEN
//                                    ERROR(Txt0001);
//                                        */
//                                 TESTFIELD("Global Dimension 1 Code");


//                                 LineNo := LineNo + 1000;
//                                 GenJnlLine.INIT;
//                                 GenJnlLine."Journal Template Name" := SurrTemplate;
//                                 GenJnlLine."Journal Batch Name" := SurrBatch;
//                                 GenJnlLine."Line No." := LineNo;
//                                 GenJnlLine."Source Code" := 'PAYMENTJNL';
//                                 GenJnlLine."Account Type" := GenJnlLine."Account Type"::"G/L Account";
//                                 GenJnlLine."Account No." := ImprestDetails."Account No:";
//                                 GenJnlLine.VALIDATE(GenJnlLine."Account No.");
//                                 //Set these fields to blanks
//                                 GenJnlLine."Posting Date" := "Surrender Posting Date";
//                                 GenJnlLine."Gen. Posting Type" := GenJnlLine."Gen. Posting Type"::" ";
//                                 GenJnlLine.VALIDATE("Gen. Posting Type");
//                                 GenJnlLine."Gen. Bus. Posting Group" := '';
//                                 GenJnlLine.VALIDATE("Gen. Bus. Posting Group");
//                                 GenJnlLine."Gen. Prod. Posting Group" := '';
//                                 GenJnlLine.VALIDATE("Gen. Prod. Posting Group");
//                                 GenJnlLine."VAT Bus. Posting Group" := '';
//                                 GenJnlLine.VALIDATE("VAT Bus. Posting Group");
//                                 GenJnlLine."VAT Prod. Posting Group" := '';
//                                 GenJnlLine.VALIDATE("VAT Prod. Posting Group");
//                                 GenJnlLine."Document No." := No;
//                                 GenJnlLine.Amount := ImprestDetails."Actual Spent";
//                                 GenJnlLine.VALIDATE(GenJnlLine.Amount);
//                                 GenJnlLine."Bal. Account Type" := GenJnlLine."Bal. Account Type"::Customer;
//                                 GenJnlLine."Bal. Account No." := ImprestDetails."Advance Holder";
//                                 //GenJnlLine.Description:='Advance Surrendered by staff';
//                                 GenJnlLine.Description := 'Advance Surrender: ' + "Account No." + ':' + Payee;
//                                 GenJnlLine.VALIDATE(GenJnlLine."Bal. Account No.");
//                                 GenJnlLine."Currency Code" := "Currency Code";
//                                 GenJnlLine.VALIDATE("Currency Code");
//                                 //Take care of Currency Factor
//                                 GenJnlLine."Currency Factor" := "Currency Factor";
//                                 GenJnlLine.VALIDATE("Currency Factor");

//                                 GenJnlLine."Shortcut Dimension 1 Code" := "Global Dimension 1 Code";
//                                 GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
//                                 GenJnlLine."Shortcut Dimension 2 Code" := "Shortcut Dimension 2 Code";
//                                 GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");
//                                 GenJnlLine.ValidateShortcutDimCode(3, "Shortcut Dimension 3 Code");
//                                 GenJnlLine.ValidateShortcutDimCode(4, "Shortcut Dimension 4 Code");

//                                 //Application of Surrender entries
//                                 IF GenJnlLine."Bal. Account Type" = GenJnlLine."Bal. Account Type"::Customer THEN BEGIN
//                                     GenJnlLine."Applies-to Doc. Type" := GenJnlLine."Applies-to Doc. Type"::Invoice;
//                                     GenJnlLine."Applies-to Doc. No." := "Imprest Issue Doc. No";
//                                     GenJnlLine.VALIDATE(GenJnlLine."Applies-to Doc. No.");
//                                     GenJnlLine."Applies-to ID" := "Apply to ID";
//                                 END;

//                                 IF GenJnlLine.Amount <> 0 THEN
//                                     GenJnlLine.INSERT;
//                                 /*
//                                 //Post Cash Surrender
//                                 IF ImprestDetails."Cash Surrender Amt">0 THEN BEGIN
//                                  IF ImprestDetails."Bank/Petty Cash"='' THEN
//                                    ERROR('Select a Bank Code where the Cash Surrender will be posted');
//                                 LineNo:=LineNo+1000;
//                                 GenJnlLine.INIT;
//                                 GenJnlLine."Journal Template Name":=GenledSetup."Surrender Template";
//                                 GenJnlLine."Journal Batch Name":=GenledSetup."Surrender  Batch";
//                                 GenJnlLine."Line No.":=LineNo;
//                                 GenJnlLine."Account Type":=GenJnlLine."Account Type"::Customer;
//                                 GenJnlLine."Account No.":=ImprestDetails."Imprest Holder";
//                                 GenJnlLine.VALIDATE(GenJnlLine."Account No.");
//                                 //Set these fields to blanks
//                                 GenJnlLine."Gen. Posting Type":=GenJnlLine."Gen. Posting Type"::" ";
//                                 GenJnlLine.VALIDATE("Gen. Posting Type");
//                                 GenJnlLine."Gen. Bus. Posting Group":='';
//                                 GenJnlLine.VALIDATE("Gen. Bus. Posting Group");
//                                 GenJnlLine."Gen. Prod. Posting Group":='';
//                                 GenJnlLine.VALIDATE("Gen. Prod. Posting Group");
//                                 GenJnlLine."VAT Bus. Posting Group":='';
//                                 GenJnlLine.VALIDATE("VAT Bus. Posting Group");
//                                 GenJnlLine."VAT Prod. Posting Group":='';
//                                 GenJnlLine.VALIDATE("VAT Prod. Posting Group");
//                                 GenJnlLine."Posting Date":="Surrender Posting Date";
//                                 GenJnlLine."Document No.":=No;
//                                 GenJnlLine.Amount:=-ImprestDetails."Cash Surrender Amt";
//                                 GenJnlLine.VALIDATE(GenJnlLine.Amount);
//                                 GenJnlLine."Currency Code":="Currency Code";
//                                 GenJnlLine.VALIDATE("Currency Code");
//                                 //Take care of Currency Factor
//                                   GenJnlLine."Currency Factor":="Currency Factor";
//                                   GenJnlLine.VALIDATE("Currency Factor");

//                                 GenJnlLine."Bal. Account Type":=GenJnlLine."Bal. Account Type"::"Bank Account";
//                                 GenJnlLine."Bal. Account No.":=ImprestDetails."Bank/Petty Cash";
//                                 GenJnlLine.Description:='Imprest Surrender by staff';
//                                 GenJnlLine.VALIDATE(GenJnlLine."Bal. Account No.");
//                                 GenJnlLine."Shortcut Dimension 1 Code":="Global Dimension 1 Code";
//                                 GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
//                                 GenJnlLine."Shortcut Dimension 2 Code":="Shortcut Dimension 2 Code";
//                                 GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");
//                                 GenJnlLine.ValidateShortcutDimCode(3,"Shortcut Dimension 3 Code");
//                                 GenJnlLine.ValidateShortcutDimCode(4,"Shortcut Dimension 4 Code");
//                                 GenJnlLine."Applies-to ID":=ImprestDetails."Imprest Holder";
//                                 IF GenJnlLine.Amount<>0 THEN
//                                 GenJnlLine.INSERT;

//                                 END;
//                                  */
//                                 //End Post Surrender Journal

//                             UNTIL ImprestDetails.NEXT = 0;
//                             //Post Entries
//                             GenJnlLine.RESET;
//                             GenJnlLine.SETRANGE(GenJnlLine."Journal Template Name", SurrTemplate);
//                             GenJnlLine.SETRANGE(GenJnlLine."Journal Batch Name", SurrBatch);
//                             //Adjust Gen Jnl Exchange Rate Rounding Balances
//                             AdjustGenJnl.RUN(GenJnlLine);
//                             //End Adjust Gen Jnl Exchange Rate Rounding Balances

//                             CODEUNIT.RUN(CODEUNIT::"Gen. Jnl.-Post", GenJnlLine);
//                         END;

//                         IF JournalPostSuccessful.PostedSuccessfully THEN BEGIN
//                             Posted := TRUE;
//                             Status := Status::Posted;
//                             "Date Posted" := TODAY;
//                             "Time Posted" := TIME;
//                             "Posted By" := USERID;
//                             MODIFY;
//                             //kate
//                             //Create Entries for the Overspent Figures
//                             CALCFIELDS("Difference Owed");
//                             IF "Difference Owed" > 0 THEN BEGIN
//                                 Payline.SETFILTER("Surrender Doc No.", No);
//                                 Payline.SETFILTER("Difference Owed", '>%1', 0);
//                                 //   CreateOverSpentBatch;
//                             END;
//                             //Create Entries for the Overspent Figures

//                             //Tag the Source Imprest Requisition as Surrendered
//                             ImprestReq.RESET;
//                             ImprestReq.SETRANGE(ImprestReq."No.", "Imprest Issue Doc. No");
//                             IF ImprestReq.FIND('-') THEN BEGIN
//                                 ImprestReq."Surrender Status" := ImprestReq."Surrender Status"::Full;
//                                 ImprestReq.MODIFY;
//                             END;

//                             //End Tag
//                             //Post Committment Reversals
//                             Doc_Type := Doc_Type::StaffSurrender;
//                             BudgetControl.ReverseEntries(Doc_Type, No);
//                         END;

//                     end;
//                 }
//                 separator()
//                 {
//                 }
//                 action("Check Budgetary Availability")
//                 {
//                     Caption = 'Check Budgetary Availability';
//                     Image = Balance;
//                     Promoted = true;
//                     PromotedCategory = Category5;
//                     PromotedIsBig = true;

//                     trigger OnAction()
//                     begin
//                         //Ensure actual spent does not exceed the amount on original document
//                         CALCFIELDS("Actual Spent", "Cash Receipt Amount");
//                         IF "Actual Spent" + "Cash Receipt Amount" > Amount THEN
//                             ERROR('The actual Amount spent should not exceed the amount issued ');

//                         //Post Committment Reversals of the Staff Advance if it had not been reversed
//                         Commitments.RESET;
//                         Commitments.SETRANGE(Commitments."Document Type", Commitments."Document Type"::StaffAdvance);
//                         Commitments.SETRANGE(Commitments."Document No.", "Imprest Issue Doc. No");
//                         Commitments.SETRANGE(Commitments.Committed, FALSE);
//                         IF NOT Commitments.FIND('-') THEN BEGIN
//                             Doc_Type := Doc_Type::StaffAdvance;
//                             BudgetControl.ReverseEntries(Doc_Type, "Imprest Issue Doc. No");
//                         END;

//                         //First Check whether other lines are already committed.
//                         Commitments.RESET;
//                         Commitments.SETRANGE(Commitments."Document Type", Commitments."Document Type"::StaffSurrender);
//                         Commitments.SETRANGE(Commitments."Document No.", No);
//                         IF Commitments.FIND('-') THEN BEGIN
//                             IF CONFIRM('Lines in this Document appear to be committed do you want to re-commit?', FALSE) = FALSE THEN BEGIN EXIT END;
//                             Commitments.RESET;
//                             Commitments.SETRANGE(Commitments."Document Type", Commitments."Document Type"::StaffSurrender);
//                             Commitments.SETRANGE(Commitments."Document No.", No);
//                             Commitments.DELETEALL;
//                         END;

//                         //Check the Budget here
//                         CheckBudgetAvail.CheckStaffAdvSurr(Rec);
//                     end;
//                 }
//                 action("Cancel Budgetary Allocation")
//                 {
//                     Caption = 'Cancel Budgetary Allocation';
//                     Image = CancelAllLines;
//                     Promoted = true;
//                     PromotedCategory = Category5;
//                     PromotedIsBig = true;

//                     trigger OnAction()
//                     begin
//                         IF CONFIRM('Do you Wish to Cancel the Commitment entries for this document', FALSE) = FALSE THEN BEGIN EXIT END;

//                         Commitments.RESET;
//                         Commitments.SETRANGE(Commitments."Document Type", Commitments."Document Type"::StaffSurrender);
//                         Commitments.SETRANGE(Commitments."Document No.", No);
//                         Commitments.DELETEALL;

//                         Payline.RESET;
//                         Payline.SETRANGE(Payline."Surrender Doc No.", No);
//                         IF Payline.FIND('-') THEN BEGIN
//                             REPEAT
//                                 Payline.Committed := FALSE;
//                                 Payline.MODIFY;
//                             UNTIL Payline.NEXT = 0;
//                         END;
//                     end;
//                 }
//                 separator()
//                 {
//                 }
//                 action("Send Approval Request")
//                 {
//                     Caption = 'Send Approval Request';
//                     Image = SendApprovalRequest;
//                     Promoted = true;
//                     PromotedCategory = Category4;
//                     PromotedIsBig = true;

//                     trigger OnAction()
//                     var
//                         ApprovalMgt: Codeunit "439";
//                         Txt0001: Label 'Actual Spent and the Cash Receipt Amount should be equal to the amount Issued';
//                     begin
//                         /*
//                         //Ensure actual spent does not exceed the amount on original document
//                         CALCFIELDS("Actual Spent","Cash Receipt Amount") ;
//                          IF "Actual Spent"+"Cash Receipt Amount" > Amount THEN
//                             ERROR('The actual Amount spent should not exceed the amount issued ');


//                       //First Check whether all amount entered tally
//                       ImprestDetails.RESET;
//                       ImprestDetails.SETRANGE(ImprestDetails."Surrender Doc No.",No);
//                       IF ImprestDetails.FIND('-') THEN BEGIN
//                       REPEAT
//                         IF (ImprestDetails."Cash Receipt Amount"+ImprestDetails."Actual Spent")<>ImprestDetails.Amount THEN
//                             ERROR(Txt0001);

//                       UNTIL ImprestDetails.NEXT = 0;
//                       END;
//                       */
//                         //Ensure No Items That should be committed that are not
//                         //IF LinesCommitmentStatus THEN
//                         // ERROR('There are some lines that have not been committed');

//                         //Release the ImprestSurrender for Approval
//                         State := State::Open;
//                         IF Status <> Status::Pending THEN State := State::"Pending Approval";
//                         DocType := DocType::"Staff Advance Accounting";
//                         CLEAR(tableNo);
//                         tableNo := 39005640;
//                         IF ApprovalMgt.SendApproval(tableNo, Rec.No, DocType, State, Rec."Responsibility Center", Rec.Amount) THEN;

//                     end;
//                 }
//                 action("Cancel Approval Request")
//                 {
//                     Caption = 'Cancel Approval Request';
//                     Image = Cancel;
//                     Promoted = true;
//                     PromotedCategory = Category4;
//                     PromotedIsBig = true;

//                     trigger OnAction()
//                     var
//                         ApprovalMgt: Codeunit "439";
//                     begin
//                         DocType := DocType::"Staff Advance Accounting";
//                         showmessage := TRUE;
//                         ManualCancel := TRUE;
//                         CLEAR(tableNo);
//                         tableNo := 39005640;
//                         IF ApprovalMgt.CancelApproval(tableNo, DocType, Rec.No, showmessage, ManualCancel) THEN;
//                     end;
//                 }
//                 separator()
//                 {
//                 }
//                 action("Cancel Document")
//                 {
//                     Caption = 'Cancel Document';
//                     Image = Cancel;
//                     Promoted = true;
//                     PromotedCategory = Category6;
//                     PromotedIsBig = true;

//                     trigger OnAction()
//                     begin
//                         //Post Committment Reversals
//                         TESTFIELD(Status, Status::Approved);
//                         IF CONFIRM(Text002, TRUE) THEN BEGIN
//                             Doc_Type := Doc_Type::Imprest;
//                             BudgetControl.ReverseEntries(Doc_Type, "Imprest Issue Doc. No");
//                             Status := Status::Cancelled;
//                             MODIFY;
//                         END;
//                     end;
//                 }
//                 separator()
//                 {
//                 }
//                 action("Open for OverExpenditure")
//                 {
//                     Caption = 'Open for OverExpenditure';
//                     Image = ReOpen;
//                     Promoted = true;
//                     PromotedCategory = Process;
//                     PromotedIsBig = true;

//                     trigger OnAction()
//                     begin
//                         //Opening should only be for Pending Documents
//                         TESTFIELD(Status, Status::Pending);
//                         //Open for Overexpenditure
//                         "Allow Overexpenditure" := TRUE;
//                         "Open for Overexpenditure by" := USERID;
//                         "Date opened for OvExpenditure" := TODAY;
//                         MODIFY;
//                         //Open lines
//                         Payline.RESET;
//                         Payline.SETRANGE(Payline."Surrender Doc No.", No);
//                         IF Payline.FIND('-') THEN BEGIN
//                             REPEAT
//                                 Payline."Allow Overexpenditure" := TRUE;
//                                 Payline."Open for Overexpenditure by" := USERID;
//                                 Payline."Date opened for OvExpenditure" := TODAY;
//                                 Payline.MODIFY;
//                             UNTIL Payline.NEXT = 0;
//                         END;
//                         //End open for Overexpenditure
//                     end;
//                 }
//             }
//             action(Print)
//             {
//                 Caption = 'Print';
//                 Image = Print;
//                 Promoted = true;
//                 PromotedCategory = "Report";
//                 PromotedIsBig = true;

//                 trigger OnAction()
//                 begin
//                     RESET;
//                     SETFILTER(No, No);
//                     REPORT.RUN(39005917, TRUE, TRUE, Rec);
//                     RESET;
//                 end;
//             }
//         }
//     }

//     var
//         Text000: Label 'You have not specified the Actual Amount Spent. This document will only reverse the committment and you will have to receipt the total amount returned.';
//         Text001: Label 'Document Not Posted';
//         Text002: Label 'Are you sure you want to Cancel this Document?';
//         Text19053222: Label 'Enter Advance Accounting Details below';
//         showmessage: Boolean;
//         ManualCancel: Boolean;
//         State: Option Open,"Pending Approval",Cancelled,Approved;
//         DocType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,TransportRequest,Maintenance,Fuel,ImporterExporter,"Import Permit","Export Permit",TR,"Safari Notice","Student Applications","Water Research","Consultancy Requests","Consultancy Proposals","Meals Bookings","General Journal","Student Admissions","Staff Claim",KitchenStoreRequisition,"Leave Application","Staff Advance","Staff Advance Accounting";
//         tableNo: Integer;
//         RecPayTypes: Record "61129";
//         TarriffCodes: Record "61716";
//         GenJnlLine: Record "81";
//         DefaultBatch: Record "232";
//         CashierLinks: Record "61712";
//         LineNo: Integer;
//         NextEntryNo: Integer;
//         CommitNo: Integer;
//         ImprestDetails: Record "61203";
//         EntryNo: Integer;
//         GLAccount: Record "15";
//         IsImprest: Boolean;
//         ImprestRequestDet: Record "61719";
//         GenledSetup: Record "61713";
//         ImprestAmt: Decimal;
//         DimName1: Text[60];
//         DimName2: Text[60];
//         CashPaymentLine: Record "61718";
//         PaymentLine: Record "61198";
//         CurrSurrDocNo: Code[20];
//         JournalPostSuccessful: Codeunit "50113";
//         Commitments: Record "61722";
//         BCSetup: Record "61721";
//         BudgetControl: Codeunit "50111";
//         Doc_Type: Option LPO,Requisition,Imprest,"Payment Voucher",PettyCash,PurchInvoice,StaffClaim,StaffAdvance,StaffSurrender;
//         ImprestReq: Record "61197";
//         UserMgt: Codeunit "50114";
//         DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender;
//         HasLines: Boolean;
//         AllKeyFieldsEntered: Boolean;
//         AccountName: Text[100];
//         AdjustGenJnl: Codeunit "407";
//         TravAccHeader: Record "61199";
//         CheckBudgetAvail: Codeunit "50111";
//         Payline: Record "61203";
//         Temp: Record "61712";
//         SurrBatch: Code[10];
//         SurrTemplate: Code[10];
//         [InDataSet]
//         "Surrender DateEditable": Boolean;
//         [InDataSet]
//         "Account No.Editable": Boolean;
//         [InDataSet]
//         "Imprest Issue Doc. NoEditable": Boolean;
//         [InDataSet]
//         "Responsibility CenterEditable": Boolean;
//         [InDataSet]
//         "Surrender Posting DateEditable": Boolean;
//         [InDataSet]
//         ImprestLinesEditable: Boolean;
//         FINBudgetEntries: Record "77078";
//         FINStaffAdvancSurrDetails: Record "61203";

//     [Scope('Internal')]
//     procedure GetDimensionName(var "Code": Code[20]; DimNo: Integer) Name: Text[60]
//     var
//         GLSetup: Record "98";
//         DimVal: Record "349";
//     begin
//         /*Get the global dimension 1 and 2 from the database*/
//         Name := '';

//         GLSetup.RESET;
//         GLSetup.GET();

//         DimVal.RESET;
//         DimVal.SETRANGE(DimVal.Code, Code);

//         IF DimNo = 1 THEN BEGIN
//             DimVal.SETRANGE(DimVal."Dimension Code", GLSetup."Global Dimension 1 Code");
//         END
//         ELSE
//             IF DimNo = 2 THEN BEGIN
//                 DimVal.SETRANGE(DimVal."Dimension Code", GLSetup."Global Dimension 2 Code");
//             END;
//         IF DimVal.FIND('-') THEN BEGIN
//             Name := DimVal.Name;
//         END;

//     end;

//     [Scope('Internal')]
//     procedure GetCustName(No: Code[20]) Name: Text[100]
//     var
//         Cust: Record "18";
//     begin
//         Name := '';
//         IF Cust.GET(No) THEN
//             Name := Cust.Name;
//         EXIT(Name);
//     end;

//     [Scope('Internal')]
//     procedure UpdateforNoActualSpent()
//     begin
//         Posted := TRUE;
//         Status := Status::Posted;
//         "Date Posted" := TODAY;
//         "Time Posted" := TIME;
//         "Posted By" := USERID;
//         MODIFY;
//         //Tag the Source Imprest Requisition as Surrendered
//         ImprestReq.RESET;
//         ImprestReq.SETRANGE(ImprestReq."No.", "Imprest Issue Doc. No");
//         IF ImprestReq.FIND('-') THEN BEGIN
//             ImprestReq."Surrender Status" := ImprestReq."Surrender Status"::Full;
//             ImprestReq.MODIFY;
//         END;
//         //End Tag
//         //Post Committment Reversals
//         Doc_Type := Doc_Type::StaffSurrender;
//         BudgetControl.ReverseEntries(Doc_Type, "Imprest Issue Doc. No");
//     end;

//     [Scope('Internal')]
//     procedure CompareAllAmounts()
//     begin
//     end;

//     [Scope('Internal')]
//     procedure LinesCommitmentStatus() Exists: Boolean
//     var
//         BCsetup: Record "61721";
//     begin
//         IF BCsetup.GET() THEN BEGIN
//             IF NOT BCsetup.Mandatory THEN BEGIN
//                 Exists := FALSE;
//                 EXIT;
//             END;
//         END ELSE BEGIN
//             Exists := FALSE;
//             EXIT;
//         END;
//         Exists := FALSE;
//         Payline.RESET;
//         Payline.SETRANGE(Payline."Surrender Doc No.", No);
//         Payline.SETRANGE(Payline.Committed, FALSE);
//         Payline.SETRANGE(Payline."Budgetary Control A/C", TRUE);
//         IF Payline.FIND('-') THEN
//             Exists := TRUE;
//     end;

//     local procedure ExpenseBudget()
//     var
//         GLAccount: Record "15";
//         DimensionValue: Record "349";
//         PostBudgetEnties: Codeunit "67108";
//     begin
//         BCSetup.GET;
//         IF NOT ((BCSetup.Mandatory) AND (BCSetup."Imprest Budget mandatory")) THEN EXIT;
//         BCSetup.TESTFIELD("Current Budget Code");
//         Rec.TESTFIELD("Shortcut Dimension 2 Code");
//         //Get Current Lines to loop through
//         FINStaffAdvancSurrDetails.RESET;
//         FINStaffAdvancSurrDetails.SETRANGE("Surrender Doc No.", Rec.No);
//         IF FINStaffAdvancSurrDetails.FIND('-') THEN BEGIN
//             REPEAT
//             BEGIN
//                 // Expense Budget Here
//                 FINStaffAdvancSurrDetails.TESTFIELD("Account No:");
//                 GLAccount.RESET;
//                 GLAccount.SETRANGE("No.", FINStaffAdvancSurrDetails."Account No:");
//                 IF GLAccount.FIND('-') THEN GLAccount.TESTFIELD(Name);
//                 DimensionValue.RESET;
//                 DimensionValue.SETRANGE(Code, Rec."Shortcut Dimension 2 Code");
//                 DimensionValue.SETRANGE("Global Dimension No.", 2);
//                 IF DimensionValue.FIND('-') THEN DimensionValue.TESTFIELD(Name);
//                 IF (FINStaffAdvancSurrDetails.Amount > 0) THEN BEGIN
//                     // Commit Budget Here
//                     PostBudgetEnties.ExpenseBudget(FINStaffAdvancSurrDetails."Account No:", Rec."Surrender Date", '', Rec."Shortcut Dimension 2 Code", Rec."Shortcut Dimension 3 Code",
//                     FINStaffAdvancSurrDetails.Amount, FINStaffAdvancSurrDetails."Account Name", USERID, TODAY, 'ADVANCE', Rec."Imprest Issue Doc. No" + FINStaffAdvancSurrDetails."Account No:", '');
//                 END;
//             END;
//             UNTIL FINStaffAdvancSurrDetails.NEXT = 0;
//         END;
//     end;
// }

