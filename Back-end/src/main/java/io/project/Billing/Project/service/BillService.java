package io.project.Billing.Project.service;

import io.project.Billing.Project.dto.BillDTO;
import io.project.Billing.Project.dto.BillInsertDTO;
import io.project.Billing.Project.dto.PaidBillDTO;
import io.project.Billing.Project.dto.UnpaidBillDTO;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface BillService {

    BillDTO create(BillInsertDTO request);

    List<UnpaidBillDTO> getAllUnpaidBills(Pageable pageRequest);

    List<PaidBillDTO> getAllPaidBills(Pageable pageRequest);

    void updateBillStatus(Long id);
}
