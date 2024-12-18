package com.nt.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.SequenceGenerator;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name="emp")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Employee {
    @Id
    @SequenceGenerator(name="gen1", sequenceName="empno_seq", initialValue=1, allocationSize=1)
    @GeneratedValue(generator="gen1", strategy=GenerationType.SEQUENCE)
    private Integer empno;
    @Column(length=20)
    private String empName;
    private Float salary;
    @Column(length=20)
    private String job;
    private Integer deptno;
    @Column(length=20)
    private String city;
	
 
}