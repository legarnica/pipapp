package cl.lherrera.pipapp.security.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import cl.lherrera.pipapp.utils.EncoderUtils;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


/**
 * Clase modelo entidad, que contiene los atributos de WebUserDetails, podemos
 * ver que posee un campo del builder lombook personalizado, esto se debe a que
 * cuando hacemos un {@literal instancia.webPassword("str")}, necesitamos que
 * encripte la contraseña para una mejor seguridad
 * 
 * El WebUserDetails, es la representación del usuario de sistema, esta clase es
 * quien almacena el inicio de sesión con los roles necesarios según
 * corresponda. El formulario de inicio de sesión guarda los atributos en este
 * objetos y se los entrega al sistema de seguridad de Spring Security.
 * 
 * @author luisherrera
 *
 */
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Builder
@Setter
@Getter
@Entity
public class WebUserDetails {

	/**
	 * Id auto incremental.
	 */
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;

	/**
	 * Campo nombre del webUserDetails, utilizado para referirse al usuario, dentro
	 * del sistema.
	 */
	private String name;

	/**
	 * Campo correo electrónico email. Posee una restricción JPA, de campo único.
	 */
	@Column(unique = true)
	private String email;

	/**
	 * Campo para la contraseña.
	 */
	private String webPassword;

	/**
	 * Campo para el rol con que el usuario inicia la sesión, hay que verificar el
	 * caso en que un usuario posee más de un rol, aunque este sería una lista (Set)
	 * con relación de mucho a muchos. Además, habría que adaptar el
	 * loadUserByUsername, que está en la clase AuthServiceImpl, identificando cada
	 * rol. En este caso, cada usuario posee un solo rol.
	 */
	private EnumRole webUserRol;

	/**
	 * Creamos un método personalizado builder para Lombook, ya que debemos
	 * personalizar el valor del campo webPassword, encriptándolo antes de
	 * insertarlo.
	 * 
	 */
	public static WebUserDetailsBuilder builder() {
	    return new CustomWebUserDetailsBuilder();
	}

	/**
	 * Es la clase (INTERNA) que retornamos desde builder, es una clase interna que nos ayuda
	 * a realizar acciones anteriores a la ejecución del {@literal build()}} de
	 * lombook.
	 */
	private static class CustomWebUserDetailsBuilder extends WebUserDetailsBuilder {
		/**
		 * Una vez que ejecutamos el {@Literal .webPassword("str")}, el campo se guarda
		 * y antes de ejecutar el {@literal build()}}, encriptamos el valor del
		 * atributo. Podemos personalizar más, pero con este ejemplo se entiende la idea
		 * de este "middleware".
		 */
		@Override
        public WebUserDetails build() {
            // Personalización.
			super.webPassword = EncoderUtils.passwordEncoder().encode(super.webPassword);
            // Continuación del flujo normal.
            return super.build();
        }
	}
}


