import React, { useEffect, useState } from "react";

export default function FetchExample() {
  const [posts, setPosts] = useState([]);
  useEffect(() => {
    fetch("https://jsonplaceholder.typicode.com/posts?_limit=5")
      .then(r => r.json())
      .then(setPosts);
  }, []);
  return (
    <div>
      <h4>API fetch</h4>
      {posts.map(p => <div key={p.id}><strong>{p.title}</strong><p>{p.body}</p></div>)}
    </div>
  );
}
