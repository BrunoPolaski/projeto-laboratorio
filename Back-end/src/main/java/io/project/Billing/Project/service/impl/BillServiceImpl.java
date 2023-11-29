package io.project.Billing.Project.service.impl;

import io.project.Billing.Project.dto.BillDTO;
import io.project.Billing.Project.dto.BillInsertDTO;
import io.project.Billing.Project.dto.PaidBillDTO;
import io.project.Billing.Project.dto.UnpaidBillDTO;
import io.project.Billing.Project.exception.ResourceNotFoundException;
import io.project.Billing.Project.model.PaymentMode;
import io.project.Billing.Project.model.entities.Bill;
import io.project.Billing.Project.model.repositories.BillRepository;
import io.project.Billing.Project.service.BillService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

@Service
@RequiredArgsConstructor
public class BillServiceImpl implements BillService {

    private final BillRepository repository;

    @Override
    public BillDTO create(BillInsertDTO request) {
        var entity = Bill.of(request);

        if ((request.getPaymentMode() == PaymentMode.CREDIT_CARD ||
        request.getPaymentMode() == PaymentMode.BANK_SLIP) && entity.getNumberOfInstallments() != 1) {
            entity.setPaidOff(false);
            entity.setDueDate(LocalDateTime.now().plusMonths(1));
            entity.setTotalPaidAt(null);
        } else {
            entity.setNumberOfInstallments(1L);
            entity.setTotalPaidAt(LocalDateTime.now());
        }

        return BillDTO.of(repository
                .save(entity));
    }

    @Override
    public List<UnpaidBillDTO> getAllUnpaidBills() {
        return repository.findAllByPaidOffIsFalse().stream()
                .map(entity -> {
                    var unpaidValue = (entity.getTotalValue().floatValue() / entity.getNumberOfInstallments())
                            * (entity.getNumberOfInstallments() - entity.getPaidInstallments());
                    UnpaidBillDTO dto = UnpaidBillDTO.of(entity);
                    dto.setDebtValue(BigDecimal.valueOf(unpaidValue));
                    return dto;
                })
                .toList();
    }

    @Override
    public List<PaidBillDTO> getAllPaidBills() {
        return repository.findAllByPaidOffIsTrue().stream()
                .map(PaidBillDTO::of)
                .toList();
    }

    @Override
    public void updateBillStatus(Long billId) {
        var bill = repository.findById(billId)
                .orElseThrow(() -> new ResourceNotFoundException("Bill not found with id: " + billId));

        bill.setPaidInstallments(bill.getPaidInstallments() + 1L);
        bill.setDueDate(bill.getDueDate().plusMonths(1));

        if (bill.getPaidInstallments().equals(bill.getNumberOfInstallments())) {
            bill.setPaidOff(true);
            bill.setTotalPaidAt(LocalDateTime.now());
            bill.setDueDate(null);
        }

        repository.save(bill);
    }

    @Override
    public List<String> getAllNextDueDate() {
        return repository.findAllByDueDateLessThanAndPaidOffIsFalse(LocalDate.now().plusDays(3)).stream()
                .map(Bill::getEmail)
                .toList();
    }
}
