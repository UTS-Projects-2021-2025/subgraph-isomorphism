open Base
open Stdio
open Owl

(*  open PermGroup *)

type t = Mat.mat

let from_matrix m = m
let has_edge g i j = Mat.get g i j |> Float.equal 1.0
let print_matrix g = Mat.print g

let to_dot g =
  let rows, cols = Mat.shape g in
  let buffer = Buffer.create 1024 in
  Buffer.add_string buffer "graph G {\n";
  for i = 0 to rows - 1 do
    for j = i to cols - 1 do
      if Mat.get g i j <> 0. then
        row_to_dot_vertex i j |> Buffer.add_string buffer
    done
  done;
  Buffer.add_string buffer "}\n";
  Buffer.contents buffer

let print_dot g = to_dot g |> Printf.printf "%s\n"

let graph_congruence g p =
    Mat.(p *@ g *@ transpose p)

let subgraph_congruence g s p =
    Mat.(s *@ p *@ g *@ transpose p *@ transpose s)

let rnd_array n k =
    let a = Array.init n ~f:Fn.id in
    Array.permute a;
    Array.sub a ~pos:0 ~len:k |> Array.sorted_copy ~compare:Int.compare


let random_subgraph_matrix n k =
    let arr = rnd_array n k in
    let mat = Mat.zeros k n in
    Array.iteri arr ~f:(fun i j -> Mat.set mat i j 1.);
    mat


let random_subgraph_congruence g k =
    let open PermGroup in
    let n = Mat.row_num g in
    let p = random_permutation_matrix k in
    let s = random_subgraph_matrix n k in
    Mat.(p *@ s *@ g *@ transpose s *@ transpose p)
