package ru.itpark.controllers;

import ru.itpark.domain.User;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {
    @GetMapping("/")
    public String main_page(@AuthenticationPrincipal User user, Model model) {
        model.addAttribute("user_now", user);

        return "home_page";
    }
}
