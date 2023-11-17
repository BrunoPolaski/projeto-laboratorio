package io.project.Billing.Project.model.repositories;

import io.project.Billing.Project.model.entities.Bill;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BillRepository extends JpaRepository<Bill, Long> {

    Page<Bill> findAllByPaidOffIsFalse(Pageable pageRequest);
}
