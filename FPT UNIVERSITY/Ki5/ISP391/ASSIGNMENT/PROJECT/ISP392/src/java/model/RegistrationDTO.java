/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 *
 * @author ADMIN
 */
@Builder
@Getter
@Setter
@ToString
public class RegistrationDTO {
    private int regisId;
    private String regisDate;
    private boolean status;
    private Course course;
    private int subjectId;
    private PricePackage pricePackage;
    private int pricePackageId;
    private User user;
    private int accountId;
}
