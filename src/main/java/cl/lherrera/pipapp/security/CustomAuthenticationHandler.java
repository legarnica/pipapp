package cl.lherrera.pipapp.security;

import java.io.IOException;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

/**
 * @author luisherrera
 * 
 *         Relates the role, with the first window loaded after login.
 *
 */
@Configuration
public class CustomAuthenticationHandler implements AuthenticationSuccessHandler {

	/**
	 * String representation of role administrator
	 */
	public static final String ROLE_ADMIN = "ROLE_ADMIN";

	/**
	 * String representation of administrator first ui-page path
	 */
	public static final String ADMINISTRATOR_HOME_PATH = "/admin";

	/**
	 * String representation of normal user first ui-page path
	 */
	public static final String USER_HOME_PATH = "/home";

	/**
	 * Called when a user has been successfully authenticated.
	 * 
	 * @param request        the request which caused the successful authentication
	 * @param response       the response
	 * @param authentication the <tt>Authentication</tt> object which was created
	 *                       during the authentication process.
	 */
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException {
		Set<String> authenticatedUserRoles = AuthorityUtils.authorityListToSet(authentication.getAuthorities());
		String uri = authenticatedUserRoles.contains(ROLE_ADMIN) ? ADMINISTRATOR_HOME_PATH : USER_HOME_PATH;
		response.sendRedirect(uri);
	}

}
