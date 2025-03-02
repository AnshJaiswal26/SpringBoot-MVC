package com.example.SpringBoot_mvc.Controller;

import com.example.SpringBoot_mvc.Entities.User;
import com.example.SpringBoot_mvc.Services.UserService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import java.net.http.HttpRequest;

@Controller
public class MyController {

    @Autowired
    private UserService userService;

    @GetMapping("/")
    public String openRegPage(Model model, HttpSession session) {
        System.out.println(session);
        model.addAttribute("regUser", new User());
        return "register";
    }

    @GetMapping("/loginReq")
    public String openLoginPage(Model model) {
        model.addAttribute("logUser", new User());
        return "login";
    }

    @GetMapping("/registerReq")
    public String openRegisterPage(){
        return "register";
    }

    @PostMapping("/SubmitRegister")
    public String submitRegPage(@ModelAttribute User user, Model model){

        boolean check = userService.regVerification(user);

        if(!check){
            model.addAttribute("error", "Invalid email or phone number");
            return "register";
        }

        boolean status = userService.addUser(user);
        if(status){
            model.addAttribute("successMsg", "You have successfully registered!");
        }else{
            model.addAttribute("errorMsg", "User already exists!");
        }
        return "register";
    }

    @PostMapping("/SubmitLogin")
    public String submitLoginPage(@ModelAttribute User user, Model model){
        boolean check = userService.logVerification(user);

        if(!check){
            model.addAttribute("logError", "Invalid email");
            return "login";
        }

        boolean status = userService.checkDetails(user, model);
        if(!status) return "login";

        return "profile";
    }

    @GetMapping("/logout")
    public String logout(HttpServletRequest req){

        HttpSession session = req.getSession();
        session.invalidate();

        return "login";
    }
}
