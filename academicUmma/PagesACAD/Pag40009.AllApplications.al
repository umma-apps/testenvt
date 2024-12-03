page 40009 "ACA- All Applications list"
{
    Caption = 'All Applications';
    PageType = List;


    CardPageID = "ACA-Application Form Header";
    InsertAllowed = false;
    ModifyAllowed = false;

    SourceTable = "ACA-Applic. Form Header";
    //SourceTableView = WHERE(Status = FILTER(Open), "Process Application" = filter(false), "Finance Cleared" = filter(true));

    layout
    {
        area(content)
        {
            repeater("General Information")
            {
                Caption = 'General Information';
                field("Application No."; Rec."Application No.")
                {
                    ApplicationArea = All;

                }
                field("Finance Cleared"; Rec."Finance Cleared")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = All;
                }
                field("Other Names"; Rec."Other Names")
                {
                    ApplicationArea = All;
                }
                field(Surname; Rec.Surname)
                {
                    ApplicationArea = All;
                }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = All;
                }
                field("Date Of Birth"; Rec."Date Of Birth")
                {
                    ApplicationArea = All;
                }
                field("Programme Level"; Rec."Programme Level")
                {
                    ApplicationArea = All;
                }
                field("First Degree Choice"; Rec."First Degree Choice")
                {
                    Caption = 'Programme Applied for';
                    ApplicationArea = All;
                }
                field(programName; Rec.programName)
                {
                    ApplicationArea = All;
                }
                field("Mode of Study"; Rec."Mode of Study")
                {
                    ApplicationArea = All;
                }
                field(Campus; Rec.Campus)
                {
                    ApplicationArea = All;
                }
                field(Nationality; Rec.Nationality)
                {
                    ApplicationArea = All;
                }
                field("ID Number"; Rec."ID Number")
                {
                    ApplicationArea = All;
                }
                field("Passport Number"; Rec."Passport Number")
                {
                    ApplicationArea = All;
                }
                field(Religion; Rec.Religion)
                {
                    ApplicationArea = All;
                }
                field("Telephone No. 1"; Rec."Telephone No. 1")
                {
                    ApplicationArea = All;
                }



                field("Telephone No. 2"; Rec."Telephone No. 2")
                {
                    Caption = 'Alt Tel.';
                    ApplicationArea = All;
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = All;
                }
                field("Created By"; rec.SystemCreatedBy)
                {
                    ApplicationArea = All;
                }
                field("CreatedAt"; rec.SystemCreatedAt)
                {
                    ApplicationArea = All;
                }
                field("ModifiedAt"; rec.SystemModifiedAt)
                {
                    ApplicationArea = All;
                }
                field("Modified By"; rec.SystemModifiedBy)
                {
                    ApplicationArea = All;
                }


            }
        }
    }
    // This procedure fetches the username based on the GUID stored

    actions
    {
        area(navigation)
        {
            group(Documents)
            {
                Caption = 'Documents';
                action("Academic Background Subjects")
                {
                    Caption = 'Academic Background Subjects';
                    Image = History;
                    Promoted = true;
                    RunObject = Page "ACA-Application Form Academic";
                    RunPageLink = "Application No." = FIELD("Application No.");
                    ApplicationArea = All;
                }
                action("Professional Qualifications")
                {
                    Caption = 'Professional Qualifications';
                    Image = ProfileCalender;
                    RunObject = Page 68470;
                    RunPageLink = "Application No." = FIELD("Application No.");
                    ApplicationArea = All;
                }
                action("Employment History")
                {
                    Caption = 'Employment History';
                    Image = Employee;
                    RunObject = Page 68469;
                    RunPageLink = "Application No." = FIELD("Application No.");
                    ApplicationArea = All;
                }
                action("Academic Referees")
                {
                    Caption = 'Academic Referees';
                    Image = CustomerContact;
                    RunObject = Page 68468;
                    RunPageLink = "Application No." = FIELD("Application No.");
                    ApplicationArea = All;
                }
            }
        }
        area(processing)
        {
            group("&Functions")
            {
                Caption = '&Functions';
                action(Approvals)
                {
                    Caption = 'Approvals';
                    Image = Approval;
                    ApplicationArea = All;

                    RunObject = page "Fin-Approval Entries";
                    RunPageLink = "Document No." = field("Application No.");
                }
                action(sendApproval)
                {
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    ApplicationArea = All;

                    trigger OnAction()
                    var
                        ApprovalMgt: Codeunit 439;
                        showmessage: Boolean;
                        ManualCancel: Boolean;
                        State: Option Open,"Pending Approval",Cancelled,Approved;
                        DocType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,TransportRequest,Maintenance,Fuel,ImporterExporter,"Import Permit","Export Permit",TR,"Safari Notice","Student Applications","Water Research","Consultancy Requests","Consultancy Proposals","Meals Bookings","General Journal","Student Admissions","Staff Claim",KitchenStoreRequisition,"Leave Application","Staff Advance","Staff Advance Accounting";
                        tableNo: Integer;
                    begin
                        /*
                        //Return this code for normal application flow//>>>>
                        
                        //Release the Application for Approval
                        TESTFIELD(Surname);
                        TESTFIELD("First Degree Choice");
                        TESTFIELD("Settlement Type");
                        TESTFIELD("Intake Code");
                        TESTFIELD(Campus);
                        TESTFIELD("Application Form Receipt No.");
                        TESTFIELD("Address for Correspondence1");
                        TESTFIELD("Date Of Birth");
                        IF AppSetup.GET() THEN
                        IF (TODAY-"Date Of Birth")<(AppSetup."Minimum Age"*365) THEN ERROR('The Minimum Required Age for Admission is '+FORMAT(AppSetup."Minimum Age")+' years');
                        
                        IF CONFIRM('Send this Application for Approval?',TRUE)=FALSE THEN EXIT;
                        
                        IF "Application No." = '' THEN
                          ERROR('There are no Applicants Specified.');
                        
                        Apps.RESET;
                        Apps.SETRANGE(Apps."Application No.","Application No.");
                        Testfields;
                        IF "Application Date"=0D THEN
                          ERROR('Provide the Application Date First!');
                        IF "Application Form Receipt No."='' THEN
                          ERROR('Provide the Bank Slip number.');
                        //WITH Apps DO
                         //   BEGIN
                             "User ID":=USERID;
                             "Date of Receipt":=TODAY;
                             MODIFY;
                        //END;
                        
                        
                          State:=State::Open;
                         IF Status<>Status::"Pending Approval" THEN State:=State::"Pending Approval";
                         DocType:=DocType::"Student Applications";
                         CLEAR(tableNo);
                         tableNo:=DATABASE::"Application Form Header";
                          IF ApprovalMgt.SendApproval(tableNo,"Application No.",DocType,State) THEN BEGIN
                        MESSAGE(FORMAT(xRec.Surname)+' successfully send for Approval');
                        CurrPage.UPDATE;
                        END;
                        */
                        //This code has been used to bypass approval up to pending payments list
                        //Delete it and revert back to the above code

                        Rec.TESTFIELD(Surname);
                        Rec.TESTFIELD("First Degree Choice");
                        Rec.TESTFIELD("Settlement Type");
                        Rec.TESTFIELD("Intake Code");
                        Rec.TESTFIELD(Campus);
                        //TESTFIELD("Application Form Receipt No.");
                        //TESTFIELD("Address for Correspondence1");
                        //TESTFIELD("Date Of Birth");
                        IF AppSetup.GET() THEN
                            //IF (TODAY-"Date Of Birth")<(AppSetup."Minimum Age"*365) THEN ERROR('The Minimum Required Age for Admission is '+FORMAT(AppSetup."Minimum Age")+' years');

                            IF CONFIRM('Send this Application for Approval?', TRUE) = FALSE THEN EXIT;

                        IF Rec."Application No." = '' THEN
                            ERROR('There are no Applicants Specified.');

                        Apps.RESET;
                        Apps.SETRANGE(Apps."Application No.", Rec."Application No.");

                        IF Rec."Application Date" = 0D THEN
                            ERROR('Provide the Application Date First!');
                        //IF "Application Form Receipt No."='' THEN
                        //  ERROR('Provide the Bank Slip number.');
                        //WITH Apps DO
                        //   BEGIN
                        Rec."User ID" := USERID;
                        Rec."Date of Receipt" := TODAY;
                        Rec.Status := Rec.Status::"Provisional Admission";
                        Rec."Documents Verified" := Rec."Documents Verified"::No;
                        Rec."Admitted Degree" := Rec."First Degree Choice";
                        Rec."Date Of Meeting" := TODAY;
                        Rec."Admitted To Stage" := Rec."First Choice Stage";
                        Rec."Admitted Semester" := Rec."First Choice Semester";
                        Rec."Admission Board Recommendation" := 'Admit';
                        Rec.MODIFY;
                        //END;

                    end;
                }
                action(cancellsApproval)
                {
                    Caption = 'Cancel Approval Re&quest';
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    ApplicationArea = All;

                    trigger OnAction()
                    var
                        ApprovalMgt: Codeunit 439;
                        showmessage: Boolean;
                        ManualCancel: Boolean;
                        State: Option Open,"Pending Approval",Cancelled,Approved;
                        DocType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,TransportRequest,Maintenance,Fuel,ImporterExporter,"Import Permit","Export Permit",TR,"Safari Notice","Student Applications","Water Research","Consultancy Requests","Consultancy Proposals","Meals Bookings","General Journal","Student Admissions","Staff Claim",KitchenStoreRequisition,"Leave Application","Staff Advance","Staff Advance Accounting";
                        tableNo: Integer;
                    begin
                        DocType := DocType::"Student Applications";
                        showmessage := TRUE;
                        ManualCancel := TRUE;
                        CLEAR(tableNo);
                        tableNo := DATABASE::"ACA-Applic. Form Header";
                        //  IF ApprovalMgt.CancelApproval(tableNo, DocType, "Application No.", showmessage, ManualCancel) THEN;
                    end;
                }
            }
        }
    }



    trigger OnInit()
    begin
        "Points AcquiredVisible" := TRUE;
        "Mean Grade AcquiredVisible" := TRUE;
        "Subsidiary PassesVisible" := TRUE;
        "Principal PassesVisible" := TRUE;
    end;

    procedure GetUserName(UserGUID: Guid): Text
    var
        UserRec: Record User;
    begin
        if UserRec.Get(UserGUID) then
            exit(UserRec."User Name") // Return the actual username
        else
            exit('Unknown User');
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec."Settlement Type" := 'SSS';
    end;


    var
        DegreeName1: Text[200];
        DegreeName2: Text[200];
        FacultyName1: Text[200];
        FacultyName2: Text[200];
        NationalityName: Text[200];
        CountryOfOriginName: Text[200];
        Age: Text[200];
        FormerSchoolName: Text[200];
        CustEntry: Record "Cust. Ledger Entry";
        Apps: Record "ACA-Applic. Form Header";
        recProgramme: Record "ACA-Programme";
        FirstChoiceSemesterName: Text[200];
        FirstChoiceStageName: Text[200];
        SecondChoiceSemesterName: Text[200];
        SecondChoiceStageName: Text[200];
        [InDataSet]
        "Principal PassesVisible": Boolean;
        [InDataSet]
        "Subsidiary PassesVisible": Boolean;
        [InDataSet]
        "Mean Grade AcquiredVisible": Boolean;
        [InDataSet]
        "Points AcquiredVisible": Boolean;
        Text19076066: Label 'Personal Details';
        Text19060472: Label 'Degree Choices';
        Text19037194: Label 'Academic Background';
        UserMgt: Codeunit 50114;
        Doc_Type: Option LPO,Requisition,Imprest,"Payment Voucher";
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,Admission;
        ApprovalEntries: Page "Approval Entries";
        AppSetup: Record "ACA-Applic. Setup";
        AdmissionsQualif: Codeunit 50140;
        EnqH: Record "ACA-Enquiry Header";


    procedure GetStageName(var StageCode: Code[20]) StageName: Text[200]
    var
        Stage: Record "ACA-Programme Stages";
    begin
        Stage.RESET;
        Stage.SETRANGE(Stage.Code, StageCode);
        IF Stage.FIND('-') THEN BEGIN
            StageName := Stage.Description;
        END;
    end;

    procedure GetSemesterName(var SemesterCode: Code[20]) SemesterName: Text[200]
    var
        Semester: Record "ACA-Semesters";
    begin
        Semester.RESET;
        Semester.SETRANGE(Semester.Code, SemesterCode);
        IF Semester.FIND('-') THEN BEGIN
            SemesterName := Semester.Description;
        END;
    end;

    procedure GetCounty(var CountyCode: Code[20]) CountyName: Text[100]
    var
        CountySetup: Record "ACA-Academics Central Setups";
    begin
        /*This function gets the county name from the database and returns the resultant string value*/
        CountySetup.RESET;
        CountySetup.SETRANGE(CountySetup."Title Code", CountyCode);
        CountySetup.SETRANGE(CountySetup.Category, CountySetup.Category::Countries);
        IF CountySetup.FIND('-') THEN BEGIN
            CountyName := CountySetup.Description;
        END
        ELSE BEGIN
            CountyName := '';
        END;

    end;

    trigger OnAfterGetCurrRecord()
    begin
        xRec := Rec;
        Age := Rec.GetAge(Rec."Date Of Birth");
        NationalityName := Rec.GetCountry(Rec.Nationality);
        CountryOfOriginName := Rec.GetCountry(Rec."Country of Origin");
        //DegreeName1:=GetDegree("First Degree Choice");
        //DegreeName2:=GetDegree("Second Degree Choice");
        FacultyName1 := Rec.GetFaculty(Rec."First Degree Choice");
        FacultyName2 := Rec.GetFaculty(Rec."Second Degree Choice");
        FormerSchoolName := Rec.GetFormerSchool(Rec."Former School Code");
        IF (Rec.Examination = Rec.Examination::KCSE) OR (Rec.Examination = Rec.Examination::KCE) OR (Rec.Examination = Rec.Examination::EACE) THEN BEGIN
            "Principal PassesVisible" := FALSE;
            "Subsidiary PassesVisible" := FALSE;
            "Mean Grade AcquiredVisible" := TRUE;
            "Points AcquiredVisible" := TRUE;
        END
        ELSE BEGIN
            "Principal PassesVisible" := TRUE;
            "Subsidiary PassesVisible" := TRUE;
            "Mean Grade AcquiredVisible" := FALSE;
            "Points AcquiredVisible" := FALSE;
        END;
    end;

    procedure Testfields()
    begin
        //
        Rec.TESTFIELD("Application Date");
        Rec.TESTFIELD("Date Of Receipt Slip");
        Rec.TESTFIELD("Intake Code");
        Rec.TESTFIELD("Knew College Thru");
        Rec.TESTFIELD("Issued Date");
        Rec.TESTFIELD("Settlement Type");
        Rec.TESTFIELD("Academic Year");
        Rec.TESTFIELD("Programme Level");
        Rec.TESTFIELD("Address for Correspondence1");
        Rec.TESTFIELD("First Degree Choice");
        Rec.TESTFIELD("First Choice Stage");
        Rec.TESTFIELD("First Choice Semester");
        //Personal Details
        Rec.TESTFIELD(Surname);
        Rec.TESTFIELD("Other Names");
        Rec.TESTFIELD("Date Of Birth");
        //TESTFIELD(Gender);
        Rec.TESTFIELD(Nationality);
        //TESTFIELD(Salutation);
        Rec.TESTFIELD("ID Number");
        //TESTFIELD("Marital Status");
    end;
}

