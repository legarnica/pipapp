/**
 * utility class to help with data encryption and decryption.
 * 
 * @author luisherrera
 */
package cl.lherrera.pipapp.utils;

import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class EncoderUtils {

	private EncoderUtils() {}

	/**
	 * create a BCryptPasswordEncoder object, that allow use they methods.
	 * 
	 * @return BCryptPasswordEncoder, object with methods to encrypt and decrypt.
	 */
	@Bean
	public static BCryptPasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}

}
