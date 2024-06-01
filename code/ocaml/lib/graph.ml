open Base
open Stdio
open Owl

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
