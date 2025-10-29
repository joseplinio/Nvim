import random

my_list = []
array_result = []

while True: 
    x  = random.randint(0, 9)
    
    if not x in my_list:
        my_list.append(x)

    if len(my_list) == 6:
        array_result = my_list.copy()
        my_list.clear()
    
    if len(array_result) == 18:
        break

print(my_list)
print(array_result, 'Result')

