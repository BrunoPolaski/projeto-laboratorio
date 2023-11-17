package io.project.Billing.Project.resource;

import io.project.Billing.Project.dto.BillInsertDTO;
import io.project.Billing.Project.dto.BillReturnDTO;
import io.project.Billing.Project.service.BillService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import java.net.URI;

@RestController
@RequestMapping("/api/v1")
@RequiredArgsConstructor
public class BillController {

    private final BillService service;

    @PostMapping
    public ResponseEntity addBill(@RequestBody BillInsertDTO request) {
        var response = service.create(request);
        URI uri = ServletUriComponentsBuilder.fromCurrentRequest()
                .path("/{id}").buildAndExpand(response.getId()).toUri();

        return ResponseEntity.created(uri).body(response);
    }

    @GetMapping
    public ResponseEntity getAllUnpaidBills(Pageable pageRequest) {
        var response =  service.getAllUnpaidBills(pageRequest).stream()
                .map(BillReturnDTO::of)
                .toList();
        PageImpl<BillReturnDTO> pagedResponse = new PageImpl<>(response, pageRequest, response.size());

        return ResponseEntity.status(HttpStatus.OK).body(pagedResponse);
    }

    @PutMapping("/{id}")
    public void updateBillStatus(@PathVariable Long id) {
        service.updateBillStatus(id);
    }

}
