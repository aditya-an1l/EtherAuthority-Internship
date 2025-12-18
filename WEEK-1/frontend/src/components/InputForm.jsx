import { useState } from "react";

export default function InputForm() {
  const [form, setForm] = useState({
    name: "",
    email: "",
    role: "student",
    gender: "",
    agree: false,
    about: ""
  });

  function handleChange(e) {
    const { name, value, type, checked } = e.target;
    setForm({
      ...form,
      [name]: type === "checkbox" ? checked : value
    });
  }

  function handleSubmit(e) {
    e.preventDefault();
    alert(JSON.stringify(form, null, 2));
  }

  return (
    <form className="form" onSubmit={handleSubmit}>
      <label>
        Name
        <input name="name" value={form.name} onChange={handleChange} required />
      </label>

      <label>
        Email
        <input
          name="email"
          type="email"
          value={form.email}
          onChange={handleChange}
          required
        />
      </label>

      <label>
        Role
        <select name="role" value={form.role} onChange={handleChange}>
          <option value="student">Student</option>
          <option value="intern">Intern</option>
          <option value="developer">Developer</option>
        </select>
      </label>

      <fieldset>
        <legend>Gender</legend>
        <label>
          <input
            type="radio"
            name="gender"
            value="male"
            onChange={handleChange}
          />
          Male
        </label>
        <label>
          <input
            type="radio"
            name="gender"
            value="female"
            onChange={handleChange}
          />
          Female
        </label>
      </fieldset>

      <label className="checkbox">
        <input
          type="checkbox"
          name="agree"
          checked={form.agree}
          onChange={handleChange}
        />
        I agree to the terms
      </label>

      <label>
        About You
        <textarea
          name="about"
          value={form.about}
          onChange={handleChange}
        />
      </label>

      <button type="submit">Submit</button>
    </form>
  );
}
