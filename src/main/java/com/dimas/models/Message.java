package com.dimas.models;

import javax.persistence.*;
import java.util.Date;

@Entity
public class Message {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;

    private String text;

    private String title;

    private String File;

    private String date;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User author;


    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getFile() {
        return File;
    }

    public void setFile(String file) {
        File = file;
    }


    public User getAuthor() {
        return author;
    }

    public String getAuthorName(){
        return author != null ? author.getUsername() : "<none>";
    }

    public String getAuthorAvatar(){ return author.getAvatar(); }

    public void setAuthor(User author) {
        this.author = author;
    }

    public long getId() {
        return id;
    }

    public Message() {
    }

    public Message(String title, String text, User user, String date) {
        this.title = title;
        this.text = text;
        this.author = user;
        this.date = date;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
}
