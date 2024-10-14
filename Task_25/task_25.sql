CREATE TABLE wordData(words VARCHAR(100) );
SELECT * FROM wordData;
    SELECT words, COUNT(words) AS wordCount
    FROM wordData
    WHERE LENGTH(words) >= 3 AND 
          words NOT REGEXP '[0-9]' 
    GROUP BY words
    ORDER BY 
          wordCount DESC,
          LENGTH(words) DESC,
          words ASC; 
SELECT * FROM wordData;
