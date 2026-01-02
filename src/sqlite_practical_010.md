# SQL, ORM, and NoSQL Comparison
**Student Name:** Dylan Cooper
**Date:** 2/01/26
---
## 1. SQL (Structured Query Language)
### What is it?
SQL is a standard language used to store, get, update, and manage data in relational databases. Data is organised into tables with schemas, and relationships between tables that are handled using JOIN functions.
### Advantages
- Maintains data integrity through constraints and relationships

- Supports complex queries with JOINs and subqueries

- Easy to learn and use

- Industry standard and widely supported

- High performance when queries are well optimised
### Disadvantages
- Constraints from schema makes frequent changes harder

- Can have database syntax differences

- Manual handling of relationships in application code
### When to use
- Data has a clear structure and relationships

- Complex queries and reporting are required

- Transactions must be reliable and consistent

- Data integrity is critical
### Example Query
```sql
SELECT c.name, p.name
FROM characters c
JOIN planets p ON c.homeworld_id = p.id
WHERE c.species = 'Human';
```
---
## 2. ORM (Object-Relational Mapping)
### What is it?
ORM is a technique that allows developers to map relational databases using objects instead of raw SQL. Tables map to classes, rows map to objects, and columns map to attributes.
### Advantages
- Reduces repetitive SQL and boilerplate code

- Easier to understand and expand in Python

- Database flexible and portable

- Built-in relationship handling

- IDE autocomplete
### Disadvantages
- Can generate inefficient SQL

- Harder to debug generated queries

- Less precise control over performance tuning

- More learning requirements
### When to use
- Application development where productivity matters

- Medium to large codebases

- Projects with frequent database interactions

- When maintainability is prioritised over raw performance
### Example Code (SQLAlchemy)
```python
humans = session.query(Character).filter_by(species="Human").all()
for char in humans:
    print(char.name)
```
---
## 3. NoSQL (Document Database)
### What is it?
A NoSQL document database stores data as JSON-like documents instead of rows and tables. Each document can have a flexible structure, and related data is often embedded rather than joined.
### Example Document Structure
```json
{
  "name": "Luke Skywalker",
  "species": "Human",
  "height": 172,
  "homeworld": {
    "name": "Tatooine",
    "climate": "arid"
  }
}
```
### Advantages
- Flexible schema

- Nested data reduces need for JOINs

- Scales horizontally

- Fast for read-heavy workloads
### Disadvantages
- Data duplication

- Weaker transaction support

- Complex queries are less efficient

- Harder to enforce data integrity
### When to use
- Rapidly changing or unstructured data

- Large-scale, distributed systems

- Content management or social media data

- When scalability is more important than strict consistency
---
## 4. My Recommendation
For the Star Wars database project, I would choose
**ORM** because
it provides a clear and efficient way to work with relational data using Python objects instead of raw SQL. The database has well defined relationships, such as characters and their homeworlds, which ORM handles cleanly through OOP. This approach improves code readability, maintainability, and development speed while still using a structured relational database.
---
## 5. Real-World Example
Describe a real application and which database approach would be best:
**Application:** Online banking system
**Best Choice:** SQL
**Reasoning:** An online banking system requires strong data integrity, security, and safe transactions to ensure balances and transfers are always accurate. The data is highly structured and involves complex relationships between accounts, users, and transactions, which SQL handles efficiently using constraints and JOINS. NOSQL would be a inefficient choice here because eventual consistency and weak transaction guarantees are unacceptable in financial systems.
---
## Reflection Questions
1. **What surprised you most about ORMs?**
What suprised me the most about ORM was how compatable OOP is with SQL databases. This significantly increases code usability, and increases productivity.
2. **Can you think of a situation where NoSQL would be better than SQL?**
NoSQL would be better for a real-time analytics or logging system where large volumes of semi-structured data are generated rapidly. In this case, flexible schemas and horizontal scalability are more important than strict relationships or complex JOIN queries.
3. **For a school project, which would you choose and why?**
For a school project, I would choose ORM because it balances simplicity and structure. It allows faster development and cleaner code while still using a relational database, which makes it easier to explain design decisions and demonstrate understanding of database concepts. It is also the OOp which I've been using for a long time.
