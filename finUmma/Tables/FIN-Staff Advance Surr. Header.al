table 52178722 "FIN-Staff Advance Surr. Header"
{
    DrillDownPageID = "FIN-Imprest View Window";
    LookupPageID = "FIN-Imprest View Window";

    fields
    {
        field(1; No; Code[20])
        {

            trigger OnValidate()
            begin

                IF No <> xRec.No THEN BEGIN
                    GenLedgerSetup.GET;
                    NoSeriesMgt.TestManual(GenLedgerSetup."Staff Advance Surrender No");
                    "No. Series" := '';
                END;
            end;
        }
        field(2; "Surrender Date"; Date)
        {
        }
        field(3; Type; Code[20])
        {
            TableRelation = "FIN-Receipts and Payment Types".Code WHERE(Type = FILTER(Payment));

            trigger OnValidate()
            begin

                "Account No." := '';
                "Account Name" := '';
                Remarks := '';
                RecPayTypes.RESET;
                RecPayTypes.SETRANGE(RecPayTypes.Code, Type);
                RecPayTypes.SETRANGE(RecPayTypes.Type, RecPayTypes.Type::Payment);

                IF RecPayTypes.FIND('-') THEN BEGIN
                    Grouping := RecPayTypes."Default Grouping";
                END;

                IF RecPayTypes.FIND('-') THEN BEGIN
                    "Account Type" := RecPayTypes."Account Type";
                    "Transaction Name" := RecPayTypes.Description;

                    IF RecPayTypes."Account Type" = RecPayTypes."Account Type"::"G/L Account" THEN BEGIN
                        RecPayTypes.TESTFIELD(RecPayTypes."G/L Account");
                        "Account No." := RecPayTypes."G/L Account";
                        VALIDATE("Account No.");
                    END;

                    //Banks
                    IF RecPayTypes."Account Type" = RecPayTypes."Account Type"::"Bank Account" THEN BEGIN
                        //RecPayTypes.TESTFIELD(RecPayTypes."G/L Account");
                        "Account No." := RecPayTypes."Bank Account";
                        VALIDATE("Account No.");
                    END;


                END;

                //VALIDATE("Account No.");
            end;
        }
        field(4; "Pay Mode"; Option)
        {
            OptionMembers = " ",Cash,Cheque,EFT,"Custom 1","Custom 2","Custom 3","Custom 4","Custom 5";
        }
        field(5; "Cheque No"; Code[20])
        {
        }
        field(6; "Cheque Date"; Date)
        {
        }
        field(7; "Cheque Type"; Code[20])
        {
            //TableRelation = "GEN-Test Table";
        }
        field(8; "Bank Code"; Code[20])
        {
            TableRelation = "FIN-Cash Payments Header";
        }
        field(9; "Received From"; Text[100])
        {
        }
        field(10; "On Behalf Of"; Text[100])
        {
        }
        field(11; Cashier; Code[20])
        {
        }
        field(12; "Account Type"; Enum "Gen. Journal Account Type")
        {
            Caption = 'Account Type';
            //OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,Fixed Asset,IC Partner';
            //OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner";
        }
        field(13; "Account No."; Code[20])
        {
            Caption = 'Account No.';
            TableRelation = Customer."No.";

            // trigger OnValidate()
            // begin
            //     /*
            //     "Account Name":='';
            //     RecPayTypes.RESET;
            //     RecPayTypes.SETRANGE(RecPayTypes.Code,Type);
            //     RecPayTypes.SETRANGE(RecPayTypes.Type,RecPayTypes.Type::Payment);

            //     IF "Account Type" IN ["Account Type"::"G/L Account","Account Type"::Customer,"Account Type"::Vendor,"Account Type"::"IC Partner"]
            //     THEN

            //     CASE "Account Type" OF
            //       "Account Type"::"G/L Account":
            //         BEGIN
            //           GLAcc.GET("Account No.");
            //           "Account Name":=GLAcc.Name;
            //           "VAT Code":=RecPayTypes."VAT Code";
            //           "Withholding Tax Code":=RecPayTypes."Withholding Tax Code";
            //           "Global Dimension 1 Code":='';
            //         END;
            //       "Account Type"::Customer:
            //         BEGIN
            //           Cust.GET("Account No.");
            //           "Account Name":=Cust.Name;
            //     //      "VAT Code":=Cust."Default Withholding Tax Code";
            //     //      "Withholding Tax Code":=Cust."Default Withholding Tax Code";
            //           "Global Dimension 1 Code":=Cust."Global Dimension 1 Code";
            //         END;
            //       "Account Type"::Vendor:
            //         BEGIN
            //           Vend.GET("Account No.");
            //           "Account Name":=Vend.Name;
            //     //      "VAT Code":=Vend."Default VAT Code";
            //     //      "Withholding Tax Code":=Vend."Default Withholding Tax Code";
            //           "Global Dimension 1 Code":=Vend."Global Dimension 1 Code";
            //         END;
            //       "Account Type"::"Bank Account":
            //         BEGIN
            //           BankAcc.GET("Account No.");
            //           "Account Name":=BankAcc.Name;
            //           "VAT Code":=RecPayTypes."VAT Code";
            //           "Withholding Tax Code":=RecPayTypes."Withholding Tax Code";
            //           "Global Dimension 1 Code":=BankAcc."Global Dimension 1 Code";

            //         END;
            //         {
            //       "Account Type"::"Fixed Asset":
            //         BEGIN
            //           FA.GET("Account No.");
            //           "Account Name":=FA.Description;
            //           "VAT Code":=FA."Default VAT Code";
            //           "Withholding Tax Code":=FA."Default Withholding Tax Code";
            //            "Global Dimension 1 Code":=FA."Global Dimension 1 Code";
            //         END;
            //         }
            //     END;
            //     */

            // end;
        }
        field(14; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(15; "Account Name"; Text[150])
        {
        }
        field(16; Posted; Boolean)
        {
        }
        field(17; "Date Posted"; Date)
        {
        }
        field(18; "Time Posted"; Time)
        {
        }
        field(19; "Posted By"; Code[20])
        {
        }
        field(20; Amount; Decimal)
        {
        }
        field(21; Remarks; Text[250])
        {
        }
        field(22; "Transaction Name"; Text[100])
        {
        }
        field(27; "Net Amount"; Decimal)
        {
        }
        field(28; "Paying Bank Account"; Code[20])
        {
        }
        field(29; Payee; Text[100])
        {
        }
        field(30; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));

            trigger OnValidate()
            begin

                DimVal.RESET;
                DimVal.SETRANGE(DimVal."Global Dimension No.", 1);
                DimVal.SETRANGE(DimVal.Code, "Global Dimension 1 Code");
                IF DimVal.FIND('-') THEN
                    "Function Name" := DimVal.Name
            end;
        }
        field(31; "Global Dimension 2 Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));

            trigger OnValidate()
            begin

                DimVal.RESET;
                DimVal.SETRANGE(DimVal."Global Dimension No.", 2);
                DimVal.SETRANGE(DimVal.Code, "Global Dimension 2 Code");
                IF DimVal.FIND('-') THEN
                    "Budget Center Name" := DimVal.Name
            end;
        }
        field(33; "Bank Account No"; Code[20])
        {
        }
        field(34; "Cashier Bank Account"; Code[20])
        {
        }
        field(35; Status; Option)
        {
            OptionMembers = Pending,"1st Approval","2nd Approval","Cheque Printing",Posted,Cancelled,Checking,VoteBook,"Pending Approval",Approved;
        }
        field(37; Grouping; Code[20])
        {
            TableRelation = "Customer Posting Group".Code;
        }
        field(38; "Payment Type"; Option)
        {
            OptionMembers = Normal,"Petty Cash";
        }
        field(39; "Bank Type"; Option)
        {
            OptionMembers = Normal,"Petty Cash";
        }
        field(40; "PV Type"; Option)
        {
            OptionMembers = Normal,Other;
        }
        field(42; "Apply to ID"; Code[20])
        {
        }
        field(44; "Imprest Issue Date"; Date)
        {
        }
        field(45; Surrendered; Boolean)
        {
        }
        field(46; "Imprest Issue Doc. No"; Code[20])
        {
            Caption = 'Advance Issue Doc. No';
            TableRelation = "FIN-Staff Advance Header"."No." WHERE(Posted = filter(true),
                                                                  "Account No." = FIELD("Account No."),
                                                                  "Surrender Status" = CONST(" "));

            trigger OnValidate()
            begin


                /*Copy the details from the payments header tableto the imprest surrender table to enable the user work on the same document*/
                /*Retrieve the header details using the get statement*/

                PayHeader.RESET;
                PayHeader.GET(Rec."Imprest Issue Doc. No");

                /*Copy the details to the user interface*/
                "Paying Bank Account" := PayHeader."Paying Bank Account";
                Payee := PayHeader.Payee;
                PayHeader.CALCFIELDS(PayHeader."Total Net Amount");
                Amount := PayHeader."Total Net Amount";
                "Amount Surrendered LCY" := PayHeader."Total Net Amount LCY";
                //Currencies
                "Currency Factor" := PayHeader."Currency Factor";
                "Currency Code" := PayHeader."Currency Code";

                "Date Posted" := PayHeader."Date Posted";
                "Global Dimension 1 Code" := PayHeader."Global Dimension 1 Code";
                VALIDATE("Global Dimension 1 Code");
                "Shortcut Dimension 2 Code" := PayHeader."Shortcut Dimension 2 Code";
                VALIDATE("Shortcut Dimension 2 Code");
                "Shortcut Dimension 3 Code" := PayHeader."Shortcut Dimension 3 Code";
                Dim3 := PayHeader.Dim3;
                "Shortcut Dimension 4 Code" := PayHeader."Shortcut Dimension 4 Code";
                Dim4 := PayHeader.Dim4;
                "Imprest Issue Date" := PayHeader.Date;

                //Get Line No
                IF ImpSurrLine.FINDLAST THEN
                    LineNo := ImpSurrLine."Line No." + 1
                ELSE
                    LineNo := LineNo + 1;

                /*Copy the detail lines from the imprest details table in the database*/
                PayLine.RESET;
                PayLine.SETRANGE(PayLine.No, "Imprest Issue Doc. No");
                IF PayLine.FIND('-') THEN /*Copy the lines to the line table in the database*/
                  BEGIN
                    REPEAT
                        ImpSurrLine.INIT;
                        ImpSurrLine."Surrender Doc No." := Rec.No;
                        ImpSurrLine."Account No:" := PayLine."Account No:";
                        ImpSurrLine."Imprest Type" := PayLine."Advance Type";
                        ImpSurrLine.VALIDATE(ImpSurrLine."Account No:");
                        ImpSurrLine."Account Name" := PayLine."Account Name";
                        ImpSurrLine.Amount := PayLine.Amount;
                        ImpSurrLine."Due Date" := PayLine."Due Date";
                        ImpSurrLine."Advance Holder" := PayLine."Advance Holder";
                        ImpSurrLine."Actual Spent" := PayLine."Actual Spent";
                        ImpSurrLine."Apply to" := PayLine."Apply to";
                        ImpSurrLine."Apply to ID" := PayLine."Apply to ID";
                        ImpSurrLine."Surrender Date" := PayLine."Surrender Date";
                        ImpSurrLine.Surrendered := PayLine.Surrendered;
                        ImpSurrLine."Cash Receipt No" := PayLine."M.R. No";
                        ImpSurrLine."Date Issued" := PayLine."Date Issued";
                        ImpSurrLine."Type of Surrender" := PayLine."Type of Surrender";
                        ImpSurrLine."Dept. Vch. No." := PayLine."Dept. Vch. No.";
                        ImpSurrLine."Currency Factor" := PayLine."Currency Factor";
                        ImpSurrLine."Currency Code" := PayLine."Currency Code";
                        ImpSurrLine."Imprest Req Amt LCY" := PayLine."Amount LCY";
                        ImpSurrLine."Budgetary Control A/C" := PayLine."Budgetary Control A/C";
                        ImpSurrLine."Shortcut Dimension 1 Code" := PayLine."Global Dimension 1 Code";
                        ImpSurrLine."Shortcut Dimension 2 Code" := PayLine."Shortcut Dimension 2 Code";
                        ImpSurrLine."Shortcut Dimension 3 Code" := PayLine."Shortcut Dimension 3 Code";
                        ImpSurrLine."Shortcut Dimension 4 Code" := PayLine."Shortcut Dimension 4 Code";
                        ImpSurrLine."Line on Original Document" := TRUE;
                        LineNo += 1;
                        ImpSurrLine."Line No." := LineNo;
                        ImpSurrLine.INSERT;
                    UNTIL PayLine.NEXT = 0;
                END;

            end;
        }
        field(47; "Vote Book"; Code[10])
        {
            TableRelation = "G/L Account";
        }
        field(48; "Total Allocation"; Decimal)
        {
        }
        field(49; "Total Expenditure"; Decimal)
        {
        }
        field(50; "Total Commitments"; Decimal)
        {
        }
        field(51; Balance; Decimal)
        {
        }
        field(52; "Balance Less this Entry"; Decimal)
        {
        }
        field(54; "Petty Cash"; Boolean)
        {
        }
        field(56; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));

            trigger OnValidate()
            begin
                DimVal.RESET;
                DimVal.SETRANGE(DimVal."Global Dimension No.", 2);
                DimVal.SETRANGE(DimVal.Code, "Shortcut Dimension 2 Code");
                IF DimVal.FIND('-') THEN
                    "Budget Center Name" := DimVal.Name
            end;
        }
        field(59; "Function Name"; Text[50])
        {
        }
        field(60; "Budget Center Name"; Text[50])
        {
        }
        field(61; "User ID"; Code[20])
        {
            TableRelation = User."User Security ID";
        }
        field(62; "Issue Voucher Type"; Option)
        {
            OptionMembers = " ","Cash Voucher","Payment Voucher";
        }
        field(81; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 3 Code';
            Description = 'Stores the reference of the Third global dimension in the database';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));

            trigger OnValidate()
            begin
                DimVal.RESET;
                DimVal.SETRANGE(DimVal."Global Dimension No.", 3);
                DimVal.SETRANGE(DimVal.Code, "Shortcut Dimension 3 Code");
                IF DimVal.FIND('-') THEN
                    Dim3 := DimVal.Name
            end;
        }
        field(82; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Shortcut Dimension 4 Code';
            Description = 'Stores the reference of the Third global dimension in the database';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(4));

            trigger OnValidate()
            begin
                DimVal.RESET;
                DimVal.SETRANGE(DimVal."Global Dimension No.", 4);
                DimVal.SETRANGE(DimVal.Code, "Shortcut Dimension 4 Code");
                IF DimVal.FIND('-') THEN
                    Dim4 := DimVal.Name
            end;
        }
        field(83; Dim3; Text[250])
        {
        }
        field(84; Dim4; Text[250])
        {
        }
        field(85; "Currency Factor"; Decimal)
        {
            Caption = 'Currency Factor';
            DecimalPlaces = 0 : 15;
            Editable = false;
            MinValue = 0;
        }
        field(86; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            Editable = true;
            TableRelation = Currency;
        }
        field(87; "Responsibility Center"; Code[10])
        {
            Caption = 'Responsibility Center';
            TableRelation = "Responsibility Center";

            trigger OnValidate()
            begin

                TESTFIELD(Status, Status::Pending);
                IF NOT UserMgt.CheckRespCenter(1, "Shortcut Dimension 3 Code") THEN
                    ERROR(
                      Text001,
                      RespCenter.TABLECAPTION, UserMgt.GetPurchasesFilter);
            end;
        }
        field(88; "Amount Surrendered LCY"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("FIN-Imprest Surrender Details"."Imprest Req Amt LCY" WHERE("Surrender Doc No." = FIELD(No)));

        }
        field(89; "Actual Spent"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("FIN-Staff Advanc Surr. Details"."Actual Spent" WHERE("Surrender Doc No." = FIELD(No)));

        }
        field(90; "No. Printed"; Integer)
        {
        }
        field(91; "Surrender Posting Date"; Date)
        {

            trigger OnValidate()
            begin
                //Changed to ensure Posting date is not less than the Surrender Date entered
                IF "Surrender Posting Date" < "Surrender Date" THEN
                    ERROR('The Surrender Posting Date cannot be lesser than the Surrender Date');
            end;
        }
        field(92; "Total Amount Advanced"; Decimal)
        {
        }
        field(95; "Allow Overexpenditure"; Boolean)
        {
            Editable = false;
        }
        field(96; "Open for Overexpenditure by"; Code[20])
        {
            Editable = false;
        }
        field(97; "Date opened for OvExpenditure"; Date)
        {
            Editable = false;
        }
        field(98; "Cash Receipt Amount"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("FIN-Staff Advanc Surr. Details"."Cash Receipt Amount" WHERE("Surrender Doc No." = FIELD(No)));

        }
        field(99; "Actual Amount (LCY)"; Decimal)
        {
            CalcFormula = Sum("FIN-Staff Advanc Surr. Details"."Amount LCY" WHERE("Surrender Doc No." = FIELD(No)));
            FieldClass = FlowField;
        }
        field(100; "Commitment Status"; Boolean)
        {
        }
        field(50000; "Difference Owed"; Decimal)
        {
            CalcFormula = Sum("FIN-Staff Advanc Surr. Details"."Difference Owed" WHERE("Surrender Doc No." = FIELD(No)));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; No)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        IF Status = Status::Posted THEN
            ERROR('Cannot Delete Document is already Posted');
    end;

    trigger OnInsert()
    begin
        IF No = '' THEN BEGIN
            GenLedgerSetup.GET;

            GenLedgerSetup.TESTFIELD(GenLedgerSetup."Staff Advance Surrender No");
            NoSeriesMgt.InitSeries(GenLedgerSetup."Staff Advance Surrender No", xRec."No. Series", 0D, No, "No. Series");
        END;

        "Account Type" := "Account Type"::Customer;
        "Surrender Date" := TODAY;
        Cashier := USERID;
        VALIDATE(Cashier);

        IF UserSetup.GET(USERID) THEN BEGIN
            UserSetup.TESTFIELD(UserSetup."Imprest Account");
            "Account No." := UserSetup."Imprest Account";
            VALIDATE("Account No.");
        END ELSE
            ERROR('User must be setup under User Setup and their respective Account Entered');
    end;

    trigger OnModify()
    begin
        IF Status = Status::Posted THEN
            ERROR('Cannot Modify Document is already Posted');
    end;

    var
        ImpSurrLine: Record "FIN-Staff Advanc Surr. Details";
        PayHeader: Record "FIN-Staff Advance Header";
        PayLine: Record "FIN-Staff Advance Lines";
        "Withholding Tax Code": Code[200];
        GLAcc: Record "G/L Account";
        Cust: Record "Customer";
        Vend: Record "Vendor";
        FA: Record "Fixed Asset";
        BankAcc: Record "Bank Account";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        GenLedgerSetup: Record "Cash Office Setup";
        RecPayTypes: Record "FIN-Receipts and Payment Types";
        CashierLinks: Record "FIN-Cash Office User Template";
        GLAccount: Record "G/L Account";
        EntryNo: Integer;
        SingleMonth: Boolean;
        DateFrom: Date;
        DateTo: Date;
        Budget: Decimal;
        CurrMonth: Code[10];
        CurrYR: Code[10];
        BudgDate: Text[30];
        BudgetDate: Date;
        YrBudget: Decimal;
        BudgetDateTo: Date;
        BudgetAvailable: Decimal;
        GenLedSetup: Record "FIN-Cash Office Setup";
        "Total Budget": Decimal;
        CommittedAmount: Decimal;
        MonthBudget: Decimal;
        Expenses: Decimal;
        Header: Text[250];
        "Date From": Text[30];
        "Date To": Text[30];
        LastDay: Date;
        LoadImprestDetails: Record "FIN-Cash Payment Line q";
        TotAmt: Decimal;
        DimVal: Record "Dimension Value";
        "VAT Code": Code[20];
        RespCenter: Record "Responsibility Center";
        UserMgt: Codeunit "User Setup Management";
        Text001: Label 'Your identification is set up to process from %1 %2 only.';
        LineNo: Integer;
        UserSetup: Record "User Setup";
}