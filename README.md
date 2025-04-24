# TaskTracker iOS App

A clean and intuitive iOS To-Do List app built in Swift with UIKit and `UITableViewController`. Tasks can be added, swiped left to **mark as DONE**, and later viewed in a separate **History** screen. This app focuses on simplicity and fast task management.

---

## Features

- Add new tasks with a title and description.
- Swipe **left** to mark a task as **done** (blue action).
- DONE tasks are sent to a dedicated **History** screen.
- History is accessed via the top-left bar button.
- Swipe **right** to **delete** tasks (red action).
- Clear, responsive user interface using Storyboard.

---

## Screens & Navigation

- **Main Screen (`TodoTableViewController`)**
  - Tap the **"+"** button to add new tasks.
  - Swipe **left** to mark a task as **DONE** (green).
  - Swipe **right** to **DELETE** a task (red).
  - Tap **"History"** (top-left) to view DONE tasks.

- **History Screen (`HistoryViewController`)**
  - Displays tasks marked DONE.
  - Tasks here are read-only and shown in a table view.
  - Populated from a shared in-memory list.

---
