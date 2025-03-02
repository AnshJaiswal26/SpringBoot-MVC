package com.example.SpringBoot_mvc.Services;

import com.example.SpringBoot_mvc.DAO.UserRepository;
import com.example.SpringBoot_mvc.Entities.User;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class UserService implements Services{

    @Autowired
    UserRepository userRepository;

    @Override // Login
    public boolean checkDetails(User user, Model model) {
        boolean check = false;
        try {
            User status = userRepository.findByEmail(user.getEmail());

            if(status!=null) {
                String email = status.getEmail();
                String pass = status.getPassword();

                if(pass.equals(user.getPassword())) check = true;
                if(!check) model.addAttribute("logErrorMsg", "Invalid email or password!");
                else model.addAttribute("user_name", status.getName());

            }else model.addAttribute("logErrorMsg", "User not registered!");

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return check;
    }

    @Override // Register
    public boolean addUser(User user) {
        try {
            User status = userRepository.findByEmail(user.getEmail());

            if(status!=null) {
                String email = status.getEmail();
                if(email.equals(user.getEmail())) return false;
            }
            userRepository.save(user);
            return true;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override // regVerification
    public boolean regVerification(User user){
        if(!user.getEmail().contains("@gmail.com")) return false;

        String phoneno = user.getPhone();

        for(int i=0; i<phoneno.length(); i++){
            if(Character.isLetter(phoneno.charAt(i))) return false;
        }

        if(phoneno.length()!=10) return false;

        for(char ch = 'A'; ch <= 'Z'; ch++) {
            if(user.getEmail().contains(ch+"")) return false;
        }
        return true;
    }

    @Override
    public boolean logVerification(User user) {
        if(!user.getEmail().contains("@gmail.com")) return false;

        for(char ch = 'A'; ch <= 'Z'; ch++) {
            if(user.getEmail().contains(ch+"")) return false;
        }

        return true;
    }
}
