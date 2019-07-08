package ru.itpark.repos;

import ru.itpark.domain.TagUser;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TagUserRepo extends JpaRepository<TagUser, Long> {
    TagUser findByText(String text);
}
