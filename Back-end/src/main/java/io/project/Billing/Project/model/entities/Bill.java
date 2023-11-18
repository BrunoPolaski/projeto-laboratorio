package io.project.Billing.Project.model.entities;

import io.project.Billing.Project.dto.BillInsertDTO;
import io.project.Billing.Project.model.PaymentMode;
import jakarta.persistence.*;
import lombok.*;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Getter @Setter @Builder
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "tb_billing")
public class Bill {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String debtor;
    private String email;

    @Enumerated(EnumType.STRING)
    private PaymentMode paymentMode;
    private BigDecimal totalValue;
    private Long numberOfInstallments;
    private Long paidInstallments;
    private boolean paidOff;
    private LocalDateTime createdAt;
    private LocalDateTime dueDate;
    private LocalDateTime totalPaidAt;

    public static Bill of(BillInsertDTO request) {
        return Bill.builder()
                .debtor(request.getDebtor())
                .email(request.getEmail())
                .paymentMode(request.getPaymentMode())
                .totalValue(request.getTotalValue())
                .numberOfInstallments(request.getNumberOfInstallments())
                .paidInstallments(0L)
                .paidOff(true)
                .createdAt(LocalDateTime.now())
                .dueDate(null)
                .build();
    }
}
