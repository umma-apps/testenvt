table 61517 "ACA-Units/Subjects"
{
    DrillDownPageID = 68743;
    LookupPageID = 68743;

    fields
    {
        field(1; "Programme Code"; Code[20])
        {
            NotBlank = false;
            TableRelation = "ACA-Programme".Code;
        }
        field(2; "Stage Code"; Code[20])
        {
            NotBlank = false;
        }
        field(3; "Code"; Code[20])
        {
            Caption = 'Unit Code';
            NotBlank = true;
            //TableRelation = "ACA-Units Master Table"."Unit Code";
            // trigger OnValidate()
            // begin
            //     unitsMatsr.Reset();
            //     unitsMatsr.SetRange(unitsMatsr."Unit Code", "Code");
            //     if unitsMatsr.Find('-') then begin
            //         Desription := unitsMatsr."Unit Name";
            //         "Unit Base Code" := unitsMatsr."Unit Base Code";
            //         "Unit Base Title" := unitsMatsr."Unit Base Title";
            //         "Credit Hours" := unitsMatsr."Credit Hours";
            //         Department := unitsMatsr."Department Code";
            //     end
            // end;

            // trigger OnValidate()
            // begin
            //     UnitsSubj.RESET;
            //     UnitsSubj.SETRANGE(UnitsSubj.Code, Code);
            //     UnitsSubj.SETRANGE(UnitsSubj."Programme Code", "Programme Code");
            //     UnitsSubj.SETRANGE(UnitsSubj."Stage Code", "Stage Code");
            //     IF UnitsSubj.FIND('-') THEN BEGIN
            //         REPEAT
            //         // IF UnitsSubj."Entry No"<>"Entry No" THEN ERROR('The selected unit already exists in '+UnitsSubj."Programme Code"+' - '+
            //         //  UnitsSubj."Stage Code");
            //         UNTIL UnitsSubj.NEXT = 0;
            //     END;
            // end;
        }
        field(4; Desription; Text[150])
        {

            // trigger OnValidate()
            // begin
            //     // "New Unit":=FALSE;
            // end;
        }
        field(5; "Credit Hours"; Decimal)
        {
        }
        field(6; Amount; Decimal)
        {
        }
        field(7; "G/L Account"; Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(8; Department; Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(9; Remarks; Text[150])
        {
        }
        field(10; "Programme Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "ACA-Programme".Code;
        }
        field(11; "Stage Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "ACA-Programme Stages".Code WHERE("Programme Code" = FIELD("Programme Filter"));
        }
        field(12; "Unit Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "ACA-Units/Subjects".Code WHERE("Programme Code" = FIELD("Programme Filter"),
                                                           "Stage Code" = FIELD("Stage Filter"));
        }
        field(13; "Semester Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "ACA-Programme Semesters".Semester WHERE("Programme Code" = FIELD("Programme Filter"));
        }
        field(14; "Lecture Room Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "ACA-Lecture Rooms".Code;
        }
        field(15; "Total Income"; Decimal)
        {
            CalcFormula = Sum("ACA-Std Charges"."Amount Paid" WHERE(Programme = FIELD("Programme Code"),
                                                                     Stage = FIELD("Stage Code"),
                                                                     Unit = FIELD(Code),
                                                                     Semester = FIELD("Semester Filter")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(16; "Students Registered"; Integer)
        {
            CalcFormula = Count("ACA-Student Units" WHERE(Programme = FIELD("Programme Code"),
                                                           Stage = FIELD("Stage Code"),
                                                           Unit = FIELD(Code),
                                                           Semester = FIELD("Semester Filter"),
                                                           Taken = CONST(true)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(17; "Unit Type"; Option)
        {
            OptionCaption = 'Core,Elective,Required';
            OptionMembers = Core,Elective,Required;
        }
        field(18; "Class Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "ACA-Course Classes".Code WHERE(Programmes = FIELD("Programme Filter"),
                                                             Stage = FIELD("Stage Filter"));
        }
        field(19; "Student Type"; Option)
        {
            OptionCaption = ' ,Full Time,Part Time,Distance Learning';
            OptionMembers = " ","Full Time","Part Time","Distance Learning";
        }
        field(20; "Day Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "ACA-Day Of Week".Day;
        }
        field(21; "Unit Class Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "ACA-Units Classes".Code WHERE(Programmes = FIELD("Programme Code"),
                                                            Stage = FIELD("Stage Code"));
        }
        field(22; Allocation; Decimal)
        {
            CalcFormula = Sum("ACA-Time Table"."No. Of Hours" WHERE(Programme = FIELD("Programme Code"),
                                                                     Stage = FIELD("Stage Code"),
                                                                     Unit = FIELD(Code),
                                                                     "Day of Week" = FIELD("Day Filter"),
                                                                     Period = FIELD("Lesson Filter")));
            FieldClass = FlowField;
        }
        field(23; "Exam Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "ACA-Exams".Code WHERE("Programme Code" = FIELD("Programme Filter"),
                                                  "Stage Code" = FIELD("Stage Filter"),
                                                  Semester = FIELD("Semester Filter"));
        }
        field(24; "Exam Date"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(25; Tested; Boolean)
        {
        }
        field(50; Prerequisite; Code[20])
        {
            TableRelation = "ACA-Units/Subjects".Code WHERE("Programme Code" = FIELD("Programme Code"));
        }
        field(51; "Lesson Filter"; Code[20])
        {
            FieldClass = Normal;
            TableRelation = "ACA-Lessons".Code;
        }
        field(52; "Common Unit"; Boolean)
        {
        }
        field(53; "No. Units"; Decimal)
        {
            InitValue = 1;
        }
        field(54; "Programme Option"; Code[50])
        {
            TableRelation = "ACA-Programme Options".Code WHERE("Programme Code" = FIELD("Programme Code"));
        }
        field(55; "Reg. ID Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "ACA-Course Registration"."Reg. Transacton ID" WHERE("Student No." = FIELD("Student No. Filter"));
        }
        field(56; "Student No. Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = Customer."No.";
        }
        field(57; "Total Score"; Decimal)
        {
            CalcFormula = Sum("ACA-Exam Results".Contribution WHERE("Student No." = FIELD("Student No. Filter"),
                                                                     Programmes = FIELD("Programme Code"),
                                                                     Unit = FIELD(Code),
                                                                     Cancelled = CONST(false),
                                                                     Semester = FIELD("Semester Filter")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(58; "Unit Registered"; Integer)
        {
            CalcFormula = Count("ACA-Student Units" WHERE("Student No." = FIELD("Student No. Filter"),
                                                           Unit = FIELD(Code)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(59; "Re-Sit"; Integer)
        {
            CalcFormula = Count("ACA-Student Units" WHERE("Reg. Transacton ID" = FIELD("Reg. ID Filter"),
                                                           "Student No." = FIELD("Student No. Filter"),
                                                           Programme = FIELD("Programme Code"),
                                                           Stage = FIELD("Stage Code"),
                                                           Unit = FIELD(Code),
                                                           Taken = CONST(true),
                                                           "Repeat Unit" = CONST(true)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(60; Audit; Integer)
        {
            CalcFormula = Count("ACA-Student Units" WHERE("Reg. Transacton ID" = FIELD("Reg. ID Filter"),
                                                           "Student No." = FIELD("Student No. Filter"),
                                                           Programme = FIELD("Programme Code"),
                                                           Stage = FIELD("Stage Code"),
                                                           Unit = FIELD(Code),
                                                           Taken = CONST(true),
                                                           Audit = CONST(true)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(61; Submited; Boolean)
        {
        }
        field(62; "Exam Status"; Option)
        {
            OptionCaption = ' ,Setting,Moderated,Submision,Typing,Proofreading,Printing,Ready,Collected,Returns (Incidence Form/Checklist/Invigilator Report)';
            OptionMembers = " ",Setting,Moderated,Submision,Typing,Proofreading,Printing,Ready,Collected,"Returns (Incidence Form/Checklist/Invigilator Report)";

            trigger OnValidate()
            begin
                /*
                IF GETFILTER("Semester Filter") = '' THEN
                ERROR('You must specify the semester.');
                
                IF xRec."Exam Status" <> "Exam Status" THEN BEGIN
                StatusC.INIT;
                StatusC."No.":="Programme Code";
                StatusC.Date:="Stage Code";
                StatusC."Currency Factor":=Code;
                StatusC."Currency Code":="Exam Status";
                StatusC.Date:=TODAY;
                StatusC."User ID":=USERID;
                StatusC."Programme Option":="Programme Option";
                StatusC.Semester:=GETFILTER("Semester Filter");
                StatusC.Payee:="Exam Remarks";
                StatusC.INSERT;
                
                END;
                */

            end;
        }
        field(63; "Printed Copies"; Integer)
        {

            trigger OnValidate()
            begin
                /*IF GETFILTER("Semester Filter") = '' THEN
                ERROR('You must specify the semester.');
                
                
                IF xRec."Printed Copies" <> "Printed Copies" THEN BEGIN
                StatusC.INIT;
                StatusC."No.":="Programme Code";
                StatusC.Date:="Stage Code";
                StatusC."Currency Factor":=Code;
                StatusC."Currency Code":="Exam Status";
                StatusC.Date:=TODAY;
                StatusC."User ID":=USERID;
                StatusC."Programme Option":="Programme Option";
                StatusC.Semester:=GETFILTER("Semester Filter");
                StatusC.Payee:='Printed Copies: ' + FORMAT("Printed Copies");
                StatusC.INSERT;
                
                END;
                */

            end;
        }
        field(64; "Issued Copies"; Integer)
        {

            trigger OnValidate()
            begin
                //IF GETFILTER("Semester Filter") = '' THEN
                //ERROR('You must specify the semester.');

                //IF "Issued Copies" > "Printed Copies" THEN
                //ERROR('You can not issues more than the printed copies.');
            end;
        }
        field(65; "Returned Copies"; Integer)
        {

            trigger OnValidate()
            begin
                //IF GETFILTER("Semester Filter") = '' THEN
                //ERROR('You must specify the semester.');

                //IF "Returned Copies" > "Issued Copies" THEN
                //ERROR('You can not return more than the issued copies.');
            end;
        }
        field(66; "Exam Remarks"; Text[100])
        {
        }
        field(67; "Details Count"; Integer)
        {
            Editable = false;
        }
        field(68; "Not Allocated"; Boolean)
        {
        }
        field(69; "Timetable Priority"; Integer)
        {
        }
        field(70; "Normal Slots"; Integer)
        {
        }
        field(71; "Lab Slots"; Integer)
        {
        }
        field(72; "Slots Varience"; Integer)
        {
        }
        field(73; "Time Table"; Boolean)
        {
        }
        field(74; "Exam Not Allocated"; Boolean)
        {
        }
        field(75; "Exam Slots Varience"; Integer)
        {
        }
        field(80; Show; Boolean)
        {
        }
        field(81; "Estimate Reg"; Integer)
        {
        }
        field(82; "Exams Done"; Integer)
        {
            CalcFormula = Count("ACA-Exam Results" WHERE("Reg. Transaction ID" = FIELD("Reg. ID Filter"),
                                                          "Student No." = FIELD("Student No. Filter"),
                                                          Programmes = FIELD("Programme Code"),
                                                          Stage = FIELD("Stage Code"),
                                                          Unit = FIELD(Code)));
            FieldClass = FlowField;
        }
        field(83; "Default Exam Category"; Code[20])
        {
            TableRelation = "ACA-Exam Category".Code;

            trigger OnValidate()
            var
                ACAProgramme: Record 61511;
            begin
                IF (("Default Exam Category" = '') OR ("Default Exam Category" = ' ')) THEN BEGIN
                    ACAProgramme.RESET;
                    ACAProgramme.SETRANGE(Code, "Programme Code");
                    IF ACAProgramme.FIND('-') THEN BEGIN
                        // ACAProgramme.TESTFIELD("Exam Category");
                        "Exam Category" := ACAProgramme."Exam Category";
                    END;
                END ELSE BEGIN
                    "Exam Category" := "Default Exam Category";
                END;
            end;
        }
        field(84; "Programme Name"; Text[200])
        {
            CalcFormula = Lookup("ACA-Programme".Description WHERE(Code = FIELD("Programme Code")));
            FieldClass = FlowField;
        }
        field(85; "Lecturer Code"; Code[20])
        {
        }
        field(86; "New Unit"; Boolean)
        {
            InitValue = true;
        }
        field(87; "Programme Code lkup"; Code[20])
        {
            CalcFormula = Lookup("ACA-Student Units".Programme WHERE(Unit = FIELD(Code)));
            FieldClass = FlowField;
        }
        field(88; "Lecturer Lkup"; Code[30])
        {
            CalcFormula = Lookup("ACA-Lecturers Units - Old".Lecturer WHERE(Unit = FIELD(Code),
                                                                             Semester = FIELD("Semester Filter")));
            FieldClass = FlowField;
        }
        field(89; "Entry No"; Integer)
        {
        }
        field(90; "Session Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "ACA-Student Types".Code;
        }
        field(91; "Lecturer Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "HRM-Employee (D)"."No." WHERE(Lecturer = CONST(true));
        }
        field(92; Attachment; Boolean)
        {
        }
        field(93; Research; Boolean)
        {
        }
        field(94; "Combination Count"; Integer)
        {
            CalcFormula = Count("ACA-Units Options Combination" WHERE(Programme = FIELD("Programme Code"),
                                                                       Stage = FIELD("Stage Code"),
                                                                       Unit = FIELD(Code)));
            FieldClass = FlowField;
        }
        field(95; "Prerequisite 2"; Code[20])
        {
            TableRelation = "ACA-Units/Subjects".Code WHERE("Programme Code" = FIELD("Programme Code"));
        }

        field(50000; "Used Count"; Integer)
        {
            CalcFormula = Count("ACA-Student Units" WHERE(Programme = FIELD("Programme Code"),
                                                           Unit = FIELD(Code)));
            FieldClass = FlowField;
        }
        field(50001; "Score Buffer"; Decimal)
        {
        }
        field(50003; Project; Boolean)
        {
        }
        field(50004; "Ignore in Final Average"; Boolean)
        {
        }
        field(50005; "Failed Total Score"; Decimal)
        {
            CalcFormula = Sum("ACA-Exam Results".Contribution WHERE("Reg. Transaction ID" = FIELD("Reg. ID Filter"),
                                                                     "Student No." = FIELD("Student No. Filter"),
                                                                     Programmes = FIELD("Programme Code"),
                                                                     Stage = FIELD("Stage Code"),
                                                                     Unit = FIELD(Code),
                                                                     Semester = FIELD("Semester Filter"),
                                                                     "Re-Sited" = CONST(true)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50006; "Time Tabled Count"; Integer)
        {
        }
        field(50007; "Old Unit"; Boolean)
        {
        }
        field(50012; "Unit Class Size"; Decimal)
        {
            CalcFormula = Sum("ACA-Lecturers Units - Old"."Class Size" WHERE(Unit = FIELD(Code),
                                                                              Semester = FIELD("Semester Filter")));
            FieldClass = FlowField;
        }
        field(50013; "Reserved Room"; Code[50])
        {
            CalcFormula = Lookup("ACA-Lecture Rooms".Code WHERE("Reserve For" = FIELD("Programme Code")));
            FieldClass = FlowField;
        }
        field(50014; "Time Table Code"; Code[20])
        {
        }
        field(50015; "Campus Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(50017; "Week Filter"; Code[20])
        {
            Editable = false;
            FieldClass = FlowFilter;
        }
        field(50018; "Lecturer Room"; Code[20])
        {
            TableRelation = "ACA-Lecture Rooms".Code;
        }
        field(50019; "Time Tabled Used Count"; Integer)
        {
            CalcFormula = Count("ACA-Time Table" WHERE(Unit = FIELD("Time Table Code"),
                                                        Semester = FIELD("Semester Filter"),
                                                        Programme = FIELD("Programme Code"),
                                                        Stage = FIELD("Stage Code")));
            FieldClass = FlowField;
        }
        field(50020; LecturerUnitSet; Integer)
        {
            CalcFormula = Count("ACA-Lecturers Units - Old" WHERE(Unit = FIELD(Code),
                                                                   Stage = FIELD("Stage Code"),
                                                                   Programme = FIELD("Programme Code"),
                                                                   Semester = FIELD("Semester Filter")));
            FieldClass = FlowField;
        }
        field(50021; "Corected Unit Code"; Code[10])
        {
        }
        field(50022; "Repeatition Count"; Integer)
        {
        }
        field(50023; "Medical Unit"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50024; "Total Credit Hours"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50025; "Special Programme Class"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'General,Medicine & Nursing,Engineering';
            OptionMembers = General,"Medicine & Nursing",Engineering;
        }
        field(50026; "Exam Category"; Code[20])
        {
        }
        field(50027; "School Code"; Code[20])
        {
            CalcFormula = Lookup("ACA-Programme"."School Code" WHERE(Code = FIELD("Programme Code")));
            FieldClass = FlowField;
        }
        field(50028; "Year of Study"; Integer)
        {
            CalcFormula = Lookup("ACA-Programme Stages"."Year of Study" WHERE("Programme Code" = FIELD("Programme Code"),
                                                                               Code = FIELD("Stage Code")));
            FieldClass = FlowField;
        }
        field(50029; "Academic Hours"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50030; "Key Course"; Boolean)
        {
            DataClassification = ToBeClassified;
        }//"Unit Base Code"
        field(50031; "Unit Base Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }//"Unit Base Code"
        field(50032; "Unit Base Title"; Text[250])
        {

        }
        field(50033; "Associated Unit1"; Code[20])
        {
            TableRelation = "ACA-Units Master Table";
        }
        field(50034; "Associated Unit2"; Code[20])
        {
            TableRelation = "ACA-Units Master Table";
        }
        field(50035; "Associated Unit3"; Code[20])
        {
            TableRelation = "ACA-Units Master Table";
        }
        field(50036; "Associated Unit4"; Code[20])
        {
            TableRelation = "ACA-Units Master Table";
        }
        field(50037; "Required No Of Classes"; Integer)
        {

        }

    }

    keys
    {
        key(Key1; "Code", "Programme Code", "Stage Code", "Entry No")
        {
        }
        key(Key2; "Stage Code")
        {
        }
        key(Key3; "Programme Code", "Stage Code", "Code", "Programme Option")
        {
        }
        key(Key4; "Code", "Time Tabled Count")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin

        //StudUnits.RESET;
        //StudUnits.SETRANGE(StudUnits.Unit,Code);
        //StudUnits.SETRANGE(StudUnits.Programme,"Programme Code");
        // IF StudUnits.FIND('-') THEN ERROR('The selected unit is already used in Students Units');
        //
        // ExamR.RESET;
        // ExamR.SETRANGE(ExamR.Unit,Code);
        // ExamR.SETRANGE(ExamR.Programme,"Programme Code");
        // //ExamR.SETRANGE(ExamR.Stage,"Stage Code");
        // //ExamR.SETRANGE(ExamR.Cancelled,FALSE);
        // IF ExamR.FIND('-') THEN
        // //IF CONFIRM('Please note that selected unit contains valid results!, Do you really want to delete',FALSE)=FALSE THEN
        // ERROR(ExistsInResults);
    end;

    trigger OnModify()
    begin
        IF xRec.Code <> Code THEN BEGIN
            StudUnits.RESET;
            StudUnits.SETRANGE(StudUnits.Unit, xRec.Code);
            StudUnits.SETRANGE(StudUnits.Programme, "Programme Code");
            IF StudUnits.FIND('-') THEN ERROR(existsInUnits);
        END;
    end;

    trigger OnRename()
    begin
        IF xRec.Code <> Code THEN BEGIN
            StudUnits.RESET;
            StudUnits.SETRANGE(StudUnits.Unit, xRec.Code);
            StudUnits.SETRANGE(StudUnits.Programme, "Programme Code");
            IF StudUnits.FIND('-') THEN ERROR(existsInUnits);
        END;
    end;

    var
        //StatusC: Record 61050;
        unitsMatsr: Record "ACA-Units Master Table";
        UnitsSubj: Record 61517;
        StudUnits: Record 61549;
        ExamR: Record 61548;
        existsInUnits: Label 'The selected unit is already used in Students Units';
        ExistsInResults: Label 'Please note that selected unit contains valid results!';
}

