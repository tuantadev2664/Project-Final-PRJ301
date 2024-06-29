/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Listener;

import jakarta.servlet.annotation.WebListener;
import jakarta.servlet.http.HttpSessionAttributeListener;
import jakarta.servlet.http.HttpSessionBindingEvent;
import jakarta.servlet.http.HttpSessionEvent;
import jakarta.servlet.http.HttpSessionListener;

/**
 *
 * @author mb
 */
public class Listener implements HttpSessionListener, HttpSessionAttributeListener {

    
    public static int onlineUser = 0;

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        onlineUser--;
        System.out.println("Online:" + onlineUser);
    }

    @Override
    public void sessionCreated(HttpSessionEvent se) {
        onlineUser++;
        System.out.println("Online:" + onlineUser);
    }

    @Override
    public void attributeAdded(HttpSessionBindingEvent se) {
        if (se.getName().equals("user")) {
            System.out.println("User attribute added");
        }
    }
}