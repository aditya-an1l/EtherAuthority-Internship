// src/components/Card.jsx
export default function Card({ title, children }) {
  return (
    <div style={{ border: "1px solid #ddd", padding: 12, borderRadius: 8 }}>
      <h5>{title}</h5>
      <div>{children}</div>
    </div>
  );
}
