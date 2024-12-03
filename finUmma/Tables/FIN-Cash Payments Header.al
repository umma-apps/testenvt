table 52178719 "FIN-Cash Payments Header"
{
    //LookupPageID = 68569;

    fields
    {
        field(1; "No."; Code[20])
        {
            Description = 'Stores the reference of the payment voucher in the database';
            NotBlank = false;
        }
        field(2; Date; Date)
        {
            Description = 'Stores the date when the payment voucher was inserted into the system';
        }
        field(3; "Currency Factor"; Decimal)
        {
            Caption = 'Currency Factor';
            DecimalPlaces = 0 : 15;
            Editable = false;
            MinValue = 0;
        }
        field(4; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            Editable = false;
            Enabled = true;
            TableRelation = Currency;
        }
        field(9; Payee; Text[100])
        {
            Description = 'Stores the name of the person who received the money';
        }
        field(10; "On Behalf Of"; Text[100])
        {
            Description = 'Stores the name of the person on whose behalf the payment voucher was taken';
        }
        field(11; Cashier; Code[20])
        {
            Description = 'Stores the identifier of the cashier in the database';

            trigger OnValidate()
            begin
                /*
                 UserDept.RESET;
                UserDept.SETRANGE(UserDept.UserID,Cashier);
                IF UserDept.FIND('-') THEN
                  //"Global Dimension 1 Code":=UserDept.Department;
              */

            end;
        }
        field(16; Posted; Boolean)
        {
            Description = 'Stores whether the payment voucher is posted or not';
        }
        field(17; "Date Posted"; Date)
        {
            Description = 'Stores the date when the payment voucher was posted';
        }
        field(18; "Time Posted"; Time)
        {
            Description = 'Stores the time when the payment voucher was posted';
        }
        field(19; "Posted By"; Code[20])
        {
            Description = 'Stores the name of the person who posted the payment voucher';
        }
        field(20; "Total Amount"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("FIN-Cash Payment Line q".Amount WHERE(No = FIELD("No."),
                                                                      "Account Type" = FILTER(<> Employee)));
            Description = 'Stores the amount of the payment voucher';
            Editable = false;

        }
        field(28; "Paying Bank Account"; Code[20])
        {
            Description = 'Stores the name of the paying bank account in the database';
            TableRelation = "Bank Account"."No.";

            trigger OnValidate()
            begin
                BankAcc.RESET;
                "Bank Name" := '';
                IF BankAcc.GET("Paying Bank Account") THEN BEGIN
                    "Bank Name" := BankAcc.Name;
                    "Currency Code" := BankAcc."Currency Code";
                    VALIDATE("Currency Code");
                END;
            end;
        }
        field(30; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            Description = 'Stores the reference to the first global dimension in the database';
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
        field(35; Status; Option)
        {
            Description = 'Stores the status of the record in the database';
            OptionMembers = Pending,"1st Approval","2nd Approval","Cheque Printing",Posted,Cancelled,Checking,VoteBook;
        }
        field(38; "Payment Type"; Option)
        {
            OptionMembers = Normal,"Petty Cash";
        }
        field(56; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            Description = 'Stores the reference of the second global dimension in the database';
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
        field(57; "Function Name"; Text[100])
        {
            Description = 'Stores the name of the function in the database';
        }
        field(58; "Budget Center Name"; Text[100])
        {
            Description = 'Stores the name of the budget center in the database';
        }
        field(59; "Bank Name"; Text[100])
        {
            Description = 'Stores the description of the paying bank account in the database';
        }
        field(60; "No. Series"; Code[20])
        {
            Description = 'Stores the number series in the database';
        }
        field(61; Select; Boolean)
        {
            Description = 'Enables the user to select a particular record';
        }
        field(62; "Total VAT Amount"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("FIN-Cash Payment Line q"."VAT Amount" WHERE(No = FIELD("No."),
                                                                            "Account Type" = FILTER(<> Employee)));
            Editable = false;

        }
        field(63; "Total Witholding Tax Amount"; Decimal)
        {
            CalcFormula = Sum("FIN-Cash Payment Line q"."Withholding Tax Amount" WHERE(No = FIELD("No."),
                                                                                        "Account Type" = FILTER(<> Employee)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(64; "Total Net Amount"; Decimal)
        {
            CalcFormula = Sum("FIN-Cash Payment Line q"."Net Amount" WHERE(No = FIELD("No."),
                                                                            "Account Type" = FILTER(<> Employee)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(65; "Total Pending Voucher Amount"; Decimal)
        {
            CalcFormula = Sum("FIN-Cash Payment Line q"."Net Amount" WHERE(No = FIELD("No."),
                                                                            "Account Type" = CONST(Employee)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(66; "No. Printed"; Integer)
        {
        }
        field(67; "Current Source A/C Bal."; Decimal)
        {
        }
        field(68; "Register Number"; Integer)
        {
        }
        field(69; "From Entry No."; Integer)
        {
        }
        field(70; "To Entry No."; Integer)
        {
        }
        field(81; "Responsibility Center"; Code[10])
        {
            Caption = 'Responsibility Center';
            TableRelation = "Responsibility Center";

            trigger OnValidate()
            begin
                /*
                TESTFIELD(Status,Status::Pending);
                IF NOT UserMgt.CheckRespCenter(1,"Responsibility Center") THEN
                  ERROR(
                    Text001,
                    RespCenter.TABLECAPTION,UserMgt.GetPurchasesFilter);
                 {
                "Location Code" := UserMgt.GetLocation(1,'',"Responsibility Center");
                IF "Location Code" = '' THEN BEGIN
                  IF InvtSetup.GET THEN
                    "Inbound Whse. Handling Time" := InvtSetup."Inbound Whse. Handling Time";
                END ELSE BEGIN
                  IF Location.GET("Location Code") THEN;
                  "Inbound Whse. Handling Time" := Location."Inbound Whse. Handling Time";
                END;
                
                UpdateShipToAddress;
                   }
                   {
                CreateDim(
                  DATABASE::"Responsibility Center","Responsibility Center",
                  DATABASE::Vendor,"Pay-to Vendor No.",
                  DATABASE::"Salesperson/Purchaser","Purchaser Code",
                  DATABASE::Campaign,"Campaign No.");
                
                IF xRec."Responsibility Center" <> "Responsibility Center" THEN BEGIN
                  RecreatePurchLines(FIELDCAPTION("Responsibility Center"));
                  "Assigned User ID" := '';
                END;
                  }
                   */

            end;
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin

        IF "No." = '' THEN BEGIN
            GenLedgerSetup.GET;
            IF "Payment Type" = "Payment Type"::Normal THEN BEGIN
                GenLedgerSetup.TESTFIELD(GenLedgerSetup."Normal Payments No");
                NoSeriesMgt.InitSeries(GenLedgerSetup."Normal Payments No", xRec."No. Series", 0D, "No.", "No. Series");
            END
            ELSE BEGIN
                GenLedgerSetup.TESTFIELD(GenLedgerSetup."Petty Cash Payments No");
                NoSeriesMgt.InitSeries(GenLedgerSetup."Petty Cash Payments No", xRec."No. Series", 0D, "No.", "No. Series");
            END;
        END;
        UserTemplate.RESET;
        UserTemplate.SETRANGE(UserTemplate.UserID, USERID);
        IF UserTemplate.FINDFIRST THEN BEGIN
            "Paying Bank Account" := UserTemplate."Default Petty Cash Bank";
            VALIDATE("Paying Bank Account");
        END;
        Date := TODAY;
        Cashier := USERID;
        VALIDATE(Cashier);
    end;

    trigger OnModify()
    begin
        //get the details of the dimensions and transfer the same to the lines
        CashPLine.RESET;
        CashPLine.SETRANGE(CashPLine.No, "No.");
        IF CashPLine.FINDFIRST THEN BEGIN
            REPEAT
                CashPLine."Global Dimension 1 Code" := "Global Dimension 1 Code";
                CashPLine."Shortcut Dimension 2 Code" := "Shortcut Dimension 2 Code";
                CashPLine.MODIFY;
            UNTIL CashPLine.NEXT = 0;
        END;
    end;

    var
        CashPLine: Record "FIN-Cash Payment Line q";
        UserTemplate: Record "FIN-Cash Office User Template";
        GLAcc: Record 15;
        Cust: Record 18;
        Vend: Record 23;
        FA: Record "Fixed Asset";
        BankAcc: Record "Bank Account";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        GenLedgerSetup: Record "FIN-Budgetary Control Setup";
        //CashierLinks: Record "FIN-Cashier Link q";
        GLAccount: Record "G/L Account";
        EntryNo: Integer;
        Committed: Record "FIN-Committment";
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
        GenLedSetup: Record "General Ledger Setup";
        "Total Budget": Decimal;
        CommitmentEntries: Record "FIN-Committment";
        CommittedAmount: Decimal;
        MonthBudget: Decimal;
        Expenses: Decimal;
        Header: Text[250];
        "Date From": Text[30];
        "Date To": Text[30];
        LastDay: Date;
        TotAmt: Decimal;
        DimVal: Record "Dimension Value";
        RespCenter: Record "Responsibility Center";
        UserMgt: Codeunit "User Setup Management";
        Text001: Label 'Your identification is set up to process from %1 %2 only.';
}