package cl.lherrera.pipapp.security.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Service;

import cl.lherrera.pipapp.security.model.WebUserDetails;
import cl.lherrera.pipapp.security.repository.WebUserDetailsRepository;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class AuthServiceImpl implements UserDetailsService {

	@Autowired
	private WebUserDetailsRepository webUserDetailsRepository;

	@Override
	public UserDetails loadUserByUsername(String email) {
		String logHelper = "::loadUserByUsername(String email) ";
		log.info("{} - email: [{}]", logHelper, email);
		WebUserDetails webUserDetails = webUserDetailsRepository.findByEmail(email).orElse(null);
		if (webUserDetails != null) {
			log.info("{} - found a webUserDetails: {}", logHelper, webUserDetails);
			return User.builder()
					.username(webUserDetails.getEmail())
					.password(webUserDetails.getWebPassword())
					.authorities(webUserDetails.getWebUserRol().toString())
					.build();
		}
		log.info("{} - sin resultados para el correo: {}", logHelper, email);
		return null;
	}

}
