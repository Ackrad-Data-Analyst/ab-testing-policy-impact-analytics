# Data Folder – A/B Testing & Policy Impact Analytics

This folder will contain data files used in this project.

Planned files:

- `ab_test_results.csv`
  - One row = one user/session in the experiment.
  - Columns:
    - `user_id` – ID of the user.
    - `variant` – which version they saw: "A" or "B".
    - `device` – "mobile" or "desktop".
    - `region` – region label.
    - `date` – date of the visit.
    - `converted` – 1 if they completed the goal, 0 if not.
