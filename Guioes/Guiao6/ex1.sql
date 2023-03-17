--a)
SELECT * FROM authors

--b)
SELECT au_fname, au_lname, phone FROM authors

--c)

SELECT au_fname, au_lname, phone 
FROM authors
ORDER BY au_fname, au_lname

--d)
SELECT au_fname as first_name, au_lname as last_name, phone as telephone
FROM authors
ORDER BY first_name, last_name

--e)

SELECT au_fname as first_name, au_lname as last_name, phone as telephone
FROM authors
WHERE state='CA' and au_lname<>'Ringer'
ORDER BY first_name, last_name

--f)

SELECT *
FROM publishers
WHERE pub_name LIKE '%Bo%'

--g)

SELECT *
FROM publishers p
INNER JOIN titles t ON p.pub_id=t.pub_id
WHERE t.type='Business'

--h)

SELECT p.pub_name, count(*) as sales
FROM titles t INNER JOIN publishers p ON t.pub_id = p.pub_id
				  INNER JOIN sales s ON t.title_id = s.title_id
GROUP BY p.pub_name

--i)

SELECT p.pub_name, count(*) as sales, t.title
FROM titles t INNER JOIN publishers p ON t.pub_id = p.pub_id
			  INNER JOIN sales s ON t.title_id = s.title_id
GROUP BY t.title, p.pub_name

--j)

SELECT t.title
FROM titles t INNER JOIN sales s ON t.title_id = s.title_id
			  INNER JOIN stores st ON s.stor_id = st.stor_id
WHERE st.stor_name = 'Bookbeat'

--k)

SELECT a.au_fname, a.au_lname
FROM authors a, titleauthor ta, titles t
WHERE a.au_id=ta.au_id and ta.title_id=t.title_id
GROUP BY a.au_fname, a.au_lname
HAVING count(DISTINCT t.type) > 1

--l)

SELECT t.type, p.pub_id, avg(t.price) as avg_price, count(*) as num_sales
FROM titles t, publishers p
WHERE t.pub_id = p.pub_id
GROUP BY t.type, p.pub_id

--m)

SELECT t.type 
FROM titles t
GROUP BY t.type
HAVING max(t.advance) > 1.5 * avg(t.advance)

--n)

SELECT a.au_fname, sum(t.royalty * s.qty) as valor_arrecadado
FROM authors a, titles t, sales s, titleauthor ta
WHERE a.au_id = ta.au_id and ta.title_id = t.title_id and t.title_id = s.title_id
GROUP BY a.au_fname
