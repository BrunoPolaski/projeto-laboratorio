package io.project.Billing.Project.resource;

import io.project.Billing.Project.dto.BillInsertDTO;
import io.project.Billing.Project.service.BillService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import java.net.URI;

@RestController
@RequestMapping("/api/v1")
@RequiredArgsConstructor
public class ResourceController {

    private final BillService service;

    @PostMapping
    public ResponseEntity addBill(@RequestBody BillInsertDTO request) {
        var response = service.create(request);
        URI uri = ServletUriComponentsBuilder.fromCurrentRequest()
                .path("/{id}").buildAndExpand(response.getId()).toUri();

        return ResponseEntity.created(uri).body(response);
    }

}
