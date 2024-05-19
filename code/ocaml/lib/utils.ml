open Owl

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

(* Function to generate a permutation matrix *)
let random_permutation_matrix n =
  let p = random_permutation n in
  let m = Mat.zeros n n in
  Array.iteri (fun i j -> Mat.set m i j 1.) p;
  m

(* The action permuation on adj matrix *)
let permute_adj_matrix adj p =
  Mat.(p *@ adj *@ (transpose p))

(* Compute the common edges of a graph *)
let common_edges adj1 adj2 =
  Mat.(adj2 - adj1)

(* Compute the number of common edges *)
let common_edges_count adj1 adj2 =
  common_edges adj1 adj2 |> Mat.sum'
