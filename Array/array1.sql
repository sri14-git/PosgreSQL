select ARRAY[1,2,3,4] < ARRAY[2,5,10,8]

select ARRAY[1,2,3,4] < ARRAY[1,1,1,1]

select ARRAY[1,2,3,4] < ARRAY[1,1,4,50]

select 4 || ARRAY[1,2,3]

select ARRAY[1,2,3] || 4

select ARRAY_PREPEND(4,ARRAY[1,2,3])

select ARRAY_LENGTH(ARRAY[1,2,3],1)