// OP1: insertMany() — insert all 3 documents
db.products.insertMany([
  {
    name: "Gaming Laptop",
    category: "Electronics",
    price: 75000,
    brand: "Dell",
    specifications: {
      ram: "16GB",
      storage: "1TB SSD",
      processor: "Intel i7",
      warranty: "2 years",
      voltage: "220V"
    },
    ratings: [5, 4, 5, 4]
  },
  {
    name: "Women's Jacket",
    category: "Clothing",
    price: 2499,
    brand: "Zara",
    sizes: ["S", "M", "L", "XL"],
    material: "Polyester",
    colors: ["Black", "Brown"],
    care_instructions: {
      wash: "Machine wash",
      dry: "Do not tumble dry"
    }
  },
  {
    name: "Organic Apples",
    category: "Groceries",
    price: 300,
    brand: "FreshFarm",
    expiry_date: ISODate("2024-12-20"),
    nutrition: {
      calories: 52,
      fiber: "2.4g",
      vitamin_c: "14%"
    },
    pack_size: "1kg"
  }
]);

// OP2: find() — Electronics products with price > 20000
db.products.find({
  category: "Electronics",
  price: { $gt: 20000 }
});

// OP3: find() — Groceries expiring before 2025-01-01
db.products.find({
  category: "Groceries",
  expiry_date: { $lt: ISODate("2025-01-01") }
});

// OP4: updateOne() — add discount_percent field
db.products.updateOne(
  { name: "Gaming Laptop" },
  { $set: { discount_percent: 10 } }
);

// OP5: createIndex() — create index on category
db.products.createIndex({ category: 1 });

// Explanation:
// Index on 'category' improves query performance when filtering products by category,
// especially for large datasets.