package com.dimas.controllers;

import com.dimas.models.Category;
import com.dimas.models.User;
import com.dimas.repos.CategoryRepo;
import com.dimas.repos.MessageRepo;
import com.dimas.models.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import java.util.UUID;

@Controller
public class MainController {
    @Autowired
    MessageRepo messageRepo;

    @Autowired
    CategoryRepo categoryRepo;

    @Value("${upload.path}")
    private String uploadPath;

    @GetMapping("/")
    public String hello() {
        return "hello";
    }

    @GetMapping("/main")
    public String main(@AuthenticationPrincipal User user, @RequestParam(required = false, defaultValue = "") String filter, Map<String, Object > model){
        Iterable<Message> messages = messageRepo.findAll();

        if(filter != null && !filter.isEmpty()){
            messages = messageRepo.findByTitle(filter);
        }
        else{
            messages = messageRepo.findAll();
        }

        model.put("messages", messages);
        model.put("filter", messages);
        return "main";
    }

    @PostMapping("/main")
    public String add(
            @RequestParam(required = true) String title,
            @RequestParam(required = true) String text,
            @AuthenticationPrincipal User user,
            @RequestParam("file") MultipartFile file,
            Map<String, Object> model) throws IOException {
        Date dateNow = new Date();
        SimpleDateFormat formatForDateNow = new SimpleDateFormat("dd MMMM HH:mm");
        String date = String.format(formatForDateNow.format(dateNow));
        Message message = new Message(title, text, user, date);
        if(file != null && !file.getOriginalFilename().isEmpty()){
            File fileDir = new File(uploadPath);
            if(!fileDir.exists()){
                fileDir.mkdir();
            }

            String uuidFile = UUID.randomUUID().toString();
            String resultFileName = uuidFile + "." + file.getOriginalFilename();
            file.transferTo(new File(uploadPath + "/" + resultFileName));
            message.setFile(resultFileName);
        }



        messageRepo.save(message);

        Iterable<Message> messages = messageRepo.findAll();


        model.put("messages", messages);
        return "main";
    }

    @PostMapping("/hello")
    public String addCategory(Category category, Map<String, Object> model){
        Category categoryFromDb = categoryRepo.findCategoryByCategoryName(category.getCategoryName());
        if(categoryFromDb != null)
        {
            model.put("message", "Category is exists!");
            return "hello";
        }
        categoryRepo.save(category);
        return "hello";
    }



}
