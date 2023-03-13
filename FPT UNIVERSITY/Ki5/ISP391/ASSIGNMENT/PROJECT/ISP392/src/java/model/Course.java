/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author vuxua
 */
import java.sql.Date;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Builder
@Getter
@Setter
@ToString
public class Course {

    private int id;
    private String thumnailURL;
    private String content;
    private String description;
    private Date createDate;
    private int IDcategory;

    public Course(int id, String thumnailURL, String content, String description, Date createDate, int IDcategory) {
        this.id = id;
        this.thumnailURL = thumnailURL;
        this.content = content;
        this.description = description;
        this.createDate = createDate;
        this.IDcategory = IDcategory;
    }
    
}
