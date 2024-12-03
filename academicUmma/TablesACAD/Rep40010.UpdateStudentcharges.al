report 40010 "Update Student charges"
{
    ApplicationArea = All;
    Caption = 'Update Student charges';
    UsageCategory = ReportsAndAnalysis;
    ProcessingOnly = true;

    dataset
    {
        dataitem(ACACourseRegistration; "ACA-Course Registration")

        {
            RequestFilterFields = "Student No.", "Academic Year", Semester, Stage, Unit, "Settlement Type", "Campus Code";
            trigger OnAfterGetRecord()
            begin
                CReg2.RESET;
                CReg2.SETRANGE(CReg2."Student No.", "Student No.");
                CReg2.SETRANGE(CReg2.Programmes, Programmes);
                CReg2.SETRANGE(CReg2.Stage, Stage);
                CReg2.SETRANGE(CReg2.Unit, Unit);
                CReg2.SETRANGE(CReg2."Student Type", "Student Type");
                CReg2.SETRANGE(CReg2.Semester, Semester);
                CReg2.SETRANGE(CReg2.Reversed, FALSE);
                CReg2.SETRANGE(CReg2."Register for", "Register for");
                IF CReg2.FIND('-') THEN BEGIN
                    REPEAT
                        IF "Reg. Transacton ID" <> CReg2."Reg. Transacton ID" THEN BEGIN
                            //ERROR('Student already registered for this course.');
                            //Audit Issue":=TRUE;
                            //MODIFY;
                            //
                        END;
                    UNTIL CReg2.NEXT = 0;


                END;




                SPrereq.RESET;
                SPrereq.SETRANGE(SPrereq."Reg. Transaction ID", "Reg. Transacton ID");
                SPrereq.SETRANGE(SPrereq.Mandatory, TRUE);
                SPrereq.SETRANGE(SPrereq.Approved, FALSE);
                IF SPrereq.FIND('-') THEN
                    ERROR('Student has not meet the requirements of this course.');

                IF "Register for" = "Register for"::Stage THEN BEGIN
                    Stages.RESET;
                    Stages.SETRANGE(Stages."Programme Code", Programmes);
                    Stages.SETRANGE(Stages.Code, Stage);
                    IF Stages.FIND('-') THEN BEGIN
                        IF Stages."Modules Registration" = TRUE THEN BEGIN
                            CALCFIELDS("Units Taken");
                            Modules := "Units Taken";
                            IF Modules < 1 THEN
                                ERROR('You must specify the number of modules being taken.');
                        END ELSE
                            Modules := 0;
                    END;
                END;


                StudentCharges.RESET;
                StudentCharges.SETRANGE(StudentCharges."Student No.", "Student No.");
                StudentCharges.SETRANGE(StudentCharges."Reg. Transacton ID", "Reg. Transacton ID");

                IF StudentCharges.FIND('-') THEN
                    StudentCharges.DELETEALL;

                //PKK - Old student
                OldStud := FALSE;
                IF Stage <> 'Y1S1' THEN
                    OldStud := TRUE;
                //PKK

                IF Posted = FALSE THEN BEGIN

                    IF "First Time Student" = TRUE THEN BEGIN
                        /*
                        StudentCharges.RESET;
                        StudentCharges.SETRANGE(StudentCharges."Student No.","Student No.");
                        IF NOT StudentCharges.FIND('-') THEN BEGIN
                        */
                        NewStudentCharges.RESET;
                        NewStudentCharges.SETRANGE(NewStudentCharges."Programme Code", Programmes);
                        NewStudentCharges.SETRANGE(NewStudentCharges."First Time Students", TRUE);

                        IF NewStudentCharges.FIND('-') THEN BEGIN
                            REPEAT
                            /*StudentCharges.INIT;
                            StudentCharges.Programme:=Programme;
                            StudentCharges.Stage:=Stage;
                            StudentCharges.Semester:=Semester;
                            StudentCharges."Student No.":="Student No.";
                            StudentCharges."Reg. Transacton ID":="Reg. Transacton ID";
                            StudentCharges."Transaction Type":=StudentCharges."Transaction Type"::"Stage Fees";
                            StudentCharges.Date:="Registration Date";
                            StudentCharges.Code:=NewStudentCharges.Code;
                            StudentCharges.Description:=NewStudentCharges.Description;
                            StudentCharges.Amount:=NewStudentCharges.Amount;
                            StudentCharges."Recovered First":=NewStudentCharges."Recovered First";
                            StudentCharges."Recovery Priority":=NewStudentCharges."Recovery Priority";
                            StudentCharges.Distribution:=NewStudentCharges."Distribution (%)";
                            StudentCharges."Distribution Account":=NewStudentCharges."Distribution Account";
                            StudentCharges.Charge:=TRUE;
                            StudentCharges."Transacton ID":='';
                            StudentCharges.VALIDATE(StudentCharges."Transacton ID");
                            StudentCharges.INSERT;*/

                            UNTIL NewStudentCharges.NEXT = 0
                            //END;
                        END;
                    END;


                    NewStudentCharges.RESET;
                    NewStudentCharges.SETRANGE(NewStudentCharges."Programme Code", Programmes);
                    NewStudentCharges.SETRANGE(NewStudentCharges."First Time Students", FALSE);
                    IF NewStudentCharges.FIND('-') THEN BEGIN
                        REPEAT
                        /*StudentCharges.INIT;
                        StudentCharges.Programme:=Programme;
                        StudentCharges.Stage:=Stage;
                        StudentCharges.Semester:=Semester;
                        StudentCharges."Student No.":="Student No.";
                        StudentCharges."Reg. Transacton ID":="Reg. Transacton ID";
                        StudentCharges."Transaction Type":=StudentCharges."Transaction Type"::"Stage Fees";
                        StudentCharges.Date:="Registration Date";
                        StudentCharges.Code:=NewStudentCharges.Code;
                        StudentCharges.Description:=NewStudentCharges.Description;
                        StudentCharges.Amount:=NewStudentCharges.Amount;
                        StudentCharges."Recovered First":=NewStudentCharges."Recovered First";
                        StudentCharges."Recovery Priority":=NewStudentCharges."Recovery Priority";
                        StudentCharges.Distribution:=NewStudentCharges."Distribution (%)";
                        StudentCharges."Distribution Account":=NewStudentCharges."Distribution Account";
                        StudentCharges.Charge:=TRUE;
                        StudentCharges."Transacton ID":='';
                        StudentCharges.VALIDATE(StudentCharges."Transacton ID");*/
                        //StudentCharges.INSERT;

                        UNTIL NewStudentCharges.NEXT = 0
                    END;




                    TotalUnits := 0;
                    if ACACourseRegistration."Settlement Type" = 'FT(UBB)' then
                        ACACourseRegistration."Register for" := "Register for"::"Unit/Subject" else
                        if ACACourseRegistration."Settlement Type" = 'PT(UBB)' then
                            ACACourseRegistration."Register for" := "Register for"::"Unit/Subject" else
                            if ACACourseRegistration."Settlement Type" = 'ODEL(UBB)' then
                                ACACourseRegistration."Register for" := "Register for"::"Unit/Subject";



                    IF ("Settlement Type" <> '') and ("Settlement Type" <> 'units') THEN BEGIN
                        IF "Register for" = "Register for"::Stage THEN BEGIN

                            FeeByStage.RESET;
                            FeeByStage.SETRANGE(FeeByStage."Programme Code", Programmes);
                            FeeByStage.SETRANGE(FeeByStage."Stage Code", Stage);
                            FeeByStage.SETRANGE(FeeByStage."Settlemet Type", "Settlement Type");
                            //FeeByStage.SetRange(FeeByStage.Campus, "Campus Code");
                            IF not FeeByStage.FIND('-') THEN BEGIN
                                //ERROR('I made it here');
                                //ERROR('No fees structure defined for the settlement type!.Kindly Contact Administrator ' + Programmes);
                                //"Audit Issue":=TRUE;
                                //MODIFY;
                                //
                                //"Settlement Type":='';
                            END
                            ELSE BEGIN



                                IF FeeByStage.FIND('-') THEN BEGIN

                                    //TotalCost:=0;
                                    REPEAT
                                        TotalCost := 0;
                                        TotalCost := TotalCost + FeeByStage."Break Down";
                                        IF Modules > 0 THEN
                                            TotalCost := TotalCost * Modules;

                                        StudentCharges.INIT;
                                        StudentCharges.Programme := Programmes;
                                        StudentCharges.Stage := Stage;
                                        StudentCharges.Semester := Semester;
                                        StudentCharges."Student No." := "Student No.";
                                        StudentCharges."Reg. Transacton ID" := "Reg. Transacton ID";
                                        StudentCharges."Transaction Type" := StudentCharges."Transaction Type"::"Stage Fees";
                                        StudentCharges.Date := "Registration Date";
                                        StudentCharges.Code := Stage;
                                        IF SettlementType.GET("Settlement Type") THEN BEGIN
                                            StudentCharges."G/L Account No." := SettlementType."Tuition G/L Account";
                                            IF SettlementType.Installments = TRUE THEN BEGIN

                                                IF FeeByStage."Seq." = 0 THEN
                                                    StudentCharges.Description := 'Fees for' + ' ' + Programmes + '-' + Stage + '-' + 'Inst 0'
                                                ELSE
                                                    IF FeeByStage."Seq." = 1 THEN
                                                        StudentCharges.Description := 'Fees for' + ' ' + Programmes + '-' + Stage + '-' + 'Inst 1'
                                                    ELSE
                                                        IF FeeByStage."Seq." = 2 THEN
                                                            StudentCharges.Description := 'Fees for' + ' ' + Programmes + '-' + Stage + '-' + 'Inst 2'
                                                        ELSE
                                                            IF FeeByStage."Seq." = 3 THEN
                                                                StudentCharges.Description := 'Fees for' + ' ' + Programmes + '-' + Stage + '-' + 'Inst 3'
                                                            ELSE
                                                                IF FeeByStage."Seq." = 4 THEN
                                                                    StudentCharges.Description := 'Fees for' + ' ' + Programmes + '-' + Stage + '-' + 'Inst 4'
                                                                ELSE
                                                                    StudentCharges.Description := 'Fees for' + ' ' + Programmes + '-' + Stage + '-' + 'Inst';

                                                StudentCharges.Distribution := Stages."Distribution Part Time (%)";
                                            END ELSE BEGIN
                                                StudentCharges.Description := 'Fees for' + ' ' + Programmes + '-' + Stage;
                                                StudentCharges.Distribution := Stages."Distribution Full Time (%)";
                                            END;
                                        END ELSE BEGIN
                                            StudentCharges.Description := 'Fees for' + ' ' + Programmes + '-' + Stage;
                                        END;

                                        CALCFIELDS("Total Exempted");

                                        //Exemptions
                                        IF "Total Exempted" > 0 THEN BEGIN
                                            IF TotalUnits > 0 THEN BEGIN
                                                TotalCost := (TotalUnits - "Total Exempted") * (TotalCost / TotalUnits);
                                            END;
                                        END;

                                        ///////////////////////
                                        //Recalculate fee based on units
                                        IF Modules > 0 THEN BEGIN
                                            TotalCost := 0;

                                            PStage.RESET;
                                            PStage.SETRANGE(PStage."Programme Code", Programmes);
                                            PStage.SETFILTER(PStage."Student No.", "Student No.");
                                            PStage.SETFILTER(PStage."Reg. ID", "Reg. Transacton ID");
                                            IF PStage.FIND('-') THEN BEGIN
                                                REPEAT
                                                    PStage.CALCFIELDS(PStage."Units Taken");

                                                    IF PStage."Units Taken" > 0 THEN BEGIN
                                                        SFee.RESET;
                                                        SFee.SETRANGE(SFee."Programme Code", Programmes);
                                                        SFee.SETRANGE(SFee."Stage Code", PStage.Code);
                                                        SFee.SETRANGE(SFee."Settlemet Type", "Settlement Type");
                                                        //SFee.SETRANGE(SFee.Semester,Semester);
                                                        //SFee.SETRANGE(SFee."Student Type","Student Type");
                                                        IF SFee.FIND('-') THEN BEGIN
                                                            TotalCost := TotalCost + (SFee."Break Down" * PStage."Units Taken");
                                                        end
                                                        // ELSE
                                                        //     ERROR('No fee structure defined for %1.', PStage.Code)

                                                    END;

                                                UNTIL PStage.NEXT = 0;
                                            END;
                                        END;
                                        ///////////////////////


                                        StudentCharges.Amount := TotalCost;
                                        StudentCharges."Tuition Fee" := TRUE;
                                        StudentCharges."Full Tuition Fee" := TotalCost;
                                        StudentCharges."Transacton ID" := '';
                                        StudentCharges."Recovery Priority" := 20;
                                        StudentCharges.VALIDATE(StudentCharges."Transacton ID");
                                        StudentCharges.INSERT;

                                    UNTIL FeeByStage.NEXT = 0;


                                    StageCharges.RESET;
                                    StageCharges.SETRANGE(StageCharges."Programme Code", Programmes);
                                    StageCharges.SETRANGE(StageCharges."Stage Code", Stage);
                                    //StageCharges.SETRANGE(StageCharges."Student Type",StageCharges."Student Type"::" ");
                                    StageCharges.SETRANGE(StageCharges."Settlement Type", "Settlement Type");
                                    IF StageCharges.FIND('-') THEN BEGIN
                                        REPEAT
                                            /*IF StageCharges.Semester = '' THEN BEGIN
                                            StudentCharges.INIT;
                                            StudentCharges.Programme:=Programme;
                                            StudentCharges.Stage:=Stage;
                                            StudentCharges.Semester:=Semester;
                                            StudentCharges."Student No.":="Student No.";
                                            StudentCharges."Reg. Transacton ID":="Reg. Transacton ID";
                                            StudentCharges."Transaction Type":=StudentCharges."Transaction Type"::"Stage Fees";
                                            StudentCharges.Date:="Registration Date";
                                            StudentCharges.Code:=StageCharges.Code;
                                            StudentCharges.Description:=StageCharges.Description;
                                            StudentCharges.Amount:=StageCharges.Amount;
                                            StudentCharges."Recovered First":=StageCharges."Recovered First";
                                            StudentCharges."Recovery Priority":=StageCharges."Recovery Priority";
                                            StudentCharges.Distribution:=StageCharges."Distribution (%)";
                                            StudentCharges."Distribution Account":=StageCharges."Distribution Account";
                                            StudentCharges."Transacton ID":='';
                                            StudentCharges.Charge:=TRUE;
                                            StudentCharges.VALIDATE(StudentCharges."Transacton ID");
                                            StudentCharges.INSERT;

                                            END ELSE BEGIN
                                            IF StageCharges.Semester = Semester THEN BEGIN*/
                                            StudentCharges.INIT;
                                            StudentCharges.Programme := Programmes;
                                            StudentCharges.Stage := Stage;
                                            StudentCharges.Semester := Semester;
                                            StudentCharges."Student No." := "Student No.";
                                            StudentCharges."Reg. Transacton ID" := "Reg. Transacton ID";
                                            StudentCharges."Transaction Type" := StudentCharges."Transaction Type"::"Stage Fees";
                                            StudentCharges.Date := "Registration Date";
                                            StudentCharges.Code := StageCharges.Code;
                                            charges.reset;
                                            charges.SetRange(Code, StageCharges.Code);
                                            if charges.FindFirst() then begin
                                                StudentCharges."G/L Account No." := charges."G/L Account";
                                            end;
                                            StudentCharges.VALIDATE(StudentCharges."Transacton ID");
                                            StudentCharges.INSERT;
                                            StudentCharges.Description := StageCharges.Description;
                                            StudentCharges.Amount := StageCharges.Amount;
                                            StudentCharges."Recovered First" := StageCharges."Recovered First";
                                            StudentCharges."Recovery Priority" := StageCharges."Recovery Priority";
                                            StudentCharges.Distribution := StageCharges."Distribution (%)";
                                            StudentCharges."Distribution Account" := StageCharges."Distribution Account";
                                            StudentCharges."Transacton ID" := '';
                                            StudentCharges.Charge := TRUE;

                                            StudentCharges.VALIDATE(StudentCharges."Transacton ID");
                                            StudentCharges.INSERT;
                                        //END;
                                        //END;

                                        UNTIL StageCharges.NEXT = 0;

                                    END;
                                    /*
                                    IF "Student Type" = "Student Type"::"Full Time" THEN BEGIN
                                    ///////Charges by student type - Full Time
                                    StageCharges.RESET;
                                    StageCharges.SETRANGE(StageCharges."Programme Code",Programme);
                                    StageCharges.SETRANGE(StageCharges."Stage Code",Stage);
                                    //StageCharges.SETRANGE(StageCharges."Student Type",StageCharges."Student Type"::"Full Time");
                                    StageCharges.SETRANGE(StageCharges."Settlement Type","Settlement Type");
                                    IF StageCharges.FIND('-') THEN BEGIN
                                    REPEAT
                                    IF StageCharges.Semester = '' THEN BEGIN
                                    StudentCharges.INIT;
                                    StudentCharges.Programme:=Programme;
                                    StudentCharges.Stage:=Stage;
                                    StudentCharges.Semester:=Semester;
                                    StudentCharges."Student No.":="Student No.";
                                    StudentCharges."Reg. Transacton ID":="Reg. Transacton ID";
                                    StudentCharges."Transaction Type":=StudentCharges."Transaction Type"::"Stage Fees";
                                    StudentCharges.Date:="Registration Date";
                                    StudentCharges.Code:=StageCharges.Code;
                                    StudentCharges.Description:=StageCharges.Description;
                                    StudentCharges.Amount:=StageCharges.Amount;
                                    StudentCharges."Recovered First":=StageCharges."Recovered First";
                                    StudentCharges."Recovery Priority":=StageCharges."Recovery Priority";
                                    StudentCharges.Distribution:=StageCharges."Distribution (%)";
                                    StudentCharges."Distribution Account":=StageCharges."Distribution Account";
                                    StudentCharges."Transacton ID":='';
                                    StudentCharges.Charge:=TRUE;
                                    StudentCharges.VALIDATE(StudentCharges."Transacton ID");
                                    StudentCharges.INSERT;

                                    END ELSE BEGIN
                                    IF StageCharges.Semester = Semester THEN BEGIN
                                    StudentCharges.INIT;
                                    StudentCharges.Programme:=Programme;
                                    StudentCharges.Stage:=Stage;
                                    StudentCharges.Semester:=Semester;
                                    StudentCharges."Student No.":="Student No.";
                                    StudentCharges."Reg. Transacton ID":="Reg. Transacton ID";
                                    StudentCharges."Transaction Type":=StudentCharges."Transaction Type"::"Stage Fees";
                                    StudentCharges.Date:="Registration Date";
                                    StudentCharges.Code:=StageCharges.Code;
                                    StudentCharges.Description:=StageCharges.Description;
                                    StudentCharges.Amount:=StageCharges.Amount;
                                    StudentCharges."Recovered First":=StageCharges."Recovered First";
                                    StudentCharges."Recovery Priority":=StageCharges."Recovery Priority";
                                    StudentCharges.Distribution:=StageCharges."Distribution (%)";
                                    StudentCharges."Distribution Account":=StageCharges."Distribution Account";
                                    StudentCharges."Transacton ID":='';
                                    StudentCharges.Charge:=TRUE;
                                    StudentCharges.VALIDATE(StudentCharges."Transacton ID");
                                    StudentCharges.INSERT;
                                    END;
                                    END;

                                    UNTIL StageCharges.NEXT = 0;

                                    END;

                                    END ELSE BEGIN
                                    ///////Charges by student type - Part Time
                                    StageCharges.RESET;
                                    StageCharges.SETRANGE(StageCharges."Programme Code",Programme);
                                    StageCharges.SETRANGE(StageCharges."Stage Code",Stage);
                                    //StageCharges.SETRANGE(StageCharges."Student Type",StageCharges."Student Type"::"Part Time");
                                    StageCharges.SETRANGE(StageCharges."Settlement Type","Settlement Type");
                                    IF StageCharges.FIND('-') THEN BEGIN
                                    REPEAT
                                    IF StageCharges.Semester = '' THEN BEGIN
                                    StudentCharges.INIT;
                                    StudentCharges.Programme:=Programme;
                                    StudentCharges.Stage:=Stage;
                                    StudentCharges.Semester:=Semester;
                                    StudentCharges."Student No.":="Student No.";
                                    StudentCharges."Reg. Transacton ID":="Reg. Transacton ID";
                                    StudentCharges."Transaction Type":=StudentCharges."Transaction Type"::"Stage Fees";
                                    StudentCharges.Date:="Registration Date";
                                    StudentCharges.Code:=StageCharges.Code;
                                    StudentCharges.Description:=StageCharges.Description;
                                    StudentCharges.Amount:=StageCharges.Amount;
                                    StudentCharges."Recovered First":=StageCharges."Recovered First";
                                    StudentCharges."Recovery Priority":=StageCharges."Recovery Priority";
                                    StudentCharges.Distribution:=StageCharges."Distribution (%)";
                                    StudentCharges."Distribution Account":=StageCharges."Distribution Account";
                                    StudentCharges."Transacton ID":='';
                                    StudentCharges.Charge:=TRUE;
                                    StudentCharges.VALIDATE(StudentCharges."Transacton ID");
                                    StudentCharges.INSERT;

                                    END ELSE BEGIN
                                    IF StageCharges.Semester = Semester THEN BEGIN
                                    StudentCharges.INIT;
                                    StudentCharges.Programme:=Programme;
                                    StudentCharges.Stage:=Stage;
                                    StudentCharges.Semester:=Semester;
                                    StudentCharges."Student No.":="Student No.";
                                    StudentCharges."Reg. Transacton ID":="Reg. Transacton ID";
                                    StudentCharges."Transaction Type":=StudentCharges."Transaction Type"::"Stage Fees";
                                    StudentCharges.Date:="Registration Date";
                                    StudentCharges.Code:=StageCharges.Code;
                                    StudentCharges.Description:=StageCharges.Description;
                                    StudentCharges.Amount:=StageCharges.Amount;
                                    StudentCharges."Recovered First":=StageCharges."Recovered First";
                                    StudentCharges."Recovery Priority":=StageCharges."Recovery Priority";
                                    StudentCharges.Distribution:=StageCharges."Distribution (%)";
                                    StudentCharges."Distribution Account":=StageCharges."Distribution Account";
                                    StudentCharges."Transacton ID":='';
                                    StudentCharges.Charge:=TRUE;
                                    StudentCharges.VALIDATE(StudentCharges."Transacton ID");
                                    StudentCharges.INSERT;
                                    END;
                                    END;

                                    UNTIL StageCharges.NEXT = 0;

                                    END;
                                    END;
                                    */

                                END;

                            END

                        END;

                        IF "Register for" = "Register for"::"Unit/Subject" THEN BEGIN
                            // StudentUnits.Reset();
                            // StudentUnits.SetRange("Student No.", "Student No.");
                            // StudentUnits.SetRange(Stage, "Stage Filter");
                            // StudentUnits.SetRange("Register for", StudentUnits."Register for"::"Unit/Subject");
                            TotalCost := 0;
                            StudentUnits.Reset();
                            StudentUnits.SetRange("Student No.", ACACourseRegistration."Student No.");
                            StudentUnits.SetRange("Academic Year", ACACourseRegistration."Academic Year");
                            StudentUnits.SetRange(Semester, ACACourseRegistration.Semester);
                            StudentUnits.SetRange(Stage, ACACourseRegistration.Stage);
                            //StudentUnits.SetRange("Reg. Transacton ID", ACACourseRegistration."Reg. Transacton ID");
                            if StudentUnits.Find('-') then begin
                                repeat
                                    FeeByUnit.Reset();
                                    FeeByUnit.SetRange("Unit Code", StudentUnits.Unit);
                                    FeeByUnit.SetRange("Programme Code", StudentUnits.Programme);
                                    FeeByUnit.SetRange("Settlemet Type", ACACourseRegistration."Settlement Type");
                                    FeeByUnit.SetRange(Campus, ACACourseRegistration."Campus Code");
                                    if FeeByUnit.Find('-') then begin
                                        //Message(Format(FeeByUnit."Break Down"));
                                        TotalCost := TotalCost + FeeByUnit."Break Down";
                                    end;
                                until StudentUnits.Next() = 0;
                                //Error(Format(TotalCost));
                            end;

                            // FeeByUnit.RESET;
                            // FeeByUnit.SETRANGE(FeeByUnit."Programme Code", Programmes);

                            // //FeeByUnit.SETRANGE(FeeByUnit."Stage Code", Stage);
                            // FeeByUnit.SETRANGE(FeeByUnit."Unit Code", Unit);
                            // //FeeByUnit.SETRANGE(FeeByUnit.Semester,Semester);
                            // FeeByUnit.SETRANGE(FeeByUnit."Settlemet Type", "Settlement Type");
                            // //FeeByUnit.SETRANGE(FeeByUnit."Student Type","Student Type");
                            // IF NOT FeeByUnit.FIND('-') THEN BEGIN
                            //     ERROR('No fees structure defined for the settlement type. !' + Stage);
                            //     "Settlement Type" := '';
                            // END
                            // ELSE BEGIN
                            //Insert Units
                            /*
                            StudentUnits.INIT;
                            StudentUnits."Reg. Transacton ID":="Reg. Transacton ID";
                            StudentUnits."Student No.":="Student No.";
                            StudentUnits.Programme:=Programme;
                            StudentUnits.Stage:=Stage;
                            StudentUnits.Unit:=Unit;
                            StudentUnits.Semester:=Semester;
                            StudentUnits."Register for":="Register for";
                            //IF Stages."Modules Registration" = FALSE THEN
                            StudentUnits.Taken:=TRUE;
                            //StudentUnits.INSERT;
                            */

                            // REPEAT
                            //     TotalCost := TotalCost + FeeByUnit."Break Down";
                            // UNTIL FeeByUnit.NEXT = 0;

                            StudentCharges.INIT;
                            StudentCharges.Programme := Programmes;
                            StudentCharges.Stage := Stage;
                            StudentCharges.Unit := Unit;
                            StudentCharges.Semester := Semester;
                            StudentCharges."Student No." := "Student No.";
                            StudentCharges."Reg. Transacton ID" := "Reg. Transacton ID";
                            StudentCharges."Transaction Type" := StudentCharges."Transaction Type"::"Unit Fees";
                            StudentCharges.Date := "Registration Date";
                            StudentCharges.Code := ACACourseRegistration.Stage;
                            StudentCharges.Description := 'Fees for' + ' ' + Programmes + '-' + Stage + '-' + Unit;
                            StudentCharges.Amount := TotalCost;
                            StudentCharges."Tuition Fee" := TRUE;
                            StudentCharges."Full Tuition Fee" := TotalCost;
                            StudentCharges."Transacton ID" := '';
                            StudentCharges."Recovery Priority" := 20;
                            StudentCharges.VALIDATE(StudentCharges."Transacton ID");
                            StudentCharges.INSERT;




                            // Prog.GET(Programmes);
                            // Prog.TESTFIELD(Prog."Unit Fee");
                            // CALCFIELDS("Units Taken");
                            // IF "Units Taken" = 0 THEN ERROR('Please select the units to be billed');
                            // StudentCharges.INIT;
                            // StudentCharges.Programme := Programmes;
                            // StudentCharges.Stage := Stage;
                            // StudentCharges.Unit := Unit;
                            // StudentCharges.Semester := Semester;
                            // StudentCharges."Student No." := "Student No.";
                            // StudentCharges."Reg. Transacton ID" := "Reg. Transacton ID";
                            // StudentCharges."Transaction Type" := StudentCharges."Transaction Type"::"Unit Fees";
                            // StudentCharges.Date := "Registration Date";
                            // StudentCharges.Code := Unit;
                            // StudentCharges.Description := 'Fees for' + ' ' + Programmes + '-' + Stage + '-' + FORMAT("Units Taken") + 'Units';
                            // StudentCharges.Amount := Prog."Unit Fee" * "Units Taken";
                            // StudentCharges."Tuition Fee" := TRUE;
                            // StudentCharges."Full Tuition Fee":=TotalCost;
                            // StudentCharges."Transacton ID" := '';
                            // StudentCharges."Recovery Priority" := 20;
                            // StudentCharges.VALIDATE(StudentCharges."Transacton ID");
                            // StudentCharges.INSERT;

                            // END;
                        end;


                    END;


                end;

            end;
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }
    var
        CReg2: record "ACA-Course Registration";

        SPrereq: Record 61547;
        Stages: Record 61516;
        ProgStages: Record 61516;
        StudentUnits: Record 61549;
        StageUnits: Record 61517;
        EStageUnits: Record 61591;
        StageCharges: Record 61533;
        coReg2: Record 61532;
        coReg1: Record 61532;
        charges: record "ACA-Charge";
        SettlementType: record "ACA-Settlement Type";
        acadYears: Record 61382;
        FeeByStage: Record 61523;
        FeeByUnit: Record 61524;
        TotalCost: Decimal;
        StudentCharges: Record "ACA-Std Charges";
        NewStudentCharges: Record 61543;
        RecFound: Boolean;
        CoursePrerequisite: Record 61546;
        Custs: Record 18;
        UnitType: Text[100];
        TotalUnits: Integer;
        OldStud: Boolean;
        StudUnits: Record 61549;
        PStage: Record 61516;
        SFee: Record 61523;


}
