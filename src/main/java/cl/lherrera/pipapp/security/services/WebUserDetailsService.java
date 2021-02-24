package cl.lherrera.pipapp.security.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cl.lherrera.pipapp.security.model.WebUserDetails;
import cl.lherrera.pipapp.security.repository.WebUserDetailsRepository;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class WebUserDetailsService {
	@Autowired
	WebUserDetailsRepository repository;

	/**
	 * Returns all instances of the WebUserDetails.
	 *
	 * @return all <tt>WebUserDetails</tt> entities
	 */
	public List<WebUserDetails> getAll() {
		List<WebUserDetails> webUserDetails = repository.findAll();
		log.info("WebUserDetailsService::getAll() {} results was found", webUserDetails.size());
		return webUserDetails;
	}

	/**
	 * Saves a given webUserDetails. If the id parameter is setting, then is a
	 * success operation.
	 * 
	 * @param webUserDetails <tt>WebUserDetails</tt> instance with web user data.
	 * @return webUserDetails <tt>WebUserDetails</tt>, used for feedback
	 *         information.
	 */
	public WebUserDetails register(WebUserDetails webUserDetails) {
		String logHelperTxt = "WebUserDetailsService::register(WebUserDetails)";
		WebUserDetails webUserDetailsInDB = repository.findByEmail(webUserDetails.getEmail()).orElse(null);
		if (webUserDetailsInDB != null) {
			log.info("{} - El usuario {} ya existe en la base de datos", logHelperTxt, webUserDetailsInDB);
			return webUserDetailsInDB;
		}
		log.info("{} - El usuario {} ha sido almacenado correctamente, se retorna al controlador", logHelperTxt,
				webUserDetails);
		return repository.save(webUserDetails);
	}
}
