package com.example.SpringBoot_mvc.Services;

import com.example.SpringBoot_mvc.Entities.User;
import jakarta.servlet.http.HttpSession;
import org.springframework.ui.Model;

public interface Services {

    boolean checkDetails(User user, Model model);

    boolean addUser(User user);

    boolean regVerification(User user);

    boolean logVerification(User user);
}
