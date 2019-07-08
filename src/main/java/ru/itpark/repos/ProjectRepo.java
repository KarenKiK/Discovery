package ru.itpark.repos;

import ru.itpark.domain.Project;
import ru.itpark.domain.ProjectType;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ProjectRepo extends JpaRepository<Project, Long> {
    Project findByName(String name);
    List<Project> findByType(ProjectType type);
}
