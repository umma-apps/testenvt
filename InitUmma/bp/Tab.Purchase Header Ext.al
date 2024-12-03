// tableextension 52178861 "Purchase Header" extends "Purchase Header"
// {
//     fields
//     {
//         field(50000; Copied; Boolean)
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(50001; "Debit Note"; Boolean)
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(50002; "Procurement Request No."; Code[20])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(50003; "Invoice Amount"; Decimal)
//         {
//             FieldClass = FlowField;
//             Editable = false;
//             CalcFormula = Sum("Purchase Line"."Line Amount"
//             WHERE("Document Type" = FIELD("Document Type"), "Document No." = FIELD("No.")));


//         }
//         field(50005; "Request No"; Code[10])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(50006; Commited; Boolean)
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(50007; Department; Code[20])
//         {
//             DataClassification = ToBeClassified;
//             //TableRelation = "Dimension Value".Code WHERE("Dimension Code" = Filter("Department"));
//         }
//         field(50008; "Delivery No"; Code[15])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(50009; "Ledger Card No"; Code[15])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(50010; "PRN No"; Code[15])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(50011; "Approval Status"; Option)
//         {
//             DataClassification = ToBeClassified;
//             OptionCaption = 'New,Purchasing,Finance,Admin,Completed';
//             OptionMembers = New,Purchasing,Finance,Admin,Completed;
//         }
//         field(50012; "PO Status"; Option)
//         {
//             DataClassification = ToBeClassified;
//             OptionCaption = ' ,Approved,Rejected';
//             OptionMembers = " ",Approved,Rejected;
//         }
//         field(50013; "Finance Status"; Option)
//         {
//             DataClassification = ToBeClassified;
//             OptionCaption = ' ,Approved,Rejected';
//             OptionMembers = " ",Approved,Rejected;
//         }
//         field(50014; "Admin Status"; Option)
//         {
//             DataClassification = ToBeClassified;
//             OptionCaption = ' ,Approved,Rejected';
//             OptionMembers = " ",Approved,Rejected;
//         }
//         field(50015; "P.O Name"; Code[15])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(50016; "P.O Approval Date"; Date)
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(50017; "Finance Approved By"; Code[15])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(50018; "Finance Approval Date"; Date)
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(50019; "Admin Approved By"; Code[15])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(50020; "Admin Approved Date"; Date)
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(50021; "Contract No."; Code[15])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(50022; "Quotation No."; Code[50])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(50033; "Request for Quote No."; Code[15])
//         {
//             DataClassification = ToBeClassified;
//             //TableRelation = "PROC-Quotation Request Vendors"."Document No." WHERE("Vendor No." = FIELD("Buy-from Vendor No."));

//             trigger OnValidate()
//             var
//             // RFQ: Record "61052";
//             // RFQ_Line: Record "61052";
//             // countedRec: Integer;
//             begin
//                 /*   //CHECK WHETHER HAS LINES AND DELETE
//                  IF NOT CONFIRM('If you change the Request for Quote No. the current lines will be deleted. Do you want to continue?',FALSE)
//                  THEN
//                      ERROR('You have selected to abort the process') ;

//                      PurchLine.RESET;
//                      PurchLine.SETRANGE(PurchLine."Document No.","No.");
//                      PurchLine.DELETEALL;

//                  RFQ_Line.RESET;
//                  RFQ_Line.SETRANGE(RFQ_Line."Document No.","Request for Quote No.");
//                  IF RFQ_Line.FIND('-') THEN BEGIN
//                    REPEAT
//                      PurchLine.RESET;
//                      PurchLine.SETRANGE("Document No.","No.");
//                      IF PurchLine.FIND('-') THEN BEGIN
//                        countedRec:=PurchLine.COUNT+1;
//                        END ELSE countedRec:=1;
//                        PurchLine.INIT;
//                        PurchLine."Document Type":=PurchLine."Document Type"::Quote;
//                        PurchLine."Document No.":="No.";
//                        PurchLine."Line No.":=countedRec;
//                        PurchLine.Type:=RFQ_Line.Type;
//                      //  PurchLine."Document Type 2":="Document Type 2";
//                        PurchLine."No.":=RFQ_Line."No.";
//                        PurchLine.VALIDATE("No.");
//                        PurchLine."Location Code":=RFQ_Line."Location Code";
//                        PurchLine.VALIDATE("Location Code");
//                        PurchLine.Quantity:=RFQ_Line.Quantity;
//                         PurchLine."Description 2":=RFQ_Line."Description 2";
//                        PurchLine.VALIDATE(Quantity);
//                        PurchLine."Direct Unit Cost":=RFQ_Line."Direct Unit Cost";
//                        PurchLine.VALIDATE("Direct Unit Cost");
//                        PurchLine.Amount:=RFQ_Line.Amount;
//                        PurchLine.INSERT;
//                    UNTIL RFQ_Line.NEXT=0;
//                  END;
//                  */

//             end;
//         }
//         field(50034; "Document Type 2"; Option)
//         {
//             DataClassification = ToBeClassified;
//             OptionMembers = Requisition,Quote,"Order";
//             trigger OnValidate()
//             var
//                 Commit: record "FIN-Committment";

//             begin
//                 CalcFields("Document Type");
//                 REC.TestField("Document Type");
//                 commit."Document Type" := rec."Document Type 2";
//             end;
//         }
//         field(50040; "Tendor Number"; Code[15])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(50041; Allocation; Decimal)
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(50042; Expenditure; Decimal)
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(50043; "Purchase Type"; Option)
//         {
//             DataClassification = ToBeClassified;
//             OptionCaption = ' ,Departmental,Global';
//             OptionMembers = " ",Departmental,Global;
//         }
//         field(50045; "Budgeted Amount"; Decimal)
//         {
//             DataClassification = ToBeClassified;
//             Editable = false;
//         }
//         field(50046; "Actual Expenditure"; Decimal)
//         {
//             DataClassification = ToBeClassified;
//             Editable = false;
//         }
//         field(50047; "Committed Amount"; Decimal)
//         {
//             DataClassification = ToBeClassified;
//             Editable = false;
//         }
//         field(50048; "Budget Balance"; Decimal)
//         {
//             DataClassification = ToBeClassified;
//             Editable = false;
//         }
//         field(50049; "Reference No"; Code[30])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(50050; "Refrence Type"; Option)
//         {
//             DataClassification = ToBeClassified;
//             OptionCaption = 'Employee,Student';
//             OptionMembers = Employee,Student;
//         }
//         field(50061; "Quote Comments"; Text[30])
//         {
//             DataClassification = ToBeClassified;
//             Description = 'Store Comments of Purchase Quote in the DB (Added)';
//         }
//         field(50062; "Responsibility Center Name"; Text[30])
//         {
//             DataClassification = ToBeClassified;
//             Description = 'Stores Responsibilty Center Name in the database (Added)';
//         }
//         field(50063; "Donor Name"; Text[50])
//         {
//             DataClassification = ToBeClassified;
//             Description = 'Stores Donor Name in the database (Added)';
//         }
//         field(50064; "Pillar Name"; Text[50])
//         {
//             DataClassification = ToBeClassified;
//             Description = 'Stores Pillar Name in the database (Added)';
//         }
//         field(50065; "Quote Comments 2"; Text[30])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(50066; "Quote Comments 3"; Text[30])
//         {
//             DataClassification = ToBeClassified;
//             Enabled = false;
//         }
//         field(50067; "Recommendation 1"; Text[30])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(50068; "Recommendation 2"; Text[30])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(50069; "Project Code"; Code[10])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(50070; "Archive Unused Doc"; Boolean)
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(50071; "VAT Method"; Option)
//         {
//             DataClassification = ToBeClassified;
//             OptionCaption = 'Expensed,Recovered';
//             OptionMembers = Expensed,Recovered;
//         }
//         field(50072; Cancelled; Boolean)
//         {
//             DataClassification = ToBeClassified;
//             Editable = false;
//         }
//         field(50073; "Cancelled By"; Code[20])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(50074; "Cancelled Date"; Date)
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(50075; DocApprovalType; Option)
//         {
//             DataClassification = ToBeClassified;
//             OptionMembers = Purchase,Requisition,Quote,Capex;
//         }
//         field(50076; "Procurement Type Code"; Code[20])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(50077; "Invoice Basis"; Option)
//         {
//             DataClassification = ToBeClassified;
//             OptionMembers = "PO Based","Direct Invoice";
//         }
//         field(50078; "RFQ No."; Code[20])
//         {
//             DataClassification = ToBeClassified;

//             trigger OnLookup()
//             begin
//                 TESTFIELD("Responsibility Center");
//                 TESTFIELD("Shortcut Dimension 1 Code");
//                 TESTFIELD("Shortcut Dimension 2 Code");
//                 /*
//                 RFQHdr.RESET;
//                 RFQHdr.SETRANGE(RFQHdr.lost,RFQHdr.lost::"1");
//                 IF PAGE.RUNMODAL(39006069,RFQHdr) = ACTION::LookupOK THEN
//                   InsertRFQ(RFQHdr);*/

//             end;
//         }
//         field(50079; "Expiry Date"; Date)
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(50080; "Special Remark"; Text[20])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(50081; "Responsible Officer"; Code[20])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(50082; Type; Option)
//         {
//             DataClassification = ToBeClassified;
//             OptionCaption = ' ,LPO,LSO';
//             OptionMembers = " ",LPO,LSO;
//         }
//         field(50083; "Imprest Purchase Doc No"; Code[20])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(50084; "Manual LPO No."; Code[20])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(50085; "Requisition No."; Code[20])
//         {
//             FieldClass = FlowField;
//             CalcFormula = Lookup("Purchase Line".lost WHERE("Document No." = FIELD("No.")));

//         }
//         field(50086; "LPO No."; Code[20])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(50087; Contract; Boolean)
//         {
//             DataClassification = ToBeClassified;

//             trigger OnValidate()
//             begin
//                 /*  CALCFIELDS("Invoice Amount");
//                   IF "Invoice Amount"<1000000 THEN ERROR('Please note that contract LPO is only applicable for LPOs with a value of 1million and above');
//                   Status:=Status::Released;*/

//             end;
//         }
//         field(50088; "Cum. Discount"; Decimal)
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(50089; "Is Milk"; Boolean)
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(20922932; Lost; Code[10])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(52178700; "Shortcut Dimension  3"; code[50])
//         {
//             TableRelation = "Dimension Value".code where("Global Dimension No." = const(3));
//         }
//         field(52178701; "Shortcut dimension 4"; code[50])
//         {
//             TableRelation = "Dimension Value".code where("Global Dimension No." = const(4));
//         }




//         // modify("Request for Quote No.")
//         // {

// //             TableRelation = "PROC-Quotation Request Vendors"."Document No." WHERE("Document Type" = field("Document Type 2"));

// //             trigger OnBeforeValidate()
// //             var
// //                 RFQ: Record "PROC-Purchase Quote Line";
// //                 RFQ_Line: Record "PROC-Purchase Quote Line";
// //                 countedRec: Integer;
// //                 PurchLine: Record "Purchase Line";
// //             begin
// //                 //CHECK WHETHER HAS LINES AND DELETE
// //                 IF NOT CONFIRM('If you change the Request for Quote No. the current lines will be deleted. Do you want to continue?', FALSE)
// //                 THEN
// //                     ERROR('You have selected to abort the process');

// //                 PurchLine.RESET;
// //                 PurchLine.SETRANGE(PurchLine."Document No.", "No.");
// //                 PurchLine.DELETEALL;

// //                 RFQ_Line.RESET;
// //                 RFQ_Line.SETRANGE(RFQ_Line."Document No.", "Request for Quote No.");
// //                 IF RFQ_Line.FIND('-') THEN BEGIN
// //                     REPEAT
// //                         PurchLine.RESET;
// //                         PurchLine.SETRANGE("Document No.", "No.");
// //                         IF PurchLine.FIND('-') THEN BEGIN
// //                             countedRec := PurchLine.COUNT + 1;
// //                         END ELSE
// //                             countedRec := 1;
// //                         PurchLine.INIT;
// //                         PurchLine."Document Type" := PurchLine."Document Type"::Quote;
// //                         PurchLine."Document No." := "No.";
// //                         PurchLine."Line No." := countedRec;
// // #pragma warning disable AL0603
// //                         PurchLine.Type := RFQ_Line.Type;
// // #pragma warning restore AL0603
// //                         //  PurchLine."Document Type 2":="Document Type 2";
// //                         PurchLine."No." := RFQ_Line."No.";
// //                         PurchLine."RFQ No." := RFQ_Line."Document No.";
// //                         PurchLine.VALIDATE("No.");
// //                         PurchLine."Location Code" := RFQ_Line."Location Code";
// //                         PurchLine.VALIDATE("Location Code");
// //                         PurchLine.Quantity := RFQ_Line.Quantity;
// //                         PurchLine."Description 2" := RFQ_Line."Description 2";
// //                         PurchLine.VALIDATE(Quantity);
// //                         PurchLine."Direct Unit Cost" := RFQ_Line."Direct Unit Cost";
// //                         PurchLine.VALIDATE("Direct Unit Cost");
// //                         PurchLine.Amount := RFQ_Line.Amount;
// //                         PurchLine.INSERT;
// //                     UNTIL RFQ_Line.NEXT = 0;
// //                 END;


// //             end;
//        // }


//     }
//     var
//         PurchSetup: Record "Purchases & Payables Setup";
//         Vend: Record Vendor;
//         NoSeriesMgt: Codeunit NoSeriesManagement;

//     trigger OnInsert()
//     begin

//         if "No." = '' then
//             if (DocApprovalType = DocApprovalType::Requisition) and ("Document Type 2" = "Document Type 2"::Requisition) then begin
//                 PurchSetup.get();
//                 PurchSetup.TestField("Internal Requisition No.");
//                 NoSeriesMgt.InitSeries(PurchSetup."Internal Requisition No.", xRec."No. Series", 0D, "No.", "No. Series");
//             END;


//         PurchSetup.Reset();
//         if PurchSetup.find('-') then;
//         PurchSetup.TestField("Requisition Default Vendor");
//         if vend.get(PurchSetup."Requisition Default Vendor") then;
//         IF DocApprovalType = DocApprovalType::Requisition THEN BEGIN
//             "Buy-from Vendor No." := PurchSetup."Requisition Default Vendor";
//             VALIDATE("Buy-from Vendor No.");
//             Rec.Validate("Buy-from Vendor Name", vend.Name);
//             // "Quote No." := "No."
//         END
//     end;


// }