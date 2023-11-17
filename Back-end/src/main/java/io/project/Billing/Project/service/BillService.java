package io.project.Billing.Project.service;

import io.project.Billing.Project.dto.BillDTO;
import io.project.Billing.Project.dto.BillInsertDTO;

public interface BillService {

    BillDTO create(BillInsertDTO request);
}
