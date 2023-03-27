/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;
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
public class QuestionDetail {
    private int questionID;
    private int quizzID;
    private String content;
    private Course course;
    private Lesson lesson;
    private Quiz quiz;
    private boolean status;
    private ArrayList<Answer> listAnswer;

    public QuestionDetail(int questionID, int quizzID, String content, Course course, Lesson lesson, Quiz quiz, boolean status, ArrayList<Answer> listAnswer) {
        this.questionID = questionID;
        this.quizzID = quizzID;
        this.content = content;
        this.course = course;
        this.lesson = lesson;
        this.quiz = quiz;
        this.status = status;
        this.listAnswer = listAnswer;
    }

    
    
}
