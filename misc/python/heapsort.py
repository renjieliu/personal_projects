def swap(arr, a, b):
  t = arr[a]
  arr[a] = arr[b]
  arr[b] = t

def heapify(arr, curr_pos):
  c1 = 2*curr_pos+1
  c2 = 2*curr_pos+2
  max = curr_pos
  if c1 <= len(arr)-1 and arr[c1] > arr[curr_pos]:
    max = c1
  if c2 <= len(arr)-1 and arr[c2] > arr[max]:
    max = c2
  if max!=curr_pos:
    swap(arr, curr_pos, max)
    heapify(arr, max)

def build_heap(arr):
  s = (len(arr)-1)//2
  for i in range(s, -1, -1):
    heapify(arr,i)

def heap_sort(arr):
  output = [] 
  build_heap(arr)
  while arr: 
     swap(arr, len(arr)-1, 0)
     output.append(arr[-1])
     arr = arr[:-1]
     heapify(arr, 0)
  return output[::-1]

print(heap_sort([4,6,1,7,2,0,10]))  









