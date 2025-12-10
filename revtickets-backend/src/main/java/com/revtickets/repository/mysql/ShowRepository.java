package com.revtickets.repository.mysql;

import com.revtickets.model.mysql.Show;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import java.time.LocalDateTime;
import java.util.List;

@Repository
public interface ShowRepository extends JpaRepository<Show, Long> {
    List<Show> findByEventId(Long eventId);
    List<Show> findByVenueId(Long venueId);
    List<Show> findByIsActiveTrue();
    
    @Query("SELECT s FROM Show s WHERE DATE(s.showTime) = CURRENT_DATE ORDER BY s.showTime")
    List<Show> findTodaysShows();
    
    @Query("SELECT s FROM Show s WHERE s.showTime >= :startOfDay AND s.showTime <= :endOfDay ORDER BY s.showTime")
    List<Show> findShowsForDate(@Param("startOfDay") LocalDateTime startOfDay, @Param("endOfDay") LocalDateTime endOfDay);
}
