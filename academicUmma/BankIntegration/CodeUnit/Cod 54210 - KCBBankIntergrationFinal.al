codeunit 54210 "KCB Bank Intergration - Final"
{

    trigger OnRun()
    begin
    end;
    // CurrencyEnum.al


    procedure ValidateAccount(incustomerRefNumber: Code[20]) AccountStatus: Text[250]
    var
        Cust: Record Customer;
        BankIntergration: Record "KCB Bank Intergration - Test";
    begin
        Clear(AccountStatus);
        Cust.Reset;
        Cust.SetRange("No.", incustomerRefNumber);
        if not Cust.Find('-') then begin
            //Student Does Not Exist
            AccountStatus := 'ERROR: Invalid Student Number';
            //EXIT;
        end else begin
            //Student Exists
            AccountStatus := Cust.Name;
        end;
    end;

    procedure GetAccountDetails(accno: Code[20]) details: Text
    var
        Cust: Record Customer;
        applicheader: Record "ACA-Applic. Form Header";
        Programme: Record "ACA-Programme";
        appfee: Decimal;
    begin
        Clear(details);
        Cust.Reset;
        Cust.SetRange("No.", accno);
        if Cust.Find('-') then begin
            Cust.CALCFIELDS(Balance);
            details := Cust."No." + ':::' + Cust.Name + ':::' + Format(Cust.Balance) + ':::' + 'PARTIAL';
        end else begin
            applicheader.Reset();
            applicheader.setrange("Application No.", accno);
            if applicheader.Find('-') then begin
                Programme.Reset;
                Programme.SetRange(Programme.Code, applicheader."First Degree Choice");
                IF Programme.FIND('-') THEN begin
                    appfee := ROUND(Programme.ApplicationFee, 0.01, '>');
                end;
                details := applicheader."Application No." + ':::' + applicheader."First Name" + ' ' + applicheader."Other Names" + ':::' + Format(appfee) + ':::' + 'FIXED';
            end;
        end;
    end;

    procedure TransactionCodeExists(incustomerRefNumber: Code[20]) exists: Boolean
    var
        Cust: Record Customer;
        BankIntergration: Record "KCB Bank Intergration - Final";
    begin
        Clear(exists);
        BankIntergration.Reset;
        BankIntergration.SetRange(bankreference, incustomerRefNumber);
        if BankIntergration.Find('-') then begin
            exists := true;
        end;
    end;

    procedure PostKCBTransaction(transcode: Code[20]; transdate: Code[20]; amount: Decimal; accno: Code[20]; accname: Text; transtype: Code[20]; mssidn: code[20]; shortcode: Code[20]; accbal: Decimal) posted: Boolean
    var
        Cust: Record Customer;
        applicheader: Record "ACA-Applic. Form Header";
        BankIntergration: Record "KCB Bank Intergration - Final";
        GenEnum: Enum "Gen. Journal Account Type";
    begin
        Cust.Reset;
        Cust.SetRange("No.", accno);
        if Cust.Find('-') then begin
            BankIntergration.Init;
            BankIntergration.bankreference := transcode;
            BankIntergration.transactionDate := transdate;
            BankIntergration.paymentAmount := amount;
            BankIntergration.debitaccount := accno;
            BankIntergration.customerRefNumber := accno;
            BankIntergration.debitcustname := accname;
            BankIntergration.ShortCode := shortcode;
            BankIntergration.phonenumber := mssidn;
            BankIntergration.paymentMode := transtype;
            BankIntergration.OrgAccountBalance := accbal;
            BankIntergration.Insert;
            PostCoopReceipt(transcode, accno, amount, '18770', accname);
            posted := true;
        end else begin
            applicheader.Reset;
            applicheader.SetRange("Application No.", accno);
            if applicheader.Find('-') then begin
                BankIntergration.Init;
                BankIntergration.bankreference := transcode;
                BankIntergration.transactionDate := transdate;
                BankIntergration.paymentAmount := amount;
                BankIntergration.debitaccount := accno;
                BankIntergration.customerRefNumber := accno;
                BankIntergration.debitcustname := accname;
                BankIntergration.ShortCode := shortcode;
                BankIntergration.phonenumber := mssidn;
                BankIntergration.paymentMode := transtype;
                BankIntergration.OrgAccountBalance := accbal;
                BankIntergration.Insert;
                applicheader."Finance Cleared" := true;
                PostCoopReceipt2(transcode, '41310101', amount, '18770', accname, applicheader."First Degree Choice");
                posted := true;
            end;

        end;
    end;



    procedure GetPayTransFinal(inbankreference: Code[50]; indebitaccount: Code[20]; intransactionDate: Code[20]; inbillAmount: Code[20]; inpaymentMode: Code[20]; inphonenumber: Code[20]; incustomerRefNumber: Code[20]; indebitcustname: Text[150]) Status: Text[250]
    var
        Cust: Record Customer;
        BankIntergration: Record "KCB Bank Intergration - Final";
    begin
        Clear(Status);
        Cust.Reset;
        Cust.SetRange("No.", incustomerRefNumber);
        if not Cust.Find('-') then begin
            //Student Does Not Exist
            Status := 'Failed, ' + incustomerRefNumber + ' Does not exist';
            //EXIT;
        end else begin
            //Student Exists
            BankIntergration.Reset;
            BankIntergration.SetRange(bankreference, inbankreference);
            if BankIntergration.Find('-') then begin
                //The Transaction Already Exists
                Status := 'FAILED: Transaction ' + inbankreference + ' Already Exists';
            end else begin
                //The Transaction Does Not Exist
                BankIntergration.Init;
                BankIntergration.bankreference := inbankreference;
                BankIntergration.customerRefNumber := incustomerRefNumber;
                BankIntergration.debitaccount := indebitcustname;
                BankIntergration.debitcustname := indebitcustname;
                BankIntergration.channelCode := inpaymentMode;
                BankIntergration.transactionDate := intransactionDate;
                BankIntergration.phonenumber := inphonenumber;
                BankIntergration.billAmount := inbillAmount;
                BankIntergration.Insert;
                Status := 'SUCCESSFUL';

            end;
        end;
    end;

    procedure PostCoopReceipt2(TransactionNo: Code[20]; GlaccNo: Code[20]; BillAmounts: Decimal; BankCode: Code[20]; StudentName: Text[150]; progs: Code[20])
    var
        cust2: Record Customer;
        copTrans: Record "Coop Bank Intergration - Test";
        equityTrans: Record "Bank Intergration - Final";
        ncbaTrans: Record "KCB Bank Intergration - Test";
        StudentCharges: Record "ACA-Std Charges";
        GenJnl: Record "Gen. Journal Line";
        Stages: Record "ACA-Programme Stages";
        Units: Record "ACA-Units/Subjects";
        ExamsByStage: Record "ACA-Exams";
        ExamsByUnit: Record "ACA-Exams By Units";
        Charges: Record "ACA-Charge";
        Receipt: Record "ACA-Receipt";
        ReceiptItems: Record "ACA-Receipt Items";
        GenSetUp: Record "ACA-General Set-Up";
        TotalApplied: Decimal;
        Sems: Record "ACA-Semesters";
        DueDate: Date;
        Cust: Record Customer;
        CustPostGroup: Record "Customer Posting Group";
        window: Dialog;
        GLPosting: Codeunit "Gen. Jnl.-Post Line";
        Receipts: Record "ACA-Receipt";
        CReg: Record "ACA-Course Registration";
        CustLedg: Record "Cust. Ledger Entry";
        StudentPay: Record "ACA-Std Payments";
        ProgrammeSetUp: Record "ACA-Programme";
        CourseReg: Code[20];
        LastReceiptNo: Code[20];
        "No. Series Line": Record "No. Series Line";
        "Last No": Code[20];
        Prog: Record "ACA-Programme";
        BankRec: Record "Bank Account";
        [InDataSet]
        "Amount to payEnable": Boolean;
        [InDataSet]
        "Cheque NoEnable": Boolean;
        [InDataSet]
        "Drawer NameEnable": Boolean;
        [InDataSet]
        "Bank No.Enable": Boolean;
        [InDataSet]
        "Bank Slip DateEnable": Boolean;
        [InDataSet]
        "Applies to Doc NoEnable": Boolean;
        [InDataSet]
        "Apply to OverpaymentEnable": Boolean;
        [InDataSet]
        "CDF AccountEnable": Boolean;
        [InDataSet]
        "CDF DescriptionEnable": Boolean;
        [InDataSet]
        ApplicationEnable: Boolean;
        [InDataSet]
        "Unref. Entry No.Enable": Boolean;
        [InDataSet]
        "Staff Invoice No.Enable": Boolean;
        [InDataSet]
        "Staff DescriptionEnable": Boolean;
        [InDataSet]
        "Payment ByEnable": Boolean;
        StudHostel: Record "ACA-Students Hostel Rooms";
        HostLedg: Record "ACA-Hostel Ledger";
        BankName: Text[100];
        ACAStdPayments: Record "ACA-Std Payments";
        BankIntergration: Record "Bank Intergration - Final";
        KCBBankIntergrationFinal: Record "Coop Bank Intergration - Test";
        payBillTrans: Record "KCB Bank Intergration - Final";


    begin
        ///////??????????????????????????????????????????????????? - Post Receipt
        //Insert into Receipt
        //GenSetUp.TestField(GenSetUp."Helb Account");
        GenJnl.Reset;
        GenJnl.SetRange("Journal Template Name", 'SALES');
        GenJnl.SetRange("Journal Batch Name", 'STUD PAY');
        GenJnl.DeleteAll;
        GenJnl.Init;
        GenJnl."Line No." := GenJnl."Line No." + 10000;
        GenJnl."Posting Date" := Today;
        GenJnl."Document No." := TransactionNo;
        GenJnl."External Document No." := '';
        GenJnl.Validate(GenJnl."Document No.");
        GenJnl."Journal Template Name" := 'SALES';
        GenJnl."Journal Batch Name" := 'STUD PAY';
        GenJnl."Account Type" := GenJnl."Account Type"::"G/L Account";
        GenJnl."Account No." := GlaccNo;
        GenJnl.Amount := -BillAmounts;
        GenJnl.Validate(GenJnl."Account No.");
        GenJnl.Validate(GenJnl.Amount);
        GenJnl.Description := 'Application Fee';
        GenJnl."Bal. Account Type" := GenJnl."Bal. Account Type"::"Bank Account";
        GenJnl."Bal. Account No." := BankCode;
        if ProgrammeSetUp.Get(progs) then begin
            GenJnl."Shortcut Dimension 2 Code" := ProgrammeSetUp."Department Code";
        end;
        GenJnl.Validate(GenJnl."Shortcut Dimension 4 Code");
        GenJnl.Insert;
        GenJnl.Reset;
        GenJnl.SetRange("Journal Template Name", 'SALES');
        GenJnl.SetRange("Journal Batch Name", 'STUD PAY');
        if GenJnl.Find('-') then begin

            CODEUNIT.Run(CODEUNIT::"Gen. Jnl.-Post B2", GenJnl);
            //ACAStdPayments.Modify;
        end;


    end;

    procedure PostCoopReceipt(TransactionNo: Code[20]; StudentNo: Code[20]; BillAmounts: Decimal; BankCode: Code[20]; StudentName: Text[150])
    var
        cust2: Record Customer;
        copTrans: Record "Coop Bank Intergration - Test";
        equityTrans: Record "Bank Intergration - Final";
        ncbaTrans: Record "KCB Bank Intergration - Test";
        StudentCharges: Record "ACA-Std Charges";
        GenJnl: Record "Gen. Journal Line";
        Stages: Record "ACA-Programme Stages";
        Units: Record "ACA-Units/Subjects";
        ExamsByStage: Record "ACA-Exams";
        ExamsByUnit: Record "ACA-Exams By Units";
        Charges: Record "ACA-Charge";
        Receipt: Record "ACA-Receipt";
        ReceiptItems: Record "ACA-Receipt Items";
        GenSetUp: Record "ACA-General Set-Up";
        TotalApplied: Decimal;
        Sems: Record "ACA-Semesters";
        DueDate: Date;
        Cust: Record Customer;
        CustPostGroup: Record "Customer Posting Group";
        window: Dialog;
        GLPosting: Codeunit "Gen. Jnl.-Post Line";
        Receipts: Record "ACA-Receipt";
        CReg: Record "ACA-Course Registration";
        CustLedg: Record "Cust. Ledger Entry";
        StudentPay: Record "ACA-Std Payments";
        ProgrammeSetUp: Record "ACA-Programme";
        CourseReg: Code[20];
        LastReceiptNo: Code[20];
        "No. Series Line": Record "No. Series Line";
        "Last No": Code[20];
        Prog: Record "ACA-Programme";
        BankRec: Record "Bank Account";
        [InDataSet]
        "Amount to payEnable": Boolean;
        [InDataSet]
        "Cheque NoEnable": Boolean;
        [InDataSet]
        "Drawer NameEnable": Boolean;
        [InDataSet]
        "Bank No.Enable": Boolean;
        [InDataSet]
        "Bank Slip DateEnable": Boolean;
        [InDataSet]
        "Applies to Doc NoEnable": Boolean;
        [InDataSet]
        "Apply to OverpaymentEnable": Boolean;
        [InDataSet]
        "CDF AccountEnable": Boolean;
        [InDataSet]
        "CDF DescriptionEnable": Boolean;
        [InDataSet]
        ApplicationEnable: Boolean;
        [InDataSet]
        "Unref. Entry No.Enable": Boolean;
        [InDataSet]
        "Staff Invoice No.Enable": Boolean;
        [InDataSet]
        "Staff DescriptionEnable": Boolean;
        [InDataSet]
        "Payment ByEnable": Boolean;
        StudHostel: Record "ACA-Students Hostel Rooms";
        HostLedg: Record "ACA-Hostel Ledger";
        BankName: Text[100];
        ACAStdPayments: Record "ACA-Std Payments";
        BankIntergration: Record "Bank Intergration - Final";
        KCBBankIntergrationFinal: Record "Coop Bank Intergration - Test";
        payBillTrans: Record "KCB Bank Intergration - Final";


    begin
        ///////??????????????????????????????????????????????????? - Post Receipt
        //Insert into Receipts



        ACAStdPayments.Init;
        ACAStdPayments.Validate(ACAStdPayments."Student No.", StudentNo);
        ACAStdPayments.Validate(ACAStdPayments."Payment Mode", ACAStdPayments."Payment Mode"::"Bank Slip");
        ACAStdPayments.Validate(ACAStdPayments."Cheque No", TransactionNo);
        ACAStdPayments.Validate(ACAStdPayments."Amount to pay", BillAmounts);
        ACAStdPayments.Validate(ACAStdPayments."Bank Slip Date", Today);
        ACAStdPayments.Validate(ACAStdPayments."Bank No.", BankCode);
        ACAStdPayments.Validate(ACAStdPayments."Payment By", StudentName);
        ACAStdPayments.Validate(ACAStdPayments."Transaction Date", Today);
        ACAStdPayments.Validate(ACAStdPayments."Drawer Name", 'AUTOPOST');
        ACAStdPayments.Insert(true);

        if ((ACAStdPayments."Payment Mode" = ACAStdPayments."Payment Mode"::"Bank Slip") or
        (ACAStdPayments."Payment Mode" = ACAStdPayments."Payment Mode"::Cheque)) then begin
            // // TESTFIELD("Bank Slip Date");
            // // TESTFIELD("Bank No.");
        end;
        CustLedg.Reset;
        CustLedg.SetRange(CustLedg."Customer No.", ACAStdPayments."Student No.");
        //CustLedg.SETRANGE(CustLedg."Apply to",TRUE);
        CustLedg.SetRange(CustLedg.Open, true);
        CustLedg.SetRange(CustLedg.Reversed, false);
        if CustLedg.Find('-') then begin
            repeat
                TotalApplied := TotalApplied + CustLedg."Amount Applied";
            until CustLedg.Next = 0;
        end;

        if ACAStdPayments."Amount to pay" > TotalApplied then begin

        end;
        if Cust.Get(StudentNo) then begin
            Cust."Application Method" := Cust."Application Method"::"Apply to Oldest";
            Cust.Status := Cust.Status::Current;
            Cust.Modify;
        end;

        if Cust.Get(ACAStdPayments."Student No.") then
            GenJnl.Reset;
        GenJnl.SetRange("Journal Template Name", 'SALES');
        GenJnl.SetRange("Journal Batch Name", 'STUD PAY');
        GenJnl.DeleteAll;

        GenSetUp.Get();
        GenJnl.Reset;
        GenJnl.SetRange("Journal Template Name", 'SALES');
        GenJnl.SetRange("Journal Batch Name", 'STUD PAY');
        GenJnl.DeleteAll;

        GenSetUp.TestField(GenSetUp."Pre-Payment Account");

        "Last No" := '';
        "No. Series Line".Reset;
        BankRec.Get(ACAStdPayments."Bank No.");
        BankRec.TestField(BankRec."Receipt No. Series");
        "No. Series Line".SetRange("No. Series Line"."Series Code", BankRec."Receipt No. Series");
        if "No. Series Line".Find('-') then begin

            "Last No" := IncStr("No. Series Line"."Last No. Used");
            "No. Series Line"."Last No. Used" := IncStr("No. Series Line"."Last No. Used");
            "No. Series Line".Modify;
        end;


        GenJnl.Reset;
        GenJnl.SetRange("Journal Template Name", 'SALES');
        GenJnl.SetRange("Journal Batch Name", 'STUD PAY');
        GenJnl.DeleteAll;



        Cust.Status := Cust.Status::Current;
        //Cust.MODIFY;

        // //
        // // IF "Payment Mode"="Payment Mode"::"Applies to Overpayment" THEN
        // // ERROR('Overpayment must be applied manualy.');


        /////////////////////////////////////////////////////////////////////////////////
        //Receive payments
        if ACAStdPayments."Payment Mode" <> ACAStdPayments."Payment Mode"::"Applies to Overpayment" then begin

            //Over Payment
            TotalApplied := 0;

            CustLedg.Reset;
            CustLedg.SetRange(CustLedg."Customer No.", ACAStdPayments."Student No.");
            //CustLedg.SETRANGE(CustLedg."Apply to",TRUE);
            CustLedg.SetRange(CustLedg.Open, true);
            CustLedg.SetRange(CustLedg.Reversed, false);
            if CustLedg.Find('-') then begin
                repeat
                    TotalApplied := TotalApplied + CustLedg."Amount Applied";
                until CustLedg.Next = 0;
            end;

            CReg.Reset;
            CReg.SetCurrentKey(CReg."Reg. Transacton ID");
            //CReg.SETRANGE(CReg."Reg. Transacton ID",StudentCharges."Reg. Transacton ID");
            CReg.SetRange(CReg."Student No.", ACAStdPayments."Student No.");
            if CReg.Find('+') then
                CourseReg := CReg."Reg. Transacton ID";

            Receipt.Init;
            Receipt."Receipt No." := "Last No";
            //Receipt.VALIDATE(Receipt."Receipt No.");
            Receipt."Student No." := ACAStdPayments."Student No.";
            Receipt.Date := ACAStdPayments."Transaction Date";
            Receipt."KCA Rcpt No" := ACAStdPayments."KCA Receipt No";
            Receipt."Bank Slip Date" := ACAStdPayments."Bank Slip Date";
            Receipt."Bank Slip/Cheque No" := ACAStdPayments."Cheque No";
            Receipt.Validate("Bank Slip/Cheque No");
            Receipt."Bank Account" := ACAStdPayments."Bank No.";
            if ACAStdPayments."Payment Mode" = ACAStdPayments."Payment Mode"::"Bank Slip" then
                Receipt."Payment Mode" := Receipt."Payment Mode"::"Bank Slip" else
                if ACAStdPayments."Payment Mode" = ACAStdPayments."Payment Mode"::Cheque then
                    Receipt."Payment Mode" := Receipt."Payment Mode"::Cheque else
                    if ACAStdPayments."Payment Mode" = ACAStdPayments."Payment Mode"::Cash then
                        Receipt."Payment Mode" := Receipt."Payment Mode"::Cash else
                        Receipt."Payment Mode" := ACAStdPayments."Payment Mode";
            Receipt.Amount := ACAStdPayments."Amount to pay";
            Receipt."Payment By" := ACAStdPayments."Payment By";
            Receipt."Transaction Date" := Today;
            Receipt."Transaction Time" := Time;
            Receipt."User ID" := UserId;
            Receipt."Reg ID" := CourseReg;
            Receipt.Insert;

            Receipt.Reset;
            if Receipt.Find('+') then begin


                CustLedg.Reset;
                CustLedg.SetRange(CustLedg."Customer No.", ACAStdPayments."Student No.");
                //CustLedg.SETRANGE(CustLedg."Apply to",TRUE);
                CustLedg.SetRange(CustLedg.Open, true);
                CustLedg.SetRange(CustLedg.Reversed, false);
                if CustLedg.Find('-') then begin

                    GenSetUp.Get();


                end;

            end;

            //Bank Entry
            if BankRec.Get(ACAStdPayments."Bank No.") then
                BankName := BankRec.Name;

            if (ACAStdPayments."Payment Mode" <> ACAStdPayments."Payment Mode"::Unreferenced) and
            (ACAStdPayments."Payment Mode" <> ACAStdPayments."Payment Mode"::"Staff Invoice")
            and (ACAStdPayments."Payment Mode" <> ACAStdPayments."Payment Mode"::Weiver) and (ACAStdPayments."Payment Mode" <> ACAStdPayments."Payment Mode"::CDF)
            and (ACAStdPayments."Payment Mode" <> ACAStdPayments."Payment Mode"::HELB) then begin

                GenJnl.Init;
                GenJnl."Line No." := GenJnl."Line No." + 10000;
                GenJnl."Posting Date" := ACAStdPayments."Bank Slip Date";
                GenJnl."Document No." := "Last No";
                GenJnl."External Document No." := ACAStdPayments."Cheque No";
                GenJnl.Validate(GenJnl."Document No.");
                GenJnl."Journal Template Name" := 'SALES';
                GenJnl."Journal Batch Name" := 'STUD PAY';
                GenJnl."Account Type" := GenJnl."Account Type"::"Bank Account";
                GenJnl."Account No." := ACAStdPayments."Bank No.";
                GenJnl.Amount := ACAStdPayments."Amount to pay";
                GenJnl.Validate(GenJnl."Account No.");
                GenJnl.Validate(GenJnl.Amount);
                GenJnl.Description := Format(ACAStdPayments."Payment Mode") + '-' + Format(ACAStdPayments."Bank Slip Date") + '-' + BankName;
                GenJnl."Bal. Account Type" := GenJnl."Bal. Account Type"::Customer;
                if Cust."Bill-to Customer No." <> '' then
                    GenJnl."Bal. Account No." := Cust."Bill-to Customer No."
                else
                    GenJnl."Bal. Account No." := ACAStdPayments."Student No.";


                GenJnl.Validate(GenJnl."Bal. Account No.");

                CReg.Reset;
                CReg.SetRange(CReg."Student No.", ACAStdPayments."Student No.");
                CReg.SetRange(CReg.Reversed, false);
                if CReg.Find('+') then begin
                    if ProgrammeSetUp.Get(CReg.Programmes) then begin
                        ProgrammeSetUp.TestField(ProgrammeSetUp."Department Code");
                        //ProgrammeSetUp.TESTFIELD(Cust."Global Dimension 1 Code");
                        GenJnl."Shortcut Dimension 1 Code" := Cust."Global Dimension 1 Code";
                        GenJnl."Shortcut Dimension 2 Code" := ProgrammeSetUp."Shortcut Dimension 2 Code";
                        GenJnl."Shortcut Dimension 3 Code" := ProgrammeSetUp."Shortcut Dimension 3 Code";
                        GenJnl."Shortcut Dimension 4 Code" := ProgrammeSetUp."Shortcut Dimension 4 Code";


                    end;
                end;
                GenJnl.Validate(GenJnl."Shortcut Dimension 1 Code");
                GenJnl.Validate(GenJnl."Shortcut Dimension 2 Code");
                GenJnl.Validate(GenJnl."Shortcut Dimension 3 Code");
                GenJnl.Validate(GenJnl."Shortcut Dimension 4 Code");
                GenJnl.Insert;
            end;
            if ACAStdPayments."Payment Mode" = ACAStdPayments."Payment Mode"::Unreferenced then begin
                GenJnl.Init;
                GenJnl."Line No." := GenJnl."Line No." + 10000;
                GenJnl."Posting Date" := ACAStdPayments."Bank Slip Date";
                GenJnl."Document No." := "Last No";
                GenJnl."External Document No." := ACAStdPayments."Drawer Name";
                GenJnl.Validate(GenJnl."Document No.");
                GenJnl."Journal Template Name" := 'SALES';
                GenJnl."Journal Batch Name" := 'STUD PAY';
                GenJnl."Account Type" := GenJnl."Account Type"::Customer;
                GenJnl."Account No." := 'UNREF';
                GenJnl.Amount := ACAStdPayments."Amount to pay";
                GenJnl.Validate(GenJnl."Account No.");
                GenJnl.Validate(GenJnl.Amount);
                GenJnl.Description := Cust.Name;
                GenJnl."Bal. Account Type" := GenJnl."Bal. Account Type"::Customer;
                if Cust."Bill-to Customer No." <> '' then
                    GenJnl."Bal. Account No." := Cust."Bill-to Customer No."
                else
                    GenJnl."Bal. Account No." := ACAStdPayments."Student No.";

                //GenJnl."Applies-to Doc. No." := ACAStdPayments."Applies to Doc No";
                GenJnl.Validate(GenJnl."Applies-to Doc. No.");
                GenJnl.Insert;

                CReg.Reset;
                CReg.SetRange(CReg."Student No.", ACAStdPayments."Student No.");
                CReg.SetRange(CReg.Reversed, false);
                if CReg.Find('+') then begin
                    if ProgrammeSetUp.Get(CReg.Programmes) then begin
                        ProgrammeSetUp.TestField(ProgrammeSetUp."Department Code");
                        //ProgrammeSetUp.TESTFIELD(Cust."Global Dimension 1 Code");
                        GenJnl."Shortcut Dimension 1 Code" := Cust."Global Dimension 1 Code";
                        GenJnl."Shortcut Dimension 2 Code" := ProgrammeSetUp."Shortcut Dimension 2 Code";
                        GenJnl."Shortcut Dimension 3 Code" := ProgrammeSetUp."Shortcut Dimension 3 Code";
                        GenJnl."Shortcut Dimension 4 Code" := ProgrammeSetUp."Shortcut Dimension 4 Code";


                    end;
                end;
                GenJnl.Validate(GenJnl."Shortcut Dimension 1 Code");
                GenJnl.Validate(GenJnl."Shortcut Dimension 2 Code");
                GenJnl.Validate(GenJnl."Shortcut Dimension 3 Code");
                GenJnl.Validate(GenJnl."Shortcut Dimension 4 Code");


            end;
            // BKK...Staff Invoice
            if ACAStdPayments."Payment Mode" = ACAStdPayments."Payment Mode"::"Staff Invoice" then begin
                GenJnl.Init;
                GenJnl."Line No." := GenJnl."Line No." + 10000;
                GenJnl."Posting Date" := ACAStdPayments."Bank Slip Date";
                GenJnl."Document No." := "Last No";
                GenJnl."External Document No." := '';
                GenJnl.Validate(GenJnl."Document No.");
                GenJnl."Journal Template Name" := 'SALES';
                GenJnl."Journal Batch Name" := 'STUD PAY';
                GenJnl."Account Type" := GenJnl."Account Type"::Customer;
                GenJnl."Account No." := ACAStdPayments."Student No.";
                GenJnl.Amount := -ACAStdPayments."Amount to pay";
                GenJnl.Validate(GenJnl."Account No.");
                GenJnl.Validate(GenJnl.Amount);
                GenJnl.Description := 'Staff Invoice No. ' + ACAStdPayments."Staff Invoice No.";
                GenJnl."Bal. Account Type" := GenJnl."Bal. Account Type"::"G/L Account";
                GenJnl."Bal. Account No." := '200012';

                CReg.Reset;
                CReg.SetRange(CReg."Student No.", ACAStdPayments."Student No.");
                CReg.SetRange(CReg.Reversed, false);
                if CReg.Find('+') then begin
                    if ProgrammeSetUp.Get(CReg.Programmes) then begin
                        ProgrammeSetUp.TestField(ProgrammeSetUp."Department Code");
                        //ProgrammeSetUp.TESTFIELD(Cust."Global Dimension 1 Code");
                        GenJnl."Shortcut Dimension 1 Code" := Cust."Global Dimension 1 Code";
                        GenJnl."Shortcut Dimension 2 Code" := ProgrammeSetUp."Shortcut Dimension 2 Code";
                        GenJnl."Shortcut Dimension 3 Code" := ProgrammeSetUp."Shortcut Dimension 3 Code";
                        GenJnl."Shortcut Dimension 4 Code" := ProgrammeSetUp."Shortcut Dimension 4 Code";


                    end;
                end;
                GenJnl.Validate(GenJnl."Shortcut Dimension 1 Code");
                GenJnl.Validate(GenJnl."Shortcut Dimension 2 Code");
                GenJnl.Validate(GenJnl."Shortcut Dimension 3 Code");
                GenJnl.Validate(GenJnl."Shortcut Dimension 4 Code");

                GenJnl.Insert;


            end;
            // BKK...CDF
            if ACAStdPayments."Payment Mode" = ACAStdPayments."Payment Mode"::CDF then begin
                GenSetUp.TestField(GenSetUp."CDF Account");
                GenJnl.Init;
                GenJnl."Line No." := GenJnl."Line No." + 10000;
                GenJnl."Posting Date" := ACAStdPayments."Bank Slip Date";
                GenJnl."Document No." := "Last No";
                GenJnl."External Document No." := 'CDF';
                GenJnl.Validate(GenJnl."Document No.");
                GenJnl."Journal Template Name" := 'SALES';
                GenJnl."Journal Batch Name" := 'STUD PAY';
                GenJnl."Account Type" := GenJnl."Account Type"::Customer;
                GenJnl."Account No." := ACAStdPayments."Student No.";
                GenJnl.Amount := -ACAStdPayments."Amount to pay";
                GenJnl.Validate(GenJnl."Account No.");
                GenJnl.Validate(GenJnl.Amount);
                GenJnl.Description := ACAStdPayments."CDF Description";
                //GenJnl."Bal. Account Type":=GenJnl."Bal. Account Type"::"G/L Account";
                //GenJnl."Bal. Account No.":=;
                CReg.Reset;
                CReg.SetRange(CReg."Student No.", ACAStdPayments."Student No.");
                CReg.SetRange(CReg.Reversed, false);
                if CReg.Find('+') then begin
                    if ProgrammeSetUp.Get(CReg.Programmes) then begin
                        ProgrammeSetUp.TestField(ProgrammeSetUp."Department Code");
                        //ProgrammeSetUp.TESTFIELD(Cust."Global Dimension 1 Code");
                        GenJnl."Shortcut Dimension 1 Code" := Cust."Global Dimension 1 Code";
                        GenJnl."Shortcut Dimension 2 Code" := ProgrammeSetUp."Department Code";
                    end;
                end;
                GenJnl.Validate(GenJnl."Shortcut Dimension 1 Code");
                GenJnl.Validate(GenJnl."Shortcut Dimension 2 Code");
                GenJnl.Insert;

                GenJnl.Init;
                GenJnl."Line No." := GenJnl."Line No." + 10000;
                GenJnl."Posting Date" := ACAStdPayments."Bank Slip Date";
                GenJnl."Document No." := "Last No";
                GenJnl."External Document No." := 'CDF';
                GenJnl.Validate(GenJnl."Document No.");
                GenJnl."Journal Template Name" := 'SALES';
                GenJnl."Journal Batch Name" := 'STUD PAY';
                GenJnl."Account Type" := GenJnl."Account Type"::"G/L Account";
                GenJnl."Account No." := GenSetUp."CDF Account";
                GenJnl.Amount := ACAStdPayments."Amount to pay";
                GenJnl.Validate(GenJnl."Account No.");
                GenJnl.Validate(GenJnl.Amount);
                GenJnl.Description := ACAStdPayments."Student No.";

                CReg.Reset;
                CReg.SetRange(CReg."Student No.", ACAStdPayments."Student No.");
                CReg.SetRange(CReg.Reversed, false);
                if CReg.Find('+') then begin
                    if ProgrammeSetUp.Get(CReg.Programmes) then begin
                        ProgrammeSetUp.TestField(ProgrammeSetUp."Department Code");
                        //ProgrammeSetUp.TESTFIELD(Cust."Global Dimension 1 Code");
                        GenJnl."Shortcut Dimension 1 Code" := Cust."Global Dimension 1 Code";
                        GenJnl."Shortcut Dimension 2 Code" := ProgrammeSetUp."Shortcut Dimension 2 Code";
                        GenJnl."Shortcut Dimension 3 Code" := ProgrammeSetUp."Shortcut Dimension 3 Code";
                        GenJnl."Shortcut Dimension 4 Code" := ProgrammeSetUp."Shortcut Dimension 4 Code";


                    end;
                end;
                GenJnl.Validate(GenJnl."Shortcut Dimension 1 Code");
                GenJnl.Validate(GenJnl."Shortcut Dimension 2 Code");
                GenJnl.Validate(GenJnl."Shortcut Dimension 3 Code");
                GenJnl.Validate(GenJnl."Shortcut Dimension 4 Code");

                GenJnl.Insert;


            end;

            if ACAStdPayments."Payment Mode" = ACAStdPayments."Payment Mode"::HELB then begin
                GenSetUp.TestField(GenSetUp."Helb Account");
                GenJnl.Init;
                GenJnl."Line No." := GenJnl."Line No." + 10000;
                GenJnl."Posting Date" := ACAStdPayments."Bank Slip Date";
                GenJnl."Document No." := "Last No";
                GenJnl."External Document No." := '';
                GenJnl.Validate(GenJnl."Document No.");
                GenJnl."Journal Template Name" := 'SALES';
                GenJnl."Journal Batch Name" := 'STUD PAY';
                GenJnl."Account Type" := GenJnl."Account Type"::Customer;
                GenJnl."Account No." := ACAStdPayments."Student No.";
                GenJnl.Amount := -ACAStdPayments."Amount to pay";
                GenJnl.Validate(GenJnl."Account No.");
                GenJnl.Validate(GenJnl.Amount);
                GenJnl.Description := 'HELB';
                GenJnl."Bal. Account Type" := GenJnl."Bal. Account Type"::"G/L Account";
                GenJnl."Bal. Account No." := GenSetUp."Helb Account";
                CReg.Reset;
                CReg.SetRange(CReg."Student No.", ACAStdPayments."Student No.");
                CReg.SetRange(CReg.Reversed, false);
                if CReg.Find('+') then begin
                    if ProgrammeSetUp.Get(CReg.Programmes) then begin
                        GenJnl."Shortcut Dimension 2 Code" := ProgrammeSetUp."Department Code";
                    end;
                end;

                GenJnl.Validate(GenJnl."Shortcut Dimension 2 Code");
                GenJnl.Insert;


            end;

            //Post

            GenJnl.Reset;
            GenJnl.SetRange("Journal Template Name", 'SALES');
            GenJnl.SetRange("Journal Batch Name", 'STUD PAY');
            if GenJnl.Find('-') then begin

                CODEUNIT.Run(CODEUNIT::"Gen. Jnl.-Post B2", GenJnl);
                ACAStdPayments.Modify;
            end;

            // Hostel Allocations
            StudHostel.Reset;
            StudHostel.SetRange(StudHostel.Student, ACAStdPayments."Student No.");
            StudHostel.SetRange(StudHostel.Billed, false);
            if StudHostel.Find('-') then begin
                StudHostel.Billed := true;
                StudHostel.Modify;
                Receipts.Reset;
                if Receipts.Get("Last No") then begin
                    Receipts."Room No" := StudHostel."Space No";
                    Receipts.Modify;
                end;

                HostLedg.Reset;
                HostLedg.SetRange(HostLedg."Space No", StudHostel."Space No");
                HostLedg.SetRange(HostLedg."Hostel No", StudHostel."Hostel No");
                if HostLedg.Find('-') then begin
                    HostLedg.Status := HostLedg.Status::"Partially Occupied";
                    HostLedg.Modify;
                end;
            end;



            // // ACAStdPayments.

        end;
        payBillTrans.Reset();
        payBillTrans.SetRange(bankreference, TransactionNo);
        if payBillTrans.Find('-') then begin
            payBillTrans.Posted := true;
            payBillTrans.Modify();
        end;
    end;

}



