import { Router } from "express";
import books from "../books.js";

const router = Router();

// api health check
router.route("/ping").get((req, res) => {
  res.status(200).json({ message: "pong" });
});

// get all books
router.route("/books").get((req, res) => {
  try {
    res.status(200).json({ length: books.length, books: books });
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
});

// get a book by id
router.route("/books/:id").get((req, res) => {
  const { id } = req.params;
  const book = books.find((book) => book.id === id);
  try {
    res.status(200).json({ book: book });
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
});

export default router;
