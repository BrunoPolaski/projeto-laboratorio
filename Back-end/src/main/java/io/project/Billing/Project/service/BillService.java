package io.project.Billing.Project.service;

import io.project.Billing.Project.dto.BillDTO;
import io.project.Billing.Project.dto.BillInsertDTO;
import io.project.Billing.Project.dto.BillReturnDTO;
import io.project.Billing.Project.model.entities.Bill;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface BillService {

    BillDTO create(BillInsertDTO request);

    Page<Bill> getAllUnpaidBills(Pageable pageRequest);

    void updateBillStatus(Long id);
}
