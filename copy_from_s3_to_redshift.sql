COPY users 
FROM 's3://tickit-sample-data/allusers_pipe.txt' 
DELIMITER '|'
IGNOREHEADER 1 
REGION 'us-east-1'
IAM_ROLE default;                    
                    
COPY event
FROM 's3://tickit-sample-data/allevents_pipe.txt' 
DELIMITER '|' 
TIMEFORMAT 'YYYY-MM-DD HH:MI:SS'
IGNOREHEADER 1 
REGION 'us-east-1'
IAM_ROLE default;

COPY sales
FROM 's3://tickit-sample-data/sales_tab.txt' 
DELIMITER '\t' 
TIMEFORMAT 'MM/DD/YYYY HH:MI:SS'
IGNOREHEADER 1 
REGION 'us-east-1'
IAM_ROLE default;

COPY date
FROM 's3://tickit-sample-data/date2008_pipe.txt' 
DELIMITER '|'
TIMEFORMAT 'YYYY-MM-DD HH:MI:SS'
IGNOREHEADER 1 
REGION 'us-east-1'
IAM_ROLE default;

COPY category
FROM 's3://tickit-sample-data/category_pipe.txt' 
DELIMITER '|' 
IGNOREHEADER 1 
REGION 'us-east-1'
IAM_ROLE default;

COPY listing
FROM 's3://tickit-sample-data/listings_pipe.txt' 
DELIMITER '|' 
TIMEFORMAT 'YYYY-MM-DD HH:MI:SS'
IGNOREHEADER 1 
REGION 'us-east-1'
IAM_ROLE default;

COPY venue
FROM 's3://tickit-sample-data/venue_pipe.txt' 
DELIMITER '|' 
IGNOREHEADER 1 
REGION 'us-east-1'
IAM_ROLE default;