page 54899 "HMS Patient Student Card"
{
    DeleteAllowed = false;
    PageType = Card;
    Editable = true;
    SourceTable = "HMS-Patient";
    layout
    {
        area(content)
        {
            group("Personal details")
            {
                Caption = 'Personal details';
                Editable = true;
                field("Patient No."; Rec."Patient No.")
                {
                    ApplicationArea = All;
                    Caption = 'Clinic No.';
                }
                field("Date Registered"; Rec."Date Registered")
                {
                    ApplicationArea = All;
                }
                field("Patient Type"; Rec."Patient Type")
                {
                    Editable = true;
                    ApplicationArea = All;

                    trigger OnValidate()
                    begin
                        CheckPatientType();
                    end;
                }
                field("Student No."; Rec."Student No.")
                {
                    ApplicationArea = All;
                }
                field("Employee No."; Rec."Employee No.")
                {
                    ApplicationArea = All;
                }
                field("Full Name"; Rec."Full Name")
                {
                    ApplicationArea = All;

                }
                field("File No."; Rec."File No.")
                {
                    ApplicationArea = All;

                }
                field("Relative No."; Rec."Relative No.")
                {
                    ApplicationArea = All;
                }
                /*  field("Region"; Rec."Global Dimension 1 Code")
                 {
                     Caption = 'Region';
                     ApplicationArea = All;
                 }
                 field("Cost Center"; Rec."Global Dimension 2 Code")
                 {
                     Caption = 'Cost Center';
                     ApplicationArea = All;
                 } */
                field(Title; Rec.Title)
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

                    trigger OnValidate()
                    begin
                        IF Rec."Date Of Birth" <> 0D THEN BEGIN
                            Age := HRDates.DetermineAge(Rec."Date Of Birth", TODAY);
                        END;
                    end;
                }
                field("Marital Status"; Rec."Marital Status")
                {
                    ApplicationArea = All;
                }
                field("ID Number"; Rec."ID Number")
                {
                    ApplicationArea = All;
                }
                field(Age; Age)
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field(Photo; Rec.Photo)
                {
                    ApplicationArea = All;
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = All;
                }
            }
            group("Pre Medical details")
            {
                Editable = true;
                field("Examining Officer"; Rec."Examining Officer")
                {
                    ApplicationArea = All;
                }
                field("Medical Exam Date"; Rec."Medical Exam Date")
                {
                    ApplicationArea = All;
                }
                field("Blood Group"; Rec."Blood Group")
                {
                    ApplicationArea = All;
                }
                field("Rhesus Factor"; Rec."Rhesus Factor")
                {
                    ApplicationArea = All;
                }
                field("Physical Impairment Details"; Rec."Physical Impairment Details")
                {
                    ApplicationArea = All;
                }

            }
            group("Emergency Contacts")
            {
                field("Emergency Consent Relationship"; Rec."Emergency Consent Relationship")
                {
                    ApplicationArea = All;
                    Caption = 'Contact Relationship';
                }
                field("Emergency Consent Full Name"; Rec."Emergency Consent Full Name")
                {
                    ApplicationArea = All;
                    Caption = 'Contact Name';
                }
                field("Emergency Consent Address 1"; Rec."Emergency Consent Address 1")
                {
                    ApplicationArea = All;
                    Caption = 'Contact Address';
                }
                field("Emergency Consent Address 2"; Rec."Emergency Consent Address 2")
                {
                    ApplicationArea = All;
                    Caption = 'Contact Phone';
                }
            }
            group("Historical Medical Conditions")
            {
                Caption = 'Past Medical/Surgical History';
                Editable = true;
                part(Part; "HMS Patient Medical Condition")
                {
                    SubPageLink = "Patient No." = FIELD("Patient No.");
                    ApplicationArea = All;
                    Editable = true;
                }
            }
            group("Historical Immunizations")
            {
                Caption = 'Historical Immunizations';
                Editable = true;
                part(Pt2; "HMS Patient Immunization")
                {
                    SubPageLink = "Patient No." = FIELD("Patient No.");
                    ApplicationArea = All;
                }
            }
            group("Spouse details (If Married)")
            {
                Caption = 'Spouse details (If Married)';
                Editable = true;
                field("Spouse Name"; Rec."Spouse Name")
                {
                    ApplicationArea = All;
                }
                field("Spouse Address 1"; Rec."Spouse Address 1")
                {
                    ApplicationArea = All;
                }
                field("Spouse Address 2"; Rec."Spouse Address 2")
                {
                    ApplicationArea = All;
                }
                field("Spouse Address 3"; Rec."Spouse Address 3")
                {
                    ApplicationArea = All;
                }
                field("Spouse Telephone No. 1"; Rec."Spouse Telephone No. 1")
                {
                    ApplicationArea = All;
                }
                field("Spouse Telephone No. 2"; Rec."Spouse Telephone No. 2")
                {
                    ApplicationArea = All;
                }
                field("Spouse Email"; Rec."Spouse Email")
                {
                    ApplicationArea = All;
                }
                field("Spouse Fax"; Rec."Spouse Fax")
                {
                    ApplicationArea = All;
                }
            }
            group("Correspondence Address")
            {
                Caption = 'Correspondence Address';
                Editable = true;
                field("Place of Birth Village"; Rec."Place of Birth Village")
                {
                    ApplicationArea = All;
                }
                field("Place of Birth Location"; Rec."Place of Birth Location")
                {
                    ApplicationArea = All;
                }
                field("Place of Birth District"; Rec."Place of Birth District")
                {
                    ApplicationArea = All;
                }
                field("Name of Chief"; Rec."Name of Chief")
                {
                    ApplicationArea = All;
                }
                field("Nearest Police Station"; Rec."Nearest Police Station")
                {
                    ApplicationArea = All;
                }
                field("Correspondence Address 1"; Rec."Correspondence Address 1")
                {
                    ApplicationArea = All;
                }
                field("Correspondence Address 2"; Rec."Correspondence Address 2")
                {
                    ApplicationArea = All;
                }
                field("Correspondence Address 3"; Rec."Correspondence Address 3")
                {
                    ApplicationArea = All;
                }
                field("Telephone No. 1"; Rec."Telephone No. 1")
                {
                    ApplicationArea = All;
                }
                field("Telephone No. 2"; Rec."Telephone No. 2")
                {
                    ApplicationArea = All;
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = All;
                }
                field("Fax No."; Rec."Fax No.")
                {
                    ApplicationArea = All;
                }
            }
            group("Parent Details")
            {
                Caption = 'Parent Details';
                Editable = true;
                field("Mother Alive or Dead"; Rec."Mother Alive or Dead")
                {
                    ApplicationArea = All;
                }
                field("Mother Full Name"; Rec."Mother Full Name")
                {
                    ApplicationArea = All;
                }
                field("Mother Occupation"; Rec."Mother Occupation")
                {
                    ApplicationArea = All;
                }
                field("Father Alive or Dead"; Rec."Father Alive or Dead")
                {
                    ApplicationArea = All;
                }
                field("Father Full Name"; Rec."Father Full Name")
                {
                    ApplicationArea = All;
                }
                field("Father Occupation"; Rec."Father Occupation")
                {
                    ApplicationArea = All;
                }
                field("Guardian Name"; Rec."Guardian Name")
                {
                    ApplicationArea = All;
                }
                field("Guardian Occupation"; Rec."Guardian Occupation")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
        area(navigation)
        {
        }
        area(processing)
        {
            action(Statistics)
            {
                Caption = 'Statistics';
                Image = Statistics;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "HMS-Patient Card";
                RunPageLink = "Patient No." = FIELD("Patient No.");
                ApplicationArea = All;
            }
            action("Register Visit")
            {
                ApplicationArea = All;
                Image = Registered;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    Rec.CreateObservation();
                end;
            }
        }
    }


    trigger OnInit()
    begin
        "Relative No.Enable" := TRUE;
        "Employee No.Enable" := TRUE;
        "Student No.Enable" := TRUE;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec."Patient Type" := Rec."Patient Type"::Student;
    end;



    trigger OnOpenPage()
    begin
        if Rec."File No." = '' then begin
            Rec."File No." := '';
            if (Rec."Patient No." <> '') then begin
                Rec."File No." := 'CN/' + Rec."Employee No.";
            end;
        end;
    end;

    var
        HasValue: Boolean;
        HRDates: Codeunit "HR Dates";
        Age: Text[100];
        [InDataSet]
        "Student No.Enable": Boolean;
        [InDataSet]
        "Employee No.Enable": Boolean;
        [InDataSet]
        "Relative No.Enable": Boolean;

    procedure CheckPatientType()
    begin
        IF Rec."Patient Type" = Rec."Patient Type"::Others THEN BEGIN
            "Student No.Enable" := TRUE;
            "Employee No.Enable" := FALSE;
            "Relative No.Enable" := FALSE;
        END
        ELSE BEGIN
            "Student No.Enable" := FALSE;
            "Employee No.Enable" := TRUE;
            "Relative No.Enable" := TRUE;
        END;
    end;

    trigger OnAfterGetCurrRecord()
    begin
        xRec := Rec;
        CheckPatientType();
        IF Rec."Date Of Birth" <> 0D THEN BEGIN
            Age := HRDates.DetermineAge(Rec."Date Of Birth", TODAY);
        END;
    end;
}

