package cl.lherrera.pipapp.security.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import cl.lherrera.pipapp.security.model.WebUserDetails;

@Repository
public interface WebUserDetailsRepository extends JpaRepository<WebUserDetails, Integer> {

	Optional<WebUserDetails> findByEmail(String email);

}
