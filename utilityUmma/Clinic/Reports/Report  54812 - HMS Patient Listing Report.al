report 54812 "HMS Patient Listing Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Clinic/Reports/SSR/HMSPatientListingReport.rdl';

    dataset
    {
        dataitem(DataItem5769; "HMS-Patient")
        {
            DataItemTableView = SORTING("Patient No.");
            RequestFilterFields = "Patient No.";
            column(FORMAT_TODAY_0_4_; FORMAT(TODAY, 0, 4))
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }

            column(USERID; USERID)
            {
            }
            column(PFNo; PFNo)
            {
            }
            column(HMS_Patient__Patient_Type_; "Patient Type")
            {
            }
            column(HMS_Patient_Gender; Gender)
            {
            }
            column(HMS_Patient__Date_Of_Birth_; "Date Of Birth")
            {
            }
            column(PatientName; PatientName)
            {
            }
            column(HMS_Patient__ID_Number_; "ID Number")
            {
            }
            column(HMS_Patient__COUNT; COUNT)
            {
            }
            column(HEALTH_SERVICESCaption; HEALTH_SERVICESCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(PATIENT_LISTING_REPORTCaption; PATIENT_LISTING_REPORTCaptionLbl)
            {
            }
            column(Date_Printed_Caption; Date_Printed_CaptionLbl)
            {
            }
            column(Printed_By_Caption; Printed_By_CaptionLbl)
            {
            }
            column(No_Caption; No_CaptionLbl)
            {
            }
            column(TypeCaption; TypeCaptionLbl)
            {
            }
            column(HMS_Patient_GenderCaption; FIELDCAPTION(Gender))
            {
            }
            column(HMS_Patient__Date_Of_Birth_Caption; FIELDCAPTION("Date Of Birth"))
            {
            }
            column(HMS_Patient__ID_Number_Caption; FIELDCAPTION("ID Number"))
            {
            }
            column(Patient_nameCaption; Patient_nameCaptionLbl)
            {
            }
            column(Total_Number_Of_Patients_Listed_Caption; Total_Number_Of_Patients_Listed_CaptionLbl)
            {
            }
            column(HMS_Patient_Patient_No_; "Patient No.")
            {
            }

            trigger OnAfterGetRecord()
            begin
                Patient.RESET;
                PatientName := '';
                IF Patient.GET("Patient No.") THEN BEGIN
                    PatientName := UPPERCASE(Patient.Surname + ' ' + Patient."Middle Name" + ' ' + Patient."Last Name");
                    IF Patient."Patient Type" = Patient."Patient Type"::Others THEN BEGIN
                        PFNo := Patient."Student No.";
                    END
                    ELSE
                        IF Patient."Patient Type" = Patient."Patient Type"::" " THEN BEGIN
                            PFNo := Patient."Patient No.";
                        END
                        ELSE BEGIN
                            PFNo := Patient."Employee No.";
                        END;
                END;
            end;

            trigger OnPreDataItem()
            begin
                LastFieldNo := FIELDNO("Patient No.");
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        Patient: Record "HMS-Patient";
        PatientName: Text[200];
        PFNo: Code[20];
        HEALTH_SERVICESCaptionLbl: Label 'HEALTH SERVICES';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        PATIENT_LISTING_REPORTCaptionLbl: Label 'PATIENT LISTING REPORT';
        Date_Printed_CaptionLbl: Label 'Date Printed:';
        Printed_By_CaptionLbl: Label 'Printed By:';
        No_CaptionLbl: Label 'No.';
        TypeCaptionLbl: Label 'Type';
        Patient_nameCaptionLbl: Label 'Patient name';
        Total_Number_Of_Patients_Listed_CaptionLbl: Label 'Total Number Of Patients Listed:';
}

