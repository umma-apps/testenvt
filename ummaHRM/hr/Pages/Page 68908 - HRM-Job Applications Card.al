page 68908 "HRM-Job Applications Card"
{
    PageType = Card;
    PromotedActionCategories = 'New,Process,Reports,Functions,Other Details,Kin Details,Attachment';
    SourceTable = "HRM-Job Applications (B)";
    Editable = false;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("Application No"; Rec."Application No")
                {
                    ApplicationArea = all;
                    Importance = Promoted;
                    Editable = false;
                }
                field("Employee Requisition No"; Rec."Employee Requisition No")
                {
                    ApplicationArea = all;
                    Caption = 'Application Reff No.';
                    Importance = Promoted;
                    Editable = false;
                }
                field("Job Applied For"; Rec."Job Applied For")
                {
                    ApplicationArea = all;
                    Caption = 'Position Applied For';
                    Enabled = true;
                    Importance = Promoted;
                }
                field("Job Applied for Description"; Rec."Job Applied for Description")
                {
                    ApplicationArea = all;
                    Caption = 'Job Description';
                    Editable = false;
                }
                field("Job Ref No"; Rec."Job Ref No")
                {
                    ApplicationArea = All;
                    Editable = false;
                    Visible = false;
                }
                field("Date Applied"; Rec."Date Applied")
                {
                    ApplicationArea = all;
                    Editable = false;
                    Importance = Promoted;
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = all;
                    Importance = Promoted;
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ApplicationArea = all;
                    Importance = Promoted;
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = all;
                    Importance = Promoted;
                }
                field(Citizenship; Rec.Citizenship)
                {
                    ApplicationArea = all;
                    Caption = 'Nationality';
                    trigger OnValidate()
                    begin
                        if Rec.Citizenship = Text19064673 then
                            kenyan := TRUE
                        ELSE
                            kenyan := false;

                        CurrPage.Update();

                    end;
                }
                field("ID Number"; Rec."ID Number")
                {
                    ApplicationArea = all;
                    Editable = kenyan;
                }
                field(Initials; Rec.Initials)
                {
                    Visible = false;
                    ApplicationArea = all;
                }
                // field("Job Type"; Rec."Job Type")
                // {
                //     ToolTip = 'Specifies the value of the Job Type field.';
                //     ApplicationArea = All;
                // }
                // field("First Language (R/W/S)"; Rec."First Language (R/W/S)")
                // {
                //     ApplicationArea = all;
                //     Caption = '1st Language (R/W/S)';
                //     Importance = Promoted;
                // }
                // field("First Language Read"; Rec."First Language Read")
                // {
                //     ApplicationArea = all;
                //     Caption = '1st Language Read';
                // }
                // field("First Language Write"; Rec."First Language Write")
                // {
                //     ApplicationArea = all;
                //     Caption = '1st Language Write';
                // }
                // field("First Language Speak"; Rec."First Language Speak")
                // {
                //     ApplicationArea = all;
                //     Caption = '1st Language Speak';
                // }
                // field("Second Language (R/W/S)"; Rec."Second Language (R/W/S)")
                // {
                //     ApplicationArea = all;
                //     Caption = '2nd Language (R/W/S)';
                //     Importance = Promoted;
                // }
                // field("Second Language Read"; Rec."Second Language Read")
                // {
                //     ApplicationArea = all;
                // }
                // field("Second Language Write"; Rec."Second Language Write")
                // {
                //     ApplicationArea = all;
                // }
                // field("Second Language Speak"; Rec."Second Language Speak")
                // {
                //     ApplicationArea = all;
                // }
                // field("Additional Language"; Rec."Additional Language")
                // {
                //     ApplicationArea = all;
                // }
                field("Applicant Type"; Rec."Applicant Type")
                {
                    ApplicationArea = all;
                    Enabled = false;
                    Style = Strong;
                    StyleExpr = TRUE;
                }
                // field("Employee No"; Rec."Employee No")
                // {
                //     ApplicationArea = all;
                //     Caption = 'Internal';
                //     Editable = true;
                // }

                field(Gender; Rec.Gender)
                {
                    ApplicationArea = all;
                    Importance = Promoted;
                }

                field("Country Details"; Rec."Citizenship Details")
                {
                    ApplicationArea = all;
                    Editable = false;
                }


                // field("Shortlisting Summary"; '')
                // {
                //     ApplicationArea = all;
                //     CaptionClass = Text19064672;
                //     Caption = 'Shortlisting Summary';
                //     Style = Strong;
                //     StyleExpr = TRUE;
                // }
                field(Qualified; Rec.Qualified)
                {
                    ApplicationArea = all;
                    Style = StrongAccent;
                    StyleExpr = TRUE;
                    Visible = false;
                }
                field("Interview Invitation Sent"; Rec."Interview Invitation Sent")
                {
                    ApplicationArea = all;
                    Style = StrongAccent;
                    StyleExpr = TRUE;
                    Visible = false;
                }
            }
            group(Personal)
            {
                Caption = 'Personal';
                field("Date Of Birth"; Rec."Date Of Birth")
                {
                    ApplicationArea = all;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = all;
                    Importance = Promoted;
                    Visible = false;
                }

                field(Religion; Rec.Religion)
                {
                    ToolTip = 'Specifies the value of the Religion field.';
                    ApplicationArea = All;
                    Editable = enabledisFields;
                }
                field(Denomination; Rec.Denomination)
                {
                    ToolTip = 'Specifies the value of the Denomination field.';
                    ApplicationArea = All;
                    Editable = enabledisFields;
                }
                field("Marital Status"; Rec."Marital Status")
                {
                    ApplicationArea = all;
                    Importance = Promoted;
                    Editable = enabledisFields;
                }

                field("Ethnic Origin"; Rec."Ethnic Origin")
                {
                    ApplicationArea = all;

                    Editable = enabledisFields;
                }
                field(Disabled; Rec.Disabled)
                {
                    ApplicationArea = all;

                    trigger OnValidate()
                    begin
                        if Rec.Disabled = Rec.Disabled::Yes then
                            enabledisFields := TRUE
                        ELSE
                            enabledisFields := false;

                        CurrPage.Update();

                    end;
                }
                field("Disability Code"; Rec."Disability Code")
                {
                    ToolTip = 'Specifies the value of the Disability Code field.';
                    ApplicationArea = All;
                    Editable = enabledisFields;
                }
                // field("Nature of Disability"; Rec."Nature of Disability")
                // {

                //     ToolTip = 'Specifies the value of the Nature of Disability field.';
                //     ApplicationArea = All;
                //     Editable = enabledisFields;
                // }
                field("Disabling Details"; Rec."Disabling Details")
                {
                    ToolTip = 'Specifies the value of the Nature of Disability field.';
                    ApplicationArea = All;
                    Caption = 'Nature of Disability';
                    Editable = enabledisFields;
                }


                // field("Health Assesment?"; Rec."Health Assesment?")
                // {
                //     ApplicationArea = all;
                // }
                // field("Health Assesment Date"; Rec."Health Assesment Date")
                // {
                //     ApplicationArea = all;
                // }

                field(DAge; DAge)
                {
                    ApplicationArea = All;
                    Editable = false;
                    Caption = 'Age';
                }
            }
            group(Communication)
            {
                Caption = 'Communication';
                field("Cell Phone Number"; Rec."Cell Phone Number")
                {
                    ApplicationArea = all;
                    Importance = Promoted;
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = all;
                    Importance = Promoted;
                }
                field("Home Phone Number"; Rec."Home Phone Number")
                {
                    ApplicationArea = all;
                    Importance = Promoted;
                }
                field("Postal Address"; Rec."Postal Address")
                {
                    ApplicationArea = all;
                    Importance = Promoted;
                    Visible = false;
                }
                field("Postal Address2"; Rec."Postal Address2")
                {
                    ApplicationArea = all;
                    Caption = 'Postal Address 2';
                    Visible = false;
                }
                field("Postal Address3"; Rec."Postal Address3")
                {
                    ApplicationArea = all;
                    Caption = 'Postal Address 3';
                    Visible = false;
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = all;
                    Visible = false;

                }
                // field("Residential Address"; Rec."Residential Address")
                // {
                //     ApplicationArea = all;

                // }
                // field("Residential Address2"; Rec."Residential Address2")
                // {
                //     ApplicationArea = all;
                // }
                // field("Residential Address3"; Rec."Residential Address3")
                // {
                //     ApplicationArea = all;
                // }
                // field("Post Code2"; Rec."Post Code2")
                // {
                //     ApplicationArea = all;
                //     Caption = 'Post Code 2';
                // }

                // field("Work Phone Number"; Rec."Work Phone Number")
                // {
                //     ApplicationArea = all;
                // }
                // field("Ext."; Rec."Ext.")
                // {
                //     Visible = false;
                //     ApplicationArea = all;
                // }

                // field("Fax Number"; Rec."Fax Number")
                // {
                //     ApplicationArea = all;
                // }
            }
        }
        area(factboxes)
        {
            part(Control1102755009; "HRM-Job Applications Factbox")
            {
                ApplicationArea = all;
                SubPageLink = "Application No" = FIELD("Application No");
            }
            systempart(Control1102755008; Outlook)
            {
                ApplicationArea = all;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Functions")
            {
                Caption = '&Functions';
                action("&Upload to Employee Card")
                {
                    ApplicationArea = all;
                    Caption = '&Upload to Employee Card';
                    Image = ImportDatabase;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = false;

                    trigger OnAction()
                    begin
                        if Rec."Employee No" = '' then begin
                            //IF NOT CONFIRM('Are you sure you want to Upload Applicants information to the Employee Card',FALSE) THEN EXIT;
                            HRJobApplications.SetFilter(HRJobApplications."Application No", Rec."Application No");
                            REPORT.Run(51177, true, false, HRJobApplications);

                            // AcademicQual.Reset();
                            // AcademicQual.SetRange(AcademicQual."Employee No.", Rec."Employee No");
                            // if AcademicQual.Find('-') then
                            // AcademicQual."Academic Qualification" := appQual."Qualification Description";


                            //MESSAGE('Requires a setup of the number series for it to work!');
                        end else begin
                            Message('This applicants information already exists in the employee card');
                        end;

                        AcademicQual.Modify()
                    end;
                }





                action(Qualifications)
                {
                    ApplicationArea = all;
                    Caption = 'Academic Qualifications';
                    Image = QualificationOverview;
                    Promoted = true;
                    PromotedCategory = Category5;
                    RunObject = Page "ACA-Applicant Qualifications";
                    RunPageLink = "Application No" = FIELD("Application No");
                }
                action(profQual)
                {
                    ApplicationArea = all;
                    Caption = 'Professional Qualifications';
                    Image = QualificationOverview;
                    Promoted = true;
                    PromotedCategory = Category5;
                    RunObject = Page "App Prof Qualifications";
                    RunPageLink = "Application No" = FIELD("Application No");
                }


                // action("Next of Keen")
                // {
                //     ApplicationArea = all;
                //     Caption = 'Next Of Kin';
                //     Image = Simulate;
                //     Promoted = true;
                //     PromotedCategory = Category6;
                //     RunObject = Page "HRM-Employees Kin";
                //     RunPageLink = "Employee Code" = FIELD("Application No");
                // }
                action(workEXP)
                {
                    ApplicationArea = All;
                    Caption = 'Work Experience';
                    Image = Timeline;
                    Promoted = true;
                    PromotedCategory = Category5;
                    RunObject = Page "HRM Work Experience";
                    RunPageLink = "Application No" = FIELD("Application No");

                }
                action(Referees)
                {
                    ApplicationArea = all;
                    Caption = 'Referees';
                    Image = ContactReference;
                    Promoted = true;
                    PromotedCategory = Category5;
                    RunObject = Page "HRM-Applicant Referees";
                    RunPageLink = "Job Application No" = FIELD("Application No");
                }
                // action(Hobbies)
                // {
                //     ApplicationArea = all;
                //     Caption = 'Hobbies';
                //     Image = Holiday;
                //     Promoted = true;
                //     PromotedCategory = Category5;
                //     RunObject = Page "HRM-Applicant Hobbies";
                //     RunPageLink = "Job Application No" = FIELD("Application No");
                // }
                action("&Print")
                {
                    ApplicationArea = all;
                    Caption = '&Print';
                    Image = PrintReport;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    begin
                        HRJobApplications.Reset;
                        HRJobApplications.SetRange(HRJobApplications."Application No", Rec."Application No");
                        if HRJobApplications.Find('-') then
                            REPORT.Run(51153, true, true, HRJobApplications);
                        //REPORT.Run(51153, true, true);

                    end;
                }
                action(Attachments1)
                {
                    ApplicationArea = All;
                    Caption = 'Applicant Attachments';
                    Image = Attachments;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    var
                        RecRef: RecordRef;
                        DocumentAttachment: Page "HRM Document Attachment";
                    begin
                        Clear(DocumentAttachment);
                        RecRef.GETTABLE(Rec);
                        DocumentAttachment.OpenForRecReference(RecRef);
                        DocumentAttachment.RUNMODAL;
                    end;
                }
                // action(EDMS)
                // {
                //     ApplicationArea = All;
                //     Caption = 'Attachments';
                //     Image = Attach;
                //     Promoted = true;
                //     PromotedCategory = Process;
                //     ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';
                //     //RunObject = Page "Document Attachment Details";
                //     //RunPageLink = "No." = field("Application No");
                //     trigger OnAction()
                //     var
                //         DocumentAttachmentDetails: Page 1173;
                //         RecRef: RecordRef;
                //     begin
                //         RecRef.GETTABLE(Rec);
                //         DocumentAttachmentDetails.OpenForRecRef(RecRef);
                //         DocumentAttachmentDetails.RUNMODAL;
                //     end;
                // }

                // action(EDMS)
                // {
                //     ApplicationArea = All;
                //     Caption = 'Applicants Attachments';
                //     Image = Attach;
                //     Promoted = true;
                //     PromotedCategory = Category7;
                //     PromotedIsBig = true;
                //     PromotedOnly = true;
                //     ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

                //     trigger OnAction()
                //     var
                //         DocumentAttachmentDetails: Page 1173;
                //         RecRef: RecordRef;
                //     begin
                //         RecRef.GETTABLE(Rec);
                //         DocumentAttachmentDetails.OpenForRecRef(RecRef);
                //         DocumentAttachmentDetails.RUNMODAL;
                //     end;
                // }
            }
        }
    }
    trigger OnOpenPage()
    begin
        DAge := '';
        //calc date
        if (Rec."Date Of Birth" <> 0D) then
            DAge := Dates.DetermineAge(Rec."Date Of Birth", Today);
    end;

    var
        HRJobApplications: Record "HRM-Job Applications (B)";
        AcademicQual: Record "HRM-Emp. Qualifications Final";
        appQual: Record "HRM-Applicant Qualifications";
        SMTP: Codeunit "Email Message";
        HREmailParameters: Record "HRM-EMail Parameters";
        Employee: Record "HRM-Employee (D)";
        Text19064672: Label 'Shortlisting Summary';
        enabledisFields: Boolean;
        kenyan: Boolean;
        Text19064673: Label 'KE';
        Dates: Codeunit "HR Dates";
        DAge: Text[100];

}

