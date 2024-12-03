report 86620 "StudentTimetable"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    RDLCLayout = './Reports/SSR/studTT.rdl';

    dataset
    {
        dataitem(unitOff; "ACA-Units Offered")
        {
            RequestFilterFields = Semester, Programs;

            column(name; CompanyInformation.Name)
            {

            }
            column(UnitBaseCode_unitOff; "Unit Base Code")
            {
            }
            column(AcademicYear_unitOff; "Academic Year")
            {
            }
            column(Campus_unitOff; Campus)
            {
            }
            column(Day_unitOff; Day)
            {
            }
            column(Department_unitOff; Department)
            {
            }
            column(FacultyCode_unitOff; FacultyCode)
            {
            }
            column(LectureHall_unitOff; "Lecture Hall")
            {
            }
            column(LectureAllocated_unitOff; LectureAllocated)
            {
            }
            column(Lecturer_unitOff; Lecturer)
            {
            }
            column(ModeofStudy_unitOff; ModeofStudy)
            {
            }
            column(ProgramName_unitOff; "Program Name")
            {
            }
            column(Programs_unitOff; Programs)
            {
            }
            column(RegisteredStudents_unitOff; "Registered Students")
            {
            }
            column(SittingCapacity_unitOff; "Sitting Capacity")
            {
            }
            column(Stream_unitOff; Stream)
            {
            }
            column(TimeSlot_unitOff; TimeSlot)
            {
            }
            column(pic; CompanyInformation.Picture)
            {

            }
            column(Semester; Semester)
            {

            }
            column(unitName; unitName)
            {

            }
            column(lecName; lecName)
            {

            }
            trigger OnAfterGetRecord()
            begin
                unitsMastr.Reset();
                unitsMastr.SetRange("Unit Code", "Unit Base Code");
                if unitsMastr.Find('-') then begin
                    unitName := unitsMastr."Unit Name";
                end;
                hrEmp.Reset();
                hrEmp.SetRange("No.", Lecturer);
                if hrEmp.Find('-') then begin
                    lecName := hrEmp."First Name" + ' ' + hrEmp."Last Name";
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
            area(processing)
            {
                action(ActionName)
                {
                    ApplicationArea = All;

                }
            }
        }
    }
    trigger OnInitReport()
    begin

        if CompanyInformation.Get() then begin
            CompanyInformation.CalcFields(CompanyInformation.Picture);
        end;


    end;


    var
        myInt: Integer;
        CompanyInformation: Record "Company Information";
        unitName: Text;
        unitsMastr: Record "ACA-Units Master Table";
        hrEmp: Record "HRM-Employee (D)";
        lecName: Text;
}