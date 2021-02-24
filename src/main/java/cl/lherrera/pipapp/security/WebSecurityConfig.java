package cl.lherrera.pipapp.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.security.servlet.PathRequest;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import cl.lherrera.pipapp.security.services.AuthServiceImpl;
import cl.lherrera.pipapp.utils.EncoderUtils;




@EnableWebSecurity
@Configuration
public class WebSecurityConfig extends WebSecurityConfigurerAdapter{

    private UserDetailsService userDetailsService;
    private CustomAuthenticationHandler customAuthenticationHandler;
    
    @Autowired
    public WebSecurityConfig(
        AuthServiceImpl servicioDetallesDeUsuario, CustomAuthenticationHandler customAuthenticationHandler) {
    
       this.userDetailsService = servicioDetallesDeUsuario;
       this.customAuthenticationHandler = customAuthenticationHandler;
    }
    
	/**
	 * Evita el error: java.lang.IllegalArgumentException: There is no
	 * PasswordEncoder mapped for the id "null", además de ser utilizado a veces
	 * para setear usuarios en memoria
	 * 
	 */
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(userDetailsService).passwordEncoder(EncoderUtils.passwordEncoder());
	}

    /**
     * Acá irá la configuración principal
     * Las reglas serán impuestas en este
     * método.
     */
    @Override
    public void configure(HttpSecurity http) throws Exception {
    	// evita el problema con error cross-origin en opera con h2-console
    	// no recomendable en producción
    	http.headers().frameOptions().sameOrigin();
        // csrf - desactivamos por seguridad
        http.csrf().disable()
        // configurar los request autorizados
        .authorizeRequests()
        //acceso a direcctorios
        .antMatchers("/admin/**").hasRole("ADMIN") // no es ROLE_ADMIN ni ROLE_USER (sin el ROLE_)
        .antMatchers("/h2/**").permitAll()
        .antMatchers("/login").permitAll()
        // permite el uso de los recursos estáticos
        .requestMatchers(PathRequest.toStaticResources().atCommonLocations()).permitAll()
        // para todo el resto de peticiones, permite, si está logeado
        .anyRequest().authenticated()
        // indicar el login personalizado
        .and().formLogin().loginPage("/login")
        // ocupamos nuestra clase personalizada
        // ManejadorDeAutentificacionPersonalizado
        .successHandler(customAuthenticationHandler)
        // indicar en caso de fallo, donde ir y con qué
        .failureUrl("/login?error=true")
        // indicar campos name en los imput (OJO OJO OJO)
        // de usuario y contraseña
        .usernameParameter("email").passwordParameter("webPassword")
        // indicamos la url de éxito
//        .defaultSuccessUrl("/")
        // manejamos el recurso no permitido
        .and().exceptionHandling().accessDeniedPage("/recurso-prohibido");

    }
    
}
