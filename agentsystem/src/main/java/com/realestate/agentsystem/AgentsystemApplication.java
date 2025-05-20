package com.realestate.agentsystem;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.boot.CommandLineRunner;
import com.realestate.agentsystem.service.AgentService;
import com.realestate.agentsystem.model.Agent;
import java.util.UUID;

@SpringBootApplication
public class AgentsystemApplication {
	public static void main(String[] args) {
		SpringApplication.run(AgentsystemApplication.class, args);
	}

	@Bean
	public CommandLineRunner dataLoader(AgentService agentService) {
		return args -> {
			// Add some initial data for testing if needed
			if (agentService.getAllAgents().isEmpty()) {
				// First agent
				Agent agent1 = new Agent();
				agent1.setId(UUID.randomUUID().toString());
				agent1.setName("John Doe");
				agent1.setEmail("john.doe@example.com");
				agent1.setPhoneNumber("123-456-7890");
				agent1.setSpecialization("Residential");
				agent1.setExperience("10 years");
				agent1.setLocation("Downtown");
				agent1.setAverageRating(4.5);
				agentService.saveAgent(agent1);

				// Second agent
				Agent agent2 = new Agent();
				agent2.setId(UUID.randomUUID().toString());
				agent2.setName("Jane Smith");
				agent2.setEmail("jane.smith@example.com");
				agent2.setPhoneNumber("987-654-3210");
				agent2.setSpecialization("Commercial");
				agent2.setExperience("15 years");
				agent2.setLocation("Uptown");
				agent2.setAverageRating(4.8);
				agentService.saveAgent(agent2);
			}
		};
	}
}