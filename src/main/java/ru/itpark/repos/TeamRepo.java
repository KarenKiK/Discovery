package ru.itpark.repos;

import ru.itpark.domain.Intensive;
import ru.itpark.domain.Project;
import ru.itpark.domain.Team;
import ru.itpark.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface TeamRepo extends JpaRepository<Team, Long> {
    List<Team> findByProject(Project project);

    List<Team> findByIntensive(Intensive intensive);

    List<Team> findBySupervisor(User user);

    Team findByProjectAndIntensive(Project project, Intensive intensive);
}
