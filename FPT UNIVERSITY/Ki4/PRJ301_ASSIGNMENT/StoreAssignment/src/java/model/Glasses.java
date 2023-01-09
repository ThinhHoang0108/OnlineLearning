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
public class Glasses {

    private int id;
    private String name;
    private int price;
    private String imgPath;
    private String description;
    private int status;
    private int categoryId;
    private int quantity;
    

  
}
