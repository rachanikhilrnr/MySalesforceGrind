import { LightningElement, track } from 'lwc';

export default class TaskManager extends LightningElement {
    @track currentTask = '';
    @track tasks = [];
    @track errorMessage = '';

    handleInputChange(event) {
        this.currentTask = event.target.value;
        this.errorMessage = '';
    }

    addTask() {
        if (this.currentTask.trim() === '') {
            this.errorMessage = 'Task cannot be empty.';
            return;
        }
        const newTask = {
            id: this.tasks.length + 1, // Simple ID generation for example
            name: this.currentTask,
            completed: false,
        };
        this.tasks = [...this.tasks, newTask];
        this.currentTask = '';
    }

    handleCheckboxChange(event) {
        const taskId = event.target.dataset.id;
        this.tasks = this.tasks.map(task => 
            task.id === parseInt(taskId) ? { ...task, completed: !task.completed } : task
        );
    }

    deleteTask(event) {
        const taskId = event.target.dataset.id;
        this.tasks = this.tasks.filter(task => task.id !== parseInt(taskId));
    }

    get tasksWithClasses() {
        return this.tasks.map(task => ({
            ...task,
            class: task.completed ? 'completed' : ''
        }));
    }
}