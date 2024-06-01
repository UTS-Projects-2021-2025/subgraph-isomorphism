open Base
open Stdio
open Owl

type t = int array

let random_permutation n =
  let v = Array.init n ~f:Fn.id in
  for i = n - 1 downto 1 do
    let j = Random.int (i + 1) in
    Array.swap v i j
  done;
  v

let into_permutation_matrix p =
  let n = Array.length p in
  let m = Mat.zeros n n in
  Array.iteri p ~f:(fun i j -> Mat.set m i j 1.);
  m

let random_permutation_matrix n =
  random_permutation n |> into_permutation_matrix

let print_permutation p = Array.iter p ~f:(printf "%d ")
