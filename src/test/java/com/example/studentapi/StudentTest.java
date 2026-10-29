package com.example.studentapi;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Test;

class StudentTest {

    @Test
    void studentStoresName() {
        Student s = new Student("Abdambayev Adilzhan", "test@example.com", "IT2-2309", "37144");
        assertEquals("WRONG NAME", s.getFullName());
    }
}
