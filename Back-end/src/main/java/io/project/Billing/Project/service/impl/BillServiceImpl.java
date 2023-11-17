package io.project.Billing.Project.service.impl;

import io.project.Billing.Project.dto.BillDTO;
import io.project.Billing.Project.dto.BillInsertDTO;
import io.project.Billing.Project.model.entities.Bill;
import io.project.Billing.Project.model.repositories.BillRepository;
import io.project.Billing.Project.service.BillService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class BillServiceImpl implements BillService {

    private final BillRepository repository;

    @Override
    public BillDTO create(BillInsertDTO request) {
        return BillDTO.of(repository
                .save(Bill.of(request)));
    }
}
