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
public class Slider {
     private int sliderId;
     private String slider_url;
     private boolean status;
     private String title;
     private String content;
     private String backlink;
     private String notes;
     private boolean isShow;
     private int courseId;
     private Course course;
}
