open String;;
let rec fibonacci x = 
        match x with
        0 -> 1
        | 1 -> 1
        | n -> fibonacci(x - 1) + fibonacci(x - 2)
;;

let result = fibonacci 14 in
let s = sub "hello, world" 3 4 in
print_string s



