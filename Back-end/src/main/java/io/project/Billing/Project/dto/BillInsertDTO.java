package io.project.Billing.Project.dto;

import io.project.Billing.Project.model.PaymentMode;
import jakarta.validation.constraints.NotEmpty;
import lombok.*;

import java.math.BigDecimal;

@Getter @Setter @Builder
@AllArgsConstructor
@NoArgsConstructor
public class BillInsertDTO {

    @NotEmpty
    private String debtor;

    @NotEmpty
    private String email;

    @NotEmpty
    private PaymentMode paymentMode;

    @NotEmpty
    private BigDecimal totalValue;

    @NotEmpty
    private Long numberOfInstallments;


}
