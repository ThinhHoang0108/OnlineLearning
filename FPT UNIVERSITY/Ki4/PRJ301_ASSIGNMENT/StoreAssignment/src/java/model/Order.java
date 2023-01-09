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
public class Order {

    private int orderId;
    private String orderDate;
    private String note;
    private int totalPrice;
    private int status;
    private int accId;
    private int shippingId;
}
