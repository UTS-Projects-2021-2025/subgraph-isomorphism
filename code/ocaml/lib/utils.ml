open Base
open Owl

let row_to_dot_vertex i j =
  let u, v = i+1, j+1 in
  Printf.sprintf "  \"%d\" -- \"%d\";\n" u v

let adjacency_to_dot_undirected matrix =
  let rows, cols = Mat.shape matrix in
  let buffer = Buffer.create 1024 in
  Buffer.add_string buffer "graph G {\n";
  for i = 0 to rows - 1 do
    for j = i to cols - 1 do
      if Mat.get matrix i j <> 0. then
        row_to_dot_vertex i j
        |> Buffer.add_string buffer
    done
  done;
  Buffer.add_string buffer "}\n";
  Buffer.contents buffer

(* Function to generate a random permutation vector *)
let random_permutation n =
  let v = Array.init n Fun.id in
  for i = n - 1 downto 1 do
    let j = Random.int (i + 1) in
    let tmp = v.(i) in
    v.(i) <- v.(j);
    v.(j) <- tmp;
  done;
  v

let permutation_to_permutation_matrix p =
  let n = Array.length p in
  let m = Mat.zeros n n in
  Array.iteri (fun i j -> Mat.set m i j 1.) p;
  m

(* Function to generate a permutation matrix *)
let random_permutation_matrix n =
  random_permutation n
  |> permutation_to_permutation_matrix

(* Function to generate a random adjacency matrix *)

(* The action permuation on adj matrix *)
let permute_adj_matrix adj p =
  Mat.(p *@ adj *@ (transpose p))

(* Compute the common edges of a graph *)
let common_edges adj1 adj2 =
  Mat.(adj2 - adj1)

(* Compute the number of common edges *)
let common_edges_count adj1 adj2 =
  common_edges adj1 adj2 |> Mat.sum'
