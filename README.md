# Music Store Data Analysis (SQL Project)

## Project Overview
This project analyzes a **Music Store database** using SQL to generate insights related to customers, sales performance, and music preferences. The dataset contains information about artists, albums, tracks, invoices, and customers, which are used to answer important business questions.

The analysis is performed using SQL techniques such as joins, aggregations, subqueries, Common Table Expressions (CTEs), and window functions. The goal of this project is to demonstrate practical data analysis skills and show how SQL can be used to extract meaningful insights from relational databases.

## Description
The SQL queries in this project analyze the Music Store database to answer key business questions related to customers, sales, and music trends. The analysis uses SQL techniques such as joins, aggregations, subqueries, CTEs, and window functions to extract meaningful insights from the data.

## Problem Statement
Music store businesses generate large volumes of transactional and customer data through daily sales activities. However, without proper analysis, it becomes difficult for businesses to understand customer purchasing behavior, identify high-value customers, or determine which artists and genres contribute most to revenue. This lack of insight can limit the effectiveness of marketing strategies and business decisions.
This project aims to analyze the Music Store database using SQL to uncover meaningful insights from the available data. By exploring information related to customers, invoices, artists, albums, and tracks, the analysis identifies key patterns such as top customers, popular music genres, best-performing artists, and revenue trends across different locations. The insights derived from this analysis can help support better business strategies and data-driven decision making.

## Data Tables
The System consists of 11 interconnected tables:
- Genre – Stores information about different music genres.
- MediaType – Contains the types of media formats used for tracks (e.g., MPEG audio, protected AAC).
- Employee – Stores details about employees working in the music store.
- Customer – Contains customer information and their assigned support representatives.
- Artist – Stores information about music artists.
- Album – Contains album details and links them to artists.
- Track – Stores information about individual music tracks including duration, genre, and price.
- Invoice – Records customer purchase transactions and billing details.
- InvoiceLine – Contains detailed information about each track purchased in an invoice.
- Playlist – Stores playlist information created within the music store system.
- PlaylistTrack – A bridge table that links tracks to playlists.

## Key Features
- Relational Database Design
- Primary and Foreign Key Relationships
- Comprehensive Data Management
- SQL-Based Data Analysis

## Entity Relationship Diagram
The ER diagram illustrates the relationships between the eleven core tables used in the Music Store database.

## SQL Analysis
- Employee and Customer Insights
- Sales and Revenue Analysis
- Music Preference Analysis
- Customer Spending Behavior
- Regional Trends

## Key Insights
- Analysis highlights customers who contribute the highest revenue to the music store.
- Certain cities and countries generate a higher number of invoices and overall sales.
- Popular Music Genres like Specific genres, such as Rock, show higher customer engagement and purchase frequency.
- Some artists have a significantly higher number of tracks and sales compared to others.
- Spending behavior varies across customers and regions, helping identify valuable market segments.

## Technologies Used
- SQL – Used for writing queries and performing data analysis.
- MySQL – Database management system used to store and manage the Music Store data.
- MySQL Workbench – Used for database design, ER diagram creation, and query execution.
- Git & GitHub – Used for version control and project documentation.

## Project Goal
The goal of this project is to analyze the Music Store database using SQL to uncover meaningful insights related to customer behavior, sales performance, and music preferences. The analysis aims to help identify top customers, popular genres, leading artists, and revenue patterns to support data-driven business decisions.

## Conclusion
This project demonstrates how SQL can be used to analyze a relational database and extract meaningful business insights from transactional data. By examining customer purchases, sales trends, and music preferences, the analysis identifies key patterns such as top customers, popular genres, and high-performing artists.

The insights generated from this analysis can help businesses better understand their customers, optimize marketing strategies, and make data-driven decisions to improve overall performance.
