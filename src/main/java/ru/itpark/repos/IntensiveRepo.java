package ru.itpark.repos;

import ru.itpark.domain.Intensive;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface IntensiveRepo extends JpaRepository<Intensive, Long> {
    List<Intensive> findByName(String name);
}
