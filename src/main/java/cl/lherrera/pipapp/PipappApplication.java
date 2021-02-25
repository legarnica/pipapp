package cl.lherrera.pipapp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Component;

import cl.lherrera.pipapp.security.model.EnumRole;
import cl.lherrera.pipapp.security.model.WebUserDetails;
import cl.lherrera.pipapp.security.services.WebUserDetailsService;

@SpringBootApplication
public class PipappApplication {

	public static void main(String[] args) {
		SpringApplication.run(PipappApplication.class, args);
	}

}

@Component
class AppStartupRunner implements ApplicationRunner {

	@Autowired
	private WebUserDetailsService webUserDetailsService;

	@Override
	public void run(ApplicationArguments args) throws Exception {

		webUserDetailsService.register(WebUserDetails.builder()
			.name("Usuario")
			.email("user@mail.cl")
			.webPassword("1234")
			.webUserRol(EnumRole.ROLE_USER)
			.build());
	}
}
