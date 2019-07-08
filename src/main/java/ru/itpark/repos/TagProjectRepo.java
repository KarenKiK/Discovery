package ru.itpark.repos;

import ru.itpark.domain.TagProject;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TagProjectRepo extends JpaRepository<TagProject, Long> {
    TagProject findByText(String text);
}
