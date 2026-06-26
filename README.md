# 🎵 Music Store SQL Analysis

![PostgreSQL](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)

A structured SQL-based analysis of a digital music store database. This project answers real-world business questions across employee hierarchy, customer spending behavior, genre popularity, and artist performance — using progressively advanced SQL techniques including JOINs, subqueries, CTEs, and window functions.

---

## 📁 Database Schema

The analysis is built on a relational database with the following key tables:

| Table | Description |
|-------|-------------|
| `employee` | Staff records with job levels/hierarchy |
| `customer` | Customer profiles with country info |
| `invoice` | Purchase invoices with billing city/country and totals |
| `invoice_line` | Line-item details (track, quantity, unit price) |
| `track` | Song metadata including duration (milliseconds) |
| `album` | Album records linked to artists |
| `artist` | Artist names and IDs |
| `genre` | Music genre classifications |

---

## 🔍 Business Questions Answered

### 🟢 Easy
| # | Question | Technique |
|---|----------|-----------|
| 1 | Who is the senior-most employee based on job title? | `ORDER BY`, `LIMIT` |
| 2 | Which country has the most invoices? | `GROUP BY`, `COUNT` |
| 3 | What are the top 3 highest invoice totals? | `ORDER BY`, `LIMIT` |
| 4 | Which city generated the most revenue? *(for promotional festival planning)* | `SUM`, `GROUP BY` |
| 5 | Who is the best customer by total spending? | `JOIN`, `SUM`, `GROUP BY` |

### 🟡 Intermediate
| # | Question | Technique |
|---|----------|-----------|
| 6 | Return email, name of all Rock music listeners ordered alphabetically | `JOIN`, Subquery, `DISTINCT` |
| 7 | Which are the top 10 rock bands by track count? | Multi-table `JOIN`, `COUNT`, `GROUP BY` |
| 8 | Which tracks are longer than the average song length? | Subquery with `AVG` |

### 🔴 Advanced
| # | Question | Technique |
|---|----------|-----------|
| 9 | How much has each customer spent on the best-selling artist? | CTE, Multi-join, `SUM` |
| 10 | What is the most popular music genre per country? | CTE, `ROW_NUMBER()` Window Function |
| 11 | Who is the top-spending customer in each country? | CTE, `ROW_NUMBER()` Window Function |

---

## 💡 Key Insights Uncovered

- **Top revenue city** identified for targeted promotional event planning
- **Best customer** ranked by cumulative invoice spend
- **Rock music listeners** extracted for a targeted artist invite campaign
- **Top 10 rock bands** by track volume — ready for festival lineup decisions
- **Genre popularity by country** — supports regional content/marketing strategy
- **Top spender per country** — useful for loyalty program targeting

---

## 🧠 SQL Concepts Demonstrated

- `JOIN` across 5+ tables in a single query
- Subqueries (correlated and non-correlated)
- **CTEs** (`WITH` clause) for modular, readable logic
- **Window Functions** — `ROW_NUMBER() OVER (PARTITION BY ...)`
- Aggregate functions — `SUM`, `COUNT`, `AVG`
- Filtering with `WHERE`, `LIKE`, `IN`
- `DISTINCT` for deduplication
- Multi-level `GROUP BY` and `ORDER BY`

## 📁 Repository Structure

```
📦 music-store-sql-analysis
 ┣ 📄 music_analysis.sql     # All analysis queries
 ┣ 📂 dataset/               # (Optional) Database schema / seed data
 ┗ 📄 README.md              # Project documentation
```

---

## 👤 Author

**Abhishek Nayak**  
GitHub: [@Abhishek-Nayak-2004](https://github.com/Abhishek-Nayak-2004)

---

## 📄 License

This project is open source and available under the [MIT License](LICENSE). 


<img width="710" height="574" alt="schema" src="https://github.com/user-attachments/assets/88def9c9-3472-4318-aadc-9b188b3a8fe8" />
