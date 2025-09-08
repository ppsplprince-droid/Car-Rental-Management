package com.example.carrental.controller;

import com.example.carrental.repository.CarRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class PageController {

    private final CarRepository carRepository;

    public PageController(CarRepository carRepository) {
        this.carRepository = carRepository;
    }

    @GetMapping({"/", "/dashboard"})
    public String dashboard(Model model) {
        model.addAttribute("welcome", "Welcome to Car Rental Dashboard");
        return "dashboard";
    }

    @GetMapping("/cars")
    public String cars(Model model) {
        model.addAttribute("cars", carRepository.findAll());
        return "cars";
    }
    @GetMapping("/book/{id}")
    public String bookCar(@PathVariable Long id, Model model) {
        var car = carRepository.findById(id).orElse(null);
        model.addAttribute("car", car);
        return "booking";
    }
    @PostMapping("/book/{id}")
    public String confirmBooking(@PathVariable Long id,
                                 @RequestParam String name,
                                 @RequestParam int days,
                                 Model model) {
        var car = carRepository.findById(id).orElse(null);
        if (car != null) {
            double totalPrice = car.getPrice().doubleValue() * days;

            model.addAttribute("car", car);
            model.addAttribute("name", name);
            model.addAttribute("days", days);
            model.addAttribute("totalPrice", totalPrice);
        }
        return "confirmation";
    }
    
    
}
