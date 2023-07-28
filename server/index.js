import { json } from "express";
import Express from "express";
import cors from "cors";
import Routes from "./routes";

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

// add route directory
app.set("/api", Routes);

// listen to the server
app.listen(process.env.PORT || PORT, () => {
  console.log(`Server running on port ${process.env.PORT || PORT}`);
});
