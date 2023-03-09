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
public class QuizPointHistory {

    private int id;
    private int userID;
    private float point;
    private int quizID;
    private String quizContent;
    private int duration;
    private int totalQues;
    private String taken_date;
    private int numOfQues;
    private int attempt;
    private float pointPercent;
    private int numQuesTrue;
    private String courseContent;
    private int courseID;
}
