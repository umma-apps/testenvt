page 86531 "Historical Transcript Data"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Final Exam Result2";
    DeleteAllowed = false;
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(rep001)
            {
                field(ExamEntry; Rec.ExamEntry)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the ExamEntry field.';
                }
                field(ProgrammeID; Rec.ProgrammeID)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the ProgrammeID field.';
                }
                field(StudentID; Rec.StudentID)
                {
                    ApplicationArea = All;
                }
                field(AcademicYr; Rec.AcademicYr)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the AcademicYr field.';
                }
                field(Session; Rec.Session)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Session field.';
                }
                field(UnitCode; Rec.UnitCode)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the UnitCode field.';
                }
                field(UnitDesc; Rec.UnitDesc)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the UnitDesc field.';
                }
                field(MeanScore; Rec.MeanScore)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the MeanScore field.';
                }
                field(MeanGrade; Rec.MeanGrade)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the MeanGrade field.';
                }
                field(CreditUnit; Rec.CreditUnit)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the CreditUnit field.';
                }
                field(Weight; Rec.Weight)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Weight field.';
                }
                field(Creditunits; Rec.Creditunits)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Creditunits field.';
                }


            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(import)
            {
                RunObject = xmlport "ImportHist Marks";
                ApplicationArea = All;
            }
            action(UpdateExamData)
            {
                Image = UpdateXML;
                ApplicationArea = All;
                trigger OnAction()
                begin
                    exmCod.transferExamData('SEPT-DEC24');
                end;
            }
        }
    }
    trigger OnOpenPage()
    var
        usersetup: Record "User Setup";
        Nopermission: Label 'You have insufficient Rights to access the Transcripts';
    begin
        AllowAccessSettings := true;
        if usersetup.get(UserId) then
            if (usersetup."Allow Open Transcript") then begin
                AllowAccessSettings := usersetup."Allow Open Transcript";
                exit
            end;
        Error(Nopermission);
    end;

    var
        AllowAccessSettings: boolean;
        exmCod: Codeunit "Exams Processing";


}