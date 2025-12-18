import React, { useState } from "react";

export default function Counter() {
  const [count, setCount] = useState(0);
  return (
    <div>
      <h3>Counter App</h3>
      <p>Count: {count}</p>
      <button onClick={() => setCount(c => c + 1)}>Increment</button>
      <button onClick={() => setCount(c => Math.max(0, c - 1))}>Decrement</button>
      <button onClick={() => setCount(0)}>Reset</button>
    </div>
  );
}
