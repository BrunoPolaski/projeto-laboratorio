package io.project.Billing.Project.service;

import java.util.List;

public interface EmailService {

    void sendMail(String message, List<String> mailList);
}
