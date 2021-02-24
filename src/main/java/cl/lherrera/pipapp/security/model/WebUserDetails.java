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


@AllArgsConstructor
@NoArgsConstructor
@ToString
@Builder
@Setter
@Getter
@Entity
public class WebUserDetails {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;

	private String name;

	@Column(unique = true)
	private String email;

	private String webPassword;

	private EnumRole webUserRol;

	/**
	 * Uses custom builder class
	 */
	public static WebUserDetailsBuilder builder() {
	    return new CustomWebUserDetailsBuilder();
	}

	/**
	 * Custom  builder class
	 */
	private static class CustomWebUserDetailsBuilder extends WebUserDetailsBuilder {
		@Override
        public WebUserDetails build() {
            // Validates required fields
			super.webPassword = EncoderUtils.passwordEncoder().encode(super.webPassword);
            return super.build();
        }
	}
}


