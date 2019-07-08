package ru.itpark.repos;

import ru.itpark.domain.RegID;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.UUID;

public interface RegIDRepo extends JpaRepository<RegID, UUID> {

}
