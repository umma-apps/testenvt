report 54807 "HMS Laboratory Summary"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Clinic/Reports/SSR/HMSLaboratorySummary.rdl';

    dataset
    {
        dataitem(DataItem7278; "HMS-Laboratory Form Header")
        {
            DataItemTableView = SORTING("Laboratory No.");
            RequestFilterFields = "Laboratory No.", "Laboratory Date";
            column(COMPANYNAME; COMPANYNAME)
            {
            }

            column(Date; "Laboratory Date")
            {
            }
            column(Date_Printed______FORMAT_TODAY_0_4_; 'Date Printed: ' + FORMAT(TODAY, 0, 4))
            {
            }
            column(Name; Surname)
            {
            }
            column(No; "Laboratory No.")
            {
            }
            column(PatNo; "Patient Ref. No.")
            {
            }
            column(Seq; Seq)
            {
            }
            dataitem(DataItem7451; "HMS-Laboratory Test Line")
            {
                DataItemLink = "Laboratory No." = FIELD("Laboratory No.");
                column(Positive; Positive)
                {
                }
                column(Rmark; Remarks)
                {
                }
                column(Scode; "Specimen Code")
                {
                }
                column(Specimen; "Specimen Name")
                {
                }
                column(Testcode; "Laboratory Test Code")
                {
                }
                column(TestCount; "Test Count")
                {
                }
                column(TName; "Laboratory Test Name")
                {
                }
            }

            trigger OnAfterGetRecord()
            begin
                Seq := Seq + 1;
                Patient.RESET;
                PatientName := '';
                PFNo := '';
                IF Patient.GET("Patient No.") THEN BEGIN
                    PatientName := Patient.Surname + ' ' + Patient."Middle Name" + ' ' + Patient."Last Name";
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
                END
            end;

            trigger OnPreDataItem()
            begin
                LastFieldNo := FIELDNO("Laboratory No.");
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
        University_HEALTH_SERVICESCaptionLbl: Label 'University HEALTH SERVICES';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        LABORATORY_TESTS_LISTINGCaptionLbl: Label 'LABORATORY TESTS LISTING';
        No_CaptionLbl: Label 'No.';
        DateCaptionLbl: Label 'Date';
        PF_No_CaptionLbl: Label 'PF/No.';
        ResponsibleCaptionLbl: Label 'Responsible';
        Patient_nameCaptionLbl: Label 'Patient name';
        Test_PackageCaptionLbl: Label 'Test Package';
        TestCaptionLbl: Label 'Test';
        SpecimenCaptionLbl: Label 'Specimen';
        StatusCaptionLbl: Label 'Status';
        Seq: Integer;
}

