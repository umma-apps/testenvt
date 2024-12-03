report 40011 "Post Batch Billing 1"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Reports/SSR/Post Billing1.rdl';
    UsageCategory = ReportsAndAnalysis;

    dataset
    {
        dataitem("ACA-Course Registration"; "ACA-Course Registration")

        {
            //DataItemTableView=   where("Settlement Type"=field("Settlement Type"));
            CalcFields = "Total Billed", "Department Code";
            RequestFilterFields = "Student No.", "Settlement Type", Semester, Stage, "System Created", Programmes, Posted;
            column(USERID; USERID)
            {
            }
            column(DinvalName; DinvalName) { }
            column(ProgrameName; ProgrameName) { }
#pragma warning disable AL0667
            column(CurrReport_PAGENO; CurrReport.PAGENO)
#pragma warning restore AL0667
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }
            column(FORMAT_TODAY_0_4_; FORMAT(TODAY, 0, 4))
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Bill_StudentsCaption; Bill_StudentsCaptionLbl)
            {
            }
            column(Customer__No__Caption; Customer.FIELDCAPTION("No."))
            {
            }
            column(Customer_NameCaption; Customer.FIELDCAPTION(Name))
            {
            }
            column(Student_Name; "Student Name")
            {
            }
            column(Student_No; "Student No.")
            {
            }
            column(Total_Billed; "Total Billed")
            {
            }
            column(Course_Registration_Reg__Transacton_ID; "Reg. Transacton ID")
            {
            }
            column(Course_Registration_Student_No_; "Student No.")
            {
            }
            column(Course_Registration_Programme; Programmes)
            {
            }
            column(Course_Registration_Semester; Semester)
            {
            }
            column(Course_Registration_Register_for; "Register for")
            {
            }
            column(Course_Registration_Stage; Stage)
            {
            }
            column(Course_Registration_Unit; Unit)
            {
            }
            column(Course_Registration_Student_Type; "Student Type")
            {
            }
            column(Course_Registration_Entry_No_; "Entry No.")
            {
            }
            dataitem(Customer; Customer)
            {
                DataItemLink = "No." = FIELD("Student No.");
                DataItemTableView = SORTING("No.")
                                    WHERE(Blocked = FILTER(' '));
                column(Customer__No__; "No.")
                {
                }
                COLUMN(sn; sn)
                {
                }
                column(Customer_Name; Name)
                {
                }
                trigger OnPreDataItem()
                begin
                    UnrecognisedAmount := 0;
                end;

                trigger OnAfterGetRecord()
                begin
                    GenJnl.RESET;
                    GenJnl.SETRANGE("Journal Template Name", 'SALES');
                    GenJnl.SETRANGE("Journal Batch Name", 'STUD PAY');
                    GenJnl.DELETEALL;

                    SettlementType.GET("ACA-Course Registration"."Settlement Type");
                    SettlementType.TESTFIELD(SettlementType."Tuition G/L Account");



                    GenSetUp.GET();
                    GenSetUp.TESTFIELD(GenSetUp."Pre-Payment Account");

                    //Charge Student if not charged
                    StudentCharges.RESET;
                    StudentCharges.SETRANGE(StudentCharges."Student No.", "No.");
                    StudentCharges.SETRANGE(StudentCharges.Recognized, FALSE);
                    IF StudentCharges.FIND('-') THEN BEGIN

                        REPEAT
                            UnrecognisedAmount := UnrecognisedAmount + StudentCharges.Amount;

                            DueDate := StudentCharges.Date;
                            IF Sems.GET(StudentCharges.Semester) THEN BEGIN
                                IF Sems.From <> 0D THEN BEGIN
                                    IF Sems.From > DueDate THEN
                                        DueDate := Sems.From;
                                END;
                            END;


                            GenJnl.INIT;
                            GenJnl."Line No." := GenJnl."Line No." + 10000;


                            CReg.RESET;
                            CReg.SETCURRENTKEY(CReg."Reg. Transacton ID");
                            CReg.SETRANGE(CReg."Reg. Transacton ID", StudentCharges."Reg. Transacton ID");
                            CReg.SETRANGE(CReg."Student No.", StudentCharges."Student No.");
                            IF CReg.FIND('-') THEN BEGIN
                                IF CReg."Register for" = CReg."Register for"::Stage THEN BEGIN
                                    Stages.RESET;
                                    Stages.SETRANGE(Stages."Programme Code", CReg.Programmes);
                                    Stages.SETRANGE(Stages.Code, CReg.Stage);
                                    IF Stages.FIND('-') THEN BEGIN
                                        IF (Stages."Modules Registration" = TRUE) AND (Stages."Ignore No. Of Units" = FALSE) THEN BEGIN
                                            CReg.CALCFIELDS(CReg."Units Taken");
                                            IF CReg.Modules <> CReg."Units Taken" THEN
                                                ERROR('Units Taken must be equal to the no of modules registered for.');

                                        END;
                                    END;


                                    CReg.Posted := TRUE;
                                    CReg."Date Posted" := TODAY;
                                    CReg.MODIFY;
                                END;


                            end ELSE
                                IF (StudentCharges."Transaction Type" = StudentCharges."Transaction Type"::"Unit Fees") AND
            (StudentCharges.Charge = FALSE) THEN BEGIN
                                    GenJnl."Bal. Account No." := GenSetUp."Pre-Payment Account";

                                    CReg.RESET;
                                    CReg.SETCURRENTKEY(CReg."Reg. Transacton ID");
                                    CReg.SETRANGE(CReg."Reg. Transacton ID", StudentCharges."Reg. Transacton ID");
                                    IF CReg.FIND('-') THEN BEGIN
                                        CReg.Posted := TRUE;
                                        CReg.MODIFY;
                                    END;



                                END ELSE IF StudentCharges."Transaction Type" = StudentCharges."Transaction Type"::"Stage Exam Fees" THEN BEGIN
                                    IF ExamsByStage.GET(StudentCharges.Programme, StudentCharges.Stage, StudentCharges.Semester, StudentCharges.Code) THEN
                                        GenJnl."Bal. Account No." := ExamsByStage."G/L Account";

                                END ELSE IF StudentCharges."Transaction Type" = StudentCharges."Transaction Type"::"Unit Exam Fees" THEN BEGIN
                                    IF ExamsByUnit.GET(StudentCharges.Programme, StudentCharges.Stage, ExamsByUnit."Unit Code", StudentCharges.Semester,
                                    StudentCharges.Code) THEN
                                        GenJnl."Bal. Account No." := ExamsByUnit."G/L Account";

                                END ELSE IF (StudentCharges."Transaction Type" = StudentCharges."Transaction Type"::Charges) OR
                                            (StudentCharges.Charge = TRUE) THEN BEGIN
                                    IF Charges.GET(StudentCharges.Code) THEN
                                        GenJnl."Bal. Account No." := Charges."G/L Account";
                                END;


                            GenJnl.VALIDATE(GenJnl."Bal. Account No.");
                            GenJnl."Shortcut Dimension 1 Code" := Cust."Global Dimension 1 Code";
                            GenJnl.VALIDATE(GenJnl."Shortcut Dimension 1 Code");

                            GenJnl."Shortcut Dimension 2 Code" := Prog."Department Code";
                            GenJnl.VALIDATE(GenJnl."Shortcut Dimension 2 Code");
                            GenJnl."Due Date" := DueDate;
                            GenJnl.VALIDATE(GenJnl."Due Date");
                            IF StudentCharges."Recovery Priority" <> 0 THEN
                                GenJnl."Recovery Priority" := StudentCharges."Recovery Priority"
                            ELSE
                                GenJnl."Recovery Priority" := 25;
                            IF GenJnl.Amount > 0 THEN
                                GenJnl.INSERT;

                            //Distribute Money
                            IF StudentCharges."Tuition Fee" = TRUE THEN BEGIN
                                IF Stages.GET(StudentCharges.Programme, StudentCharges.Stage) THEN BEGIN
                                    IF (Stages."Distribution Full Time (%)" > 0) OR (Stages."Distribution Part Time (%)" > 0) THEN BEGIN
                                        Stages.TESTFIELD(Stages."Distribution Account");
                                        StudentCharges.TESTFIELD(StudentCharges.Distribution);
                                        IF Cust.GET("No.") THEN BEGIN
                                            CustPostGroup.GET(Cust."Customer Posting Group");

                                            GenJnl.INIT;
                                            GenJnl."Line No." := GenJnl."Line No." + 10000;
                                            GenJnl."Posting Date" := TODAY;//StudentCharges.Date;
                                            GenJnl."Document No." := StudentCharges."Transacton ID";
                                            //GenJnl."Document Type":=GenJnl."Document Type"::Payment;
                                            GenJnl.VALIDATE(GenJnl."Document No.");
                                            GenJnl."Journal Template Name" := 'SALES';
                                            GenJnl."Journal Batch Name" := 'STUD PAY';
                                            GenJnl."Account Type" := GenJnl."Account Type"::"G/L Account";
                                            //GenSetUp.TESTFIELD(GenSetUp."Pre-Payment Account");
                                            //IF "Settlement Type".GET(StudentCharges."Settlement Type") THEN
                                            GenJnl."Account No." := SettlementType."Tuition G/L Account";

                                            GenJnl.Amount := StudentCharges.Amount * (StudentCharges.Distribution / 100);
                                            GenJnl.VALIDATE(GenJnl."Account No.");
                                            GenJnl.VALIDATE(GenJnl.Amount);
                                            GenJnl.Description := 'Fee Distribution';
                                            GenJnl."Bal. Account Type" := GenJnl."Bal. Account Type"::"G/L Account";
                                            GenJnl."Bal. Account No." := Stages."Distribution Account";
                                            GenJnl.VALIDATE(GenJnl."Bal. Account No.");
                                            GenJnl."Shortcut Dimension 1 Code" := Cust."Global Dimension 1 Code";
                                            GenJnl.VALIDATE(GenJnl."Shortcut Dimension 1 Code");
                                            GenJnl."Shortcut Dimension 2 Code" := Prog."Department Code";
                                            GenJnl.VALIDATE(GenJnl."Shortcut Dimension 2 Code");
                                            IF GenJnl.Amount > 0 THEN
                                                GenJnl.INSERT;

                                        END;
                                    END;
                                END;
                            END ELSE BEGIN
                                //Distribute Charges
                                IF StudentCharges.Distribution > 0 THEN BEGIN
                                    StudentCharges.TESTFIELD(StudentCharges."Distribution Account");
                                    IF Charges.GET(StudentCharges.Code) THEN BEGIN
                                        Charges.TESTFIELD(Charges."G/L Account");
                                        GenJnl.INIT;
                                        GenJnl."Line No." := GenJnl."Line No." + 10000;
                                        GenJnl."Posting Date" := StudentCharges.Date;
                                        GenJnl."Document No." := StudentCharges."Transacton ID";
                                        GenJnl.VALIDATE(GenJnl."Document No.");
                                        GenJnl."Journal Template Name" := 'SALES';
                                        GenJnl."Journal Batch Name" := 'STUD PAY';
                                        GenJnl."Account Type" := GenJnl."Account Type"::"G/L Account";
                                        //if "Settlement Type".get()
                                        GenJnl."Account No." := StudentCharges."Distribution Account";
                                        GenJnl.Amount := StudentCharges.Amount * (StudentCharges.Distribution / 100);
                                        GenJnl.VALIDATE(GenJnl."Account No.");
                                        GenJnl.VALIDATE(GenJnl.Amount);
                                        GenJnl.Description := 'Fee Distribution';
                                        GenJnl."Bal. Account Type" := GenJnl."Bal. Account Type"::"G/L Account";
                                        GenJnl."Bal. Account No." := Charges."G/L Account";
                                        GenJnl.VALIDATE(GenJnl."Bal. Account No.");
                                        GenJnl."Shortcut Dimension 1 Code" := Cust."Global Dimension 1 Code";
                                        GenJnl.VALIDATE(GenJnl."Shortcut Dimension 1 Code");

                                        GenJnl."Shortcut Dimension 2 Code" := Prog."Department Code";
                                        GenJnl.VALIDATE(GenJnl."Shortcut Dimension 2 Code");
                                        IF GenJnl.Amount > 0 THEN
                                            GenJnl.INSERT;

                                    END;
                                END;
                            END;
                            //End Distribution


                            StudentCharges.Recognized := TRUE;
                            StudentCharges.MODIFY;

                        UNTIL StudentCharges.NEXT = 0;
                        GenJnl.INIT;
                        GenJnl."Line No." := GenJnl."Line No." + 10000;
                        CReg.RESET;
                        CReg.SETCURRENTKEY(CReg."Reg. Transacton ID");
                        CReg.SETRANGE(CReg."Reg. Transacton ID", StudentCharges."Reg. Transacton ID");
                        CReg.SETRANGE(CReg."Student No.", StudentCharges."Student No.");
                        //CReg.SETRANGE(CReg.Posted, false);
                        //CReg.SetRange(Semester, "Semester Code");
                        //CReg.SetRange(Semester, 'SEP-DEC24');
                        //CReg.SETRANGE(CReg.Posted, false);
                        IF CReg.FIND('-') THEN BEGIN
                            if CReg."Registration Date" <> 0D then
                                GenJnl."Posting Date" := CReg."Registration Date"
                            else
                                GenJnl."Posting Date" := TODAY;
                            GenJnl.Validate("Posting Date");

                            GenJnl.Description := 'fee for ' + "ACA-Course Registration".Semester;
                        end;

                        GenJnl."Document No." := "ACA-Course Registration"."Reg. Transacton ID";
                        GenJnl.VALIDATE(GenJnl."Document No.");
                        GenJnl."Journal Template Name" := 'SALES';
                        GenJnl."Journal Batch Name" := 'STUD PAY';
                        GenJnl."Account Type" := GenJnl."Account Type"::Customer;
                        GenJnl."Shortcut Dimension 1 Code" := Cust."Global Dimension 1 Code";
                        GenJnl.VALIDATE(GenJnl."Shortcut Dimension 1 Code");
                        GenJnl."Shortcut Dimension 2 Code" := Prog."Department Code";
                        GenJnl.VALIDATE(GenJnl."Shortcut Dimension 2 Code");
                        GenJnl."Shortcut Dimension 3 code" := Prog.Faculty;
                        GenJnl.Validate("Shortcut Dimension 3 code");
                        GenJnl."Shortcut Dimension 4 code" := Prog."Code";
                        GenJnl.Validate("Shortcut Dimension 4 code");

                        GenJnl.Amount := UnrecognisedAmount;
                        GenJnl.validate(amount);
                        //Error('%1', UnrecognisedAmount);
                        IF Cust.GET("No.") THEN BEGIN
                            IF Cust."Bill-to Customer No." <> '' THEN
                                GenJnl."Account No." := Cust."Bill-to Customer No."
                            ELSE
                                GenJnl."Account No." := "No.";

                        END;

                        IF ((GenJnl.Amount <> 0) and (GenJnl."Posting Date" <> 0D)) THEN
                            GenJnl.INSERT;
                        GenJnl.RESET;
                        GenJnl.SETRANGE("Journal Template Name", 'SALES');
                        GenJnl.SETRANGE("Journal Batch Name", 'STUD PAY');
                        IF GenJnl.FIND('-') THEN BEGIN
                            CODEUNIT.RUN(CODEUNIT::"Gen. Jnl.-Post B", GenJnl);
                        END;

                        //Post New



                        Cust.Status := Cust.Status::Current;
                        Cust.MODIFY;

                    END;


                end;



            }
            trigger OnAfterGetRecord()
            begin
                sn := sn + 1;
                IF Prog.GET("ACA-Course Registration".Programmes) THEN begin
                    Prog.TESTFIELD(Prog."Department Code");
                    ProgrameName := Prog.Description;

                end;

                // if Cust.GET("CourseRegistration"."Student No.") THEN
                //     "CourseRegistration".VALIDATE("CourseRegistration"."Settlement Type");
                // if DimVal.Get("CourseRegistration"."Department Code") then
                //     DinvalName := DimVal.Name;


            end;
        }
    }

    requestpage
    {

        layout
        {
            area(Content)
            {
                field("Settlement Type"; "Settlement Type")
                {
                    TableRelation = "ACA-Settlement Type".Code;
                }
                field(Semester; Semester)
                {
                    TableRelation = "ACA-Semesters".Code;
                }

            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        UnrecognisedAmount: Decimal;
        CReg: Record "ACA-Course Registration";
        SettlementTypeCode: Code[20];
        Semester: Code[20];

        StudentPayments: Record "ACA-Std Payments";
        StudentCharges: Record "ACA-Std Charges";
        ProgrameName: Text[250];
        GenJnl: Record 81;
        sn: Integer;
        DinvalName: Text[250];
        Stages: Record "ACA-Programme Stages";
        Units: Record "ACA-Units/Subjects";
        ExamsByStage: Record "ACA-Exams";
        ExamsByUnit: Record "ACA-Exams By Units";
        Charges: Record "ACA-Charge";
        Receipt: Record "ACA-Receipt";
        ReceiptItems: Record "ACA-Receipt Items";
        GenSetUp: Record "ACA-General Set-Up";
        StudentCharges2: Record "ACA-Std Charges";
        CourseReg: Record "ACA-Course Registration";
        CurrentBill: Decimal;
        GLEntry: Record 17;
        CustLed: Record 21;
        BankLedg: Record 271;
        DCustLedg: Record 379;
        PDate: Date;
        DocNo: Code[20];
        CustName: Text[250];
        VendLedg: Record 25;
        DVendLedg: Record 380;
        VATEntry: Record 254;
        //CourseRegistration: Record "ACA-Course Registration";
        StudCharges: Record "ACA-Std Charges";
        CustLed2: Record 21;
        Receipt2: Record "ACA-Receipt";
        Cont: Boolean;
        Cust: Record 18;

        CustPostGroup: Record 92;
        window: Dialog;
        GLPosting: Codeunit 12;
        Receipts: Record "ACA-Receipt";
        CustLedg: Record 21;
        DueDate: Date;

        Sems: Record "ACA-Semesters";
        SettlementType: Record "ACA-Settlement Type";
        Prog: Record "ACA-Programme";
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Bill_StudentsCaptionLbl: Label 'Bill Students';
        StudHost: Record "ACA-Students Hostel Rooms";
        "Semester Code": Code[20];
        "Settlement Type": Code[20];
        "Programme Code": code[20];
}


