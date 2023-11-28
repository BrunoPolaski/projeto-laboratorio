package io.project.Billing.Project.service;

import io.project.Billing.Project.dto.BillDTO;
import io.project.Billing.Project.dto.BillInsertDTO;
import io.project.Billing.Project.dto.PaidBillDTO;
import io.project.Billing.Project.dto.UnpaidBillDTO;

import java.util.List;

public interface BillService {

    BillDTO create(BillInsertDTO request);

    List<UnpaidBillDTO> getAllUnpaidBills();

    List<PaidBillDTO> getAllPaidBills();

    void updateBillStatus(Long id);

    List<String> getAllNextDueDate();
}
