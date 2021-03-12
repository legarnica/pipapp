package cl.lherrera.pipapp.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.slf4j.Slf4j;

/**
 * Resolves the sites navigation (Router)
 * 
 * @author luisherrera
 *
 */
@Slf4j
@Controller
@RequestMapping(value = { "", "/" })
public class NavigationController {

	/**
	 * Go to the home page
	 * 
	 * @return {@literal "home/index" view}
	 */
	@GetMapping
	public String goHome() {
		String targetPath = "home/index";
		log.info("::goHome():: - targetPath: {}.", targetPath);
		return targetPath;
	}
	
	/**
	 * Go to the add page
	 * 
	 * @return {@literal "home/agregar" view}
	 */
	@GetMapping("/agregar")
	public String goAgregar() {
		String targetPath = "home/agregar";
		log.info("::goAgregar():: - targetPath: {}.", targetPath);
		return targetPath;
	}

	/**
	 * Go to the login page
	 * 
	 * @param model Implementation of {@link java.util.Map} for use when building
	 *              model data for use with UI tools. Supports chained calls and
	 *              generation of model attribute names. *
	 *              <p>
	 *              This object serves as generic model holder for Servlet MVC but
	 *              is not tied to it. Check out the {@link Model} interface for an
	 *              interface variant.
	 * 
	 * @param error Is present when occurs an error in login page
	 * @return {@literal "auth/login" view}
	 */
	@GetMapping("/login")
	public String goLogin(ModelMap model, @RequestParam(name = "error", required = false) String error) {
		String logInfoDetails = "::goLogin()::";
		String targetPath = "auth/login";
		log.info("{} - params: model: {}, error: {} , load {} view.", logInfoDetails, model, error, targetPath);
		if (error != null) {
			log.info("{} - putting message error to ModelMap, with true value", logInfoDetails);
			model.put("error", true);
		}
		return targetPath;
	}

	/**
	 * Go to the forbidden page
	 * 
	 * @return {@literal "error/403" view}
	 */
	@GetMapping("/forbidden")
	public String doForbidden() {
		return "error/403";
	}
	

	@PostMapping("/detalle")
	public String postDetalle(ModelMap modelo, @RequestParam String sku) {
		String goBackPath = "/agregar";
		String targetPath = "home/detalle";
		log.info("::postDetalle - params: sku: {}.", sku);
		modelo.addAttribute("sku", sku);
		modelo.addAttribute("goBackPath", goBackPath);
		
		return targetPath;
	}
	
	@GetMapping("/detalle")
	public String getDetalle(ModelMap modelo, @RequestParam String sku) {
		String goBackPath = "/";
		String targetPath = "home/detalle";
		log.info("::postDetalle - params: sku: {}.", sku);
		modelo.addAttribute("sku", sku);
		modelo.addAttribute("goBackPath", goBackPath);
		
		return targetPath;
	}	
	
	
	
	
	
	

}
