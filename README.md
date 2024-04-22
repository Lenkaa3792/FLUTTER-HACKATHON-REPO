TODO List Flutter Application
This Flutter application is designed to manage tasks efficiently using three major folders that play key roles in building the user interface:

Folder Structure
1. model
The model folder is responsible for defining the structure of the to-do items:

To-Do Item Model:
name: The name of the task that will be displayed.
id: A unique identifier used for functionality like deleting a specific item.
isCompleted: A boolean value indicating whether the task is accomplished.
2. screens
The screens folder handles the UI views of the application, containing all the widgets used throughout:

Task List Screen:
Displays the list of tasks with checkboxes and delete icons for each task.
Add Task Screen:
Allows users to add new tasks with input fields for task name.
3. widgets
The widgets folder contains reusable components that control the elements inside the task container:

Task Widget:
Manages the layout and behavior of individual tasks displayed in the list.
Includes a checkbox to mark task completion and an icon for deleting the task.
Features
Task Management:
Add, edit, and delete tasks.
Mark tasks as completed or pending.
Folder Descriptions
model
This folder defines the data structure for the to-do items used in the application.

screens
Screens are responsible for rendering the user interface of different parts of the app, such as the task list and add task screens.

widgets
Widgets are reusable components that encapsulate UI elements and behavior, making it easier to build and maintain the app's interface.

