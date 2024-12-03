table 52178702 "PROC-Store Requistion Header"
{
    //DrillDownPageID = 68150;
    //LookupPageID = 68150;

    fields
    {
        field(1; "No."; Code[30])
        {
            NotBlank = false;

            trigger OnValidate()
            begin
                IF "No." = '' THEN BEGIN
                    IF "No." <> xRec."No." THEN BEGIN
                        GenLedgerSetup.GET();
                        NoSeriesMgt.TestManual(GenLedgerSetup."Stores Requisition No");
                        "No." := '';
                    END;
                END;
            end;
        }
        field(2; "Request date"; Date)
        {
        }
        field(5; "Required Date"; Date)
        {
        }
        field(6; "Requester ID"; Code[20])
        {
            Caption = 'Requester ID';
            Editable = false;
            TableRelation = User;
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnLookup()
            var
                LoginMgt: Codeunit 418;
            begin
            end;

            trigger OnValidate()
            var
                LoginMgt: Codeunit 418;
            begin
            end;
        }
        field(7; "Request Description"; Text[150])
        {
        }
        field(9; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(10; Status; Option)
        {
            Editable = true;
            OptionMembers = Open,Released,"Pending Approval","Pending Prepayment",Cancelled,Posted;
        }
        field(11; Supplier; Code[20])
        {
            TableRelation = Vendor;
        }
        field(12; "Action Type"; Option)
        {
            OptionMembers = " ","Ask for Tender","Ask for Quote";

            trigger OnValidate()
            begin
                /*
                IF Type=Type::"G/L Account" THEN BEGIN
                   IF "Action Type"="Action Type"::Issue THEN
                            ERROR('You cannot Issue a G/L Account please order for it')
                END;


               //Compare Quantity in Store and Qty to Issue
                IF Type=Type::Item THEN BEGIN
                   IF "Action Type"="Action Type"::Issue THEN BEGIN
                    IF Quantity>"Qty in store" THEN
                      ERROR('You cannot Issue More than what is available in store')
                   END;
                END;
                */

            end;
        }
        field(29; Justification; Text[250])
        {
        }
        field(30; "User ID"; Code[30])
        {
        }
        field(31; "Global Dimension 1 Code"; Code[30])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            Description = 'Stores the reference to the first global dimension in the database';
            NotBlank = false;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));

            trigger OnValidate()
            begin
                DimVal.RESET;
                DimVal.SETRANGE(DimVal."Global Dimension No.", 1);
                DimVal.SETRANGE(DimVal.Code, "Global Dimension 1 Code");
                IF DimVal.FIND('-') THEN
                    "Function Name" := DimVal.Name;
                //UpdateLines;
            end;
        }
        field(56; "Shortcut Dimension 2 Code"; Code[30])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            Description = 'Stores the reference of the second global dimension in the database';
            NotBlank = false;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));

            trigger OnValidate()
            begin
                DimVal.RESET;
                DimVal.SETRANGE(DimVal."Global Dimension No.", 2);
                DimVal.SETRANGE(DimVal.Code, "Shortcut Dimension 2 Code");
                IF DimVal.FIND('-') THEN
                    "Budget Center Name" := DimVal.Name;
                //UpdateLines
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
        field(81; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 3 Code';
            Description = 'Stores the reference of the Third global dimension in the database';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));

            trigger OnValidate()
            begin
                DimVal.RESET;
                //DimVal.SETRANGE(DimVal."Global Dimension No.",2);
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
                //DimVal.SETRANGE(DimVal."Global Dimension No.",2);
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
        field(85; "Responsibility Center"; Code[10])
        {
            Caption = 'Responsibility Center';
            TableRelation = "Responsibility Center";

            trigger OnValidate()
            begin

                TESTFIELD(Status, Status::Open);
                // IF NOT UserMgt.CheckRespCenter(1, "Responsibility Center") THEN
                //     ERROR(
                //       Text001,
                //       RespCenter.TABLECAPTION, UserMgt.GetPurchasesFilter);
                /*
               "Location Code" := UserMgt.GetLocation(1,'',"Responsibility Center");
               IF "Location Code" = '' THEN BEGIN
                 IF InvtSetup.GET THEN
                   "Inbound Whse. Handling Time" := InvtSetup."Inbound Whse. Handling Time";
               END ELSE BEGIN
                 IF Location.GET("Location Code") THEN;
                 "Inbound Whse. Handling Time" := Location."Inbound Whse. Handling Time";
               END;

               UpdateShipToAddress;
                  */
                /*
             CreateDim(
               DATABASE::"Responsibility Center","Responsibility Center",
               DATABASE::Vendor,"Pay-to Vendor No.",
               DATABASE::"Salesperson/Purchaser","Purchaser Code",
               DATABASE::Campaign,"Campaign No.");

             IF xRec."Responsibility Center" <> "Responsibility Center" THEN BEGIN
               RecreatePurchLines(FIELDCAPTION("Responsibility Center"));
               "Assigned User ID" := '';
             END;
               */

            end;
        }
        field(86; TotalAmount; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("PROC-Store Requistion Lines"."Line Amount" WHERE("Requistion No" = FIELD("No.")));

        }
        field(87; "Issuing Store"; Code[10])
        {
            TableRelation = IF ("Store Requisition Type" = CONST(Item)) Location;

            trigger OnValidate()
            begin

                ReqLines.RESET;
                ReqLines.SETRANGE(ReqLines."Requistion No", "No.");
                IF ReqLines.FIND('-') THEN BEGIN
                    REPEAT
                        ReqLines."Issuing Store" := "Issuing Store";
                    UNTIL ReqLines.NEXT = 0;
                END;
            end;
        }
        field(88; "Store Requisition Type"; Option)
        {
            OptionCaption = 'Item';
            OptionMembers = Item;
        }
        field(89; "Issue Date"; Date)
        {
        }
        field(90; Committed; Boolean)
        {
        }
        field(91; "SRN.No"; Code[20])
        {
        }
        field(92; "Inventory Posting Group"; Code[20])
        {
            TableRelation = "Inventory Posting Group".Code;
        }
        field(50045; "Budgeted Amount"; Decimal)
        {
            Editable = false;
        }
        field(50046; "Actual Expenditure"; Decimal)
        {
            Editable = false;
        }
        field(50047; "Committed Amount"; Decimal)
        {
            Editable = false;
        }
        field(50048; "Budget Balance"; Decimal)
        {
            Editable = false;
        }
        field(50049; Amount; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("PROC-Store Requistion Lines"."Line Amount" WHERE("Requistion No" = FIELD("No.")));
            Editable = false;

        }
        field(50050; "Requisition Type"; Option)
        {
            OptionCaption = 'Stationery,Grocery,Project,Cleaning,Hardware,Others';
            OptionMembers = Stationery,Grocery,Project,Cleaning,Hardware,Others;
        }
        field(50051; "Department Name"; Text[250])
        {
            FieldClass = FlowField;
            CalcFormula = Lookup("Dimension Value".Name WHERE(Code = FIELD("Shortcut Dimension 2 Code")));

        }
        field(50052; "Staff No."; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50053; "Staff Name"; text[200])
        {
            CalcFormula = lookup("HRM-Employee (D)"."First Name" where("No." = field("Requester ID")));
            FieldClass = FlowField;
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

    trigger OnDelete()
    begin
        IF Status <> Status::Open THEN
            ERROR('You Cannot DELETE an already released Requisition')
    end;

    trigger OnInsert()
    begin

        IF "No." = '' THEN BEGIN
            GenLedgerSetup.GET();
            GenLedgerSetup.TESTFIELD(GenLedgerSetup."Stores Requisition No");
            NoSeriesMgt.InitSeries(GenLedgerSetup."Stores Requisition No", xRec."No. Series", 0D, "No.", "No. Series");
        END;
    end;

    trigger OnModify()
    begin
        ReqLines.RESET;
        ReqLines.SETRANGE(ReqLines."Requistion No", "No.");
        IF ReqLines.FIND('-') THEN BEGIN
            REPEAT
                ReqLines."Shortcut Dimension 1 Code" := "Global Dimension 1 Code";
                ReqLines."Shortcut Dimension 2 Code" := "Shortcut Dimension 2 Code";
                ReqLines."Shortcut Dimension 3 Code" := "Shortcut Dimension 3 Code";
                ReqLines."Shortcut Dimension 4 Code" := "Shortcut Dimension 4 Code";
            UNTIL ReqLines.NEXT = 0;
        END;
    end;

    var
        // NoSeriesMgt;
        // UserMgt;
        NoSeriesMgt: Codeunit NoSeriesManagement;
        GenLedgerSetup: Record "Purchases & Payables Setup";
        //UserDept: Record "61733";
        //RespCenter: Record "61695";
        //UserMgt: Codeunit "User Setup Management";
        Text001: Label 'Your identification is set up to process from %1 %2 only.';
        Dimval: Record "Dimension Value";
        ReqLines: Record "PROC-Store Requistion Lines";

    procedure StoresLinesExist()
    begin
    end;
}

