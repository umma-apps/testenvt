table 52178744 "Cash Office Setup"
{

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(50017; "Receipts No"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(50001; "Normal Payments No"; Code[10])
        {
            //Caption = 'Receipts No';
            TableRelation = "No. Series";

        }
        field(50002; "Cheque Reject Period"; DateFormula)
        {
        }
        field(50003; "Petty Cash Payments No"; Code[10])
        {
            Caption = 'Petty Cash Payments No';
            TableRelation = "No. Series";
        }
        field(50004; "Current Budget"; Code[20])
        {
            TableRelation = "G/L Budget Name".Name;
        }
        field(50005; "Current Budget Start Date"; Date)
        {
        }
        field(50006; "Current Budget End Date"; Date)
        {
        }
        field(50009; "Surrender Template"; Code[20])
        {
            TableRelation = "Gen. Journal Template";
        }
        field(50010; "Surrender  Batch"; Code[20])
        {
            TableRelation = "Gen. Journal Batch".Name WHERE("Journal Template Name" = FIELD("Surrender Template"));
        }
        field(50011; "Payroll Template"; Code[20])
        {
            TableRelation = "Gen. Journal Template";
        }
        field(50012; "Payroll  Batch"; Code[20])
        {
            TableRelation = "Gen. Journal Batch".Name;
        }
        field(50013; "Payroll Control A/C"; Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(50014; "PV Template"; Code[20])
        {
            TableRelation = "Gen. Journal Template";
        }
        field(50015; "PV  Batch"; Code[20])
        {
            TableRelation = "Gen. Journal Batch".Name WHERE("Journal Template Name" = FIELD("PV Template"));
        }
        field(50016; "Contract No"; Code[20])
        {
            TableRelation = "No. Series";
        }

        field(50018; "Petty Cash Voucher  Template"; Code[20])
        {
            TableRelation = "Gen. Journal Template";
        }
        field(50019; "Petty Cash Voucher Batch"; Code[20])
        {
            TableRelation = "Gen. Journal Batch".Name;
        }
        field(50020; "Max. Petty Cash Request"; Decimal)
        {
        }
        field(50022; "Imprest Req No"; Code[20])
        {
            Caption = 'Receipts No';
            TableRelation = "No. Series";
        }
        field(50023; "Quatation Request No"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(50024; "Tender Request No"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(50025; "Transport Pay Type"; Code[20])
        {
        }
        field(50026; "Minimum Chargeable Weight"; Decimal)
        {
        }
        field(50027; "Imprest Surrender No"; Code[20])
        {
            Caption = 'Imprest Surrender No';
            TableRelation = "No. Series";
        }
        field(50028; "Bank Deposit No."; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(50029; "InterBank Transfer No."; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(50030; "PA Payment Vouchers Nos"; Code[20])
        {
            Caption = 'Farmers Payment Vouchers Nos.';
            TableRelation = "No. Series".Code;
        }
        field(50031; "Cash Request Nos"; Code[20])
        {
            TableRelation = "No. Series".Code;
        }
        field(50032; "Cash Issue Nos"; Code[20])
        {
            TableRelation = "No. Series".Code;
        }
        field(50033; "Cash Receipt Nos"; Code[20])
        {
            TableRelation = "No. Series".Code;
        }
        field(50034; "Cash Transfer Template"; Code[10])
        {
            TableRelation = "Gen. Journal Template".Name;
        }
        field(50035; "Cash Transfer Batch"; Code[10])
        {
            TableRelation = "Gen. Journal Batch".Name WHERE("Journal Template Name" = FIELD("Cash Transfer Template"));
        }
        field(50036; "Enable AutoTeller Monitor"; Boolean)
        {
        }
        field(50037; "Alert After ?(Mins)"; Integer)
        {
        }
        field(50038; "Transporter Depot"; Code[20])
        {
            CaptionClass = '1,1,1';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(50039; "Transporter Department"; Code[20])
        {
            CaptionClass = '1,2,2';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(50040; "Transporter Cashier"; Code[20])
        {
            TableRelation = "Cash Office User Template";
        }
        field(50041; "Transporter PayType"; Code[20])
        {
            TableRelation = "Receipts and Payment Types".Code WHERE(Type = FILTER(Payment));
        }
        field(50042; "Cashier Transfer Nos"; Code[20])
        {
            TableRelation = "No. Series".Code;
        }
        field(50043; "Interim Transfer Account"; Code[20])
        {
        }
        field(50044; "Default Bank Deposit Slip A/C"; Code[20])
        {
            TableRelation = "Bank Account"."No.";
        }
        field(50045; "Staff Claim No"; Code[20])
        {
            Caption = 'Staff Claim No';
            TableRelation = "No. Series".Code;
        }
        field(50046; "Other Staff Advance No"; Code[20])
        {
            Caption = 'Other Staff Advance No';
            TableRelation = "No. Series".Code;
        }
        field(50047; "Staff Advance Surrender No"; Code[20])
        {
            Caption = 'Staff Adv. Surrender No';
            TableRelation = "No. Series".Code;
        }
        field(50048; "Prompt Cash Reimbursement"; Boolean)
        {
        }
        field(50049; "EFT Batch No"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series".Code;
        }
        field(50050; "Memo Nos."; Code[20])
        {
            TableRelation = "No. Series".Code;
        }
        field(50051; "Parttime Claim Nos"; Code[30])
        {
            TableRelation = "No. Series".code;
        }
        field(50052; "Parttimers Expense Account"; code[30])
        {
            TableRelation = "G/L Account"."No.";
        }
        field(50053; "Parttime payee code"; code[30])
        {
            TableRelation = "FIN-Tariff Codes".Code;
        }
        field(50054; "Kajiado PT Nos"; code[20])
        {
            TableRelation = "No. Series".code;
        }
        field(50055; "Garissa PT Nos"; code[20])
        {
            TableRelation = "No. Series".code;
        }
        field(50056; "Mombasa PT Nos"; code[20])
        {
            TableRelation = "No. Series".code;
        }
    }

    keys
    {
        key(Key1; "Primary Key", "Normal Payments No")
        {

        }
    }

    fieldgroups
    {
    }
}