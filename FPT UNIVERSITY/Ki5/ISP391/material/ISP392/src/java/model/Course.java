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
public class Course {

    private int course_id;
    private String course_title;
    private int topic_id;
    private boolean is_public;
    private int duration;
    private String description;
    private double rate;
    private String img;
    private String createdby;

    
}
