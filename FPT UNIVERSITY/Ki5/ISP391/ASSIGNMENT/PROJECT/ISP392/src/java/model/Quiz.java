/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Time;
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
public class Quiz {
    private int quizID;
    private String content;
    private int levelID;
    private Time start_time;
    private Time end_time;
    private boolean status;
    private float ratePass;
    private int courseID;
    private int userID;
    private int questionID;
    private String description;
    private int totalQuestion;
    private int attempt;
    private int lessonID;
}
