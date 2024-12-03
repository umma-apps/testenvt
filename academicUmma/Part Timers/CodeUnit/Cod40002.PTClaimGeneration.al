codeunit 40002 "PTClaim Generation"
{
    var
        lecUnits: Record "ACA-Lecturers Units";
        hrEmp: Record "HRM-Employee (D)";
        progs: Record "ACA-Programme";
        progLevel: Option;
        school, prog, schName : Text;
        "Hourly Rate", "Hours Done", Amount, finalAmount, unitsCount, Rate : Decimal;
        PtClaimLines: Record PTClaimLines;
        dimVal: Record "Dimension Value";

    procedure generateClaim(semz: code[20]; batchNo: Code[20])
    begin
        PtClaimLines.Reset();
        PtClaimLines.SetRange("Batch No", batchNo);
        PtClaimLines.SetRange(Semester, semz);
        if PtClaimLines.Find('-') then begin
            PtClaimLines.DeleteAll();
        end;
        hrEmp.Reset();
        hrEmp.SetRange(Lecturer, true);
        if hrEmp.Find('-') then begin
            repeat
                Clear(unitsCount);
                lecunits.Reset();
                lecunits.SetRange(Semester, semz);
                lecUnits.SetRange(Lecturer, hrEmp."No.");
                if lecUnits.Find('-') then begin
                    unitsCount := lecUnits.Count();
                    repeat
                        progs.Reset();
                        progs.SetRange(Code, lecUnits.Programme);
                        if progs.Find('-') then begin
                            progLevel := progs.Levels;
                            school := hrEmp."Faculty Code";
                            prog := progs.Code;
                        end;
                        dimVal.Reset();
                        dimVal.SetRange(Code, school);
                        IF dimVal.Find('-') then begin
                            schName := dimVal.Name;
                        end;
                        lecUnits.CalcFields("Registered Students");
                        if (progLevel = progs.Levels::Masters) then begin
                            if lecunits."Registered Students" < 10 then begin
                                "Hourly Rate" := 1500;
                                "Hours Done" := 36;
                                Amount := 1500 * 36;
                            end else begin
                                "Hourly Rate" := 1500;
                                "Hours Done" := 36;
                                Amount := 1500 * 36;
                            end

                        end else if (progLevel = progs.Levels::Bachelor) then begin
                            if lecunits."Registered Students" < 25 then begin
                                "Hourly Rate" := 1000;
                                "Hours Done" := 36;
                                Amount := (1500 * 36);
                            end else begin
                                "Hourly Rate" := 1000;
                                "Hours Done" := 36;
                                Amount := (1500 * 36);
                            end
                        end else if (progLevel = progs.Levels::Diploma) then begin
                            if lecunits."Registered Students" < 10 then begin
                                "Hourly Rate" := 1000;
                                "Hours Done" := 24;
                                Amount := 1000 * 24;
                            end else begin
                                "Hourly Rate" := 1000;
                                "Hours Done" := 24;
                                Amount := 1000 * 24;
                            end;
                        end else if (progLevel = progs.Levels::Certificate) then begin
                            if lecunits."Registered Students" < 10 then begin
                                "Hourly Rate" := 1000;
                                "Hours Done" := 24;
                                Amount := 1000 * 24;
                            end else begin
                                "Hourly Rate" := 1000;
                                "Hours Done" := 24;
                                Amount := 1000 * 24;
                            end;
                        end;
                        finalAmount := finalAmount + Amount;
                        Rate := "Hourly Rate";
                        Clear("Hours Done");
                        Clear("Hourly Rate");
                        Clear(Amount);
                    until lecUnits.Next() = 0;

                end;
                //Insert
                if unitsCount >= 0 then begin
                    PtClaimLines.Init();
                    PtClaimLines."Batch No" := batchNo;
                    PtClaimLines.Semester := semz;
                    PtClaimLines."PF No" := hrEmp."No.";
                    PtClaimLines.Names := hrEmp."First Name" + ' ' + hrEmp."Middle Name" + ' ' + hrEmp."Last Name";
                    PtClaimLines.Units := unitsCount;
                    PtClaimLines.Amount := finalAmount;
                    PtClaimLines.Faculty := school;
                    PtClaimLines.SchoolName := schName;
                    PtClaimLines.Programz := prog;
                    PtClaimLines.Rate := Rate;
                    PtClaimLines.Insert();
                    Clear(finalAmount);
                end;

            until hrEmp.Next() = 0;
        end;

    end;
}
