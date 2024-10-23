package carmaj.demo.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class AdminController {

    @GetMapping("/home")
    public String home() {
        return "Welcome to the Demo Applicsdvvsation!";
    }
}

