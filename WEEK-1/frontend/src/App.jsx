import reactLogo from "./assets/react.svg";
import viteLogo from "/vite.svg";
import "./App.css";

// Components
import Counter from "./components/Counter";
import InputForm from "./components/InputForm";
import TodoList from "./components/TodoList";
import FetchExample from "./components/FetchExample";
import Card from "./components/Card";
import TaskManager from "./components/TaskManager";

function App() {
  return (
    <>
      {/* Header */}
      <div>
        <a href="https://vite.dev" target="_blank">
          <img src={viteLogo} className="logo" />
        </a>
        <a href="https://react.dev" target="_blank">
          <img src={reactLogo} className="logo react" />
        </a>
      </div>

      <h1>Internship Week 1 Demo</h1>

      {/* Wrap components using reusable Card */}
      <Card title="Counter App">
        <Counter />
      </Card>

      <Card title="Input Form App">
        <InputForm />
      </Card>

      <Card title="Todo List App">
        <TodoList />
      </Card>

      <Card title="API Fetch Example">
        <FetchExample />
      </Card>

      <Card title="Blockchain Task Manager">
        <TaskManager />
      </Card>
    </>
  );
}

export default App;
