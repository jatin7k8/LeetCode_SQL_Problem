# Write your MySQL query statement below

SELECT 
distinct l1.account_id
FROM loginfo as l1 , loginfo as l2

where l1.account_id = l2.account_id and 
    l1.ip_address <> l2.ip_address and
    l1.logout between l2.login and l2.logout
