package com.revtickets;

import com.revtickets.model.mysql.User;
import com.revtickets.repository.mysql.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.security.crypto.password.PasswordEncoder;

@SpringBootApplication
public class RevTicketsApplication implements CommandLineRunner {
    
    @Autowired
    private UserRepository userRepository;
    
    @Autowired
    private PasswordEncoder passwordEncoder;
    
    public static void main(String[] args) {
        SpringApplication.run(RevTicketsApplication.class, args);
    }
    
    @Override
    public void run(String... args) throws Exception {
        // Create admin user if not exists
        if (!userRepository.existsByEmail("admin@revtickets.com")) {
            User admin = new User();
            admin.setName("Admin");
            admin.setEmail("admin@revtickets.com");
            admin.setPassword(passwordEncoder.encode("Admin@"));
            admin.setPhone("1234567890");
            admin.setRole(User.Role.ADMIN);
            admin.setIsBlocked(false);
            userRepository.save(admin);
            System.out.println("Admin user created: admin@revtickets.com / Admin@");
        }
    }
}
