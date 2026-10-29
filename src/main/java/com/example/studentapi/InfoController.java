package com.example.studentapi;

import java.util.Map;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class InfoController {

    @Value("${student.owner.name}")
    private String ownerName;
    @Value("${student.owner.id}")
    private String ownerId;
    @Value("${student.owner.group}")
    private String ownerGroup;
    @Value("${app.version}")
    private String version;

    @GetMapping("/")
    public Map<String, String> info() {
        return Map.of(
                "application", "Student API",
                "owner", ownerName,
                "studentId", ownerId,
                "group", ownerGroup,
                "version", version);
    }
}
