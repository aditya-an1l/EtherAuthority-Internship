import { useState } from "react";
import {
  createTask,
  updateTaskStatus,
  getTask
} from "../services/contract";

export default function TaskManager() {
  const [title, setTitle] = useState("");
  const [desc, setDesc] = useState("");
  const [taskId, setTaskId] = useState("");
  const [task, setTask] = useState(null);

  const STATUS = ["Not Started", "In Progress", "Done"];

  return (
    <div style={{ padding: 20 }}>
      <h2>Internship Task Manager</h2>

      {/* CREATE TASK */}
      <h3>Create Task</h3>
      <input
        placeholder="Title"
        value={title}
        onChange={e => setTitle(e.target.value)}
      />
      <input
        placeholder="Description"
        value={desc}
        onChange={e => setDesc(e.target.value)}
      />
      <button onClick={() => createTask(title, desc)}>
        Create
      </button>

      <hr />

      {/* UPDATE STATUS */}
      <h3>Update Status</h3>
      <input
        placeholder="Task ID"
        value={taskId}
        onChange={e => setTaskId(e.target.value)}
      />

      {STATUS.map((s, i) => (
        <button key={i} onClick={() => updateTaskStatus(taskId, i)}>
          {s}
        </button>
      ))}

      <hr />

      {/* VIEW TASK */}
      <h3>View Task</h3>
      <button
        onClick={async () => {
          const t = await getTask(taskId);
          setTask(t);
        }}
      >
        Fetch Task
      </button>

      {task && (
        <div>
          <p><b>Title:</b> {task[0]}</p>
          <p><b>Description:</b> {task[1]}</p>
          <p><b>Status:</b> {STATUS[task[2]]}</p>
          <p><b>Updated By:</b> {task[3]}</p>
        </div>
      )}
    </div>
  );
}
