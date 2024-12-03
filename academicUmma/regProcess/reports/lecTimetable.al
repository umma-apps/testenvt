report 86621 LecturerTimetable
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    RDLCLayout = './Reports/SSR/lecTT.rdl';

    dataset
    {
        dataitem(unitsOffered; "ACA-Units Offered")
        {
            RequestFilterFields = "Academic Year", Semester, Lecturer, "Lecture Hall", "Unit Base Code", TimeSlot, Department;
            column(AcademicYear_DataItemName; "Academic Year")
            {
            }
            column(Campus_DataItemName; Campus)
            {
            }
            column(Day_DataItemName; Day)
            {
            }
            column(Department_DataItemName; Department)
            {
            }
            column(LectureHall_DataItemName; "Lecture Hall")
            {
            }
            column(Lecturer_DataItemName; Lecturer)
            {
            }
            column(ModeofStudy_DataItemName; ModeofStudy)
            {
            }
            column(RegisteredStudents_DataItemName; "Registered Students")
            {
            }
            column(Semester_DataItemName; Semester)
            {
            }
            column(Stream_DataItemName; Stream)
            {
            }
            column(TimeSlot_DataItemName; TimeSlot)
            {
            }
            column(UnitBaseCode_DataItemName; "Unit Base Code")
            {
            }
            column(name; CompanyInformation.Name)
            {

            }
            column(Programs; Programs)
            {

            }
            column(Program_Name; "Program Name")
            {

            }

            column(pic; CompanyInformation.Picture)
            {

            }
            column(Semester; Semester)
            {

            }
            column(LecName; LecName)
            {

            }
            column(depart; depart)
            {

            }
            column(unitName; unitName)
            {

            }
            column(Lecturer; Lecturer)
            {

            }
           
            trigger OnAfterGetRecord()
            begin
                CalcFields("Registered Students");
                hrEmp.Reset();
                hrEmp.SetRange("No.", Lecturer);
                if hrEmp.Find('-') then begin
                    LecName := hrEmp."First Name" + ' ' + hrEmp."Last Name";
                end;
                dimValue.Reset();
                dimValue.SetRange("Dimension Code", 'PROGRAM-DEPARTMENT');
                dimValue.SetRange(Code, unitsOffered.Department);
                if dimValue.Find('-') then begin
                    depart := dimValue.Name;
                end;
                unitsMastr.Reset();
                unitsMastr.SetRange("Unit Code", unitsOffered."Unit Base Code");
                if unitsMastr.Find('-') then begin
                    unitName := unitsMastr."Unit Name";
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
        hrEmp: Record "HRM-Employee (D)";
        LecName: Text;
        dimValue: Record "Dimension Value";
        depart: Text;
        unitName: Text;
        unitsMastr: Record "ACA-Units Master Table";
        hrmEmployee: Record "HRM-Employee (D)";

}