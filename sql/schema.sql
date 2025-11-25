-- schema.sql
-- This file describes the structure (schema) of the A/B test table.

CREATE TABLE ab_test_results (
    -- user_id: a number that identifies each user (1, 2, 3, ...)
    user_id      INTEGER,

    -- variant: which version they saw: 'A' (old) or 'B' (new)
    variant      CHAR(1),

    -- device: what device they used (e.g., 'mobile' or 'desktop')
    device       VARCHAR(20),

    -- region: simple region labels (e.g., 'North', 'South', 'East', 'West')
    region       VARCHAR(20),

    -- date: the date of the visit
    date         DATE,

    -- converted: did the user complete the goal?
    -- 1 = yes, 0 = no.
    converted    INTEGER
);
