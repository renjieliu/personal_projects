def swap(arr, A, B):
	t = arr[A]
	arr[A] = arr[B]
	arr[B] = t

def heapify(arr, pos):
	c1 = 2*pos + 1 
	c2 = 2*pos + 2
	max = pos
	if c1 < len(arr) and  arr[c1] > arr[max]:
		max = c1
	if c2 < len(arr) and arr[c2] > arr[max]:
		max = c2
		
	if max != pos :
		swap(arr, max, pos)
		heapify(arr, max) 

def build_heap(arr):
	s = ((len(arr)-1) -1 )//2
	while s > -1:
		heapify(arr, s) 
		s-=1

def heap_sort(arr):
	output = []
	build_heap(arr)
	while arr:
		swap(arr, len(arr)-1, 0)
		output.append(arr[-1])
		arr = arr[:-1]
		heapify(arr, 0)
	return output

print(heap_sort([4,5,10,9,8,7,7,8,9,1,1,1,1])[::-1])













