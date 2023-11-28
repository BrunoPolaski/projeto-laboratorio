package io.project.Billing.Project.service;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class ScheduledService {

    private static final String CRON_LATE_LOANS = "0 15 10 * * ?";

    @Value("${app.mail.late-bill.message}")
    private String message;

    private final BillService billService;
    private final EmailService emailService;

    @Scheduled(cron = CRON_LATE_LOANS)
    public void sendMailToLateBills() {
        emailService.sendMail(message,
                billService.getAllNextDueDate());
    }
}
