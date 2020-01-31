package com.dimas.controllers;

import com.dimas.models.Language;
import com.dimas.models.User;
import com.dimas.repos.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.Map;
import java.util.Set;
import java.util.UUID;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/profile")
public class ProfileController {


    @Autowired
    UserRepo userRepo;

    @Value("${upload.path}")
    private String uploadPath;

    @GetMapping("{user}")
    public String profile(@PathVariable User user, Model model){
        model.addAttribute("curUser", user);
        model.addAttribute("id", user.getId());
        model.addAttribute("username", user.getUsername());
        model.addAttribute("description", user.getDescription());
        model.addAttribute("instagram", user.getInstagram());
        model.addAttribute("twitter", user.getTwitter());
        model.addAttribute("facebook", user.getFacebook());
        model.addAttribute("roles", user.getRoles());
        model.addAttribute("avatar", user.getAvatar());
        return "userProfile";
    }

    @GetMapping("{user}/edit")
    public String profileEdit(@PathVariable User user, Model model){
        model.addAttribute("user", user);
        model.addAttribute("id", user.getId());
        model.addAttribute("username", user.getUsername());
        model.addAttribute("description", user.getDescription());
        model.addAttribute("instagram", user.getInstagram());
        model.addAttribute("twitter", user.getTwitter());
        model.addAttribute("facebook", user.getFacebook());
        model.addAttribute("roles", user.getRoles());
        model.addAttribute("avatar", user.getAvatar());
        model.addAttribute("languages", Language.values());
        return "userProfileEdit";
    }

    @PostMapping("/profile")
    public String saveProfile(@AuthenticationPrincipal User user,
                            @RequestParam String username,
                            @RequestParam Map<String, String> form,
                            @RequestParam(required = false) String instagram,
                            @RequestParam(required = false) String twitter,
                            @RequestParam(required = false) String facebook,
                            @RequestParam(required = false) String description,
                            @RequestParam("file") MultipartFile avatar) throws IOException {

        user.setUsername(username);
        if(!instagram.isEmpty()){
            user.setInstagram(instagram);
        }
        if(!twitter.isEmpty()){
            user.setTwitter(twitter);
        }
        if(!facebook.isEmpty()){
            user.setFacebook(facebook);
        }
        if(!description.isEmpty()){
            user.setDescription(description);
        }

        if (avatar != null && !avatar.getOriginalFilename().isEmpty()) {
            File fileDir = new File(uploadPath);
            if (!fileDir.exists()) {
                fileDir.mkdir();
            }

            String uuid = UUID.randomUUID().toString();
            String resultFileName = "avatar" + uuid + avatar.getOriginalFilename();
            avatar.transferTo(new File(uploadPath + "/" + resultFileName));
            user.setAvatar(resultFileName);

        }

        Set<String> languages = Arrays.stream(Language.values())
                .map(Language::name)
                .collect(Collectors.toSet());

        user.getLanguage().clear();

        for (String key : form.keySet()) {
            if (languages.contains(key)) {
                user.getLanguage().add(Language.valueOf(key));
            }
        }
        userRepo.save(user);
        return "redirect:/profile/" + user.getId();
    }
}
