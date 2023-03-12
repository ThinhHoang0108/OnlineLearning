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
public class Registeration {
    private int regisId;
    private String regisDate;
    private boolean status;
    //private Subject subject;
    private int subjectId;
    private String subName;
    private PricePackage pricePackage;
    private int pricePackageId;
    //private Account account;
    private int accountId;
    private int year;
    private String priceName;
    private int price;
    private String email;
}
