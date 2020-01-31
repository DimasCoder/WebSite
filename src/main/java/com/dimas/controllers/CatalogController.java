package com.dimas.controllers;

import com.dimas.models.Category;
import com.dimas.models.Product;
import com.dimas.models.User;
import com.dimas.repos.CategoryRepo;
import com.dimas.repos.ProductRepo;
import com.dimas.repos.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.Map;
import java.util.UUID;

@Controller
public class CatalogController {

    @Autowired
    ProductRepo productRepo;

    @Autowired
    CategoryRepo categoryRepo;

    @Value("${upload.path}")
    private String uploadPath;


    @GetMapping("/catalog")
    public String catalog(Map<String, Object> model) {
        Iterable<Product> products = productRepo.findAll();

        model.put("products", products);
        return "catalog";
    }

    /*@GetMapping
    public String categoryList(Model model){

    }
 */
    @PostMapping("/catalog")
    public String addProduct(@RequestParam(required = true) String title,
                             @RequestParam(required = true) String description,
                             @RequestParam(required = true) double price,
                             Category category,
                             @RequestParam("file") MultipartFile file,
                             @RequestParam("fileTwo") MultipartFile fileTwo,
                             Model model) throws IOException {
        Product product = new Product(title, description, price);

        if (file != null && fileTwo != null && !file.getOriginalFilename().isEmpty() && !fileTwo.getOriginalFilename().isEmpty()) {
            File fileDir = new File(uploadPath);
            if (!fileDir.exists()) {
                fileDir.mkdir();
            }

            String uuid = UUID.randomUUID().toString();
            String uuid1 = UUID.randomUUID().toString();
            String resultFileOneName = "product" + uuid + file.getOriginalFilename();
            String resultFileTwoName = "product" + uuid1 + fileTwo.getOriginalFilename();
            file.transferTo(new File(uploadPath + "/" + resultFileOneName));
            fileTwo.transferTo(new File(uploadPath + "/" + resultFileTwoName));
            product.setImage(resultFileOneName);
            product.setImageTwo(resultFileTwoName);

        }
        productRepo.save(product);
        Iterable<Product> products = productRepo.findAll();

        model.addAttribute("products", products);
        return "catalog";
    }


}
