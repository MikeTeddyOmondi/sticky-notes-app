import { nanoid } from "nanoid";
import localbase from "./client";

const collections = [{ name: "notes" }];

const db = {};

collections.forEach((collection) => {

  db[collection.name] = {
    create: async (payload, id = nanoid()) => {
      return await localbase.collection("notes").add({
        id,
        ...payload,
      });
    },
    update: async (id, payload) => {
      console.log("Updating:", id);
      return await localbase
        .collection("notes")
        .doc({ id })
        .update({
          ...payload,
        });
    },
    delete: async (id) => {
      return await localbase.collection("notes").doc({ id }).delete();
    },
    get: async (id) => {
      return await localbase.collection("notes").doc(id).get();
    },
    list: async (queries) => {
      // return await collection.handler.orderBy("id").get();
      return await localbase.collection("notes").get();
    },
  };
});

export { db };
