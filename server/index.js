import { json } from "express";
import Express from "express";
import cors from "cors";

// configs
const app = new Express();
const PORT = 3000;
app.use(json());
app.use(
  cors({
    origin: "*",
    methods: ["GET", "POST", "PUT", "DELETE"],
  })
);

// listen to the server
app.listen(process.env.PORT || PORT, () => {
  console.log(`Server running on port ${process.env.PORT || PORT}`);
});
