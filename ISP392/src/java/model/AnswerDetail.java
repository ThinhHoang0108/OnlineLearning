/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import lombok.AllArgsConstructor;
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
@AllArgsConstructor
public class AnswerDetail {

    private int id;
    private int questionId;
    private int answerId;
    private int userId;
    private int quizId;
    private int attempt;

    public AnswerDetail() {
    }

    public AnswerDetail(int questionId, int answerId, int userId, int quizId, int attempt) {
        this.questionId = questionId;
        this.answerId = answerId;
        this.userId = userId;
        this.quizId = quizId;
        this.attempt = attempt;
    }

}
